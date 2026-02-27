module {
  fsm.machine @pwrmgr_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i2, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i6, %arg9: i1, %arg10: i1, %arg11: i1, %arg12: i2, %arg13: i2, %arg14: i1, %arg15: i1, %arg16: i1, %arg17: i1, %arg18: i1, %arg19: i1, %arg20: i4, %arg21: i4, %arg22: i1, %arg23: i4, %arg24: i4) -> (i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i5, i2, i1, i1, i1, i1, i1, i1, i1, i4) attributes {initialState = "state_0"} {
    %ext_rst_req_q = fsm.variable "ext_rst_req_q" {initValue = false} : i1
    %ext_rst_pending_q = fsm.variable "ext_rst_pending_q" {initValue = false} : i1
    %ip_clk_en_q = fsm.variable "ip_clk_en_q" {initValue = false} : i1
    %rst_lc_req_q = fsm.variable "rst_lc_req_q" {initValue = -1 : i2} : i2
    %rst_sys_req_q = fsm.variable "rst_sys_req_q" {initValue = -1 : i2} : i2
    %strap_sampled_o = fsm.variable "strap_sampled_o" {initValue = false} : i1
    %u_slow_sync_lc_done2Fu_sync_12Fq_o = fsm.variable "u_slow_sync_lc_done/u_sync_1/q_o" {initValue = false} : i1
    %u_slow_sync_lc_done2Fu_sync_22Fq_o = fsm.variable "u_slow_sync_lc_done/u_sync_2/q_o" {initValue = false} : i1
    %u_sync_lc_done2Fu_sync_12Fq_o = fsm.variable "u_sync_lc_done/u_sync_1/q_o" {initValue = false} : i1
    %u_sync_lc_done2Fu_sync_22Fq_o = fsm.variable "u_sync_lc_done/u_sync_2/q_o" {initValue = false} : i1
    %u_reg_otp_init2Fq_o = fsm.variable "u_reg_otp_init/q_o" {initValue = false} : i1
    %u_reg_lc_init2Fq_o = fsm.variable "u_reg_lc_init/q_o" {initValue = false} : i1
    fsm.state @state_0 output {
      %c-6_i4 = hw.constant -6 : i4
      %true = hw.constant true
      %c-1_i2 = hw.constant -1 : i2
      %false = hw.constant false
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
      %1 = comb.extract %arg8 from 0 : (i6) -> i5
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %c-1_i2) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
      fsm.output %false, %false, %false, %false, %false, %false, %false, %false, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false, %strap_sampled_o, %true, %c-6_i4 : i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i5, i2, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_55 guard {
        %true = hw.constant true
        fsm.return %true
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %ext_rst_req_q, %arg11 : i1
        %true = hw.constant true
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %0 = comb.xor %arg11, %true : i1
        %1 = comb.and %ext_rst_pending_q, %0, %ext_rst_req_q : i1
        %2 = comb.or %arg10, %ext_rst_pending_q : i1
        %3 = comb.xor %1, %true : i1
        %4 = comb.and %3, %2 : i1
        %5 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %6 = comb.and %5, %strap_sampled_o : i1
        fsm.update %u_reg_lc_init2Fq_o, %false : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %strap_sampled_o, %6 : i1
        fsm.update %rst_sys_req_q, %c-1_i2 : i2
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
        fsm.update %ip_clk_en_q, %false : i1
        fsm.update %ext_rst_pending_q, %4 : i1
      }
    }
    fsm.state @state_55 output {
      %c-6_i4 = hw.constant -6 : i4
      %true = hw.constant true
      %c-1_i2 = hw.constant -1 : i2
      %false = hw.constant false
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
      %1 = comb.extract %arg8 from 0 : (i6) -> i5
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %c-1_i2) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
      fsm.output %false, %false, %false, %false, %false, %false, %false, %false, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false, %strap_sampled_o, %true, %c-6_i4 : i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i5, i2, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_55 guard {
        %true = hw.constant true
        fsm.return %true
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %ext_rst_req_q, %arg11 : i1
        %true = hw.constant true
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %0 = comb.xor %arg11, %true : i1
        %1 = comb.and %ext_rst_pending_q, %0, %ext_rst_req_q : i1
        %2 = comb.or %arg10, %ext_rst_pending_q : i1
        %3 = comb.xor %1, %true : i1
        %4 = comb.and %3, %2 : i1
        %5 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %6 = comb.and %5, %strap_sampled_o : i1
        fsm.update %u_reg_lc_init2Fq_o, %false : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %strap_sampled_o, %6 : i1
        fsm.update %rst_sys_req_q, %c-1_i2 : i2
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
        fsm.update %ip_clk_en_q, %false : i1
        fsm.update %ext_rst_pending_q, %4 : i1
      }
    }
  }
}

