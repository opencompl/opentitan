module {
  fsm.machine @pwrmgr_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i2, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i5, %arg9: i1, %arg10: i1, %arg11: i2, %arg12: i2, %arg13: i1, %arg14: i1, %arg15: i1, %arg16: i1, %arg17: i1, %arg18: i1, %arg19: i1, %arg20: i4, %arg21: i4, %arg22: i1, %arg23: i4, %arg24: i4) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4) attributes {initialState = "state_55"} {
    %ack_pwrup_q = fsm.variable "ack_pwrup_q" {initValue = false} : i1
    %req_pwrdn_q = fsm.variable "req_pwrdn_q" {initValue = false} : i1
    %reset_ongoing_q = fsm.variable "reset_ongoing_q" {initValue = false} : i1
    %ip_clk_en_q = fsm.variable "ip_clk_en_q" {initValue = false} : i1
    %rst_lc_req_q = fsm.variable "rst_lc_req_q" {initValue = -1 : i2} : i2
    %rst_sys_req_q = fsm.variable "rst_sys_req_q" {initValue = -1 : i2} : i2
    %reset_cause_q = fsm.variable "reset_cause_q" {initValue = -1 : i2} : i2
    %low_power_q = fsm.variable "low_power_q" {initValue = true} : i1
    %strap_sampled_o = fsm.variable "strap_sampled_o" {initValue = false} : i1
    %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o = fsm.variable "u_fetch_en/gen_flops.u_prim_flop/u_secure_anchor_flop/q_o" {initValue = -6 : i4} : i4
    %u_slow_sync_lc_done2Fu_sync_12Fq_o = fsm.variable "u_slow_sync_lc_done/u_sync_1/q_o" {initValue = false} : i1
    %u_slow_sync_lc_done2Fu_sync_22Fq_o = fsm.variable "u_slow_sync_lc_done/u_sync_2/q_o" {initValue = false} : i1
    %u_sync_lc_done2Fu_sync_12Fq_o = fsm.variable "u_sync_lc_done/u_sync_1/q_o" {initValue = false} : i1
    %u_sync_lc_done2Fu_sync_22Fq_o = fsm.variable "u_sync_lc_done/u_sync_2/q_o" {initValue = false} : i1
    %u_usb_ip_clk_en2Fq_o = fsm.variable "u_usb_ip_clk_en/q_o" {initValue = false} : i1
    %u_reg_otp_init2Fq_o = fsm.variable "u_reg_otp_init/q_o" {initValue = false} : i1
    %u_reg_lc_init2Fq_o = fsm.variable "u_reg_lc_init/q_o" {initValue = false} : i1
    fsm.state @state_55 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_2766 guard {
        %c-1330_i12 = hw.constant -1330 : i12
        %c55_i12 = hw.constant 55 : i12
        %0 = comb.or %arg3, %reset_ongoing_q : i1
        %1 = comb.mux %0, %c-1330_i12, %c55_i12 : i12
        %2 = comb.extract %1 from 11 : (i12) -> i1
        %3 = comb.extract %1 from 9 : (i12) -> i1
        %4 = comb.extract %1 from 3 : (i12) -> i5
        %5 = comb.extract %1 from 0 : (i12) -> i1
        %6 = comb.concat %2, %3, %4, %5 : i1, i1, i5, i1
        %c-14_i8 = hw.constant -14 : i8
        %7 = comb.icmp eq %6, %c-14_i8 : i8
        %true = hw.constant true
        %8 = comb.xor %arg9, %true : i1
        %9 = comb.and %8, %7 : i1
        fsm.return %9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_55 guard {
        %c-1330_i12 = hw.constant -1330 : i12
        %c55_i12 = hw.constant 55 : i12
        %0 = comb.or %arg3, %reset_ongoing_q : i1
        %1 = comb.mux %0, %c-1330_i12, %c55_i12 : i12
        %2 = comb.extract %1 from 11 : (i12) -> i1
        %3 = comb.extract %1 from 9 : (i12) -> i1
        %4 = comb.extract %1 from 3 : (i12) -> i5
        %5 = comb.extract %1 from 0 : (i12) -> i1
        %6 = comb.concat %2, %3, %4, %5 : i1, i1, i5, i1
        %c13_i8 = hw.constant 13 : i8
        %7 = comb.icmp eq %6, %c13_i8 : i8
        %true = hw.constant true
        %8 = comb.xor %arg9, %true : i1
        %9 = comb.and %8, %7 : i1
        fsm.return %9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
    }
    fsm.state @state_2766 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_usb_ip_clk_en2Fq_o, %arg10 : i1
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %false_0 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %true : i1
      }
      fsm.transition @state_2766 guard {
        %c-1_i3 = hw.constant -1 : i3
        %0 = hw.struct_create (%arg13, %arg14, %arg15) : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
        %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
        %2 = hw.bitcast %1 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
        %3 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
        %4 = comb.and %2, %3 : i3
        %5 = comb.xor %2, %c-1_i3 : i3
        %6 = comb.or %4, %5 : i3
        %7 = comb.icmp eq %6, %c-1_i3 : i3
        %8 = comb.and %ip_clk_en_q, %7 : i1
        %c224_i9 = hw.constant 224 : i9
        %c-153_i9 = hw.constant -153 : i9
        %9 = comb.mux %8, %c224_i9, %c-153_i9 : i9
        %10 = comb.extract %9 from 7 : (i9) -> i2
        %11 = comb.extract %9 from 0 : (i9) -> i3
        %12 = comb.concat %10, %11 : i2, i3
        %c-9_i5 = hw.constant -9 : i5
        %13 = comb.icmp eq %12, %c-9_i5 : i5
        %true = hw.constant true
        %14 = comb.xor %arg9, %true : i1
        %15 = comb.and %14, %13 : i1
        fsm.return %15
      } action {
        fsm.update %u_usb_ip_clk_en2Fq_o, %arg10 : i1
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %false_0 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %true : i1
      }
      fsm.transition @state_2496 guard {
        %c-1_i3 = hw.constant -1 : i3
        %0 = hw.struct_create (%arg13, %arg14, %arg15) : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
        %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
        %2 = hw.bitcast %1 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
        %3 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
        %4 = comb.and %2, %3 : i3
        %5 = comb.xor %2, %c-1_i3 : i3
        %6 = comb.or %4, %5 : i3
        %7 = comb.icmp eq %6, %c-1_i3 : i3
        %8 = comb.and %ip_clk_en_q, %7 : i1
        %c224_i9 = hw.constant 224 : i9
        %c-153_i9 = hw.constant -153 : i9
        %9 = comb.mux %8, %c224_i9, %c-153_i9 : i9
        %10 = comb.extract %9 from 7 : (i9) -> i2
        %11 = comb.extract %9 from 0 : (i9) -> i3
        %12 = comb.concat %10, %11 : i2, i3
        %c8_i5 = hw.constant 8 : i5
        %13 = comb.icmp eq %12, %c8_i5 : i5
        %true = hw.constant true
        %14 = comb.xor %arg9, %true : i1
        %15 = comb.and %14, %13 : i1
        fsm.return %15
      } action {
        fsm.update %u_usb_ip_clk_en2Fq_o, %arg10 : i1
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %false_0 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %true : i1
      }
    }
    fsm.state @state_3414 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        %true = hw.constant true
        fsm.return %true
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %false_2 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %false_2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %rst_sys_req_q, %c-1_i2 : i2
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
        fsm.update %ip_clk_en_q, %false : i1
      }
    }
    fsm.state @state_2496 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_4002 guard {
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp eq %arg11, %c-1_i2 : i2
        %c-47_i10 = hw.constant -47 : i10
        %c224_i10 = hw.constant 224 : i10
        %1 = comb.mux %0, %c-47_i10, %c224_i10 : i10
        %2 = comb.extract %1 from 8 : (i10) -> i2
        %3 = comb.extract %1 from 4 : (i10) -> i2
        %4 = comb.extract %1 from 0 : (i10) -> i1
        %5 = comb.concat %2, %3, %4 : i2, i2, i1
        %c-5_i5 = hw.constant -5 : i5
        %6 = comb.icmp eq %5, %c-5_i5 : i5
        %true = hw.constant true
        %7 = comb.xor %arg9, %true : i1
        %8 = comb.and %7, %6 : i1
        fsm.return %8
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i2 = hw.constant 0 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %rst_sys_req_q, %c0_i2 : i2
        fsm.update %rst_lc_req_q, %c0_i2 : i2
      }
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i2 = hw.constant 0 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %rst_sys_req_q, %c0_i2 : i2
        fsm.update %rst_lc_req_q, %c0_i2 : i2
      }
      fsm.transition @state_2496 guard {
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp eq %arg11, %c-1_i2 : i2
        %c-47_i10 = hw.constant -47 : i10
        %c224_i10 = hw.constant 224 : i10
        %1 = comb.mux %0, %c-47_i10, %c224_i10 : i10
        %2 = comb.extract %1 from 8 : (i10) -> i2
        %3 = comb.extract %1 from 4 : (i10) -> i2
        %4 = comb.extract %1 from 0 : (i10) -> i1
        %5 = comb.concat %2, %3, %4 : i2, i2, i1
        %c4_i5 = hw.constant 4 : i5
        %6 = comb.icmp eq %5, %c4_i5 : i5
        %true = hw.constant true
        %7 = comb.xor %arg9, %true : i1
        %8 = comb.and %7, %6 : i1
        fsm.return %8
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i2 = hw.constant 0 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %rst_sys_req_q, %c0_i2 : i2
        fsm.update %rst_lc_req_q, %c0_i2 : i2
      }
    }
    fsm.state @state_4002 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_4002 guard {
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %true_0 = hw.constant true
        %1 = comb.xor %arg9, %true_0 : i1
        %2 = comb.and %1, %0 : i1
        fsm.return %2
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false : i1
        fsm.update %u_reg_otp_init2Fq_o, %true : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false : i1
        fsm.update %u_reg_otp_init2Fq_o, %true : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_2643 guard {
        %true = hw.constant true
        %0 = comb.xor %arg9, %true : i1
        %1 = comb.and %0, %arg16 : i1
        fsm.return %1
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false : i1
        fsm.update %u_reg_otp_init2Fq_o, %true : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
    }
    fsm.state @state_2643 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %true = hw.constant true
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %true : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_2643 guard {
        %c168_i12 = hw.constant 168 : i12
        %c-1453_i12 = hw.constant -1453 : i12
        %0 = comb.mux %u_sync_lc_done2Fu_sync_22Fq_o, %c168_i12, %c-1453_i12 : i12
        %1 = comb.extract %0 from 11 : (i12) -> i1
        %2 = comb.extract %0 from 9 : (i12) -> i1
        %3 = comb.extract %0 from 3 : (i12) -> i5
        %4 = comb.extract %0 from 0 : (i12) -> i2
        %5 = comb.concat %1, %2, %3, %4 : i1, i1, i5, i2
        %c-85_i9 = hw.constant -85 : i9
        %6 = comb.icmp eq %5, %c-85_i9 : i9
        %true = hw.constant true
        %7 = comb.xor %arg9, %true : i1
        %8 = comb.and %7, %6 : i1
        fsm.return %8
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %true = hw.constant true
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %true : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_168 guard {
        %c168_i12 = hw.constant 168 : i12
        %c-1453_i12 = hw.constant -1453 : i12
        %0 = comb.mux %u_sync_lc_done2Fu_sync_22Fq_o, %c168_i12, %c-1453_i12 : i12
        %1 = comb.extract %0 from 11 : (i12) -> i1
        %2 = comb.extract %0 from 9 : (i12) -> i1
        %3 = comb.extract %0 from 3 : (i12) -> i5
        %4 = comb.extract %0 from 0 : (i12) -> i2
        %5 = comb.concat %1, %2, %3, %4 : i1, i1, i5, i2
        %c84_i9 = hw.constant 84 : i9
        %6 = comb.icmp eq %5, %c84_i9 : i9
        %true = hw.constant true
        %7 = comb.xor %arg9, %true : i1
        %8 = comb.and %7, %6 : i1
        fsm.return %8
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %true = hw.constant true
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %true : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
    }
    fsm.state @state_168 output {
      %c1_i2 = hw.constant 1 : i2
      %true = hw.constant true
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %1 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
      %2 = comb.xor %arg3, %true : i1
      %3 = comb.or %2, %reset_ongoing_q : i1
      %4 = comb.icmp eq %arg4, %c1_i2 : i2
      %5 = comb.and %3, %4, %1 : i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %6 = comb.extract %arg8 from 0 : (i5) -> i4
      %7 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %6, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %7 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_3, %arg15, %5, %false, %false_0, %false_1, %3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_2, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %reset_ongoing_q, %true : i1
        %3 = comb.xor %arg3, %true : i1
        %4 = comb.or %3, %reset_ongoing_q : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %5, %ack_pwrup_q : i1
        %7 = comb.xor %4, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %8 = comb.mux %7, %2, %6 : i1
        %9 = comb.or %7, %5 : i1
        %10 = comb.and %9, %reset_ongoing_q : i1
        %11 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %11 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_ongoing_q, %10 : i1
        fsm.update %ack_pwrup_q, %8 : i1
      }
      fsm.transition @state_3130 guard {
        %true = hw.constant true
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.or %0, %reset_ongoing_q : i1
        %true_0 = hw.constant true
        %2 = comb.xor %arg9, %true_0 : i1
        %3 = comb.and %2, %1 : i1
        fsm.return %3
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %reset_ongoing_q, %true : i1
        %3 = comb.xor %arg3, %true : i1
        %4 = comb.or %3, %reset_ongoing_q : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %5, %ack_pwrup_q : i1
        %7 = comb.xor %4, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %8 = comb.mux %7, %2, %6 : i1
        %9 = comb.or %7, %5 : i1
        %10 = comb.and %9, %reset_ongoing_q : i1
        %11 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %11 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_ongoing_q, %10 : i1
        fsm.update %ack_pwrup_q, %8 : i1
      }
      fsm.transition @state_168 guard {
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.extract %arg11 from 1 : (i2) -> i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.extract %arg12 from 1 : (i2) -> i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %1, %3 : i1
        %5 = comb.xor %arg11, %c-1_i2 : i2
        %6 = comb.and %rst_lc_req_q, %5 : i2
        %7 = comb.xor %rst_lc_req_q, %c-1_i2 : i2
        %8 = comb.and %7, %arg11 : i2
        %9 = comb.or %6, %8 : i2
        %10 = comb.icmp eq %9, %c-1_i2 : i2
        %11 = comb.xor %arg12, %c-1_i2 : i2
        %12 = comb.and %rst_sys_req_q, %11 : i2
        %13 = comb.xor %rst_sys_req_q, %c-1_i2 : i2
        %14 = comb.and %13, %arg12 : i2
        %15 = comb.or %12, %14 : i2
        %16 = comb.icmp eq %15, %c-1_i2 : i2
        %17 = comb.extract %arg8 from 1 : (i5) -> i1
        %18 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
        %19 = comb.or %arg7, %4 : i1
        %20 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
        %21 = comb.and %20, %10, %16 : i1
        %22 = comb.mux %18, %19, %21 : i1
        %23 = comb.xor %arg3, %true : i1
        %24 = comb.or %23, %reset_ongoing_q : i1
        %25 = comb.xor %17, %true : i1
        %26 = comb.and %22, %25 : i1
        %27 = comb.xor %26, %true : i1
        %c-88_i8 = hw.constant -88 : i8
        %c55_i8 = hw.constant 55 : i8
        %28 = comb.mux %27, %c-88_i8, %c55_i8 : i8
        %29 = comb.xor %24, %true : i1
        %30 = comb.extract %28 from 7 : (i8) -> i1
        %31 = comb.extract %28 from 0 : (i8) -> i5
        %32 = comb.concat %30, %31 : i1, i5
        %c-24_i6 = hw.constant -24 : i6
        %33 = comb.icmp eq %32, %c-24_i6 : i6
        %true_0 = hw.constant true
        %34 = comb.xor %24, %true_0 : i1
        %35 = comb.and %34, %33 : i1
        %36 = comb.or %29, %35 : i1
        %true_1 = hw.constant true
        %37 = comb.xor %arg9, %true_1 : i1
        %38 = comb.and %37, %36 : i1
        fsm.return %38
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %reset_ongoing_q, %true : i1
        %3 = comb.xor %arg3, %true : i1
        %4 = comb.or %3, %reset_ongoing_q : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %5, %ack_pwrup_q : i1
        %7 = comb.xor %4, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %8 = comb.mux %7, %2, %6 : i1
        %9 = comb.or %7, %5 : i1
        %10 = comb.and %9, %reset_ongoing_q : i1
        %11 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %11 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_ongoing_q, %10 : i1
        fsm.update %ack_pwrup_q, %8 : i1
      }
      fsm.transition @state_55 guard {
        %false = hw.constant false
        fsm.return %false
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %reset_ongoing_q, %true : i1
        %3 = comb.xor %arg3, %true : i1
        %4 = comb.or %3, %reset_ongoing_q : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %5, %ack_pwrup_q : i1
        %7 = comb.xor %4, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %8 = comb.mux %7, %2, %6 : i1
        %9 = comb.or %7, %5 : i1
        %10 = comb.and %9, %reset_ongoing_q : i1
        %11 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %11 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_ongoing_q, %10 : i1
        fsm.update %ack_pwrup_q, %8 : i1
      }
    }
    fsm.state @state_3130 output {
      %true = hw.constant true
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %1 = comb.xor %strap_sampled_o, %true : i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %2 = comb.extract %arg8 from 0 : (i5) -> i4
      %3 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %2, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %3 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_4, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %1, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.xor %0, %true : i1
        %2 = comb.xor %strap_sampled_o, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %3 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %3 : i1
        %4 = comb.and %1, %2 : i1
        %5 = comb.or %0, %2 : i1
        %6 = comb.mux bin %5, %4, %strap_sampled_o : i1
        fsm.update %strap_sampled_o, %6 : i1
      }
      fsm.transition @state_1523 guard {
        %true = hw.constant true
        %0 = comb.xor %arg9, %true : i1
        fsm.return %0
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.xor %0, %true : i1
        %2 = comb.xor %strap_sampled_o, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %3 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %3 : i1
        %4 = comb.and %1, %2 : i1
        %5 = comb.or %0, %2 : i1
        %6 = comb.mux bin %5, %4, %strap_sampled_o : i1
        fsm.update %strap_sampled_o, %6 : i1
      }
    }
    fsm.state @state_1523 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i2 = hw.constant 0 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %low_power_q, %false : i1
        fsm.update %reset_cause_q, %c0_i2 : i2
      }
      fsm.transition @state_1523 guard {
        %c6_i4 = hw.constant 6 : i4
        %0 = comb.icmp eq %arg23, %c6_i4 : i4
        %c4_i9 = hw.constant 4 : i9
        %c-13_i9 = hw.constant -13 : i9
        %1 = comb.mux %0, %c4_i9, %c-13_i9 : i9
        %2 = comb.extract %1 from 0 : (i9) -> i3
        %3 = comb.extract %1 from 4 : (i9) -> i5
        %4 = comb.concat %3, %2 : i5, i3
        %c-5_i8 = hw.constant -5 : i8
        %5 = comb.icmp eq %4, %c-5_i8 : i8
        %true = hw.constant true
        %6 = comb.xor %arg9, %true : i1
        %7 = comb.and %6, %5 : i1
        fsm.return %7
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i2 = hw.constant 0 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %low_power_q, %false : i1
        fsm.update %reset_cause_q, %c0_i2 : i2
      }
      fsm.transition @state_1028 guard {
        %c6_i4 = hw.constant 6 : i4
        %0 = comb.icmp eq %arg23, %c6_i4 : i4
        %c4_i9 = hw.constant 4 : i9
        %c-13_i9 = hw.constant -13 : i9
        %1 = comb.mux %0, %c4_i9, %c-13_i9 : i9
        %2 = comb.extract %1 from 0 : (i9) -> i3
        %3 = comb.extract %1 from 4 : (i9) -> i5
        %4 = comb.concat %3, %2 : i5, i3
        %c4_i8 = hw.constant 4 : i8
        %5 = comb.icmp eq %4, %c4_i8 : i8
        %true = hw.constant true
        %6 = comb.xor %arg9, %true : i1
        %7 = comb.and %6, %5 : i1
        fsm.return %7
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i2 = hw.constant 0 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %low_power_q, %false : i1
        fsm.update %reset_cause_q, %c0_i2 : i2
      }
    }
    fsm.state @state_1028 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_1028 guard {
        %false = hw.constant false
        %c6_i4 = hw.constant 6 : i4
        %c-7_i4 = hw.constant -7 : i4
        %c0_i2 = hw.constant 0 : i2
        %c5_i4 = hw.constant 5 : i4
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.extract %arg20 from 0 : (i4) -> i1
        %1 = comb.extract %arg21 from 0 : (i4) -> i1
        %2 = comb.and %0, %1 : i1
        %3 = comb.extract %arg20 from 1 : (i4) -> i1
        %4 = comb.extract %arg21 from 1 : (i4) -> i1
        %5 = comb.or %3, %4 : i1
        %6 = comb.concat %false, %2 : i1, i1
        %7 = comb.concat %5, %false : i1, i1
        %8 = comb.or %6, %7 : i2
        %9 = comb.extract %arg20 from 2 : (i4) -> i1
        %10 = comb.extract %arg21 from 2 : (i4) -> i1
        %11 = comb.and %9, %10 : i1
        %12 = comb.concat %false, %8 : i1, i2
        %13 = comb.concat %11, %c0_i2 : i1, i2
        %14 = comb.or %12, %13 : i3
        %15 = comb.extract %arg20 from 3 : (i4) -> i1
        %16 = comb.extract %arg21 from 3 : (i4) -> i1
        %17 = comb.or %15, %16 : i1
        %18 = comb.concat %false, %14 : i1, i3
        %19 = comb.concat %17, %c0_i3 : i1, i3
        %20 = comb.or %18, %19 : i4
        %21 = comb.icmp eq %20, %c5_i4 : i4
        %22 = comb.mux %21, %c6_i4, %c-7_i4 : i4
        %23 = comb.extract %22 from 0 : (i4) -> i1
        %24 = comb.extract %arg24 from 0 : (i4) -> i1
        %25 = comb.and %23, %24 : i1
        %26 = comb.extract %22 from 1 : (i4) -> i1
        %27 = comb.extract %arg24 from 1 : (i4) -> i1
        %28 = comb.or %26, %27 : i1
        %29 = comb.concat %false, %25 : i1, i1
        %30 = comb.concat %28, %false : i1, i1
        %31 = comb.or %29, %30 : i2
        %32 = comb.extract %22 from 2 : (i4) -> i1
        %33 = comb.extract %arg24 from 2 : (i4) -> i1
        %34 = comb.or %32, %33 : i1
        %35 = comb.concat %false, %31 : i1, i2
        %36 = comb.concat %34, %c0_i2 : i1, i2
        %37 = comb.or %35, %36 : i3
        %38 = comb.extract %22 from 3 : (i4) -> i1
        %39 = comb.extract %arg24 from 3 : (i4) -> i1
        %40 = comb.and %38, %39 : i1
        %41 = comb.concat %false, %37 : i1, i3
        %42 = comb.concat %40, %c0_i3 : i1, i3
        %43 = comb.or %41, %42 : i4
        %c27_i6 = hw.constant 27 : i6
        %44 = comb.icmp eq %43, %c6_i4 : i4
        %c-32_i6 = hw.constant -32 : i6
        %45 = comb.mux %44, %c27_i6, %c-32_i6 : i6
        %46 = comb.extract %45 from 3 : (i6) -> i3
        %47 = comb.extract %45 from 0 : (i6) -> i2
        %48 = comb.concat %46, %47 : i3, i2
        %c-16_i5 = hw.constant -16 : i5
        %49 = comb.icmp eq %48, %c-16_i5 : i5
        %true = hw.constant true
        %50 = comb.xor %arg9, %true : i1
        %51 = comb.and %50, %49 : i1
        fsm.return %51
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
      fsm.transition @state_868 guard {
        %false = hw.constant false
        %c6_i4 = hw.constant 6 : i4
        %c-7_i4 = hw.constant -7 : i4
        %c0_i2 = hw.constant 0 : i2
        %c5_i4 = hw.constant 5 : i4
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.extract %arg20 from 0 : (i4) -> i1
        %1 = comb.extract %arg21 from 0 : (i4) -> i1
        %2 = comb.and %0, %1 : i1
        %3 = comb.extract %arg20 from 1 : (i4) -> i1
        %4 = comb.extract %arg21 from 1 : (i4) -> i1
        %5 = comb.or %3, %4 : i1
        %6 = comb.concat %false, %2 : i1, i1
        %7 = comb.concat %5, %false : i1, i1
        %8 = comb.or %6, %7 : i2
        %9 = comb.extract %arg20 from 2 : (i4) -> i1
        %10 = comb.extract %arg21 from 2 : (i4) -> i1
        %11 = comb.and %9, %10 : i1
        %12 = comb.concat %false, %8 : i1, i2
        %13 = comb.concat %11, %c0_i2 : i1, i2
        %14 = comb.or %12, %13 : i3
        %15 = comb.extract %arg20 from 3 : (i4) -> i1
        %16 = comb.extract %arg21 from 3 : (i4) -> i1
        %17 = comb.or %15, %16 : i1
        %18 = comb.concat %false, %14 : i1, i3
        %19 = comb.concat %17, %c0_i3 : i1, i3
        %20 = comb.or %18, %19 : i4
        %21 = comb.icmp eq %20, %c5_i4 : i4
        %22 = comb.mux %21, %c6_i4, %c-7_i4 : i4
        %23 = comb.extract %22 from 0 : (i4) -> i1
        %24 = comb.extract %arg24 from 0 : (i4) -> i1
        %25 = comb.and %23, %24 : i1
        %26 = comb.extract %22 from 1 : (i4) -> i1
        %27 = comb.extract %arg24 from 1 : (i4) -> i1
        %28 = comb.or %26, %27 : i1
        %29 = comb.concat %false, %25 : i1, i1
        %30 = comb.concat %28, %false : i1, i1
        %31 = comb.or %29, %30 : i2
        %32 = comb.extract %22 from 2 : (i4) -> i1
        %33 = comb.extract %arg24 from 2 : (i4) -> i1
        %34 = comb.or %32, %33 : i1
        %35 = comb.concat %false, %31 : i1, i2
        %36 = comb.concat %34, %c0_i2 : i1, i2
        %37 = comb.or %35, %36 : i3
        %38 = comb.extract %22 from 3 : (i4) -> i1
        %39 = comb.extract %arg24 from 3 : (i4) -> i1
        %40 = comb.and %38, %39 : i1
        %41 = comb.concat %false, %37 : i1, i3
        %42 = comb.concat %40, %c0_i3 : i1, i3
        %43 = comb.or %41, %42 : i4
        %c27_i6 = hw.constant 27 : i6
        %44 = comb.icmp eq %43, %c6_i4 : i4
        %c-32_i6 = hw.constant -32 : i6
        %45 = comb.mux %44, %c27_i6, %c-32_i6 : i6
        %46 = comb.extract %45 from 3 : (i6) -> i3
        %47 = comb.extract %45 from 0 : (i6) -> i2
        %48 = comb.concat %46, %47 : i3, i2
        %c15_i5 = hw.constant 15 : i5
        %49 = comb.icmp eq %48, %c15_i5 : i5
        %true = hw.constant true
        %50 = comb.xor %arg9, %true : i1
        %51 = comb.and %50, %49 : i1
        fsm.return %51
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
      }
    }
    fsm.state @state_868 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c5_i4 = hw.constant 5 : i4
        %c-6_i4 = hw.constant -6 : i4
        %c0_i5 = hw.constant 0 : i5
        %true = hw.constant true
        %0 = comb.icmp ne %arg8, %c0_i5 : i5
        %1 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %2 = comb.and %1, %strap_sampled_o : i1
        %3 = comb.or %0, %arg6 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.mux %4, %reset_cause_q, %c-1_i2 : i2
        %6 = comb.mux %3, %c-6_i4, %c5_i4 : i4
        %false = hw.constant false
        %false_0 = hw.constant false
        %7 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %7 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %6 : i4
        fsm.update %strap_sampled_o, %2 : i1
        fsm.update %reset_cause_q, %5 : i2
      }
      fsm.transition @state_917 guard {
        %c0_i5 = hw.constant 0 : i5
        %0 = comb.icmp ne %arg8, %c0_i5 : i5
        %1 = comb.or %0, %arg6 : i1
        %c-107_i8 = hw.constant -107 : i8
        %c100_i8 = hw.constant 100 : i8
        %2 = comb.mux %1, %c-107_i8, %c100_i8 : i8
        %3 = comb.extract %2 from 4 : (i8) -> i4
        %4 = comb.extract %2 from 0 : (i8) -> i1
        %5 = comb.concat %3, %4 : i4, i1
        %c-13_i5 = hw.constant -13 : i5
        %6 = comb.icmp eq %5, %c-13_i5 : i5
        %true = hw.constant true
        %7 = comb.xor %arg9, %true : i1
        %8 = comb.and %7, %6 : i1
        fsm.return %8
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c5_i4 = hw.constant 5 : i4
        %c-6_i4 = hw.constant -6 : i4
        %c0_i5 = hw.constant 0 : i5
        %true = hw.constant true
        %0 = comb.icmp ne %arg8, %c0_i5 : i5
        %1 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %2 = comb.and %1, %strap_sampled_o : i1
        %3 = comb.or %0, %arg6 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.mux %4, %reset_cause_q, %c-1_i2 : i2
        %6 = comb.mux %3, %c-6_i4, %c5_i4 : i4
        %false = hw.constant false
        %false_0 = hw.constant false
        %7 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %7 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %6 : i4
        fsm.update %strap_sampled_o, %2 : i1
        fsm.update %reset_cause_q, %5 : i2
      }
      fsm.transition @state_868 guard {
        %c0_i5 = hw.constant 0 : i5
        %0 = comb.icmp ne %arg8, %c0_i5 : i5
        %1 = comb.or %0, %arg6 : i1
        %c-107_i8 = hw.constant -107 : i8
        %c100_i8 = hw.constant 100 : i8
        %2 = comb.mux %1, %c-107_i8, %c100_i8 : i8
        %3 = comb.extract %2 from 4 : (i8) -> i4
        %4 = comb.extract %2 from 0 : (i8) -> i1
        %5 = comb.concat %3, %4 : i4, i1
        %c12_i5 = hw.constant 12 : i5
        %6 = comb.icmp eq %5, %c12_i5 : i5
        %true = hw.constant true
        %7 = comb.xor %arg9, %true : i1
        %8 = comb.and %7, %6 : i1
        fsm.return %8
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c5_i4 = hw.constant 5 : i4
        %c-6_i4 = hw.constant -6 : i4
        %c0_i5 = hw.constant 0 : i5
        %true = hw.constant true
        %0 = comb.icmp ne %arg8, %c0_i5 : i5
        %1 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %2 = comb.and %1, %strap_sampled_o : i1
        %3 = comb.or %0, %arg6 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.mux %4, %reset_cause_q, %c-1_i2 : i2
        %6 = comb.mux %3, %c-6_i4, %c5_i4 : i4
        %false = hw.constant false
        %false_0 = hw.constant false
        %7 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %7 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %6 : i4
        fsm.update %strap_sampled_o, %2 : i1
        fsm.update %reset_cause_q, %5 : i2
      }
    }
    fsm.state @state_917 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i5 = hw.constant 0 : i5
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.icmp eq %arg8, %c0_i5 : i5
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %false_2 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %false_2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %low_power_q, %2 : i1
        fsm.update %ip_clk_en_q, %false : i1
      }
      fsm.transition @state_1744 guard {
        %c0_i5 = hw.constant 0 : i5
        %c-1_i3 = hw.constant -1 : i3
        %true = hw.constant true
        %0 = hw.struct_create (%arg13, %arg14, %arg15) : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
        %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
        %2 = comb.icmp ne %arg8, %c0_i5 : i5
        %3 = comb.extract %arg8 from 2 : (i5) -> i1
        %4 = comb.extract %arg8 from 1 : (i5) -> i1
        %5 = comb.or %3, %4 : i1
        %6 = hw.bitcast %1 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
        %7 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
        %8 = comb.xor %6, %c-1_i3 : i3
        %9 = comb.xor %ip_clk_en_q, %true : i1
        %10 = comb.xor %7, %c-1_i3 : i3
        %11 = comb.and %8, %10 : i3
        %12 = comb.or %11, %6 : i3
        %13 = comb.icmp eq %12, %c-1_i3 : i3
        %14 = comb.and %9, %13 : i1
        %15 = comb.mux %14, %2, %5 : i1
        %c-304_i11 = hw.constant -304 : i11
        %c917_i11 = hw.constant 917 : i11
        %16 = comb.mux %14, %c-304_i11, %c917_i11 : i11
        %c778_i11 = hw.constant 778 : i11
        %17 = comb.mux %15, %c778_i11, %16 : i11
        %18 = comb.extract %17 from 10 : (i11) -> i1
        %19 = comb.extract %17 from 6 : (i11) -> i3
        %20 = comb.extract %17 from 0 : (i11) -> i5
        %21 = comb.concat %18, %19, %20 : i1, i3, i5
        %c-144_i9 = hw.constant -144 : i9
        %22 = comb.icmp eq %21, %c-144_i9 : i9
        %true_0 = hw.constant true
        %23 = comb.xor %arg9, %true_0 : i1
        %24 = comb.and %23, %22 : i1
        fsm.return %24
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i5 = hw.constant 0 : i5
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.icmp eq %arg8, %c0_i5 : i5
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %false_2 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %false_2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %low_power_q, %2 : i1
        fsm.update %ip_clk_en_q, %false : i1
      }
      fsm.transition @state_917 guard {
        %c0_i5 = hw.constant 0 : i5
        %c-1_i3 = hw.constant -1 : i3
        %true = hw.constant true
        %0 = hw.struct_create (%arg13, %arg14, %arg15) : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
        %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
        %2 = comb.icmp ne %arg8, %c0_i5 : i5
        %3 = comb.extract %arg8 from 2 : (i5) -> i1
        %4 = comb.extract %arg8 from 1 : (i5) -> i1
        %5 = comb.or %3, %4 : i1
        %6 = hw.bitcast %1 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
        %7 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
        %8 = comb.xor %6, %c-1_i3 : i3
        %9 = comb.xor %ip_clk_en_q, %true : i1
        %10 = comb.xor %7, %c-1_i3 : i3
        %11 = comb.and %8, %10 : i3
        %12 = comb.or %11, %6 : i3
        %13 = comb.icmp eq %12, %c-1_i3 : i3
        %14 = comb.and %9, %13 : i1
        %15 = comb.mux %14, %2, %5 : i1
        %c-304_i11 = hw.constant -304 : i11
        %c917_i11 = hw.constant 917 : i11
        %16 = comb.mux %14, %c-304_i11, %c917_i11 : i11
        %c778_i11 = hw.constant 778 : i11
        %17 = comb.mux %15, %c778_i11, %16 : i11
        %18 = comb.extract %17 from 10 : (i11) -> i1
        %19 = comb.extract %17 from 6 : (i11) -> i3
        %20 = comb.extract %17 from 0 : (i11) -> i5
        %21 = comb.concat %18, %19, %20 : i1, i3, i5
        %c213_i9 = hw.constant 213 : i9
        %22 = comb.icmp eq %21, %c213_i9 : i9
        %true_0 = hw.constant true
        %23 = comb.xor %arg9, %true_0 : i1
        %24 = comb.and %23, %22 : i1
        fsm.return %24
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i5 = hw.constant 0 : i5
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.icmp eq %arg8, %c0_i5 : i5
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %false_2 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %false_2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %low_power_q, %2 : i1
        fsm.update %ip_clk_en_q, %false : i1
      }
      fsm.transition @state_778 guard {
        %c0_i5 = hw.constant 0 : i5
        %c-1_i3 = hw.constant -1 : i3
        %true = hw.constant true
        %0 = hw.struct_create (%arg13, %arg14, %arg15) : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
        %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
        %2 = comb.icmp ne %arg8, %c0_i5 : i5
        %3 = comb.extract %arg8 from 2 : (i5) -> i1
        %4 = comb.extract %arg8 from 1 : (i5) -> i1
        %5 = comb.or %3, %4 : i1
        %6 = hw.bitcast %1 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
        %7 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
        %8 = comb.xor %6, %c-1_i3 : i3
        %9 = comb.xor %ip_clk_en_q, %true : i1
        %10 = comb.xor %7, %c-1_i3 : i3
        %11 = comb.and %8, %10 : i3
        %12 = comb.or %11, %6 : i3
        %13 = comb.icmp eq %12, %c-1_i3 : i3
        %14 = comb.and %9, %13 : i1
        %15 = comb.mux %14, %2, %5 : i1
        %c-304_i11 = hw.constant -304 : i11
        %c917_i11 = hw.constant 917 : i11
        %16 = comb.mux %14, %c-304_i11, %c917_i11 : i11
        %c778_i11 = hw.constant 778 : i11
        %17 = comb.mux %15, %c778_i11, %16 : i11
        %18 = comb.extract %17 from 10 : (i11) -> i1
        %19 = comb.extract %17 from 6 : (i11) -> i3
        %20 = comb.extract %17 from 0 : (i11) -> i5
        %21 = comb.concat %18, %19, %20 : i1, i3, i5
        %c138_i9 = hw.constant 138 : i9
        %22 = comb.icmp eq %21, %c138_i9 : i9
        %true_0 = hw.constant true
        %23 = comb.xor %arg9, %true_0 : i1
        %24 = comb.and %23, %22 : i1
        fsm.return %24
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %c0_i5 = hw.constant 0 : i5
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.icmp eq %arg8, %c0_i5 : i5
        %false = hw.constant false
        %false_0 = hw.constant false
        %false_1 = hw.constant false
        %false_2 = hw.constant false
        fsm.update %u_reg_lc_init2Fq_o, %false_1 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false_0 : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %false_2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %low_power_q, %2 : i1
        fsm.update %ip_clk_en_q, %false : i1
      }
    }
    fsm.state @state_778 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %true = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_4, %arg15, %false, %false_0, %false_1, %true, %false_2, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_3, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_ongoing_q, %true : i1
      }
      fsm.transition @state_1647 guard {
        %true = hw.constant true
        %0 = comb.xor %arg9, %true : i1
        fsm.return %0
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_ongoing_q, %true : i1
      }
    }
    fsm.state @state_1744 output {
      %true = hw.constant true
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %1 = comb.xor %arg6, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %2 = comb.extract %arg8 from 0 : (i5) -> i4
      %3 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %2, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %3 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_3, %arg15, %1, %1, %false, %true_0, %false_1, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_2, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %arg6, %true : i1
        %3 = comb.or %2, %ip_clk_en_q : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %4 = comb.and %3, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %4 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %3 : i1
      }
      fsm.transition @state_2425 guard {
        %true = hw.constant true
        %0 = comb.xor %arg6, %true : i1
        %c761_i11 = hw.constant 761 : i11
        %c-836_i11 = hw.constant -836 : i11
        %1 = comb.mux %0, %c761_i11, %c-836_i11 : i11
        %2 = comb.extract %1 from 9 : (i11) -> i2
        %3 = comb.extract %1 from 6 : (i11) -> i1
        %4 = comb.extract %1 from 2 : (i11) -> i1
        %5 = comb.extract %1 from 0 : (i11) -> i1
        %6 = comb.concat %2, %3, %4, %5 : i2, i1, i1, i1
        %c-14_i5 = hw.constant -14 : i5
        %7 = comb.icmp eq %6, %c-14_i5 : i5
        %true_0 = hw.constant true
        %8 = comb.xor %arg9, %true_0 : i1
        %9 = comb.and %8, %7 : i1
        fsm.return %9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %arg6, %true : i1
        %3 = comb.or %2, %ip_clk_en_q : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %4 = comb.and %3, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %4 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %3 : i1
      }
      fsm.transition @state_1523 guard {
        %true = hw.constant true
        %0 = comb.xor %arg6, %true : i1
        %c761_i11 = hw.constant 761 : i11
        %c-836_i11 = hw.constant -836 : i11
        %1 = comb.mux %0, %c761_i11, %c-836_i11 : i11
        %2 = comb.extract %1 from 9 : (i11) -> i2
        %3 = comb.extract %1 from 6 : (i11) -> i1
        %4 = comb.extract %1 from 2 : (i11) -> i1
        %5 = comb.extract %1 from 0 : (i11) -> i1
        %6 = comb.concat %2, %3, %4, %5 : i2, i1, i1, i1
        %c13_i5 = hw.constant 13 : i5
        %7 = comb.icmp eq %6, %c13_i5 : i5
        %true_0 = hw.constant true
        %8 = comb.xor %arg9, %true_0 : i1
        %9 = comb.and %8, %7 : i1
        fsm.return %9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %arg6, %true : i1
        %3 = comb.or %2, %ip_clk_en_q : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %4 = comb.and %3, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %4 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %3 : i1
      }
    }
    fsm.state @state_1647 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_4092 guard {
        %true = hw.constant true
        %0 = comb.xor %arg9, %true : i1
        fsm.return %0
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i2 = hw.constant -1 : i2
        %c5_i4 = hw.constant 5 : i4
        %0 = comb.extract %arg8 from 0 : (i5) -> i1
        %1 = comb.extract %arg8 from 2 : (i5) -> i1
        %2 = comb.extract %arg8 from 1 : (i5) -> i1
        %3 = comb.extract %arg8 from 3 : (i5) -> i1
        %4 = comb.extract %arg8 from 4 : (i5) -> i1
        %5 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %6 = comb.and %5, %strap_sampled_o : i1
        %7 = comb.icmp ne %arg21, %c5_i4 : i4
        %8 = comb.and %3, %7 : i1
        %9 = comb.or %0, %1, %2, %4, %8 : i1
        %10 = comb.replicate %9 : (i1) -> i2
        %false = hw.constant false
        %false_0 = hw.constant false
        %11 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %11 : i1
        fsm.update %strap_sampled_o, %6 : i1
        fsm.update %reset_cause_q, %c-2_i2 : i2
        fsm.update %rst_sys_req_q, %10 : i2
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
      }
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i2 = hw.constant -1 : i2
        %c5_i4 = hw.constant 5 : i4
        %0 = comb.extract %arg8 from 0 : (i5) -> i1
        %1 = comb.extract %arg8 from 2 : (i5) -> i1
        %2 = comb.extract %arg8 from 1 : (i5) -> i1
        %3 = comb.extract %arg8 from 3 : (i5) -> i1
        %4 = comb.extract %arg8 from 4 : (i5) -> i1
        %5 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %6 = comb.and %5, %strap_sampled_o : i1
        %7 = comb.icmp ne %arg21, %c5_i4 : i4
        %8 = comb.and %3, %7 : i1
        %9 = comb.or %0, %1, %2, %4, %8 : i1
        %10 = comb.replicate %9 : (i1) -> i2
        %false = hw.constant false
        %false_0 = hw.constant false
        %11 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %11 : i1
        fsm.update %strap_sampled_o, %6 : i1
        fsm.update %reset_cause_q, %c-2_i2 : i2
        fsm.update %rst_sys_req_q, %10 : i2
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
      }
    }
    fsm.state @state_2425 output {
      %true = hw.constant true
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %1 = comb.and %arg17, %arg19, %arg22 : i1
      %2 = comb.xor %1, %true : i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %3 = comb.extract %arg8 from 0 : (i5) -> i4
      %4 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %3, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %4 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_3, %arg15, %2, %false, %2, %false_0, %false_1, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_2, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.and %arg17, %arg19, %arg22 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %3, %ip_clk_en_q : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %5 = comb.and %4, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %5 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %4 : i1
      }
      fsm.transition @state_1523 guard {
        %0 = comb.and %arg17, %arg19, %arg22 : i1
        %true = hw.constant true
        %1 = comb.xor %0, %true : i1
        %true_0 = hw.constant true
        %2 = comb.xor %arg9, %true_0 : i1
        %3 = comb.and %2, %1 : i1
        fsm.return %3
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.and %arg17, %arg19, %arg22 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %3, %ip_clk_en_q : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %5 = comb.and %4, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %5 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %4 : i1
      }
      fsm.transition @state_1423 guard {
        %true = hw.constant true
        %0 = comb.xor %arg9, %true : i1
        %1 = comb.and %0, %arg17, %arg19, %arg22 : i1
        fsm.return %1
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.and %arg17, %arg19, %arg22 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %3, %ip_clk_en_q : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %5 = comb.and %4, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %5 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %ip_clk_en_q, %4 : i1
      }
    }
    fsm.state @state_4092 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %1 = comb.extract %arg8 from 1 : (i5) -> i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %2 = comb.extract %arg8 from 0 : (i5) -> i4
      %3 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %2, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %3 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %1, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_4092 guard {
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i2 = hw.constant -1 : i2
        %c55_i12 = hw.constant 55 : i12
        %true = hw.constant true
        %0 = comb.extract %arg11 from 1 : (i2) -> i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.extract %arg12 from 1 : (i2) -> i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %1, %3 : i1
        %5 = comb.xor %arg11, %c-1_i2 : i2
        %6 = comb.and %rst_lc_req_q, %5 : i2
        %7 = comb.xor %rst_lc_req_q, %c-1_i2 : i2
        %8 = comb.and %7, %arg11 : i2
        %9 = comb.or %6, %8 : i2
        %10 = comb.icmp eq %9, %c-1_i2 : i2
        %11 = comb.xor %arg12, %c-1_i2 : i2
        %12 = comb.and %rst_sys_req_q, %11 : i2
        %13 = comb.xor %rst_sys_req_q, %c-1_i2 : i2
        %14 = comb.and %13, %arg12 : i2
        %15 = comb.or %12, %14 : i2
        %16 = comb.icmp eq %15, %c-1_i2 : i2
        %17 = comb.extract %arg8 from 1 : (i5) -> i1
        %18 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
        %19 = comb.or %arg7, %4 : i1
        %20 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
        %21 = comb.and %20, %10, %16 : i1
        %22 = comb.mux %18, %19, %21 : i1
        %c-4_i12 = hw.constant -4 : i12
        %23 = comb.xor %17, %true : i1
        %24 = comb.and %22, %23 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.mux %25, %c-4_i12, %c55_i12 : i12
        %27 = comb.extract %26 from 6 : (i12) -> i6
        %28 = comb.extract %26 from 0 : (i12) -> i2
        %29 = comb.extract %26 from 3 : (i12) -> i1
        %30 = comb.concat %27, %29, %28 : i6, i1, i2
        %c-4_i9 = hw.constant -4 : i9
        %31 = comb.icmp eq %30, %c-4_i9 : i9
        %true_0 = hw.constant true
        %32 = comb.xor %arg9, %true_0 : i1
        %33 = comb.and %32, %31 : i1
        fsm.return %33
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
      }
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
      }
      fsm.transition @state_55 guard {
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i2 = hw.constant -1 : i2
        %c55_i12 = hw.constant 55 : i12
        %true = hw.constant true
        %0 = comb.extract %arg11 from 1 : (i2) -> i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.extract %arg12 from 1 : (i2) -> i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %1, %3 : i1
        %5 = comb.xor %arg11, %c-1_i2 : i2
        %6 = comb.and %rst_lc_req_q, %5 : i2
        %7 = comb.xor %rst_lc_req_q, %c-1_i2 : i2
        %8 = comb.and %7, %arg11 : i2
        %9 = comb.or %6, %8 : i2
        %10 = comb.icmp eq %9, %c-1_i2 : i2
        %11 = comb.xor %arg12, %c-1_i2 : i2
        %12 = comb.and %rst_sys_req_q, %11 : i2
        %13 = comb.xor %rst_sys_req_q, %c-1_i2 : i2
        %14 = comb.and %13, %arg12 : i2
        %15 = comb.or %12, %14 : i2
        %16 = comb.icmp eq %15, %c-1_i2 : i2
        %17 = comb.extract %arg8 from 1 : (i5) -> i1
        %18 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
        %19 = comb.or %arg7, %4 : i1
        %20 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
        %21 = comb.and %20, %10, %16 : i1
        %22 = comb.mux %18, %19, %21 : i1
        %c-4_i12 = hw.constant -4 : i12
        %23 = comb.xor %17, %true : i1
        %24 = comb.and %22, %23 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.mux %25, %c-4_i12, %c55_i12 : i12
        %27 = comb.extract %26 from 6 : (i12) -> i6
        %28 = comb.extract %26 from 0 : (i12) -> i2
        %29 = comb.extract %26 from 3 : (i12) -> i1
        %30 = comb.concat %27, %29, %28 : i6, i1, i2
        %c3_i9 = hw.constant 3 : i9
        %31 = comb.icmp eq %30, %c3_i9 : i9
        %true_0 = hw.constant true
        %32 = comb.xor %arg9, %true_0 : i1
        %33 = comb.and %32, %31 : i1
        fsm.return %33
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %2 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %2 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %rst_lc_req_q, %c-1_i2 : i2
      }
    }
    fsm.state @state_1423 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3721 guard {
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.extract %arg11 from 1 : (i2) -> i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.extract %arg12 from 1 : (i2) -> i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %1, %3 : i1
        %5 = comb.xor %arg11, %c-1_i2 : i2
        %6 = comb.and %rst_lc_req_q, %5 : i2
        %7 = comb.xor %rst_lc_req_q, %c-1_i2 : i2
        %8 = comb.and %7, %arg11 : i2
        %9 = comb.or %6, %8 : i2
        %10 = comb.icmp eq %9, %c-1_i2 : i2
        %11 = comb.xor %arg12, %c-1_i2 : i2
        %12 = comb.and %rst_sys_req_q, %11 : i2
        %13 = comb.xor %rst_sys_req_q, %c-1_i2 : i2
        %14 = comb.and %13, %arg12 : i2
        %15 = comb.or %12, %14 : i2
        %16 = comb.icmp eq %15, %c-1_i2 : i2
        %17 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
        %18 = comb.or %arg7, %4 : i1
        %19 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
        %20 = comb.and %19, %10, %16 : i1
        %21 = comb.mux %17, %18, %20 : i1
        %c-188_i11 = hw.constant -188 : i11
        %c711_i11 = hw.constant 711 : i11
        %22 = comb.mux %21, %c-188_i11, %c711_i11 : i11
        %23 = comb.extract %22 from 10 : (i11) -> i1
        %24 = comb.extract %22 from 7 : (i11) -> i2
        %25 = comb.extract %22 from 0 : (i11) -> i2
        %26 = comb.concat %23, %24, %25 : i1, i2, i2
        %c-8_i5 = hw.constant -8 : i5
        %27 = comb.icmp eq %26, %c-8_i5 : i5
        %true_0 = hw.constant true
        %28 = comb.xor %arg9, %true_0 : i1
        %29 = comb.and %28, %27 : i1
        fsm.return %29
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %arg7, %true : i1
        %3 = comb.replicate %2 : (i1) -> i2
        %false = hw.constant false
        %false_0 = hw.constant false
        %4 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %4 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_cause_q, %c1_i2 : i2
        fsm.update %rst_sys_req_q, %3 : i2
        fsm.update %rst_lc_req_q, %3 : i2
      }
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %arg7, %true : i1
        %3 = comb.replicate %2 : (i1) -> i2
        %false = hw.constant false
        %false_0 = hw.constant false
        %4 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %4 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_cause_q, %c1_i2 : i2
        fsm.update %rst_sys_req_q, %3 : i2
        fsm.update %rst_lc_req_q, %3 : i2
      }
      fsm.transition @state_1423 guard {
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.extract %arg11 from 1 : (i2) -> i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.extract %arg12 from 1 : (i2) -> i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %1, %3 : i1
        %5 = comb.xor %arg11, %c-1_i2 : i2
        %6 = comb.and %rst_lc_req_q, %5 : i2
        %7 = comb.xor %rst_lc_req_q, %c-1_i2 : i2
        %8 = comb.and %7, %arg11 : i2
        %9 = comb.or %6, %8 : i2
        %10 = comb.icmp eq %9, %c-1_i2 : i2
        %11 = comb.xor %arg12, %c-1_i2 : i2
        %12 = comb.and %rst_sys_req_q, %11 : i2
        %13 = comb.xor %rst_sys_req_q, %c-1_i2 : i2
        %14 = comb.and %13, %arg12 : i2
        %15 = comb.or %12, %14 : i2
        %16 = comb.icmp eq %15, %c-1_i2 : i2
        %17 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
        %18 = comb.or %arg7, %4 : i1
        %19 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
        %20 = comb.and %19, %10, %16 : i1
        %21 = comb.mux %17, %18, %20 : i1
        %c-188_i11 = hw.constant -188 : i11
        %c711_i11 = hw.constant 711 : i11
        %22 = comb.mux %21, %c-188_i11, %c711_i11 : i11
        %23 = comb.extract %22 from 10 : (i11) -> i1
        %24 = comb.extract %22 from 7 : (i11) -> i2
        %25 = comb.extract %22 from 0 : (i11) -> i2
        %26 = comb.concat %23, %24, %25 : i1, i2, i2
        %c7_i5 = hw.constant 7 : i5
        %27 = comb.icmp eq %26, %c7_i5 : i5
        %true_0 = hw.constant true
        %28 = comb.xor %arg9, %true_0 : i1
        %29 = comb.and %28, %27 : i1
        fsm.return %29
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %req_pwrdn_q, %req_pwrdn_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %2 = comb.xor %arg7, %true : i1
        %3 = comb.replicate %2 : (i1) -> i2
        %false = hw.constant false
        %false_0 = hw.constant false
        %4 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %4 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %reset_cause_q, %c1_i2 : i2
        fsm.update %rst_sys_req_q, %3 : i2
        fsm.update %rst_lc_req_q, %3 : i2
      }
    }
    fsm.state @state_3721 output {
      %0 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %0 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %1 = comb.extract %arg8 from 0 : (i5) -> i4
      %2 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %1, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %2 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
      fsm.output %ack_pwrup_q, %req_pwrdn_q, %false_5, %arg15, %false, %false_0, %false_1, %false_2, %false_3, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false_4, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
    } transitions {
      fsm.transition @state_3721 guard {
        %true = hw.constant true
        %0 = comb.xor %arg5, %true : i1
        %true_0 = hw.constant true
        %1 = comb.xor %arg9, %true_0 : i1
        %2 = comb.and %1, %0 : i1
        fsm.return %2
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %2 = comb.xor %arg5, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %3 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %3 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %req_pwrdn_q, %2 : i1
      }
      fsm.transition @state_3414 guard {
        fsm.return %arg9
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %2 = comb.xor %arg5, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %3 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %3 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %req_pwrdn_q, %2 : i1
      }
      fsm.transition @state_55 guard {
        %true = hw.constant true
        %0 = comb.xor %arg9, %true : i1
        %1 = comb.and %0, %arg5 : i1
        fsm.return %1
      } action {
        fsm.update %u_sync_lc_done2Fu_sync_22Fq_o, %u_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_sync_lc_done2Fu_sync_12Fq_o, %u_slow_sync_lc_done2Fu_sync_22Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_22Fq_o, %u_slow_sync_lc_done2Fu_sync_12Fq_o : i1
        fsm.update %u_slow_sync_lc_done2Fu_sync_12Fq_o, %arg18 : i1
        fsm.update %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i4
        fsm.update %low_power_q, %low_power_q : i1
        fsm.update %reset_cause_q, %reset_cause_q : i2
        fsm.update %rst_sys_req_q, %rst_sys_req_q : i2
        fsm.update %rst_lc_req_q, %rst_lc_req_q : i2
        fsm.update %ip_clk_en_q, %ip_clk_en_q : i1
        fsm.update %reset_ongoing_q, %reset_ongoing_q : i1
        fsm.update %ack_pwrup_q, %ack_pwrup_q : i1
        %c-1_i2 = hw.constant -1 : i2
        %0 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
        %1 = comb.and %0, %strap_sampled_o : i1
        %true = hw.constant true
        %2 = comb.xor %arg5, %true : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %3 = comb.and %ip_clk_en_q, %arg10 : i1
        fsm.update %u_reg_lc_init2Fq_o, %false_0 : i1
        fsm.update %u_reg_otp_init2Fq_o, %false : i1
        fsm.update %u_usb_ip_clk_en2Fq_o, %3 : i1
        fsm.update %strap_sampled_o, %1 : i1
        fsm.update %req_pwrdn_q, %2 : i1
      }
    }
  }
}

