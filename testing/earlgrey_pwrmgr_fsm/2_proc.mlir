module {
  hw.module @pwrmgr_fsm(in %clk_i : i1, in %rst_ni : i1, in %clk_slow_i : i1, in %rst_slow_ni : i1, in %req_pwrup_i : i1, in %pwrup_cause_i : i2, out ack_pwrup_o : i1, out req_pwrdn_o : i1, in %ack_pwrdn_i : i1, in %low_power_entry_i : i1, in %main_pd_ni : i1, in %reset_reqs_i : i6, in %fsm_invalid_i : i1, out clr_slow_req_o : i1, in %usb_ip_clk_en_i : i1, out usb_ip_clk_status_o : i1, out wkup_o : i1, out fall_through_o : i1, out abort_o : i1, out clr_hint_o : i1, out clr_cfg_lock_o : i1, out pwr_rst_o.rst_lc_req : i2, out pwr_rst_o.rst_sys_req : i2, out pwr_rst_o.rstreqs : i5, out pwr_rst_o.reset_cause : i2, in %pwr_rst_i.rst_lc_src_n : i2, in %pwr_rst_i.rst_sys_src_n : i2, out ips_clk_en_o.main_ip_clk_en : i1, out ips_clk_en_o.io_ip_clk_en : i1, out ips_clk_en_o.usb_ip_clk_en : i1, in %clk_en_status_i.main_status : i1, in %clk_en_status_i.io_status : i1, in %clk_en_status_i.usb_status : i1, out otp_init_o : i1, in %otp_done_i : i1, in %otp_idle_i : i1, out lc_init_o : i1, in %lc_done_i : i1, in %lc_idle_i : i1, in %lc_dft_en_i : i4, in %lc_hw_debug_en_i : i4, in %flash_idle_i : i1, in %rom_ctrl_done_i : i4, in %rom_ctrl_good_i : i4, out strap_o : i1, out strap_sampled_o : i1, out low_power_o : i1, out fetch_en_o : i4) {
    %false = hw.constant false
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c-1_i2 = hw.constant -1 : i2
    %c55_i12 = hw.constant 55 : i12
    %c6_i4 = hw.constant 6 : i4
    %c-7_i4 = hw.constant -7 : i4
    %c-1330_i12 = hw.constant -1330 : i12
    %c-1600_i12 = hw.constant -1600 : i12
    %c0_i2 = hw.constant 0 : i2
    %c-94_i12 = hw.constant -94 : i12
    %c-1453_i12 = hw.constant -1453 : i12
    %c168_i12 = hw.constant 168 : i12
    %c-966_i12 = hw.constant -966 : i12
    %c1523_i12 = hw.constant 1523 : i12
    %c1028_i12 = hw.constant 1028 : i12
    %c868_i12 = hw.constant 868 : i12
    %c5_i4 = hw.constant 5 : i4
    %c-6_i4 = hw.constant -6 : i4
    %c917_i12 = hw.constant 917 : i12
    %c778_i12 = hw.constant 778 : i12
    %c1744_i12 = hw.constant 1744 : i12
    %c-1671_i12 = hw.constant -1671 : i12
    %c1423_i12 = hw.constant 1423 : i12
    %c1_i32 = hw.constant 1 : i32
    %c2_i32 = hw.constant 2 : i32
    %c-375_i12 = hw.constant -375 : i12
    %c1647_i12 = hw.constant 1647 : i12
    %c-4_i12 = hw.constant -4 : i12
    %c-682_i12 = hw.constant -682 : i12
    %c0_i6 = hw.constant 0 : i6
    %c0_i3 = hw.constant 0 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c0_i31 = hw.constant 0 : i31
    %true = hw.constant true
    %0 = hw.struct_create (%clk_en_status_i.main_status, %clk_en_status_i.io_status, %clk_en_status_i.usb_status) : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
    %1 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %108, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %1 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %2 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q, %u_usb_ip_clk_en2Fq_o) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
    %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en = hw.struct_explode %2 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>
    %3 = comb.extract %pwr_rst_i.rst_lc_src_n from 1 : (i2) -> i1
    %4 = comb.xor %3, %true : i1
    %5 = comb.extract %pwr_rst_i.rst_sys_src_n from 1 : (i2) -> i1
    %6 = comb.xor %5, %true : i1
    %7 = comb.and %4, %6 : i1
    %8 = comb.xor %pwr_rst_i.rst_lc_src_n, %c-1_i2 : i2
    %9 = comb.and %rst_lc_req_q, %8 : i2
    %10 = comb.xor %rst_lc_req_q, %c-1_i2 : i2
    %11 = comb.and %10, %pwr_rst_i.rst_lc_src_n : i2
    %12 = comb.or %9, %11 : i2
    %13 = comb.icmp eq %12, %c-1_i2 : i2
    %14 = comb.xor %pwr_rst_i.rst_sys_src_n, %c-1_i2 : i2
    %15 = comb.and %rst_sys_req_q, %14 : i2
    %16 = comb.xor %rst_sys_req_q, %c-1_i2 : i2
    %17 = comb.and %16, %pwr_rst_i.rst_sys_src_n : i2
    %18 = comb.or %15, %17 : i2
    %19 = comb.icmp eq %18, %c-1_i2 : i2
    %20 = comb.icmp ne %reset_reqs_i, %c0_i6 : i6
    %21 = comb.extract %reset_reqs_i from 0 : (i6) -> i2
    %22 = comb.icmp ne %21, %c0_i2 : i2
    %23 = comb.extract %reset_reqs_i from 3 : (i6) -> i1
    %24 = comb.extract %reset_reqs_i from 2 : (i6) -> i1
    %25 = comb.or %23, %24 : i1
    %26 = comb.extract %reset_reqs_i from 4 : (i6) -> i1
    %27 = comb.extract %reset_reqs_i from 5 : (i6) -> i1
    %28 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
    %29 = comb.or %main_pd_ni, %7 : i1
    %30 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
    %31 = comb.and %30, %13, %19 : i1
    %32 = comb.mux %28, %29, %31 : i1
    %33 = seq.to_clock %clk_i
    %34 = comb.xor %rst_ni, %true : i1
    %ack_pwrup_q = seq.compreg %107#10, %33 reset %34, %false : i1  
    %req_pwrdn_q = seq.compreg %107#11, %33 reset %34, %false : i1  
    %reset_ongoing_q = seq.compreg %107#12, %33 reset %34, %false : i1  
    %ip_clk_en_q = seq.compreg %107#13, %33 reset %34, %false : i1  
    %rst_lc_req_q = seq.compreg %107#14, %33 reset %34, %c-1_i2 : i2  
    %rst_sys_req_q = seq.compreg %107#15, %33 reset %34, %c-1_i2 : i2  
    %reset_cause_q = seq.compreg %107#16, %33 reset %34, %c-1_i2 : i2  
    %low_power_q = seq.compreg %107#17, %33 reset %34, %true : i1  
    %state_q = seq.compreg %107#9, %33 reset %34, %c55_i12 : i12  
    %35 = comb.icmp eq %rst_sys_req_q, %c-1_i2 : i2
    %36 = comb.xor %35, %true : i1
    %37 = comb.and %36, %107#7 : i1
    %38 = comb.or %35, %107#7 : i1
    %39 = comb.mux bin %38, %37, %strap_sampled_o : i1
    %strap_sampled_o = seq.compreg %39, %33 reset %34, %false : i1  
    %40 = seq.to_clock %clk_i
    %41 = comb.xor %rst_ni, %true : i1
    %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o = seq.compreg name "u_fetch_en/gen_flops.u_prim_flop/u_secure_anchor_flop/q_o" %107#18, %40 reset %41, %c-6_i4 : i4  
    %42 = seq.to_clock %clk_slow_i
    %43 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_1/q_o" %lc_done_i, %42 reset %43, %false : i1  
    %44 = seq.to_clock %clk_slow_i
    %45 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_2/q_o" %u_slow_sync_lc_done2Fu_sync_12Fq_o, %44 reset %45, %false : i1  
    %46 = seq.to_clock %clk_i
    %47 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_sync_lc_done/u_sync_1/q_o" %u_slow_sync_lc_done2Fu_sync_22Fq_o, %46 reset %47, %false : i1  
    %48 = seq.to_clock %clk_i
    %49 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_sync_lc_done/u_sync_2/q_o" %u_sync_lc_done2Fu_sync_12Fq_o, %48 reset %49, %false : i1  
    %50 = hw.bitcast %2 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
    %51 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
    %52 = comb.and %50, %51 : i3
    %53 = comb.xor %50, %c-1_i3 : i3
    %54 = comb.or %52, %53 : i3
    %55 = comb.icmp eq %54, %c-1_i3 : i3
    %56 = comb.and %ip_clk_en_q, %55 : i1
    %57 = comb.xor %ip_clk_en_q, %true : i1
    %58 = comb.xor %51, %c-1_i3 : i3
    %59 = comb.and %53, %58 : i3
    %60 = comb.or %59, %50 : i3
    %61 = comb.icmp eq %60, %c-1_i3 : i3
    %62 = comb.and %57, %61 : i1
    %63 = comb.extract %lc_dft_en_i from 0 : (i4) -> i1
    %64 = comb.extract %lc_hw_debug_en_i from 0 : (i4) -> i1
    %65 = comb.and %63, %64 : i1
    %66 = comb.extract %lc_dft_en_i from 1 : (i4) -> i1
    %67 = comb.extract %lc_hw_debug_en_i from 1 : (i4) -> i1
    %68 = comb.or %66, %67 : i1
    %69 = comb.concat %false, %65 : i1, i1
    %70 = comb.concat %68, %false : i1, i1
    %71 = comb.or %69, %70 : i2
    %72 = comb.extract %lc_dft_en_i from 2 : (i4) -> i1
    %73 = comb.extract %lc_hw_debug_en_i from 2 : (i4) -> i1
    %74 = comb.and %72, %73 : i1
    %75 = comb.concat %false, %71 : i1, i2
    %76 = comb.concat %74, %c0_i2 : i1, i2
    %77 = comb.or %75, %76 : i3
    %78 = comb.extract %lc_dft_en_i from 3 : (i4) -> i1
    %79 = comb.extract %lc_hw_debug_en_i from 3 : (i4) -> i1
    %80 = comb.or %78, %79 : i1
    %81 = comb.concat %false, %77 : i1, i3
    %82 = comb.concat %80, %c0_i3 : i1, i3
    %83 = comb.or %81, %82 : i4
    %84 = comb.icmp eq %83, %c5_i4 : i4
    %85 = comb.mux %84, %c6_i4, %c-7_i4 : i4
    %86 = comb.extract %85 from 0 : (i4) -> i1
    %87 = comb.extract %rom_ctrl_good_i from 0 : (i4) -> i1
    %88 = comb.and %86, %87 : i1
    %89 = comb.extract %85 from 1 : (i4) -> i1
    %90 = comb.extract %rom_ctrl_good_i from 1 : (i4) -> i1
    %91 = comb.or %89, %90 : i1
    %92 = comb.concat %false, %88 : i1, i1
    %93 = comb.concat %91, %false : i1, i1
    %94 = comb.or %92, %93 : i2
    %95 = comb.extract %85 from 2 : (i4) -> i1
    %96 = comb.extract %rom_ctrl_good_i from 2 : (i4) -> i1
    %97 = comb.or %95, %96 : i1
    %98 = comb.concat %false, %94 : i1, i2
    %99 = comb.concat %97, %c0_i2 : i1, i2
    %100 = comb.or %98, %99 : i3
    %101 = comb.extract %85 from 3 : (i4) -> i1
    %102 = comb.extract %rom_ctrl_good_i from 3 : (i4) -> i1
    %103 = comb.and %101, %102 : i1
    %104 = comb.concat %false, %100 : i1, i3
    %105 = comb.concat %103, %c0_i3 : i1, i3
    %106 = comb.or %104, %105 : i4
    %107:19 = llhd.combinational -> i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4 {
      %116 = comb.icmp eq %state_q, %c55_i12 : i12
      cf.cond_br %116, ^bb1(%req_pwrup_i, %reset_ongoing_q, %reset_cause_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-1330_i12, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i2, i4, i12, i4), ^bb2
    ^bb1(%117: i1, %118: i1, %119: i2, %120: i4, %121: i12, %122: i4):  // 2 preds: ^bb0, ^bb16
      %123 = comb.or %117, %118 : i1
      cf.cond_br %123, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %119, %low_power_q, %120, %121 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %122, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb2:  // pred: ^bb0
      %124 = comb.icmp eq %state_q, %c-1330_i12 : i12
      cf.cond_br %124, ^bb3(%56, %false, %false, %req_pwrdn_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1600_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb4
    ^bb3(%125: i1, %126: i1, %127: i1, %128: i1, %129: i1, %130: i2, %131: i2, %132: i2, %133: i12, %134: i1, %135: i1):  // 5 preds: ^bb2, ^bb6, ^bb7, ^bb24, ^bb26
      cf.cond_br %125, ^bb32(%126, %127, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %128, %reset_ongoing_q, %129, %130, %131, %132, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %133 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%126, %134, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %135, %reset_ongoing_q, %129, %130, %131, %132, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb4:  // pred: ^bb2
      %136 = comb.icmp eq %state_q, %c-1600_i12 : i12
      cf.cond_br %136, ^bb5, ^bb6
    ^bb5:  // pred: ^bb4
      %137 = comb.icmp eq %pwr_rst_i.rst_lc_src_n, %c-1_i2 : i2
      cf.cond_br %137, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-94_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb6:  // pred: ^bb4
      %138 = comb.icmp eq %state_q, %c-94_i12 : i12
      cf.cond_br %138, ^bb3(%otp_done_i, %true, %false, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1453_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb7
    ^bb7:  // pred: ^bb6
      %139 = comb.icmp eq %state_q, %c-1453_i12 : i12
      cf.cond_br %139, ^bb3(%u_sync_lc_done2Fu_sync_22Fq_o, %false, %true, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c168_i12, %true, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb8
    ^bb8:  // pred: ^bb7
      %140 = comb.icmp eq %state_q, %c168_i12 : i12
      cf.cond_br %140, ^bb9, ^bb11
    ^bb9:  // pred: ^bb8
      %141 = comb.xor %reset_ongoing_q, %true : i1
      %142 = comb.xor %req_pwrup_i, %true : i1
      %143 = comb.or %142, %reset_ongoing_q : i1
      cf.cond_br %143, ^bb10, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %141, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb10:  // pred: ^bb9
      %144 = comb.icmp eq %pwrup_cause_i, %c1_i2 : i2
      %145 = comb.and %144, %28 : i1
      cf.br ^bb32(%false, %false, %145, %false, %false, %false, %true, %false, %false, %false, %req_pwrdn_q, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-966_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb11:  // pred: ^bb8
      %146 = comb.icmp eq %state_q, %c-966_i12 : i12
      cf.cond_br %146, ^bb12, ^bb13
    ^bb12:  // pred: ^bb11
      %147 = comb.xor %strap_sampled_o, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %147, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb13:  // pred: ^bb11
      %148 = comb.icmp eq %state_q, %c1523_i12 : i12
      cf.cond_br %148, ^bb14(%rom_ctrl_done_i, %c0_i2, %false, %c1028_i12 : i4, i2, i1, i12), ^bb15
    ^bb14(%149: i4, %150: i2, %151: i1, %152: i12):  // 2 preds: ^bb13, ^bb15
      %153 = comb.icmp eq %149, %c6_i4 : i4
      cf.cond_br %153, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %150, %151, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %152 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %150, %151, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb15:  // pred: ^bb13
      %154 = comb.icmp eq %state_q, %c1028_i12 : i12
      cf.cond_br %154, ^bb14(%106, %reset_cause_q, %low_power_q, %c868_i12 : i4, i2, i1, i12), ^bb16
    ^bb16:  // pred: ^bb15
      %155 = comb.icmp eq %state_q, %c868_i12 : i12
      cf.cond_br %155, ^bb1(%20, %low_power_entry_i, %c-1_i2, %c-6_i4, %c917_i12, %c5_i4 : i1, i1, i2, i4, i12, i4), ^bb17
    ^bb17:  // pred: ^bb16
      %156 = comb.icmp eq %state_q, %c917_i12 : i12
      cf.cond_br %156, ^bb18, ^bb19
    ^bb18:  // pred: ^bb17
      %157 = comb.mux %62, %20, %25 : i1
      %158 = comb.mux %62, %c1744_i12, %state_q : i12
      %159 = comb.mux %157, %c778_i12, %158 : i12
      %160 = comb.xor %20, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %160, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %159 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb19:  // pred: ^bb17
      %161 = comb.icmp eq %state_q, %c1744_i12 : i12
      cf.cond_br %161, ^bb20, ^bb21
    ^bb20:  // pred: ^bb19
      %162 = comb.xor %low_power_entry_i, %true : i1
      cf.cond_br %162, ^bb32(%false, %false, %true, %true, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-1671_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb21:  // pred: ^bb19
      %163 = comb.icmp eq %state_q, %c-1671_i12 : i12
      cf.cond_br %163, ^bb22, ^bb23
    ^bb22:  // pred: ^bb21
      %164 = comb.and %otp_idle_i, %lc_idle_i, %flash_idle_i : i1
      cf.cond_br %164, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1423_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %true, %false, %true, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb23:  // pred: ^bb21
      %165 = comb.icmp eq %state_q, %c1423_i12 : i12
      cf.cond_br %165, ^bb24(%c1_i32, %rst_lc_req_q, %rst_sys_req_q : i32, i2, i2), ^bb26
    ^bb24(%166: i32, %167: i2, %168: i2):  // 2 preds: ^bb23, ^bb25
      %169 = comb.icmp slt %166, %c2_i32 : i32
      cf.cond_br %169, ^bb25, ^bb3(%32, %false, %false, %req_pwrdn_q, %ip_clk_en_q, %167, %168, %c1_i2, %c-375_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1)
    ^bb25:  // pred: ^bb24
      %170 = comb.extract %166 from 1 : (i32) -> i31
      %171 = comb.extract %166 from 0 : (i32) -> i1
      %172 = comb.icmp ne %170, %c0_i31 : i31
      %173 = comb.or %172, %171 : i1
      %174 = comb.xor %main_pd_ni, %true : i1
      %175 = comb.concat %false, %173 : i1, i1
      %176 = comb.shl %c1_i2, %175 : i2
      %177 = comb.xor bin %176, %c-1_i2 : i2
      %178 = comb.and %167, %177 : i2
      %179 = comb.concat %false, %174 : i1, i1
      %180 = comb.shl %179, %175 : i2
      %181 = comb.or %178, %180 : i2
      %182 = comb.and %168, %177 : i2
      %183 = comb.or %182, %180 : i2
      %184 = comb.add %166, %c1_i32 : i32
      cf.br ^bb24(%184, %181, %183 : i32, i2, i2)
    ^bb26:  // pred: ^bb23
      %185 = comb.icmp eq %state_q, %c-375_i12 : i12
      cf.cond_br %185, ^bb3(%ack_pwrdn_i, %false, %false, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c55_i12, %false, %true : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb27
    ^bb27:  // pred: ^bb26
      %186 = comb.icmp eq %state_q, %c778_i12 : i12
      cf.cond_br %186, ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %true, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1647_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb28
    ^bb28:  // pred: ^bb27
      %187 = comb.icmp eq %state_q, %c1647_i12 : i12
      cf.cond_br %187, ^bb29, ^bb30
    ^bb29:  // pred: ^bb28
      %188 = comb.icmp ne %lc_hw_debug_en_i, %c5_i4 : i4
      %189 = comb.and %26, %188 : i1
      %190 = comb.or %22, %25, %27, %189 : i1
      %191 = comb.replicate %190 : (i1) -> i2
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %191, %c-2_i2, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-4_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb30:  // pred: ^bb28
      %192 = comb.icmp eq %state_q, %c-4_i12 : i12
      cf.cond_br %192, ^bb31, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %c-1_i2, %c-1_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb31:  // pred: ^bb30
      %193 = comb.xor %24, %true : i1
      %194 = comb.and %32, %193 : i1
      cf.cond_br %194, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %24, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c55_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %24, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb32(%195: i1, %196: i1, %197: i1, %198: i1, %199: i1, %200: i1, %201: i1, %202: i1, %203: i1, %204: i1, %205: i1, %206: i1, %207: i1, %208: i2, %209: i2, %210: i2, %211: i1, %212: i4, %213: i12):  // 21 preds: ^bb1, ^bb1, ^bb3, ^bb3, ^bb5, ^bb5, ^bb9, ^bb10, ^bb12, ^bb14, ^bb14, ^bb18, ^bb20, ^bb20, ^bb22, ^bb22, ^bb27, ^bb29, ^bb30, ^bb31, ^bb31
      %214 = comb.mux %fsm_invalid_i, %c-682_i12, %213 : i12
      llhd.yield %195, %196, %197, %198, %199, %200, %201, %202, %203, %214, %204, %205, %206, %207, %208, %209, %210, %211, %212 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4
    }
    %108 = comb.extract %reset_reqs_i from 0 : (i6) -> i5
    %109 = comb.and %107#13, %usb_ip_clk_en_i : i1
    %110 = seq.to_clock %clk_i
    %111 = comb.xor %rst_ni, %true : i1
    %u_usb_ip_clk_en2Fq_o = seq.compreg name "u_usb_ip_clk_en/q_o" %109, %110 reset %111, %false : i1  
    %112 = seq.to_clock %clk_i
    %113 = comb.xor %rst_ni, %true : i1
    %u_reg_otp_init2Fq_o = seq.compreg name "u_reg_otp_init/q_o" %107#0, %112 reset %113, %false : i1  
    %114 = seq.to_clock %clk_i
    %115 = comb.xor %rst_ni, %true : i1
    %u_reg_lc_init2Fq_o = seq.compreg name "u_reg_lc_init/q_o" %107#1, %114 reset %115, %false : i1  
    hw.output %ack_pwrup_q, %req_pwrdn_q, %107#8, %clk_en_status_i.usb_status, %107#2, %107#3, %107#4, %107#5, %107#6, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %107#7, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i5, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
  }
}

