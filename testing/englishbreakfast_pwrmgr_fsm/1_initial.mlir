module {
  hw.module @pwrmgr_fsm(in %clk_i : i1, in %rst_ni : i1, in %clk_slow_i : i1, in %rst_slow_ni : i1, in %req_pwrup_i : i1, in %pwrup_cause_i : i2, out ack_pwrup_o : i1, out req_pwrdn_o : i1, in %ack_pwrdn_i : i1, in %low_power_entry_i : i1, in %main_pd_ni : i1, in %reset_reqs_i : i5, in %fsm_invalid_i : i1, out clr_slow_req_o : i1, in %usb_ip_clk_en_i : i1, out usb_ip_clk_status_o : i1, out wkup_o : i1, out fall_through_o : i1, out abort_o : i1, out clr_hint_o : i1, out clr_cfg_lock_o : i1, out pwr_rst_o : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>, in %pwr_rst_i : !hw.struct<rst_lc_src_n: i2, rst_sys_src_n: i2>, out ips_clk_en_o : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>, in %clk_en_status_i : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>, out otp_init_o : i1, in %otp_done_i : i1, in %otp_idle_i : i1, out lc_init_o : i1, in %lc_done_i : i1, in %lc_idle_i : i1, in %lc_dft_en_i : i4, in %lc_hw_debug_en_i : i4, in %flash_idle_i : i1, in %rom_ctrl_done_i : i4, in %rom_ctrl_good_i : i4, out strap_o : i1, out strap_sampled_o : i1, out low_power_o : i1, out fetch_en_o : i4) {
    %true = hw.constant true
    %c0_i12 = hw.constant 0 : i12
    %c55_i12 = hw.constant 55 : i12
    %c-1_i2 = hw.constant -1 : i2
    %false = hw.constant false
    %0 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %6, %c-1_i2) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
    %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en.q_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
    %2 = seq.to_clock %clk_i
    %3 = comb.xor %rst_ni, %true : i1
    %ip_clk_en_q = seq.firreg %false clock %2 reset async %3, %false : i1
    %rst_lc_req_q = seq.firreg %c-1_i2 clock %2 reset async %3, %c-1_i2 : i2
    %rst_sys_req_q = seq.firreg %c-1_i2 clock %2 reset async %3, %c-1_i2 : i2
    %state_d = seq.firreg %c55_i12 clock %2 reset async %3, %c0_i12 : i12
    %4 = comb.icmp ne %rst_sys_req_q, %c-1_i2 : i2
    %5 = comb.and %4, %strap_sampled_o : i1
    %strap_sampled_o = seq.firreg %5 clock %2 reset async %3, %false : i1
    %u_fetch_en.lc_en_o = hw.instance "u_fetch_en" @prim_lc_sender(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, lc_en_i: %u_fetch_en.lc_en_o: i4) -> (lc_en_o: i4)
    %u_slow_sync_lc_done.q_o = hw.instance "u_slow_sync_lc_done" @prim_flop_2sync(clk_i: %clk_slow_i: i1, rst_ni: %rst_slow_ni: i1, d_i: %lc_done_i: i1) -> (q_o: i1) {sv.namehint = "slow_lc_done"}
    %u_sync_lc_done.q_o = hw.instance "u_sync_lc_done" @prim_flop_2sync(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %u_slow_sync_lc_done.q_o: i1) -> (q_o: i1)
    %6 = comb.extract %reset_reqs_i from 0 : (i5) -> i4
    %u_usb_ip_clk_en.q_o = hw.instance "u_usb_ip_clk_en" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %false: i1) -> (q_o: i1)
    %usb_status = hw.struct_extract %clk_en_status_i["usb_status"] : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
    %u_reg_otp_init.q_o = hw.instance "u_reg_otp_init" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %false: i1) -> (q_o: i1)
    %u_reg_lc_init.q_o = hw.instance "u_reg_lc_init" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %false: i1) -> (q_o: i1)
    hw.output %false, %false, %false, %usb_status, %false, %false, %false, %false, %false, %0, %1, %u_reg_otp_init.q_o, %u_reg_lc_init.q_o, %false, %strap_sampled_o, %true, %u_fetch_en.lc_en_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>, !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>, i1, i1, i1, i1, i1, i4
  }
  hw.module private @prim_lc_sender(in %clk_i : i1, in %rst_ni : i1, in %lc_en_i : i4, out lc_en_o : i4) {
    %gen_flops.u_prim_flop.q_o = hw.instance "gen_flops.u_prim_flop" @prim_sec_anchor_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %lc_en_i: i4) -> (q_o: i4) {sv.namehint = "lc_en_out"}
    hw.output %gen_flops.u_prim_flop.q_o : i4
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
  hw.module private @prim_flop_0(in %clk_i : i1, in %rst_ni : i1, in %d_i : i4, out q_o : i4) {
    %true = hw.constant true
    %c-6_i4 = hw.constant -6 : i4
    %0 = seq.to_clock %clk_i
    %1 = comb.xor %rst_ni, %true : i1
    %q_o = seq.firreg %d_i clock %0 reset async %1, %c-6_i4 : i4
    hw.output %q_o : i4
  }
  hw.module private @prim_sec_anchor_flop(in %clk_i : i1, in %rst_ni : i1, in %d_i : i4, out q_o : i4) {
    %u_secure_anchor_flop.q_o = hw.instance "u_secure_anchor_flop" @prim_flop_0(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %d_i: i4) -> (q_o: i4)
    hw.output %u_secure_anchor_flop.q_o : i4
  }
}
