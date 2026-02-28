module {
  hw.module @pwrmgr_fsm(in %clk_i : i1, in %rst_ni : i1, in %clk_slow_i : i1, in %rst_slow_ni : i1, in %req_pwrup_i : i1, in %pwrup_cause_i : i2, out ack_pwrup_o : i1, out req_pwrdn_o : i1, in %ack_pwrdn_i : i1, in %low_power_entry_i : i1, in %main_pd_ni : i1, in %reset_reqs_i : i6, in %fsm_invalid_i : i1, out clr_slow_req_o : i1, out wkup_o : i1, out fall_through_o : i1, out abort_o : i1, out clr_hint_o : i1, out clr_cfg_lock_o : i1, in %int_reset_req_i : i1, in %ext_rst_ack_i : i1, out pwr_rst_o.rst_lc_req : i2, out pwr_rst_o.rst_sys_req : i2, out pwr_rst_o.rstreqs : i5, out pwr_rst_o.reset_cause : i2, in %pwr_rst_i.rst_lc_src_n : i2, in %pwr_rst_i.rst_sys_src_n : i2, out ips_clk_en_o.main_ip_clk_en : i1, out ips_clk_en_o.io_ip_clk_en : i1, in %clk_en_status_i.main_status : i1, in %clk_en_status_i.io_status : i1, out otp_init_o : i1, in %otp_done_i : i1, in %otp_idle_i : i1, out lc_init_o : i1, in %lc_done_i : i1, in %lc_idle_i : i1, in %lc_dft_en_i : i4, in %lc_hw_debug_en_i : i4, in %flash_idle_i : i1, in %rom_ctrl_done_i : i4, in %rom_ctrl_good_i : i4, out strap_o : i1, out strap_sampled_o : i1, out low_power_o : i1, out fetch_en_o : i4) {
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
    %c0_i31 = hw.constant 0 : i31
    %true = hw.constant true
    %c0_i3 = hw.constant 0 : i3
    %0 = hw.struct_create (%clk_en_status_i.main_status, %clk_en_status_i.io_status) : !hw.struct<main_status: i1, io_status: i1>
    %1 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %113, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %1 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i5, reset_cause: i2>
    %2 = hw.struct_create (%ip_clk_en_q, %ip_clk_en_q) : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
    %main_ip_clk_en, %io_ip_clk_en = hw.struct_explode %2 : !hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>
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
    %33 = comb.xor %ext_rst_ack_i, %true : i1
    %34 = comb.and %ext_rst_pending_q, %33, %ext_rst_req_q : i1
    %35 = comb.or %int_reset_req_i, %ext_rst_pending_q : i1
    %36 = comb.xor %34, %true : i1
    %37 = comb.and %36, %35 : i1
    %38 = seq.to_clock %clk_i
    %39 = comb.xor %rst_ni, %true : i1
    %ext_rst_req_q = seq.compreg %ext_rst_ack_i, %38 reset %39, %false : i1  
    %ext_rst_pending_q = seq.compreg %37, %38 reset %39, %false : i1  
    %ack_pwrup_q = seq.compreg %112#10, %38 reset %39, %false : i1  
    %req_pwrdn_q = seq.compreg %112#11, %38 reset %39, %false : i1  
    %reset_ongoing_q = seq.compreg %112#12, %38 reset %39, %false : i1  
    %ip_clk_en_q = seq.compreg %112#13, %38 reset %39, %false : i1  
    %rst_lc_req_q = seq.compreg %112#14, %38 reset %39, %c-1_i2 : i2  
    %rst_sys_req_q = seq.compreg %112#15, %38 reset %39, %c-1_i2 : i2  
    %reset_cause_q = seq.compreg %112#16, %38 reset %39, %c-1_i2 : i2  
    %low_power_q = seq.compreg %112#17, %38 reset %39, %true : i1  
    %state_q = seq.compreg %112#9, %38 reset %39, %c55_i12 : i12  
    %40 = comb.icmp eq %rst_sys_req_q, %c-1_i2 : i2
    %41 = comb.xor %40, %true : i1
    %42 = comb.and %41, %112#7 : i1
    %43 = comb.or %40, %112#7 : i1
    %44 = comb.mux bin %43, %42, %strap_sampled_o : i1
    %strap_sampled_o = seq.compreg %44, %38 reset %39, %false : i1  
    %45 = seq.to_clock %clk_i
    %46 = comb.xor %rst_ni, %true : i1
    %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o = seq.compreg name "u_fetch_en/gen_flops.u_prim_flop/u_secure_anchor_flop/q_o" %112#18, %45 reset %46, %c-6_i4 : i4  
    %47 = seq.to_clock %clk_slow_i
    %48 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_1/q_o" %lc_done_i, %47 reset %48, %false : i1  
    %49 = seq.to_clock %clk_slow_i
    %50 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_2/q_o" %u_slow_sync_lc_done2Fu_sync_12Fq_o, %49 reset %50, %false : i1  
    %51 = seq.to_clock %clk_i
    %52 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_sync_lc_done/u_sync_1/q_o" %u_slow_sync_lc_done2Fu_sync_22Fq_o, %51 reset %52, %false : i1  
    %53 = seq.to_clock %clk_i
    %54 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_sync_lc_done/u_sync_2/q_o" %u_sync_lc_done2Fu_sync_12Fq_o, %53 reset %54, %false : i1  
    %55 = hw.bitcast %2 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1>) -> i2
    %56 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1>) -> i2
    %57 = comb.and %55, %56 : i2
    %58 = comb.xor %55, %c-1_i2 : i2
    %59 = comb.or %57, %58 : i2
    %60 = comb.icmp eq %59, %c-1_i2 : i2
    %61 = comb.and %ip_clk_en_q, %60 : i1
    %62 = comb.xor %ip_clk_en_q, %true : i1
    %63 = comb.xor %56, %c-1_i2 : i2
    %64 = comb.and %58, %63 : i2
    %65 = comb.or %64, %55 : i2
    %66 = comb.icmp eq %65, %c-1_i2 : i2
    %67 = comb.and %62, %66 : i1
    %68 = comb.extract %lc_dft_en_i from 0 : (i4) -> i1
    %69 = comb.extract %lc_hw_debug_en_i from 0 : (i4) -> i1
    %70 = comb.and %68, %69 : i1
    %71 = comb.extract %lc_dft_en_i from 1 : (i4) -> i1
    %72 = comb.extract %lc_hw_debug_en_i from 1 : (i4) -> i1
    %73 = comb.or %71, %72 : i1
    %74 = comb.concat %false, %70 : i1, i1
    %75 = comb.concat %73, %false : i1, i1
    %76 = comb.or %74, %75 : i2
    %77 = comb.extract %lc_dft_en_i from 2 : (i4) -> i1
    %78 = comb.extract %lc_hw_debug_en_i from 2 : (i4) -> i1
    %79 = comb.and %77, %78 : i1
    %80 = comb.concat %false, %76 : i1, i2
    %81 = comb.concat %79, %c0_i2 : i1, i2
    %82 = comb.or %80, %81 : i3
    %83 = comb.extract %lc_dft_en_i from 3 : (i4) -> i1
    %84 = comb.extract %lc_hw_debug_en_i from 3 : (i4) -> i1
    %85 = comb.or %83, %84 : i1
    %86 = comb.concat %false, %82 : i1, i3
    %87 = comb.concat %85, %c0_i3 : i1, i3
    %88 = comb.or %86, %87 : i4
    %89 = comb.icmp eq %88, %c5_i4 : i4
    %90 = comb.mux %89, %c6_i4, %c-7_i4 : i4
    %91 = comb.extract %90 from 0 : (i4) -> i1
    %92 = comb.extract %rom_ctrl_good_i from 0 : (i4) -> i1
    %93 = comb.and %91, %92 : i1
    %94 = comb.extract %90 from 1 : (i4) -> i1
    %95 = comb.extract %rom_ctrl_good_i from 1 : (i4) -> i1
    %96 = comb.or %94, %95 : i1
    %97 = comb.concat %false, %93 : i1, i1
    %98 = comb.concat %96, %false : i1, i1
    %99 = comb.or %97, %98 : i2
    %100 = comb.extract %90 from 2 : (i4) -> i1
    %101 = comb.extract %rom_ctrl_good_i from 2 : (i4) -> i1
    %102 = comb.or %100, %101 : i1
    %103 = comb.concat %false, %99 : i1, i2
    %104 = comb.concat %102, %c0_i2 : i1, i2
    %105 = comb.or %103, %104 : i3
    %106 = comb.extract %90 from 3 : (i4) -> i1
    %107 = comb.extract %rom_ctrl_good_i from 3 : (i4) -> i1
    %108 = comb.and %106, %107 : i1
    %109 = comb.concat %false, %105 : i1, i3
    %110 = comb.concat %108, %c0_i3 : i1, i3
    %111 = comb.or %109, %110 : i4
    %112:19 = llhd.combinational -> i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4 {
      %118 = comb.icmp eq %state_q, %c55_i12 : i12
      cf.cond_br %118, ^bb1(%req_pwrup_i, %reset_ongoing_q, %reset_cause_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-1330_i12, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i2, i4, i12, i4), ^bb2
    ^bb1(%119: i1, %120: i1, %121: i2, %122: i4, %123: i12, %124: i4):  // 2 preds: ^bb0, ^bb16
      %125 = comb.or %119, %120 : i1
      cf.cond_br %125, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %121, %low_power_q, %122, %123 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %124, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb2:  // pred: ^bb0
      %126 = comb.icmp eq %state_q, %c-1330_i12 : i12
      cf.cond_br %126, ^bb3(%61, %false, %false, %req_pwrdn_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1600_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb4
    ^bb3(%127: i1, %128: i1, %129: i1, %130: i1, %131: i1, %132: i2, %133: i2, %134: i2, %135: i12, %136: i1, %137: i1):  // 5 preds: ^bb2, ^bb6, ^bb7, ^bb24, ^bb26
      cf.cond_br %127, ^bb32(%128, %129, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %130, %reset_ongoing_q, %131, %132, %133, %134, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %135 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%128, %136, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %137, %reset_ongoing_q, %131, %132, %133, %134, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb4:  // pred: ^bb2
      %138 = comb.icmp eq %state_q, %c-1600_i12 : i12
      cf.cond_br %138, ^bb5, ^bb6
    ^bb5:  // pred: ^bb4
      %139 = comb.icmp eq %pwr_rst_i.rst_lc_src_n, %c-1_i2 : i2
      cf.cond_br %139, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-94_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb6:  // pred: ^bb4
      %140 = comb.icmp eq %state_q, %c-94_i12 : i12
      cf.cond_br %140, ^bb3(%otp_done_i, %true, %false, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1453_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb7
    ^bb7:  // pred: ^bb6
      %141 = comb.icmp eq %state_q, %c-1453_i12 : i12
      cf.cond_br %141, ^bb3(%u_sync_lc_done2Fu_sync_22Fq_o, %false, %true, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c168_i12, %true, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb8
    ^bb8:  // pred: ^bb7
      %142 = comb.icmp eq %state_q, %c168_i12 : i12
      cf.cond_br %142, ^bb9, ^bb11
    ^bb9:  // pred: ^bb8
      %143 = comb.xor %reset_ongoing_q, %true : i1
      %144 = comb.xor %req_pwrup_i, %true : i1
      %145 = comb.or %144, %reset_ongoing_q : i1
      cf.cond_br %145, ^bb10, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %143, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb10:  // pred: ^bb9
      %146 = comb.icmp eq %pwrup_cause_i, %c1_i2 : i2
      %147 = comb.and %146, %28 : i1
      cf.br ^bb32(%false, %false, %147, %false, %false, %false, %true, %false, %false, %false, %req_pwrdn_q, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-966_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb11:  // pred: ^bb8
      %148 = comb.icmp eq %state_q, %c-966_i12 : i12
      cf.cond_br %148, ^bb12, ^bb13
    ^bb12:  // pred: ^bb11
      %149 = comb.xor %strap_sampled_o, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %149, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb13:  // pred: ^bb11
      %150 = comb.icmp eq %state_q, %c1523_i12 : i12
      cf.cond_br %150, ^bb14(%rom_ctrl_done_i, %c0_i2, %false, %c1028_i12 : i4, i2, i1, i12), ^bb15
    ^bb14(%151: i4, %152: i2, %153: i1, %154: i12):  // 2 preds: ^bb13, ^bb15
      %155 = comb.icmp eq %151, %c6_i4 : i4
      cf.cond_br %155, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %152, %153, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %154 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %152, %153, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb15:  // pred: ^bb13
      %156 = comb.icmp eq %state_q, %c1028_i12 : i12
      cf.cond_br %156, ^bb14(%111, %reset_cause_q, %low_power_q, %c868_i12 : i4, i2, i1, i12), ^bb16
    ^bb16:  // pred: ^bb15
      %157 = comb.icmp eq %state_q, %c868_i12 : i12
      cf.cond_br %157, ^bb1(%20, %low_power_entry_i, %c-1_i2, %c-6_i4, %c917_i12, %c5_i4 : i1, i1, i2, i4, i12, i4), ^bb17
    ^bb17:  // pred: ^bb16
      %158 = comb.icmp eq %state_q, %c917_i12 : i12
      cf.cond_br %158, ^bb18, ^bb19
    ^bb18:  // pred: ^bb17
      %159 = comb.mux %67, %20, %25 : i1
      %160 = comb.mux %67, %c1744_i12, %state_q : i12
      %161 = comb.mux %159, %c778_i12, %160 : i12
      %162 = comb.xor %20, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %162, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %161 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb19:  // pred: ^bb17
      %163 = comb.icmp eq %state_q, %c1744_i12 : i12
      cf.cond_br %163, ^bb20, ^bb21
    ^bb20:  // pred: ^bb19
      %164 = comb.xor %low_power_entry_i, %true : i1
      cf.cond_br %164, ^bb32(%false, %false, %true, %true, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-1671_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb21:  // pred: ^bb19
      %165 = comb.icmp eq %state_q, %c-1671_i12 : i12
      cf.cond_br %165, ^bb22, ^bb23
    ^bb22:  // pred: ^bb21
      %166 = comb.and %otp_idle_i, %lc_idle_i, %flash_idle_i : i1
      cf.cond_br %166, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1423_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %true, %false, %true, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb23:  // pred: ^bb21
      %167 = comb.icmp eq %state_q, %c1423_i12 : i12
      cf.cond_br %167, ^bb24(%c1_i32, %rst_lc_req_q, %rst_sys_req_q : i32, i2, i2), ^bb26
    ^bb24(%168: i32, %169: i2, %170: i2):  // 2 preds: ^bb23, ^bb25
      %171 = comb.icmp slt %168, %c2_i32 : i32
      cf.cond_br %171, ^bb25, ^bb3(%32, %false, %false, %req_pwrdn_q, %ip_clk_en_q, %169, %170, %c1_i2, %c-375_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1)
    ^bb25:  // pred: ^bb24
      %172 = comb.extract %168 from 1 : (i32) -> i31
      %173 = comb.extract %168 from 0 : (i32) -> i1
      %174 = comb.icmp ne %172, %c0_i31 : i31
      %175 = comb.or %174, %173 : i1
      %176 = comb.xor %main_pd_ni, %true : i1
      %177 = comb.concat %false, %175 : i1, i1
      %178 = comb.shl %c1_i2, %177 : i2
      %179 = comb.xor bin %178, %c-1_i2 : i2
      %180 = comb.and %169, %179 : i2
      %181 = comb.concat %false, %176 : i1, i1
      %182 = comb.shl %181, %177 : i2
      %183 = comb.or %180, %182 : i2
      %184 = comb.and %170, %179 : i2
      %185 = comb.or %184, %182 : i2
      %186 = comb.add %168, %c1_i32 : i32
      cf.br ^bb24(%186, %183, %185 : i32, i2, i2)
    ^bb26:  // pred: ^bb23
      %187 = comb.icmp eq %state_q, %c-375_i12 : i12
      cf.cond_br %187, ^bb3(%ack_pwrdn_i, %false, %false, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c55_i12, %false, %true : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb27
    ^bb27:  // pred: ^bb26
      %188 = comb.icmp eq %state_q, %c778_i12 : i12
      cf.cond_br %188, ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %true, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1647_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb28
    ^bb28:  // pred: ^bb27
      %189 = comb.icmp eq %state_q, %c1647_i12 : i12
      cf.cond_br %189, ^bb29, ^bb30
    ^bb29:  // pred: ^bb28
      %190 = comb.icmp ne %lc_hw_debug_en_i, %c5_i4 : i4
      %191 = comb.and %26, %190 : i1
      %192 = comb.or %22, %25, %27, %191 : i1
      %193 = comb.replicate %192 : (i1) -> i2
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %193, %c-2_i2, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-4_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb30:  // pred: ^bb28
      %194 = comb.icmp eq %state_q, %c-4_i12 : i12
      cf.cond_br %194, ^bb31, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %c-1_i2, %c-1_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb31:  // pred: ^bb30
      %195 = comb.xor %24, %true : i1
      %196 = comb.xor %ext_rst_pending_q, %true : i1
      %197 = comb.and %32, %195, %196 : i1
      cf.cond_br %197, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %24, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c55_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %24, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb32(%198: i1, %199: i1, %200: i1, %201: i1, %202: i1, %203: i1, %204: i1, %205: i1, %206: i1, %207: i1, %208: i1, %209: i1, %210: i1, %211: i2, %212: i2, %213: i2, %214: i1, %215: i4, %216: i12):  // 21 preds: ^bb1, ^bb1, ^bb3, ^bb3, ^bb5, ^bb5, ^bb9, ^bb10, ^bb12, ^bb14, ^bb14, ^bb18, ^bb20, ^bb20, ^bb22, ^bb22, ^bb27, ^bb29, ^bb30, ^bb31, ^bb31
      %217 = comb.mux %fsm_invalid_i, %c-682_i12, %216 : i12
      llhd.yield %198, %199, %200, %201, %202, %203, %204, %205, %206, %217, %207, %208, %209, %210, %211, %212, %213, %214, %215 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4
    }
    %113 = comb.extract %reset_reqs_i from 0 : (i6) -> i5
    %114 = seq.to_clock %clk_i
    %115 = comb.xor %rst_ni, %true : i1
    %u_reg_otp_init2Fq_o = seq.compreg name "u_reg_otp_init/q_o" %112#0, %114 reset %115, %false : i1  
    %116 = seq.to_clock %clk_i
    %117 = comb.xor %rst_ni, %true : i1
    %u_reg_lc_init2Fq_o = seq.compreg name "u_reg_lc_init/q_o" %112#1, %116 reset %117, %false : i1  
    hw.output %ack_pwrup_q, %req_pwrdn_q, %112#8, %112#2, %112#3, %112#4, %112#5, %112#6, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %112#7, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i5, i2, i1, i1, i1, i1, i1, i1, i1, i4
  }
}

