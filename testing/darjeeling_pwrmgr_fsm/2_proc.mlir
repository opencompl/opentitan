module {
  hw.module @pwrmgr_fsm(in %clk_i : i1, in %rst_ni : i1, in %clk_slow_i : i1, in %rst_slow_ni : i1, in %req_pwrup_i : i1, in %pwrup_cause_i : i2, out ack_pwrup_o : i1, out req_pwrdn_o : i1, in %ack_pwrdn_i : i1, in %low_power_entry_i : i1, in %main_pd_ni : i1, in %reset_reqs_i : i6, in %fsm_invalid_i : i1, out clr_slow_req_o : i1, out wkup_o : i1, out fall_through_o : i1, out abort_o : i1, out clr_hint_o : i1, out clr_cfg_lock_o : i1, in %int_reset_req_i : i1, in %ext_rst_ack_i : i1, out pwr_rst_o.rst_lc_req : i2, out pwr_rst_o.rst_sys_req : i2, out pwr_rst_o.rstreqs : i5, out pwr_rst_o.reset_cause : i2, in %pwr_rst_i.rst_lc_src_n : i2, in %pwr_rst_i.rst_sys_src_n : i2, out ips_clk_en_o.main_ip_clk_en : i1, out ips_clk_en_o.io_ip_clk_en : i1, in %clk_en_status_i.main_status : i1, in %clk_en_status_i.io_status : i1, out otp_init_o : i1, in %otp_done_i : i1, in %otp_idle_i : i1, out lc_init_o : i1, in %lc_done_i : i1, in %lc_idle_i : i1, in %lc_dft_en_i : i4, in %lc_hw_debug_en_i : i4, in %flash_idle_i : i1, in %rom_ctrl_done_i : i4, in %rom_ctrl_good_i : i4, out strap_o : i1, out strap_sampled_o : i1, out low_power_o : i1, out fetch_en_o : i4) {
    %c-6_i4 = hw.constant -6 : i4
    %true = hw.constant true
    %c0_i12 = hw.constant 0 : i12
    %c55_i12 = hw.constant 55 : i12
    %c-1_i2 = hw.constant -1 : i2
    %false = hw.constant false
    %0 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %19, %c-1_i2) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %0 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
    %main_ip_clk_en, %io_ip_clk_en = hw.struct_explode %1 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
    %2 = comb.xor %ext_rst_ack_i, %true : i1
    %3 = comb.and %ext_rst_pending_q, %2, %ext_rst_req_q : i1
    %4 = comb.or %int_reset_req_i, %ext_rst_pending_q : i1
    %5 = comb.xor %3, %true : i1
    %6 = comb.and %5, %4 : i1
    %7 = seq.to_clock %clk_i
    %8 = comb.xor %rst_ni, %true : i1
    %ext_rst_req_q = seq.compreg %ext_rst_ack_i, %7 reset %8, %false : i1  
    %ext_rst_pending_q = seq.compreg %6, %7 reset %8, %false : i1  
    %ip_clk_en_q = seq.compreg %false, %7 reset %8, %false : i1  
    %rst_lc_req_q = seq.compreg %c-1_i2, %7 reset %8, %c-1_i2 : i2  
    %rst_sys_req_q = seq.compreg %c-1_i2, %7 reset %8, %c-1_i2 : i2  
    %state_d = seq.compreg %c55_i12, %7 reset %8, %c0_i12 : i12  
    %9 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
    %10 = comb.and %9, %strap_sampled_o : i1
    %strap_sampled_o = seq.compreg %10, %7 reset %8, %false : i1  
    %11 = seq.to_clock %clk_slow_i
    %12 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_1/q_o" %lc_done_i, %11 reset %12, %false : i1  
    %13 = seq.to_clock %clk_slow_i
    %14 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_2/q_o" %u_slow_sync_lc_done2Fu_sync_12Fq_o, %13 reset %14, %false : i1  
    %15 = seq.to_clock %clk_i
    %16 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_sync_lc_done/u_sync_1/q_o" %u_slow_sync_lc_done2Fu_sync_22Fq_o, %15 reset %16, %false : i1  
    %17 = seq.to_clock %clk_i
    %18 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_sync_lc_done/u_sync_2/q_o" %u_sync_lc_done2Fu_sync_12Fq_o, %17 reset %18, %false : i1  
    %19 = comb.extract %reset_reqs_i from 0 : (i6) -> i5
    %20 = seq.to_clock %clk_i
    %21 = comb.xor %rst_ni, %true : i1
    %u_reg_otp_init2Fq_o = seq.compreg name "u_reg_otp_init/q_o" %false, %20 reset %21, %false : i1  
    %22 = seq.to_clock %clk_i
    %23 = comb.xor %rst_ni, %true : i1
    %u_reg_lc_init2Fq_o = seq.compreg name "u_reg_lc_init/q_o" %false, %22 reset %23, %false : i1  
    hw.output %false, %false, %false, %false, %false, %false, %false, %false, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %false, %strap_sampled_o, %true, %c-6_i4 : i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i5, i2, i1, i1, i1, i1, i1, i1, i1, i4
  }
}

