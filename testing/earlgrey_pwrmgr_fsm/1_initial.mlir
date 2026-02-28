module {
  hw.module @pwrmgr_fsm(in %clk_i : i1, in %rst_ni : i1, in %clk_slow_i : i1, in %rst_slow_ni : i1, in %req_pwrup_i : i1, in %pwrup_cause_i : i2, out ack_pwrup_o : i1, out req_pwrdn_o : i1, in %ack_pwrdn_i : i1, in %low_power_entry_i : i1, in %main_pd_ni : i1, in %reset_reqs_i : i6, in %fsm_invalid_i : i1, out clr_slow_req_o : i1, in %usb_ip_clk_en_i : i1, out usb_ip_clk_status_o : i1, out wkup_o : i1, out fall_through_o : i1, out abort_o : i1, out clr_hint_o : i1, out clr_cfg_lock_o : i1, out pwr_rst_o : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>, in %pwr_rst_i : !hw.struct<rst_lc_src_n: i2, rst_sys_src_n: i2>, out ips_clk_en_o : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>, in %clk_en_status_i : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>, out otp_init_o : i1, in %otp_done_i : i1, in %otp_idle_i : i1, out lc_init_o : i1, in %lc_done_i : i1, in %lc_idle_i : i1, in %lc_dft_en_i : i4, in %lc_hw_debug_en_i : i4, in %flash_idle_i : i1, in %rom_ctrl_done_i : i4, in %rom_ctrl_good_i : i4, out strap_o : i1, out strap_sampled_o : i1, out low_power_o : i1, out fetch_en_o : i4) {
    %true = hw.constant true
    %c0_i31 = hw.constant 0 : i31
    %c-1_i3 = hw.constant -1 : i3
    %c0_i3 = hw.constant 0 : i3
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
    %0 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %97, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %1 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en.q_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
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
    %32 = seq.to_clock %clk_i
    %33 = comb.xor %rst_ni, %true : i1
    %ack_pwrup_q = seq.firreg %96#10 clock %32 reset async %33, %false : i1
    %req_pwrdn_q = seq.firreg %96#11 clock %32 reset async %33, %false : i1
    %reset_ongoing_q = seq.firreg %96#12 clock %32 reset async %33, %false : i1
    %ip_clk_en_q = seq.firreg %96#13 clock %32 reset async %33, %false : i1
    %rst_lc_req_q = seq.firreg %96#14 clock %32 reset async %33, %c-1_i2 : i2
    %rst_sys_req_q = seq.firreg %96#15 clock %32 reset async %33, %c-1_i2 : i2
    %reset_cause_q = seq.firreg %96#16 clock %32 reset async %33, %c-1_i2 : i2
    %low_power_q = seq.firreg %96#17 clock %32 reset async %33, %true : i1
    %state_q = seq.firreg %96#9 clock %32 reset async %33, %c55_i12 : i12
    %34 = comb.icmp eq %rst_sys_req_q, %c-1_i2 : i2
    %35 = comb.xor %34, %true : i1
    %36 = comb.and %35, %96#7 : i1
    %37 = comb.or %34, %96#7 : i1
    %38 = comb.mux bin %37, %36, %strap_sampled_o : i1
    %strap_sampled_o = seq.firreg %38 clock %32 reset async %33, %false : i1
    %u_fetch_en.lc_en_o = hw.instance "u_fetch_en" @prim_lc_sender(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, lc_en_i: %96#18: i4) -> (lc_en_o: i4)
    %u_slow_sync_lc_done.q_o = hw.instance "u_slow_sync_lc_done" @prim_flop_2sync(clk_i: %clk_slow_i: i1, rst_ni: %rst_slow_ni: i1, d_i: %lc_done_i: i1) -> (q_o: i1) {sv.namehint = "slow_lc_done"}
    %u_sync_lc_done.q_o = hw.instance "u_sync_lc_done" @prim_flop_2sync(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %u_slow_sync_lc_done.q_o: i1) -> (q_o: i1)
    %39 = hw.bitcast %1 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
    %40 = hw.bitcast %clk_en_status_i : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
    %41 = comb.and %39, %40 : i3
    %42 = comb.xor %39, %c-1_i3 : i3
    %43 = comb.or %41, %42 : i3
    %44 = comb.icmp eq %43, %c-1_i3 : i3
    %45 = comb.and %ip_clk_en_q, %44 : i1
    %46 = comb.xor %ip_clk_en_q, %true : i1
    %47 = comb.xor %40, %c-1_i3 : i3
    %48 = comb.and %42, %47 : i3
    %49 = comb.or %48, %39 : i3
    %50 = comb.icmp eq %49, %c-1_i3 : i3
    %51 = comb.and %46, %50 : i1
    %52 = comb.extract %lc_dft_en_i from 0 : (i4) -> i1
    %53 = comb.extract %lc_hw_debug_en_i from 0 : (i4) -> i1
    %54 = comb.and %52, %53 : i1
    %55 = comb.extract %lc_dft_en_i from 1 : (i4) -> i1
    %56 = comb.extract %lc_hw_debug_en_i from 1 : (i4) -> i1
    %57 = comb.or %55, %56 : i1
    %58 = comb.concat %false, %54 : i1, i1
    %59 = comb.concat %57, %false : i1, i1
    %60 = comb.or %58, %59 : i2
    %61 = comb.extract %lc_dft_en_i from 2 : (i4) -> i1
    %62 = comb.extract %lc_hw_debug_en_i from 2 : (i4) -> i1
    %63 = comb.and %61, %62 : i1
    %64 = comb.concat %false, %60 : i1, i2
    %65 = comb.concat %63, %c0_i2 : i1, i2
    %66 = comb.or %64, %65 : i3
    %67 = comb.extract %lc_dft_en_i from 3 : (i4) -> i1
    %68 = comb.extract %lc_hw_debug_en_i from 3 : (i4) -> i1
    %69 = comb.or %67, %68 : i1
    %70 = comb.concat %false, %66 : i1, i3
    %71 = comb.concat %69, %c0_i3 : i1, i3
    %72 = comb.or %70, %71 : i4
    %73 = comb.icmp eq %72, %c5_i4 : i4
    %74 = comb.mux %73, %c6_i4, %c-7_i4 {sv.namehint = "rom_intg_chk_dis"} : i4
    %75 = comb.extract %74 from 0 : (i4) -> i1
    %76 = comb.extract %rom_ctrl_good_i from 0 : (i4) -> i1
    %77 = comb.and %75, %76 : i1
    %78 = comb.extract %74 from 1 : (i4) -> i1
    %79 = comb.extract %rom_ctrl_good_i from 1 : (i4) -> i1
    %80 = comb.or %78, %79 : i1
    %81 = comb.concat %false, %77 : i1, i1
    %82 = comb.concat %80, %false : i1, i1
    %83 = comb.or %81, %82 : i2
    %84 = comb.extract %74 from 2 : (i4) -> i1
    %85 = comb.extract %rom_ctrl_good_i from 2 : (i4) -> i1
    %86 = comb.or %84, %85 : i1
    %87 = comb.concat %false, %83 : i1, i2
    %88 = comb.concat %86, %c0_i2 : i1, i2
    %89 = comb.or %87, %88 : i3
    %90 = comb.extract %74 from 3 : (i4) -> i1
    %91 = comb.extract %rom_ctrl_good_i from 3 : (i4) -> i1
    %92 = comb.and %90, %91 : i1
    %93 = comb.concat %false, %89 : i1, i3
    %94 = comb.concat %92, %c0_i3 : i1, i3
    %95 = comb.or %93, %94 : i4
    %96:19 = llhd.combinational -> i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4 {
      %99 = comb.icmp ceq %state_q, %c55_i12 : i12
      cf.cond_br %99, ^bb1(%req_pwrup_i, %reset_ongoing_q, %reset_cause_q, %u_fetch_en.lc_en_o, %c-1330_i12, %u_fetch_en.lc_en_o : i1, i1, i2, i4, i12, i4), ^bb2
    ^bb1(%100: i1, %101: i1, %102: i2, %103: i4, %104: i12, %105: i4):  // 2 preds: ^bb0, ^bb16
      %106 = comb.or %100, %101 : i1
      cf.cond_br %106, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %102, %low_power_q, %103, %104 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %105, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb2:  // pred: ^bb0
      %107 = comb.icmp ceq %state_q, %c-1330_i12 : i12
      cf.cond_br %107, ^bb3(%45, %false, %false, %req_pwrdn_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1600_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb4
    ^bb3(%108: i1, %109: i1, %110: i1, %111: i1, %112: i1, %113: i2, %114: i2, %115: i2, %116: i12, %117: i1, %118: i1):  // 5 preds: ^bb2, ^bb6, ^bb7, ^bb24, ^bb26
      cf.cond_br %108, ^bb32(%109, %110, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %111, %reset_ongoing_q, %112, %113, %114, %115, %low_power_q, %u_fetch_en.lc_en_o, %116 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%109, %117, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %118, %reset_ongoing_q, %112, %113, %114, %115, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb4:  // pred: ^bb2
      %119 = comb.icmp ceq %state_q, %c-1600_i12 : i12
      cf.cond_br %119, ^bb5, ^bb6
    ^bb5:  // pred: ^bb4
      %120 = comb.icmp eq %rst_lc_src_n, %c-1_i2 : i2
      cf.cond_br %120, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c-94_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb6:  // pred: ^bb4
      %121 = comb.icmp ceq %state_q, %c-94_i12 : i12
      cf.cond_br %121, ^bb3(%otp_done_i, %true, %false, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1453_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb7
    ^bb7:  // pred: ^bb6
      %122 = comb.icmp ceq %state_q, %c-1453_i12 : i12
      cf.cond_br %122, ^bb3(%u_sync_lc_done.q_o, %false, %true, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c168_i12, %true, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb8
    ^bb8:  // pred: ^bb7
      %123 = comb.icmp ceq %state_q, %c168_i12 : i12
      cf.cond_br %123, ^bb9, ^bb11
    ^bb9:  // pred: ^bb8
      %124 = comb.xor %reset_ongoing_q, %true : i1
      %125 = comb.xor %req_pwrup_i, %true : i1
      %126 = comb.or %125, %reset_ongoing_q : i1
      cf.cond_br %126, ^bb10, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %124, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb10:  // pred: ^bb9
      %127 = comb.icmp eq %pwrup_cause_i, %c1_i2 : i2
      %128 = comb.and %127, %27 : i1
      cf.br ^bb32(%false, %false, %128, %false, %false, %false, %true, %false, %false, %false, %req_pwrdn_q, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c-966_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb11:  // pred: ^bb8
      %129 = comb.icmp ceq %state_q, %c-966_i12 : i12
      cf.cond_br %129, ^bb12, ^bb13
    ^bb12:  // pred: ^bb11
      %130 = comb.xor %strap_sampled_o, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %130, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb13:  // pred: ^bb11
      %131 = comb.icmp ceq %state_q, %c1523_i12 : i12
      cf.cond_br %131, ^bb14(%rom_ctrl_done_i, %c0_i2, %false, %c1028_i12 : i4, i2, i1, i12), ^bb15
    ^bb14(%132: i4, %133: i2, %134: i1, %135: i12):  // 2 preds: ^bb13, ^bb15
      %136 = comb.icmp eq %132, %c6_i4 : i4
      cf.cond_br %136, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %133, %134, %u_fetch_en.lc_en_o, %135 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %133, %134, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb15:  // pred: ^bb13
      %137 = comb.icmp ceq %state_q, %c1028_i12 : i12
      cf.cond_br %137, ^bb14(%95, %reset_cause_q, %low_power_q, %c868_i12 : i4, i2, i1, i12), ^bb16
    ^bb16:  // pred: ^bb15
      %138 = comb.icmp ceq %state_q, %c868_i12 : i12
      cf.cond_br %138, ^bb1(%19, %low_power_entry_i, %c-1_i2, %c-6_i4, %c917_i12, %c5_i4 : i1, i1, i2, i4, i12, i4), ^bb17
    ^bb17:  // pred: ^bb16
      %139 = comb.icmp ceq %state_q, %c917_i12 : i12
      cf.cond_br %139, ^bb18, ^bb19
    ^bb18:  // pred: ^bb17
      %140 = comb.mux %51, %19, %24 : i1
      %141 = comb.mux %51, %c1744_i12, %state_q : i12
      %142 = comb.mux %140, %c778_i12, %141 : i12
      %143 = comb.xor %19, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %143, %u_fetch_en.lc_en_o, %142 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb19:  // pred: ^bb17
      %144 = comb.icmp ceq %state_q, %c1744_i12 : i12
      cf.cond_br %144, ^bb20, ^bb21
    ^bb20:  // pred: ^bb19
      %145 = comb.xor %low_power_entry_i, %true : i1
      cf.cond_br %145, ^bb32(%false, %false, %true, %true, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c-1671_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb21:  // pred: ^bb19
      %146 = comb.icmp ceq %state_q, %c-1671_i12 : i12
      cf.cond_br %146, ^bb22, ^bb23
    ^bb22:  // pred: ^bb21
      %147 = comb.and %otp_idle_i, %lc_idle_i, %flash_idle_i : i1
      cf.cond_br %147, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1423_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %true, %false, %true, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb23:  // pred: ^bb21
      %148 = comb.icmp ceq %state_q, %c1423_i12 : i12
      cf.cond_br %148, ^bb24(%c1_i32, %rst_lc_req_q, %rst_sys_req_q : i32, i2, i2), ^bb26
    ^bb24(%149: i32, %150: i2, %151: i2):  // 2 preds: ^bb23, ^bb25
      %152 = comb.icmp slt %149, %c2_i32 : i32
      cf.cond_br %152, ^bb25, ^bb3(%31, %false, %false, %req_pwrdn_q, %ip_clk_en_q, %150, %151, %c1_i2, %c-375_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1)
    ^bb25:  // pred: ^bb24
      %153 = comb.extract %149 from 1 : (i32) -> i31
      %154 = comb.extract %149 from 0 : (i32) -> i1
      %155 = comb.icmp ne %153, %c0_i31 : i31
      %156 = comb.or %155, %154 : i1
      %157 = comb.xor %main_pd_ni, %true : i1
      %158 = comb.concat %false, %156 : i1, i1
      %159 = comb.shl %c1_i2, %158 : i2
      %160 = comb.xor bin %159, %c-1_i2 : i2
      %161 = comb.and %150, %160 : i2
      %162 = comb.concat %false, %157 : i1, i1
      %163 = comb.shl %162, %158 : i2
      %164 = comb.or %161, %163 : i2
      %165 = comb.and %151, %160 : i2
      %166 = comb.or %165, %163 : i2
      %167 = comb.add %149, %c1_i32 : i32
      cf.br ^bb24(%167, %164, %166 : i32, i2, i2)
    ^bb26:  // pred: ^bb23
      %168 = comb.icmp ceq %state_q, %c-375_i12 : i12
      cf.cond_br %168, ^bb3(%ack_pwrdn_i, %false, %false, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c55_i12, %false, %true : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb27
    ^bb27:  // pred: ^bb26
      %169 = comb.icmp ceq %state_q, %c778_i12 : i12
      cf.cond_br %169, ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %true, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c1647_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb28
    ^bb28:  // pred: ^bb27
      %170 = comb.icmp ceq %state_q, %c1647_i12 : i12
      cf.cond_br %170, ^bb29, ^bb30
    ^bb29:  // pred: ^bb28
      %171 = comb.icmp ne %lc_hw_debug_en_i, %c5_i4 : i4
      %172 = comb.and %25, %171 : i1
      %173 = comb.or %21, %24, %26, %172 : i1
      %174 = comb.replicate %173 : (i1) -> i2
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %174, %c-2_i2, %low_power_q, %u_fetch_en.lc_en_o, %c-4_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb30:  // pred: ^bb28
      %175 = comb.icmp ceq %state_q, %c-4_i12 : i12
      cf.cond_br %175, ^bb31, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %c-1_i2, %c-1_i2, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb31:  // pred: ^bb30
      %176 = comb.xor %23, %true : i1
      %177 = comb.and %31, %176 : i1
      cf.cond_br %177, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %23, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %c55_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %23, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en.lc_en_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb32(%178: i1, %179: i1, %180: i1, %181: i1, %182: i1, %183: i1, %184: i1, %185: i1, %186: i1, %187: i1, %188: i1, %189: i1, %190: i1, %191: i2, %192: i2, %193: i2, %194: i1, %195: i4, %196: i12):  // 21 preds: ^bb1, ^bb1, ^bb3, ^bb3, ^bb5, ^bb5, ^bb9, ^bb10, ^bb12, ^bb14, ^bb14, ^bb18, ^bb20, ^bb20, ^bb22, ^bb22, ^bb27, ^bb29, ^bb30, ^bb31, ^bb31
      %197 = comb.mux %fsm_invalid_i, %c-682_i12, %196 : i12
      llhd.yield %178, %179, %180, %181, %182, %183, %184, %185, %186, %197, %187, %188, %189, %190, %191, %192, %193, %194, %195 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4
    }
    %97 = comb.extract %reset_reqs_i from 0 : (i6) -> i5
    %98 = comb.and %96#13, %usb_ip_clk_en_i : i1
    %u_usb_ip_clk_en.q_o = hw.instance "u_usb_ip_clk_en" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %98: i1) -> (q_o: i1)
    %usb_status = hw.struct_extract %clk_en_status_i["usb_status"] : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
    %u_reg_otp_init.q_o = hw.instance "u_reg_otp_init" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %96#0: i1) -> (q_o: i1)
    %u_reg_lc_init.q_o = hw.instance "u_reg_lc_init" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %96#1: i1) -> (q_o: i1)
    hw.output %ack_pwrup_q, %req_pwrdn_q, %96#8, %usb_status, %96#2, %96#3, %96#4, %96#5, %96#6, %0, %1, %u_reg_otp_init.q_o, %u_reg_lc_init.q_o, %96#7, %strap_sampled_o, %low_power_q, %u_fetch_en.lc_en_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>, !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>, i1, i1, i1, i1, i1, i4
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
