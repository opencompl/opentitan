module {
  hw.module @pwrmgr_fsm(in %clk_i : i1, in %rst_ni : i1, in %clk_slow_i : i1, in %rst_slow_ni : i1, in %req_pwrup_i : i1, in %pwrup_cause_i : i2, out ack_pwrup_o : i1, out req_pwrdn_o : i1, in %ack_pwrdn_i : i1, in %low_power_entry_i : i1, in %main_pd_ni : i1, in %reset_reqs_i : i6, in %fsm_invalid_i : i1, out clr_slow_req_o : i1, out wkup_o : i1, out fall_through_o : i1, out abort_o : i1, out clr_hint_o : i1, out clr_cfg_lock_o : i1, in %int_reset_req_i : i1, in %ext_rst_ack_i : i1, out pwr_rst_o : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>, in %pwr_rst_i : !hw.struct<rst_lc_src_n: i2, rst_sys_src_n: i2>, out ips_clk_en_o : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>, in %clk_en_status_i : !hw.struct<main_status: i1, io_status: i1>, out otp_init_o : i1, in %otp_done_i : i1, in %otp_idle_i : i1, out lc_init_o : i1, in %lc_done_i : i1, in %lc_idle_i : i1, in %lc_dft_en_i : i4, in %lc_hw_debug_en_i : i4, in %flash_idle_i : i1, in %rom_ctrl_done_i : i4, in %rom_ctrl_good_i : i4, out strap_o : i1, out strap_sampled_o : i1, out low_power_o : i1, out fetch_en_o : i4) {
    %c0_i3 = hw.constant 0 : i3
    %true = hw.constant true
    %c0_i31 = hw.constant 0 : i31
    %c0_i6 = hw.constant 0 : i6
    %c-682_i12 = hw.constant -682 : i12
    %c-4_i12 = hw.constant -4 : i12
    %c1647_i12 = hw.constant 1647 : i12
    %c-375_i12 = hw.constant -375 : i12
    %c2_i32 = hw.constant 2 : i32
    %c1_i32 = hw.constant 1 : i32
    %c1423_i12 = hw.constant 1423 : i12
    %c-1671_i12 = hw.constant -1671 : i12
    %c1744_i12 = hw.constant 1744 : i12
    %c778_i12 = hw.constant 778 : i12
    %c917_i12 = hw.constant 917 : i12
    %c-6_i4 = hw.constant -6 : i4
    %c5_i4 = hw.constant 5 : i4
    %c868_i12 = hw.constant 868 : i12
    %c1028_i12 = hw.constant 1028 : i12
    %c1523_i12 = hw.constant 1523 : i12
    %c-966_i12 = hw.constant -966 : i12
    %c168_i12 = hw.constant 168 : i12
    %c-1453_i12 = hw.constant -1453 : i12
    %c-94_i12 = hw.constant -94 : i12
    %c0_i2 = hw.constant 0 : i2
    %c-1600_i12 = hw.constant -1600 : i12
    %c-1330_i12 = hw.constant -1330 : i12
    %c-7_i4 = hw.constant -7 : i4
    %c6_i4 = hw.constant 6 : i4
    %c55_i12 = hw.constant 55 : i12
    %c-1_i2 = hw.constant -1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c1_i2 = hw.constant 1 : i2
    %false = hw.constant false
    %0 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %102, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
    %rst_lc_src_n = hw.struct_extract %pwr_rst_i["rst_lc_src_n"] : !hw.struct<rst_lc_src_n: i2, rst_sys_src_n: i2>
    %2 = comb.extract %rst_lc_src_n from 1 : (i2) -> i1
    %3 = comb.xor %2, %true : i1
    %rst_sys_src_n = hw.struct_extract %pwr_rst_i["rst_sys_src_n"] : !hw.struct<rst_lc_src_n: i2, rst_sys_src_n: i2>
    %4 = comb.extract %rst_sys_src_n from 1 : (i2) -> i1
    %5 = comb.xor %4, %true : i1
    %6 = comb.and %3, %5 : i1
    %7 = comb.xor %rst_lc_src_n, %c-1_i2 : i2
    %8 = comb.and %rst_lc_req_q, %7 : i2
    %9 = comb.xor %rst_lc_req_q, %c-1_i2 : i2
    %10 = comb.and %9, %rst_lc_src_n : i2
    %11 = comb.or %8, %10 : i2
    %12 = comb.icmp eq %11, %c-1_i2 {sv.namehint = "lc_rsts_valid"} : i2
    %13 = comb.xor %rst_sys_src_n, %c-1_i2 : i2
    %14 = comb.and %rst_sys_req_q, %13 : i2
    %15 = comb.xor %rst_sys_req_q, %c-1_i2 : i2
    %16 = comb.and %15, %rst_sys_src_n : i2
    %17 = comb.or %14, %16 : i2
    %18 = comb.icmp eq %17, %c-1_i2 {sv.namehint = "sys_rsts_valid"} : i2
    %19 = comb.icmp ne %reset_reqs_i, %c0_i6 : i6
    %20 = comb.extract %reset_reqs_i from 0 : (i6) -> i2
    %21 = comb.icmp ne %20, %c0_i2 : i2
    %22 = comb.extract %reset_reqs_i from 3 : (i6) -> i1
    %23 = comb.extract %reset_reqs_i from 2 : (i6) -> i1
    %24 = comb.or %22, %23 : i1
    %25 = comb.extract %reset_reqs_i from 4 : (i6) -> i1
    %26 = comb.extract %reset_reqs_i from 5 : (i6) -> i1
    %27 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
    %28 = comb.or %main_pd_ni, %6 : i1
    %29 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
    %30 = comb.and %29, %12, %18 : i1
    %31 = comb.mux %27, %28, %30 : i1
    %32 = comb.xor %ext_rst_ack_i, %true : i1
    %33 = comb.and %ext_rst_pending_q, %32, %ext_rst_req_q : i1
    %34 = comb.or %int_reset_req_i, %ext_rst_pending_q : i1
    %35 = comb.xor %33, %true : i1
    %36 = comb.and %35, %34 : i1
    %37 = seq.to_clock %clk_i
    %38 = comb.xor %rst_ni, %true : i1
    %ext_rst_req_q = seq.firreg %ext_rst_ack_i clock %37 reset async %38, %false : i1
    %ext_rst_pending_q = seq.firreg %36 clock %37 reset async %38, %false : i1
    %ack_pwrup_q = seq.firreg %101#10 clock %37 reset async %38, %false : i1
    %req_pwrdn_q = seq.firreg %101#11 clock %37 reset async %38, %false : i1
    %reset_ongoing_q = seq.firreg %101#12 clock %37 reset async %38, %false : i1
    %ip_clk_en_q = seq.firreg %101#13 clock %37 reset async %38, %false : i1
    %rst_lc_req_q = seq.firreg %101#14 clock %37 reset async %38, %c-1_i2 : i2
    %rst_sys_req_q = seq.firreg %101#15 clock %37 reset async %38, %c-1_i2 : i2
    %reset_cause_q = seq.firreg %101#16 clock %37 reset async %38, %c-1_i2 : i2
    %low_power_q = seq.firreg %101#17 clock %37 reset async %38, %true : i1
    %state_q = seq.firreg %101#9 clock %37 reset async %38, %c55_i12 : i12
    %39 = comb.icmp eq %rst_sys_req_q, %c-1_i2 : i2
    %40 = comb.xor %39, %true : i1
    %41 = comb.and %40, %101#7 : i1
    %42 = comb.or %39, %101#7 : i1
    %43 = comb.mux bin %42, %41, %strap_sampled_o : i1
    %strap_sampled_o = seq.firreg %43 clock %37 reset async %38, %false : i1
    %u_fetch_en.lc_en_o = hw.instance "u_fetch_en" @prim_lc_sender(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, lc_en_i: %101#18: i4) -> (lc_en_o: i4)
    %u_slow_sync_lc_done.q_o = hw.instance "u_slow_sync_lc_done" @prim_flop_2sync(clk_i: %clk_slow_i: i1, rst_ni: %rst_slow_ni: i1, d_i: %lc_done_i: i1) -> (q_o: i1) {sv.namehint = "slow_lc_done"}
    %u_sync_lc_done.q_o = hw.instance "u_sync_lc_done" @prim_flop_2sync(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %u_slow_sync_lc_done.q_o: i1) -> (q_o: i1)
    %44 = hw.bitcast %1 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>) -> i2
    %45 = hw.bitcast %clk_en_status_i : (!hw.struct<main_status: i1, io_status: i1>) -> i2
    %46 = comb.and %44, %45 : i2
    %47 = comb.xor %44, %c-1_i2 : i2
    %48 = comb.or %46, %47 : i2
    %49 = comb.icmp eq %48, %c-1_i2 : i2
    %50 = comb.and %ip_clk_en_q, %49 : i1
    %51 = comb.xor %ip_clk_en_q, %true : i1
    %52 = comb.xor %45, %c-1_i2 : i2
    %53 = comb.and %47, %52 : i2
    %54 = comb.or %53, %44 : i2
    %55 = comb.icmp eq %54, %c-1_i2 : i2
    %56 = comb.and %51, %55 : i1
    %57 = comb.extract %lc_dft_en_i from 0 : (i4) -> i1
    %58 = comb.extract %lc_hw_debug_en_i from 0 : (i4) -> i1
    %59 = comb.and %57, %58 : i1
    %60 = comb.extract %lc_dft_en_i from 1 : (i4) -> i1
    %61 = comb.extract %lc_hw_debug_en_i from 1 : (i4) -> i1
    %62 = comb.or %60, %61 : i1
    %63 = comb.concat %false, %59 : i1, i1
    %64 = comb.concat %62, %false : i1, i1
    %65 = comb.or %63, %64 : i2
    %66 = comb.extract %lc_dft_en_i from 2 : (i4) -> i1
    %67 = comb.extract %lc_hw_debug_en_i from 2 : (i4) -> i1
    %68 = comb.and %66, %67 : i1
    %69 = comb.concat %false, %65 : i1, i2
    %70 = comb.concat %68, %c0_i2 : i1, i2
    %71 = comb.or %69, %70 : i3
    %72 = comb.extract %lc_dft_en_i from 3 : (i4) -> i1
    %73 = comb.extract %lc_hw_debug_en_i from 3 : (i4) -> i1
    %74 = comb.or %72, %73 : i1
    %75 = comb.concat %false, %71 : i1, i3
    %76 = comb.concat %74, %c0_i3 : i1, i3
    %77 = comb.or %75, %76 : i4
    %78 = comb.icmp eq %77, %c5_i4 : i4
    %79 = comb.mux %78, %c6_i4, %c-7_i4 {sv.namehint = "rom_intg_chk_dis"} : i4
    %80 = comb.extract %79 from 0 : (i4) -> i1
    %81 = comb.extract %rom_ctrl_good_i from 0 : (i4) -> i1
    %82 = comb.and %80, %81 : i1
    %83 = comb.extract %79 from 1 : (i4) -> i1
    %84 = comb.extract %rom_ctrl_good_i from 1 : (i4) -> i1
    %85 = comb.or %83, %84 : i1
    %86 = comb.concat %false, %82 : i1, i1
    %87 = comb.concat %85, %false : i1, i1
    %88 = comb.or %86, %87 : i2
    %89 = comb.extract %79 from 2 : (i4) -> i1
    %90 = comb.extract %rom_ctrl_good_i from 2 : (i4) -> i1
    %91 = comb.or %89, %90 : i1
    %92 = comb.concat %false, %88 : i1, i2
    %93 = comb.concat %91, %c0_i2 : i1, i2
    %94 = comb.or %92, %93 : i3
    %95 = comb.extract %79 from 3 : (i4) -> i1
    %96 = comb.extract %rom_ctrl_good_i from 3 : (i4) -> i1
    %97 = comb.and %95, %96 : i1
    %98 = comb.concat %false, %94 : i1, i3
    %99 = comb.concat %97, %c0_i3 : i1, i3
    %100 = comb.or %98, %99 : i4
    %101:19 = llhd.combinational -> i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4 {
      %103 = comb.icmp ceq %state_q, %c55_i12 : i12
      cf.cond_br %103, ^bb1(%req_pwrup_i, %reset_ongoing_q, %reset_cause_q, %u_fetch_en.lc_en_o, %c-1330_i12, %u_fetch_en.lc_en_o : i1, i1, i2, i4, i12, i4), ^bb2
    ^bb1(%104: i1, %105: i1, %106: i2, %107: i4, %108: i12, %109: i4):  // 2 preds: ^bb0, ^bb16
      %110 = comb.or %104, %105 : i1
      cf.cond_br %110, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %106, %low_power_q, %107, %108 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %109, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb2:  // pred: ^bb0
      %111 = comb.icmp ceq %state_q, %c-1330_i12 : i12
      cf.cond_br %111, ^bb3(%50, %false, %false, %req_pwrdn_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1600_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb4
    ^bb3(%112: i1, %113: i1, %114: i1, %115: i1, %116: i1, %117: i2, %118: i2, %119: i2, %120: i12, %121: i1, %122: i1):  // 5 preds: ^bb2, ^bb6, ^bb7, ^bb24, ^bb26
      cf.cond_br %112, ^bb32(%113, %114, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %115, %reset_ongoing_q, %116, %117, %118, %119, %low_power_q, %u_fetch_en.lc_en_o, %120 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%113, %121, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %122, %reset_ongoing_q, %116, %117, %118, %119, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb4:  // pred: ^bb2
      %123 = comb.icmp ceq %state_q, %c-1600_i12 : i12
      cf.cond_br %123, ^bb5, ^bb6
    ^bb5:  // pred: ^bb4
      %124 = comb.icmp eq %rst_lc_src_n, %c-1_i2 : i2
      cf.cond_br %124, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c-94_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb6:  // pred: ^bb4
      %125 = comb.icmp ceq %state_q, %c-94_i12 : i12
      cf.cond_br %125, ^bb3(%otp_done_i, %true, %false, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1453_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb7
    ^bb7:  // pred: ^bb6
      %126 = comb.icmp ceq %state_q, %c-1453_i12 : i12
      cf.cond_br %126, ^bb3(%u_sync_lc_done.q_o, %false, %true, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c168_i12, %true, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb8
    ^bb8:  // pred: ^bb7
      %127 = comb.icmp ceq %state_q, %c168_i12 : i12
      cf.cond_br %127, ^bb9, ^bb11
    ^bb9:  // pred: ^bb8
      %128 = comb.xor %reset_ongoing_q, %true : i1
      %129 = comb.xor %req_pwrup_i, %true : i1
      %130 = comb.or %129, %reset_ongoing_q : i1
      cf.cond_br %130, ^bb10, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %128, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb10:  // pred: ^bb9
      %131 = comb.icmp eq %pwrup_cause_i, %c1_i2 : i2
      %132 = comb.and %131, %27 : i1
      cf.br ^bb32(%false, %false, %132, %false, %false, %false, %true, %false, %false, %false, %req_pwrdn_q, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c-966_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb11:  // pred: ^bb8
      %133 = comb.icmp ceq %state_q, %c-966_i12 : i12
      cf.cond_br %133, ^bb12, ^bb13
    ^bb12:  // pred: ^bb11
      %134 = comb.xor %strap_sampled_o, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %134, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb13:  // pred: ^bb11
      %135 = comb.icmp ceq %state_q, %c1523_i12 : i12
      cf.cond_br %135, ^bb14(%rom_ctrl_done_i, %c0_i2, %false, %c1028_i12 : i4, i2, i1, i12), ^bb15
    ^bb14(%136: i4, %137: i2, %138: i1, %139: i12):  // 2 preds: ^bb13, ^bb15
      %140 = comb.icmp eq %136, %c6_i4 : i4
      cf.cond_br %140, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %137, %138, %u_fetch_en.lc_en_o, %139 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %137, %138, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb15:  // pred: ^bb13
      %141 = comb.icmp ceq %state_q, %c1028_i12 : i12
      cf.cond_br %141, ^bb14(%100, %reset_cause_q, %low_power_q, %c868_i12 : i4, i2, i1, i12), ^bb16
    ^bb16:  // pred: ^bb15
      %142 = comb.icmp ceq %state_q, %c868_i12 : i12
      cf.cond_br %142, ^bb1(%19, %low_power_entry_i, %c-1_i2, %c-6_i4, %c917_i12, %c5_i4 : i1, i1, i2, i4, i12, i4), ^bb17
    ^bb17:  // pred: ^bb16
      %143 = comb.icmp ceq %state_q, %c917_i12 : i12
      cf.cond_br %143, ^bb18, ^bb19
    ^bb18:  // pred: ^bb17
      %144 = comb.mux %56, %19, %24 : i1
      %145 = comb.mux %56, %c1744_i12, %state_q : i12
      %146 = comb.mux %144, %c778_i12, %145 : i12
      %147 = comb.xor %19, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %147, %u_fetch_en.lc_en_o, %146 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb19:  // pred: ^bb17
      %148 = comb.icmp ceq %state_q, %c1744_i12 : i12
      cf.cond_br %148, ^bb20, ^bb21
    ^bb20:  // pred: ^bb19
      %149 = comb.xor %low_power_entry_i, %true : i1
      cf.cond_br %149, ^bb32(%false, %false, %true, %true, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c-1671_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb21:  // pred: ^bb19
      %150 = comb.icmp ceq %state_q, %c-1671_i12 : i12
      cf.cond_br %150, ^bb22, ^bb23
    ^bb22:  // pred: ^bb21
      %151 = comb.and %otp_idle_i, %lc_idle_i, %flash_idle_i : i1
      cf.cond_br %151, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1423_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %true, %false, %true, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb23:  // pred: ^bb21
      %152 = comb.icmp ceq %state_q, %c1423_i12 : i12
      cf.cond_br %152, ^bb24(%c1_i32, %rst_lc_req_q, %rst_sys_req_q : i32, i2, i2), ^bb26
    ^bb24(%153: i32, %154: i2, %155: i2):  // 2 preds: ^bb23, ^bb25
      %156 = comb.icmp slt %153, %c2_i32 : i32
      cf.cond_br %156, ^bb25, ^bb3(%31, %false, %false, %req_pwrdn_q, %ip_clk_en_q, %154, %155, %c1_i2, %c-375_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1)
    ^bb25:  // pred: ^bb24
      %157 = comb.extract %153 from 1 : (i32) -> i31
      %158 = comb.extract %153 from 0 : (i32) -> i1
      %159 = comb.icmp ne %157, %c0_i31 : i31
      %160 = comb.or %159, %158 : i1
      %161 = comb.xor %main_pd_ni, %true : i1
      %162 = comb.concat %false, %160 : i1, i1
      %163 = comb.shl %c1_i2, %162 : i2
      %164 = comb.xor bin %163, %c-1_i2 : i2
      %165 = comb.and %154, %164 : i2
      %166 = comb.concat %false, %161 : i1, i1
      %167 = comb.shl %166, %162 : i2
      %168 = comb.or %165, %167 : i2
      %169 = comb.and %155, %164 : i2
      %170 = comb.or %169, %167 : i2
      %171 = comb.add %153, %c1_i32 : i32
      cf.br ^bb24(%171, %168, %170 : i32, i2, i2)
    ^bb26:  // pred: ^bb23
      %172 = comb.icmp ceq %state_q, %c-375_i12 : i12
      cf.cond_br %172, ^bb3(%ack_pwrdn_i, %false, %false, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c55_i12, %false, %true : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb27
    ^bb27:  // pred: ^bb26
      %173 = comb.icmp ceq %state_q, %c778_i12 : i12
      cf.cond_br %173, ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %true, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1647_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb28
    ^bb28:  // pred: ^bb27
      %174 = comb.icmp ceq %state_q, %c1647_i12 : i12
      cf.cond_br %174, ^bb29, ^bb30
    ^bb29:  // pred: ^bb28
      %175 = comb.icmp ne %lc_hw_debug_en_i, %c5_i4 : i4
      %176 = comb.and %25, %175 : i1
      %177 = comb.or %21, %24, %26, %176 : i1
      %178 = comb.replicate %177 : (i1) -> i2
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %178, %c-2_i2, %low_power_q, %u_fetch_en.lc_en_o, %c-4_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb30:  // pred: ^bb28
      %179 = comb.icmp ceq %state_q, %c-4_i12 : i12
      cf.cond_br %179, ^bb31, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %c-1_i2, %c-1_i2, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb31:  // pred: ^bb30
      %180 = comb.xor %23, %true : i1
      %181 = comb.xor %ext_rst_pending_q, %true : i1
      %182 = comb.and %31, %180, %181 : i1
      cf.cond_br %182, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %23, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c55_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %23, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb32(%183: i1, %184: i1, %185: i1, %186: i1, %187: i1, %188: i1, %189: i1, %190: i1, %191: i1, %192: i1, %193: i1, %194: i1, %195: i1, %196: i2, %197: i2, %198: i2, %199: i1, %200: i4, %201: i12):  // 21 preds: ^bb1, ^bb1, ^bb3, ^bb3, ^bb5, ^bb5, ^bb9, ^bb10, ^bb12, ^bb14, ^bb14, ^bb18, ^bb20, ^bb20, ^bb22, ^bb22, ^bb27, ^bb29, ^bb30, ^bb31, ^bb31
      %202 = comb.mux %fsm_invalid_i, %c-682_i12, %201 : i12
      llhd.yield %183, %184, %185, %186, %187, %188, %189, %190, %191, %202, %192, %193, %194, %195, %196, %197, %198, %199, %200 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4
    }
    %102 = comb.extract %reset_reqs_i from 0 : (i6) -> i5
    %u_reg_otp_init.q_o = hw.instance "u_reg_otp_init" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %101#0: i1) -> (q_o: i1)
    %u_reg_lc_init.q_o = hw.instance "u_reg_lc_init" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %101#1: i1) -> (q_o: i1)
    hw.output %ack_pwrup_q, %req_pwrdn_q, %101#8, %101#2, %101#3, %101#4, %101#5, %101#6, %0, %1, %u_reg_otp_init.q_o, %u_reg_lc_init.q_o, %101#7, %strap_sampled_o, %low_power_q, %u_fetch_en.lc_en_o : i1, i1, i1, i1, i1, i1, i1, i1, !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>, !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>, i1, i1, i1, i1, i1, i4
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
