// Copyright lowRISC contributors (OpenTitan project).
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Core Implementation module for Serial Peripheral Interface (SPI) Host IP.
//
`include "prim_assert.sv"

module spi_host_fsm
  import spi_host_cmd_pkg::*;
#(
  parameter  int NumCS = 1,
  localparam int CSW   = prim_util_pkg::vbits(NumCS)
) (
  input                              clk_i,
  input                              rst_ni,
  input  command_t                   command_i,
  input  logic [CSW-1:0]             command_csid_i,
  input                              command_valid_i,
  output logic                       command_ready_o,
  output logic                       sck_o,
  output logic [NumCS-1:0]           csb_o,
  output logic [3:0]                 sd_en_o,
  output logic                       last_read_o,
  output logic                       last_write_o,
  output logic                       wr_en_o,
  input                              sr_wr_ready_i,
  output logic                       rd_en_o,
  input                              sr_rd_ready_i,
  output logic                       sample_en_o,
  output logic                       shift_en_o,
  output logic [1:0]                 speed_o,
  output logic                       full_cyc_o,
  output logic                       rx_stall_o,
  output logic                       tx_stall_o,
  output logic                       active_o,

  input                              sw_rst_i,

  // Datapath status inputs
  input                              fsm_en_i,
  input                              last_bit_i,
  input                              last_byte_i,
  input                              wait_cntr_zero_i,
  input                              byte_cntr_early_zero_i,

  // Externalized command/config datapath registers
  input  logic [CSW-1:0]             csid_q_i,
  input  logic                       cpol_q_i,
  input  logic                       cpha_q_i,
  input  logic                       full_cyc_q_i,
  input  logic                       csaat_q_i,
  input  logic                       cmd_rd_en_q_i,
  input  logic                       cmd_wr_en_q_i,
  input  logic [1:0]                 cmd_speed_q_i,

  // Externalized output-stage datapath registers
  input  logic                       sample_en_q_i,
  input  logic                       sample_en_q2_i,
  input  logic [NumCS-1:0]           csb_q_i,
  input  logic                       cmd_wr_en_last_bit_i,
  input  logic                       is_first_cycle_i,

  // Externalized combinational datapath signals
  input  logic                       config_changed_i,
  input  logic                       byte_starting_i,
  input  logic                       stall_i,
  input  logic                       segment_rd_en_cpha1_i
);

  logic             is_idle;

  logic [CSW-1:0]   csid;

  logic             full_cyc, cpha, cpol;

  logic             cmd_wr_en_d;

  logic             state_changing;
  logic             bit_shifting, bit_shifting_cpha0, bit_shifting_cpha1;
  logic             byte_ending, byte_ending_cpha0, byte_ending_cpha1;

  logic             sample_en_internal;

  // new_command: signals a new segment input
  logic             new_command;

  logic             csb_single_d;
  logic             sck_d;

  logic wr_en_internal, rd_en_internal, shift_en_internal;
  logic segment_rd_en;

  // suppress output pulses if stalled.
  assign wr_en_o     = wr_en_internal & ~stall_i;
  assign rd_en_o     = rd_en_internal & ~stall_i;
  assign sample_en_o = sample_en_internal & ~stall_i;
  assign shift_en_o  = shift_en_internal & ~stall_i;

  typedef enum logic [2:0] {
    Idle,
    WaitLead,
    InternalClkLow,
    InternalClkHigh,
    WaitTrail,
    WaitIdle,
    CSBSwitch,
    IdleCSBActive
  } spi_host_st_e;

  spi_host_st_e state_q, state_d;

  logic command_ready_int;
  assign command_ready_o = command_ready_int & ~stall_i;


  assign new_command    = command_valid_i && command_ready_int;

  always_comb begin
    csid        = new_command ? command_csid_i : csid_q_i;
    cpol        = new_command ? command_i.configopts.cpol : cpol_q_i;
    cpha        = new_command ? command_i.configopts.cpha : cpha_q_i;
    full_cyc    = new_command ? command_i.configopts.full_cyc : full_cyc_q_i;
    cmd_wr_en_d = new_command ? command_i.segment.cmd_wr_en : cmd_wr_en_q_i;
  end

  assign is_idle     = (state_q == Idle) || (state_q == IdleCSBActive);

  assign active_o   = ~is_idle;

  assign tx_stall_o = wr_en_internal & ~sr_wr_ready_i;
  assign rx_stall_o = rd_en_internal & ~sr_rd_ready_i;

  spi_host_st_e next_state_after_idle;
  always_comb begin
    if (command_valid_i) begin
      if (config_changed_i) begin
         next_state_after_idle = CSBSwitch;
      end else begin
         next_state_after_idle = WaitLead;
      end
    end else begin
      next_state_after_idle = Idle;
    end
  end

  spi_host_st_e next_state_after_idle_csb_active;
  logic         command_ready_idle_csb_active;
  always_comb begin
    if (command_valid_i) begin
      if (command_csid_i != csid_q_i) begin
        //
        // Do not acknowledge the command now, as it will trigger
        // an update of the internal command and configuration registers.
        // *Silently* transition to WaitTrail.  The command
        // will be acknowledged later, at the end of the WaitIdle state.
        //
        next_state_after_idle_csb_active = WaitTrail;
        // Explicitly *suppress* command_ready
        command_ready_idle_csb_active = 1'b0;
      end else begin
        if (cpha_q_i) begin
          next_state_after_idle_csb_active = InternalClkHigh;
        end else begin
          next_state_after_idle_csb_active = InternalClkLow;
        end
        command_ready_idle_csb_active = 1'b1;
      end
    end else begin
      next_state_after_idle_csb_active = IdleCSBActive;
      command_ready_idle_csb_active = 1'b1;
    end
  end

  //
  // FSM main body: Controls state transitions and command_ready_o signaling
  //
  always_comb begin
    state_d = state_q;
    command_ready_int = 1'b0;
    if (sw_rst_i) begin
      state_d = Idle;
    end else if (fsm_en_i) begin
      unique case (state_q)
        Idle: begin
          // Initial state, wait for commands.
          command_ready_int = 1'b1;
          state_d = next_state_after_idle;
        end
        WaitLead: begin
          // Transaction lead: CSB is low, waiting to start sck pulses.
          if (wait_cntr_zero_i) begin
            state_d = InternalClkHigh;
          end
        end
        InternalClkLow: begin
          // Launch clock and full-cycle sampling clock for CPHA=0.
          // Half-cycle sampling clock for CPHA=1.
          // End-of-transaction clock level for both CPHA=0 and CPHA=1.
          // One of two active clock states. sck is low when CPOL=0.
          if (!last_bit_i || !last_byte_i || !cpha_q_i) begin
            state_d = InternalClkHigh;
          end else if (!csaat_q_i) begin
            state_d = WaitTrail;
          end else begin
            state_d = next_state_after_idle_csb_active;
            command_ready_int = command_ready_idle_csb_active;
          end
        end
        InternalClkHigh: begin
          // Half-cycle sampling clock for CPHA=0.
          // Launch clock for CPHA=1. Note: Full-cycle sampling is not compatible with CPHA=1.
          // One of two active clock states. sck is low when CPOL=0.
          // Typically often the last state in a command, and so the next state depends on CSAAT,
          // and of CSAAT is asserted, the details of the subsequent command.
          if (!last_bit_i || !last_byte_i || cpha_q_i) begin
            state_d = InternalClkLow;
          // Check value of csaat for the previously submitted segment
          end else if (!csaat_q_i) begin
            state_d = WaitTrail;
          end else begin
            state_d = next_state_after_idle_csb_active;
            command_ready_int = command_ready_idle_csb_active;
          end
        end
        WaitTrail: begin
          // Prepare to enter CSB high idle state by waiting csntrail cycles.
          if (wait_cntr_zero_i) begin
            state_d = WaitIdle;
          end
        end
        WaitIdle: begin
          // Once CSB is high, wait for the designated number of cycles before accepting commands.
          if (wait_cntr_zero_i) begin
            // ready to accept new command
            command_ready_int = 1'b1;
            state_d = next_state_after_idle;
          end
        end
        CSBSwitch: begin
          // Insert extra idle cycles when swtiching between CSID, this allows time to switch CPHA,
          // CPOL and clkdiv settings, as well as guarantee that the idle delay requirements have
          // been observed for the new device.
          if (wait_cntr_zero_i) begin
            state_d = WaitLead;
          end else begin
            state_d = CSBSwitch;
          end
        end
        IdleCSBActive: begin
          // Wait for new commands, but with CSB held active low.
          state_d = next_state_after_idle_csb_active;
          command_ready_int = command_ready_idle_csb_active;
        end
        default: begin
          command_ready_int  = 1'b0;
          state_d = Idle;
        end
      endcase
    end
  end

  // The sole sequential element: the FSM state register.
  // Stall freezes the state; stall_i is provided by the parent.
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      state_q    <= Idle;
    end else begin
      state_q    <= stall_i ? state_q : state_d;
    end
  end

  assign state_changing = (state_q != state_d);

  assign bit_shifting_cpha0  = ~sw_rst_i & state_changing &
                               (state_d == InternalClkLow & !last_bit_i);
  assign byte_ending_cpha0   = ~sw_rst_i & state_changing &
                               (state_q == InternalClkHigh & last_bit_i);

  assign bit_shifting_cpha1  = ~sw_rst_i & state_changing &
                               (state_d == InternalClkHigh & !last_bit_i);
  assign byte_ending_cpha1   = ~sw_rst_i & state_changing &
                               (state_q == InternalClkLow & last_bit_i);

  assign byte_ending   = (cpha == 1'b0) ? byte_ending_cpha0 :
                                          byte_ending_cpha1;

  assign bit_shifting  = (cpha == 1'b0) ? bit_shifting_cpha0 :
                                          bit_shifting_cpha1;

  assign speed_o       = cmd_speed_q_i;

  assign segment_rd_en = (cpha == 1'b0) ? cmd_rd_en_q_i :
                                          segment_rd_en_cpha1_i;

  assign wr_en_internal    = byte_starting_i & cmd_wr_en_d;
  assign shift_en_internal = bit_shifting;

  assign rd_en_internal    = byte_ending & segment_rd_en;
  assign full_cyc_o        = full_cyc;
  assign last_read_o       = last_byte_i & rd_en_o & sr_rd_ready_i;

  assign last_write_o      = byte_cntr_early_zero_i & wr_en_o & sr_wr_ready_i;

  // sample_en pipeline is externalized; use registered values from parent
  assign sample_en_internal = full_cyc_o ? sample_en_q2_i : sample_en_q_i;

  // CSB: output combinational value; parent registers it
  always_comb begin
    unique case (state_d)
      WaitLead, InternalClkLow, InternalClkHigh, IdleCSBActive, WaitTrail:
        csb_single_d = 1'b0;
      default:
        csb_single_d = 1'b1;
    endcase
  end

  for (genvar ii = 0; ii < NumCS; ii = ii + 1) begin : gen_csb_gen
    assign csb_o[ii] = (csid != ii) ? 1'b1 : csb_single_d;
  end : gen_csb_gen

  // SCK: output combinational value; parent registers it
  assign sck_d = cpol ? (state_d != InternalClkHigh) :
                        (state_d == InternalClkHigh);

  assign sck_o = sck_d;

  // sd_en_o uses registered CSB from parent to match original timing
  always_comb begin
    if (&csb_q_i) begin
      sd_en_o[3:0] = 4'h0;
    end else begin
      unique case (speed_o)
        Standard: begin
          sd_en_o[0]   = cmd_wr_en_q_i | cmd_wr_en_last_bit_i;
          sd_en_o[1]   = 1'b0;
          sd_en_o[3:2] = 2'b00;
        end
        Dual:     begin
          sd_en_o[1:0] = {2{cmd_wr_en_q_i}};
          sd_en_o[3:2] = 2'b00;
        end
        Quad:     begin
          sd_en_o[3:0] = {4{cmd_wr_en_q_i}};
        end
        default: begin
          // invalid speed
          sd_en_o[3:0] = 4'h0;
        end
      endcase
    end
  end

  //
  // Assertions confirming valid datapath inputs.
  //

  // `ASSERT(BidirOnlyInStdMode_A,
  //     command_i.segment.speed == Standard || !(command_i.segment.cmd_rd_en && command_i.segment.cmd_wr_en),
  //     clk_i, rst_ni)
  // `ASSERT(ValidSpeed_A, command_i.segment.speed != RsvdSpd, clk_i, rst_ni)
  // `ASSERT(ValidCSID_A, command_csid_i < NumCS, clk_i, rst_ni)

  // When WaitIdle completes (counter reaches 0) with no pending command and no stall,
  // the FSM must transition to Idle on the next cycle.
  `ASSERT(WaitIdleGoesToIdle_A,
      (!is_first_cycle_i
       && $past(state_q == WaitIdle)
       && $past(wait_cntr_zero_i)
       && $past(!command_valid_i)
       && $past(fsm_en_i)
       && $past(!stall_i)
       && !sw_rst_i)
      |-> state_q == Idle,
      clk_i, rst_ni)

endmodule
