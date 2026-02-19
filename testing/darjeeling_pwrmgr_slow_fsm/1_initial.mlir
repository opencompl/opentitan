module {
  hw.module @pwrmgr_slow_fsm(in %clk_i : i1, in %rst_ni : i1, in %rst_main_ni : i1, in %wakeup_i : i1, in %reset_req_i : i1, out req_pwrup_o : i1, out pwrup_cause_toggle_o : i1, out pwrup_cause_o : i2, in %ack_pwrup_i : i1, in %req_pwrdn_i : i1, out ack_pwrdn_o : i1, out rst_req_o : i1, out fsm_invalid_o : i1, in %clr_req_i : i1, in %main_pd_ni : i1, in %main_clk_en_i : i1, in %io_clk_en_i : i1, in %ast_i : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, main_pok: i1>, out ast_o : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1>) {
    %true = hw.constant true
    %c0_i10 = hw.constant 0 : i10
    %c34_i10 = hw.constant 34 : i10
    %false = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %0 = hw.struct_create (%pd_nq, %true, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q) : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1>
    %1 = comb.and %main_pd_ni, %main_clk_en_i {sv.namehint = "main_clk_en"} : i1
    %2 = comb.and %main_pd_ni, %io_clk_en_i {sv.namehint = "io_clk_en"} : i1
    %3 = comb.or %fsm_invalid_q, %1 : i1
    %4 = comb.or %fsm_invalid_q, %2 : i1
    %5 = seq.to_clock %clk_i
    %6 = comb.xor %rst_ni, %true : i1
    %pd_nq = seq.firreg %false clock %5 reset async %6, %true : i1
    %pwr_clamp_q = seq.firreg %true clock %5 reset async %6, %true : i1
    %main_clk_en_q = seq.firreg %3 clock %5 reset async %6, %false : i1
    %io_clk_en_q = seq.firreg %4 clock %5 reset async %6, %false : i1
    %fsm_invalid_q = seq.firreg %true clock %5 reset async %6, %false : i1
    %state_d = seq.firreg %c34_i10 clock %5 reset async %6, %c0_i10 : i10
    %7 = comb.xor %u_main_pok_sync.q_o, %true : i1
    %main_pok = hw.struct_extract %ast_i["main_pok"] : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, main_pok: i1>
    %8 = comb.xor %rst_main_ni, %true : i1
    %async_main_pok_st = seq.firreg %main_pok clock %5 reset async %8, %false : i1
    %u_main_pok_sync.q_o = hw.instance "u_main_pok_sync" @prim_flop_2sync(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %async_main_pok_st: i1) -> (q_o: i1)
    %mon_main_pok = seq.firreg %false clock %5 reset async %6, %false : i1
    %9 = comb.and %mon_main_pok, %7 : i1
    %10 = comb.or %rst_req_o, %9 : i1
    %11 = comb.xor %clr_req_i, %true : i1
    %12 = comb.and %11, %10 : i1
    %rst_req_o = seq.firreg %12 clock %5 reset async %6, %false : i1
    %13 = comb.xor %9, %true : i1
    verif.clocked_assert %13, posedge %clk_i : i1
    hw.output %false, %false, %c0_i2, %false, %rst_req_o, %fsm_invalid_q, %0 : i1, i1, i2, i1, i1, i1, !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1>
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
