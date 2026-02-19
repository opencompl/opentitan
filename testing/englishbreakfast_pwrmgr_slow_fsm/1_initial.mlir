module {
  hw.module @pwrmgr_slow_fsm(in %clk_i : i1, in %rst_ni : i1, in %rst_main_ni : i1, in %wakeup_i : i1, in %reset_req_i : i1, out req_pwrup_o : i1, out pwrup_cause_toggle_o : i1, out pwrup_cause_o : i2, in %ack_pwrup_i : i1, in %req_pwrdn_i : i1, out ack_pwrdn_o : i1, out rst_req_o : i1, out fsm_invalid_o : i1, in %clr_req_i : i1, out usb_ip_clk_en_o : i1, in %usb_ip_clk_status_i : i1, in %main_pd_ni : i1, in %main_clk_en_i : i1, in %io_clk_en_i : i1, in %usb_clk_en_lp_i : i1, in %usb_clk_en_active_i : i1, in %ast_i : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, usb_clk_val: i1, main_pok: i1>, out ast_o : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>) {
    %true = hw.constant true
    %c0_i10 = hw.constant 0 : i10
    %c34_i10 = hw.constant 34 : i10
    %false = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %0 = hw.struct_create (%pd_nq, %true, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q, %u_usb_clk_en.q_o) : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>
    %1 = comb.and %main_pd_ni, %main_clk_en_i {sv.namehint = "main_clk_en"} : i1
    %2 = comb.and %main_pd_ni, %io_clk_en_i {sv.namehint = "io_clk_en"} : i1
    %3 = comb.and %main_pd_ni, %usb_clk_en_lp_i : i1
    %4 = comb.or %fsm_invalid_q, %1 : i1
    %5 = comb.or %fsm_invalid_q, %2 : i1
    %6 = comb.or %fsm_invalid_q, %3 : i1
    %7 = seq.to_clock %clk_i
    %8 = comb.xor %rst_ni, %true : i1
    %pd_nq = seq.firreg %false clock %7 reset async %8, %true : i1
    %pwr_clamp_q = seq.firreg %true clock %7 reset async %8, %true : i1
    %main_clk_en_q = seq.firreg %4 clock %7 reset async %8, %false : i1
    %io_clk_en_q = seq.firreg %5 clock %7 reset async %8, %false : i1
    %usb_clk_en_q = seq.firreg %6 clock %7 reset async %8, %false : i1
    %fsm_invalid_q = seq.firreg %true clock %7 reset async %8, %false : i1
    %state_d = seq.firreg %c34_i10 clock %7 reset async %8, %c0_i10 : i10
    %9 = comb.xor %u_main_pok_sync.q_o, %true : i1
    %main_pok = hw.struct_extract %ast_i["main_pok"] : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, usb_clk_val: i1, main_pok: i1>
    %10 = comb.xor %rst_main_ni, %true : i1
    %async_main_pok_st = seq.firreg %main_pok clock %7 reset async %10, %false : i1
    %u_main_pok_sync.q_o = hw.instance "u_main_pok_sync" @prim_flop_2sync(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %async_main_pok_st: i1) -> (q_o: i1)
    %mon_main_pok = seq.firreg %false clock %7 reset async %8, %false : i1
    %11 = comb.and %mon_main_pok, %9 : i1
    %12 = comb.or %rst_req_o, %11 : i1
    %13 = comb.xor %clr_req_i, %true : i1
    %14 = comb.and %13, %12 : i1
    %rst_req_o = seq.firreg %14 clock %7 reset async %8, %false : i1
    %15 = comb.or %usb_clk_en_q, %usb_ip_clk_status_i : i1
    %u_usb_clk_en.q_o = hw.instance "u_usb_clk_en" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %15: i1) -> (q_o: i1)
    %16 = comb.xor %11, %true : i1
    verif.clocked_assert %16, posedge %clk_i : i1
    hw.output %false, %false, %c0_i2, %false, %rst_req_o, %fsm_invalid_q, %usb_clk_en_q, %0 : i1, i1, i2, i1, i1, i1, i1, !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>
  }
  hw.module private @prim_flop_2sync(in %clk_i : i1, in %rst_ni : i1, in %d_i : i1, out q_o : i1) {
    %u_sync_1.q_o = hw.instance "u_sync_1" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %d_i: i1) -> (q_o: i1) {sv.namehint = "intq"}
    %u_sync_2.q_o = hw.instance "u_sync_2" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %u_sync_1.q_o: i1) -> (q_o: i1)
    hw.output %u_sync_2.q_o : i1
  }
  hw.module private @prim_flop(in %clk_i : i1, in %rst_ni : i1, in %d_i : i1, out q_o : i1) {
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.to_clock %clk_i
    %1 = comb.xor %rst_ni, %true : i1
    %q_o = seq.firreg %d_i clock %0 reset async %1, %false : i1
    hw.output %q_o : i1
  }
}
