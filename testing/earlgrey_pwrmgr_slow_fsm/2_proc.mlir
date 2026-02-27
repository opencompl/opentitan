module {
  hw.module @pwrmgr_slow_fsm(in %clk_i : i1, in %rst_ni : i1, in %rst_main_ni : i1, in %wakeup_i : i1, in %reset_req_i : i1, out req_pwrup_o : i1, out pwrup_cause_toggle_o : i1, out pwrup_cause_o : i2, in %ack_pwrup_i : i1, in %req_pwrdn_i : i1, out ack_pwrdn_o : i1, out rst_req_o : i1, out fsm_invalid_o : i1, in %clr_req_i : i1, out usb_ip_clk_en_o : i1, in %usb_ip_clk_status_i : i1, in %main_pd_ni : i1, in %main_clk_en_i : i1, in %io_clk_en_i : i1, in %usb_clk_en_lp_i : i1, in %usb_clk_en_active_i : i1, in %ast_i.slow_clk_val : i1, in %ast_i.core_clk_val : i1, in %ast_i.io_clk_val : i1, in %ast_i.usb_clk_val : i1, in %ast_i.main_pok : i1, out ast_o.main_pd_n : i1, out ast_o.pwr_clamp_env : i1, out ast_o.pwr_clamp : i1, out ast_o.slow_clk_en : i1, out ast_o.core_clk_en : i1, out ast_o.io_clk_en : i1, out ast_o.usb_clk_en : i1) {
    %c0_i2 = hw.constant 0 : i2
    %false = hw.constant false
    %c34_i10 = hw.constant 34 : i10
    %c0_i10 = hw.constant 0 : i10
    %true = hw.constant true
    %0 = hw.struct_create (%pd_nq, %true, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q, %u_usb_clk_en2Fq_o) : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>
    %main_pd_n, %pwr_clamp_env, %pwr_clamp, %slow_clk_en, %core_clk_en, %io_clk_en, %usb_clk_en = hw.struct_explode %0 : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>
    %1 = comb.and %main_pd_ni, %main_clk_en_i : i1
    %2 = comb.and %main_pd_ni, %io_clk_en_i : i1
    %3 = comb.and %main_pd_ni, %usb_clk_en_lp_i : i1
    %4 = comb.or %fsm_invalid_q, %1 : i1
    %5 = comb.or %fsm_invalid_q, %2 : i1
    %6 = comb.or %fsm_invalid_q, %3 : i1
    %7 = seq.to_clock %clk_i
    %8 = comb.xor %rst_ni, %true : i1
    %pd_nq = seq.compreg %false, %7 reset %8, %true : i1  
    %pwr_clamp_q = seq.compreg %true, %7 reset %8, %true : i1  
    %main_clk_en_q = seq.compreg %4, %7 reset %8, %false : i1  
    %io_clk_en_q = seq.compreg %5, %7 reset %8, %false : i1  
    %usb_clk_en_q = seq.compreg %6, %7 reset %8, %false : i1  
    %fsm_invalid_q = seq.compreg %true, %7 reset %8, %false : i1  
    %state_d = seq.compreg %c34_i10, %7 reset %8, %c0_i10 : i10  
    %9 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
    %10 = comb.xor %rst_main_ni, %true : i1
    %async_main_pok_st = seq.compreg %ast_i.main_pok, %7 reset %10, %false : i1  
    %11 = seq.to_clock %clk_i
    %12 = comb.xor %rst_ni, %true : i1
    %u_main_pok_sync2Fu_sync_12Fq_o = seq.compreg name "u_main_pok_sync/u_sync_1/q_o" %async_main_pok_st, %11 reset %12, %false : i1  
    %13 = seq.to_clock %clk_i
    %14 = comb.xor %rst_ni, %true : i1
    %u_main_pok_sync2Fu_sync_22Fq_o = seq.compreg name "u_main_pok_sync/u_sync_2/q_o" %u_main_pok_sync2Fu_sync_12Fq_o, %13 reset %14, %false : i1  
    %mon_main_pok = seq.compreg %false, %7 reset %8, %false : i1  
    %15 = comb.and %mon_main_pok, %9 : i1
    %16 = comb.or %rst_req_o, %15 : i1
    %17 = comb.xor %clr_req_i, %true : i1
    %18 = comb.and %17, %16 : i1
    %rst_req_o = seq.compreg %18, %7 reset %8, %false : i1  
    %19 = comb.or %usb_clk_en_q, %usb_ip_clk_status_i : i1
    %20 = seq.to_clock %clk_i
    %21 = comb.xor %rst_ni, %true : i1
    %u_usb_clk_en2Fq_o = seq.compreg name "u_usb_clk_en/q_o" %19, %20 reset %21, %false : i1  
    %22 = comb.xor %15, %true : i1
    verif.assert %22 : i1
    hw.output %false, %false, %c0_i2, %false, %rst_req_o, %fsm_invalid_q, %usb_clk_en_q, %main_pd_n, %pwr_clamp_env, %pwr_clamp, %slow_clk_en, %core_clk_en, %io_clk_en, %usb_clk_en : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
  }
}

