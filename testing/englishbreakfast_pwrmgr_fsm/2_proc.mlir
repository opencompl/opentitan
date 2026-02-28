module {
  hw.module @pwrmgr_fsm(in %clk_i : i1, in %rst_ni : i1, in %clk_slow_i : i1, in %rst_slow_ni : i1, in %req_pwrup_i : i1, in %pwrup_cause_i : i2, out ack_pwrup_o : i1, out req_pwrdn_o : i1, in %ack_pwrdn_i : i1, in %low_power_entry_i : i1, in %main_pd_ni : i1, in %reset_reqs_i : i5, in %fsm_invalid_i : i1, out clr_slow_req_o : i1, in %usb_ip_clk_en_i : i1, out usb_ip_clk_status_o : i1, out wkup_o : i1, out fall_through_o : i1, out abort_o : i1, out clr_hint_o : i1, out clr_cfg_lock_o : i1, out pwr_rst_o.rst_lc_req : i2, out pwr_rst_o.rst_sys_req : i2, out pwr_rst_o.rstreqs : i4, out pwr_rst_o.reset_cause : i2, in %pwr_rst_i.rst_lc_src_n : i2, in %pwr_rst_i.rst_sys_src_n : i2, out ips_clk_en_o.main_ip_clk_en : i1, out ips_clk_en_o.io_ip_clk_en : i1, out ips_clk_en_o.usb_ip_clk_en : i1, in %clk_en_status_i.main_status : i1, in %clk_en_status_i.io_status : i1, in %clk_en_status_i.usb_status : i1, out otp_init_o : i1, in %otp_done_i : i1, in %otp_idle_i : i1, out lc_init_o : i1, in %lc_done_i : i1, in %lc_idle_i : i1, in %lc_dft_en_i : i4, in %lc_hw_debug_en_i : i4, in %flash_idle_i : i1, in %rom_ctrl_done_i : i4, in %rom_ctrl_good_i : i4, out strap_o : i1, out strap_sampled_o : i1, out low_power_o : i1, out fetch_en_o : i4) {
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
    %c0_i5 = hw.constant 0 : i5
    %c0_i3 = hw.constant 0 : i3
    %c-1_i3 = hw.constant -1 : i3
    %c0_i31 = hw.constant 0 : i31
    %true = hw.constant true
    %0 = hw.struct_create (%clk_en_status_i.main_status, %clk_en_status_i.io_status, %clk_en_status_i.usb_status) : !hw.struct<main_status: i1, io_status: i1, usb_status: i1>
    %1 = hw.struct_create (%rst_lc_req_q, %rst_sys_req_q, %107, %reset_cause_q) : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
    %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause = hw.struct_explode %1 : !hw.struct<rst_lc_req: i2, rst_sys_req: i2, rstreqs: i4, reset_cause: i2>
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
    %20 = comb.icmp ne %reset_reqs_i, %c0_i5 : i5
    %21 = comb.extract %reset_reqs_i from 0 : (i5) -> i1
    %22 = comb.extract %reset_reqs_i from 2 : (i5) -> i1
    %23 = comb.extract %reset_reqs_i from 1 : (i5) -> i1
    %24 = comb.or %22, %23 : i1
    %25 = comb.extract %reset_reqs_i from 3 : (i5) -> i1
    %26 = comb.extract %reset_reqs_i from 4 : (i5) -> i1
    %27 = comb.icmp eq %reset_cause_q, %c1_i2 : i2
    %28 = comb.or %main_pd_ni, %7 : i1
    %29 = comb.icmp eq %reset_cause_q, %c-2_i2 : i2
    %30 = comb.and %29, %13, %19 : i1
    %31 = comb.mux %27, %28, %30 : i1
    %32 = seq.to_clock %clk_i
    %33 = comb.xor %rst_ni, %true : i1
    %ack_pwrup_q = seq.compreg %106#10, %32 reset %33, %false : i1  
    %req_pwrdn_q = seq.compreg %106#11, %32 reset %33, %false : i1  
    %reset_ongoing_q = seq.compreg %106#12, %32 reset %33, %false : i1  
    %ip_clk_en_q = seq.compreg %106#13, %32 reset %33, %false : i1  
    %rst_lc_req_q = seq.compreg %106#14, %32 reset %33, %c-1_i2 : i2  
    %rst_sys_req_q = seq.compreg %106#15, %32 reset %33, %c-1_i2 : i2  
    %reset_cause_q = seq.compreg %106#16, %32 reset %33, %c-1_i2 : i2  
    %low_power_q = seq.compreg %106#17, %32 reset %33, %true : i1  
    %state_q = seq.compreg %106#9, %32 reset %33, %c55_i12 : i12  
    %34 = comb.icmp eq %rst_sys_req_q, %c-1_i2 : i2
    %35 = comb.xor %34, %true : i1
    %36 = comb.and %35, %106#7 : i1
    %37 = comb.or %34, %106#7 : i1
    %38 = comb.mux bin %37, %36, %strap_sampled_o : i1
    %strap_sampled_o = seq.compreg %38, %32 reset %33, %false : i1  
    %39 = seq.to_clock %clk_i
    %40 = comb.xor %rst_ni, %true : i1
    %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o = seq.compreg name "u_fetch_en/gen_flops.u_prim_flop/u_secure_anchor_flop/q_o" %106#18, %39 reset %40, %c-6_i4 : i4  
    %41 = seq.to_clock %clk_slow_i
    %42 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_1/q_o" %lc_done_i, %41 reset %42, %false : i1  
    %43 = seq.to_clock %clk_slow_i
    %44 = comb.xor %rst_slow_ni, %true : i1
    %u_slow_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_slow_sync_lc_done/u_sync_2/q_o" %u_slow_sync_lc_done2Fu_sync_12Fq_o, %43 reset %44, %false : i1  
    %45 = seq.to_clock %clk_i
    %46 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_12Fq_o = seq.compreg name "u_sync_lc_done/u_sync_1/q_o" %u_slow_sync_lc_done2Fu_sync_22Fq_o, %45 reset %46, %false : i1  
    %47 = seq.to_clock %clk_i
    %48 = comb.xor %rst_ni, %true : i1
    %u_sync_lc_done2Fu_sync_22Fq_o = seq.compreg name "u_sync_lc_done/u_sync_2/q_o" %u_sync_lc_done2Fu_sync_12Fq_o, %47 reset %48, %false : i1  
    %49 = hw.bitcast %2 : (!hw.struct<main_ip_clk_en: i1, io_ip_clk_en: i1, usb_ip_clk_en: i1>) -> i3
    %50 = hw.bitcast %0 : (!hw.struct<main_status: i1, io_status: i1, usb_status: i1>) -> i3
    %51 = comb.and %49, %50 : i3
    %52 = comb.xor %49, %c-1_i3 : i3
    %53 = comb.or %51, %52 : i3
    %54 = comb.icmp eq %53, %c-1_i3 : i3
    %55 = comb.and %ip_clk_en_q, %54 : i1
    %56 = comb.xor %ip_clk_en_q, %true : i1
    %57 = comb.xor %50, %c-1_i3 : i3
    %58 = comb.and %52, %57 : i3
    %59 = comb.or %58, %49 : i3
    %60 = comb.icmp eq %59, %c-1_i3 : i3
    %61 = comb.and %56, %60 : i1
    %62 = comb.extract %lc_dft_en_i from 0 : (i4) -> i1
    %63 = comb.extract %lc_hw_debug_en_i from 0 : (i4) -> i1
    %64 = comb.and %62, %63 : i1
    %65 = comb.extract %lc_dft_en_i from 1 : (i4) -> i1
    %66 = comb.extract %lc_hw_debug_en_i from 1 : (i4) -> i1
    %67 = comb.or %65, %66 : i1
    %68 = comb.concat %false, %64 : i1, i1
    %69 = comb.concat %67, %false : i1, i1
    %70 = comb.or %68, %69 : i2
    %71 = comb.extract %lc_dft_en_i from 2 : (i4) -> i1
    %72 = comb.extract %lc_hw_debug_en_i from 2 : (i4) -> i1
    %73 = comb.and %71, %72 : i1
    %74 = comb.concat %false, %70 : i1, i2
    %75 = comb.concat %73, %c0_i2 : i1, i2
    %76 = comb.or %74, %75 : i3
    %77 = comb.extract %lc_dft_en_i from 3 : (i4) -> i1
    %78 = comb.extract %lc_hw_debug_en_i from 3 : (i4) -> i1
    %79 = comb.or %77, %78 : i1
    %80 = comb.concat %false, %76 : i1, i3
    %81 = comb.concat %79, %c0_i3 : i1, i3
    %82 = comb.or %80, %81 : i4
    %83 = comb.icmp eq %82, %c5_i4 : i4
    %84 = comb.mux %83, %c6_i4, %c-7_i4 : i4
    %85 = comb.extract %84 from 0 : (i4) -> i1
    %86 = comb.extract %rom_ctrl_good_i from 0 : (i4) -> i1
    %87 = comb.and %85, %86 : i1
    %88 = comb.extract %84 from 1 : (i4) -> i1
    %89 = comb.extract %rom_ctrl_good_i from 1 : (i4) -> i1
    %90 = comb.or %88, %89 : i1
    %91 = comb.concat %false, %87 : i1, i1
    %92 = comb.concat %90, %false : i1, i1
    %93 = comb.or %91, %92 : i2
    %94 = comb.extract %84 from 2 : (i4) -> i1
    %95 = comb.extract %rom_ctrl_good_i from 2 : (i4) -> i1
    %96 = comb.or %94, %95 : i1
    %97 = comb.concat %false, %93 : i1, i2
    %98 = comb.concat %96, %c0_i2 : i1, i2
    %99 = comb.or %97, %98 : i3
    %100 = comb.extract %84 from 3 : (i4) -> i1
    %101 = comb.extract %rom_ctrl_good_i from 3 : (i4) -> i1
    %102 = comb.and %100, %101 : i1
    %103 = comb.concat %false, %99 : i1, i3
    %104 = comb.concat %102, %c0_i3 : i1, i3
    %105 = comb.or %103, %104 : i4
    %106:19 = llhd.combinational -> i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4 {
      %115 = comb.icmp eq %state_q, %c55_i12 : i12
      cf.cond_br %115, ^bb1(%req_pwrup_i, %reset_ongoing_q, %reset_cause_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-1330_i12, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i2, i4, i12, i4), ^bb2
    ^bb1(%116: i1, %117: i1, %118: i2, %119: i4, %120: i12, %121: i4):  // 2 preds: ^bb0, ^bb16
      %122 = comb.or %116, %117 : i1
      cf.cond_br %122, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %118, %low_power_q, %119, %120 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %121, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb2:  // pred: ^bb0
      %123 = comb.icmp eq %state_q, %c-1330_i12 : i12
      cf.cond_br %123, ^bb3(%55, %false, %false, %req_pwrdn_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1600_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb4
    ^bb3(%124: i1, %125: i1, %126: i1, %127: i1, %128: i1, %129: i2, %130: i2, %131: i2, %132: i12, %133: i1, %134: i1):  // 5 preds: ^bb2, ^bb6, ^bb7, ^bb24, ^bb26
      cf.cond_br %124, ^bb32(%125, %126, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %127, %reset_ongoing_q, %128, %129, %130, %131, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %132 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%125, %133, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %134, %reset_ongoing_q, %128, %129, %130, %131, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb4:  // pred: ^bb2
      %135 = comb.icmp eq %state_q, %c-1600_i12 : i12
      cf.cond_br %135, ^bb5, ^bb6
    ^bb5:  // pred: ^bb4
      %136 = comb.icmp eq %pwr_rst_i.rst_lc_src_n, %c-1_i2 : i2
      cf.cond_br %136, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-94_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c0_i2, %c0_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb6:  // pred: ^bb4
      %137 = comb.icmp eq %state_q, %c-94_i12 : i12
      cf.cond_br %137, ^bb3(%otp_done_i, %true, %false, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c-1453_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb7
    ^bb7:  // pred: ^bb6
      %138 = comb.icmp eq %state_q, %c-1453_i12 : i12
      cf.cond_br %138, ^bb3(%u_sync_lc_done2Fu_sync_22Fq_o, %false, %true, %req_pwrdn_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c168_i12, %true, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb8
    ^bb8:  // pred: ^bb7
      %139 = comb.icmp eq %state_q, %c168_i12 : i12
      cf.cond_br %139, ^bb9, ^bb11
    ^bb9:  // pred: ^bb8
      %140 = comb.xor %reset_ongoing_q, %true : i1
      %141 = comb.xor %req_pwrup_i, %true : i1
      %142 = comb.or %141, %reset_ongoing_q : i1
      cf.cond_br %142, ^bb10, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %140, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb10:  // pred: ^bb9
      %143 = comb.icmp eq %pwrup_cause_i, %c1_i2 : i2
      %144 = comb.and %143, %27 : i1
      cf.br ^bb32(%false, %false, %144, %false, %false, %false, %true, %false, %false, %false, %req_pwrdn_q, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-966_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb11:  // pred: ^bb8
      %145 = comb.icmp eq %state_q, %c-966_i12 : i12
      cf.cond_br %145, ^bb12, ^bb13
    ^bb12:  // pred: ^bb11
      %146 = comb.xor %strap_sampled_o, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %146, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb13:  // pred: ^bb11
      %147 = comb.icmp eq %state_q, %c1523_i12 : i12
      cf.cond_br %147, ^bb14(%rom_ctrl_done_i, %c0_i2, %false, %c1028_i12 : i4, i2, i1, i12), ^bb15
    ^bb14(%148: i4, %149: i2, %150: i1, %151: i12):  // 2 preds: ^bb13, ^bb15
      %152 = comb.icmp eq %148, %c6_i4 : i4
      cf.cond_br %152, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %149, %150, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %151 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %149, %150, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb15:  // pred: ^bb13
      %153 = comb.icmp eq %state_q, %c1028_i12 : i12
      cf.cond_br %153, ^bb14(%105, %reset_cause_q, %low_power_q, %c868_i12 : i4, i2, i1, i12), ^bb16
    ^bb16:  // pred: ^bb15
      %154 = comb.icmp eq %state_q, %c868_i12 : i12
      cf.cond_br %154, ^bb1(%20, %low_power_entry_i, %c-1_i2, %c-6_i4, %c917_i12, %c5_i4 : i1, i1, i2, i4, i12, i4), ^bb17
    ^bb17:  // pred: ^bb16
      %155 = comb.icmp eq %state_q, %c917_i12 : i12
      cf.cond_br %155, ^bb18, ^bb19
    ^bb18:  // pred: ^bb17
      %156 = comb.mux %61, %20, %24 : i1
      %157 = comb.mux %61, %c1744_i12, %state_q : i12
      %158 = comb.mux %156, %c778_i12, %157 : i12
      %159 = comb.xor %20, %true : i1
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %159, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %158 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb19:  // pred: ^bb17
      %160 = comb.icmp eq %state_q, %c1744_i12 : i12
      cf.cond_br %160, ^bb20, ^bb21
    ^bb20:  // pred: ^bb19
      %161 = comb.xor %low_power_entry_i, %true : i1
      cf.cond_br %161, ^bb32(%false, %false, %true, %true, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-1671_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb21:  // pred: ^bb19
      %162 = comb.icmp eq %state_q, %c-1671_i12 : i12
      cf.cond_br %162, ^bb22, ^bb23
    ^bb22:  // pred: ^bb21
      %163 = comb.and %otp_idle_i, %lc_idle_i, %flash_idle_i : i1
      cf.cond_br %163, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1423_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %true, %false, %true, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %true, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1523_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb23:  // pred: ^bb21
      %164 = comb.icmp eq %state_q, %c1423_i12 : i12
      cf.cond_br %164, ^bb24(%c1_i32, %rst_lc_req_q, %rst_sys_req_q : i32, i2, i2), ^bb26
    ^bb24(%165: i32, %166: i2, %167: i2):  // 2 preds: ^bb23, ^bb25
      %168 = comb.icmp slt %165, %c2_i32 : i32
      cf.cond_br %168, ^bb25, ^bb3(%31, %false, %false, %req_pwrdn_q, %ip_clk_en_q, %166, %167, %c1_i2, %c-375_i12, %false, %req_pwrdn_q : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1)
    ^bb25:  // pred: ^bb24
      %169 = comb.extract %165 from 1 : (i32) -> i31
      %170 = comb.extract %165 from 0 : (i32) -> i1
      %171 = comb.icmp ne %169, %c0_i31 : i31
      %172 = comb.or %171, %170 : i1
      %173 = comb.xor %main_pd_ni, %true : i1
      %174 = comb.concat %false, %172 : i1, i1
      %175 = comb.shl %c1_i2, %174 : i2
      %176 = comb.xor bin %175, %c-1_i2 : i2
      %177 = comb.and %166, %176 : i2
      %178 = comb.concat %false, %173 : i1, i1
      %179 = comb.shl %178, %174 : i2
      %180 = comb.or %177, %179 : i2
      %181 = comb.and %167, %176 : i2
      %182 = comb.or %181, %179 : i2
      %183 = comb.add %165, %c1_i32 : i32
      cf.br ^bb24(%183, %180, %182 : i32, i2, i2)
    ^bb26:  // pred: ^bb23
      %184 = comb.icmp eq %state_q, %c-375_i12 : i12
      cf.cond_br %184, ^bb3(%ack_pwrdn_i, %false, %false, %false, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %c55_i12, %false, %true : i1, i1, i1, i1, i1, i2, i2, i2, i12, i1, i1), ^bb27
    ^bb27:  // pred: ^bb26
      %185 = comb.icmp eq %state_q, %c778_i12 : i12
      cf.cond_br %185, ^bb32(%false, %false, %false, %false, %false, %true, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %true, %ip_clk_en_q, %rst_lc_req_q, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c1647_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb28
    ^bb28:  // pred: ^bb27
      %186 = comb.icmp eq %state_q, %c1647_i12 : i12
      cf.cond_br %186, ^bb29, ^bb30
    ^bb29:  // pred: ^bb28
      %187 = comb.icmp ne %lc_hw_debug_en_i, %c5_i4 : i4
      %188 = comb.and %25, %187 : i1
      %189 = comb.or %21, %24, %26, %188 : i1
      %190 = comb.replicate %189 : (i1) -> i2
      cf.br ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %190, %c-2_i2, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c-4_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb30:  // pred: ^bb28
      %191 = comb.icmp eq %state_q, %c-4_i12 : i12
      cf.cond_br %191, ^bb31, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %false, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %false, %c-1_i2, %c-1_i2, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb31:  // pred: ^bb30
      %192 = comb.xor %23, %true : i1
      %193 = comb.and %31, %192 : i1
      cf.cond_br %193, ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %23, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %c55_i12 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12), ^bb32(%false, %false, %false, %false, %false, %false, %false, %false, %23, %ack_pwrup_q, %req_pwrdn_q, %reset_ongoing_q, %ip_clk_en_q, %c-1_i2, %rst_sys_req_q, %reset_cause_q, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o, %state_q : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i2, i1, i4, i12)
    ^bb32(%194: i1, %195: i1, %196: i1, %197: i1, %198: i1, %199: i1, %200: i1, %201: i1, %202: i1, %203: i1, %204: i1, %205: i1, %206: i1, %207: i2, %208: i2, %209: i2, %210: i1, %211: i4, %212: i12):  // 21 preds: ^bb1, ^bb1, ^bb3, ^bb3, ^bb5, ^bb5, ^bb9, ^bb10, ^bb12, ^bb14, ^bb14, ^bb18, ^bb20, ^bb20, ^bb22, ^bb22, ^bb27, ^bb29, ^bb30, ^bb31, ^bb31
      %213 = comb.mux %fsm_invalid_i, %c-682_i12, %212 : i12
      llhd.yield %194, %195, %196, %197, %198, %199, %200, %201, %202, %213, %203, %204, %205, %206, %207, %208, %209, %210, %211 : i1, i1, i1, i1, i1, i1, i1, i1, i1, i12, i1, i1, i1, i1, i2, i2, i2, i1, i4
    }
    %107 = comb.extract %reset_reqs_i from 0 : (i5) -> i4
    %108 = comb.and %106#13, %usb_ip_clk_en_i : i1
    %109 = seq.to_clock %clk_i
    %110 = comb.xor %rst_ni, %true : i1
    %u_usb_ip_clk_en2Fq_o = seq.compreg name "u_usb_ip_clk_en/q_o" %108, %109 reset %110, %false : i1  
    %111 = seq.to_clock %clk_i
    %112 = comb.xor %rst_ni, %true : i1
    %u_reg_otp_init2Fq_o = seq.compreg name "u_reg_otp_init/q_o" %106#0, %111 reset %112, %false : i1  
    %113 = seq.to_clock %clk_i
    %114 = comb.xor %rst_ni, %true : i1
    %u_reg_lc_init2Fq_o = seq.compreg name "u_reg_lc_init/q_o" %106#1, %113 reset %114, %false : i1  
    hw.output %ack_pwrup_q, %req_pwrdn_q, %106#8, %clk_en_status_i.usb_status, %106#2, %106#3, %106#4, %106#5, %106#6, %rst_lc_req, %rst_sys_req, %rstreqs, %reset_cause, %main_ip_clk_en, %io_ip_clk_en, %usb_ip_clk_en, %u_reg_otp_init2Fq_o, %u_reg_lc_init2Fq_o, %106#7, %strap_sampled_o, %low_power_q, %u_fetch_en2Fgen_flops.u_prim_flop2Fu_secure_anchor_flop2Fq_o : i1, i1, i1, i1, i1, i1, i1, i1, i1, i2, i2, i4, i2, i1, i1, i1, i1, i1, i1, i1, i1, i4
  }
}

