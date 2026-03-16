module {
  %false = hw.constant false
  %false_0 = hw.constant false
  %false_1 = hw.constant false
  %false_2 = hw.constant false
  %false_3 = hw.constant false
  fsm.machine @spi_host_fsm(%arg0: i1, %arg1: i1, %arg2: i2, %arg3: i1, %arg4: i1, %arg5: i20, %arg6: i1, %arg7: i16, %arg8: i4, %arg9: i4, %arg10: i4, %arg11: i1, %arg12: i1, %arg13: i1, %arg14: i1, %arg15: i1, %arg16: i1, %arg17: i1, %arg18: i1) -> (i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1) attributes {initialState = "state_0"} {
    %csid_q = fsm.variable "csid_q" {initValue = false} : i1
    %cpol_q = fsm.variable "cpol_q" {initValue = false} : i1
    %cpha_q = fsm.variable "cpha_q" {initValue = false} : i1
    %full_cyc_q = fsm.variable "full_cyc_q" {initValue = false} : i1
    %csnidle_q = fsm.variable "csnidle_q" {initValue = 0 : i4} : i4
    %csnlead_q = fsm.variable "csnlead_q" {initValue = 0 : i4} : i4
    %csntrail_q = fsm.variable "csntrail_q" {initValue = 0 : i4} : i4
    %clkdiv_q = fsm.variable "clkdiv_q" {initValue = 0 : i16} : i16
    %csaat_q = fsm.variable "csaat_q" {initValue = false} : i1
    %cmd_rd_en_q = fsm.variable "cmd_rd_en_q" {initValue = false} : i1
    %cmd_wr_en_q = fsm.variable "cmd_wr_en_q" {initValue = false} : i1
    %cmd_speed_q = fsm.variable "cmd_speed_q" {initValue = 0 : i2} : i2
    %clk_cntr_q = fsm.variable "clk_cntr_q" {initValue = 0 : i16} : i16
    %segment_rd_en_cpha1 = fsm.variable "segment_rd_en_cpha1" {initValue = false} : i1
    %bit_cntr_q = fsm.variable "bit_cntr_q" {initValue = 0 : i3} : i3
    %byte_cntr_cpha0_q = fsm.variable "byte_cntr_cpha0_q" {initValue = 0 : i20} : i20
    %byte_cntr_cpha1_q = fsm.variable "byte_cntr_cpha1_q" {initValue = 0 : i20} : i20
    %wait_cntr_q = fsm.variable "wait_cntr_q" {initValue = 0 : i4} : i4
    %sample_en_q = fsm.variable "sample_en_q" {initValue = false} : i1
    %sample_en_q2 = fsm.variable "sample_en_q2" {initValue = false} : i1
    %u_sck_flop2Fq_o = fsm.variable "u_sck_flop/q_o" {initValue = false} : i1
    %csb_q = fsm.variable "csb_q" {initValue = true} : i1
    %cmd_wr_en_last_bit = fsm.variable "cmd_wr_en_last_bit" {initValue = false} : i1
    %isFirstCycle = fsm.variable "isFirstCycle" {initValue = true} : i1
    %false_4 = hw.constant false
    %_sh1 = fsm.variable "_sh1" {initValue = false} : i1
    %false_5 = hw.constant false
    %_sh1_6 = fsm.variable "_sh1" {initValue = false} : i1
    %false_7 = hw.constant false
    %_sh1_8 = fsm.variable "_sh1" {initValue = false} : i1
    %false_9 = hw.constant false
    %_sh1_10 = fsm.variable "_sh1" {initValue = false} : i1
    %false_11 = hw.constant false
    %_sh1_12 = fsm.variable "_sh1" {initValue = false} : i1
    fsm.state @state_0 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %true = hw.constant true
      %false_13 = hw.constant false
      %0 = comb.icmp ne %arg13, %cpol_q : i1
      %1 = comb.icmp ne %arg12, %cpha_q : i1
      %2 = comb.icmp ne %arg11, %full_cyc_q : i1
      %3 = comb.icmp ne %arg8, %csnidle_q : i4
      %4 = comb.icmp ne %arg10, %csntrail_q : i4
      %5 = comb.icmp ne %arg9, %csnlead_q : i4
      %6 = comb.icmp ne %arg7, %clkdiv_q : i16
      %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
      %false_14 = hw.constant false
      %8 = comb.xor %arg16, %true : i1
      %false_15 = hw.constant false
      %9 = comb.mux %7, %c-2_i3, %c1_i3 : i3
      %10 = comb.mux %arg15, %9, %c0_i3 : i3
      %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %12 = comb.mux %11, %c1_i3, %c-2_i3 : i3
      %13 = comb.xor %arg18, %true : i1
      %14 = comb.and %arg1, %13 : i1
      %15 = comb.mux %14, %10, %12 : i3
      %16 = comb.mux %arg18, %c0_i3, %15 : i3
      %17 = comb.xor %arg1, %true : i1
      %18 = comb.and %13, %17 : i1
      %19 = comb.xor %18, %true : i1
      %20 = comb.and %19, %14 : i1
      %c0_i3_16 = hw.constant 0 : i3
      %false_17 = hw.constant false
      %21 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %22 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %23 = comb.concat %c0_i3, %22 : i3, i1
      %24 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %25 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %26 = comb.concat %c0_i2, %25 : i2, i2
      %27 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %28 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %29 = comb.xor %csb_q, %true : i1
      %30 = comb.xor %21, %true : i1
      %31 = comb.and %30, %29 : i1
      %32 = comb.xor %24, %true : i1
      %33 = comb.and %27, %32, %31 : i1
      %34 = comb.mux %33, %28, %c0_i4 : i4
      %35 = comb.and %24, %31 : i1
      %36 = comb.mux %35, %26, %34 : i4
      %37 = comb.and %21, %29 : i1
      %38 = comb.mux %37, %23, %36 : i4
      %true_18 = hw.constant true
      verif.assert %true_18 : i1
      %39 = comb.and %arg15, %20 : i1
      %40 = comb.mux %39, %arg12, %cpha_q : i1
      %41 = comb.mux %39, %arg11, %full_cyc_q : i1
      %42 = comb.mux %39, %arg3, %cmd_wr_en_q : i1
      %43 = comb.mux %18, %c0_i3_16, %16 : i3
      %44 = comb.icmp ne %43, %c0_i3_16 : i3
      %true_19 = hw.constant true
      %45 = comb.xor %7, %true_19 : i1
      %46 = comb.and %arg15, %45 : i1
      %47 = comb.mux %14, %46, %11 : i1
      %true_20 = hw.constant true
      %48 = comb.xor %arg18, %true_20 : i1
      %true_21 = hw.constant true
      %49 = comb.xor %18, %true_21 : i1
      %50 = comb.xor %40, %true : i1
      %51 = comb.and %50, %13, %44, %49, %48, %47, %42 : i1
      %52 = comb.mux %41, %sample_en_q2, %sample_en_q : i1
      %53 = comb.and %51, %8 : i1
      %54 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %55 = comb.icmp eq %arg5, %c0_i20 : i20
      %56 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %57 = comb.mux %39, %55, %56 : i1
      %58 = comb.mux %17, %54, %57 : i1
      %59 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %60 = comb.icmp eq %arg5, %c0_i20 : i20
      %61 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %62 = comb.mux %39, %60, %61 : i1
      %63 = comb.mux %17, %59, %62 : i1
      %64 = comb.mux %50, %58, %63 : i1
      %65 = comb.or %arg18, %64 : i1
      %66 = comb.xor %53, %true : i1
      %67 = comb.and %51, %66 : i1
      %68 = comb.and %52, %66 : i1
      %false_22 = hw.constant false
      %69 = comb.and %20, %66 : i1
      %70 = comb.and %65, %67, %arg16 : i1
      fsm.output %69, %u_sck_flop2Fq_o, %csb_q, %38, %false_17, %70, %67, %false_13, %68, %false_22, %cmd_speed_q, %41, %false_15, %53, %false_14 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg16, %true : i1
        %9 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %10 = comb.mux %arg15, %9, %c0_i3 : i3
        %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %12 = comb.mux %11, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %c0_i3_13 = hw.constant 0 : i3
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.mux %18, %c0_i3_13, %16 : i3
        %20 = comb.xor %18, %true : i1
        %21 = comb.icmp ne %19, %c0_i3_13 : i3
        %true_14 = hw.constant true
        %22 = comb.xor %7, %true_14 : i1
        %23 = comb.and %arg15, %22 : i1
        %24 = comb.mux %14, %23, %11 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %18, %true_16 : i1
        %true_17 = hw.constant true
        verif.assert %true_17 : i1
        %27 = comb.and %arg15, %20, %14 : i1
        %28 = comb.mux %27, %arg12, %cpha_q : i1
        %29 = comb.mux %27, %arg3, %cmd_wr_en_q : i1
        %30 = comb.xor %28, %true : i1
        %31 = comb.and %30, %13, %21, %26, %25, %24, %29, %8 : i1
        %32 = comb.or %31, %18 : i1
        %33 = comb.and %arg15, %7 : i1
        %true_18 = hw.constant true
        %34 = comb.xor %11, %true_18 : i1
        %35 = comb.mux %14, %33, %34 : i1
        %true_19 = hw.constant true
        %36 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %37 = comb.xor %32, %true_20 : i1
        %38 = comb.and %37, %36, %35 : i1
        fsm.return %38
      } action {
        fsm.update %_sh1_10, %arg1 : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg16, %true : i1
        %9 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %10 = comb.mux %arg15, %9, %c0_i3 : i3
        %11 = comb.xor %arg15, %true : i1
        %false_14 = hw.constant false
        %12 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %13 = comb.mux %12, %c1_i3, %c-2_i3 : i3
        %14 = comb.mux %arg1, %10, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %c0_i3_15 = hw.constant 0 : i3
        %true_16 = hw.constant true
        %16 = comb.xor %7, %true_16 : i1
        %17 = comb.and %arg15, %16 : i1
        %18 = comb.mux %arg1, %17, %12 : i1
        %19 = comb.and %arg1, %18 : i1
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.icmp eq %arg2, %c0_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %23 = comb.icmp eq %arg2, %c1_i2 : i2
        %24 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %25 = comb.icmp eq %arg2, %c-2_i2 : i2
        %26 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %27 = comb.and %arg15, %7 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %12, %true_17 : i1
        %29 = comb.mux %arg1, %27, %28 : i1
        %30 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %31 = comb.xor %19, %true : i1
        %32 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %33 = comb.and %cmd_wr_en_q, %20 : i1
        %34 = comb.or %33, %cmd_wr_en_last_bit : i1
        %true_18 = hw.constant true
        verif.assert %true_18 : i1
        fsm.update %_sh1_8, %11 : i1
        fsm.update %_sh1_6, %12 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %34 : i1
        %35 = comb.and %arg15, %arg1 : i1
        %36 = comb.mux %35, %arg14, %csid_q : i1
        %37 = comb.mux %35, %arg13, %cpol_q : i1
        %38 = comb.mux %35, %arg12, %cpha_q : i1
        %39 = comb.mux %35, %arg8, %csnidle_q : i4
        %40 = comb.mux %35, %arg9, %csnlead_q : i4
        %41 = comb.mux %35, %arg3, %cmd_wr_en_q : i1
        %42 = comb.mux %35, %arg4, %cmd_rd_en_q : i1
        %43 = comb.mux %15, %c0_i3_15, %14 : i3
        %44 = comb.icmp ne %43, %c0_i3_15 : i3
        %45 = comb.xor %38, %true : i1
        %46 = comb.and %45, %44, %19 : i1
        %47 = comb.xor %42, %true : i1
        %48 = comb.xor %41, %true : i1
        %49 = comb.and %47, %48 : i1
        %50 = comb.mux %35, %21, %22 : i1
        %51 = comb.mux %35, %23, %24 : i1
        %52 = comb.mux %35, %25, %26 : i1
        %53 = comb.mux %52, %c-4_i3, %c1_i3 : i3
        %54 = comb.xor %49, %true : i1
        %55 = comb.xor %50, %true : i1
        %56 = comb.and %55, %54, %51 : i1
        %57 = comb.mux %56, %c-2_i3, %53 : i3
        %58 = comb.and %54, %50 : i1
        %59 = comb.mux %58, %c-1_i3, %57 : i3
        %60 = comb.mux %49, %c0_i3, %59 : i3
        %61 = comb.and %44, %arg1 : i1
        %62 = comb.and %31, %61, %29 : i1
        %63 = comb.mux %62, %39, %c0_i4 : i4
        %64 = comb.and %61, %19 : i1
        %65 = comb.mux %64, %40, %63 : i4
        %66 = comb.mux %arg1, %65, %wait_cntr_q : i4
        %67 = comb.xor %44, %true : i1
        %68 = comb.and %32, %67, %arg1 : i1
        %69 = comb.mux %68, %30, %66 : i4
        %70 = comb.icmp ne %43, %c-4_i3 : i3
        %71 = comb.and %31, %70 : i1
        %72 = comb.icmp ne %43, %c3_i3 : i3
        %73 = comb.and %37, %72 : i1
        %74 = comb.and %46, %41, %8 : i1
        %true_19 = hw.constant true
        %75 = comb.xor %35, %true_19 : i1
        %76 = comb.or %74, %75 : i1
        %77 = comb.mux %76, %clk_cntr_q, %arg7 : i16
        %true_20 = hw.constant true
        %78 = comb.xor %46, %true_20 : i1
        %79 = comb.or %74, %78 : i1
        %80 = comb.mux %79, %bit_cntr_q, %60 : i3
        %true_21 = hw.constant true
        %81 = comb.xor %35, %true_21 : i1
        %82 = comb.or %74, %81 : i1
        %83 = comb.mux %82, %byte_cntr_cpha0_q, %arg5 : i20
        %true_22 = hw.constant true
        %84 = comb.xor %35, %true_22 : i1
        %85 = comb.or %74, %84 : i1
        %86 = comb.mux %85, %byte_cntr_cpha1_q, %arg5 : i20
        %87 = comb.mux %74, %wait_cntr_q, %69 : i4
        %88 = comb.mux bin %74, %u_sck_flop2Fq_o, %73 : i1
        fsm.update %u_sck_flop2Fq_o, %88 : i1
        fsm.update %wait_cntr_q, %87 : i4
        fsm.update %byte_cntr_cpha1_q, %86 : i20
        fsm.update %byte_cntr_cpha0_q, %83 : i20
        fsm.update %bit_cntr_q, %80 : i3
        fsm.update %clk_cntr_q, %77 : i16
        %89 = comb.xor %74, %true : i1
        %90 = comb.and %35, %89 : i1
        %91 = comb.mux %90, %arg14, %csid_q : i1
        %92 = comb.mux %90, %arg13, %cpol_q : i1
        %93 = comb.mux %90, %arg12, %cpha_q : i1
        %94 = comb.mux %90, %arg11, %full_cyc_q : i1
        %95 = comb.mux %90, %arg8, %csnidle_q : i4
        %96 = comb.mux %90, %arg9, %csnlead_q : i4
        %97 = comb.mux %90, %arg10, %csntrail_q : i4
        %98 = comb.mux %90, %arg7, %clkdiv_q : i16
        %99 = comb.mux %90, %arg6, %csaat_q : i1
        %100 = comb.mux %90, %arg3, %cmd_wr_en_q : i1
        %101 = comb.mux %90, %arg4, %cmd_rd_en_q : i1
        %102 = comb.mux %90, %arg2, %cmd_speed_q : i2
        %103 = comb.and %44, %89 : i1
        %104 = comb.mux bin %103, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %105 = comb.and %arg1, %89 : i1
        %106 = comb.mux %105, %46, %sample_en_q : i1
        %107 = comb.mux %105, %sample_en_q, %sample_en_q2 : i1
        %108 = comb.mux %89, %71, %csb_q : i1
        %109 = comb.or %36, %108 : i1
        fsm.update %_sh1_12, %89 : i1
        fsm.update %csb_q, %109 : i1
        fsm.update %sample_en_q2, %107 : i1
        fsm.update %sample_en_q, %106 : i1
        fsm.update %segment_rd_en_cpha1, %104 : i1
        fsm.update %cmd_speed_q, %102 : i2
        fsm.update %cmd_wr_en_q, %100 : i1
        fsm.update %cmd_rd_en_q, %101 : i1
        fsm.update %csaat_q, %99 : i1
        fsm.update %clkdiv_q, %98 : i16
        fsm.update %csntrail_q, %97 : i4
        fsm.update %csnlead_q, %96 : i4
        fsm.update %csnidle_q, %95 : i4
        fsm.update %full_cyc_q, %94 : i1
        fsm.update %cpha_q, %93 : i1
        fsm.update %cpol_q, %92 : i1
        fsm.update %csid_q, %91 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg16, %true : i1
        %9 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %10 = comb.mux %arg15, %9, %c0_i3 : i3
        %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %12 = comb.mux %11, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %c0_i3_13 = hw.constant 0 : i3
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.mux %18, %c0_i3_13, %16 : i3
        %20 = comb.xor %18, %true : i1
        %21 = comb.icmp ne %19, %c0_i3_13 : i3
        %true_14 = hw.constant true
        %22 = comb.xor %7, %true_14 : i1
        %23 = comb.and %arg15, %22 : i1
        %24 = comb.mux %14, %23, %11 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %18, %true_16 : i1
        %true_17 = hw.constant true
        verif.assert %true_17 : i1
        %27 = comb.and %arg15, %20, %14 : i1
        %28 = comb.mux %27, %arg12, %cpha_q : i1
        %29 = comb.mux %27, %arg3, %cmd_wr_en_q : i1
        %30 = comb.xor %28, %true : i1
        %31 = comb.and %30, %13, %21, %26, %25, %24, %29, %8 : i1
        %32 = comb.or %31, %18 : i1
        %true_18 = hw.constant true
        %33 = comb.xor %7, %true_18 : i1
        %34 = comb.and %arg15, %33 : i1
        %35 = comb.mux %14, %34, %11 : i1
        %true_19 = hw.constant true
        %36 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %37 = comb.xor %32, %true_20 : i1
        %38 = comb.and %37, %36, %35 : i1
        fsm.return %38
      } action {
        fsm.update %_sh1_10, %arg1 : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg16, %true : i1
        %9 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %10 = comb.mux %arg15, %9, %c0_i3 : i3
        %11 = comb.xor %arg15, %true : i1
        %false_14 = hw.constant false
        %12 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %13 = comb.mux %12, %c1_i3, %c-2_i3 : i3
        %14 = comb.mux %arg1, %10, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %c0_i3_15 = hw.constant 0 : i3
        %true_16 = hw.constant true
        %16 = comb.xor %7, %true_16 : i1
        %17 = comb.and %arg15, %16 : i1
        %18 = comb.mux %arg1, %17, %12 : i1
        %19 = comb.and %arg1, %18 : i1
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.icmp eq %arg2, %c0_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %23 = comb.icmp eq %arg2, %c1_i2 : i2
        %24 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %25 = comb.icmp eq %arg2, %c-2_i2 : i2
        %26 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %27 = comb.and %arg15, %7 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %12, %true_17 : i1
        %29 = comb.mux %arg1, %27, %28 : i1
        %30 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %31 = comb.xor %19, %true : i1
        %32 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %33 = comb.and %cmd_wr_en_q, %20 : i1
        %34 = comb.or %33, %cmd_wr_en_last_bit : i1
        %true_18 = hw.constant true
        verif.assert %true_18 : i1
        fsm.update %_sh1_8, %11 : i1
        fsm.update %_sh1_6, %12 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %34 : i1
        %35 = comb.and %arg15, %arg1 : i1
        %36 = comb.mux %35, %arg14, %csid_q : i1
        %37 = comb.mux %35, %arg13, %cpol_q : i1
        %38 = comb.mux %35, %arg12, %cpha_q : i1
        %39 = comb.mux %35, %arg8, %csnidle_q : i4
        %40 = comb.mux %35, %arg9, %csnlead_q : i4
        %41 = comb.mux %35, %arg3, %cmd_wr_en_q : i1
        %42 = comb.mux %35, %arg4, %cmd_rd_en_q : i1
        %43 = comb.mux %15, %c0_i3_15, %14 : i3
        %44 = comb.icmp ne %43, %c0_i3_15 : i3
        %45 = comb.xor %38, %true : i1
        %46 = comb.and %45, %44, %19 : i1
        %47 = comb.xor %42, %true : i1
        %48 = comb.xor %41, %true : i1
        %49 = comb.and %47, %48 : i1
        %50 = comb.mux %35, %21, %22 : i1
        %51 = comb.mux %35, %23, %24 : i1
        %52 = comb.mux %35, %25, %26 : i1
        %53 = comb.mux %52, %c-4_i3, %c1_i3 : i3
        %54 = comb.xor %49, %true : i1
        %55 = comb.xor %50, %true : i1
        %56 = comb.and %55, %54, %51 : i1
        %57 = comb.mux %56, %c-2_i3, %53 : i3
        %58 = comb.and %54, %50 : i1
        %59 = comb.mux %58, %c-1_i3, %57 : i3
        %60 = comb.mux %49, %c0_i3, %59 : i3
        %61 = comb.and %44, %arg1 : i1
        %62 = comb.and %31, %61, %29 : i1
        %63 = comb.mux %62, %39, %c0_i4 : i4
        %64 = comb.and %61, %19 : i1
        %65 = comb.mux %64, %40, %63 : i4
        %66 = comb.mux %arg1, %65, %wait_cntr_q : i4
        %67 = comb.xor %44, %true : i1
        %68 = comb.and %32, %67, %arg1 : i1
        %69 = comb.mux %68, %30, %66 : i4
        %70 = comb.icmp ne %43, %c-4_i3 : i3
        %71 = comb.and %31, %70 : i1
        %72 = comb.icmp ne %43, %c3_i3 : i3
        %73 = comb.and %37, %72 : i1
        %74 = comb.and %46, %41, %8 : i1
        %true_19 = hw.constant true
        %75 = comb.xor %35, %true_19 : i1
        %76 = comb.or %74, %75 : i1
        %77 = comb.mux %76, %clk_cntr_q, %arg7 : i16
        %true_20 = hw.constant true
        %78 = comb.xor %46, %true_20 : i1
        %79 = comb.or %74, %78 : i1
        %80 = comb.mux %79, %bit_cntr_q, %60 : i3
        %true_21 = hw.constant true
        %81 = comb.xor %35, %true_21 : i1
        %82 = comb.or %74, %81 : i1
        %83 = comb.mux %82, %byte_cntr_cpha0_q, %arg5 : i20
        %true_22 = hw.constant true
        %84 = comb.xor %35, %true_22 : i1
        %85 = comb.or %74, %84 : i1
        %86 = comb.mux %85, %byte_cntr_cpha1_q, %arg5 : i20
        %87 = comb.mux %74, %wait_cntr_q, %69 : i4
        %88 = comb.mux bin %74, %u_sck_flop2Fq_o, %73 : i1
        fsm.update %u_sck_flop2Fq_o, %88 : i1
        fsm.update %wait_cntr_q, %87 : i4
        fsm.update %byte_cntr_cpha1_q, %86 : i20
        fsm.update %byte_cntr_cpha0_q, %83 : i20
        fsm.update %bit_cntr_q, %80 : i3
        fsm.update %clk_cntr_q, %77 : i16
        %89 = comb.xor %74, %true : i1
        %90 = comb.and %35, %89 : i1
        %91 = comb.mux %90, %arg14, %csid_q : i1
        %92 = comb.mux %90, %arg13, %cpol_q : i1
        %93 = comb.mux %90, %arg12, %cpha_q : i1
        %94 = comb.mux %90, %arg11, %full_cyc_q : i1
        %95 = comb.mux %90, %arg8, %csnidle_q : i4
        %96 = comb.mux %90, %arg9, %csnlead_q : i4
        %97 = comb.mux %90, %arg10, %csntrail_q : i4
        %98 = comb.mux %90, %arg7, %clkdiv_q : i16
        %99 = comb.mux %90, %arg6, %csaat_q : i1
        %100 = comb.mux %90, %arg3, %cmd_wr_en_q : i1
        %101 = comb.mux %90, %arg4, %cmd_rd_en_q : i1
        %102 = comb.mux %90, %arg2, %cmd_speed_q : i2
        %103 = comb.and %44, %89 : i1
        %104 = comb.mux bin %103, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %105 = comb.and %arg1, %89 : i1
        %106 = comb.mux %105, %46, %sample_en_q : i1
        %107 = comb.mux %105, %sample_en_q, %sample_en_q2 : i1
        %108 = comb.mux %89, %71, %csb_q : i1
        %109 = comb.or %36, %108 : i1
        fsm.update %_sh1_12, %89 : i1
        fsm.update %csb_q, %109 : i1
        fsm.update %sample_en_q2, %107 : i1
        fsm.update %sample_en_q, %106 : i1
        fsm.update %segment_rd_en_cpha1, %104 : i1
        fsm.update %cmd_speed_q, %102 : i2
        fsm.update %cmd_wr_en_q, %100 : i1
        fsm.update %cmd_rd_en_q, %101 : i1
        fsm.update %csaat_q, %99 : i1
        fsm.update %clkdiv_q, %98 : i16
        fsm.update %csntrail_q, %97 : i4
        fsm.update %csnlead_q, %96 : i4
        fsm.update %csnidle_q, %95 : i4
        fsm.update %full_cyc_q, %94 : i1
        fsm.update %cpha_q, %93 : i1
        fsm.update %cpol_q, %92 : i1
        fsm.update %csid_q, %91 : i1
      }
      fsm.transition @state_0 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg16, %true : i1
        %9 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %10 = comb.mux %arg15, %9, %c0_i3 : i3
        %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %12 = comb.mux %11, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %c0_i3_13 = hw.constant 0 : i3
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.mux %18, %c0_i3_13, %16 : i3
        %20 = comb.xor %18, %true : i1
        %21 = comb.icmp ne %19, %c0_i3_13 : i3
        %true_14 = hw.constant true
        %22 = comb.xor %7, %true_14 : i1
        %23 = comb.and %arg15, %22 : i1
        %24 = comb.mux %14, %23, %11 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %18, %true_16 : i1
        %true_17 = hw.constant true
        verif.assert %true_17 : i1
        %27 = comb.and %arg15, %20, %14 : i1
        %28 = comb.mux %27, %arg12, %cpha_q : i1
        %29 = comb.mux %27, %arg3, %cmd_wr_en_q : i1
        %30 = comb.xor %28, %true : i1
        %31 = comb.and %30, %13, %21, %26, %25, %24, %29, %8 : i1
        %true_18 = hw.constant true
        %32 = comb.xor %arg15, %true_18 : i1
        %33 = comb.and %14, %32 : i1
        %34 = comb.or %31, %18, %arg18, %33 : i1
        fsm.return %34
      } action {
        fsm.update %_sh1_10, %arg1 : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg16, %true : i1
        %9 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %10 = comb.mux %arg15, %9, %c0_i3 : i3
        %11 = comb.xor %arg15, %true : i1
        %false_14 = hw.constant false
        %12 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %13 = comb.mux %12, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %15 = comb.and %arg1, %14 : i1
        %16 = comb.mux %15, %10, %13 : i3
        %17 = comb.mux %arg18, %c0_i3, %16 : i3
        %18 = comb.xor %arg1, %true : i1
        %19 = comb.and %14, %18 : i1
        %20 = comb.xor %19, %true : i1
        %c0_i3_15 = hw.constant 0 : i3
        %true_16 = hw.constant true
        %21 = comb.xor %7, %true_16 : i1
        %22 = comb.and %arg15, %21 : i1
        %23 = comb.mux %15, %22, %12 : i1
        %true_17 = hw.constant true
        %24 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %25 = comb.xor %19, %true_18 : i1
        %26 = comb.and %25, %24, %23 : i1
        %27 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %28 = comb.icmp eq %arg2, %c0_i2 : i2
        %29 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %30 = comb.icmp eq %arg2, %c1_i2 : i2
        %31 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %32 = comb.icmp eq %arg2, %c-2_i2 : i2
        %33 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %34 = comb.and %arg15, %7 : i1
        %true_19 = hw.constant true
        %35 = comb.xor %12, %true_19 : i1
        %36 = comb.mux %15, %34, %35 : i1
        %true_20 = hw.constant true
        %37 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %38 = comb.xor %19, %true_21 : i1
        %39 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %40 = comb.xor %26, %true : i1
        %41 = comb.or %arg18, %arg1 : i1
        %42 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %43 = comb.and %cmd_wr_en_q, %27 : i1
        %44 = comb.or %43, %cmd_wr_en_last_bit : i1
        %true_22 = hw.constant true
        verif.assert %true_22 : i1
        fsm.update %_sh1_8, %11 : i1
        fsm.update %_sh1_6, %12 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %44 : i1
        %45 = comb.and %arg15, %20, %15 : i1
        %46 = comb.mux %45, %arg14, %csid_q : i1
        %47 = comb.mux %45, %arg13, %cpol_q : i1
        %48 = comb.mux %45, %arg12, %cpha_q : i1
        %49 = comb.mux %45, %arg8, %csnidle_q : i4
        %50 = comb.mux %45, %arg9, %csnlead_q : i4
        %51 = comb.mux %45, %arg3, %cmd_wr_en_q : i1
        %52 = comb.mux %45, %arg4, %cmd_rd_en_q : i1
        %53 = comb.mux %45, %arg7, %clk_cntr_q : i16
        %54 = comb.mux %arg18, %c0_i16, %53 : i16
        %55 = comb.mux %19, %c0_i3_15, %17 : i3
        %56 = comb.icmp ne %55, %c0_i3_15 : i3
        %57 = comb.xor %48, %true : i1
        %58 = comb.and %57, %14, %56, %26 : i1
        %59 = comb.xor %52, %true : i1
        %60 = comb.xor %51, %true : i1
        %61 = comb.and %59, %60 : i1
        %62 = comb.mux %45, %28, %29 : i1
        %63 = comb.mux %45, %30, %31 : i1
        %64 = comb.mux %45, %32, %33 : i1
        %65 = comb.mux %64, %c-4_i3, %c1_i3 : i3
        %66 = comb.xor %61, %true : i1
        %67 = comb.xor %62, %true : i1
        %68 = comb.and %67, %66, %63 : i1
        %69 = comb.mux %68, %c-2_i3, %65 : i3
        %70 = comb.and %66, %62 : i1
        %71 = comb.mux %70, %c-1_i3, %69 : i3
        %72 = comb.mux %61, %c0_i3, %71 : i3
        %73 = comb.and %arg1, %58 : i1
        %74 = comb.mux %73, %72, %bit_cntr_q : i3
        %75 = comb.mux %arg18, %c0_i3, %74 : i3
        %76 = comb.mux %45, %arg5, %byte_cntr_cpha0_q : i20
        %77 = comb.mux %arg18, %c0_i20, %76 : i20
        %78 = comb.mux %45, %arg5, %byte_cntr_cpha1_q : i20
        %79 = comb.mux %arg18, %c0_i20, %78 : i20
        %80 = comb.and %56, %15 : i1
        %81 = comb.and %40, %80, %38, %37, %36 : i1
        %82 = comb.mux %81, %49, %c0_i4 : i4
        %83 = comb.and %80, %26 : i1
        %84 = comb.mux %83, %50, %82 : i4
        %85 = comb.mux %41, %84, %wait_cntr_q : i4
        %86 = comb.mux %arg18, %c0_i4, %85 : i4
        %87 = comb.xor %56, %true : i1
        %88 = comb.and %42, %87, %15 : i1
        %89 = comb.mux %88, %39, %86 : i4
        %90 = comb.icmp ne %55, %c-4_i3 : i3
        %91 = comb.and %40, %90 : i1
        %92 = comb.icmp ne %55, %c3_i3 : i3
        %93 = comb.and %47, %92 : i1
        %94 = comb.and %58, %51, %8 : i1
        %95 = comb.mux %94, %clk_cntr_q, %54 : i16
        %96 = comb.mux %94, %bit_cntr_q, %75 : i3
        %97 = comb.mux %94, %byte_cntr_cpha0_q, %77 : i20
        %98 = comb.mux %94, %byte_cntr_cpha1_q, %79 : i20
        %99 = comb.mux %94, %wait_cntr_q, %89 : i4
        %100 = comb.mux bin %94, %u_sck_flop2Fq_o, %93 : i1
        fsm.update %u_sck_flop2Fq_o, %100 : i1
        fsm.update %wait_cntr_q, %99 : i4
        fsm.update %byte_cntr_cpha1_q, %98 : i20
        fsm.update %byte_cntr_cpha0_q, %97 : i20
        fsm.update %bit_cntr_q, %96 : i3
        fsm.update %clk_cntr_q, %95 : i16
        %101 = comb.xor %94, %true : i1
        %102 = comb.and %45, %101 : i1
        %103 = comb.mux %102, %arg14, %csid_q : i1
        %104 = comb.mux %102, %arg13, %cpol_q : i1
        %105 = comb.mux %102, %arg12, %cpha_q : i1
        %106 = comb.mux %102, %arg11, %full_cyc_q : i1
        %107 = comb.mux %102, %arg8, %csnidle_q : i4
        %108 = comb.mux %102, %arg9, %csnlead_q : i4
        %109 = comb.mux %102, %arg10, %csntrail_q : i4
        %110 = comb.mux %102, %arg7, %clkdiv_q : i16
        %111 = comb.mux %102, %arg6, %csaat_q : i1
        %112 = comb.mux %102, %arg3, %cmd_wr_en_q : i1
        %113 = comb.mux %102, %arg4, %cmd_rd_en_q : i1
        %114 = comb.mux %102, %arg2, %cmd_speed_q : i2
        %115 = comb.and %56, %101 : i1
        %116 = comb.mux bin %115, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %117 = comb.and %arg1, %101 : i1
        %118 = comb.mux %117, %58, %sample_en_q : i1
        %119 = comb.mux %117, %sample_en_q, %sample_en_q2 : i1
        %120 = comb.mux %101, %91, %csb_q : i1
        %121 = comb.or %46, %120 : i1
        fsm.update %_sh1_12, %101 : i1
        fsm.update %csb_q, %121 : i1
        fsm.update %sample_en_q2, %119 : i1
        fsm.update %sample_en_q, %118 : i1
        fsm.update %segment_rd_en_cpha1, %116 : i1
        fsm.update %cmd_speed_q, %114 : i2
        fsm.update %cmd_wr_en_q, %112 : i1
        fsm.update %cmd_rd_en_q, %113 : i1
        fsm.update %csaat_q, %111 : i1
        fsm.update %clkdiv_q, %110 : i16
        fsm.update %csntrail_q, %109 : i4
        fsm.update %csnlead_q, %108 : i4
        fsm.update %csnidle_q, %107 : i4
        fsm.update %full_cyc_q, %106 : i1
        fsm.update %cpha_q, %105 : i1
        fsm.update %cpol_q, %104 : i1
        fsm.update %csid_q, %103 : i1
      }
    }
    fsm.state @state_1 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i16 = hw.constant 0 : i16
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %true = hw.constant true
      %false_13 = hw.constant false
      %false_14 = hw.constant false
      %true_15 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %false_16 = hw.constant false
      %2 = comb.and %arg1, %0 : i1
      %3 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %4 = comb.mux %3, %c1_i3, %c-2_i3 : i3
      %5 = comb.xor %arg18, %true : i1
      %6 = comb.and %2, %5 : i1
      %7 = comb.xor %2, %true : i1
      %8 = comb.and %5, %7 : i1
      %c1_i3_17 = hw.constant 1 : i3
      %9 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
      %10 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
      %11 = comb.xor %cpha_q, %true : i1
      %false_18 = hw.constant false
      %12 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %13 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %14 = comb.mux %11, %12, %13 : i1
      %15 = comb.or %arg18, %14 : i1
      %16 = comb.mux %full_cyc_q, %sample_en_q2, %sample_en_q : i1
      %17 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %18 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %19 = comb.concat %c0_i3, %18 : i3, i1
      %20 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %21 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %22 = comb.concat %c0_i2, %21 : i2, i2
      %23 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %24 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %25 = comb.xor %csb_q, %true : i1
      %26 = comb.xor %17, %true : i1
      %27 = comb.and %26, %25 : i1
      %28 = comb.xor %20, %true : i1
      %29 = comb.and %23, %28, %27 : i1
      %30 = comb.mux %29, %24, %c0_i4 : i4
      %31 = comb.and %20, %27 : i1
      %32 = comb.mux %31, %22, %30 : i4
      %33 = comb.and %17, %25 : i1
      %34 = comb.mux %33, %19, %32 : i4
      %35 = comb.xor %isFirstCycle, %true : i1
      %36 = comb.and %35, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %5 : i1
      %37 = comb.xor %36, %true : i1
      verif.assert %37 : i1
      %false_19 = hw.constant false
      %true_20 = hw.constant true
      %38 = comb.concat %false_19, %3, %true_20 : i1, i1, i1
      %39 = comb.mux %6, %38, %4 : i3
      %40 = comb.mux %arg18, %c0_i3, %39 : i3
      %41 = comb.mux %8, %c1_i3_17, %40 : i3
      %42 = comb.icmp ne %41, %c1_i3_17 : i3
      %43 = comb.and %5, %42 : i1
      %44 = comb.xor %6, %3 : i1
      %true_21 = hw.constant true
      %45 = comb.xor %arg18, %true_21 : i1
      %46 = comb.and %45, %44 : i1
      %47 = comb.or %8, %46 : i1
      %48 = comb.and %43, %47 : i1
      %true_22 = hw.constant true
      %49 = comb.xor %arg18, %true_22 : i1
      %true_23 = hw.constant true
      %50 = comb.xor %8, %true_23 : i1
      %51 = comb.and %50, %49, %6, %3 : i1
      %52 = comb.and %43, %51, %9 : i1
      %53 = comb.mux %11, %48, %52 : i1
      %54 = comb.and %53, %cmd_wr_en_q : i1
      %55 = comb.and %54, %1 : i1
      %56 = comb.xor %55, %true : i1
      %57 = comb.and %54, %56 : i1
      %58 = comb.and %16, %56 : i1
      %59 = comb.and %cpha_q, %43, %51, %10, %56 : i1
      %60 = comb.and %15, %57, %arg16 : i1
      fsm.output %false_14, %u_sck_flop2Fq_o, %csb_q, %34, %false_18, %60, %57, %false_13, %58, %59, %cmd_speed_q, %full_cyc_q, %false_16, %55, %true_15 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c1_i3_13 = hw.constant 1 : i3
        %5 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %6 = comb.xor %isFirstCycle, %true : i1
        %7 = comb.and %6, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %8 = comb.xor %7, %true : i1
        %9 = comb.and %arg1, %0 : i1
        %10 = comb.and %9, %4 : i1
        %false_14 = hw.constant false
        %true_15 = hw.constant true
        %11 = comb.concat %false_14, %2, %true_15 : i1, i1, i1
        %12 = comb.mux %10, %11, %3 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %9, %true : i1
        %15 = comb.and %4, %14 : i1
        %16 = comb.mux %15, %c1_i3_13, %13 : i3
        %17 = comb.icmp ne %16, %c1_i3_13 : i3
        %18 = comb.and %4, %17 : i1
        %19 = comb.xor %10, %2 : i1
        %true_16 = hw.constant true
        %20 = comb.xor %arg18, %true_16 : i1
        %21 = comb.and %20, %19 : i1
        %22 = comb.or %15, %21 : i1
        %23 = comb.and %18, %22 : i1
        %true_17 = hw.constant true
        %24 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %25 = comb.xor %15, %true_18 : i1
        %26 = comb.and %18, %25, %24, %10, %2, %5 : i1
        verif.assert %8 : i1
        %27 = comb.xor %cpha_q, %true : i1
        %28 = comb.mux %27, %23, %26 : i1
        %29 = comb.and %28, %cmd_wr_en_q, %1 : i1
        %30 = comb.or %29, %15 : i1
        %true_19 = hw.constant true
        %31 = comb.xor %2, %true_19 : i1
        %true_20 = hw.constant true
        %32 = comb.xor %10, %true_20 : i1
        %true_21 = hw.constant true
        %33 = comb.xor %arg18, %true_21 : i1
        %true_22 = hw.constant true
        %34 = comb.xor %30, %true_22 : i1
        %35 = comb.and %34, %33, %32, %31 : i1
        fsm.return %35
      } action {
        %false_13 = hw.constant false
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_14 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.mux %1, %clkdiv_q, %2 : i16
        %4 = comb.xor %arg16, %true : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.xor %arg15, %true : i1
        %false_15 = hw.constant false
        %c1_i3_16 = hw.constant 1 : i3
        %7 = comb.mux %5, %c1_i3_16, %c-2_i3 : i3
        %8 = comb.xor %5, %true : i1
        %c1_i3_17 = hw.constant 1 : i3
        %9 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %10 = comb.xor %cpha_q, %true : i1
        %11 = comb.xor %cmd_rd_en_q, %true : i1
        %12 = comb.xor %cmd_wr_en_q, %true : i1
        %13 = comb.and %11, %12 : i1
        %14 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %15 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %16 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %17 = comb.mux %16, %c-4_i3, %c1_i3 : i3
        %18 = comb.xor %13, %true : i1
        %19 = comb.xor %14, %true : i1
        %20 = comb.and %19, %18, %15 : i1
        %21 = comb.mux %20, %c-2_i3, %17 : i3
        %22 = comb.and %18, %14 : i1
        %23 = comb.mux %22, %c-1_i3, %21 : i3
        %24 = comb.mux %13, %c0_i3, %23 : i3
        %25 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %26 = comb.and %cmd_wr_en_q, %9 : i1
        %27 = comb.or %26, %cmd_wr_en_last_bit : i1
        %28 = comb.xor %isFirstCycle, %true : i1
        %29 = comb.and %28, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %30 = comb.xor %29, %true : i1
        verif.assert %30 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %6 : i1
        fsm.update %_sh1_6, %false_13 : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        fsm.update %cmd_wr_en_last_bit, %27 : i1
        %31 = comb.mux %8, %c1_i3_17, %7 : i3
        %32 = comb.icmp ne %31, %c1_i3_17 : i3
        %33 = comb.and %10, %32 : i1
        %34 = comb.and %32, %5 : i1
        %35 = comb.mux %34, %csnlead_q, %c0_i4 : i4
        %36 = comb.mux %5, %35, %wait_cntr_q : i4
        %37 = comb.xor %32, %true : i1
        %38 = comb.and %37, %5 : i1
        %39 = comb.mux %38, %25, %36 : i4
        %40 = comb.icmp ne %31, %c3_i3 : i3
        %41 = comb.and %cpol_q, %40 : i1
        %42 = comb.and %33, %cmd_wr_en_q, %4 : i1
        %43 = comb.or %42, %0 : i1
        %44 = comb.mux %43, %clk_cntr_q, %3 : i16
        %true_18 = hw.constant true
        %45 = comb.xor %33, %true_18 : i1
        %46 = comb.or %42, %8, %45 : i1
        %47 = comb.mux %46, %bit_cntr_q, %24 : i3
        %48 = comb.mux %42, %wait_cntr_q, %39 : i4
        %49 = comb.mux bin %42, %u_sck_flop2Fq_o, %41 : i1
        fsm.update %u_sck_flop2Fq_o, %49 : i1
        fsm.update %wait_cntr_q, %48 : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %47 : i3
        fsm.update %clk_cntr_q, %44 : i16
        %50 = comb.xor %42, %true : i1
        %51 = comb.and %32, %50 : i1
        %52 = comb.mux bin %51, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %53 = comb.and %5, %50 : i1
        %54 = comb.mux %53, %33, %sample_en_q : i1
        %55 = comb.mux %53, %sample_en_q, %sample_en_q2 : i1
        %56 = comb.and %42, %csb_q : i1
        %57 = comb.or %csid_q, %56 : i1
        fsm.update %_sh1_12, %50 : i1
        fsm.update %csb_q, %57 : i1
        fsm.update %sample_en_q2, %55 : i1
        fsm.update %sample_en_q, %54 : i1
        fsm.update %segment_rd_en_cpha1, %52 : i1
      }
      fsm.transition @state_3 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c1_i3_13 = hw.constant 1 : i3
        %5 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %6 = comb.xor %isFirstCycle, %true : i1
        %7 = comb.and %6, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %8 = comb.xor %7, %true : i1
        %9 = comb.and %arg1, %0 : i1
        %10 = comb.and %9, %4 : i1
        %false_14 = hw.constant false
        %true_15 = hw.constant true
        %11 = comb.concat %false_14, %2, %true_15 : i1, i1, i1
        %12 = comb.mux %10, %11, %3 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %9, %true : i1
        %15 = comb.and %4, %14 : i1
        %16 = comb.mux %15, %c1_i3_13, %13 : i3
        %17 = comb.icmp ne %16, %c1_i3_13 : i3
        %18 = comb.and %4, %17 : i1
        %19 = comb.xor %10, %2 : i1
        %true_16 = hw.constant true
        %20 = comb.xor %arg18, %true_16 : i1
        %21 = comb.and %20, %19 : i1
        %22 = comb.or %15, %21 : i1
        %23 = comb.and %18, %22 : i1
        %true_17 = hw.constant true
        %24 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %25 = comb.xor %15, %true_18 : i1
        %26 = comb.and %18, %25, %24, %10, %2, %5 : i1
        verif.assert %8 : i1
        %27 = comb.xor %cpha_q, %true : i1
        %28 = comb.mux %27, %23, %26 : i1
        %29 = comb.and %28, %cmd_wr_en_q, %1 : i1
        %30 = comb.or %29, %15 : i1
        %true_19 = hw.constant true
        %31 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %32 = comb.xor %30, %true_20 : i1
        %33 = comb.and %32, %31, %10, %2 : i1
        fsm.return %33
      } action {
        %true = hw.constant true
        %true_13 = hw.constant true
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_14 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %true_15 = hw.constant true
        %0 = comb.xor %arg16, %true_15 : i1
        %1 = comb.xor %arg15, %true_15 : i1
        %false_16 = hw.constant false
        %2 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %3 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %4 = comb.xor %cmd_rd_en_q, %true_15 : i1
        %5 = comb.xor %cmd_wr_en_q, %true_15 : i1
        %6 = comb.and %4, %5 : i1
        %7 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %8 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %9 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %10 = comb.mux %9, %c-4_i3, %c1_i3 : i3
        %11 = comb.xor %6, %true_15 : i1
        %12 = comb.xor %7, %true_15 : i1
        %13 = comb.and %12, %11, %8 : i1
        %14 = comb.mux %13, %c2_i3, %10 : i3
        %15 = comb.mux %13, %c-2_i3, %10 : i3
        %16 = comb.and %11, %7 : i1
        %17 = comb.mux %16, %c1_i3, %14 : i3
        %18 = comb.mux %16, %c-1_i3, %15 : i3
        %19 = comb.mux %6, %c0_i3, %17 : i3
        %20 = comb.mux %6, %c0_i3, %18 : i3
        %21 = comb.sub %bit_cntr_q, %19 : i3
        %22 = comb.and %cmd_wr_en_q, %2 : i1
        %23 = comb.or %22, %cmd_wr_en_last_bit : i1
        %24 = comb.xor %isFirstCycle, %true_15 : i1
        %25 = comb.and %24, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %26 = comb.xor %25, %true_15 : i1
        verif.assert %26 : i1
        fsm.update %_sh1_10, %true : i1
        fsm.update %_sh1_8, %1 : i1
        fsm.update %_sh1_6, %true_13 : i1
        fsm.update %_sh1, %false_16 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        fsm.update %cmd_wr_en_last_bit, %23 : i1
        %27 = comb.and %cpha_q, %2 : i1
        %28 = comb.and %cpha_q, %3 : i1
        %29 = comb.mux %28, %21, %bit_cntr_q : i3
        %30 = comb.mux %27, %20, %29 : i3
        %true_17 = hw.constant true
        %31 = comb.xor %cpol_q, %true_17 : i1
        %32 = comb.and %27, %cmd_wr_en_q, %0 : i1
        %33 = comb.mux %32, %clk_cntr_q, %clkdiv_q : i16
        %34 = comb.mux %32, %bit_cntr_q, %30 : i3
        %35 = comb.mux %32, %wait_cntr_q, %c0_i4 : i4
        %36 = comb.mux bin %32, %u_sck_flop2Fq_o, %31 : i1
        fsm.update %u_sck_flop2Fq_o, %36 : i1
        fsm.update %wait_cntr_q, %35 : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %34 : i3
        fsm.update %clk_cntr_q, %33 : i16
        %37 = comb.xor %32, %true_15 : i1
        %38 = comb.and %28, %37 : i1
        %39 = comb.mux bin %32, %segment_rd_en_cpha1, %cmd_rd_en_q : i1
        %40 = comb.or %27, %38 : i1
        %41 = comb.mux %37, %40, %sample_en_q : i1
        %42 = comb.mux %37, %sample_en_q, %sample_en_q2 : i1
        %43 = comb.and %32, %csb_q : i1
        %44 = comb.or %csid_q, %43 : i1
        fsm.update %_sh1_12, %37 : i1
        fsm.update %csb_q, %44 : i1
        fsm.update %sample_en_q2, %42 : i1
        fsm.update %sample_en_q, %41 : i1
        fsm.update %segment_rd_en_cpha1, %39 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c1_i3_13 = hw.constant 1 : i3
        %5 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %6 = comb.xor %isFirstCycle, %true : i1
        %7 = comb.and %6, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %8 = comb.xor %7, %true : i1
        %9 = comb.and %arg1, %0 : i1
        %10 = comb.and %9, %4 : i1
        %false_14 = hw.constant false
        %true_15 = hw.constant true
        %11 = comb.concat %false_14, %2, %true_15 : i1, i1, i1
        %12 = comb.mux %10, %11, %3 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %9, %true : i1
        %15 = comb.and %4, %14 : i1
        %16 = comb.mux %15, %c1_i3_13, %13 : i3
        %17 = comb.icmp ne %16, %c1_i3_13 : i3
        %18 = comb.and %4, %17 : i1
        %19 = comb.xor %10, %2 : i1
        %true_16 = hw.constant true
        %20 = comb.xor %arg18, %true_16 : i1
        %21 = comb.and %20, %19 : i1
        %22 = comb.or %15, %21 : i1
        %23 = comb.and %18, %22 : i1
        %true_17 = hw.constant true
        %24 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %25 = comb.xor %15, %true_18 : i1
        %26 = comb.and %18, %25, %24, %10, %2, %5 : i1
        verif.assert %8 : i1
        %27 = comb.xor %cpha_q, %true : i1
        %28 = comb.mux %27, %23, %26 : i1
        %29 = comb.and %28, %cmd_wr_en_q, %1 : i1
        %30 = comb.xor %10, %2 : i1
        %true_19 = hw.constant true
        %31 = comb.xor %arg18, %true_19 : i1
        %32 = comb.and %31, %30 : i1
        %33 = comb.or %29, %15, %32 : i1
        fsm.return %33
      } action {
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.mux %1, %clkdiv_q, %2 : i16
        %4 = comb.mux %0, %clk_cntr_q, %3 : i16
        %5 = comb.mux %arg18, %c0_i16, %4 : i16
        %6 = comb.xor %arg16, %true : i1
        %7 = comb.and %arg1, %1 : i1
        %8 = comb.xor %arg15, %true : i1
        %false_14 = hw.constant false
        %9 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %10 = comb.mux %9, %c1_i3, %c-2_i3 : i3
        %11 = comb.xor %arg18, %true : i1
        %12 = comb.and %7, %11 : i1
        %false_15 = hw.constant false
        %true_16 = hw.constant true
        %13 = comb.concat %false_15, %9, %true_16 : i1, i1, i1
        %14 = comb.mux %12, %13, %10 : i3
        %15 = comb.mux %arg18, %c0_i3, %14 : i3
        %16 = comb.xor %7, %true : i1
        %17 = comb.and %11, %16 : i1
        %c1_i3_17 = hw.constant 1 : i3
        %18 = comb.xor %12, %9 : i1
        %true_18 = hw.constant true
        %19 = comb.xor %arg18, %true_18 : i1
        %20 = comb.and %19, %18 : i1
        %21 = comb.or %17, %20 : i1
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %true_19 = hw.constant true
        %24 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %25 = comb.xor %17, %true_20 : i1
        %26 = comb.and %25, %24, %12, %9 : i1
        %27 = comb.xor %cpha_q, %true : i1
        %28 = comb.xor %cmd_rd_en_q, %true : i1
        %29 = comb.xor %cmd_wr_en_q, %true : i1
        %30 = comb.and %28, %29 : i1
        %31 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %32 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %33 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %34 = comb.mux %33, %c-4_i3, %c1_i3 : i3
        %35 = comb.xor %30, %true : i1
        %36 = comb.xor %31, %true : i1
        %37 = comb.and %36, %35, %32 : i1
        %38 = comb.mux %37, %c2_i3, %34 : i3
        %39 = comb.mux %37, %c-2_i3, %34 : i3
        %40 = comb.and %35, %31 : i1
        %41 = comb.mux %40, %c1_i3, %38 : i3
        %42 = comb.mux %40, %c-1_i3, %39 : i3
        %43 = comb.mux %30, %c0_i3, %41 : i3
        %44 = comb.mux %30, %c0_i3, %42 : i3
        %45 = comb.sub %bit_cntr_q, %43 : i3
        %true_21 = hw.constant true
        %46 = comb.xor %9, %true_21 : i1
        %true_22 = hw.constant true
        %47 = comb.xor %12, %true_22 : i1
        %true_23 = hw.constant true
        %48 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %49 = comb.xor %17, %true_24 : i1
        %50 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %51 = comb.xor %21, %true : i1
        %52 = comb.or %arg18, %7 : i1
        %53 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %true_25 = hw.constant true
        %54 = comb.xor %arg18, %true_25 : i1
        %true_26 = hw.constant true
        %55 = comb.xor %arg18, %true_26 : i1
        %56 = comb.and %51, %26 : i1
        %57 = comb.xor %56, %true : i1
        %58 = comb.and %cmd_wr_en_q, %22 : i1
        %59 = comb.or %58, %cmd_wr_en_last_bit : i1
        %60 = comb.xor %isFirstCycle, %true : i1
        %61 = comb.and %60, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %11 : i1
        %62 = comb.xor %61, %true : i1
        verif.assert %62 : i1
        fsm.update %_sh1_10, %7 : i1
        fsm.update %_sh1_8, %8 : i1
        fsm.update %_sh1_6, %9 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %59 : i1
        %63 = comb.mux %17, %c1_i3_17, %15 : i3
        %64 = comb.icmp ne %63, %c1_i3_17 : i3
        %65 = comb.and %11, %64 : i1
        %66 = comb.and %65, %21 : i1
        %67 = comb.and %65, %26, %22 : i1
        %68 = comb.mux %27, %66, %67 : i1
        %69 = comb.and %cpha_q, %65, %26, %23 : i1
        %70 = comb.mux %69, %45, %bit_cntr_q : i3
        %71 = comb.mux %68, %44, %70 : i3
        %72 = comb.mux %16, %bit_cntr_q, %71 : i3
        %73 = comb.mux %arg18, %c0_i3, %72 : i3
        %74 = comb.and %64, %12 : i1
        %75 = comb.and %51, %74, %49, %48, %47, %46 : i1
        %76 = comb.mux %75, %csnidle_q, %c0_i4 : i4
        %77 = comb.and %74, %21 : i1
        %78 = comb.mux %77, %csnlead_q, %76 : i4
        %79 = comb.mux %52, %78, %wait_cntr_q : i4
        %80 = comb.mux %arg18, %c0_i4, %79 : i4
        %81 = comb.xor %64, %true : i1
        %82 = comb.and %53, %81, %12 : i1
        %83 = comb.mux %82, %50, %80 : i4
        %84 = comb.icmp ne %63, %c-4_i3 : i3
        %85 = comb.and %51, %57, %84 : i1
        %86 = comb.icmp ne %63, %c3_i3 : i3
        %87 = comb.mux %cpol_q, %86, %26 : i1
        %88 = comb.and %68, %cmd_wr_en_q, %6 : i1
        %89 = comb.mux %88, %clk_cntr_q, %5 : i16
        %90 = comb.mux %88, %bit_cntr_q, %73 : i3
        %91 = comb.or %88, %54 : i1
        %92 = comb.mux %91, %byte_cntr_cpha0_q, %c0_i20 : i20
        %93 = comb.or %88, %55 : i1
        %94 = comb.mux %93, %byte_cntr_cpha1_q, %c0_i20 : i20
        %95 = comb.mux %88, %wait_cntr_q, %83 : i4
        %96 = comb.mux bin %88, %u_sck_flop2Fq_o, %87 : i1
        fsm.update %u_sck_flop2Fq_o, %96 : i1
        fsm.update %wait_cntr_q, %95 : i4
        fsm.update %byte_cntr_cpha1_q, %94 : i20
        fsm.update %byte_cntr_cpha0_q, %92 : i20
        fsm.update %bit_cntr_q, %90 : i3
        fsm.update %clk_cntr_q, %89 : i16
        %97 = comb.xor %88, %true : i1
        %98 = comb.and %69, %97 : i1
        %99 = comb.and %64, %97 : i1
        %100 = comb.mux bin %99, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %101 = comb.or %68, %98 : i1
        %102 = comb.and %7, %97 : i1
        %103 = comb.mux %102, %101, %sample_en_q : i1
        %104 = comb.mux %102, %sample_en_q, %sample_en_q2 : i1
        %105 = comb.mux %97, %85, %csb_q : i1
        %106 = comb.or %csid_q, %105 : i1
        fsm.update %_sh1_12, %97 : i1
        fsm.update %csb_q, %106 : i1
        fsm.update %sample_en_q2, %104 : i1
        fsm.update %sample_en_q, %103 : i1
        fsm.update %segment_rd_en_cpha1, %100 : i1
      }
    }
    fsm.state @state_6 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i16 = hw.constant 0 : i16
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %true = hw.constant true
      %false_13 = hw.constant false
      %false_14 = hw.constant false
      %true_15 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %false_16 = hw.constant false
      %2 = comb.and %arg1, %0 : i1
      %3 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %4 = comb.mux %3, %c1_i3, %c-2_i3 : i3
      %5 = comb.xor %arg18, %true : i1
      %6 = comb.mux %arg18, %c0_i3, %4 : i3
      %7 = comb.xor %2, %true : i1
      %8 = comb.and %5, %7 : i1
      %c-2_i3_17 = hw.constant -2 : i3
      %9 = comb.xor %cpha_q, %true : i1
      %false_18 = hw.constant false
      %10 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %11 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %12 = comb.mux %9, %10, %11 : i1
      %13 = comb.or %arg18, %12 : i1
      %14 = comb.mux %full_cyc_q, %sample_en_q2, %sample_en_q : i1
      %15 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %16 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %17 = comb.concat %c0_i3, %16 : i3, i1
      %18 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %19 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %20 = comb.concat %c0_i2, %19 : i2, i2
      %21 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %22 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %23 = comb.xor %csb_q, %true : i1
      %24 = comb.xor %15, %true : i1
      %25 = comb.and %24, %23 : i1
      %26 = comb.xor %18, %true : i1
      %27 = comb.and %21, %26, %25 : i1
      %28 = comb.mux %27, %22, %c0_i4 : i4
      %29 = comb.and %18, %25 : i1
      %30 = comb.mux %29, %20, %28 : i4
      %31 = comb.and %15, %23 : i1
      %32 = comb.mux %31, %17, %30 : i4
      %33 = comb.xor %isFirstCycle, %true : i1
      %34 = comb.and %33, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %5 : i1
      %35 = comb.xor %34, %true : i1
      verif.assert %35 : i1
      %36 = comb.mux %8, %c-2_i3_17, %6 : i3
      %37 = comb.icmp ne %36, %c-2_i3_17 : i3
      %true_19 = hw.constant true
      %38 = comb.xor %arg18, %true_19 : i1
      %true_20 = hw.constant true
      %39 = comb.xor %8, %true_20 : i1
      %40 = comb.and %9, %5, %37, %39, %38, %3, %cmd_wr_en_q : i1
      %41 = comb.and %40, %1 : i1
      %42 = comb.xor %41, %true : i1
      %43 = comb.and %40, %42 : i1
      %44 = comb.and %14, %42 : i1
      %false_21 = hw.constant false
      %45 = comb.and %13, %43, %arg16 : i1
      fsm.output %false_14, %u_sck_flop2Fq_o, %csb_q, %32, %false_18, %45, %43, %false_13, %44, %false_21, %cmd_speed_q, %full_cyc_q, %false_16, %41, %true_15 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-2_i3_13 = hw.constant -2 : i3
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.and %arg1, %0 : i1
        %9 = comb.mux %arg18, %c0_i3, %3 : i3
        %10 = comb.xor %8, %true : i1
        %11 = comb.and %4, %10 : i1
        %12 = comb.mux %11, %c-2_i3_13, %9 : i3
        %13 = comb.icmp ne %12, %c-2_i3_13 : i3
        %true_14 = hw.constant true
        %14 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %15 = comb.xor %11, %true_15 : i1
        verif.assert %7 : i1
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.and %16, %4, %13, %15, %14, %2, %cmd_wr_en_q, %1 : i1
        %true_16 = hw.constant true
        %18 = comb.xor %2, %true_16 : i1
        %true_17 = hw.constant true
        %19 = comb.xor %arg18, %true_17 : i1
        %20 = comb.and %19, %18 : i1
        %21 = comb.or %17, %11, %20 : i1
        fsm.return %21
      } action {
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.mux %1, %clkdiv_q, %2 : i16
        %4 = comb.mux %0, %clk_cntr_q, %3 : i16
        %5 = comb.mux %arg18, %c0_i16, %4 : i16
        %6 = comb.xor %arg16, %true : i1
        %7 = comb.and %arg1, %1 : i1
        %8 = comb.xor %arg15, %true : i1
        %false_14 = hw.constant false
        %9 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %10 = comb.mux %9, %c1_i3, %c-2_i3 : i3
        %11 = comb.xor %arg18, %true : i1
        %12 = comb.and %7, %11 : i1
        %13 = comb.mux %arg18, %c0_i3, %10 : i3
        %14 = comb.xor %7, %true : i1
        %15 = comb.and %11, %14 : i1
        %c-2_i3_15 = hw.constant -2 : i3
        %true_16 = hw.constant true
        %16 = comb.xor %arg18, %true_16 : i1
        %true_17 = hw.constant true
        %17 = comb.xor %15, %true_17 : i1
        %18 = comb.and %17, %16, %9 : i1
        %19 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %20 = comb.xor %cpha_q, %true : i1
        %21 = comb.xor %cmd_rd_en_q, %true : i1
        %22 = comb.xor %cmd_wr_en_q, %true : i1
        %23 = comb.and %21, %22 : i1
        %24 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %25 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %26 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %27 = comb.mux %26, %c-4_i3, %c1_i3 : i3
        %28 = comb.xor %23, %true : i1
        %29 = comb.xor %24, %true : i1
        %30 = comb.and %29, %28, %25 : i1
        %31 = comb.mux %30, %c-2_i3, %27 : i3
        %32 = comb.and %28, %24 : i1
        %33 = comb.mux %32, %c-1_i3, %31 : i3
        %34 = comb.mux %23, %c0_i3, %33 : i3
        %true_18 = hw.constant true
        %35 = comb.xor %9, %true_18 : i1
        %true_19 = hw.constant true
        %36 = comb.xor %arg18, %true_19 : i1
        %37 = comb.and %36, %35 : i1
        %38 = comb.or %15, %37 : i1
        %39 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %40 = comb.xor %18, %true : i1
        %41 = comb.or %arg18, %7 : i1
        %42 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %true_20 = hw.constant true
        %43 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %44 = comb.xor %arg18, %true_21 : i1
        %45 = comb.and %cmd_wr_en_q, %19 : i1
        %46 = comb.or %45, %cmd_wr_en_last_bit : i1
        %47 = comb.xor %isFirstCycle, %true : i1
        %48 = comb.and %47, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %11 : i1
        %49 = comb.xor %48, %true : i1
        verif.assert %49 : i1
        fsm.update %_sh1_10, %7 : i1
        fsm.update %_sh1_8, %8 : i1
        fsm.update %_sh1_6, %9 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %46 : i1
        %50 = comb.mux %15, %c-2_i3_15, %13 : i3
        %51 = comb.icmp ne %50, %c-2_i3_15 : i3
        %52 = comb.and %20, %11, %51, %18 : i1
        %53 = comb.and %7, %52 : i1
        %54 = comb.mux %53, %34, %bit_cntr_q : i3
        %55 = comb.mux %arg18, %c0_i3, %54 : i3
        %56 = comb.and %51, %12 : i1
        %57 = comb.and %40, %56, %38 : i1
        %58 = comb.mux %57, %csnidle_q, %c0_i4 : i4
        %59 = comb.and %56, %18 : i1
        %60 = comb.mux %59, %csnlead_q, %58 : i4
        %61 = comb.mux %41, %60, %wait_cntr_q : i4
        %62 = comb.mux %arg18, %c0_i4, %61 : i4
        %63 = comb.xor %51, %true : i1
        %64 = comb.and %42, %63, %12 : i1
        %65 = comb.mux %64, %39, %62 : i4
        %66 = comb.icmp ne %50, %c-4_i3 : i3
        %67 = comb.and %40, %66 : i1
        %68 = comb.icmp ne %50, %c3_i3 : i3
        %69 = comb.and %cpol_q, %68 : i1
        %70 = comb.and %52, %cmd_wr_en_q, %6 : i1
        %71 = comb.mux %70, %clk_cntr_q, %5 : i16
        %72 = comb.mux %70, %bit_cntr_q, %55 : i3
        %73 = comb.or %70, %43 : i1
        %74 = comb.mux %73, %byte_cntr_cpha0_q, %c0_i20 : i20
        %75 = comb.or %70, %44 : i1
        %76 = comb.mux %75, %byte_cntr_cpha1_q, %c0_i20 : i20
        %77 = comb.mux %70, %wait_cntr_q, %65 : i4
        %78 = comb.mux bin %70, %u_sck_flop2Fq_o, %69 : i1
        fsm.update %u_sck_flop2Fq_o, %78 : i1
        fsm.update %wait_cntr_q, %77 : i4
        fsm.update %byte_cntr_cpha1_q, %76 : i20
        fsm.update %byte_cntr_cpha0_q, %74 : i20
        fsm.update %bit_cntr_q, %72 : i3
        fsm.update %clk_cntr_q, %71 : i16
        %79 = comb.xor %70, %true : i1
        %80 = comb.and %51, %79 : i1
        %81 = comb.mux bin %80, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %82 = comb.and %7, %79 : i1
        %83 = comb.mux %82, %52, %sample_en_q : i1
        %84 = comb.mux %82, %sample_en_q, %sample_en_q2 : i1
        %85 = comb.mux %79, %67, %csb_q : i1
        %86 = comb.or %csid_q, %85 : i1
        fsm.update %_sh1_12, %79 : i1
        fsm.update %csb_q, %86 : i1
        fsm.update %sample_en_q2, %84 : i1
        fsm.update %sample_en_q, %83 : i1
        fsm.update %segment_rd_en_cpha1, %81 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-2_i3_13 = hw.constant -2 : i3
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.and %arg1, %0 : i1
        %9 = comb.mux %arg18, %c0_i3, %3 : i3
        %10 = comb.xor %8, %true : i1
        %11 = comb.and %4, %10 : i1
        %12 = comb.mux %11, %c-2_i3_13, %9 : i3
        %13 = comb.icmp ne %12, %c-2_i3_13 : i3
        %true_14 = hw.constant true
        %14 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %15 = comb.xor %11, %true_15 : i1
        verif.assert %7 : i1
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.and %16, %4, %13, %15, %14, %2, %cmd_wr_en_q, %1 : i1
        %18 = comb.or %17, %11 : i1
        %true_16 = hw.constant true
        %19 = comb.xor %arg18, %true_16 : i1
        %true_17 = hw.constant true
        %20 = comb.xor %18, %true_17 : i1
        %21 = comb.and %20, %19, %2 : i1
        fsm.return %21
      } action {
        %true = hw.constant true
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %true_14 = hw.constant true
        %0 = comb.xor %arg1, %true_14 : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.mux %1, %clkdiv_q, %2 : i16
        %4 = comb.xor %arg16, %true_14 : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.xor %arg15, %true_14 : i1
        %false_15 = hw.constant false
        %7 = comb.xor %5, %true_14 : i1
        %c-2_i3_16 = hw.constant -2 : i3
        %8 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %9 = comb.xor %cpha_q, %true_14 : i1
        %10 = comb.xor %cmd_rd_en_q, %true_14 : i1
        %11 = comb.xor %cmd_wr_en_q, %true_14 : i1
        %12 = comb.and %10, %11 : i1
        %13 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %14 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %15 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %16 = comb.mux %15, %c-4_i3, %c1_i3 : i3
        %17 = comb.xor %12, %true_14 : i1
        %18 = comb.xor %13, %true_14 : i1
        %19 = comb.and %18, %17, %14 : i1
        %20 = comb.mux %19, %c-2_i3, %16 : i3
        %21 = comb.and %17, %13 : i1
        %22 = comb.mux %21, %c-1_i3, %20 : i3
        %23 = comb.mux %12, %c0_i3, %22 : i3
        %24 = comb.xor %5, %true_14 : i1
        %25 = comb.and %cmd_wr_en_q, %8 : i1
        %26 = comb.or %25, %cmd_wr_en_last_bit : i1
        %27 = comb.xor %isFirstCycle, %true_14 : i1
        %28 = comb.and %27, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %29 = comb.xor %28, %true_14 : i1
        verif.assert %29 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %6 : i1
        fsm.update %_sh1_6, %true : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %26 : i1
        %30 = comb.mux %7, %c-2_i3_16, %c1_i3 : i3
        %31 = comb.icmp ne %30, %c-2_i3_16 : i3
        %32 = comb.and %9, %31, %5 : i1
        %33 = comb.and %31, %5 : i1
        %34 = comb.and %24, %33, %7 : i1
        %35 = comb.mux %34, %csnidle_q, %c0_i4 : i4
        %36 = comb.mux %33, %csnlead_q, %35 : i4
        %37 = comb.icmp ne %30, %c-4_i3 : i3
        %38 = comb.and %24, %37 : i1
        %39 = comb.icmp ne %30, %c3_i3 : i3
        %40 = comb.and %cpol_q, %39 : i1
        %41 = comb.and %32, %cmd_wr_en_q, %4 : i1
        %42 = comb.or %41, %0 : i1
        %43 = comb.mux %42, %clk_cntr_q, %3 : i16
        %true_17 = hw.constant true
        %44 = comb.xor %32, %true_17 : i1
        %45 = comb.or %41, %44 : i1
        %46 = comb.mux %45, %bit_cntr_q, %23 : i3
        %true_18 = hw.constant true
        %47 = comb.xor %5, %true_18 : i1
        %48 = comb.or %41, %47 : i1
        %49 = comb.mux %48, %wait_cntr_q, %36 : i4
        %50 = comb.mux bin %41, %u_sck_flop2Fq_o, %40 : i1
        fsm.update %u_sck_flop2Fq_o, %50 : i1
        fsm.update %wait_cntr_q, %49 : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %46 : i3
        fsm.update %clk_cntr_q, %43 : i16
        %51 = comb.xor %41, %true_14 : i1
        %52 = comb.and %31, %51 : i1
        %53 = comb.mux bin %52, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %54 = comb.and %5, %51 : i1
        %55 = comb.mux %54, %32, %sample_en_q : i1
        %56 = comb.mux %54, %sample_en_q, %sample_en_q2 : i1
        %57 = comb.mux %51, %38, %csb_q : i1
        %58 = comb.or %csid_q, %57 : i1
        fsm.update %_sh1_12, %51 : i1
        fsm.update %csb_q, %58 : i1
        fsm.update %sample_en_q2, %56 : i1
        fsm.update %sample_en_q, %55 : i1
        fsm.update %segment_rd_en_cpha1, %53 : i1
      }
      fsm.transition @state_0 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-2_i3_13 = hw.constant -2 : i3
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.and %arg1, %0 : i1
        %9 = comb.mux %arg18, %c0_i3, %3 : i3
        %10 = comb.xor %8, %true : i1
        %11 = comb.and %4, %10 : i1
        %12 = comb.mux %11, %c-2_i3_13, %9 : i3
        %13 = comb.icmp ne %12, %c-2_i3_13 : i3
        %true_14 = hw.constant true
        %14 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %15 = comb.xor %11, %true_15 : i1
        verif.assert %7 : i1
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.and %16, %4, %13, %15, %14, %2, %cmd_wr_en_q, %1 : i1
        %18 = comb.or %17, %11 : i1
        %true_16 = hw.constant true
        %19 = comb.xor %18, %true_16 : i1
        %20 = comb.and %19, %arg18 : i1
        fsm.return %20
      } action {
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.and %arg1, %0 : i1
        %2 = comb.xor %arg15, %true : i1
        %false_14 = hw.constant false
        %3 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %4 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %5 = comb.and %cmd_wr_en_q, %4 : i1
        %6 = comb.or %5, %cmd_wr_en_last_bit : i1
        %true_15 = hw.constant true
        verif.assert %true_15 : i1
        fsm.update %_sh1_10, %1 : i1
        fsm.update %_sh1_8, %2 : i1
        fsm.update %_sh1_6, %3 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %6 : i1
        fsm.update %u_sck_flop2Fq_o, %cpol_q : i1
        fsm.update %wait_cntr_q, %c0_i4 : i4
        fsm.update %byte_cntr_cpha1_q, %c0_i20 : i20
        fsm.update %byte_cntr_cpha0_q, %c0_i20 : i20
        fsm.update %bit_cntr_q, %c0_i3 : i3
        fsm.update %clk_cntr_q, %c0_i16 : i16
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %7 = comb.xor %1, %true_17 : i1
        %8 = comb.and %7, %sample_en_q : i1
        %9 = comb.mux %1, %sample_en_q, %sample_en_q2 : i1
        %true_18 = hw.constant true
        fsm.update %_sh1_12, %true_16 : i1
        fsm.update %csb_q, %true_18 : i1
        fsm.update %sample_en_q2, %9 : i1
        fsm.update %sample_en_q, %8 : i1
        fsm.update %segment_rd_en_cpha1, %cmd_rd_en_q : i1
      }
    }
    fsm.state @state_3 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i16 = hw.constant 0 : i16
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-1_i3 = hw.constant -1 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %c-1_i20 = hw.constant -1 : i20
      %true = hw.constant true
      %true_13 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %2 = comb.xor %arg17, %true : i1
      %3 = comb.and %arg1, %0 : i1
      %4 = comb.concat %c1_i2, %cpha_q : i2, i1
      %5 = comb.xor %arg15, %true : i1
      %6 = comb.mux %5, %c-1_i3, %c-4_i3 : i3
      %7 = comb.icmp eq %arg14, %csid_q : i1
      %8 = comb.and %7, %arg15 : i1
      %9 = comb.mux %8, %4, %6 : i3
      %10 = comb.or %8, %5 : i1
      %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %12 = comb.xor %csaat_q, %true : i1
      %13 = comb.mux %11, %c1_i3, %c-2_i3 : i3
      %14 = comb.xor %arg18, %true : i1
      %15 = comb.and %3, %14 : i1
      %16 = comb.mux %12, %c-4_i3, %9 : i3
      %17 = comb.xor %3, %true : i1
      %18 = comb.and %14, %17 : i1
      %19 = comb.xor %18, %true : i1
      %c3_i3 = hw.constant 3 : i3
      %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
      %21 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
      %22 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
      %23 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
      %24 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %25 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %26 = comb.concat %c0_i3, %25 : i3, i1
      %27 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %28 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %29 = comb.concat %c0_i2, %28 : i2, i2
      %30 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %31 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %32 = comb.xor %csb_q, %true : i1
      %33 = comb.xor %24, %true : i1
      %34 = comb.and %33, %32 : i1
      %35 = comb.xor %27, %true : i1
      %36 = comb.and %30, %35, %34 : i1
      %37 = comb.mux %36, %31, %c0_i4 : i4
      %38 = comb.and %27, %34 : i1
      %39 = comb.mux %38, %29, %37 : i4
      %40 = comb.and %24, %32 : i1
      %41 = comb.mux %40, %26, %39 : i4
      %42 = comb.xor %isFirstCycle, %true : i1
      %43 = comb.and %42, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
      %44 = comb.xor %43, %true : i1
      verif.assert %44 : i1
      %45 = comb.xor %20, %true : i1
      %46 = comb.icmp ne %22, %c0_i20 : i20
      %47 = comb.or %45, %46, %cpha_q : i1
      %48 = comb.and %15, %47 : i1
      %49 = comb.mux %48, %c2_i3, %13 : i3
      %50 = comb.xor %47, %true : i1
      %51 = comb.and %50, %15 : i1
      %52 = comb.mux %51, %16, %49 : i3
      %53 = comb.mux %arg18, %c0_i3, %52 : i3
      %54 = comb.mux %18, %c3_i3, %53 : i3
      %55 = comb.and %19, %51, %csaat_q, %10 : i1
      %56 = comb.icmp ne %54, %c3_i3 : i3
      %57 = comb.and %14, %56 : i1
      %true_14 = hw.constant true
      %58 = comb.xor %48, %true_14 : i1
      %true_15 = hw.constant true
      %59 = comb.xor %51, %true_15 : i1
      %true_16 = hw.constant true
      %60 = comb.xor %arg18, %true_16 : i1
      %true_17 = hw.constant true
      %61 = comb.xor %18, %true_17 : i1
      %62 = comb.and %61, %60, %59, %58, %11 : i1
      %true_18 = hw.constant true
      %63 = comb.xor %cpha_q, %true_18 : i1
      %64 = comb.and %csaat_q, %8, %63 : i1
      %65 = comb.mux %51, %64, %48 : i1
      %true_19 = hw.constant true
      %66 = comb.xor %arg18, %true_19 : i1
      %true_20 = hw.constant true
      %67 = comb.xor %18, %true_20 : i1
      %68 = comb.and %67, %66, %65 : i1
      %69 = comb.and %68, %20 : i1
      %70 = comb.or %62, %69 : i1
      %71 = comb.and %57, %70 : i1
      %72 = comb.and %57, %68, %21 : i1
      %73 = comb.and %57, %20 : i1
      %true_21 = hw.constant true
      %74 = comb.xor %arg18, %true_21 : i1
      %75 = comb.and %74, %51, %csaat_q, %8, %cpha_q : i1
      %76 = comb.or %18, %75 : i1
      %77 = comb.and %57, %76, %20 : i1
      %78 = comb.and %57, %76, %21 : i1
      %79 = comb.and %arg15, %55 : i1
      %80 = comb.mux %79, %arg12, %cpha_q : i1
      %81 = comb.mux %79, %arg11, %full_cyc_q : i1
      %82 = comb.mux %79, %arg3, %cmd_wr_en_q : i1
      %83 = comb.xor %80, %true : i1
      %84 = comb.mux %83, %71, %77 : i1
      %85 = comb.mux %83, %72, %78 : i1
      %86 = comb.mux %83, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
      %87 = comb.and %84, %82 : i1
      %88 = comb.and %83, %73, %86 : i1
      %89 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %90 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %91 = comb.mux %83, %89, %90 : i1
      %92 = comb.mux %81, %sample_en_q2, %sample_en_q : i1
      %93 = comb.and %87, %1 : i1
      %94 = comb.and %88, %2 : i1
      %95 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %96 = comb.icmp eq %arg5, %c0_i20 : i20
      %97 = comb.icmp eq %23, %c0_i20 : i20
      %98 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %99 = comb.mux %73, %97, %98 : i1
      %100 = comb.mux %79, %96, %99 : i1
      %101 = comb.mux %17, %95, %100 : i1
      %102 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %103 = comb.icmp eq %arg5, %c0_i20 : i20
      %104 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %105 = comb.mux %79, %103, %104 : i1
      %106 = comb.mux %17, %102, %105 : i1
      %107 = comb.mux %83, %101, %106 : i1
      %108 = comb.or %arg18, %107 : i1
      %109 = comb.or %94, %93 : i1
      %110 = comb.xor %109, %true : i1
      %111 = comb.and %87, %110 : i1
      %112 = comb.and %88, %110 : i1
      %113 = comb.and %92, %110 : i1
      %114 = comb.and %85, %110 : i1
      %115 = comb.and %55, %110 : i1
      %116 = comb.and %91, %112, %arg17 : i1
      %117 = comb.and %108, %111, %arg16 : i1
      fsm.output %115, %u_sck_flop2Fq_o, %csb_q, %41, %116, %117, %111, %112, %113, %114, %cmd_speed_q, %81, %94, %93, %true_13 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_7 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %csaat_q, %true : i1
        %12 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.mux %11, %c-4_i3, %8 : i3
        %c3_i3 = hw.constant 3 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %17 = comb.xor %isFirstCycle, %true : i1
        %18 = comb.and %17, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %13 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and %arg1, %0 : i1
        %21 = comb.xor %15, %true : i1
        %22 = comb.icmp ne %16, %c0_i20 : i20
        %23 = comb.or %21, %22, %cpha_q : i1
        %24 = comb.and %20, %13 : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.mux %25, %c2_i3, %12 : i3
        %27 = comb.xor %23, %true : i1
        %28 = comb.and %27, %24 : i1
        %29 = comb.mux %28, %14, %26 : i3
        %30 = comb.mux %arg18, %c0_i3, %29 : i3
        %31 = comb.xor %20, %true : i1
        %32 = comb.and %13, %31 : i1
        %33 = comb.mux %32, %c3_i3, %30 : i3
        %34 = comb.xor %32, %true : i1
        %35 = comb.icmp ne %33, %c3_i3 : i3
        %36 = comb.and %13, %35 : i1
        %true_13 = hw.constant true
        %37 = comb.xor %25, %true_13 : i1
        %true_14 = hw.constant true
        %38 = comb.xor %28, %true_14 : i1
        %true_15 = hw.constant true
        %39 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %40 = comb.xor %32, %true_16 : i1
        %41 = comb.and %40, %39, %38, %37, %10 : i1
        %true_17 = hw.constant true
        %42 = comb.xor %cpha_q, %true_17 : i1
        %43 = comb.and %csaat_q, %7, %42 : i1
        %44 = comb.mux %28, %43, %25 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %32, %true_19 : i1
        %47 = comb.and %46, %45, %44, %15 : i1
        %48 = comb.or %41, %47 : i1
        %49 = comb.and %36, %48 : i1
        %true_20 = hw.constant true
        %50 = comb.xor %arg18, %true_20 : i1
        %51 = comb.and %50, %28, %csaat_q, %7, %cpha_q : i1
        %52 = comb.or %32, %51 : i1
        %53 = comb.and %36, %52, %15 : i1
        verif.assert %19 : i1
        %54 = comb.and %arg15, %34, %28, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg12, %cpha_q : i1
        %56 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %57 = comb.xor %55, %true : i1
        %58 = comb.mux %57, %49, %53 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.and %58, %56, %1 : i1
        %61 = comb.and %57, %36, %15, %59, %2 : i1
        %62 = comb.or %61, %60, %32 : i1
        %63 = comb.extract %5 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %64 = comb.icmp eq %63, %c-1_i2 : i2
        %true_21 = hw.constant true
        %65 = comb.xor %7, %true_21 : i1
        %true_22 = hw.constant true
        %66 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %67 = comb.xor %62, %true_23 : i1
        %68 = comb.and %67, %66, %28, %csaat_q, %65, %64 : i1
        fsm.return %68
      } action {
        %true = hw.constant true
        %true_13 = hw.constant true
        %false_14 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i20 = hw.constant -1 : i20
        %true_15 = hw.constant true
        %0 = comb.xor %arg17, %true_15 : i1
        %1 = comb.xor %arg15, %true_15 : i1
        %false_16 = hw.constant false
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %4 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %5 = comb.and %cmd_wr_en_q, %3 : i1
        %6 = comb.xor %isFirstCycle, %true_15 : i1
        %7 = comb.and %6, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %8 = comb.xor %7, %true_15 : i1
        verif.assert %8 : i1
        fsm.update %_sh1_10, %true : i1
        fsm.update %_sh1_8, %1 : i1
        fsm.update %_sh1_6, %2 : i1
        fsm.update %_sh1, %false_16 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        %9 = comb.xor %cpha_q, %true_15 : i1
        %10 = comb.and %9, %3 : i1
        %11 = comb.mux %9, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %12 = comb.mux %arg15, %csntrail_q, %c0_i4 : i4
        %13 = comb.xor %10, %true_15 : i1
        %14 = comb.and %13, %cmd_wr_en_last_bit : i1
        %15 = comb.or %5, %14 : i1
        fsm.update %cmd_wr_en_last_bit, %15 : i1
        %16 = comb.and %10, %11, %0 : i1
        %17 = comb.xor %16, %true_15 : i1
        %18 = comb.mux %16, %clk_cntr_q, %clkdiv_q : i16
        %19 = comb.mux bin %16, %segment_rd_en_cpha1, %cmd_rd_en_q : i1
        %true_17 = hw.constant true
        %20 = comb.xor %3, %true_17 : i1
        %21 = comb.or %16, %20 : i1
        %22 = comb.mux %21, %byte_cntr_cpha0_q, %4 : i20
        %23 = comb.mux %16, %wait_cntr_q, %12 : i4
        %24 = comb.and %16, %sample_en_q : i1
        %25 = comb.mux %17, %sample_en_q, %sample_en_q2 : i1
        %26 = comb.mux bin %16, %u_sck_flop2Fq_o, %cpol_q : i1
        %27 = comb.and %16, %csb_q : i1
        %28 = comb.or %csid_q, %27 : i1
        fsm.update %_sh1_12, %17 : i1
        fsm.update %csb_q, %28 : i1
        fsm.update %u_sck_flop2Fq_o, %26 : i1
        fsm.update %sample_en_q2, %25 : i1
        fsm.update %sample_en_q, %24 : i1
        fsm.update %wait_cntr_q, %23 : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %22 : i20
        fsm.update %bit_cntr_q, %bit_cntr_q : i3
        fsm.update %segment_rd_en_cpha1, %19 : i1
        fsm.update %clk_cntr_q, %18 : i16
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %true_13, %true_13 : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
      }
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %csaat_q, %true : i1
        %12 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.mux %11, %c-4_i3, %8 : i3
        %c3_i3 = hw.constant 3 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %17 = comb.xor %isFirstCycle, %true : i1
        %18 = comb.and %17, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %13 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and %arg1, %0 : i1
        %21 = comb.xor %15, %true : i1
        %22 = comb.icmp ne %16, %c0_i20 : i20
        %23 = comb.or %21, %22, %cpha_q : i1
        %24 = comb.and %20, %13 : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.mux %25, %c2_i3, %12 : i3
        %27 = comb.xor %23, %true : i1
        %28 = comb.and %27, %24 : i1
        %29 = comb.mux %28, %14, %26 : i3
        %30 = comb.mux %arg18, %c0_i3, %29 : i3
        %31 = comb.xor %20, %true : i1
        %32 = comb.and %13, %31 : i1
        %33 = comb.mux %32, %c3_i3, %30 : i3
        %34 = comb.xor %32, %true : i1
        %35 = comb.icmp ne %33, %c3_i3 : i3
        %36 = comb.and %13, %35 : i1
        %true_13 = hw.constant true
        %37 = comb.xor %25, %true_13 : i1
        %true_14 = hw.constant true
        %38 = comb.xor %28, %true_14 : i1
        %true_15 = hw.constant true
        %39 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %40 = comb.xor %32, %true_16 : i1
        %41 = comb.and %40, %39, %38, %37, %10 : i1
        %true_17 = hw.constant true
        %42 = comb.xor %cpha_q, %true_17 : i1
        %43 = comb.and %csaat_q, %7, %42 : i1
        %44 = comb.mux %28, %43, %25 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %32, %true_19 : i1
        %47 = comb.and %46, %45, %44, %15 : i1
        %48 = comb.or %41, %47 : i1
        %49 = comb.and %36, %48 : i1
        %true_20 = hw.constant true
        %50 = comb.xor %arg18, %true_20 : i1
        %51 = comb.and %50, %28, %csaat_q, %7, %cpha_q : i1
        %52 = comb.or %32, %51 : i1
        %53 = comb.and %36, %52, %15 : i1
        verif.assert %19 : i1
        %54 = comb.and %arg15, %34, %28, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg12, %cpha_q : i1
        %56 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %57 = comb.xor %55, %true : i1
        %58 = comb.mux %57, %49, %53 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.and %58, %56, %1 : i1
        %61 = comb.and %57, %36, %15, %59, %2 : i1
        %62 = comb.or %61, %60, %32 : i1
        %63 = comb.extract %5 from 0 : (i3) -> i2
        %c-2_i2 = hw.constant -2 : i2
        %64 = comb.icmp eq %63, %c-2_i2 : i2
        %true_21 = hw.constant true
        %65 = comb.xor %7, %true_21 : i1
        %66 = comb.and %csaat_q, %65, %64 : i1
        %true_22 = hw.constant true
        %67 = comb.xor %10, %true_22 : i1
        %true_23 = hw.constant true
        %68 = comb.xor %25, %true_23 : i1
        %69 = comb.and %68, %67 : i1
        %70 = comb.mux %28, %66, %69 : i1
        %true_24 = hw.constant true
        %71 = comb.xor %arg18, %true_24 : i1
        %true_25 = hw.constant true
        %72 = comb.xor %62, %true_25 : i1
        %73 = comb.and %72, %71, %70 : i1
        fsm.return %73
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true : i1
        %4 = comb.xor %arg17, %true : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_14 = hw.constant false
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.mux %14, %c-4_i3, %11 : i3
        %17 = comb.xor %5, %true : i1
        %c3_i3_15 = hw.constant 3 : i3
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %18 = comb.xor %cpha_q, %true_18 : i1
        %19 = comb.and %csaat_q, %10, %18 : i1
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %22 = comb.icmp eq %arg2, %c0_i2 : i2
        %23 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %24 = comb.icmp eq %arg2, %c1_i2 : i2
        %25 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %26 = comb.icmp eq %arg2, %c-2_i2 : i2
        %27 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %28 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %29 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %30 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_19 = hw.constant 0 : i2
        %31 = comb.icmp eq %30, %c0_i2_19 : i2
        %true_20 = hw.constant true
        %32 = comb.xor %10, %true_20 : i1
        %33 = comb.and %32, %31 : i1
        %34 = comb.or %14, %33 : i1
        %35 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_21 = hw.constant 1 : i2
        %36 = comb.icmp eq %35, %c1_i2_21 : i2
        %true_22 = hw.constant true
        %37 = comb.xor %10, %true_22 : i1
        %38 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_23 = hw.constant -2 : i2
        %39 = comb.icmp eq %38, %c-2_i2_23 : i2
        %true_24 = hw.constant true
        %40 = comb.xor %10, %true_24 : i1
        %41 = comb.and %csaat_q, %40, %39 : i1
        %true_25 = hw.constant true
        %42 = comb.xor %13, %true_25 : i1
        %true_26 = hw.constant true
        %43 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %44 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %45 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %46 = comb.icmp eq %45, %c-1_i2 : i2
        %true_27 = hw.constant true
        %47 = comb.xor %10, %true_27 : i1
        %48 = comb.and %cmd_wr_en_q, %20 : i1
        %49 = comb.xor %isFirstCycle, %true : i1
        %50 = comb.and %49, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %51 = comb.xor %50, %true : i1
        verif.assert %51 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %13 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %52 = comb.xor %20, %true : i1
        %53 = comb.icmp ne %28, %c0_i20 : i20
        %54 = comb.or %52, %53, %cpha_q : i1
        %55 = comb.and %5, %54 : i1
        %56 = comb.mux %55, %c2_i3, %15 : i3
        %57 = comb.xor %54, %true : i1
        %58 = comb.and %57, %5 : i1
        %59 = comb.mux %58, %16, %56 : i3
        %60 = comb.mux %17, %c3_i3_15, %59 : i3
        %61 = comb.icmp ne %60, %c3_i3_15 : i3
        %62 = comb.xor %55, %true_16 : i1
        %63 = comb.xor %58, %true_17 : i1
        %64 = comb.and %5, %63, %62, %13 : i1
        %65 = comb.mux %58, %19, %55 : i1
        %66 = comb.and %5, %65 : i1
        %67 = comb.and %66, %20 : i1
        %68 = comb.or %64, %67 : i1
        %69 = comb.and %61, %68 : i1
        %70 = comb.and %61, %66, %21 : i1
        %71 = comb.and %61, %20 : i1
        %72 = comb.and %58, %csaat_q, %10, %cpha_q : i1
        %73 = comb.or %17, %72 : i1
        %74 = comb.and %61, %73, %20 : i1
        %75 = comb.and %61, %73, %21 : i1
        %76 = comb.mux %71, %29, %byte_cntr_cpha0_q : i20
        %77 = comb.and %58, %34 : i1
        %78 = comb.and %58, %csaat_q, %37, %36 : i1
        %79 = comb.xor %55, %true_26 : i1
        %80 = comb.and %79, %42 : i1
        %81 = comb.mux %58, %41, %80 : i1
        %82 = comb.and %61, %5 : i1
        %83 = comb.xor %64, %true : i1
        %84 = comb.and %83, %82 : i1
        %85 = comb.xor %77, %true : i1
        %86 = comb.and %85, %84 : i1
        %87 = comb.xor %78, %true : i1
        %88 = comb.and %87, %86, %81 : i1
        %89 = comb.and %86, %78 : i1
        %90 = comb.or %89, %88 : i1
        %91 = comb.and %84, %77 : i1
        %92 = comb.and %82, %64 : i1
        %93 = comb.xor %61, %true : i1
        %94 = comb.and %44, %93, %5 : i1
        %95 = comb.icmp ne %60, %c-4_i3 : i3
        %96 = comb.xor %66, %true : i1
        %97 = comb.and %96, %83 : i1
        %98 = comb.xor %73, %true : i1
        %99 = comb.and %98, %97, %58, %csaat_q, %47, %46 : i1
        %100 = comb.xor %99, %true : i1
        %101 = comb.and %97, %73 : i1
        %102 = comb.xor %101, %true : i1
        %103 = comb.and %83, %66 : i1
        %104 = comb.xor %103, %true : i1
        %105 = comb.and %83, %104, %102, %100, %95 : i1
        %106 = comb.icmp ne %60, %c3_i3 : i3
        %107 = comb.and %arg15, %58, %csaat_q, %12 : i1
        %108 = comb.mux %107, %arg14, %csid_q : i1
        %109 = comb.mux %107, %arg13, %cpol_q : i1
        %110 = comb.mux %107, %arg12, %cpha_q : i1
        %111 = comb.mux %107, %arg8, %csnidle_q : i4
        %112 = comb.mux %107, %arg9, %csnlead_q : i4
        %113 = comb.mux %107, %arg10, %csntrail_q : i4
        %114 = comb.mux %107, %arg7, %clkdiv_q : i16
        %115 = comb.mux %107, %arg3, %cmd_wr_en_q : i1
        %116 = comb.mux %107, %arg4, %cmd_rd_en_q : i1
        %117 = comb.mux %1, %114, %2 : i16
        %118 = comb.mux %107, %arg7, %117 : i16
        %119 = comb.xor %110, %true : i1
        %120 = comb.mux %119, %69, %74 : i1
        %121 = comb.and %119, %71 : i1
        %122 = comb.mux %119, %70, %75 : i1
        %123 = comb.mux %119, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %124 = comb.xor %116, %true : i1
        %125 = comb.xor %115, %true : i1
        %126 = comb.and %124, %125 : i1
        %127 = comb.mux %107, %22, %23 : i1
        %128 = comb.mux %107, %24, %25 : i1
        %129 = comb.mux %107, %26, %27 : i1
        %130 = comb.mux %129, %c-4_i3, %c1_i3 : i3
        %131 = comb.xor %126, %true : i1
        %132 = comb.xor %127, %true : i1
        %133 = comb.and %132, %131, %128 : i1
        %134 = comb.mux %133, %c2_i3, %130 : i3
        %135 = comb.mux %133, %c-2_i3, %130 : i3
        %136 = comb.and %131, %127 : i1
        %137 = comb.mux %136, %c1_i3, %134 : i3
        %138 = comb.mux %136, %c-1_i3, %135 : i3
        %139 = comb.mux %126, %c0_i3, %137 : i3
        %140 = comb.mux %126, %c0_i3, %138 : i3
        %141 = comb.sub %bit_cntr_q, %139 : i3
        %142 = comb.mux %122, %141, %bit_cntr_q : i3
        %143 = comb.mux %120, %140, %142 : i3
        %144 = comb.mux %107, %arg5, %76 : i20
        %145 = comb.mux %90, %111, %c0_i4 : i4
        %146 = comb.mux %91, %113, %145 : i4
        %147 = comb.mux %92, %112, %146 : i4
        %148 = comb.mux %5, %147, %wait_cntr_q : i4
        %149 = comb.mux %94, %43, %148 : i4
        %150 = comb.mux %109, %106, %73 : i1
        %151 = comb.xor %121, %true : i1
        %152 = comb.and %151, %cmd_wr_en_last_bit : i1
        %153 = comb.or %48, %152 : i1
        fsm.update %cmd_wr_en_last_bit, %153 : i1
        %154 = comb.and %120, %115, %3 : i1
        %155 = comb.and %121, %123, %4 : i1
        %156 = comb.or %155, %154 : i1
        %157 = comb.xor %156, %true : i1
        %158 = comb.and %122, %157 : i1
        %159 = comb.and %107, %157 : i1
        %160 = comb.mux %159, %arg14, %csid_q : i1
        %161 = comb.mux %159, %arg13, %cpol_q : i1
        %162 = comb.mux %159, %arg12, %cpha_q : i1
        %163 = comb.mux %159, %arg11, %full_cyc_q : i1
        %164 = comb.mux %159, %arg8, %csnidle_q : i4
        %165 = comb.mux %159, %arg9, %csnlead_q : i4
        %166 = comb.mux %159, %arg10, %csntrail_q : i4
        %167 = comb.mux %159, %arg7, %clkdiv_q : i16
        %168 = comb.mux %159, %arg6, %csaat_q : i1
        %169 = comb.mux %159, %arg3, %cmd_wr_en_q : i1
        %170 = comb.mux %159, %arg4, %cmd_rd_en_q : i1
        %171 = comb.mux %159, %arg2, %cmd_speed_q : i2
        %172 = comb.or %156, %0 : i1
        %173 = comb.mux %172, %clk_cntr_q, %118 : i16
        %174 = comb.and %61, %157 : i1
        %175 = comb.mux bin %174, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %176 = comb.or %156, %17 : i1
        %177 = comb.mux %176, %bit_cntr_q, %143 : i3
        %178 = comb.or %156, %17 : i1
        %179 = comb.mux %178, %byte_cntr_cpha0_q, %144 : i20
        %true_28 = hw.constant true
        %180 = comb.xor %107, %true_28 : i1
        %181 = comb.or %156, %180 : i1
        %182 = comb.mux %181, %byte_cntr_cpha1_q, %arg5 : i20
        %183 = comb.mux %156, %wait_cntr_q, %149 : i4
        %184 = comb.or %120, %158 : i1
        %185 = comb.and %5, %157 : i1
        %186 = comb.mux %185, %184, %sample_en_q : i1
        %187 = comb.mux %185, %sample_en_q, %sample_en_q2 : i1
        %188 = comb.mux bin %156, %u_sck_flop2Fq_o, %150 : i1
        %189 = comb.mux %157, %105, %csb_q : i1
        %190 = comb.or %108, %189 : i1
        fsm.update %_sh1_12, %157 : i1
        fsm.update %csb_q, %190 : i1
        fsm.update %u_sck_flop2Fq_o, %188 : i1
        fsm.update %sample_en_q2, %187 : i1
        fsm.update %sample_en_q, %186 : i1
        fsm.update %wait_cntr_q, %183 : i4
        fsm.update %byte_cntr_cpha1_q, %182 : i20
        fsm.update %byte_cntr_cpha0_q, %179 : i20
        fsm.update %bit_cntr_q, %177 : i3
        fsm.update %segment_rd_en_cpha1, %175 : i1
        fsm.update %clk_cntr_q, %173 : i16
        fsm.update %cmd_speed_q, %171 : i2
        fsm.update %cmd_wr_en_q, %169 : i1
        fsm.update %cmd_rd_en_q, %170 : i1
        fsm.update %csaat_q, %168 : i1
        fsm.update %clkdiv_q, %167 : i16
        fsm.update %csntrail_q, %166 : i4
        fsm.update %csnlead_q, %165 : i4
        fsm.update %csnidle_q, %164 : i4
        fsm.update %full_cyc_q, %163 : i1
        fsm.update %cpha_q, %162 : i1
        fsm.update %cpol_q, %161 : i1
        fsm.update %csid_q, %160 : i1
      }
      fsm.transition @state_3 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %csaat_q, %true : i1
        %12 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.mux %11, %c-4_i3, %8 : i3
        %c3_i3 = hw.constant 3 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %17 = comb.xor %isFirstCycle, %true : i1
        %18 = comb.and %17, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %13 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and %arg1, %0 : i1
        %21 = comb.xor %15, %true : i1
        %22 = comb.icmp ne %16, %c0_i20 : i20
        %23 = comb.or %21, %22, %cpha_q : i1
        %24 = comb.and %20, %13 : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.mux %25, %c2_i3, %12 : i3
        %27 = comb.xor %23, %true : i1
        %28 = comb.and %27, %24 : i1
        %29 = comb.mux %28, %14, %26 : i3
        %30 = comb.mux %arg18, %c0_i3, %29 : i3
        %31 = comb.xor %20, %true : i1
        %32 = comb.and %13, %31 : i1
        %33 = comb.mux %32, %c3_i3, %30 : i3
        %34 = comb.xor %32, %true : i1
        %35 = comb.icmp ne %33, %c3_i3 : i3
        %36 = comb.and %13, %35 : i1
        %true_13 = hw.constant true
        %37 = comb.xor %25, %true_13 : i1
        %true_14 = hw.constant true
        %38 = comb.xor %28, %true_14 : i1
        %true_15 = hw.constant true
        %39 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %40 = comb.xor %32, %true_16 : i1
        %41 = comb.and %40, %39, %38, %37, %10 : i1
        %true_17 = hw.constant true
        %42 = comb.xor %cpha_q, %true_17 : i1
        %43 = comb.and %csaat_q, %7, %42 : i1
        %44 = comb.mux %28, %43, %25 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %32, %true_19 : i1
        %47 = comb.and %46, %45, %44, %15 : i1
        %48 = comb.or %41, %47 : i1
        %49 = comb.and %36, %48 : i1
        %true_20 = hw.constant true
        %50 = comb.xor %arg18, %true_20 : i1
        %51 = comb.and %50, %28, %csaat_q, %7, %cpha_q : i1
        %52 = comb.or %32, %51 : i1
        %53 = comb.and %36, %52, %15 : i1
        verif.assert %19 : i1
        %54 = comb.and %arg15, %34, %28, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg12, %cpha_q : i1
        %56 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %57 = comb.xor %55, %true : i1
        %58 = comb.mux %57, %49, %53 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.and %58, %56, %1 : i1
        %61 = comb.and %57, %36, %15, %59, %2 : i1
        %true_21 = hw.constant true
        %62 = comb.xor %arg18, %true_21 : i1
        %63 = comb.and %62, %28, %csaat_q, %7, %cpha_q : i1
        %64 = comb.or %61, %60, %32, %63 : i1
        fsm.return %64
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true : i1
        %4 = comb.xor %arg17, %true : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_14 = hw.constant false
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.xor %arg18, %true : i1
        %17 = comb.and %5, %16 : i1
        %18 = comb.mux %14, %c-4_i3, %11 : i3
        %19 = comb.xor %5, %true : i1
        %20 = comb.and %16, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c3_i3_15 = hw.constant 3 : i3
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %22 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %23 = comb.xor %20, %true_19 : i1
        %true_20 = hw.constant true
        %24 = comb.xor %cpha_q, %true_20 : i1
        %25 = comb.and %csaat_q, %10, %24 : i1
        %true_21 = hw.constant true
        %26 = comb.xor %arg18, %true_21 : i1
        %true_22 = hw.constant true
        %27 = comb.xor %20, %true_22 : i1
        %28 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %29 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %true_23 = hw.constant true
        %30 = comb.xor %arg18, %true_23 : i1
        %31 = comb.icmp eq %arg2, %c0_i2 : i2
        %32 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %33 = comb.icmp eq %arg2, %c1_i2 : i2
        %34 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %35 = comb.icmp eq %arg2, %c-2_i2 : i2
        %36 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %37 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %38 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %39 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_24 = hw.constant 0 : i2
        %40 = comb.icmp eq %39, %c0_i2_24 : i2
        %true_25 = hw.constant true
        %41 = comb.xor %10, %true_25 : i1
        %42 = comb.and %41, %40 : i1
        %43 = comb.or %14, %42 : i1
        %true_26 = hw.constant true
        %44 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %45 = comb.xor %20, %true_27 : i1
        %46 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_28 = hw.constant 1 : i2
        %47 = comb.icmp eq %46, %c1_i2_28 : i2
        %true_29 = hw.constant true
        %48 = comb.xor %10, %true_29 : i1
        %true_30 = hw.constant true
        %49 = comb.xor %arg18, %true_30 : i1
        %true_31 = hw.constant true
        %50 = comb.xor %20, %true_31 : i1
        %51 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_32 = hw.constant -2 : i2
        %52 = comb.icmp eq %51, %c-2_i2_32 : i2
        %true_33 = hw.constant true
        %53 = comb.xor %10, %true_33 : i1
        %54 = comb.and %csaat_q, %53, %52 : i1
        %true_34 = hw.constant true
        %55 = comb.xor %13, %true_34 : i1
        %true_35 = hw.constant true
        %true_36 = hw.constant true
        %56 = comb.xor %arg18, %true_36 : i1
        %true_37 = hw.constant true
        %57 = comb.xor %20, %true_37 : i1
        %58 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %59 = comb.or %arg18, %5 : i1
        %60 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %61 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %62 = comb.icmp eq %61, %c-1_i2 : i2
        %true_38 = hw.constant true
        %63 = comb.xor %10, %true_38 : i1
        %true_39 = hw.constant true
        %64 = comb.xor %arg18, %true_39 : i1
        %true_40 = hw.constant true
        %65 = comb.xor %20, %true_40 : i1
        %66 = comb.and %cmd_wr_en_q, %28 : i1
        %67 = comb.xor %isFirstCycle, %true : i1
        %68 = comb.and %67, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %16 : i1
        %69 = comb.xor %68, %true : i1
        verif.assert %69 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %13 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %70 = comb.xor %28, %true : i1
        %71 = comb.icmp ne %37, %c0_i20 : i20
        %72 = comb.or %70, %71, %cpha_q : i1
        %73 = comb.and %17, %72 : i1
        %74 = comb.mux %73, %c2_i3, %15 : i3
        %75 = comb.xor %72, %true : i1
        %76 = comb.and %75, %17 : i1
        %77 = comb.mux %76, %18, %74 : i3
        %78 = comb.mux %arg18, %c0_i3, %77 : i3
        %79 = comb.mux %20, %c3_i3_15, %78 : i3
        %80 = comb.icmp ne %79, %c3_i3_15 : i3
        %81 = comb.and %16, %80 : i1
        %82 = comb.xor %73, %true_16 : i1
        %83 = comb.xor %76, %true_17 : i1
        %84 = comb.and %23, %22, %83, %82, %13 : i1
        %85 = comb.mux %76, %25, %73 : i1
        %86 = comb.and %27, %26, %85 : i1
        %87 = comb.and %86, %28 : i1
        %88 = comb.or %84, %87 : i1
        %89 = comb.and %81, %88 : i1
        %90 = comb.and %81, %86, %29 : i1
        %91 = comb.and %81, %28 : i1
        %92 = comb.and %30, %76, %csaat_q, %10, %cpha_q : i1
        %93 = comb.or %20, %92 : i1
        %94 = comb.and %81, %93, %28 : i1
        %95 = comb.and %81, %93, %29 : i1
        %96 = comb.mux %91, %38, %byte_cntr_cpha0_q : i20
        %97 = comb.and %45, %44, %76, %43 : i1
        %98 = comb.and %50, %49, %76, %csaat_q, %48, %47 : i1
        %99 = comb.xor %73, %true_35 : i1
        %100 = comb.and %99, %55 : i1
        %101 = comb.mux %76, %54, %100 : i1
        %102 = comb.and %80, %17 : i1
        %103 = comb.xor %84, %true : i1
        %104 = comb.and %103, %102 : i1
        %105 = comb.xor %97, %true : i1
        %106 = comb.and %105, %104 : i1
        %107 = comb.xor %98, %true : i1
        %108 = comb.and %107, %106, %57, %56, %101 : i1
        %109 = comb.and %106, %98 : i1
        %110 = comb.or %109, %108 : i1
        %111 = comb.and %104, %97 : i1
        %112 = comb.and %102, %84 : i1
        %113 = comb.xor %80, %true : i1
        %114 = comb.and %60, %113, %17 : i1
        %115 = comb.icmp ne %79, %c-4_i3 : i3
        %116 = comb.xor %86, %true : i1
        %117 = comb.and %116, %103 : i1
        %118 = comb.xor %93, %true : i1
        %119 = comb.and %118, %117, %65, %64, %76, %csaat_q, %63, %62 : i1
        %120 = comb.xor %119, %true : i1
        %121 = comb.and %117, %93 : i1
        %122 = comb.xor %121, %true : i1
        %123 = comb.and %103, %86 : i1
        %124 = comb.xor %123, %true : i1
        %125 = comb.and %103, %124, %122, %120, %115 : i1
        %126 = comb.icmp ne %79, %c3_i3 : i3
        %127 = comb.and %arg15, %21, %76, %csaat_q, %12 : i1
        %128 = comb.mux %127, %arg14, %csid_q : i1
        %129 = comb.mux %127, %arg13, %cpol_q : i1
        %130 = comb.mux %127, %arg12, %cpha_q : i1
        %131 = comb.mux %127, %arg8, %csnidle_q : i4
        %132 = comb.mux %127, %arg9, %csnlead_q : i4
        %133 = comb.mux %127, %arg10, %csntrail_q : i4
        %134 = comb.mux %127, %arg7, %clkdiv_q : i16
        %135 = comb.mux %127, %arg3, %cmd_wr_en_q : i1
        %136 = comb.mux %127, %arg4, %cmd_rd_en_q : i1
        %137 = comb.mux %1, %134, %2 : i16
        %138 = comb.mux %127, %arg7, %137 : i16
        %139 = comb.mux %0, %clk_cntr_q, %138 : i16
        %140 = comb.mux %arg18, %c0_i16, %139 : i16
        %141 = comb.xor %130, %true : i1
        %142 = comb.mux %141, %89, %94 : i1
        %143 = comb.and %141, %91 : i1
        %144 = comb.mux %141, %90, %95 : i1
        %145 = comb.mux %141, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %146 = comb.xor %136, %true : i1
        %147 = comb.xor %135, %true : i1
        %148 = comb.and %146, %147 : i1
        %149 = comb.mux %127, %31, %32 : i1
        %150 = comb.mux %127, %33, %34 : i1
        %151 = comb.mux %127, %35, %36 : i1
        %152 = comb.mux %151, %c-4_i3, %c1_i3 : i3
        %153 = comb.xor %148, %true : i1
        %154 = comb.xor %149, %true : i1
        %155 = comb.and %154, %153, %150 : i1
        %156 = comb.mux %155, %c2_i3, %152 : i3
        %157 = comb.mux %155, %c-2_i3, %152 : i3
        %158 = comb.and %153, %149 : i1
        %159 = comb.mux %158, %c1_i3, %156 : i3
        %160 = comb.mux %158, %c-1_i3, %157 : i3
        %161 = comb.mux %148, %c0_i3, %159 : i3
        %162 = comb.mux %148, %c0_i3, %160 : i3
        %163 = comb.sub %bit_cntr_q, %161 : i3
        %164 = comb.mux %144, %163, %bit_cntr_q : i3
        %165 = comb.mux %142, %162, %164 : i3
        %166 = comb.mux %19, %bit_cntr_q, %165 : i3
        %167 = comb.mux %arg18, %c0_i3, %166 : i3
        %168 = comb.mux %127, %arg5, %96 : i20
        %169 = comb.mux %19, %byte_cntr_cpha0_q, %168 : i20
        %170 = comb.mux %arg18, %c0_i20, %169 : i20
        %171 = comb.mux %127, %arg5, %byte_cntr_cpha1_q : i20
        %172 = comb.mux %arg18, %c0_i20, %171 : i20
        %173 = comb.mux %110, %131, %c0_i4 : i4
        %174 = comb.mux %111, %133, %173 : i4
        %175 = comb.mux %112, %132, %174 : i4
        %176 = comb.mux %59, %175, %wait_cntr_q : i4
        %177 = comb.mux %arg18, %c0_i4, %176 : i4
        %178 = comb.mux %114, %58, %177 : i4
        %179 = comb.mux %129, %126, %93 : i1
        %180 = comb.xor %143, %true : i1
        %181 = comb.and %180, %cmd_wr_en_last_bit : i1
        %182 = comb.or %66, %181 : i1
        fsm.update %cmd_wr_en_last_bit, %182 : i1
        %183 = comb.and %142, %135, %3 : i1
        %184 = comb.and %143, %145, %4 : i1
        %185 = comb.or %184, %183 : i1
        %186 = comb.xor %185, %true : i1
        %187 = comb.and %144, %186 : i1
        %188 = comb.and %127, %186 : i1
        %189 = comb.mux %188, %arg14, %csid_q : i1
        %190 = comb.mux %188, %arg13, %cpol_q : i1
        %191 = comb.mux %188, %arg12, %cpha_q : i1
        %192 = comb.mux %188, %arg11, %full_cyc_q : i1
        %193 = comb.mux %188, %arg8, %csnidle_q : i4
        %194 = comb.mux %188, %arg9, %csnlead_q : i4
        %195 = comb.mux %188, %arg10, %csntrail_q : i4
        %196 = comb.mux %188, %arg7, %clkdiv_q : i16
        %197 = comb.mux %188, %arg6, %csaat_q : i1
        %198 = comb.mux %188, %arg3, %cmd_wr_en_q : i1
        %199 = comb.mux %188, %arg4, %cmd_rd_en_q : i1
        %200 = comb.mux %188, %arg2, %cmd_speed_q : i2
        %201 = comb.mux %185, %clk_cntr_q, %140 : i16
        %202 = comb.and %80, %186 : i1
        %203 = comb.mux bin %202, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %204 = comb.mux %185, %bit_cntr_q, %167 : i3
        %205 = comb.mux %185, %byte_cntr_cpha0_q, %170 : i20
        %206 = comb.mux %185, %byte_cntr_cpha1_q, %172 : i20
        %207 = comb.mux %185, %wait_cntr_q, %178 : i4
        %208 = comb.or %142, %187 : i1
        %209 = comb.and %5, %186 : i1
        %210 = comb.mux %209, %208, %sample_en_q : i1
        %211 = comb.mux %209, %sample_en_q, %sample_en_q2 : i1
        %212 = comb.mux bin %185, %u_sck_flop2Fq_o, %179 : i1
        %213 = comb.mux %186, %125, %csb_q : i1
        %214 = comb.or %128, %213 : i1
        fsm.update %_sh1_12, %186 : i1
        fsm.update %csb_q, %214 : i1
        fsm.update %u_sck_flop2Fq_o, %212 : i1
        fsm.update %sample_en_q2, %211 : i1
        fsm.update %sample_en_q, %210 : i1
        fsm.update %wait_cntr_q, %207 : i4
        fsm.update %byte_cntr_cpha1_q, %206 : i20
        fsm.update %byte_cntr_cpha0_q, %205 : i20
        fsm.update %bit_cntr_q, %204 : i3
        fsm.update %segment_rd_en_cpha1, %203 : i1
        fsm.update %clk_cntr_q, %201 : i16
        fsm.update %cmd_speed_q, %200 : i2
        fsm.update %cmd_wr_en_q, %198 : i1
        fsm.update %cmd_rd_en_q, %199 : i1
        fsm.update %csaat_q, %197 : i1
        fsm.update %clkdiv_q, %196 : i16
        fsm.update %csntrail_q, %195 : i4
        fsm.update %csnlead_q, %194 : i4
        fsm.update %csnidle_q, %193 : i4
        fsm.update %full_cyc_q, %192 : i1
        fsm.update %cpha_q, %191 : i1
        fsm.update %cpol_q, %190 : i1
        fsm.update %csid_q, %189 : i1
      }
      fsm.transition @state_2 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %csaat_q, %true : i1
        %12 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.mux %11, %c-4_i3, %8 : i3
        %c3_i3 = hw.constant 3 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %17 = comb.xor %isFirstCycle, %true : i1
        %18 = comb.and %17, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %13 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and %arg1, %0 : i1
        %21 = comb.xor %15, %true : i1
        %22 = comb.icmp ne %16, %c0_i20 : i20
        %23 = comb.or %21, %22, %cpha_q : i1
        %24 = comb.and %20, %13 : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.mux %25, %c2_i3, %12 : i3
        %27 = comb.xor %23, %true : i1
        %28 = comb.and %27, %24 : i1
        %29 = comb.mux %28, %14, %26 : i3
        %30 = comb.mux %arg18, %c0_i3, %29 : i3
        %31 = comb.xor %20, %true : i1
        %32 = comb.and %13, %31 : i1
        %33 = comb.mux %32, %c3_i3, %30 : i3
        %34 = comb.xor %32, %true : i1
        %35 = comb.icmp ne %33, %c3_i3 : i3
        %36 = comb.and %13, %35 : i1
        %true_13 = hw.constant true
        %37 = comb.xor %25, %true_13 : i1
        %true_14 = hw.constant true
        %38 = comb.xor %28, %true_14 : i1
        %true_15 = hw.constant true
        %39 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %40 = comb.xor %32, %true_16 : i1
        %41 = comb.and %40, %39, %38, %37, %10 : i1
        %true_17 = hw.constant true
        %42 = comb.xor %cpha_q, %true_17 : i1
        %43 = comb.and %csaat_q, %7, %42 : i1
        %44 = comb.mux %28, %43, %25 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %32, %true_19 : i1
        %47 = comb.and %46, %45, %44, %15 : i1
        %48 = comb.or %41, %47 : i1
        %49 = comb.and %36, %48 : i1
        %true_20 = hw.constant true
        %50 = comb.xor %arg18, %true_20 : i1
        %51 = comb.and %50, %28, %csaat_q, %7, %cpha_q : i1
        %52 = comb.or %32, %51 : i1
        %53 = comb.and %36, %52, %15 : i1
        verif.assert %19 : i1
        %54 = comb.and %arg15, %34, %28, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg12, %cpha_q : i1
        %56 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %57 = comb.xor %55, %true : i1
        %58 = comb.mux %57, %49, %53 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.and %58, %56, %1 : i1
        %61 = comb.and %57, %36, %15, %59, %2 : i1
        %62 = comb.or %61, %60, %32 : i1
        %true_21 = hw.constant true
        %63 = comb.xor %cpha_q, %true_21 : i1
        %64 = comb.and %csaat_q, %7, %63 : i1
        %65 = comb.mux %28, %64, %25 : i1
        %true_22 = hw.constant true
        %66 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %67 = comb.xor %62, %true_23 : i1
        %68 = comb.and %67, %66, %65 : i1
        fsm.return %68
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true : i1
        %4 = comb.xor %arg17, %true : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_14 = hw.constant false
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.mux %14, %c-4_i3, %11 : i3
        %17 = comb.xor %5, %true : i1
        %c3_i3_15 = hw.constant 3 : i3
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %18 = comb.xor %cpha_q, %true_18 : i1
        %19 = comb.and %csaat_q, %10, %18 : i1
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %22 = comb.icmp eq %arg2, %c0_i2 : i2
        %23 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %24 = comb.icmp eq %arg2, %c1_i2 : i2
        %25 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %26 = comb.icmp eq %arg2, %c-2_i2 : i2
        %27 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %28 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %29 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %30 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_19 = hw.constant 0 : i2
        %31 = comb.icmp eq %30, %c0_i2_19 : i2
        %true_20 = hw.constant true
        %32 = comb.xor %10, %true_20 : i1
        %33 = comb.and %32, %31 : i1
        %34 = comb.or %14, %33 : i1
        %35 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_21 = hw.constant 1 : i2
        %36 = comb.icmp eq %35, %c1_i2_21 : i2
        %true_22 = hw.constant true
        %37 = comb.xor %10, %true_22 : i1
        %38 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_23 = hw.constant -2 : i2
        %39 = comb.icmp eq %38, %c-2_i2_23 : i2
        %true_24 = hw.constant true
        %40 = comb.xor %10, %true_24 : i1
        %41 = comb.and %csaat_q, %40, %39 : i1
        %true_25 = hw.constant true
        %42 = comb.xor %13, %true_25 : i1
        %true_26 = hw.constant true
        %43 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %44 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %45 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %46 = comb.icmp eq %45, %c-1_i2 : i2
        %true_27 = hw.constant true
        %47 = comb.xor %10, %true_27 : i1
        %48 = comb.and %cmd_wr_en_q, %20 : i1
        %49 = comb.xor %isFirstCycle, %true : i1
        %50 = comb.and %49, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %51 = comb.xor %50, %true : i1
        verif.assert %51 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %13 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %52 = comb.xor %20, %true : i1
        %53 = comb.icmp ne %28, %c0_i20 : i20
        %54 = comb.or %52, %53, %cpha_q : i1
        %55 = comb.and %5, %54 : i1
        %56 = comb.mux %55, %c2_i3, %15 : i3
        %57 = comb.xor %54, %true : i1
        %58 = comb.and %57, %5 : i1
        %59 = comb.mux %58, %16, %56 : i3
        %60 = comb.mux %17, %c3_i3_15, %59 : i3
        %61 = comb.icmp ne %60, %c3_i3_15 : i3
        %62 = comb.xor %55, %true_16 : i1
        %63 = comb.xor %58, %true_17 : i1
        %64 = comb.and %5, %63, %62, %13 : i1
        %65 = comb.mux %58, %19, %55 : i1
        %66 = comb.and %5, %65 : i1
        %67 = comb.and %66, %20 : i1
        %68 = comb.or %64, %67 : i1
        %69 = comb.and %61, %68 : i1
        %70 = comb.and %61, %66, %21 : i1
        %71 = comb.and %61, %20 : i1
        %72 = comb.and %58, %csaat_q, %10, %cpha_q : i1
        %73 = comb.or %17, %72 : i1
        %74 = comb.and %61, %73, %20 : i1
        %75 = comb.and %61, %73, %21 : i1
        %76 = comb.mux %71, %29, %byte_cntr_cpha0_q : i20
        %77 = comb.and %58, %34 : i1
        %78 = comb.and %58, %csaat_q, %37, %36 : i1
        %79 = comb.xor %55, %true_26 : i1
        %80 = comb.and %79, %42 : i1
        %81 = comb.mux %58, %41, %80 : i1
        %82 = comb.and %61, %5 : i1
        %83 = comb.xor %64, %true : i1
        %84 = comb.and %83, %82 : i1
        %85 = comb.xor %77, %true : i1
        %86 = comb.and %85, %84 : i1
        %87 = comb.xor %78, %true : i1
        %88 = comb.and %87, %86, %81 : i1
        %89 = comb.and %86, %78 : i1
        %90 = comb.or %89, %88 : i1
        %91 = comb.and %84, %77 : i1
        %92 = comb.and %82, %64 : i1
        %93 = comb.xor %61, %true : i1
        %94 = comb.and %44, %93, %5 : i1
        %95 = comb.icmp ne %60, %c-4_i3 : i3
        %96 = comb.xor %66, %true : i1
        %97 = comb.and %96, %83 : i1
        %98 = comb.xor %73, %true : i1
        %99 = comb.and %98, %97, %58, %csaat_q, %47, %46 : i1
        %100 = comb.xor %99, %true : i1
        %101 = comb.and %97, %73 : i1
        %102 = comb.xor %101, %true : i1
        %103 = comb.and %83, %66 : i1
        %104 = comb.xor %103, %true : i1
        %105 = comb.and %83, %104, %102, %100, %95 : i1
        %106 = comb.icmp ne %60, %c3_i3 : i3
        %107 = comb.and %arg15, %58, %csaat_q, %12 : i1
        %108 = comb.mux %107, %arg14, %csid_q : i1
        %109 = comb.mux %107, %arg13, %cpol_q : i1
        %110 = comb.mux %107, %arg12, %cpha_q : i1
        %111 = comb.mux %107, %arg8, %csnidle_q : i4
        %112 = comb.mux %107, %arg9, %csnlead_q : i4
        %113 = comb.mux %107, %arg10, %csntrail_q : i4
        %114 = comb.mux %107, %arg7, %clkdiv_q : i16
        %115 = comb.mux %107, %arg3, %cmd_wr_en_q : i1
        %116 = comb.mux %107, %arg4, %cmd_rd_en_q : i1
        %117 = comb.mux %1, %114, %2 : i16
        %118 = comb.mux %107, %arg7, %117 : i16
        %119 = comb.xor %110, %true : i1
        %120 = comb.mux %119, %69, %74 : i1
        %121 = comb.and %119, %71 : i1
        %122 = comb.mux %119, %70, %75 : i1
        %123 = comb.mux %119, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %124 = comb.xor %116, %true : i1
        %125 = comb.xor %115, %true : i1
        %126 = comb.and %124, %125 : i1
        %127 = comb.mux %107, %22, %23 : i1
        %128 = comb.mux %107, %24, %25 : i1
        %129 = comb.mux %107, %26, %27 : i1
        %130 = comb.mux %129, %c-4_i3, %c1_i3 : i3
        %131 = comb.xor %126, %true : i1
        %132 = comb.xor %127, %true : i1
        %133 = comb.and %132, %131, %128 : i1
        %134 = comb.mux %133, %c2_i3, %130 : i3
        %135 = comb.mux %133, %c-2_i3, %130 : i3
        %136 = comb.and %131, %127 : i1
        %137 = comb.mux %136, %c1_i3, %134 : i3
        %138 = comb.mux %136, %c-1_i3, %135 : i3
        %139 = comb.mux %126, %c0_i3, %137 : i3
        %140 = comb.mux %126, %c0_i3, %138 : i3
        %141 = comb.sub %bit_cntr_q, %139 : i3
        %142 = comb.mux %122, %141, %bit_cntr_q : i3
        %143 = comb.mux %120, %140, %142 : i3
        %144 = comb.mux %107, %arg5, %76 : i20
        %145 = comb.mux %90, %111, %c0_i4 : i4
        %146 = comb.mux %91, %113, %145 : i4
        %147 = comb.mux %92, %112, %146 : i4
        %148 = comb.mux %5, %147, %wait_cntr_q : i4
        %149 = comb.mux %94, %43, %148 : i4
        %150 = comb.mux %109, %106, %73 : i1
        %151 = comb.xor %121, %true : i1
        %152 = comb.and %151, %cmd_wr_en_last_bit : i1
        %153 = comb.or %48, %152 : i1
        fsm.update %cmd_wr_en_last_bit, %153 : i1
        %154 = comb.and %120, %115, %3 : i1
        %155 = comb.and %121, %123, %4 : i1
        %156 = comb.or %155, %154 : i1
        %157 = comb.xor %156, %true : i1
        %158 = comb.and %122, %157 : i1
        %159 = comb.and %107, %157 : i1
        %160 = comb.mux %159, %arg14, %csid_q : i1
        %161 = comb.mux %159, %arg13, %cpol_q : i1
        %162 = comb.mux %159, %arg12, %cpha_q : i1
        %163 = comb.mux %159, %arg11, %full_cyc_q : i1
        %164 = comb.mux %159, %arg8, %csnidle_q : i4
        %165 = comb.mux %159, %arg9, %csnlead_q : i4
        %166 = comb.mux %159, %arg10, %csntrail_q : i4
        %167 = comb.mux %159, %arg7, %clkdiv_q : i16
        %168 = comb.mux %159, %arg6, %csaat_q : i1
        %169 = comb.mux %159, %arg3, %cmd_wr_en_q : i1
        %170 = comb.mux %159, %arg4, %cmd_rd_en_q : i1
        %171 = comb.mux %159, %arg2, %cmd_speed_q : i2
        %172 = comb.or %156, %0 : i1
        %173 = comb.mux %172, %clk_cntr_q, %118 : i16
        %174 = comb.and %61, %157 : i1
        %175 = comb.mux bin %174, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %176 = comb.or %156, %17 : i1
        %177 = comb.mux %176, %bit_cntr_q, %143 : i3
        %178 = comb.or %156, %17 : i1
        %179 = comb.mux %178, %byte_cntr_cpha0_q, %144 : i20
        %true_28 = hw.constant true
        %180 = comb.xor %107, %true_28 : i1
        %181 = comb.or %156, %180 : i1
        %182 = comb.mux %181, %byte_cntr_cpha1_q, %arg5 : i20
        %183 = comb.mux %156, %wait_cntr_q, %149 : i4
        %184 = comb.or %120, %158 : i1
        %185 = comb.and %5, %157 : i1
        %186 = comb.mux %185, %184, %sample_en_q : i1
        %187 = comb.mux %185, %sample_en_q, %sample_en_q2 : i1
        %188 = comb.mux bin %156, %u_sck_flop2Fq_o, %150 : i1
        %189 = comb.mux %157, %105, %csb_q : i1
        %190 = comb.or %108, %189 : i1
        fsm.update %_sh1_12, %157 : i1
        fsm.update %csb_q, %190 : i1
        fsm.update %u_sck_flop2Fq_o, %188 : i1
        fsm.update %sample_en_q2, %187 : i1
        fsm.update %sample_en_q, %186 : i1
        fsm.update %wait_cntr_q, %183 : i4
        fsm.update %byte_cntr_cpha1_q, %182 : i20
        fsm.update %byte_cntr_cpha0_q, %179 : i20
        fsm.update %bit_cntr_q, %177 : i3
        fsm.update %segment_rd_en_cpha1, %175 : i1
        fsm.update %clk_cntr_q, %173 : i16
        fsm.update %cmd_speed_q, %171 : i2
        fsm.update %cmd_wr_en_q, %169 : i1
        fsm.update %cmd_rd_en_q, %170 : i1
        fsm.update %csaat_q, %168 : i1
        fsm.update %clkdiv_q, %167 : i16
        fsm.update %csntrail_q, %166 : i4
        fsm.update %csnlead_q, %165 : i4
        fsm.update %csnidle_q, %164 : i4
        fsm.update %full_cyc_q, %163 : i1
        fsm.update %cpha_q, %162 : i1
        fsm.update %cpol_q, %161 : i1
        fsm.update %csid_q, %160 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %csaat_q, %true : i1
        %12 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.mux %11, %c-4_i3, %8 : i3
        %c3_i3 = hw.constant 3 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %17 = comb.xor %isFirstCycle, %true : i1
        %18 = comb.and %17, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %13 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and %arg1, %0 : i1
        %21 = comb.xor %15, %true : i1
        %22 = comb.icmp ne %16, %c0_i20 : i20
        %23 = comb.or %21, %22, %cpha_q : i1
        %24 = comb.and %20, %13 : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.mux %25, %c2_i3, %12 : i3
        %27 = comb.xor %23, %true : i1
        %28 = comb.and %27, %24 : i1
        %29 = comb.mux %28, %14, %26 : i3
        %30 = comb.mux %arg18, %c0_i3, %29 : i3
        %31 = comb.xor %20, %true : i1
        %32 = comb.and %13, %31 : i1
        %33 = comb.mux %32, %c3_i3, %30 : i3
        %34 = comb.xor %32, %true : i1
        %35 = comb.icmp ne %33, %c3_i3 : i3
        %36 = comb.and %13, %35 : i1
        %true_13 = hw.constant true
        %37 = comb.xor %25, %true_13 : i1
        %true_14 = hw.constant true
        %38 = comb.xor %28, %true_14 : i1
        %true_15 = hw.constant true
        %39 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %40 = comb.xor %32, %true_16 : i1
        %41 = comb.and %40, %39, %38, %37, %10 : i1
        %true_17 = hw.constant true
        %42 = comb.xor %cpha_q, %true_17 : i1
        %43 = comb.and %csaat_q, %7, %42 : i1
        %44 = comb.mux %28, %43, %25 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %32, %true_19 : i1
        %47 = comb.and %46, %45, %44, %15 : i1
        %48 = comb.or %41, %47 : i1
        %49 = comb.and %36, %48 : i1
        %true_20 = hw.constant true
        %50 = comb.xor %arg18, %true_20 : i1
        %51 = comb.and %50, %28, %csaat_q, %7, %cpha_q : i1
        %52 = comb.or %32, %51 : i1
        %53 = comb.and %36, %52, %15 : i1
        verif.assert %19 : i1
        %54 = comb.and %arg15, %34, %28, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg12, %cpha_q : i1
        %56 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %57 = comb.xor %55, %true : i1
        %58 = comb.mux %57, %49, %53 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.and %58, %56, %1 : i1
        %61 = comb.and %57, %36, %15, %59, %2 : i1
        %62 = comb.or %61, %60, %32 : i1
        %true_21 = hw.constant true
        %63 = comb.xor %25, %true_21 : i1
        %true_22 = hw.constant true
        %64 = comb.xor %28, %true_22 : i1
        %true_23 = hw.constant true
        %65 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %66 = comb.xor %62, %true_24 : i1
        %67 = comb.and %66, %65, %64, %63, %10 : i1
        fsm.return %67
      } action {
        %true = hw.constant true
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %true_14 = hw.constant true
        %0 = comb.xor %arg1, %true_14 : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true_14 : i1
        %4 = comb.xor %arg17, %true_14 : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true_14 : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_15 = hw.constant false
        %13 = comb.xor %csaat_q, %true_14 : i1
        %14 = comb.mux %13, %c-4_i3, %11 : i3
        %15 = comb.xor %5, %true_14 : i1
        %c3_i3_16 = hw.constant 3 : i3
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %true_19 = hw.constant true
        %16 = comb.xor %cpha_q, %true_19 : i1
        %17 = comb.and %csaat_q, %10, %16 : i1
        %18 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %19 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %20 = comb.icmp eq %arg2, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %22 = comb.icmp eq %arg2, %c1_i2 : i2
        %23 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %24 = comb.icmp eq %arg2, %c-2_i2 : i2
        %25 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %26 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %27 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %28 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_20 = hw.constant 0 : i2
        %29 = comb.icmp eq %28, %c0_i2_20 : i2
        %true_21 = hw.constant true
        %30 = comb.xor %10, %true_21 : i1
        %31 = comb.and %30, %29 : i1
        %32 = comb.or %13, %31 : i1
        %33 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_22 = hw.constant 1 : i2
        %34 = comb.icmp eq %33, %c1_i2_22 : i2
        %true_23 = hw.constant true
        %35 = comb.xor %10, %true_23 : i1
        %36 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_24 = hw.constant -2 : i2
        %37 = comb.icmp eq %36, %c-2_i2_24 : i2
        %true_25 = hw.constant true
        %38 = comb.xor %10, %true_25 : i1
        %39 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %40 = comb.icmp eq %39, %c-1_i2 : i2
        %true_26 = hw.constant true
        %41 = comb.xor %10, %true_26 : i1
        %42 = comb.and %cmd_wr_en_q, %18 : i1
        %43 = comb.xor %isFirstCycle, %true_14 : i1
        %44 = comb.and %43, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %45 = comb.xor %44, %true_14 : i1
        verif.assert %45 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %true : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %46 = comb.xor %18, %true_14 : i1
        %47 = comb.icmp ne %26, %c0_i20 : i20
        %48 = comb.or %46, %47, %cpha_q : i1
        %49 = comb.and %5, %48 : i1
        %50 = comb.mux %49, %c2_i3, %c1_i3 : i3
        %51 = comb.xor %48, %true_14 : i1
        %52 = comb.and %51, %5 : i1
        %53 = comb.mux %52, %14, %50 : i3
        %54 = comb.mux %15, %c3_i3_16, %53 : i3
        %55 = comb.icmp ne %54, %c3_i3_16 : i3
        %56 = comb.xor %49, %true_17 : i1
        %57 = comb.xor %52, %true_18 : i1
        %58 = comb.and %5, %57, %56 : i1
        %59 = comb.mux %52, %17, %49 : i1
        %60 = comb.and %5, %59 : i1
        %61 = comb.and %60, %18 : i1
        %62 = comb.or %58, %61 : i1
        %63 = comb.and %55, %62 : i1
        %64 = comb.and %55, %60, %19 : i1
        %65 = comb.and %55, %18 : i1
        %66 = comb.and %52, %csaat_q, %10, %cpha_q : i1
        %67 = comb.or %15, %66 : i1
        %68 = comb.and %55, %67, %18 : i1
        %69 = comb.and %55, %67, %19 : i1
        %70 = comb.mux %65, %27, %byte_cntr_cpha0_q : i20
        %71 = comb.and %52, %32 : i1
        %72 = comb.and %52, %csaat_q, %35, %34 : i1
        %73 = comb.and %55, %5 : i1
        %74 = comb.xor %58, %true_14 : i1
        %75 = comb.and %74, %73 : i1
        %76 = comb.xor %71, %true_14 : i1
        %77 = comb.and %76, %75 : i1
        %78 = comb.xor %72, %true_14 : i1
        %79 = comb.and %78, %77, %52, %csaat_q, %38, %37 : i1
        %80 = comb.and %77, %72 : i1
        %81 = comb.or %80, %79 : i1
        %82 = comb.and %75, %71 : i1
        %83 = comb.and %73, %58 : i1
        %84 = comb.icmp ne %54, %c-4_i3 : i3
        %85 = comb.xor %60, %true_14 : i1
        %86 = comb.and %85, %74 : i1
        %87 = comb.xor %67, %true_14 : i1
        %88 = comb.and %87, %86, %52, %csaat_q, %41, %40 : i1
        %89 = comb.xor %88, %true_14 : i1
        %90 = comb.and %86, %67 : i1
        %91 = comb.xor %90, %true_14 : i1
        %92 = comb.and %74, %60 : i1
        %93 = comb.xor %92, %true_14 : i1
        %94 = comb.and %74, %93, %91, %89, %84 : i1
        %95 = comb.icmp ne %54, %c3_i3 : i3
        %96 = comb.and %arg15, %52, %csaat_q, %12 : i1
        %97 = comb.mux %96, %arg14, %csid_q : i1
        %98 = comb.mux %96, %arg13, %cpol_q : i1
        %99 = comb.mux %96, %arg12, %cpha_q : i1
        %100 = comb.mux %96, %arg8, %csnidle_q : i4
        %101 = comb.mux %96, %arg9, %csnlead_q : i4
        %102 = comb.mux %96, %arg10, %csntrail_q : i4
        %103 = comb.mux %96, %arg7, %clkdiv_q : i16
        %104 = comb.mux %96, %arg3, %cmd_wr_en_q : i1
        %105 = comb.mux %96, %arg4, %cmd_rd_en_q : i1
        %106 = comb.mux %1, %103, %2 : i16
        %107 = comb.mux %96, %arg7, %106 : i16
        %108 = comb.xor %99, %true_14 : i1
        %109 = comb.mux %108, %63, %68 : i1
        %110 = comb.and %108, %65 : i1
        %111 = comb.mux %108, %64, %69 : i1
        %112 = comb.mux %108, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %113 = comb.xor %105, %true_14 : i1
        %114 = comb.xor %104, %true_14 : i1
        %115 = comb.and %113, %114 : i1
        %116 = comb.mux %96, %20, %21 : i1
        %117 = comb.mux %96, %22, %23 : i1
        %118 = comb.mux %96, %24, %25 : i1
        %119 = comb.mux %118, %c-4_i3, %c1_i3 : i3
        %120 = comb.xor %115, %true_14 : i1
        %121 = comb.xor %116, %true_14 : i1
        %122 = comb.and %121, %120, %117 : i1
        %123 = comb.mux %122, %c2_i3, %119 : i3
        %124 = comb.mux %122, %c-2_i3, %119 : i3
        %125 = comb.and %120, %116 : i1
        %126 = comb.mux %125, %c1_i3, %123 : i3
        %127 = comb.mux %125, %c-1_i3, %124 : i3
        %128 = comb.mux %115, %c0_i3, %126 : i3
        %129 = comb.mux %115, %c0_i3, %127 : i3
        %130 = comb.sub %bit_cntr_q, %128 : i3
        %131 = comb.mux %111, %130, %bit_cntr_q : i3
        %132 = comb.mux %109, %129, %131 : i3
        %133 = comb.mux %96, %arg5, %70 : i20
        %134 = comb.mux %81, %100, %c0_i4 : i4
        %135 = comb.mux %82, %102, %134 : i4
        %136 = comb.mux %83, %101, %135 : i4
        %137 = comb.mux %98, %95, %67 : i1
        %138 = comb.xor %110, %true_14 : i1
        %139 = comb.and %138, %cmd_wr_en_last_bit : i1
        %140 = comb.or %42, %139 : i1
        fsm.update %cmd_wr_en_last_bit, %140 : i1
        %141 = comb.and %109, %104, %3 : i1
        %142 = comb.and %110, %112, %4 : i1
        %143 = comb.or %142, %141 : i1
        %144 = comb.xor %143, %true_14 : i1
        %145 = comb.and %111, %144 : i1
        %146 = comb.and %96, %144 : i1
        %147 = comb.mux %146, %arg14, %csid_q : i1
        %148 = comb.mux %146, %arg13, %cpol_q : i1
        %149 = comb.mux %146, %arg12, %cpha_q : i1
        %150 = comb.mux %146, %arg11, %full_cyc_q : i1
        %151 = comb.mux %146, %arg8, %csnidle_q : i4
        %152 = comb.mux %146, %arg9, %csnlead_q : i4
        %153 = comb.mux %146, %arg10, %csntrail_q : i4
        %154 = comb.mux %146, %arg7, %clkdiv_q : i16
        %155 = comb.mux %146, %arg6, %csaat_q : i1
        %156 = comb.mux %146, %arg3, %cmd_wr_en_q : i1
        %157 = comb.mux %146, %arg4, %cmd_rd_en_q : i1
        %158 = comb.mux %146, %arg2, %cmd_speed_q : i2
        %159 = comb.or %143, %0 : i1
        %160 = comb.mux %159, %clk_cntr_q, %107 : i16
        %161 = comb.and %55, %144 : i1
        %162 = comb.mux bin %161, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %163 = comb.or %143, %15 : i1
        %164 = comb.mux %163, %bit_cntr_q, %132 : i3
        %165 = comb.or %143, %15 : i1
        %166 = comb.mux %165, %byte_cntr_cpha0_q, %133 : i20
        %true_27 = hw.constant true
        %167 = comb.xor %96, %true_27 : i1
        %168 = comb.or %143, %167 : i1
        %169 = comb.mux %168, %byte_cntr_cpha1_q, %arg5 : i20
        %true_28 = hw.constant true
        %170 = comb.xor %5, %true_28 : i1
        %171 = comb.or %143, %170 : i1
        %172 = comb.mux %171, %wait_cntr_q, %136 : i4
        %173 = comb.or %109, %145 : i1
        %174 = comb.and %5, %144 : i1
        %175 = comb.mux %174, %173, %sample_en_q : i1
        %176 = comb.mux %174, %sample_en_q, %sample_en_q2 : i1
        %177 = comb.mux bin %143, %u_sck_flop2Fq_o, %137 : i1
        %178 = comb.mux %144, %94, %csb_q : i1
        %179 = comb.or %97, %178 : i1
        fsm.update %_sh1_12, %144 : i1
        fsm.update %csb_q, %179 : i1
        fsm.update %u_sck_flop2Fq_o, %177 : i1
        fsm.update %sample_en_q2, %176 : i1
        fsm.update %sample_en_q, %175 : i1
        fsm.update %wait_cntr_q, %172 : i4
        fsm.update %byte_cntr_cpha1_q, %169 : i20
        fsm.update %byte_cntr_cpha0_q, %166 : i20
        fsm.update %bit_cntr_q, %164 : i3
        fsm.update %segment_rd_en_cpha1, %162 : i1
        fsm.update %clk_cntr_q, %160 : i16
        fsm.update %cmd_speed_q, %158 : i2
        fsm.update %cmd_wr_en_q, %156 : i1
        fsm.update %cmd_rd_en_q, %157 : i1
        fsm.update %csaat_q, %155 : i1
        fsm.update %clkdiv_q, %154 : i16
        fsm.update %csntrail_q, %153 : i4
        fsm.update %csnlead_q, %152 : i4
        fsm.update %csnidle_q, %151 : i4
        fsm.update %full_cyc_q, %150 : i1
        fsm.update %cpha_q, %149 : i1
        fsm.update %cpol_q, %148 : i1
        fsm.update %csid_q, %147 : i1
      }
    }
    fsm.state @state_2 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i16 = hw.constant 0 : i16
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-1_i3 = hw.constant -1 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c-4_i3 = hw.constant -4 : i3
      %c3_i3 = hw.constant 3 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %c-1_i20 = hw.constant -1 : i20
      %true = hw.constant true
      %true_13 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %2 = comb.xor %arg17, %true : i1
      %3 = comb.and %arg1, %0 : i1
      %4 = comb.concat %c1_i2, %cpha_q : i2, i1
      %5 = comb.xor %arg15, %true : i1
      %6 = comb.mux %5, %c-1_i3, %c-4_i3 : i3
      %7 = comb.icmp eq %arg14, %csid_q : i1
      %8 = comb.and %7, %arg15 : i1
      %9 = comb.mux %8, %4, %6 : i3
      %10 = comb.or %8, %5 : i1
      %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %12 = comb.xor %cpha_q, %true : i1
      %13 = comb.xor %csaat_q, %true : i1
      %14 = comb.mux %11, %c1_i3, %c-2_i3 : i3
      %15 = comb.xor %arg18, %true : i1
      %16 = comb.and %3, %15 : i1
      %17 = comb.mux %13, %c-4_i3, %9 : i3
      %18 = comb.xor %3, %true : i1
      %19 = comb.and %15, %18 : i1
      %20 = comb.xor %19, %true : i1
      %c2_i3 = hw.constant 2 : i3
      %21 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
      %22 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
      %23 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
      %24 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
      %25 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %26 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %27 = comb.concat %c0_i3, %26 : i3, i1
      %28 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %29 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %30 = comb.concat %c0_i2, %29 : i2, i2
      %31 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %32 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %33 = comb.xor %csb_q, %true : i1
      %34 = comb.xor %25, %true : i1
      %35 = comb.and %34, %33 : i1
      %36 = comb.xor %28, %true : i1
      %37 = comb.and %31, %36, %35 : i1
      %38 = comb.mux %37, %32, %c0_i4 : i4
      %39 = comb.and %28, %35 : i1
      %40 = comb.mux %39, %30, %38 : i4
      %41 = comb.and %25, %33 : i1
      %42 = comb.mux %41, %27, %40 : i4
      %43 = comb.xor %isFirstCycle, %true : i1
      %44 = comb.and %43, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %15 : i1
      %45 = comb.xor %44, %true : i1
      verif.assert %45 : i1
      %46 = comb.xor %21, %true : i1
      %47 = comb.icmp ne %23, %c0_i20 : i20
      %48 = comb.or %46, %47, %12 : i1
      %49 = comb.xor %48, %true : i1
      %50 = comb.and %49, %16 : i1
      %51 = comb.mux %50, %17, %14 : i3
      %52 = comb.and %16, %48 : i1
      %53 = comb.mux %52, %c3_i3, %51 : i3
      %54 = comb.xor %52, %true : i1
      %55 = comb.mux %arg18, %c0_i3, %53 : i3
      %56 = comb.mux %19, %c2_i3, %55 : i3
      %57 = comb.and %20, %54, %50, %csaat_q, %10 : i1
      %58 = comb.icmp ne %56, %c2_i3 : i3
      %59 = comb.and %15, %58 : i1
      %true_14 = hw.constant true
      %60 = comb.xor %50, %true_14 : i1
      %true_15 = hw.constant true
      %61 = comb.xor %52, %true_15 : i1
      %true_16 = hw.constant true
      %62 = comb.xor %arg18, %true_16 : i1
      %true_17 = hw.constant true
      %63 = comb.xor %19, %true_17 : i1
      %64 = comb.and %63, %62, %61, %60, %11 : i1
      %true_18 = hw.constant true
      %65 = comb.xor %cpha_q, %true_18 : i1
      %true_19 = hw.constant true
      %66 = comb.xor %52, %true_19 : i1
      %true_20 = hw.constant true
      %67 = comb.xor %arg18, %true_20 : i1
      %68 = comb.and %67, %66, %50, %csaat_q, %8, %65 : i1
      %69 = comb.or %19, %68 : i1
      %70 = comb.and %69, %21 : i1
      %71 = comb.or %64, %70 : i1
      %72 = comb.and %59, %71 : i1
      %73 = comb.and %59, %69, %22 : i1
      %74 = comb.and %50, %csaat_q, %8, %cpha_q : i1
      %75 = comb.or %52, %74 : i1
      %true_21 = hw.constant true
      %76 = comb.xor %arg18, %true_21 : i1
      %true_22 = hw.constant true
      %77 = comb.xor %19, %true_22 : i1
      %78 = comb.and %77, %76, %75 : i1
      %79 = comb.and %59, %78, %21 : i1
      %80 = comb.and %59, %78, %22 : i1
      %81 = comb.and %59, %21 : i1
      %82 = comb.and %arg15, %57 : i1
      %83 = comb.mux %82, %arg12, %cpha_q : i1
      %84 = comb.mux %82, %arg11, %full_cyc_q : i1
      %85 = comb.mux %82, %arg3, %cmd_wr_en_q : i1
      %86 = comb.xor %83, %true : i1
      %87 = comb.mux %86, %72, %79 : i1
      %88 = comb.mux %86, %73, %80 : i1
      %89 = comb.mux %86, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
      %90 = comb.and %87, %85 : i1
      %91 = comb.and %83, %81, %89 : i1
      %92 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %93 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %94 = comb.mux %86, %92, %93 : i1
      %95 = comb.mux %84, %sample_en_q2, %sample_en_q : i1
      %96 = comb.and %90, %1 : i1
      %97 = comb.and %91, %2 : i1
      %98 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %99 = comb.icmp eq %arg5, %c0_i20 : i20
      %100 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %101 = comb.mux %82, %99, %100 : i1
      %102 = comb.mux %18, %98, %101 : i1
      %103 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %104 = comb.icmp eq %arg5, %c0_i20 : i20
      %105 = comb.icmp eq %24, %c0_i20 : i20
      %106 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %107 = comb.mux %81, %105, %106 : i1
      %108 = comb.mux %82, %104, %107 : i1
      %109 = comb.mux %18, %103, %108 : i1
      %110 = comb.mux %86, %102, %109 : i1
      %111 = comb.or %arg18, %110 : i1
      %112 = comb.or %97, %96 : i1
      %113 = comb.xor %112, %true : i1
      %114 = comb.and %90, %113 : i1
      %115 = comb.and %91, %113 : i1
      %116 = comb.and %95, %113 : i1
      %117 = comb.and %88, %113 : i1
      %118 = comb.and %57, %113 : i1
      %119 = comb.and %94, %115, %arg17 : i1
      %120 = comb.and %111, %114, %arg16 : i1
      fsm.output %118, %u_sck_flop2Fq_o, %csb_q, %42, %119, %120, %114, %115, %116, %117, %cmd_speed_q, %84, %97, %96, %true_13 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_7 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %cpha_q, %true : i1
        %12 = comb.xor %csaat_q, %true : i1
        %13 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %15 = comb.mux %12, %c-4_i3, %8 : i3
        %c2_i3 = hw.constant 2 : i3
        %16 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %17 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %18 = comb.xor %isFirstCycle, %true : i1
        %19 = comb.and %18, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %arg1, %0 : i1
        %22 = comb.xor %16, %true : i1
        %23 = comb.icmp ne %17, %c0_i20 : i20
        %24 = comb.or %22, %23, %11 : i1
        %25 = comb.and %21, %14 : i1
        %26 = comb.xor %24, %true : i1
        %27 = comb.and %26, %25 : i1
        %28 = comb.mux %27, %15, %13 : i3
        %29 = comb.and %25, %24 : i1
        %30 = comb.mux %29, %c3_i3, %28 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.mux %arg18, %c0_i3, %30 : i3
        %33 = comb.xor %21, %true : i1
        %34 = comb.and %14, %33 : i1
        %35 = comb.mux %34, %c2_i3, %32 : i3
        %36 = comb.xor %34, %true : i1
        %37 = comb.icmp ne %35, %c2_i3 : i3
        %38 = comb.and %14, %37 : i1
        %true_13 = hw.constant true
        %39 = comb.xor %27, %true_13 : i1
        %true_14 = hw.constant true
        %40 = comb.xor %29, %true_14 : i1
        %true_15 = hw.constant true
        %41 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %42 = comb.xor %34, %true_16 : i1
        %43 = comb.and %42, %41, %40, %39, %10 : i1
        %true_17 = hw.constant true
        %44 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %29, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %arg18, %true_19 : i1
        %47 = comb.and %46, %45, %27, %csaat_q, %7, %44 : i1
        %48 = comb.or %34, %47 : i1
        %49 = comb.and %48, %16 : i1
        %50 = comb.or %43, %49 : i1
        %51 = comb.and %38, %50 : i1
        %52 = comb.and %27, %csaat_q, %7, %cpha_q : i1
        %53 = comb.or %29, %52 : i1
        %true_20 = hw.constant true
        %54 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %55 = comb.xor %34, %true_21 : i1
        %56 = comb.and %38, %55, %54, %53, %16 : i1
        verif.assert %20 : i1
        %57 = comb.and %arg15, %36, %31, %27, %csaat_q, %9 : i1
        %58 = comb.mux %57, %arg12, %cpha_q : i1
        %59 = comb.mux %57, %arg3, %cmd_wr_en_q : i1
        %60 = comb.xor %58, %true : i1
        %61 = comb.mux %60, %51, %56 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.and %61, %59, %1 : i1
        %64 = comb.and %58, %38, %16, %62, %2 : i1
        %65 = comb.or %64, %63, %34 : i1
        %66 = comb.extract %5 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %67 = comb.icmp eq %66, %c-1_i2 : i2
        %true_22 = hw.constant true
        %68 = comb.xor %7, %true_22 : i1
        %true_23 = hw.constant true
        %69 = comb.xor %29, %true_23 : i1
        %true_24 = hw.constant true
        %70 = comb.xor %arg18, %true_24 : i1
        %true_25 = hw.constant true
        %71 = comb.xor %65, %true_25 : i1
        %72 = comb.and %71, %70, %69, %27, %csaat_q, %68, %67 : i1
        fsm.return %72
      } action {
        %true = hw.constant true
        %true_13 = hw.constant true
        %false_14 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i20 = hw.constant -1 : i20
        %true_15 = hw.constant true
        %0 = comb.xor %arg17, %true_15 : i1
        %1 = comb.xor %arg15, %true_15 : i1
        %false_16 = hw.constant false
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %4 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %5 = comb.and %cmd_wr_en_q, %3 : i1
        %6 = comb.xor %isFirstCycle, %true_15 : i1
        %7 = comb.and %6, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %8 = comb.xor %7, %true_15 : i1
        verif.assert %8 : i1
        fsm.update %_sh1_10, %true : i1
        fsm.update %_sh1_8, %1 : i1
        fsm.update %_sh1_6, %2 : i1
        fsm.update %_sh1, %false_16 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        %9 = comb.xor %cpha_q, %true_15 : i1
        %10 = comb.and %cpha_q, %3 : i1
        %11 = comb.mux %9, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %12 = comb.mux %arg15, %csntrail_q, %c0_i4 : i4
        %13 = comb.xor %10, %true_15 : i1
        %14 = comb.and %13, %cmd_wr_en_last_bit : i1
        %15 = comb.or %5, %14 : i1
        fsm.update %cmd_wr_en_last_bit, %15 : i1
        %16 = comb.and %10, %11, %0 : i1
        %17 = comb.xor %16, %true_15 : i1
        %18 = comb.mux %16, %clk_cntr_q, %clkdiv_q : i16
        %19 = comb.mux bin %16, %segment_rd_en_cpha1, %cmd_rd_en_q : i1
        %true_17 = hw.constant true
        %20 = comb.xor %3, %true_17 : i1
        %21 = comb.or %16, %20 : i1
        %22 = comb.mux %21, %byte_cntr_cpha1_q, %4 : i20
        %23 = comb.mux %16, %wait_cntr_q, %12 : i4
        %24 = comb.and %16, %sample_en_q : i1
        %25 = comb.mux %17, %sample_en_q, %sample_en_q2 : i1
        %26 = comb.mux bin %16, %u_sck_flop2Fq_o, %cpol_q : i1
        %27 = comb.and %16, %csb_q : i1
        %28 = comb.or %csid_q, %27 : i1
        fsm.update %_sh1_12, %17 : i1
        fsm.update %csb_q, %28 : i1
        fsm.update %u_sck_flop2Fq_o, %26 : i1
        fsm.update %sample_en_q2, %25 : i1
        fsm.update %sample_en_q, %24 : i1
        fsm.update %wait_cntr_q, %23 : i4
        fsm.update %byte_cntr_cpha1_q, %22 : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %bit_cntr_q : i3
        fsm.update %segment_rd_en_cpha1, %19 : i1
        fsm.update %clk_cntr_q, %18 : i16
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %true_13, %true_13 : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
      }
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %cpha_q, %true : i1
        %12 = comb.xor %csaat_q, %true : i1
        %13 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %15 = comb.mux %12, %c-4_i3, %8 : i3
        %c2_i3 = hw.constant 2 : i3
        %16 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %17 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %18 = comb.xor %isFirstCycle, %true : i1
        %19 = comb.and %18, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %arg1, %0 : i1
        %22 = comb.xor %16, %true : i1
        %23 = comb.icmp ne %17, %c0_i20 : i20
        %24 = comb.or %22, %23, %11 : i1
        %25 = comb.and %21, %14 : i1
        %26 = comb.xor %24, %true : i1
        %27 = comb.and %26, %25 : i1
        %28 = comb.mux %27, %15, %13 : i3
        %29 = comb.and %25, %24 : i1
        %30 = comb.mux %29, %c3_i3, %28 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.mux %arg18, %c0_i3, %30 : i3
        %33 = comb.xor %21, %true : i1
        %34 = comb.and %14, %33 : i1
        %35 = comb.mux %34, %c2_i3, %32 : i3
        %36 = comb.xor %34, %true : i1
        %37 = comb.icmp ne %35, %c2_i3 : i3
        %38 = comb.and %14, %37 : i1
        %true_13 = hw.constant true
        %39 = comb.xor %27, %true_13 : i1
        %true_14 = hw.constant true
        %40 = comb.xor %29, %true_14 : i1
        %true_15 = hw.constant true
        %41 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %42 = comb.xor %34, %true_16 : i1
        %43 = comb.and %42, %41, %40, %39, %10 : i1
        %true_17 = hw.constant true
        %44 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %29, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %arg18, %true_19 : i1
        %47 = comb.and %46, %45, %27, %csaat_q, %7, %44 : i1
        %48 = comb.or %34, %47 : i1
        %49 = comb.and %48, %16 : i1
        %50 = comb.or %43, %49 : i1
        %51 = comb.and %38, %50 : i1
        %52 = comb.and %27, %csaat_q, %7, %cpha_q : i1
        %53 = comb.or %29, %52 : i1
        %true_20 = hw.constant true
        %54 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %55 = comb.xor %34, %true_21 : i1
        %56 = comb.and %38, %55, %54, %53, %16 : i1
        verif.assert %20 : i1
        %57 = comb.and %arg15, %36, %31, %27, %csaat_q, %9 : i1
        %58 = comb.mux %57, %arg12, %cpha_q : i1
        %59 = comb.mux %57, %arg3, %cmd_wr_en_q : i1
        %60 = comb.xor %58, %true : i1
        %61 = comb.mux %60, %51, %56 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.and %61, %59, %1 : i1
        %64 = comb.and %58, %38, %16, %62, %2 : i1
        %65 = comb.or %64, %63, %34 : i1
        %66 = comb.extract %5 from 0 : (i3) -> i2
        %c-2_i2 = hw.constant -2 : i2
        %67 = comb.icmp eq %66, %c-2_i2 : i2
        %true_22 = hw.constant true
        %68 = comb.xor %7, %true_22 : i1
        %69 = comb.and %csaat_q, %68, %67 : i1
        %true_23 = hw.constant true
        %70 = comb.xor %10, %true_23 : i1
        %71 = comb.mux %27, %69, %70 : i1
        %true_24 = hw.constant true
        %72 = comb.xor %29, %true_24 : i1
        %true_25 = hw.constant true
        %73 = comb.xor %arg18, %true_25 : i1
        %true_26 = hw.constant true
        %74 = comb.xor %65, %true_26 : i1
        %75 = comb.and %74, %73, %72, %71 : i1
        fsm.return %75
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true : i1
        %4 = comb.xor %arg17, %true : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_14 = hw.constant false
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %cpha_q, %true : i1
        %15 = comb.xor %csaat_q, %true : i1
        %16 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %17 = comb.mux %15, %c-4_i3, %11 : i3
        %18 = comb.xor %5, %true : i1
        %c2_i3_15 = hw.constant 2 : i3
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %19 = comb.xor %cpha_q, %true_18 : i1
        %true_19 = hw.constant true
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %22 = comb.icmp eq %arg2, %c0_i2 : i2
        %23 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %24 = comb.icmp eq %arg2, %c1_i2 : i2
        %25 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %26 = comb.icmp eq %arg2, %c-2_i2 : i2
        %27 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %28 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %29 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %30 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_20 = hw.constant 0 : i2
        %31 = comb.icmp eq %30, %c0_i2_20 : i2
        %true_21 = hw.constant true
        %32 = comb.xor %10, %true_21 : i1
        %33 = comb.and %32, %31 : i1
        %34 = comb.or %15, %33 : i1
        %true_22 = hw.constant true
        %35 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_23 = hw.constant 1 : i2
        %36 = comb.icmp eq %35, %c1_i2_23 : i2
        %true_24 = hw.constant true
        %37 = comb.xor %10, %true_24 : i1
        %true_25 = hw.constant true
        %38 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_26 = hw.constant -2 : i2
        %39 = comb.icmp eq %38, %c-2_i2_26 : i2
        %true_27 = hw.constant true
        %40 = comb.xor %10, %true_27 : i1
        %41 = comb.and %csaat_q, %40, %39 : i1
        %true_28 = hw.constant true
        %42 = comb.xor %13, %true_28 : i1
        %true_29 = hw.constant true
        %43 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %44 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %45 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %46 = comb.icmp eq %45, %c-1_i2 : i2
        %true_30 = hw.constant true
        %47 = comb.xor %10, %true_30 : i1
        %true_31 = hw.constant true
        %48 = comb.and %cmd_wr_en_q, %20 : i1
        %49 = comb.xor %isFirstCycle, %true : i1
        %50 = comb.and %49, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %51 = comb.xor %50, %true : i1
        verif.assert %51 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %13 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %52 = comb.xor %20, %true : i1
        %53 = comb.icmp ne %28, %c0_i20 : i20
        %54 = comb.or %52, %53, %14 : i1
        %55 = comb.xor %54, %true : i1
        %56 = comb.and %55, %5 : i1
        %57 = comb.mux %56, %17, %16 : i3
        %58 = comb.and %5, %54 : i1
        %59 = comb.mux %58, %c3_i3, %57 : i3
        %60 = comb.xor %58, %true : i1
        %61 = comb.mux %18, %c2_i3_15, %59 : i3
        %62 = comb.icmp ne %61, %c2_i3_15 : i3
        %63 = comb.xor %56, %true_16 : i1
        %64 = comb.xor %58, %true_17 : i1
        %65 = comb.and %5, %64, %63, %13 : i1
        %66 = comb.xor %58, %true_19 : i1
        %67 = comb.and %66, %56, %csaat_q, %10, %19 : i1
        %68 = comb.or %18, %67 : i1
        %69 = comb.and %68, %20 : i1
        %70 = comb.or %65, %69 : i1
        %71 = comb.and %62, %70 : i1
        %72 = comb.and %62, %68, %21 : i1
        %73 = comb.and %56, %csaat_q, %10, %cpha_q : i1
        %74 = comb.or %58, %73 : i1
        %75 = comb.and %5, %74 : i1
        %76 = comb.and %62, %75, %20 : i1
        %77 = comb.and %62, %75, %21 : i1
        %78 = comb.and %62, %20 : i1
        %79 = comb.mux %78, %29, %byte_cntr_cpha1_q : i20
        %80 = comb.xor %58, %true_22 : i1
        %81 = comb.and %80, %56, %34 : i1
        %82 = comb.xor %58, %true_25 : i1
        %83 = comb.and %82, %56, %csaat_q, %37, %36 : i1
        %84 = comb.mux %56, %41, %42 : i1
        %85 = comb.xor %58, %true_29 : i1
        %86 = comb.and %62, %5 : i1
        %87 = comb.xor %65, %true : i1
        %88 = comb.and %87, %86 : i1
        %89 = comb.xor %81, %true : i1
        %90 = comb.and %89, %88 : i1
        %91 = comb.xor %83, %true : i1
        %92 = comb.and %91, %90, %85, %84 : i1
        %93 = comb.and %90, %83 : i1
        %94 = comb.or %93, %92 : i1
        %95 = comb.and %88, %81 : i1
        %96 = comb.and %86, %65 : i1
        %97 = comb.xor %62, %true : i1
        %98 = comb.and %44, %97, %5 : i1
        %99 = comb.xor %58, %true_31 : i1
        %100 = comb.icmp ne %61, %c-4_i3 : i3
        %101 = comb.xor %68, %true : i1
        %102 = comb.and %101, %87 : i1
        %103 = comb.xor %75, %true : i1
        %104 = comb.and %103, %102, %99, %56, %csaat_q, %47, %46 : i1
        %105 = comb.xor %104, %true : i1
        %106 = comb.and %102, %75 : i1
        %107 = comb.xor %106, %true : i1
        %108 = comb.and %87, %68 : i1
        %109 = comb.xor %108, %true : i1
        %110 = comb.and %87, %109, %107, %105, %100 : i1
        %111 = comb.icmp ne %61, %c3_i3 : i3
        %112 = comb.and %arg15, %60, %56, %csaat_q, %12 : i1
        %113 = comb.mux %112, %arg14, %csid_q : i1
        %114 = comb.mux %112, %arg13, %cpol_q : i1
        %115 = comb.mux %112, %arg12, %cpha_q : i1
        %116 = comb.mux %112, %arg8, %csnidle_q : i4
        %117 = comb.mux %112, %arg9, %csnlead_q : i4
        %118 = comb.mux %112, %arg10, %csntrail_q : i4
        %119 = comb.mux %112, %arg7, %clkdiv_q : i16
        %120 = comb.mux %112, %arg3, %cmd_wr_en_q : i1
        %121 = comb.mux %112, %arg4, %cmd_rd_en_q : i1
        %122 = comb.mux %1, %119, %2 : i16
        %123 = comb.mux %112, %arg7, %122 : i16
        %124 = comb.xor %115, %true : i1
        %125 = comb.mux %124, %71, %76 : i1
        %126 = comb.and %115, %78 : i1
        %127 = comb.mux %124, %72, %77 : i1
        %128 = comb.mux %124, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %129 = comb.xor %121, %true : i1
        %130 = comb.xor %120, %true : i1
        %131 = comb.and %129, %130 : i1
        %132 = comb.mux %112, %22, %23 : i1
        %133 = comb.mux %112, %24, %25 : i1
        %134 = comb.mux %112, %26, %27 : i1
        %135 = comb.mux %134, %c-4_i3, %c1_i3 : i3
        %136 = comb.xor %131, %true : i1
        %137 = comb.xor %132, %true : i1
        %138 = comb.and %137, %136, %133 : i1
        %139 = comb.mux %138, %c2_i3, %135 : i3
        %140 = comb.mux %138, %c-2_i3, %135 : i3
        %141 = comb.and %136, %132 : i1
        %142 = comb.mux %141, %c1_i3, %139 : i3
        %143 = comb.mux %141, %c-1_i3, %140 : i3
        %144 = comb.mux %131, %c0_i3, %142 : i3
        %145 = comb.mux %131, %c0_i3, %143 : i3
        %146 = comb.sub %bit_cntr_q, %144 : i3
        %147 = comb.mux %127, %146, %bit_cntr_q : i3
        %148 = comb.mux %125, %145, %147 : i3
        %149 = comb.mux %112, %arg5, %79 : i20
        %150 = comb.mux %94, %116, %c0_i4 : i4
        %151 = comb.mux %95, %118, %150 : i4
        %152 = comb.mux %96, %117, %151 : i4
        %153 = comb.mux %5, %152, %wait_cntr_q : i4
        %154 = comb.mux %98, %43, %153 : i4
        %155 = comb.mux %114, %111, %75 : i1
        %156 = comb.xor %126, %true : i1
        %157 = comb.and %156, %cmd_wr_en_last_bit : i1
        %158 = comb.or %48, %157 : i1
        fsm.update %cmd_wr_en_last_bit, %158 : i1
        %159 = comb.and %125, %120, %3 : i1
        %160 = comb.and %126, %128, %4 : i1
        %161 = comb.or %160, %159 : i1
        %162 = comb.xor %161, %true : i1
        %163 = comb.and %127, %162 : i1
        %164 = comb.and %112, %162 : i1
        %165 = comb.mux %164, %arg14, %csid_q : i1
        %166 = comb.mux %164, %arg13, %cpol_q : i1
        %167 = comb.mux %164, %arg12, %cpha_q : i1
        %168 = comb.mux %164, %arg11, %full_cyc_q : i1
        %169 = comb.mux %164, %arg8, %csnidle_q : i4
        %170 = comb.mux %164, %arg9, %csnlead_q : i4
        %171 = comb.mux %164, %arg10, %csntrail_q : i4
        %172 = comb.mux %164, %arg7, %clkdiv_q : i16
        %173 = comb.mux %164, %arg6, %csaat_q : i1
        %174 = comb.mux %164, %arg3, %cmd_wr_en_q : i1
        %175 = comb.mux %164, %arg4, %cmd_rd_en_q : i1
        %176 = comb.mux %164, %arg2, %cmd_speed_q : i2
        %177 = comb.or %161, %0 : i1
        %178 = comb.mux %177, %clk_cntr_q, %123 : i16
        %179 = comb.and %62, %162 : i1
        %180 = comb.mux bin %179, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %181 = comb.or %161, %18 : i1
        %182 = comb.mux %181, %bit_cntr_q, %148 : i3
        %true_32 = hw.constant true
        %183 = comb.xor %112, %true_32 : i1
        %184 = comb.or %161, %183 : i1
        %185 = comb.mux %184, %byte_cntr_cpha0_q, %arg5 : i20
        %186 = comb.or %161, %18 : i1
        %187 = comb.mux %186, %byte_cntr_cpha1_q, %149 : i20
        %188 = comb.mux %161, %wait_cntr_q, %154 : i4
        %189 = comb.or %125, %163 : i1
        %190 = comb.and %5, %162 : i1
        %191 = comb.mux %190, %189, %sample_en_q : i1
        %192 = comb.mux %190, %sample_en_q, %sample_en_q2 : i1
        %193 = comb.mux bin %161, %u_sck_flop2Fq_o, %155 : i1
        %194 = comb.mux %162, %110, %csb_q : i1
        %195 = comb.or %113, %194 : i1
        fsm.update %_sh1_12, %162 : i1
        fsm.update %csb_q, %195 : i1
        fsm.update %u_sck_flop2Fq_o, %193 : i1
        fsm.update %sample_en_q2, %192 : i1
        fsm.update %sample_en_q, %191 : i1
        fsm.update %wait_cntr_q, %188 : i4
        fsm.update %byte_cntr_cpha1_q, %187 : i20
        fsm.update %byte_cntr_cpha0_q, %185 : i20
        fsm.update %bit_cntr_q, %182 : i3
        fsm.update %segment_rd_en_cpha1, %180 : i1
        fsm.update %clk_cntr_q, %178 : i16
        fsm.update %cmd_speed_q, %176 : i2
        fsm.update %cmd_wr_en_q, %174 : i1
        fsm.update %cmd_rd_en_q, %175 : i1
        fsm.update %csaat_q, %173 : i1
        fsm.update %clkdiv_q, %172 : i16
        fsm.update %csntrail_q, %171 : i4
        fsm.update %csnlead_q, %170 : i4
        fsm.update %csnidle_q, %169 : i4
        fsm.update %full_cyc_q, %168 : i1
        fsm.update %cpha_q, %167 : i1
        fsm.update %cpol_q, %166 : i1
        fsm.update %csid_q, %165 : i1
      }
      fsm.transition @state_3 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %cpha_q, %true : i1
        %12 = comb.xor %csaat_q, %true : i1
        %13 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %15 = comb.mux %12, %c-4_i3, %8 : i3
        %c2_i3 = hw.constant 2 : i3
        %16 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %17 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %18 = comb.xor %isFirstCycle, %true : i1
        %19 = comb.and %18, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %arg1, %0 : i1
        %22 = comb.xor %16, %true : i1
        %23 = comb.icmp ne %17, %c0_i20 : i20
        %24 = comb.or %22, %23, %11 : i1
        %25 = comb.and %21, %14 : i1
        %26 = comb.xor %24, %true : i1
        %27 = comb.and %26, %25 : i1
        %28 = comb.mux %27, %15, %13 : i3
        %29 = comb.and %25, %24 : i1
        %30 = comb.mux %29, %c3_i3, %28 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.mux %arg18, %c0_i3, %30 : i3
        %33 = comb.xor %21, %true : i1
        %34 = comb.and %14, %33 : i1
        %35 = comb.mux %34, %c2_i3, %32 : i3
        %36 = comb.xor %34, %true : i1
        %37 = comb.icmp ne %35, %c2_i3 : i3
        %38 = comb.and %14, %37 : i1
        %true_13 = hw.constant true
        %39 = comb.xor %27, %true_13 : i1
        %true_14 = hw.constant true
        %40 = comb.xor %29, %true_14 : i1
        %true_15 = hw.constant true
        %41 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %42 = comb.xor %34, %true_16 : i1
        %43 = comb.and %42, %41, %40, %39, %10 : i1
        %true_17 = hw.constant true
        %44 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %29, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %arg18, %true_19 : i1
        %47 = comb.and %46, %45, %27, %csaat_q, %7, %44 : i1
        %48 = comb.or %34, %47 : i1
        %49 = comb.and %48, %16 : i1
        %50 = comb.or %43, %49 : i1
        %51 = comb.and %38, %50 : i1
        %52 = comb.and %27, %csaat_q, %7, %cpha_q : i1
        %53 = comb.or %29, %52 : i1
        %true_20 = hw.constant true
        %54 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %55 = comb.xor %34, %true_21 : i1
        %56 = comb.and %38, %55, %54, %53, %16 : i1
        verif.assert %20 : i1
        %57 = comb.and %arg15, %36, %31, %27, %csaat_q, %9 : i1
        %58 = comb.mux %57, %arg12, %cpha_q : i1
        %59 = comb.mux %57, %arg3, %cmd_wr_en_q : i1
        %60 = comb.xor %58, %true : i1
        %61 = comb.mux %60, %51, %56 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.and %61, %59, %1 : i1
        %64 = comb.and %58, %38, %16, %62, %2 : i1
        %65 = comb.or %64, %63, %34 : i1
        %66 = comb.and %27, %csaat_q, %7, %cpha_q : i1
        %67 = comb.or %29, %66 : i1
        %true_22 = hw.constant true
        %68 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %69 = comb.xor %65, %true_23 : i1
        %70 = comb.and %69, %68, %67 : i1
        fsm.return %70
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true : i1
        %4 = comb.xor %arg17, %true : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_14 = hw.constant false
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %cpha_q, %true : i1
        %15 = comb.xor %csaat_q, %true : i1
        %16 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %17 = comb.mux %15, %c-4_i3, %11 : i3
        %18 = comb.xor %5, %true : i1
        %c2_i3_15 = hw.constant 2 : i3
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %19 = comb.xor %cpha_q, %true_18 : i1
        %true_19 = hw.constant true
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %22 = comb.icmp eq %arg2, %c0_i2 : i2
        %23 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %24 = comb.icmp eq %arg2, %c1_i2 : i2
        %25 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %26 = comb.icmp eq %arg2, %c-2_i2 : i2
        %27 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %28 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %29 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %30 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_20 = hw.constant 0 : i2
        %31 = comb.icmp eq %30, %c0_i2_20 : i2
        %true_21 = hw.constant true
        %32 = comb.xor %10, %true_21 : i1
        %33 = comb.and %32, %31 : i1
        %34 = comb.or %15, %33 : i1
        %true_22 = hw.constant true
        %35 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_23 = hw.constant 1 : i2
        %36 = comb.icmp eq %35, %c1_i2_23 : i2
        %true_24 = hw.constant true
        %37 = comb.xor %10, %true_24 : i1
        %true_25 = hw.constant true
        %38 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_26 = hw.constant -2 : i2
        %39 = comb.icmp eq %38, %c-2_i2_26 : i2
        %true_27 = hw.constant true
        %40 = comb.xor %10, %true_27 : i1
        %41 = comb.and %csaat_q, %40, %39 : i1
        %true_28 = hw.constant true
        %42 = comb.xor %13, %true_28 : i1
        %true_29 = hw.constant true
        %43 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %44 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %45 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %46 = comb.icmp eq %45, %c-1_i2 : i2
        %true_30 = hw.constant true
        %47 = comb.xor %10, %true_30 : i1
        %true_31 = hw.constant true
        %48 = comb.and %cmd_wr_en_q, %20 : i1
        %49 = comb.xor %isFirstCycle, %true : i1
        %50 = comb.and %49, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %51 = comb.xor %50, %true : i1
        verif.assert %51 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %13 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %52 = comb.xor %20, %true : i1
        %53 = comb.icmp ne %28, %c0_i20 : i20
        %54 = comb.or %52, %53, %14 : i1
        %55 = comb.xor %54, %true : i1
        %56 = comb.and %55, %5 : i1
        %57 = comb.mux %56, %17, %16 : i3
        %58 = comb.and %5, %54 : i1
        %59 = comb.mux %58, %c3_i3, %57 : i3
        %60 = comb.xor %58, %true : i1
        %61 = comb.mux %18, %c2_i3_15, %59 : i3
        %62 = comb.icmp ne %61, %c2_i3_15 : i3
        %63 = comb.xor %56, %true_16 : i1
        %64 = comb.xor %58, %true_17 : i1
        %65 = comb.and %5, %64, %63, %13 : i1
        %66 = comb.xor %58, %true_19 : i1
        %67 = comb.and %66, %56, %csaat_q, %10, %19 : i1
        %68 = comb.or %18, %67 : i1
        %69 = comb.and %68, %20 : i1
        %70 = comb.or %65, %69 : i1
        %71 = comb.and %62, %70 : i1
        %72 = comb.and %62, %68, %21 : i1
        %73 = comb.and %56, %csaat_q, %10, %cpha_q : i1
        %74 = comb.or %58, %73 : i1
        %75 = comb.and %5, %74 : i1
        %76 = comb.and %62, %75, %20 : i1
        %77 = comb.and %62, %75, %21 : i1
        %78 = comb.and %62, %20 : i1
        %79 = comb.mux %78, %29, %byte_cntr_cpha1_q : i20
        %80 = comb.xor %58, %true_22 : i1
        %81 = comb.and %80, %56, %34 : i1
        %82 = comb.xor %58, %true_25 : i1
        %83 = comb.and %82, %56, %csaat_q, %37, %36 : i1
        %84 = comb.mux %56, %41, %42 : i1
        %85 = comb.xor %58, %true_29 : i1
        %86 = comb.and %62, %5 : i1
        %87 = comb.xor %65, %true : i1
        %88 = comb.and %87, %86 : i1
        %89 = comb.xor %81, %true : i1
        %90 = comb.and %89, %88 : i1
        %91 = comb.xor %83, %true : i1
        %92 = comb.and %91, %90, %85, %84 : i1
        %93 = comb.and %90, %83 : i1
        %94 = comb.or %93, %92 : i1
        %95 = comb.and %88, %81 : i1
        %96 = comb.and %86, %65 : i1
        %97 = comb.xor %62, %true : i1
        %98 = comb.and %44, %97, %5 : i1
        %99 = comb.xor %58, %true_31 : i1
        %100 = comb.icmp ne %61, %c-4_i3 : i3
        %101 = comb.xor %68, %true : i1
        %102 = comb.and %101, %87 : i1
        %103 = comb.xor %75, %true : i1
        %104 = comb.and %103, %102, %99, %56, %csaat_q, %47, %46 : i1
        %105 = comb.xor %104, %true : i1
        %106 = comb.and %102, %75 : i1
        %107 = comb.xor %106, %true : i1
        %108 = comb.and %87, %68 : i1
        %109 = comb.xor %108, %true : i1
        %110 = comb.and %87, %109, %107, %105, %100 : i1
        %111 = comb.icmp ne %61, %c3_i3 : i3
        %112 = comb.and %arg15, %60, %56, %csaat_q, %12 : i1
        %113 = comb.mux %112, %arg14, %csid_q : i1
        %114 = comb.mux %112, %arg13, %cpol_q : i1
        %115 = comb.mux %112, %arg12, %cpha_q : i1
        %116 = comb.mux %112, %arg8, %csnidle_q : i4
        %117 = comb.mux %112, %arg9, %csnlead_q : i4
        %118 = comb.mux %112, %arg10, %csntrail_q : i4
        %119 = comb.mux %112, %arg7, %clkdiv_q : i16
        %120 = comb.mux %112, %arg3, %cmd_wr_en_q : i1
        %121 = comb.mux %112, %arg4, %cmd_rd_en_q : i1
        %122 = comb.mux %1, %119, %2 : i16
        %123 = comb.mux %112, %arg7, %122 : i16
        %124 = comb.xor %115, %true : i1
        %125 = comb.mux %124, %71, %76 : i1
        %126 = comb.and %115, %78 : i1
        %127 = comb.mux %124, %72, %77 : i1
        %128 = comb.mux %124, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %129 = comb.xor %121, %true : i1
        %130 = comb.xor %120, %true : i1
        %131 = comb.and %129, %130 : i1
        %132 = comb.mux %112, %22, %23 : i1
        %133 = comb.mux %112, %24, %25 : i1
        %134 = comb.mux %112, %26, %27 : i1
        %135 = comb.mux %134, %c-4_i3, %c1_i3 : i3
        %136 = comb.xor %131, %true : i1
        %137 = comb.xor %132, %true : i1
        %138 = comb.and %137, %136, %133 : i1
        %139 = comb.mux %138, %c2_i3, %135 : i3
        %140 = comb.mux %138, %c-2_i3, %135 : i3
        %141 = comb.and %136, %132 : i1
        %142 = comb.mux %141, %c1_i3, %139 : i3
        %143 = comb.mux %141, %c-1_i3, %140 : i3
        %144 = comb.mux %131, %c0_i3, %142 : i3
        %145 = comb.mux %131, %c0_i3, %143 : i3
        %146 = comb.sub %bit_cntr_q, %144 : i3
        %147 = comb.mux %127, %146, %bit_cntr_q : i3
        %148 = comb.mux %125, %145, %147 : i3
        %149 = comb.mux %112, %arg5, %79 : i20
        %150 = comb.mux %94, %116, %c0_i4 : i4
        %151 = comb.mux %95, %118, %150 : i4
        %152 = comb.mux %96, %117, %151 : i4
        %153 = comb.mux %5, %152, %wait_cntr_q : i4
        %154 = comb.mux %98, %43, %153 : i4
        %155 = comb.mux %114, %111, %75 : i1
        %156 = comb.xor %126, %true : i1
        %157 = comb.and %156, %cmd_wr_en_last_bit : i1
        %158 = comb.or %48, %157 : i1
        fsm.update %cmd_wr_en_last_bit, %158 : i1
        %159 = comb.and %125, %120, %3 : i1
        %160 = comb.and %126, %128, %4 : i1
        %161 = comb.or %160, %159 : i1
        %162 = comb.xor %161, %true : i1
        %163 = comb.and %127, %162 : i1
        %164 = comb.and %112, %162 : i1
        %165 = comb.mux %164, %arg14, %csid_q : i1
        %166 = comb.mux %164, %arg13, %cpol_q : i1
        %167 = comb.mux %164, %arg12, %cpha_q : i1
        %168 = comb.mux %164, %arg11, %full_cyc_q : i1
        %169 = comb.mux %164, %arg8, %csnidle_q : i4
        %170 = comb.mux %164, %arg9, %csnlead_q : i4
        %171 = comb.mux %164, %arg10, %csntrail_q : i4
        %172 = comb.mux %164, %arg7, %clkdiv_q : i16
        %173 = comb.mux %164, %arg6, %csaat_q : i1
        %174 = comb.mux %164, %arg3, %cmd_wr_en_q : i1
        %175 = comb.mux %164, %arg4, %cmd_rd_en_q : i1
        %176 = comb.mux %164, %arg2, %cmd_speed_q : i2
        %177 = comb.or %161, %0 : i1
        %178 = comb.mux %177, %clk_cntr_q, %123 : i16
        %179 = comb.and %62, %162 : i1
        %180 = comb.mux bin %179, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %181 = comb.or %161, %18 : i1
        %182 = comb.mux %181, %bit_cntr_q, %148 : i3
        %true_32 = hw.constant true
        %183 = comb.xor %112, %true_32 : i1
        %184 = comb.or %161, %183 : i1
        %185 = comb.mux %184, %byte_cntr_cpha0_q, %arg5 : i20
        %186 = comb.or %161, %18 : i1
        %187 = comb.mux %186, %byte_cntr_cpha1_q, %149 : i20
        %188 = comb.mux %161, %wait_cntr_q, %154 : i4
        %189 = comb.or %125, %163 : i1
        %190 = comb.and %5, %162 : i1
        %191 = comb.mux %190, %189, %sample_en_q : i1
        %192 = comb.mux %190, %sample_en_q, %sample_en_q2 : i1
        %193 = comb.mux bin %161, %u_sck_flop2Fq_o, %155 : i1
        %194 = comb.mux %162, %110, %csb_q : i1
        %195 = comb.or %113, %194 : i1
        fsm.update %_sh1_12, %162 : i1
        fsm.update %csb_q, %195 : i1
        fsm.update %u_sck_flop2Fq_o, %193 : i1
        fsm.update %sample_en_q2, %192 : i1
        fsm.update %sample_en_q, %191 : i1
        fsm.update %wait_cntr_q, %188 : i4
        fsm.update %byte_cntr_cpha1_q, %187 : i20
        fsm.update %byte_cntr_cpha0_q, %185 : i20
        fsm.update %bit_cntr_q, %182 : i3
        fsm.update %segment_rd_en_cpha1, %180 : i1
        fsm.update %clk_cntr_q, %178 : i16
        fsm.update %cmd_speed_q, %176 : i2
        fsm.update %cmd_wr_en_q, %174 : i1
        fsm.update %cmd_rd_en_q, %175 : i1
        fsm.update %csaat_q, %173 : i1
        fsm.update %clkdiv_q, %172 : i16
        fsm.update %csntrail_q, %171 : i4
        fsm.update %csnlead_q, %170 : i4
        fsm.update %csnidle_q, %169 : i4
        fsm.update %full_cyc_q, %168 : i1
        fsm.update %cpha_q, %167 : i1
        fsm.update %cpol_q, %166 : i1
        fsm.update %csid_q, %165 : i1
      }
      fsm.transition @state_2 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %cpha_q, %true : i1
        %12 = comb.xor %csaat_q, %true : i1
        %13 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %15 = comb.mux %12, %c-4_i3, %8 : i3
        %c2_i3 = hw.constant 2 : i3
        %16 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %17 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %18 = comb.xor %isFirstCycle, %true : i1
        %19 = comb.and %18, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %arg1, %0 : i1
        %22 = comb.xor %16, %true : i1
        %23 = comb.icmp ne %17, %c0_i20 : i20
        %24 = comb.or %22, %23, %11 : i1
        %25 = comb.and %21, %14 : i1
        %26 = comb.xor %24, %true : i1
        %27 = comb.and %26, %25 : i1
        %28 = comb.mux %27, %15, %13 : i3
        %29 = comb.and %25, %24 : i1
        %30 = comb.mux %29, %c3_i3, %28 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.mux %arg18, %c0_i3, %30 : i3
        %33 = comb.xor %21, %true : i1
        %34 = comb.and %14, %33 : i1
        %35 = comb.mux %34, %c2_i3, %32 : i3
        %36 = comb.xor %34, %true : i1
        %37 = comb.icmp ne %35, %c2_i3 : i3
        %38 = comb.and %14, %37 : i1
        %true_13 = hw.constant true
        %39 = comb.xor %27, %true_13 : i1
        %true_14 = hw.constant true
        %40 = comb.xor %29, %true_14 : i1
        %true_15 = hw.constant true
        %41 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %42 = comb.xor %34, %true_16 : i1
        %43 = comb.and %42, %41, %40, %39, %10 : i1
        %true_17 = hw.constant true
        %44 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %29, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %arg18, %true_19 : i1
        %47 = comb.and %46, %45, %27, %csaat_q, %7, %44 : i1
        %48 = comb.or %34, %47 : i1
        %49 = comb.and %48, %16 : i1
        %50 = comb.or %43, %49 : i1
        %51 = comb.and %38, %50 : i1
        %52 = comb.and %27, %csaat_q, %7, %cpha_q : i1
        %53 = comb.or %29, %52 : i1
        %true_20 = hw.constant true
        %54 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %55 = comb.xor %34, %true_21 : i1
        %56 = comb.and %38, %55, %54, %53, %16 : i1
        verif.assert %20 : i1
        %57 = comb.and %arg15, %36, %31, %27, %csaat_q, %9 : i1
        %58 = comb.mux %57, %arg12, %cpha_q : i1
        %59 = comb.mux %57, %arg3, %cmd_wr_en_q : i1
        %60 = comb.xor %58, %true : i1
        %61 = comb.mux %60, %51, %56 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.and %61, %59, %1 : i1
        %64 = comb.and %58, %38, %16, %62, %2 : i1
        %true_22 = hw.constant true
        %65 = comb.xor %cpha_q, %true_22 : i1
        %true_23 = hw.constant true
        %66 = comb.xor %29, %true_23 : i1
        %true_24 = hw.constant true
        %67 = comb.xor %arg18, %true_24 : i1
        %68 = comb.and %67, %66, %27, %csaat_q, %7, %65 : i1
        %69 = comb.or %64, %63, %34, %68 : i1
        fsm.return %69
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true : i1
        %4 = comb.xor %arg17, %true : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_14 = hw.constant false
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %cpha_q, %true : i1
        %15 = comb.xor %csaat_q, %true : i1
        %16 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %17 = comb.xor %arg18, %true : i1
        %18 = comb.and %5, %17 : i1
        %19 = comb.mux %15, %c-4_i3, %11 : i3
        %20 = comb.xor %5, %true : i1
        %21 = comb.and %17, %20 : i1
        %22 = comb.xor %21, %true : i1
        %c2_i3_15 = hw.constant 2 : i3
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %23 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %24 = comb.xor %21, %true_19 : i1
        %true_20 = hw.constant true
        %25 = comb.xor %cpha_q, %true_20 : i1
        %true_21 = hw.constant true
        %true_22 = hw.constant true
        %26 = comb.xor %arg18, %true_22 : i1
        %27 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %28 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %true_23 = hw.constant true
        %29 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %30 = comb.xor %21, %true_24 : i1
        %31 = comb.icmp eq %arg2, %c0_i2 : i2
        %32 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %33 = comb.icmp eq %arg2, %c1_i2 : i2
        %34 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %35 = comb.icmp eq %arg2, %c-2_i2 : i2
        %36 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %37 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %38 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %39 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_25 = hw.constant 0 : i2
        %40 = comb.icmp eq %39, %c0_i2_25 : i2
        %true_26 = hw.constant true
        %41 = comb.xor %10, %true_26 : i1
        %42 = comb.and %41, %40 : i1
        %43 = comb.or %15, %42 : i1
        %true_27 = hw.constant true
        %true_28 = hw.constant true
        %44 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %45 = comb.xor %21, %true_29 : i1
        %46 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_30 = hw.constant 1 : i2
        %47 = comb.icmp eq %46, %c1_i2_30 : i2
        %true_31 = hw.constant true
        %48 = comb.xor %10, %true_31 : i1
        %true_32 = hw.constant true
        %true_33 = hw.constant true
        %49 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %50 = comb.xor %21, %true_34 : i1
        %51 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_35 = hw.constant -2 : i2
        %52 = comb.icmp eq %51, %c-2_i2_35 : i2
        %true_36 = hw.constant true
        %53 = comb.xor %10, %true_36 : i1
        %54 = comb.and %csaat_q, %53, %52 : i1
        %true_37 = hw.constant true
        %55 = comb.xor %13, %true_37 : i1
        %true_38 = hw.constant true
        %true_39 = hw.constant true
        %56 = comb.xor %arg18, %true_39 : i1
        %true_40 = hw.constant true
        %57 = comb.xor %21, %true_40 : i1
        %58 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %59 = comb.or %arg18, %5 : i1
        %60 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %61 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %62 = comb.icmp eq %61, %c-1_i2 : i2
        %true_41 = hw.constant true
        %63 = comb.xor %10, %true_41 : i1
        %true_42 = hw.constant true
        %true_43 = hw.constant true
        %64 = comb.xor %arg18, %true_43 : i1
        %true_44 = hw.constant true
        %65 = comb.xor %21, %true_44 : i1
        %66 = comb.and %cmd_wr_en_q, %27 : i1
        %67 = comb.xor %isFirstCycle, %true : i1
        %68 = comb.and %67, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %17 : i1
        %69 = comb.xor %68, %true : i1
        verif.assert %69 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %13 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %70 = comb.xor %27, %true : i1
        %71 = comb.icmp ne %37, %c0_i20 : i20
        %72 = comb.or %70, %71, %14 : i1
        %73 = comb.xor %72, %true : i1
        %74 = comb.and %73, %18 : i1
        %75 = comb.mux %74, %19, %16 : i3
        %76 = comb.and %18, %72 : i1
        %77 = comb.mux %76, %c3_i3, %75 : i3
        %78 = comb.xor %76, %true : i1
        %79 = comb.mux %arg18, %c0_i3, %77 : i3
        %80 = comb.mux %21, %c2_i3_15, %79 : i3
        %81 = comb.icmp ne %80, %c2_i3_15 : i3
        %82 = comb.and %17, %81 : i1
        %83 = comb.xor %74, %true_16 : i1
        %84 = comb.xor %76, %true_17 : i1
        %85 = comb.and %24, %23, %84, %83, %13 : i1
        %86 = comb.xor %76, %true_21 : i1
        %87 = comb.and %26, %86, %74, %csaat_q, %10, %25 : i1
        %88 = comb.or %21, %87 : i1
        %89 = comb.and %88, %27 : i1
        %90 = comb.or %85, %89 : i1
        %91 = comb.and %82, %90 : i1
        %92 = comb.and %82, %88, %28 : i1
        %93 = comb.and %74, %csaat_q, %10, %cpha_q : i1
        %94 = comb.or %76, %93 : i1
        %95 = comb.and %30, %29, %94 : i1
        %96 = comb.and %82, %95, %27 : i1
        %97 = comb.and %82, %95, %28 : i1
        %98 = comb.and %82, %27 : i1
        %99 = comb.mux %98, %38, %byte_cntr_cpha1_q : i20
        %100 = comb.xor %76, %true_27 : i1
        %101 = comb.and %45, %44, %100, %74, %43 : i1
        %102 = comb.xor %76, %true_32 : i1
        %103 = comb.and %50, %49, %102, %74, %csaat_q, %48, %47 : i1
        %104 = comb.mux %74, %54, %55 : i1
        %105 = comb.xor %76, %true_38 : i1
        %106 = comb.and %81, %18 : i1
        %107 = comb.xor %85, %true : i1
        %108 = comb.and %107, %106 : i1
        %109 = comb.xor %101, %true : i1
        %110 = comb.and %109, %108 : i1
        %111 = comb.xor %103, %true : i1
        %112 = comb.and %111, %110, %57, %56, %105, %104 : i1
        %113 = comb.and %110, %103 : i1
        %114 = comb.or %113, %112 : i1
        %115 = comb.and %108, %101 : i1
        %116 = comb.and %106, %85 : i1
        %117 = comb.xor %81, %true : i1
        %118 = comb.and %60, %117, %18 : i1
        %119 = comb.xor %76, %true_42 : i1
        %120 = comb.icmp ne %80, %c-4_i3 : i3
        %121 = comb.xor %88, %true : i1
        %122 = comb.and %121, %107 : i1
        %123 = comb.xor %95, %true : i1
        %124 = comb.and %123, %122, %65, %64, %119, %74, %csaat_q, %63, %62 : i1
        %125 = comb.xor %124, %true : i1
        %126 = comb.and %122, %95 : i1
        %127 = comb.xor %126, %true : i1
        %128 = comb.and %107, %88 : i1
        %129 = comb.xor %128, %true : i1
        %130 = comb.and %107, %129, %127, %125, %120 : i1
        %131 = comb.icmp ne %80, %c3_i3 : i3
        %132 = comb.and %arg15, %22, %78, %74, %csaat_q, %12 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg8, %csnidle_q : i4
        %137 = comb.mux %132, %arg9, %csnlead_q : i4
        %138 = comb.mux %132, %arg10, %csntrail_q : i4
        %139 = comb.mux %132, %arg7, %clkdiv_q : i16
        %140 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %141 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %142 = comb.mux %1, %139, %2 : i16
        %143 = comb.mux %132, %arg7, %142 : i16
        %144 = comb.mux %0, %clk_cntr_q, %143 : i16
        %145 = comb.mux %arg18, %c0_i16, %144 : i16
        %146 = comb.xor %135, %true : i1
        %147 = comb.mux %146, %91, %96 : i1
        %148 = comb.and %135, %98 : i1
        %149 = comb.mux %146, %92, %97 : i1
        %150 = comb.mux %146, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %151 = comb.xor %141, %true : i1
        %152 = comb.xor %140, %true : i1
        %153 = comb.and %151, %152 : i1
        %154 = comb.mux %132, %31, %32 : i1
        %155 = comb.mux %132, %33, %34 : i1
        %156 = comb.mux %132, %35, %36 : i1
        %157 = comb.mux %156, %c-4_i3, %c1_i3 : i3
        %158 = comb.xor %153, %true : i1
        %159 = comb.xor %154, %true : i1
        %160 = comb.and %159, %158, %155 : i1
        %161 = comb.mux %160, %c2_i3, %157 : i3
        %162 = comb.mux %160, %c-2_i3, %157 : i3
        %163 = comb.and %158, %154 : i1
        %164 = comb.mux %163, %c1_i3, %161 : i3
        %165 = comb.mux %163, %c-1_i3, %162 : i3
        %166 = comb.mux %153, %c0_i3, %164 : i3
        %167 = comb.mux %153, %c0_i3, %165 : i3
        %168 = comb.sub %bit_cntr_q, %166 : i3
        %169 = comb.mux %149, %168, %bit_cntr_q : i3
        %170 = comb.mux %147, %167, %169 : i3
        %171 = comb.mux %20, %bit_cntr_q, %170 : i3
        %172 = comb.mux %arg18, %c0_i3, %171 : i3
        %173 = comb.mux %132, %arg5, %byte_cntr_cpha0_q : i20
        %174 = comb.mux %arg18, %c0_i20, %173 : i20
        %175 = comb.mux %132, %arg5, %99 : i20
        %176 = comb.mux %20, %byte_cntr_cpha1_q, %175 : i20
        %177 = comb.mux %arg18, %c0_i20, %176 : i20
        %178 = comb.mux %114, %136, %c0_i4 : i4
        %179 = comb.mux %115, %138, %178 : i4
        %180 = comb.mux %116, %137, %179 : i4
        %181 = comb.mux %59, %180, %wait_cntr_q : i4
        %182 = comb.mux %arg18, %c0_i4, %181 : i4
        %183 = comb.mux %118, %58, %182 : i4
        %184 = comb.mux %134, %131, %95 : i1
        %185 = comb.xor %148, %true : i1
        %186 = comb.and %185, %cmd_wr_en_last_bit : i1
        %187 = comb.or %66, %186 : i1
        fsm.update %cmd_wr_en_last_bit, %187 : i1
        %188 = comb.and %147, %140, %3 : i1
        %189 = comb.and %148, %150, %4 : i1
        %190 = comb.or %189, %188 : i1
        %191 = comb.xor %190, %true : i1
        %192 = comb.and %149, %191 : i1
        %193 = comb.and %132, %191 : i1
        %194 = comb.mux %193, %arg14, %csid_q : i1
        %195 = comb.mux %193, %arg13, %cpol_q : i1
        %196 = comb.mux %193, %arg12, %cpha_q : i1
        %197 = comb.mux %193, %arg11, %full_cyc_q : i1
        %198 = comb.mux %193, %arg8, %csnidle_q : i4
        %199 = comb.mux %193, %arg9, %csnlead_q : i4
        %200 = comb.mux %193, %arg10, %csntrail_q : i4
        %201 = comb.mux %193, %arg7, %clkdiv_q : i16
        %202 = comb.mux %193, %arg6, %csaat_q : i1
        %203 = comb.mux %193, %arg3, %cmd_wr_en_q : i1
        %204 = comb.mux %193, %arg4, %cmd_rd_en_q : i1
        %205 = comb.mux %193, %arg2, %cmd_speed_q : i2
        %206 = comb.mux %190, %clk_cntr_q, %145 : i16
        %207 = comb.and %81, %191 : i1
        %208 = comb.mux bin %207, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %209 = comb.mux %190, %bit_cntr_q, %172 : i3
        %210 = comb.mux %190, %byte_cntr_cpha0_q, %174 : i20
        %211 = comb.mux %190, %byte_cntr_cpha1_q, %177 : i20
        %212 = comb.mux %190, %wait_cntr_q, %183 : i4
        %213 = comb.or %147, %192 : i1
        %214 = comb.and %5, %191 : i1
        %215 = comb.mux %214, %213, %sample_en_q : i1
        %216 = comb.mux %214, %sample_en_q, %sample_en_q2 : i1
        %217 = comb.mux bin %190, %u_sck_flop2Fq_o, %184 : i1
        %218 = comb.mux %191, %130, %csb_q : i1
        %219 = comb.or %133, %218 : i1
        fsm.update %_sh1_12, %191 : i1
        fsm.update %csb_q, %219 : i1
        fsm.update %u_sck_flop2Fq_o, %217 : i1
        fsm.update %sample_en_q2, %216 : i1
        fsm.update %sample_en_q, %215 : i1
        fsm.update %wait_cntr_q, %212 : i4
        fsm.update %byte_cntr_cpha1_q, %211 : i20
        fsm.update %byte_cntr_cpha0_q, %210 : i20
        fsm.update %bit_cntr_q, %209 : i3
        fsm.update %segment_rd_en_cpha1, %208 : i1
        fsm.update %clk_cntr_q, %206 : i16
        fsm.update %cmd_speed_q, %205 : i2
        fsm.update %cmd_wr_en_q, %203 : i1
        fsm.update %cmd_rd_en_q, %204 : i1
        fsm.update %csaat_q, %202 : i1
        fsm.update %clkdiv_q, %201 : i16
        fsm.update %csntrail_q, %200 : i4
        fsm.update %csnlead_q, %199 : i4
        fsm.update %csnidle_q, %198 : i4
        fsm.update %full_cyc_q, %197 : i1
        fsm.update %cpha_q, %196 : i1
        fsm.update %cpol_q, %195 : i1
        fsm.update %csid_q, %194 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.xor %arg17, %true : i1
        %3 = comb.concat %c1_i2, %cpha_q : i2, i1
        %4 = comb.xor %arg15, %true : i1
        %5 = comb.mux %4, %c-1_i3, %c-4_i3 : i3
        %6 = comb.icmp eq %arg14, %csid_q : i1
        %7 = comb.and %6, %arg15 : i1
        %8 = comb.mux %7, %3, %5 : i3
        %9 = comb.or %7, %4 : i1
        %10 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %11 = comb.xor %cpha_q, %true : i1
        %12 = comb.xor %csaat_q, %true : i1
        %13 = comb.mux %10, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %15 = comb.mux %12, %c-4_i3, %8 : i3
        %c2_i3 = hw.constant 2 : i3
        %16 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %17 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %18 = comb.xor %isFirstCycle, %true : i1
        %19 = comb.and %18, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %arg1, %0 : i1
        %22 = comb.xor %16, %true : i1
        %23 = comb.icmp ne %17, %c0_i20 : i20
        %24 = comb.or %22, %23, %11 : i1
        %25 = comb.and %21, %14 : i1
        %26 = comb.xor %24, %true : i1
        %27 = comb.and %26, %25 : i1
        %28 = comb.mux %27, %15, %13 : i3
        %29 = comb.and %25, %24 : i1
        %30 = comb.mux %29, %c3_i3, %28 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.mux %arg18, %c0_i3, %30 : i3
        %33 = comb.xor %21, %true : i1
        %34 = comb.and %14, %33 : i1
        %35 = comb.mux %34, %c2_i3, %32 : i3
        %36 = comb.xor %34, %true : i1
        %37 = comb.icmp ne %35, %c2_i3 : i3
        %38 = comb.and %14, %37 : i1
        %true_13 = hw.constant true
        %39 = comb.xor %27, %true_13 : i1
        %true_14 = hw.constant true
        %40 = comb.xor %29, %true_14 : i1
        %true_15 = hw.constant true
        %41 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %42 = comb.xor %34, %true_16 : i1
        %43 = comb.and %42, %41, %40, %39, %10 : i1
        %true_17 = hw.constant true
        %44 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %45 = comb.xor %29, %true_18 : i1
        %true_19 = hw.constant true
        %46 = comb.xor %arg18, %true_19 : i1
        %47 = comb.and %46, %45, %27, %csaat_q, %7, %44 : i1
        %48 = comb.or %34, %47 : i1
        %49 = comb.and %48, %16 : i1
        %50 = comb.or %43, %49 : i1
        %51 = comb.and %38, %50 : i1
        %52 = comb.and %27, %csaat_q, %7, %cpha_q : i1
        %53 = comb.or %29, %52 : i1
        %true_20 = hw.constant true
        %54 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %55 = comb.xor %34, %true_21 : i1
        %56 = comb.and %38, %55, %54, %53, %16 : i1
        verif.assert %20 : i1
        %57 = comb.and %arg15, %36, %31, %27, %csaat_q, %9 : i1
        %58 = comb.mux %57, %arg12, %cpha_q : i1
        %59 = comb.mux %57, %arg3, %cmd_wr_en_q : i1
        %60 = comb.xor %58, %true : i1
        %61 = comb.mux %60, %51, %56 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.and %61, %59, %1 : i1
        %64 = comb.and %58, %38, %16, %62, %2 : i1
        %65 = comb.or %64, %63, %34 : i1
        %true_22 = hw.constant true
        %66 = comb.xor %27, %true_22 : i1
        %true_23 = hw.constant true
        %67 = comb.xor %29, %true_23 : i1
        %true_24 = hw.constant true
        %68 = comb.xor %arg18, %true_24 : i1
        %true_25 = hw.constant true
        %69 = comb.xor %65, %true_25 : i1
        %70 = comb.and %69, %68, %67, %66, %10 : i1
        fsm.return %70
      } action {
        %true = hw.constant true
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i20 = hw.constant -1 : i20
        %true_14 = hw.constant true
        %0 = comb.xor %arg1, %true_14 : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.xor %arg16, %true_14 : i1
        %4 = comb.xor %arg17, %true_14 : i1
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.concat %c1_i2, %cpha_q : i2, i1
        %7 = comb.xor %arg15, %true_14 : i1
        %8 = comb.mux %7, %c-1_i3, %c-4_i3 : i3
        %9 = comb.icmp eq %arg14, %csid_q : i1
        %10 = comb.and %9, %arg15 : i1
        %11 = comb.mux %10, %6, %8 : i3
        %12 = comb.or %10, %7 : i1
        %false_15 = hw.constant false
        %13 = comb.xor %cpha_q, %true_14 : i1
        %14 = comb.xor %csaat_q, %true_14 : i1
        %15 = comb.mux %14, %c-4_i3, %11 : i3
        %16 = comb.xor %5, %true_14 : i1
        %c2_i3_16 = hw.constant 2 : i3
        %true_17 = hw.constant true
        %true_18 = hw.constant true
        %true_19 = hw.constant true
        %17 = comb.xor %cpha_q, %true_19 : i1
        %true_20 = hw.constant true
        %18 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %19 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %20 = comb.icmp eq %arg2, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %22 = comb.icmp eq %arg2, %c1_i2 : i2
        %23 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %24 = comb.icmp eq %arg2, %c-2_i2 : i2
        %25 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %26 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %27 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %28 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_21 = hw.constant 0 : i2
        %29 = comb.icmp eq %28, %c0_i2_21 : i2
        %true_22 = hw.constant true
        %30 = comb.xor %10, %true_22 : i1
        %31 = comb.and %30, %29 : i1
        %32 = comb.or %14, %31 : i1
        %true_23 = hw.constant true
        %33 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_24 = hw.constant 1 : i2
        %34 = comb.icmp eq %33, %c1_i2_24 : i2
        %true_25 = hw.constant true
        %35 = comb.xor %10, %true_25 : i1
        %true_26 = hw.constant true
        %36 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_27 = hw.constant -2 : i2
        %37 = comb.icmp eq %36, %c-2_i2_27 : i2
        %true_28 = hw.constant true
        %38 = comb.xor %10, %true_28 : i1
        %true_29 = hw.constant true
        %39 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %40 = comb.icmp eq %39, %c-1_i2 : i2
        %true_30 = hw.constant true
        %41 = comb.xor %10, %true_30 : i1
        %true_31 = hw.constant true
        %42 = comb.and %cmd_wr_en_q, %18 : i1
        %43 = comb.xor %isFirstCycle, %true_14 : i1
        %44 = comb.and %43, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %45 = comb.xor %44, %true_14 : i1
        verif.assert %45 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %7 : i1
        fsm.update %_sh1_6, %true : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        %46 = comb.xor %18, %true_14 : i1
        %47 = comb.icmp ne %26, %c0_i20 : i20
        %48 = comb.or %46, %47, %13 : i1
        %49 = comb.xor %48, %true_14 : i1
        %50 = comb.and %49, %5 : i1
        %51 = comb.mux %50, %15, %c1_i3 : i3
        %52 = comb.and %5, %48 : i1
        %53 = comb.mux %52, %c3_i3, %51 : i3
        %54 = comb.xor %52, %true_14 : i1
        %55 = comb.mux %16, %c2_i3_16, %53 : i3
        %56 = comb.icmp ne %55, %c2_i3_16 : i3
        %57 = comb.xor %50, %true_17 : i1
        %58 = comb.xor %52, %true_18 : i1
        %59 = comb.and %5, %58, %57 : i1
        %60 = comb.xor %52, %true_20 : i1
        %61 = comb.and %60, %50, %csaat_q, %10, %17 : i1
        %62 = comb.or %16, %61 : i1
        %63 = comb.and %62, %18 : i1
        %64 = comb.or %59, %63 : i1
        %65 = comb.and %56, %64 : i1
        %66 = comb.and %56, %62, %19 : i1
        %67 = comb.and %50, %csaat_q, %10, %cpha_q : i1
        %68 = comb.or %52, %67 : i1
        %69 = comb.and %5, %68 : i1
        %70 = comb.and %56, %69, %18 : i1
        %71 = comb.and %56, %69, %19 : i1
        %72 = comb.and %56, %18 : i1
        %73 = comb.mux %72, %27, %byte_cntr_cpha1_q : i20
        %74 = comb.xor %52, %true_23 : i1
        %75 = comb.and %74, %50, %32 : i1
        %76 = comb.xor %52, %true_26 : i1
        %77 = comb.and %76, %50, %csaat_q, %35, %34 : i1
        %78 = comb.xor %52, %true_29 : i1
        %79 = comb.and %56, %5 : i1
        %80 = comb.xor %59, %true_14 : i1
        %81 = comb.and %80, %79 : i1
        %82 = comb.xor %75, %true_14 : i1
        %83 = comb.and %82, %81 : i1
        %84 = comb.xor %77, %true_14 : i1
        %85 = comb.and %84, %83, %78, %50, %csaat_q, %38, %37 : i1
        %86 = comb.and %83, %77 : i1
        %87 = comb.or %86, %85 : i1
        %88 = comb.and %81, %75 : i1
        %89 = comb.and %79, %59 : i1
        %90 = comb.xor %52, %true_31 : i1
        %91 = comb.icmp ne %55, %c-4_i3 : i3
        %92 = comb.xor %62, %true_14 : i1
        %93 = comb.and %92, %80 : i1
        %94 = comb.xor %69, %true_14 : i1
        %95 = comb.and %94, %93, %90, %50, %csaat_q, %41, %40 : i1
        %96 = comb.xor %95, %true_14 : i1
        %97 = comb.and %93, %69 : i1
        %98 = comb.xor %97, %true_14 : i1
        %99 = comb.and %80, %62 : i1
        %100 = comb.xor %99, %true_14 : i1
        %101 = comb.and %80, %100, %98, %96, %91 : i1
        %102 = comb.icmp ne %55, %c3_i3 : i3
        %103 = comb.and %arg15, %54, %50, %csaat_q, %12 : i1
        %104 = comb.mux %103, %arg14, %csid_q : i1
        %105 = comb.mux %103, %arg13, %cpol_q : i1
        %106 = comb.mux %103, %arg12, %cpha_q : i1
        %107 = comb.mux %103, %arg8, %csnidle_q : i4
        %108 = comb.mux %103, %arg9, %csnlead_q : i4
        %109 = comb.mux %103, %arg10, %csntrail_q : i4
        %110 = comb.mux %103, %arg7, %clkdiv_q : i16
        %111 = comb.mux %103, %arg3, %cmd_wr_en_q : i1
        %112 = comb.mux %103, %arg4, %cmd_rd_en_q : i1
        %113 = comb.mux %1, %110, %2 : i16
        %114 = comb.mux %103, %arg7, %113 : i16
        %115 = comb.xor %106, %true_14 : i1
        %116 = comb.mux %115, %65, %70 : i1
        %117 = comb.and %106, %72 : i1
        %118 = comb.mux %115, %66, %71 : i1
        %119 = comb.mux %115, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %120 = comb.xor %112, %true_14 : i1
        %121 = comb.xor %111, %true_14 : i1
        %122 = comb.and %120, %121 : i1
        %123 = comb.mux %103, %20, %21 : i1
        %124 = comb.mux %103, %22, %23 : i1
        %125 = comb.mux %103, %24, %25 : i1
        %126 = comb.mux %125, %c-4_i3, %c1_i3 : i3
        %127 = comb.xor %122, %true_14 : i1
        %128 = comb.xor %123, %true_14 : i1
        %129 = comb.and %128, %127, %124 : i1
        %130 = comb.mux %129, %c2_i3, %126 : i3
        %131 = comb.mux %129, %c-2_i3, %126 : i3
        %132 = comb.and %127, %123 : i1
        %133 = comb.mux %132, %c1_i3, %130 : i3
        %134 = comb.mux %132, %c-1_i3, %131 : i3
        %135 = comb.mux %122, %c0_i3, %133 : i3
        %136 = comb.mux %122, %c0_i3, %134 : i3
        %137 = comb.sub %bit_cntr_q, %135 : i3
        %138 = comb.mux %118, %137, %bit_cntr_q : i3
        %139 = comb.mux %116, %136, %138 : i3
        %140 = comb.mux %103, %arg5, %73 : i20
        %141 = comb.mux %87, %107, %c0_i4 : i4
        %142 = comb.mux %88, %109, %141 : i4
        %143 = comb.mux %89, %108, %142 : i4
        %144 = comb.mux %105, %102, %69 : i1
        %145 = comb.xor %117, %true_14 : i1
        %146 = comb.and %145, %cmd_wr_en_last_bit : i1
        %147 = comb.or %42, %146 : i1
        fsm.update %cmd_wr_en_last_bit, %147 : i1
        %148 = comb.and %116, %111, %3 : i1
        %149 = comb.and %117, %119, %4 : i1
        %150 = comb.or %149, %148 : i1
        %151 = comb.xor %150, %true_14 : i1
        %152 = comb.and %118, %151 : i1
        %153 = comb.and %103, %151 : i1
        %154 = comb.mux %153, %arg14, %csid_q : i1
        %155 = comb.mux %153, %arg13, %cpol_q : i1
        %156 = comb.mux %153, %arg12, %cpha_q : i1
        %157 = comb.mux %153, %arg11, %full_cyc_q : i1
        %158 = comb.mux %153, %arg8, %csnidle_q : i4
        %159 = comb.mux %153, %arg9, %csnlead_q : i4
        %160 = comb.mux %153, %arg10, %csntrail_q : i4
        %161 = comb.mux %153, %arg7, %clkdiv_q : i16
        %162 = comb.mux %153, %arg6, %csaat_q : i1
        %163 = comb.mux %153, %arg3, %cmd_wr_en_q : i1
        %164 = comb.mux %153, %arg4, %cmd_rd_en_q : i1
        %165 = comb.mux %153, %arg2, %cmd_speed_q : i2
        %166 = comb.or %150, %0 : i1
        %167 = comb.mux %166, %clk_cntr_q, %114 : i16
        %168 = comb.and %56, %151 : i1
        %169 = comb.mux bin %168, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %170 = comb.or %150, %16 : i1
        %171 = comb.mux %170, %bit_cntr_q, %139 : i3
        %true_32 = hw.constant true
        %172 = comb.xor %103, %true_32 : i1
        %173 = comb.or %150, %172 : i1
        %174 = comb.mux %173, %byte_cntr_cpha0_q, %arg5 : i20
        %175 = comb.or %150, %16 : i1
        %176 = comb.mux %175, %byte_cntr_cpha1_q, %140 : i20
        %true_33 = hw.constant true
        %177 = comb.xor %5, %true_33 : i1
        %178 = comb.or %150, %177 : i1
        %179 = comb.mux %178, %wait_cntr_q, %143 : i4
        %180 = comb.or %116, %152 : i1
        %181 = comb.and %5, %151 : i1
        %182 = comb.mux %181, %180, %sample_en_q : i1
        %183 = comb.mux %181, %sample_en_q, %sample_en_q2 : i1
        %184 = comb.mux bin %150, %u_sck_flop2Fq_o, %144 : i1
        %185 = comb.mux %151, %101, %csb_q : i1
        %186 = comb.or %104, %185 : i1
        fsm.update %_sh1_12, %151 : i1
        fsm.update %csb_q, %186 : i1
        fsm.update %u_sck_flop2Fq_o, %184 : i1
        fsm.update %sample_en_q2, %183 : i1
        fsm.update %sample_en_q, %182 : i1
        fsm.update %wait_cntr_q, %179 : i4
        fsm.update %byte_cntr_cpha1_q, %176 : i20
        fsm.update %byte_cntr_cpha0_q, %174 : i20
        fsm.update %bit_cntr_q, %171 : i3
        fsm.update %segment_rd_en_cpha1, %169 : i1
        fsm.update %clk_cntr_q, %167 : i16
        fsm.update %cmd_speed_q, %165 : i2
        fsm.update %cmd_wr_en_q, %163 : i1
        fsm.update %cmd_rd_en_q, %164 : i1
        fsm.update %csaat_q, %162 : i1
        fsm.update %clkdiv_q, %161 : i16
        fsm.update %csntrail_q, %160 : i4
        fsm.update %csnlead_q, %159 : i4
        fsm.update %csnidle_q, %158 : i4
        fsm.update %full_cyc_q, %157 : i1
        fsm.update %cpha_q, %156 : i1
        fsm.update %cpol_q, %155 : i1
        fsm.update %csid_q, %154 : i1
      }
    }
    fsm.state @state_7 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-1_i3 = hw.constant -1 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c-4_i3 = hw.constant -4 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %true = hw.constant true
      %false_13 = hw.constant false
      %false_14 = hw.constant false
      %0 = comb.xor %arg16, %true : i1
      %false_15 = hw.constant false
      %1 = comb.concat %c1_i2, %cpha_q : i2, i1
      %2 = comb.xor %arg15, %true : i1
      %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
      %4 = comb.icmp eq %arg14, %csid_q : i1
      %5 = comb.and %4, %arg15 : i1
      %6 = comb.mux %5, %1, %3 : i3
      %7 = comb.or %5, %2 : i1
      %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
      %10 = comb.xor %arg18, %true : i1
      %11 = comb.and %arg1, %10 : i1
      %12 = comb.mux %11, %6, %9 : i3
      %13 = comb.mux %arg18, %c0_i3, %12 : i3
      %14 = comb.xor %arg1, %true : i1
      %15 = comb.and %10, %14 : i1
      %16 = comb.xor %15, %true : i1
      %17 = comb.and %16, %11, %7 : i1
      %c-1_i3_16 = hw.constant -1 : i3
      %18 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
      %19 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
      %false_17 = hw.constant false
      %20 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %21 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %22 = comb.concat %c0_i3, %21 : i3, i1
      %23 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %24 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %25 = comb.concat %c0_i2, %24 : i2, i2
      %26 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %27 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %28 = comb.xor %csb_q, %true : i1
      %29 = comb.xor %20, %true : i1
      %30 = comb.and %29, %28 : i1
      %31 = comb.xor %23, %true : i1
      %32 = comb.and %26, %31, %30 : i1
      %33 = comb.mux %32, %27, %c0_i4 : i4
      %34 = comb.and %23, %30 : i1
      %35 = comb.mux %34, %25, %33 : i4
      %36 = comb.and %20, %28 : i1
      %37 = comb.mux %36, %22, %35 : i4
      %38 = comb.xor %isFirstCycle, %true : i1
      %39 = comb.and %38, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
      %40 = comb.xor %39, %true : i1
      verif.assert %40 : i1
      %41 = comb.and %arg15, %17 : i1
      %42 = comb.mux %41, %arg12, %cpha_q : i1
      %43 = comb.mux %41, %arg11, %full_cyc_q : i1
      %44 = comb.mux %41, %arg3, %cmd_wr_en_q : i1
      %45 = comb.mux %15, %c-1_i3_16, %13 : i3
      %46 = comb.icmp ne %45, %c-1_i3_16 : i3
      %47 = comb.and %10, %46 : i1
      %true_18 = hw.constant true
      %48 = comb.xor %11, %true_18 : i1
      %true_19 = hw.constant true
      %49 = comb.xor %arg18, %true_19 : i1
      %true_20 = hw.constant true
      %50 = comb.xor %15, %true_20 : i1
      %51 = comb.and %50, %49, %48, %8 : i1
      %true_21 = hw.constant true
      %52 = comb.xor %cpha_q, %true_21 : i1
      %true_22 = hw.constant true
      %53 = comb.xor %arg18, %true_22 : i1
      %true_23 = hw.constant true
      %54 = comb.xor %15, %true_23 : i1
      %55 = comb.and %54, %53, %11, %5, %52 : i1
      %56 = comb.and %55, %18 : i1
      %57 = comb.or %51, %56 : i1
      %58 = comb.and %47, %57 : i1
      %59 = comb.and %47, %55, %19 : i1
      %true_24 = hw.constant true
      %60 = comb.xor %arg18, %true_24 : i1
      %true_25 = hw.constant true
      %61 = comb.xor %15, %true_25 : i1
      %62 = comb.and %61, %60, %11, %5, %cpha_q : i1
      %63 = comb.and %47, %62, %18 : i1
      %64 = comb.and %47, %62, %19 : i1
      %65 = comb.xor %42, %true : i1
      %66 = comb.mux %65, %58, %63 : i1
      %67 = comb.mux %65, %59, %64 : i1
      %68 = comb.and %66, %44 : i1
      %69 = comb.mux %43, %sample_en_q2, %sample_en_q : i1
      %70 = comb.and %68, %0 : i1
      %71 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %72 = comb.icmp eq %arg5, %c0_i20 : i20
      %73 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %74 = comb.mux %41, %72, %73 : i1
      %75 = comb.mux %14, %71, %74 : i1
      %76 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %77 = comb.icmp eq %arg5, %c0_i20 : i20
      %78 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %79 = comb.mux %41, %77, %78 : i1
      %80 = comb.mux %14, %76, %79 : i1
      %81 = comb.mux %65, %75, %80 : i1
      %82 = comb.or %arg18, %81 : i1
      %83 = comb.xor %70, %true : i1
      %84 = comb.and %68, %83 : i1
      %85 = comb.and %69, %83 : i1
      %86 = comb.and %67, %83 : i1
      %87 = comb.and %17, %83 : i1
      %88 = comb.and %82, %84, %arg16 : i1
      fsm.output %87, %u_sck_flop2Fq_o, %csb_q, %37, %false_17, %88, %84, %false_13, %85, %86, %cmd_speed_q, %43, %false_15, %70, %false_14 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_7 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %c-1_i3_13 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.xor %isFirstCycle, %true : i1
        %13 = comb.and %12, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %arg1, %10 : i1
        %16 = comb.mux %15, %6, %9 : i3
        %17 = comb.mux %arg18, %c0_i3, %16 : i3
        %18 = comb.xor %arg1, %true : i1
        %19 = comb.and %10, %18 : i1
        %20 = comb.mux %19, %c-1_i3_13, %17 : i3
        %21 = comb.xor %19, %true : i1
        %22 = comb.icmp ne %20, %c-1_i3_13 : i3
        %23 = comb.and %10, %22 : i1
        %true_14 = hw.constant true
        %24 = comb.xor %15, %true_14 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %19, %true_16 : i1
        %27 = comb.and %26, %25, %24, %8 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %29 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %30 = comb.xor %19, %true_19 : i1
        %31 = comb.and %30, %29, %15, %5, %28, %11 : i1
        %32 = comb.or %27, %31 : i1
        %33 = comb.and %23, %32 : i1
        %true_20 = hw.constant true
        %34 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %35 = comb.xor %19, %true_21 : i1
        %36 = comb.and %23, %35, %34, %15, %5, %cpha_q, %11 : i1
        verif.assert %14 : i1
        %37 = comb.and %arg15, %21, %15, %7 : i1
        %38 = comb.mux %37, %arg12, %cpha_q : i1
        %39 = comb.mux %37, %arg3, %cmd_wr_en_q : i1
        %40 = comb.xor %38, %true : i1
        %41 = comb.mux %40, %33, %36 : i1
        %42 = comb.and %41, %39, %0 : i1
        %43 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %44 = comb.icmp eq %43, %c-1_i2 : i2
        %true_22 = hw.constant true
        %45 = comb.xor %5, %true_22 : i1
        %true_23 = hw.constant true
        %46 = comb.xor %arg18, %true_23 : i1
        %47 = comb.and %46, %15, %45, %44 : i1
        %48 = comb.or %42, %19, %47 : i1
        fsm.return %48
      } action {
        fsm.update %_sh1_10, %arg1 : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %false_14 = hw.constant false
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %arg1, %10 : i1
        %12 = comb.mux %11, %6, %9 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %arg1, %true : i1
        %15 = comb.and %10, %14 : i1
        %16 = comb.xor %15, %true : i1
        %c-1_i3_15 = hw.constant -1 : i3
        %true_16 = hw.constant true
        %17 = comb.xor %11, %true_16 : i1
        %true_17 = hw.constant true
        %18 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %19 = comb.xor %15, %true_18 : i1
        %20 = comb.and %19, %18, %17, %8 : i1
        %true_19 = hw.constant true
        %21 = comb.xor %cpha_q, %true_19 : i1
        %true_20 = hw.constant true
        %22 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %23 = comb.xor %15, %true_21 : i1
        %24 = comb.and %23, %22, %11, %5, %21 : i1
        %25 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %26 = comb.and %24, %25 : i1
        %27 = comb.or %20, %26 : i1
        %28 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %true_22 = hw.constant true
        %29 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %30 = comb.xor %15, %true_23 : i1
        %31 = comb.and %30, %29, %11, %5, %cpha_q : i1
        %32 = comb.icmp eq %arg2, %c0_i2 : i2
        %33 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %34 = comb.icmp eq %arg2, %c1_i2 : i2
        %35 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %36 = comb.icmp eq %arg2, %c-2_i2 : i2
        %37 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %38 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_24 = hw.constant 0 : i2
        %39 = comb.icmp eq %38, %c0_i2_24 : i2
        %true_25 = hw.constant true
        %40 = comb.xor %5, %true_25 : i1
        %true_26 = hw.constant true
        %41 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %42 = comb.xor %15, %true_27 : i1
        %43 = comb.and %42, %41, %11, %40, %39 : i1
        %44 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_28 = hw.constant 1 : i2
        %45 = comb.icmp eq %44, %c1_i2_28 : i2
        %true_29 = hw.constant true
        %46 = comb.xor %5, %true_29 : i1
        %true_30 = hw.constant true
        %47 = comb.xor %arg18, %true_30 : i1
        %true_31 = hw.constant true
        %48 = comb.xor %15, %true_31 : i1
        %49 = comb.and %48, %47, %11, %46, %45 : i1
        %50 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_32 = hw.constant -2 : i2
        %51 = comb.icmp eq %50, %c-2_i2_32 : i2
        %true_33 = hw.constant true
        %52 = comb.xor %5, %true_33 : i1
        %53 = comb.and %52, %51 : i1
        %true_34 = hw.constant true
        %54 = comb.xor %8, %true_34 : i1
        %55 = comb.mux %11, %53, %54 : i1
        %true_35 = hw.constant true
        %56 = comb.xor %arg18, %true_35 : i1
        %true_36 = hw.constant true
        %57 = comb.xor %15, %true_36 : i1
        %58 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %59 = comb.xor %20, %true : i1
        %60 = comb.xor %43, %true : i1
        %61 = comb.xor %49, %true : i1
        %62 = comb.or %arg18, %arg1 : i1
        %63 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %64 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %65 = comb.icmp eq %64, %c-1_i2 : i2
        %true_37 = hw.constant true
        %66 = comb.xor %5, %true_37 : i1
        %true_38 = hw.constant true
        %67 = comb.xor %arg18, %true_38 : i1
        %68 = comb.and %67, %11, %66, %65 : i1
        %69 = comb.or %15, %68 : i1
        %70 = comb.xor %24, %true : i1
        %71 = comb.and %70, %59 : i1
        %72 = comb.xor %31, %true : i1
        %73 = comb.and %72, %71, %69 : i1
        %74 = comb.xor %73, %true : i1
        %75 = comb.and %71, %31 : i1
        %76 = comb.xor %75, %true : i1
        %77 = comb.and %59, %24 : i1
        %78 = comb.xor %77, %true : i1
        %79 = comb.and %cmd_wr_en_q, %25 : i1
        %80 = comb.or %79, %cmd_wr_en_last_bit : i1
        %81 = comb.xor %isFirstCycle, %true : i1
        %82 = comb.and %81, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
        %83 = comb.xor %82, %true : i1
        verif.assert %83 : i1
        fsm.update %_sh1_8, %2 : i1
        fsm.update %_sh1_6, %8 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %80 : i1
        %84 = comb.and %arg15, %16, %11, %7 : i1
        %85 = comb.mux %84, %arg14, %csid_q : i1
        %86 = comb.mux %84, %arg13, %cpol_q : i1
        %87 = comb.mux %84, %arg12, %cpha_q : i1
        %88 = comb.mux %84, %arg8, %csnidle_q : i4
        %89 = comb.mux %84, %arg9, %csnlead_q : i4
        %90 = comb.mux %84, %arg10, %csntrail_q : i4
        %91 = comb.mux %84, %arg3, %cmd_wr_en_q : i1
        %92 = comb.mux %84, %arg4, %cmd_rd_en_q : i1
        %93 = comb.mux %84, %arg7, %clk_cntr_q : i16
        %94 = comb.mux %arg18, %c0_i16, %93 : i16
        %95 = comb.mux %15, %c-1_i3_15, %13 : i3
        %96 = comb.icmp ne %95, %c-1_i3_15 : i3
        %97 = comb.and %10, %96 : i1
        %98 = comb.and %97, %27 : i1
        %99 = comb.and %97, %24, %28 : i1
        %100 = comb.and %97, %31, %25 : i1
        %101 = comb.and %97, %31, %28 : i1
        %102 = comb.xor %87, %true : i1
        %103 = comb.mux %102, %98, %100 : i1
        %104 = comb.mux %102, %99, %101 : i1
        %105 = comb.xor %92, %true : i1
        %106 = comb.xor %91, %true : i1
        %107 = comb.and %105, %106 : i1
        %108 = comb.mux %84, %32, %33 : i1
        %109 = comb.mux %84, %34, %35 : i1
        %110 = comb.mux %84, %36, %37 : i1
        %111 = comb.mux %110, %c-4_i3, %c1_i3 : i3
        %112 = comb.xor %107, %true : i1
        %113 = comb.xor %108, %true : i1
        %114 = comb.and %113, %112, %109 : i1
        %115 = comb.mux %114, %c2_i3, %111 : i3
        %116 = comb.mux %114, %c-2_i3, %111 : i3
        %117 = comb.and %112, %108 : i1
        %118 = comb.mux %117, %c1_i3, %115 : i3
        %119 = comb.mux %117, %c-1_i3, %116 : i3
        %120 = comb.mux %107, %c0_i3, %118 : i3
        %121 = comb.mux %107, %c0_i3, %119 : i3
        %122 = comb.sub %bit_cntr_q, %120 : i3
        %123 = comb.mux %104, %122, %bit_cntr_q : i3
        %124 = comb.mux %103, %121, %123 : i3
        %125 = comb.mux %14, %bit_cntr_q, %124 : i3
        %126 = comb.mux %arg18, %c0_i3, %125 : i3
        %127 = comb.mux %84, %arg5, %byte_cntr_cpha0_q : i20
        %128 = comb.mux %arg18, %c0_i20, %127 : i20
        %129 = comb.mux %84, %arg5, %byte_cntr_cpha1_q : i20
        %130 = comb.mux %arg18, %c0_i20, %129 : i20
        %131 = comb.and %96, %11 : i1
        %132 = comb.and %59, %131 : i1
        %133 = comb.and %60, %132 : i1
        %134 = comb.and %61, %133, %57, %56, %55 : i1
        %135 = comb.and %133, %49 : i1
        %136 = comb.or %135, %134 : i1
        %137 = comb.mux %136, %88, %c0_i4 : i4
        %138 = comb.and %132, %43 : i1
        %139 = comb.mux %138, %90, %137 : i4
        %140 = comb.and %131, %20 : i1
        %141 = comb.mux %140, %89, %139 : i4
        %142 = comb.mux %62, %141, %wait_cntr_q : i4
        %143 = comb.mux %arg18, %c0_i4, %142 : i4
        %144 = comb.xor %96, %true : i1
        %145 = comb.and %63, %144, %11 : i1
        %146 = comb.mux %145, %58, %143 : i4
        %147 = comb.icmp ne %95, %c-4_i3 : i3
        %148 = comb.and %59, %78, %76, %74, %147 : i1
        %149 = comb.icmp ne %95, %c3_i3 : i3
        %150 = comb.mux %86, %149, %31 : i1
        %151 = comb.and %103, %91, %0 : i1
        %152 = comb.mux %151, %clk_cntr_q, %94 : i16
        %153 = comb.mux %151, %bit_cntr_q, %126 : i3
        %154 = comb.mux %151, %byte_cntr_cpha0_q, %128 : i20
        %155 = comb.mux %151, %byte_cntr_cpha1_q, %130 : i20
        %156 = comb.mux %151, %wait_cntr_q, %146 : i4
        %157 = comb.mux bin %151, %u_sck_flop2Fq_o, %150 : i1
        fsm.update %u_sck_flop2Fq_o, %157 : i1
        fsm.update %wait_cntr_q, %156 : i4
        fsm.update %byte_cntr_cpha1_q, %155 : i20
        fsm.update %byte_cntr_cpha0_q, %154 : i20
        fsm.update %bit_cntr_q, %153 : i3
        fsm.update %clk_cntr_q, %152 : i16
        %158 = comb.xor %151, %true : i1
        %159 = comb.and %104, %158 : i1
        %160 = comb.and %84, %158 : i1
        %161 = comb.mux %160, %arg14, %csid_q : i1
        %162 = comb.mux %160, %arg13, %cpol_q : i1
        %163 = comb.mux %160, %arg12, %cpha_q : i1
        %164 = comb.mux %160, %arg11, %full_cyc_q : i1
        %165 = comb.mux %160, %arg8, %csnidle_q : i4
        %166 = comb.mux %160, %arg9, %csnlead_q : i4
        %167 = comb.mux %160, %arg10, %csntrail_q : i4
        %168 = comb.mux %160, %arg7, %clkdiv_q : i16
        %169 = comb.mux %160, %arg6, %csaat_q : i1
        %170 = comb.mux %160, %arg3, %cmd_wr_en_q : i1
        %171 = comb.mux %160, %arg4, %cmd_rd_en_q : i1
        %172 = comb.mux %160, %arg2, %cmd_speed_q : i2
        %173 = comb.and %96, %158 : i1
        %174 = comb.mux bin %173, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %175 = comb.or %103, %159 : i1
        %176 = comb.and %arg1, %158 : i1
        %177 = comb.mux %176, %175, %sample_en_q : i1
        %178 = comb.mux %176, %sample_en_q, %sample_en_q2 : i1
        %179 = comb.mux %158, %148, %csb_q : i1
        %180 = comb.or %85, %179 : i1
        fsm.update %_sh1_12, %158 : i1
        fsm.update %csb_q, %180 : i1
        fsm.update %sample_en_q2, %178 : i1
        fsm.update %sample_en_q, %177 : i1
        fsm.update %segment_rd_en_cpha1, %174 : i1
        fsm.update %cmd_speed_q, %172 : i2
        fsm.update %cmd_wr_en_q, %170 : i1
        fsm.update %cmd_rd_en_q, %171 : i1
        fsm.update %csaat_q, %169 : i1
        fsm.update %clkdiv_q, %168 : i16
        fsm.update %csntrail_q, %167 : i4
        fsm.update %csnlead_q, %166 : i4
        fsm.update %csnidle_q, %165 : i4
        fsm.update %full_cyc_q, %164 : i1
        fsm.update %cpha_q, %163 : i1
        fsm.update %cpol_q, %162 : i1
        fsm.update %csid_q, %161 : i1
      }
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %c-1_i3_13 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.xor %isFirstCycle, %true : i1
        %13 = comb.and %12, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %arg1, %10 : i1
        %16 = comb.mux %15, %6, %9 : i3
        %17 = comb.mux %arg18, %c0_i3, %16 : i3
        %18 = comb.xor %arg1, %true : i1
        %19 = comb.and %10, %18 : i1
        %20 = comb.mux %19, %c-1_i3_13, %17 : i3
        %21 = comb.xor %19, %true : i1
        %22 = comb.icmp ne %20, %c-1_i3_13 : i3
        %23 = comb.and %10, %22 : i1
        %true_14 = hw.constant true
        %24 = comb.xor %15, %true_14 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %19, %true_16 : i1
        %27 = comb.and %26, %25, %24, %8 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %29 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %30 = comb.xor %19, %true_19 : i1
        %31 = comb.and %30, %29, %15, %5, %28, %11 : i1
        %32 = comb.or %27, %31 : i1
        %33 = comb.and %23, %32 : i1
        %true_20 = hw.constant true
        %34 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %35 = comb.xor %19, %true_21 : i1
        %36 = comb.and %23, %35, %34, %15, %5, %cpha_q, %11 : i1
        verif.assert %14 : i1
        %37 = comb.and %arg15, %21, %15, %7 : i1
        %38 = comb.mux %37, %arg12, %cpha_q : i1
        %39 = comb.mux %37, %arg3, %cmd_wr_en_q : i1
        %40 = comb.xor %38, %true : i1
        %41 = comb.mux %40, %33, %36 : i1
        %42 = comb.and %41, %39, %0 : i1
        %43 = comb.or %42, %19 : i1
        %44 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2 = hw.constant -2 : i2
        %45 = comb.icmp eq %44, %c-2_i2 : i2
        %true_22 = hw.constant true
        %46 = comb.xor %5, %true_22 : i1
        %47 = comb.and %46, %45 : i1
        %true_23 = hw.constant true
        %48 = comb.xor %8, %true_23 : i1
        %49 = comb.mux %15, %47, %48 : i1
        %true_24 = hw.constant true
        %50 = comb.xor %arg18, %true_24 : i1
        %true_25 = hw.constant true
        %51 = comb.xor %43, %true_25 : i1
        %52 = comb.and %51, %50, %49 : i1
        fsm.return %52
      } action {
        fsm.update %_sh1_10, %arg1 : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %false_14 = hw.constant false
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.mux %arg1, %6, %9 : i3
        %11 = comb.xor %arg1, %true : i1
        %c-1_i3_15 = hw.constant -1 : i3
        %true_16 = hw.constant true
        %12 = comb.xor %cpha_q, %true_16 : i1
        %13 = comb.and %arg1, %5, %12 : i1
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %16 = comb.and %arg1, %5, %cpha_q : i1
        %17 = comb.icmp eq %arg2, %c0_i2 : i2
        %18 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %19 = comb.icmp eq %arg2, %c1_i2 : i2
        %20 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %21 = comb.icmp eq %arg2, %c-2_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %23 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_17 = hw.constant 0 : i2
        %24 = comb.icmp eq %23, %c0_i2_17 : i2
        %true_18 = hw.constant true
        %25 = comb.xor %5, %true_18 : i1
        %26 = comb.and %arg1, %25, %24 : i1
        %27 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_19 = hw.constant 1 : i2
        %28 = comb.icmp eq %27, %c1_i2_19 : i2
        %true_20 = hw.constant true
        %29 = comb.xor %5, %true_20 : i1
        %30 = comb.and %arg1, %29, %28 : i1
        %31 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_21 = hw.constant -2 : i2
        %32 = comb.icmp eq %31, %c-2_i2_21 : i2
        %true_22 = hw.constant true
        %33 = comb.xor %5, %true_22 : i1
        %34 = comb.and %33, %32 : i1
        %true_23 = hw.constant true
        %35 = comb.xor %8, %true_23 : i1
        %36 = comb.mux %arg1, %34, %35 : i1
        %37 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %38 = comb.xor %26, %true : i1
        %39 = comb.xor %30, %true : i1
        %40 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %41 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %42 = comb.icmp eq %41, %c-1_i2 : i2
        %true_24 = hw.constant true
        %43 = comb.xor %5, %true_24 : i1
        %44 = comb.and %arg1, %43, %42 : i1
        %45 = comb.or %11, %44 : i1
        %46 = comb.xor %13, %true : i1
        %47 = comb.xor %16, %true : i1
        %48 = comb.and %47, %46, %45 : i1
        %49 = comb.xor %48, %true : i1
        %50 = comb.and %46, %16 : i1
        %51 = comb.xor %50, %true : i1
        %52 = comb.xor %13, %true : i1
        %53 = comb.and %cmd_wr_en_q, %14 : i1
        %54 = comb.or %53, %cmd_wr_en_last_bit : i1
        %55 = comb.xor %isFirstCycle, %true : i1
        %56 = comb.and %55, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %57 = comb.xor %56, %true : i1
        verif.assert %57 : i1
        fsm.update %_sh1_8, %2 : i1
        fsm.update %_sh1_6, %8 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %54 : i1
        %58 = comb.and %arg15, %arg1, %7 : i1
        %59 = comb.mux %58, %arg14, %csid_q : i1
        %60 = comb.mux %58, %arg13, %cpol_q : i1
        %61 = comb.mux %58, %arg12, %cpha_q : i1
        %62 = comb.mux %58, %arg8, %csnidle_q : i4
        %63 = comb.mux %58, %arg10, %csntrail_q : i4
        %64 = comb.mux %58, %arg3, %cmd_wr_en_q : i1
        %65 = comb.mux %58, %arg4, %cmd_rd_en_q : i1
        %66 = comb.mux %11, %c-1_i3_15, %10 : i3
        %67 = comb.icmp ne %66, %c-1_i3_15 : i3
        %68 = comb.and %67, %13, %14 : i1
        %69 = comb.and %67, %13, %15 : i1
        %70 = comb.and %67, %16, %14 : i1
        %71 = comb.and %67, %16, %15 : i1
        %72 = comb.xor %61, %true : i1
        %73 = comb.mux %72, %68, %70 : i1
        %74 = comb.mux %72, %69, %71 : i1
        %75 = comb.xor %65, %true : i1
        %76 = comb.xor %64, %true : i1
        %77 = comb.and %75, %76 : i1
        %78 = comb.mux %58, %17, %18 : i1
        %79 = comb.mux %58, %19, %20 : i1
        %80 = comb.mux %58, %21, %22 : i1
        %81 = comb.mux %80, %c-4_i3, %c1_i3 : i3
        %82 = comb.xor %77, %true : i1
        %83 = comb.xor %78, %true : i1
        %84 = comb.and %83, %82, %79 : i1
        %85 = comb.mux %84, %c2_i3, %81 : i3
        %86 = comb.mux %84, %c-2_i3, %81 : i3
        %87 = comb.and %82, %78 : i1
        %88 = comb.mux %87, %c1_i3, %85 : i3
        %89 = comb.mux %87, %c-1_i3, %86 : i3
        %90 = comb.mux %77, %c0_i3, %88 : i3
        %91 = comb.mux %77, %c0_i3, %89 : i3
        %92 = comb.sub %bit_cntr_q, %90 : i3
        %93 = comb.mux %74, %92, %bit_cntr_q : i3
        %94 = comb.mux %73, %91, %93 : i3
        %95 = comb.and %67, %arg1 : i1
        %96 = comb.and %38, %95 : i1
        %97 = comb.and %39, %96, %36 : i1
        %98 = comb.and %96, %30 : i1
        %99 = comb.or %98, %97 : i1
        %100 = comb.mux %99, %62, %c0_i4 : i4
        %101 = comb.and %95, %26 : i1
        %102 = comb.mux %101, %63, %100 : i4
        %103 = comb.mux %arg1, %102, %wait_cntr_q : i4
        %104 = comb.xor %67, %true : i1
        %105 = comb.and %40, %104, %arg1 : i1
        %106 = comb.mux %105, %37, %103 : i4
        %107 = comb.icmp ne %66, %c-4_i3 : i3
        %108 = comb.and %52, %51, %49, %107 : i1
        %109 = comb.icmp ne %66, %c3_i3 : i3
        %110 = comb.mux %60, %109, %16 : i1
        %111 = comb.and %73, %64, %0 : i1
        %true_25 = hw.constant true
        %112 = comb.xor %58, %true_25 : i1
        %113 = comb.or %111, %112 : i1
        %114 = comb.mux %113, %clk_cntr_q, %arg7 : i16
        %115 = comb.or %111, %11 : i1
        %116 = comb.mux %115, %bit_cntr_q, %94 : i3
        %true_26 = hw.constant true
        %117 = comb.xor %58, %true_26 : i1
        %118 = comb.or %111, %117 : i1
        %119 = comb.mux %118, %byte_cntr_cpha0_q, %arg5 : i20
        %true_27 = hw.constant true
        %120 = comb.xor %58, %true_27 : i1
        %121 = comb.or %111, %120 : i1
        %122 = comb.mux %121, %byte_cntr_cpha1_q, %arg5 : i20
        %123 = comb.mux %111, %wait_cntr_q, %106 : i4
        %124 = comb.mux bin %111, %u_sck_flop2Fq_o, %110 : i1
        fsm.update %u_sck_flop2Fq_o, %124 : i1
        fsm.update %wait_cntr_q, %123 : i4
        fsm.update %byte_cntr_cpha1_q, %122 : i20
        fsm.update %byte_cntr_cpha0_q, %119 : i20
        fsm.update %bit_cntr_q, %116 : i3
        fsm.update %clk_cntr_q, %114 : i16
        %125 = comb.xor %111, %true : i1
        %126 = comb.and %74, %125 : i1
        %127 = comb.and %58, %125 : i1
        %128 = comb.mux %127, %arg14, %csid_q : i1
        %129 = comb.mux %127, %arg13, %cpol_q : i1
        %130 = comb.mux %127, %arg12, %cpha_q : i1
        %131 = comb.mux %127, %arg11, %full_cyc_q : i1
        %132 = comb.mux %127, %arg8, %csnidle_q : i4
        %133 = comb.mux %127, %arg9, %csnlead_q : i4
        %134 = comb.mux %127, %arg10, %csntrail_q : i4
        %135 = comb.mux %127, %arg7, %clkdiv_q : i16
        %136 = comb.mux %127, %arg6, %csaat_q : i1
        %137 = comb.mux %127, %arg3, %cmd_wr_en_q : i1
        %138 = comb.mux %127, %arg4, %cmd_rd_en_q : i1
        %139 = comb.mux %127, %arg2, %cmd_speed_q : i2
        %140 = comb.and %67, %125 : i1
        %141 = comb.mux bin %140, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %142 = comb.or %73, %126 : i1
        %143 = comb.and %arg1, %125 : i1
        %144 = comb.mux %143, %142, %sample_en_q : i1
        %145 = comb.mux %143, %sample_en_q, %sample_en_q2 : i1
        %146 = comb.mux %125, %108, %csb_q : i1
        %147 = comb.or %59, %146 : i1
        fsm.update %_sh1_12, %125 : i1
        fsm.update %csb_q, %147 : i1
        fsm.update %sample_en_q2, %145 : i1
        fsm.update %sample_en_q, %144 : i1
        fsm.update %segment_rd_en_cpha1, %141 : i1
        fsm.update %cmd_speed_q, %139 : i2
        fsm.update %cmd_wr_en_q, %137 : i1
        fsm.update %cmd_rd_en_q, %138 : i1
        fsm.update %csaat_q, %136 : i1
        fsm.update %clkdiv_q, %135 : i16
        fsm.update %csntrail_q, %134 : i4
        fsm.update %csnlead_q, %133 : i4
        fsm.update %csnidle_q, %132 : i4
        fsm.update %full_cyc_q, %131 : i1
        fsm.update %cpha_q, %130 : i1
        fsm.update %cpol_q, %129 : i1
        fsm.update %csid_q, %128 : i1
      }
      fsm.transition @state_4 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %c-1_i3_13 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.xor %isFirstCycle, %true : i1
        %13 = comb.and %12, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %arg1, %10 : i1
        %16 = comb.mux %15, %6, %9 : i3
        %17 = comb.mux %arg18, %c0_i3, %16 : i3
        %18 = comb.xor %arg1, %true : i1
        %19 = comb.and %10, %18 : i1
        %20 = comb.mux %19, %c-1_i3_13, %17 : i3
        %21 = comb.xor %19, %true : i1
        %22 = comb.icmp ne %20, %c-1_i3_13 : i3
        %23 = comb.and %10, %22 : i1
        %true_14 = hw.constant true
        %24 = comb.xor %15, %true_14 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %19, %true_16 : i1
        %27 = comb.and %26, %25, %24, %8 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %29 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %30 = comb.xor %19, %true_19 : i1
        %31 = comb.and %30, %29, %15, %5, %28, %11 : i1
        %32 = comb.or %27, %31 : i1
        %33 = comb.and %23, %32 : i1
        %true_20 = hw.constant true
        %34 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %35 = comb.xor %19, %true_21 : i1
        %36 = comb.and %23, %35, %34, %15, %5, %cpha_q, %11 : i1
        verif.assert %14 : i1
        %37 = comb.and %arg15, %21, %15, %7 : i1
        %38 = comb.mux %37, %arg12, %cpha_q : i1
        %39 = comb.mux %37, %arg3, %cmd_wr_en_q : i1
        %40 = comb.xor %38, %true : i1
        %41 = comb.mux %40, %33, %36 : i1
        %42 = comb.and %41, %39, %0 : i1
        %43 = comb.or %42, %19 : i1
        %44 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2 = hw.constant 0 : i2
        %45 = comb.icmp eq %44, %c0_i2 : i2
        %true_22 = hw.constant true
        %46 = comb.xor %5, %true_22 : i1
        %true_23 = hw.constant true
        %47 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %48 = comb.xor %43, %true_24 : i1
        %49 = comb.and %48, %47, %15, %46, %45 : i1
        fsm.return %49
      } action {
        %true = hw.constant true
        fsm.update %_sh1_10, %true : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i4 = hw.constant -1 : i4
        %true_14 = hw.constant true
        %0 = comb.xor %arg15, %true_14 : i1
        %false_15 = hw.constant false
        %1 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %2 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %3 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %4 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %5 = comb.and %cmd_wr_en_q, %2 : i1
        %6 = comb.or %5, %cmd_wr_en_last_bit : i1
        %7 = comb.xor %isFirstCycle, %true_14 : i1
        %8 = comb.and %7, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %9 = comb.xor %8, %true_14 : i1
        verif.assert %9 : i1
        fsm.update %_sh1_8, %0 : i1
        fsm.update %_sh1_6, %1 : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %6 : i1
        %false_16 = hw.constant false
        %10 = comb.mux %arg15, %csntrail_q, %c0_i4 : i4
        %11 = comb.and %4, %0 : i1
        %12 = comb.mux %11, %3, %10 : i4
        fsm.update %u_sck_flop2Fq_o, %cpol_q : i1
        fsm.update %wait_cntr_q, %12 : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %bit_cntr_q : i3
        fsm.update %clk_cntr_q, %clk_cntr_q : i16
        %true_17 = hw.constant true
        %13 = comb.mux bin %arg15, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        fsm.update %_sh1_12, %true_17 : i1
        fsm.update %csb_q, %csid_q : i1
        fsm.update %sample_en_q2, %sample_en_q : i1
        fsm.update %sample_en_q, %false_16 : i1
        fsm.update %segment_rd_en_cpha1, %13 : i1
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
      }
      fsm.transition @state_3 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %c-1_i3_13 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.xor %isFirstCycle, %true : i1
        %13 = comb.and %12, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %arg1, %10 : i1
        %16 = comb.mux %15, %6, %9 : i3
        %17 = comb.mux %arg18, %c0_i3, %16 : i3
        %18 = comb.xor %arg1, %true : i1
        %19 = comb.and %10, %18 : i1
        %20 = comb.mux %19, %c-1_i3_13, %17 : i3
        %21 = comb.xor %19, %true : i1
        %22 = comb.icmp ne %20, %c-1_i3_13 : i3
        %23 = comb.and %10, %22 : i1
        %true_14 = hw.constant true
        %24 = comb.xor %15, %true_14 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %19, %true_16 : i1
        %27 = comb.and %26, %25, %24, %8 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %29 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %30 = comb.xor %19, %true_19 : i1
        %31 = comb.and %30, %29, %15, %5, %28, %11 : i1
        %32 = comb.or %27, %31 : i1
        %33 = comb.and %23, %32 : i1
        %true_20 = hw.constant true
        %34 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %35 = comb.xor %19, %true_21 : i1
        %36 = comb.and %23, %35, %34, %15, %5, %cpha_q, %11 : i1
        verif.assert %14 : i1
        %37 = comb.and %arg15, %21, %15, %7 : i1
        %38 = comb.mux %37, %arg12, %cpha_q : i1
        %39 = comb.mux %37, %arg3, %cmd_wr_en_q : i1
        %40 = comb.xor %38, %true : i1
        %41 = comb.mux %40, %33, %36 : i1
        %42 = comb.and %41, %39, %0 : i1
        %43 = comb.or %42, %19 : i1
        %true_22 = hw.constant true
        %44 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %45 = comb.xor %43, %true_23 : i1
        %46 = comb.and %45, %44, %15, %5, %cpha_q : i1
        fsm.return %46
      } action {
        %true = hw.constant true
        %true_13 = hw.constant true
        fsm.update %_sh1_10, %true : i1
        %false_14 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %true_15 = hw.constant true
        %0 = comb.xor %arg16, %true_15 : i1
        %false_16 = hw.constant false
        %false_17 = hw.constant false
        %1 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %2 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %3 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %4 = comb.icmp eq %arg2, %c0_i2 : i2
        %5 = comb.icmp eq %arg2, %c1_i2 : i2
        %6 = comb.icmp eq %arg2, %c-2_i2 : i2
        %7 = comb.and %cmd_wr_en_q, %2 : i1
        %8 = comb.or %7, %cmd_wr_en_last_bit : i1
        %9 = comb.xor %isFirstCycle, %true_15 : i1
        %10 = comb.and %9, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %11 = comb.xor %10, %true_15 : i1
        verif.assert %11 : i1
        fsm.update %_sh1_8, %false_16 : i1
        fsm.update %_sh1_6, %1 : i1
        fsm.update %_sh1, %false_17 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        fsm.update %cmd_wr_en_last_bit, %8 : i1
        %12 = comb.and %arg12, %2 : i1
        %13 = comb.and %arg12, %3 : i1
        %14 = comb.xor %arg4, %true_15 : i1
        %15 = comb.xor %arg3, %true_15 : i1
        %16 = comb.and %14, %15 : i1
        %17 = comb.mux %6, %c-4_i3, %c1_i3 : i3
        %18 = comb.xor %16, %true_15 : i1
        %19 = comb.xor %4, %true_15 : i1
        %20 = comb.and %19, %18, %5 : i1
        %21 = comb.mux %20, %c2_i3, %17 : i3
        %22 = comb.mux %20, %c-2_i3, %17 : i3
        %23 = comb.and %18, %4 : i1
        %24 = comb.mux %23, %c1_i3, %21 : i3
        %25 = comb.mux %23, %c-1_i3, %22 : i3
        %26 = comb.mux %16, %c0_i3, %24 : i3
        %27 = comb.mux %16, %c0_i3, %25 : i3
        %28 = comb.sub %bit_cntr_q, %26 : i3
        %29 = comb.mux %13, %28, %bit_cntr_q : i3
        %30 = comb.mux %12, %27, %29 : i3
        %true_18 = hw.constant true
        %31 = comb.xor %arg13, %true_18 : i1
        %32 = comb.and %12, %arg3, %0 : i1
        %33 = comb.mux %32, %clk_cntr_q, %arg7 : i16
        %34 = comb.mux %32, %bit_cntr_q, %30 : i3
        %35 = comb.mux %32, %byte_cntr_cpha0_q, %arg5 : i20
        %36 = comb.mux %32, %byte_cntr_cpha1_q, %arg5 : i20
        %37 = comb.mux %32, %wait_cntr_q, %c0_i4 : i4
        %38 = comb.mux bin %32, %u_sck_flop2Fq_o, %31 : i1
        fsm.update %u_sck_flop2Fq_o, %38 : i1
        fsm.update %wait_cntr_q, %37 : i4
        fsm.update %byte_cntr_cpha1_q, %36 : i20
        fsm.update %byte_cntr_cpha0_q, %35 : i20
        fsm.update %bit_cntr_q, %34 : i3
        fsm.update %clk_cntr_q, %33 : i16
        %39 = comb.xor %32, %true_15 : i1
        %40 = comb.and %13, %39 : i1
        %41 = comb.mux %39, %arg14, %csid_q : i1
        %42 = comb.mux %39, %arg13, %cpol_q : i1
        %43 = comb.or %32, %arg12 : i1
        %44 = comb.mux %39, %arg11, %full_cyc_q : i1
        %45 = comb.mux %39, %arg8, %csnidle_q : i4
        %46 = comb.mux %39, %arg9, %csnlead_q : i4
        %47 = comb.mux %39, %arg10, %csntrail_q : i4
        %48 = comb.mux %39, %arg7, %clkdiv_q : i16
        %49 = comb.mux %39, %arg6, %csaat_q : i1
        %50 = comb.mux %39, %arg3, %cmd_wr_en_q : i1
        %51 = comb.mux %39, %arg4, %cmd_rd_en_q : i1
        %52 = comb.mux %39, %arg2, %cmd_speed_q : i2
        %53 = comb.mux bin %32, %segment_rd_en_cpha1, %cmd_rd_en_q : i1
        %54 = comb.or %12, %40 : i1
        %55 = comb.mux %39, %54, %sample_en_q : i1
        %56 = comb.mux %39, %sample_en_q, %sample_en_q2 : i1
        %57 = comb.and %32, %csb_q : i1
        %58 = comb.or %arg14, %57 : i1
        fsm.update %_sh1_12, %39 : i1
        fsm.update %csb_q, %58 : i1
        fsm.update %sample_en_q2, %56 : i1
        fsm.update %sample_en_q, %55 : i1
        fsm.update %segment_rd_en_cpha1, %53 : i1
        fsm.update %cmd_speed_q, %52 : i2
        fsm.update %cmd_wr_en_q, %50 : i1
        fsm.update %cmd_rd_en_q, %51 : i1
        fsm.update %csaat_q, %49 : i1
        fsm.update %clkdiv_q, %48 : i16
        fsm.update %csntrail_q, %47 : i4
        fsm.update %csnlead_q, %46 : i4
        fsm.update %csnidle_q, %45 : i4
        fsm.update %full_cyc_q, %44 : i1
        fsm.update %true_13, %43 : i1
        fsm.update %cpol_q, %42 : i1
        fsm.update %csid_q, %41 : i1
      }
      fsm.transition @state_2 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %c-1_i3_13 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.xor %isFirstCycle, %true : i1
        %13 = comb.and %12, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %arg1, %10 : i1
        %16 = comb.mux %15, %6, %9 : i3
        %17 = comb.mux %arg18, %c0_i3, %16 : i3
        %18 = comb.xor %arg1, %true : i1
        %19 = comb.and %10, %18 : i1
        %20 = comb.mux %19, %c-1_i3_13, %17 : i3
        %21 = comb.xor %19, %true : i1
        %22 = comb.icmp ne %20, %c-1_i3_13 : i3
        %23 = comb.and %10, %22 : i1
        %true_14 = hw.constant true
        %24 = comb.xor %15, %true_14 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %19, %true_16 : i1
        %27 = comb.and %26, %25, %24, %8 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %29 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %30 = comb.xor %19, %true_19 : i1
        %31 = comb.and %30, %29, %15, %5, %28, %11 : i1
        %32 = comb.or %27, %31 : i1
        %33 = comb.and %23, %32 : i1
        %true_20 = hw.constant true
        %34 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %35 = comb.xor %19, %true_21 : i1
        %36 = comb.and %23, %35, %34, %15, %5, %cpha_q, %11 : i1
        verif.assert %14 : i1
        %37 = comb.and %arg15, %21, %15, %7 : i1
        %38 = comb.mux %37, %arg12, %cpha_q : i1
        %39 = comb.mux %37, %arg3, %cmd_wr_en_q : i1
        %40 = comb.xor %38, %true : i1
        %41 = comb.mux %40, %33, %36 : i1
        %42 = comb.and %41, %39, %0 : i1
        %43 = comb.or %42, %19 : i1
        %true_22 = hw.constant true
        %44 = comb.xor %cpha_q, %true_22 : i1
        %true_23 = hw.constant true
        %45 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %46 = comb.xor %43, %true_24 : i1
        %47 = comb.and %46, %45, %15, %5, %44 : i1
        fsm.return %47
      } action {
        %true = hw.constant true
        %false_13 = hw.constant false
        fsm.update %_sh1_10, %true : i1
        %false_14 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %true_15 = hw.constant true
        %0 = comb.xor %arg16, %true_15 : i1
        %false_16 = hw.constant false
        %false_17 = hw.constant false
        %1 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %2 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %3 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %4 = comb.icmp eq %arg2, %c0_i2 : i2
        %5 = comb.icmp eq %arg2, %c1_i2 : i2
        %6 = comb.icmp eq %arg2, %c-2_i2 : i2
        %7 = comb.and %cmd_wr_en_q, %2 : i1
        %8 = comb.or %7, %cmd_wr_en_last_bit : i1
        %9 = comb.xor %isFirstCycle, %true_15 : i1
        %10 = comb.and %9, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %11 = comb.xor %10, %true_15 : i1
        verif.assert %11 : i1
        fsm.update %_sh1_8, %false_16 : i1
        fsm.update %_sh1_6, %1 : i1
        fsm.update %_sh1, %false_17 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        fsm.update %cmd_wr_en_last_bit, %8 : i1
        %12 = comb.xor %arg12, %true_15 : i1
        %13 = comb.and %12, %2 : i1
        %14 = comb.and %12, %3 : i1
        %15 = comb.xor %arg4, %true_15 : i1
        %16 = comb.xor %arg3, %true_15 : i1
        %17 = comb.and %15, %16 : i1
        %18 = comb.mux %6, %c-4_i3, %c1_i3 : i3
        %19 = comb.xor %17, %true_15 : i1
        %20 = comb.xor %4, %true_15 : i1
        %21 = comb.and %20, %19, %5 : i1
        %22 = comb.mux %21, %c2_i3, %18 : i3
        %23 = comb.mux %21, %c-2_i3, %18 : i3
        %24 = comb.and %19, %4 : i1
        %25 = comb.mux %24, %c1_i3, %22 : i3
        %26 = comb.mux %24, %c-1_i3, %23 : i3
        %27 = comb.mux %17, %c0_i3, %25 : i3
        %28 = comb.mux %17, %c0_i3, %26 : i3
        %29 = comb.sub %bit_cntr_q, %27 : i3
        %30 = comb.mux %14, %29, %bit_cntr_q : i3
        %31 = comb.mux %13, %28, %30 : i3
        %32 = comb.and %13, %arg3, %0 : i1
        %33 = comb.mux %32, %clk_cntr_q, %arg7 : i16
        %34 = comb.mux %32, %bit_cntr_q, %31 : i3
        %35 = comb.mux %32, %byte_cntr_cpha0_q, %arg5 : i20
        %36 = comb.mux %32, %byte_cntr_cpha1_q, %arg5 : i20
        %37 = comb.mux %32, %wait_cntr_q, %c0_i4 : i4
        %38 = comb.mux bin %32, %u_sck_flop2Fq_o, %arg13 : i1
        fsm.update %u_sck_flop2Fq_o, %38 : i1
        fsm.update %wait_cntr_q, %37 : i4
        fsm.update %byte_cntr_cpha1_q, %36 : i20
        fsm.update %byte_cntr_cpha0_q, %35 : i20
        fsm.update %bit_cntr_q, %34 : i3
        fsm.update %clk_cntr_q, %33 : i16
        %39 = comb.xor %32, %true_15 : i1
        %40 = comb.and %14, %39 : i1
        %41 = comb.mux %39, %arg14, %csid_q : i1
        %42 = comb.mux %39, %arg13, %cpol_q : i1
        %43 = comb.and %39, %arg12 : i1
        %44 = comb.mux %39, %arg11, %full_cyc_q : i1
        %45 = comb.mux %39, %arg8, %csnidle_q : i4
        %46 = comb.mux %39, %arg9, %csnlead_q : i4
        %47 = comb.mux %39, %arg10, %csntrail_q : i4
        %48 = comb.mux %39, %arg7, %clkdiv_q : i16
        %49 = comb.mux %39, %arg6, %csaat_q : i1
        %50 = comb.mux %39, %arg3, %cmd_wr_en_q : i1
        %51 = comb.mux %39, %arg4, %cmd_rd_en_q : i1
        %52 = comb.mux %39, %arg2, %cmd_speed_q : i2
        %53 = comb.mux bin %32, %segment_rd_en_cpha1, %cmd_rd_en_q : i1
        %54 = comb.or %13, %40 : i1
        %55 = comb.mux %39, %54, %sample_en_q : i1
        %56 = comb.mux %39, %sample_en_q, %sample_en_q2 : i1
        %57 = comb.and %32, %csb_q : i1
        %58 = comb.or %arg14, %57 : i1
        fsm.update %_sh1_12, %39 : i1
        fsm.update %csb_q, %58 : i1
        fsm.update %sample_en_q2, %56 : i1
        fsm.update %sample_en_q, %55 : i1
        fsm.update %segment_rd_en_cpha1, %53 : i1
        fsm.update %cmd_speed_q, %52 : i2
        fsm.update %cmd_wr_en_q, %50 : i1
        fsm.update %cmd_rd_en_q, %51 : i1
        fsm.update %csaat_q, %49 : i1
        fsm.update %clkdiv_q, %48 : i16
        fsm.update %csntrail_q, %47 : i4
        fsm.update %csnlead_q, %46 : i4
        fsm.update %csnidle_q, %45 : i4
        fsm.update %full_cyc_q, %44 : i1
        fsm.update %false_13, %43 : i1
        fsm.update %cpol_q, %42 : i1
        fsm.update %csid_q, %41 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.xor %arg16, %true : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %c-1_i3_13 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.xor %isFirstCycle, %true : i1
        %13 = comb.and %12, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %10 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %arg1, %10 : i1
        %16 = comb.mux %15, %6, %9 : i3
        %17 = comb.mux %arg18, %c0_i3, %16 : i3
        %18 = comb.xor %arg1, %true : i1
        %19 = comb.and %10, %18 : i1
        %20 = comb.mux %19, %c-1_i3_13, %17 : i3
        %21 = comb.xor %19, %true : i1
        %22 = comb.icmp ne %20, %c-1_i3_13 : i3
        %23 = comb.and %10, %22 : i1
        %true_14 = hw.constant true
        %24 = comb.xor %15, %true_14 : i1
        %true_15 = hw.constant true
        %25 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %26 = comb.xor %19, %true_16 : i1
        %27 = comb.and %26, %25, %24, %8 : i1
        %true_17 = hw.constant true
        %28 = comb.xor %cpha_q, %true_17 : i1
        %true_18 = hw.constant true
        %29 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %30 = comb.xor %19, %true_19 : i1
        %31 = comb.and %30, %29, %15, %5, %28, %11 : i1
        %32 = comb.or %27, %31 : i1
        %33 = comb.and %23, %32 : i1
        %true_20 = hw.constant true
        %34 = comb.xor %arg18, %true_20 : i1
        %true_21 = hw.constant true
        %35 = comb.xor %19, %true_21 : i1
        %36 = comb.and %23, %35, %34, %15, %5, %cpha_q, %11 : i1
        verif.assert %14 : i1
        %37 = comb.and %arg15, %21, %15, %7 : i1
        %38 = comb.mux %37, %arg12, %cpha_q : i1
        %39 = comb.mux %37, %arg3, %cmd_wr_en_q : i1
        %40 = comb.xor %38, %true : i1
        %41 = comb.mux %40, %33, %36 : i1
        %42 = comb.and %41, %39, %0 : i1
        %43 = comb.or %42, %19 : i1
        %true_22 = hw.constant true
        %44 = comb.xor %15, %true_22 : i1
        %true_23 = hw.constant true
        %45 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %46 = comb.xor %43, %true_24 : i1
        %47 = comb.and %46, %45, %44, %8 : i1
        fsm.return %47
      } action {
        %true = hw.constant true
        fsm.update %_sh1_10, %arg1 : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c2_i3 = hw.constant 2 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %true_14 = hw.constant true
        %0 = comb.xor %arg16, %true_14 : i1
        %1 = comb.concat %c1_i2, %cpha_q : i2, i1
        %2 = comb.xor %arg15, %true_14 : i1
        %3 = comb.mux %2, %c-1_i3, %c-4_i3 : i3
        %4 = comb.icmp eq %arg14, %csid_q : i1
        %5 = comb.and %4, %arg15 : i1
        %6 = comb.mux %5, %1, %3 : i3
        %7 = comb.or %5, %2 : i1
        %false_15 = hw.constant false
        %8 = comb.mux %arg1, %6, %c1_i3 : i3
        %9 = comb.xor %arg1, %true_14 : i1
        %c-1_i3_16 = hw.constant -1 : i3
        %true_17 = hw.constant true
        %10 = comb.xor %cpha_q, %true_17 : i1
        %11 = comb.and %arg1, %5, %10 : i1
        %12 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %13 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %14 = comb.and %arg1, %5, %cpha_q : i1
        %15 = comb.icmp eq %arg2, %c0_i2 : i2
        %16 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %17 = comb.icmp eq %arg2, %c1_i2 : i2
        %18 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %19 = comb.icmp eq %arg2, %c-2_i2 : i2
        %20 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %21 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_18 = hw.constant 0 : i2
        %22 = comb.icmp eq %21, %c0_i2_18 : i2
        %true_19 = hw.constant true
        %23 = comb.xor %5, %true_19 : i1
        %24 = comb.and %arg1, %23, %22 : i1
        %25 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_20 = hw.constant 1 : i2
        %26 = comb.icmp eq %25, %c1_i2_20 : i2
        %true_21 = hw.constant true
        %27 = comb.xor %5, %true_21 : i1
        %28 = comb.and %arg1, %27, %26 : i1
        %29 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_22 = hw.constant -2 : i2
        %30 = comb.icmp eq %29, %c-2_i2_22 : i2
        %true_23 = hw.constant true
        %31 = comb.xor %5, %true_23 : i1
        %32 = comb.xor %24, %true_14 : i1
        %33 = comb.xor %28, %true_14 : i1
        %34 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2 = hw.constant -1 : i2
        %35 = comb.icmp eq %34, %c-1_i2 : i2
        %true_24 = hw.constant true
        %36 = comb.xor %5, %true_24 : i1
        %37 = comb.and %arg1, %36, %35 : i1
        %38 = comb.or %9, %37 : i1
        %39 = comb.xor %11, %true_14 : i1
        %40 = comb.xor %14, %true_14 : i1
        %41 = comb.and %40, %39, %38 : i1
        %42 = comb.xor %41, %true_14 : i1
        %43 = comb.and %39, %14 : i1
        %44 = comb.xor %43, %true_14 : i1
        %45 = comb.xor %11, %true_14 : i1
        %46 = comb.and %cmd_wr_en_q, %12 : i1
        %47 = comb.or %46, %cmd_wr_en_last_bit : i1
        %48 = comb.xor %isFirstCycle, %true_14 : i1
        %49 = comb.and %48, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %50 = comb.xor %49, %true_14 : i1
        verif.assert %50 : i1
        fsm.update %_sh1_8, %2 : i1
        fsm.update %_sh1_6, %true : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %47 : i1
        %51 = comb.and %arg15, %arg1, %7 : i1
        %52 = comb.mux %51, %arg14, %csid_q : i1
        %53 = comb.mux %51, %arg13, %cpol_q : i1
        %54 = comb.mux %51, %arg12, %cpha_q : i1
        %55 = comb.mux %51, %arg8, %csnidle_q : i4
        %56 = comb.mux %51, %arg10, %csntrail_q : i4
        %57 = comb.mux %51, %arg3, %cmd_wr_en_q : i1
        %58 = comb.mux %51, %arg4, %cmd_rd_en_q : i1
        %59 = comb.mux %9, %c-1_i3_16, %8 : i3
        %60 = comb.icmp ne %59, %c-1_i3_16 : i3
        %61 = comb.and %60, %11, %12 : i1
        %62 = comb.and %60, %11, %13 : i1
        %63 = comb.and %60, %14, %12 : i1
        %64 = comb.and %60, %14, %13 : i1
        %65 = comb.xor %54, %true_14 : i1
        %66 = comb.mux %65, %61, %63 : i1
        %67 = comb.mux %65, %62, %64 : i1
        %68 = comb.xor %58, %true_14 : i1
        %69 = comb.xor %57, %true_14 : i1
        %70 = comb.and %68, %69 : i1
        %71 = comb.mux %51, %15, %16 : i1
        %72 = comb.mux %51, %17, %18 : i1
        %73 = comb.mux %51, %19, %20 : i1
        %74 = comb.mux %73, %c-4_i3, %c1_i3 : i3
        %75 = comb.xor %70, %true_14 : i1
        %76 = comb.xor %71, %true_14 : i1
        %77 = comb.and %76, %75, %72 : i1
        %78 = comb.mux %77, %c2_i3, %74 : i3
        %79 = comb.mux %77, %c-2_i3, %74 : i3
        %80 = comb.and %75, %71 : i1
        %81 = comb.mux %80, %c1_i3, %78 : i3
        %82 = comb.mux %80, %c-1_i3, %79 : i3
        %83 = comb.mux %70, %c0_i3, %81 : i3
        %84 = comb.mux %70, %c0_i3, %82 : i3
        %85 = comb.sub %bit_cntr_q, %83 : i3
        %86 = comb.mux %67, %85, %bit_cntr_q : i3
        %87 = comb.mux %66, %84, %86 : i3
        %88 = comb.and %60, %arg1 : i1
        %89 = comb.and %32, %88 : i1
        %90 = comb.and %33, %89, %31, %30 : i1
        %91 = comb.and %89, %28 : i1
        %92 = comb.or %91, %90 : i1
        %93 = comb.mux %92, %55, %c0_i4 : i4
        %94 = comb.and %88, %24 : i1
        %95 = comb.mux %94, %56, %93 : i4
        %96 = comb.icmp ne %59, %c-4_i3 : i3
        %97 = comb.and %45, %44, %42, %96 : i1
        %98 = comb.icmp ne %59, %c3_i3 : i3
        %99 = comb.mux %53, %98, %14 : i1
        %100 = comb.and %66, %57, %0 : i1
        %true_25 = hw.constant true
        %101 = comb.xor %51, %true_25 : i1
        %102 = comb.or %100, %101 : i1
        %103 = comb.mux %102, %clk_cntr_q, %arg7 : i16
        %104 = comb.or %100, %9 : i1
        %105 = comb.mux %104, %bit_cntr_q, %87 : i3
        %true_26 = hw.constant true
        %106 = comb.xor %51, %true_26 : i1
        %107 = comb.or %100, %106 : i1
        %108 = comb.mux %107, %byte_cntr_cpha0_q, %arg5 : i20
        %true_27 = hw.constant true
        %109 = comb.xor %51, %true_27 : i1
        %110 = comb.or %100, %109 : i1
        %111 = comb.mux %110, %byte_cntr_cpha1_q, %arg5 : i20
        %true_28 = hw.constant true
        %112 = comb.xor %arg1, %true_28 : i1
        %113 = comb.or %100, %112 : i1
        %114 = comb.mux %113, %wait_cntr_q, %95 : i4
        %115 = comb.mux bin %100, %u_sck_flop2Fq_o, %99 : i1
        fsm.update %u_sck_flop2Fq_o, %115 : i1
        fsm.update %wait_cntr_q, %114 : i4
        fsm.update %byte_cntr_cpha1_q, %111 : i20
        fsm.update %byte_cntr_cpha0_q, %108 : i20
        fsm.update %bit_cntr_q, %105 : i3
        fsm.update %clk_cntr_q, %103 : i16
        %116 = comb.xor %100, %true_14 : i1
        %117 = comb.and %67, %116 : i1
        %118 = comb.and %51, %116 : i1
        %119 = comb.mux %118, %arg14, %csid_q : i1
        %120 = comb.mux %118, %arg13, %cpol_q : i1
        %121 = comb.mux %118, %arg12, %cpha_q : i1
        %122 = comb.mux %118, %arg11, %full_cyc_q : i1
        %123 = comb.mux %118, %arg8, %csnidle_q : i4
        %124 = comb.mux %118, %arg9, %csnlead_q : i4
        %125 = comb.mux %118, %arg10, %csntrail_q : i4
        %126 = comb.mux %118, %arg7, %clkdiv_q : i16
        %127 = comb.mux %118, %arg6, %csaat_q : i1
        %128 = comb.mux %118, %arg3, %cmd_wr_en_q : i1
        %129 = comb.mux %118, %arg4, %cmd_rd_en_q : i1
        %130 = comb.mux %118, %arg2, %cmd_speed_q : i2
        %131 = comb.and %60, %116 : i1
        %132 = comb.mux bin %131, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %133 = comb.or %66, %117 : i1
        %134 = comb.and %arg1, %116 : i1
        %135 = comb.mux %134, %133, %sample_en_q : i1
        %136 = comb.mux %134, %sample_en_q, %sample_en_q2 : i1
        %137 = comb.mux %116, %97, %csb_q : i1
        %138 = comb.or %52, %137 : i1
        fsm.update %_sh1_12, %116 : i1
        fsm.update %csb_q, %138 : i1
        fsm.update %sample_en_q2, %136 : i1
        fsm.update %sample_en_q, %135 : i1
        fsm.update %segment_rd_en_cpha1, %132 : i1
        fsm.update %cmd_speed_q, %130 : i2
        fsm.update %cmd_wr_en_q, %128 : i1
        fsm.update %cmd_rd_en_q, %129 : i1
        fsm.update %csaat_q, %127 : i1
        fsm.update %clkdiv_q, %126 : i16
        fsm.update %csntrail_q, %125 : i4
        fsm.update %csnlead_q, %124 : i4
        fsm.update %csnidle_q, %123 : i4
        fsm.update %full_cyc_q, %122 : i1
        fsm.update %cpha_q, %121 : i1
        fsm.update %cpol_q, %120 : i1
        fsm.update %csid_q, %119 : i1
      }
    }
    fsm.state @state_4 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i16 = hw.constant 0 : i16
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %true = hw.constant true
      %false_13 = hw.constant false
      %false_14 = hw.constant false
      %true_15 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %false_16 = hw.constant false
      %2 = comb.and %arg1, %0 : i1
      %3 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %4 = comb.mux %3, %c1_i3, %c-2_i3 : i3
      %5 = comb.xor %arg18, %true : i1
      %6 = comb.and %2, %5 : i1
      %7 = comb.xor %2, %true : i1
      %8 = comb.and %5, %7 : i1
      %c-4_i3 = hw.constant -4 : i3
      %9 = comb.xor %cpha_q, %true : i1
      %false_17 = hw.constant false
      %10 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %11 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %12 = comb.mux %9, %10, %11 : i1
      %13 = comb.or %arg18, %12 : i1
      %14 = comb.mux %full_cyc_q, %sample_en_q2, %sample_en_q : i1
      %15 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %16 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %17 = comb.concat %c0_i3, %16 : i3, i1
      %18 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %19 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %20 = comb.concat %c0_i2, %19 : i2, i2
      %21 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %22 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %23 = comb.xor %csb_q, %true : i1
      %24 = comb.xor %15, %true : i1
      %25 = comb.and %24, %23 : i1
      %26 = comb.xor %18, %true : i1
      %27 = comb.and %21, %26, %25 : i1
      %28 = comb.mux %27, %22, %c0_i4 : i4
      %29 = comb.and %18, %25 : i1
      %30 = comb.mux %29, %20, %28 : i4
      %31 = comb.and %15, %23 : i1
      %32 = comb.mux %31, %17, %30 : i4
      %33 = comb.xor %isFirstCycle, %true : i1
      %34 = comb.and %33, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %5 : i1
      %35 = comb.xor %34, %true : i1
      verif.assert %35 : i1
      %c-2_i2_18 = hw.constant -2 : i2
      %36 = comb.concat %c-2_i2_18, %3 : i2, i1
      %37 = comb.mux %6, %36, %4 : i3
      %38 = comb.mux %arg18, %c0_i3, %37 : i3
      %39 = comb.mux %8, %c-4_i3, %38 : i3
      %40 = comb.icmp ne %39, %c-4_i3 : i3
      %true_19 = hw.constant true
      %41 = comb.xor %6, %true_19 : i1
      %true_20 = hw.constant true
      %42 = comb.xor %arg18, %true_20 : i1
      %true_21 = hw.constant true
      %43 = comb.xor %8, %true_21 : i1
      %44 = comb.and %9, %5, %40, %43, %42, %41, %3, %cmd_wr_en_q : i1
      %45 = comb.and %44, %1 : i1
      %46 = comb.xor %45, %true : i1
      %47 = comb.and %44, %46 : i1
      %48 = comb.and %14, %46 : i1
      %false_22 = hw.constant false
      %49 = comb.and %13, %47, %arg16 : i1
      fsm.output %false_14, %u_sck_flop2Fq_o, %csb_q, %32, %false_17, %49, %47, %false_13, %48, %false_22, %cmd_speed_q, %full_cyc_q, %false_16, %45, %true_15 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.and %arg1, %0 : i1
        %9 = comb.and %8, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %10 = comb.concat %c-2_i2, %2 : i2, i1
        %11 = comb.mux %9, %10, %3 : i3
        %12 = comb.mux %arg18, %c0_i3, %11 : i3
        %13 = comb.xor %8, %true : i1
        %14 = comb.and %4, %13 : i1
        %15 = comb.mux %14, %c-4_i3, %12 : i3
        %16 = comb.icmp ne %15, %c-4_i3 : i3
        %true_13 = hw.constant true
        %17 = comb.xor %9, %true_13 : i1
        %true_14 = hw.constant true
        %18 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %19 = comb.xor %14, %true_15 : i1
        verif.assert %7 : i1
        %20 = comb.xor %cpha_q, %true : i1
        %21 = comb.and %20, %4, %16, %19, %18, %17, %2, %cmd_wr_en_q, %1 : i1
        %22 = comb.or %21, %14 : i1
        %true_16 = hw.constant true
        %23 = comb.xor %2, %true_16 : i1
        %true_17 = hw.constant true
        %24 = comb.xor %9, %true_17 : i1
        %true_18 = hw.constant true
        %25 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %26 = comb.xor %22, %true_19 : i1
        %27 = comb.and %26, %25, %24, %23 : i1
        fsm.return %27
      } action {
        %false_13 = hw.constant false
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_14 = hw.constant false
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.mux %1, %clkdiv_q, %2 : i16
        %4 = comb.mux %0, %clk_cntr_q, %3 : i16
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.xor %arg15, %true : i1
        %false_15 = hw.constant false
        %7 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %8 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %9 = comb.and %cmd_wr_en_q, %7 : i1
        %10 = comb.or %9, %cmd_wr_en_last_bit : i1
        %11 = comb.xor %isFirstCycle, %true : i1
        %12 = comb.and %11, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %13 = comb.xor %12, %true : i1
        verif.assert %13 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %6 : i1
        fsm.update %_sh1_6, %false_13 : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        fsm.update %cmd_wr_en_last_bit, %10 : i1
        %14 = comb.mux %5, %8, %wait_cntr_q : i4
        fsm.update %u_sck_flop2Fq_o, %cpol_q : i1
        fsm.update %wait_cntr_q, %14 : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %bit_cntr_q : i3
        fsm.update %clk_cntr_q, %4 : i16
        %true_16 = hw.constant true
        %true_17 = hw.constant true
        %15 = comb.xor %5, %true_17 : i1
        %16 = comb.and %15, %sample_en_q : i1
        %17 = comb.mux %5, %sample_en_q, %sample_en_q2 : i1
        fsm.update %_sh1_12, %true_16 : i1
        fsm.update %csb_q, %csid_q : i1
        fsm.update %sample_en_q2, %17 : i1
        fsm.update %sample_en_q, %16 : i1
        fsm.update %segment_rd_en_cpha1, %segment_rd_en_cpha1 : i1
      }
      fsm.transition @state_5 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.and %arg1, %0 : i1
        %9 = comb.and %8, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %10 = comb.concat %c-2_i2, %2 : i2, i1
        %11 = comb.mux %9, %10, %3 : i3
        %12 = comb.mux %arg18, %c0_i3, %11 : i3
        %13 = comb.xor %8, %true : i1
        %14 = comb.and %4, %13 : i1
        %15 = comb.mux %14, %c-4_i3, %12 : i3
        %16 = comb.icmp ne %15, %c-4_i3 : i3
        %true_13 = hw.constant true
        %17 = comb.xor %9, %true_13 : i1
        %true_14 = hw.constant true
        %18 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %19 = comb.xor %14, %true_15 : i1
        verif.assert %7 : i1
        %20 = comb.xor %cpha_q, %true : i1
        %21 = comb.and %20, %4, %16, %19, %18, %17, %2, %cmd_wr_en_q, %1 : i1
        %22 = comb.or %21, %14 : i1
        %true_16 = hw.constant true
        %23 = comb.xor %arg18, %true_16 : i1
        %true_17 = hw.constant true
        %24 = comb.xor %22, %true_17 : i1
        %25 = comb.and %24, %23, %9, %2 : i1
        fsm.return %25
      } action {
        %true = hw.constant true
        %true_13 = hw.constant true
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_14 = hw.constant false
        %c0_i3 = hw.constant 0 : i3
        %true_15 = hw.constant true
        %0 = comb.xor %arg15, %true_15 : i1
        %false_16 = hw.constant false
        %1 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %2 = comb.and %cmd_wr_en_q, %1 : i1
        %3 = comb.or %2, %cmd_wr_en_last_bit : i1
        %4 = comb.xor %isFirstCycle, %true_15 : i1
        %5 = comb.and %4, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %6 = comb.xor %5, %true_15 : i1
        verif.assert %6 : i1
        fsm.update %_sh1_10, %true : i1
        fsm.update %_sh1_8, %0 : i1
        fsm.update %_sh1_6, %true_13 : i1
        fsm.update %_sh1, %false_16 : i1
        fsm.update %isFirstCycle, %false_14 : i1
        fsm.update %cmd_wr_en_last_bit, %3 : i1
        %false_17 = hw.constant false
        fsm.update %u_sck_flop2Fq_o, %cpol_q : i1
        fsm.update %wait_cntr_q, %csnidle_q : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %bit_cntr_q : i3
        fsm.update %clk_cntr_q, %clkdiv_q : i16
        %true_18 = hw.constant true
        %true_19 = hw.constant true
        fsm.update %_sh1_12, %true_18 : i1
        fsm.update %csb_q, %true_19 : i1
        fsm.update %sample_en_q2, %sample_en_q : i1
        fsm.update %sample_en_q, %false_17 : i1
        fsm.update %segment_rd_en_cpha1, %cmd_rd_en_q : i1
      }
      fsm.transition @state_4 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.and %arg1, %0 : i1
        %9 = comb.and %8, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %10 = comb.concat %c-2_i2, %2 : i2, i1
        %11 = comb.mux %9, %10, %3 : i3
        %12 = comb.mux %arg18, %c0_i3, %11 : i3
        %13 = comb.xor %8, %true : i1
        %14 = comb.and %4, %13 : i1
        %15 = comb.mux %14, %c-4_i3, %12 : i3
        %16 = comb.icmp ne %15, %c-4_i3 : i3
        %true_13 = hw.constant true
        %17 = comb.xor %9, %true_13 : i1
        %true_14 = hw.constant true
        %18 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %19 = comb.xor %14, %true_15 : i1
        verif.assert %7 : i1
        %20 = comb.xor %cpha_q, %true : i1
        %21 = comb.and %20, %4, %16, %19, %18, %17, %2, %cmd_wr_en_q, %1 : i1
        %true_16 = hw.constant true
        %22 = comb.xor %2, %true_16 : i1
        %true_17 = hw.constant true
        %23 = comb.xor %arg18, %true_17 : i1
        %24 = comb.and %23, %9, %22 : i1
        %25 = comb.or %21, %14, %24 : i1
        fsm.return %25
      } action {
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.mux %1, %clkdiv_q, %2 : i16
        %4 = comb.mux %0, %clk_cntr_q, %3 : i16
        %5 = comb.mux %arg18, %c0_i16, %4 : i16
        %6 = comb.xor %arg16, %true : i1
        %7 = comb.and %arg1, %1 : i1
        %8 = comb.xor %arg15, %true : i1
        %false_14 = hw.constant false
        %9 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %10 = comb.mux %9, %c1_i3, %c-2_i3 : i3
        %11 = comb.xor %arg18, %true : i1
        %12 = comb.and %7, %11 : i1
        %c-2_i2_15 = hw.constant -2 : i2
        %13 = comb.concat %c-2_i2_15, %9 : i2, i1
        %14 = comb.mux %12, %13, %10 : i3
        %15 = comb.mux %arg18, %c0_i3, %14 : i3
        %16 = comb.xor %7, %true : i1
        %17 = comb.and %11, %16 : i1
        %c-4_i3_16 = hw.constant -4 : i3
        %true_17 = hw.constant true
        %18 = comb.xor %12, %true_17 : i1
        %true_18 = hw.constant true
        %19 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %20 = comb.xor %17, %true_19 : i1
        %21 = comb.and %20, %19, %18, %9 : i1
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.xor %cpha_q, %true : i1
        %24 = comb.xor %cmd_rd_en_q, %true : i1
        %25 = comb.xor %cmd_wr_en_q, %true : i1
        %26 = comb.and %24, %25 : i1
        %27 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %28 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %29 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %30 = comb.mux %29, %c-4_i3, %c1_i3 : i3
        %31 = comb.xor %26, %true : i1
        %32 = comb.xor %27, %true : i1
        %33 = comb.and %32, %31, %28 : i1
        %34 = comb.mux %33, %c-2_i3, %30 : i3
        %35 = comb.and %31, %27 : i1
        %36 = comb.mux %35, %c-1_i3, %34 : i3
        %37 = comb.mux %26, %c0_i3, %36 : i3
        %true_20 = hw.constant true
        %38 = comb.xor %9, %true_20 : i1
        %true_21 = hw.constant true
        %39 = comb.xor %arg18, %true_21 : i1
        %40 = comb.and %39, %12, %38 : i1
        %41 = comb.or %17, %40 : i1
        %true_22 = hw.constant true
        %42 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %43 = comb.xor %17, %true_23 : i1
        %44 = comb.and %43, %42, %12, %9 : i1
        %true_24 = hw.constant true
        %45 = comb.xor %9, %true_24 : i1
        %true_25 = hw.constant true
        %46 = comb.xor %12, %true_25 : i1
        %true_26 = hw.constant true
        %47 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %48 = comb.xor %17, %true_27 : i1
        %49 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %50 = comb.xor %21, %true : i1
        %51 = comb.xor %41, %true : i1
        %52 = comb.xor %44, %true : i1
        %53 = comb.or %arg18, %7 : i1
        %54 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %true_28 = hw.constant true
        %55 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %56 = comb.xor %arg18, %true_29 : i1
        %57 = comb.and %cmd_wr_en_q, %22 : i1
        %58 = comb.or %57, %cmd_wr_en_last_bit : i1
        %59 = comb.xor %isFirstCycle, %true : i1
        %60 = comb.and %59, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %11 : i1
        %61 = comb.xor %60, %true : i1
        verif.assert %61 : i1
        fsm.update %_sh1_10, %7 : i1
        fsm.update %_sh1_8, %8 : i1
        fsm.update %_sh1_6, %9 : i1
        fsm.update %_sh1, %false_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %58 : i1
        %62 = comb.mux %17, %c-4_i3_16, %15 : i3
        %63 = comb.icmp ne %62, %c-4_i3_16 : i3
        %64 = comb.and %23, %11, %63, %21 : i1
        %65 = comb.and %7, %64 : i1
        %66 = comb.mux %65, %37, %bit_cntr_q : i3
        %67 = comb.mux %arg18, %c0_i3, %66 : i3
        %68 = comb.and %63, %12 : i1
        %69 = comb.and %50, %68 : i1
        %70 = comb.and %51, %69 : i1
        %71 = comb.and %52, %70, %48, %47, %46, %45 : i1
        %72 = comb.and %70, %44 : i1
        %73 = comb.or %72, %71 : i1
        %74 = comb.mux %73, %csnidle_q, %c0_i4 : i4
        %75 = comb.and %69, %41 : i1
        %76 = comb.mux %75, %csntrail_q, %74 : i4
        %77 = comb.and %68, %21 : i1
        %78 = comb.mux %77, %csnlead_q, %76 : i4
        %79 = comb.mux %53, %78, %wait_cntr_q : i4
        %80 = comb.mux %arg18, %c0_i4, %79 : i4
        %81 = comb.xor %63, %true : i1
        %82 = comb.and %54, %81, %12 : i1
        %83 = comb.mux %82, %49, %80 : i4
        %84 = comb.icmp ne %62, %c-4_i3 : i3
        %85 = comb.and %50, %84 : i1
        %86 = comb.icmp ne %62, %c3_i3 : i3
        %87 = comb.and %cpol_q, %86 : i1
        %88 = comb.and %64, %cmd_wr_en_q, %6 : i1
        %89 = comb.mux %88, %clk_cntr_q, %5 : i16
        %90 = comb.mux %88, %bit_cntr_q, %67 : i3
        %91 = comb.or %88, %55 : i1
        %92 = comb.mux %91, %byte_cntr_cpha0_q, %c0_i20 : i20
        %93 = comb.or %88, %56 : i1
        %94 = comb.mux %93, %byte_cntr_cpha1_q, %c0_i20 : i20
        %95 = comb.mux %88, %wait_cntr_q, %83 : i4
        %96 = comb.mux bin %88, %u_sck_flop2Fq_o, %87 : i1
        fsm.update %u_sck_flop2Fq_o, %96 : i1
        fsm.update %wait_cntr_q, %95 : i4
        fsm.update %byte_cntr_cpha1_q, %94 : i20
        fsm.update %byte_cntr_cpha0_q, %92 : i20
        fsm.update %bit_cntr_q, %90 : i3
        fsm.update %clk_cntr_q, %89 : i16
        %97 = comb.xor %88, %true : i1
        %98 = comb.and %63, %97 : i1
        %99 = comb.mux bin %98, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %100 = comb.and %7, %97 : i1
        %101 = comb.mux %100, %64, %sample_en_q : i1
        %102 = comb.mux %100, %sample_en_q, %sample_en_q2 : i1
        %103 = comb.mux %97, %85, %csb_q : i1
        %104 = comb.or %csid_q, %103 : i1
        fsm.update %_sh1_12, %97 : i1
        fsm.update %csb_q, %104 : i1
        fsm.update %sample_en_q2, %102 : i1
        fsm.update %sample_en_q, %101 : i1
        fsm.update %segment_rd_en_cpha1, %99 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %4 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.and %arg1, %0 : i1
        %9 = comb.and %8, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %10 = comb.concat %c-2_i2, %2 : i2, i1
        %11 = comb.mux %9, %10, %3 : i3
        %12 = comb.mux %arg18, %c0_i3, %11 : i3
        %13 = comb.xor %8, %true : i1
        %14 = comb.and %4, %13 : i1
        %15 = comb.mux %14, %c-4_i3, %12 : i3
        %16 = comb.icmp ne %15, %c-4_i3 : i3
        %true_13 = hw.constant true
        %17 = comb.xor %9, %true_13 : i1
        %true_14 = hw.constant true
        %18 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %19 = comb.xor %14, %true_15 : i1
        verif.assert %7 : i1
        %20 = comb.xor %cpha_q, %true : i1
        %21 = comb.and %20, %4, %16, %19, %18, %17, %2, %cmd_wr_en_q, %1 : i1
        %22 = comb.or %21, %14 : i1
        %true_16 = hw.constant true
        %23 = comb.xor %9, %true_16 : i1
        %true_17 = hw.constant true
        %24 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %25 = comb.xor %22, %true_18 : i1
        %26 = comb.and %25, %24, %23, %2 : i1
        fsm.return %26
      } action {
        %true = hw.constant true
        fsm.update %cmd_speed_q, %cmd_speed_q : i2
        fsm.update %cmd_wr_en_q, %cmd_wr_en_q : i1
        fsm.update %cmd_rd_en_q, %cmd_rd_en_q : i1
        fsm.update %csaat_q, %csaat_q : i1
        fsm.update %clkdiv_q, %clkdiv_q : i16
        fsm.update %csntrail_q, %csntrail_q : i4
        fsm.update %csnlead_q, %csnlead_q : i4
        fsm.update %csnidle_q, %csnidle_q : i4
        fsm.update %full_cyc_q, %full_cyc_q : i1
        fsm.update %cpha_q, %cpha_q : i1
        fsm.update %cpol_q, %cpol_q : i1
        fsm.update %csid_q, %csid_q : i1
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-1_i16 = hw.constant -1 : i16
        %true_14 = hw.constant true
        %0 = comb.xor %arg1, %true_14 : i1
        %1 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %2 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %3 = comb.mux %1, %clkdiv_q, %2 : i16
        %4 = comb.mux %0, %clk_cntr_q, %3 : i16
        %5 = comb.and %arg1, %1 : i1
        %6 = comb.xor %arg15, %true_14 : i1
        %false_15 = hw.constant false
        %c1_i2 = hw.constant 1 : i2
        %7 = comb.concat %5, %c1_i2 : i1, i2
        %8 = comb.xor %5, %true_14 : i1
        %c-4_i3 = hw.constant -4 : i3
        %9 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %10 = comb.and %cmd_wr_en_q, %9 : i1
        %11 = comb.or %10, %cmd_wr_en_last_bit : i1
        %12 = comb.xor %isFirstCycle, %true_14 : i1
        %13 = comb.and %12, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %14 = comb.xor %13, %true_14 : i1
        verif.assert %14 : i1
        fsm.update %_sh1_10, %5 : i1
        fsm.update %_sh1_8, %6 : i1
        fsm.update %_sh1_6, %true : i1
        fsm.update %_sh1, %false_15 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %11 : i1
        %15 = comb.mux %8, %c-4_i3, %7 : i3
        %16 = comb.extract %15 from 2 : (i3) -> i1
        %17 = comb.extract %15 from 0 : (i3) -> i1
        %18 = comb.concat %16, %17 : i1, i1
        %c-2_i2 = hw.constant -2 : i2
        %19 = comb.icmp ne %18, %c-2_i2 : i2
        %20 = comb.and %19, %5 : i1
        %21 = comb.mux %20, %csnidle_q, %c0_i4 : i4
        %22 = comb.and %20, %8 : i1
        %23 = comb.mux %22, %csntrail_q, %21 : i4
        %24 = comb.mux %5, %23, %wait_cntr_q : i4
        %25 = comb.extract %15 from 2 : (i3) -> i1
        %26 = comb.extract %15 from 0 : (i3) -> i1
        %27 = comb.concat %25, %26 : i1, i1
        %c-2_i2_16 = hw.constant -2 : i2
        %28 = comb.icmp ne %27, %c-2_i2_16 : i2
        fsm.update %u_sck_flop2Fq_o, %cpol_q : i1
        fsm.update %wait_cntr_q, %24 : i4
        fsm.update %byte_cntr_cpha1_q, %byte_cntr_cpha1_q : i20
        fsm.update %byte_cntr_cpha0_q, %byte_cntr_cpha0_q : i20
        fsm.update %bit_cntr_q, %bit_cntr_q : i3
        fsm.update %clk_cntr_q, %4 : i16
        %true_17 = hw.constant true
        %29 = comb.mux bin %19, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %true_18 = hw.constant true
        %30 = comb.xor %5, %true_18 : i1
        %31 = comb.and %30, %sample_en_q : i1
        %32 = comb.mux %5, %sample_en_q, %sample_en_q2 : i1
        %33 = comb.or %csid_q, %28 : i1
        fsm.update %_sh1_12, %true_17 : i1
        fsm.update %csb_q, %33 : i1
        fsm.update %sample_en_q2, %32 : i1
        fsm.update %sample_en_q, %31 : i1
        fsm.update %segment_rd_en_cpha1, %29 : i1
      }
    }
    fsm.state @state_5 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i16 = hw.constant 0 : i16
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %true = hw.constant true
      %false_13 = hw.constant false
      %0 = comb.icmp ne %arg13, %cpol_q : i1
      %1 = comb.icmp ne %arg12, %cpha_q : i1
      %2 = comb.icmp ne %arg11, %full_cyc_q : i1
      %3 = comb.icmp ne %arg8, %csnidle_q : i4
      %4 = comb.icmp ne %arg10, %csntrail_q : i4
      %5 = comb.icmp ne %arg9, %csnlead_q : i4
      %6 = comb.icmp ne %arg7, %clkdiv_q : i16
      %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
      %true_14 = hw.constant true
      %8 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %9 = comb.xor %arg16, %true : i1
      %false_15 = hw.constant false
      %10 = comb.and %arg1, %8 : i1
      %11 = comb.mux %7, %c-2_i3, %c1_i3 : i3
      %12 = comb.mux %arg15, %11, %c0_i3 : i3
      %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %14 = comb.mux %13, %c1_i3, %c-2_i3 : i3
      %15 = comb.xor %arg18, %true : i1
      %16 = comb.and %10, %15 : i1
      %17 = comb.xor %10, %true : i1
      %18 = comb.and %15, %17 : i1
      %19 = comb.xor %18, %true : i1
      %20 = comb.and %19, %16, %13 : i1
      %c-3_i3 = hw.constant -3 : i3
      %false_16 = hw.constant false
      %21 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %22 = comb.or %cmd_wr_en_q, %cmd_wr_en_last_bit : i1
      %23 = comb.concat %c0_i3, %22 : i3, i1
      %24 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
      %25 = comb.replicate %cmd_wr_en_q : (i1) -> i2
      %26 = comb.concat %c0_i2, %25 : i2, i2
      %27 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
      %28 = comb.replicate %cmd_wr_en_q : (i1) -> i4
      %29 = comb.xor %csb_q, %true : i1
      %30 = comb.xor %21, %true : i1
      %31 = comb.and %30, %29 : i1
      %32 = comb.xor %24, %true : i1
      %33 = comb.and %27, %32, %31 : i1
      %34 = comb.mux %33, %28, %c0_i4 : i4
      %35 = comb.and %24, %31 : i1
      %36 = comb.mux %35, %26, %34 : i4
      %37 = comb.and %21, %29 : i1
      %38 = comb.mux %37, %23, %36 : i4
      %39 = comb.xor %isFirstCycle, %true : i1
      %40 = comb.and %39, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %15 : i1
      %41 = comb.xor %40, %true : i1
      verif.assert %41 : i1
      %42 = comb.and %arg15, %20 : i1
      %43 = comb.mux %42, %arg12, %cpha_q : i1
      %44 = comb.mux %42, %arg11, %full_cyc_q : i1
      %45 = comb.mux %42, %arg3, %cmd_wr_en_q : i1
      %46 = comb.mux %13, %12, %c-3_i3 : i3
      %47 = comb.mux %16, %46, %14 : i3
      %48 = comb.mux %arg18, %c0_i3, %47 : i3
      %49 = comb.mux %18, %c-3_i3, %48 : i3
      %50 = comb.icmp ne %49, %c-3_i3 : i3
      %true_17 = hw.constant true
      %51 = comb.xor %7, %true_17 : i1
      %52 = comb.and %arg15, %51 : i1
      %true_18 = hw.constant true
      %53 = comb.xor %16, %true_18 : i1
      %54 = comb.or %53, %52 : i1
      %true_19 = hw.constant true
      %55 = comb.xor %arg18, %true_19 : i1
      %true_20 = hw.constant true
      %56 = comb.xor %18, %true_20 : i1
      %57 = comb.xor %43, %true : i1
      %58 = comb.and %57, %15, %50, %56, %55, %54, %13, %45 : i1
      %59 = comb.mux %44, %sample_en_q2, %sample_en_q : i1
      %60 = comb.and %58, %9 : i1
      %61 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %62 = comb.icmp eq %arg5, %c0_i20 : i20
      %63 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %64 = comb.mux %42, %62, %63 : i1
      %65 = comb.mux %17, %61, %64 : i1
      %66 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %67 = comb.icmp eq %arg5, %c0_i20 : i20
      %68 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %69 = comb.mux %42, %67, %68 : i1
      %70 = comb.mux %17, %66, %69 : i1
      %71 = comb.mux %57, %65, %70 : i1
      %72 = comb.or %arg18, %71 : i1
      %73 = comb.xor %60, %true : i1
      %74 = comb.and %58, %73 : i1
      %75 = comb.and %59, %73 : i1
      %false_21 = hw.constant false
      %76 = comb.and %20, %73 : i1
      %77 = comb.and %72, %74, %arg16 : i1
      fsm.output %76, %u_sck_flop2Fq_o, %csb_q, %38, %false_16, %77, %74, %false_13, %75, %false_21, %cmd_speed_q, %44, %false_15, %60, %true_14 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %9 = comb.xor %arg16, %true : i1
        %10 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %11 = comb.mux %arg15, %10, %c0_i3 : i3
        %12 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %13 = comb.mux %12, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %15 = comb.xor %isFirstCycle, %true : i1
        %16 = comb.and %15, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %arg1, %8 : i1
        %19 = comb.and %18, %14 : i1
        %20 = comb.mux %12, %11, %c-3_i3 : i3
        %21 = comb.mux %19, %20, %13 : i3
        %22 = comb.mux %arg18, %c0_i3, %21 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.and %14, %23 : i1
        %25 = comb.mux %24, %c-3_i3, %22 : i3
        %26 = comb.xor %24, %true : i1
        %27 = comb.icmp ne %25, %c-3_i3 : i3
        %true_13 = hw.constant true
        %28 = comb.xor %7, %true_13 : i1
        %29 = comb.and %arg15, %28 : i1
        %true_14 = hw.constant true
        %30 = comb.xor %19, %true_14 : i1
        %31 = comb.or %30, %29 : i1
        %true_15 = hw.constant true
        %32 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %33 = comb.xor %24, %true_16 : i1
        verif.assert %17 : i1
        %34 = comb.and %arg15, %26, %19, %12 : i1
        %35 = comb.mux %34, %arg12, %cpha_q : i1
        %36 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %37 = comb.xor %35, %true : i1
        %38 = comb.and %37, %14, %27, %33, %32, %31, %12, %36, %9 : i1
        %39 = comb.or %38, %24 : i1
        %40 = comb.and %12, %arg15, %7 : i1
        %true_17 = hw.constant true
        %41 = comb.xor %12, %true_17 : i1
        %42 = comb.mux %19, %40, %41 : i1
        %true_18 = hw.constant true
        %43 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %44 = comb.xor %39, %true_19 : i1
        %45 = comb.and %44, %43, %42 : i1
        fsm.return %45
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg1, %true : i1
        %9 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %10 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %11 = comb.xor %arg16, %true : i1
        %12 = comb.and %arg1, %9 : i1
        %13 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %14 = comb.mux %arg15, %13, %c0_i3 : i3
        %15 = comb.xor %arg15, %true : i1
        %true_14 = hw.constant true
        %16 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %17 = comb.mux %16, %c1_i3, %c-2_i3 : i3
        %18 = comb.xor %12, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %true_15 = hw.constant true
        %19 = comb.xor %7, %true_15 : i1
        %20 = comb.and %arg15, %19 : i1
        %true_16 = hw.constant true
        %21 = comb.xor %12, %true_16 : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.and %12, %22, %16 : i1
        %24 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %25 = comb.icmp eq %arg2, %c0_i2 : i2
        %26 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %27 = comb.icmp eq %arg2, %c1_i2 : i2
        %28 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %29 = comb.icmp eq %arg2, %c-2_i2 : i2
        %30 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %true_17 = hw.constant true
        %31 = comb.xor %16, %true_17 : i1
        %32 = comb.and %12, %31 : i1
        %33 = comb.or %18, %32 : i1
        %34 = comb.and %16, %arg15, %7 : i1
        %true_18 = hw.constant true
        %35 = comb.xor %16, %true_18 : i1
        %36 = comb.mux %12, %34, %35 : i1
        %37 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %38 = comb.xor %23, %true : i1
        %39 = comb.xor %33, %true : i1
        %40 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %41 = comb.and %cmd_wr_en_q, %24 : i1
        %42 = comb.or %41, %cmd_wr_en_last_bit : i1
        %43 = comb.xor %isFirstCycle, %true : i1
        %44 = comb.and %43, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %45 = comb.xor %44, %true : i1
        verif.assert %45 : i1
        fsm.update %_sh1_10, %12 : i1
        fsm.update %_sh1_8, %15 : i1
        fsm.update %_sh1_6, %16 : i1
        fsm.update %_sh1, %true_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %42 : i1
        %46 = comb.and %arg15, %12, %16 : i1
        %47 = comb.mux %46, %arg14, %csid_q : i1
        %48 = comb.mux %46, %arg13, %cpol_q : i1
        %49 = comb.mux %46, %arg12, %cpha_q : i1
        %50 = comb.mux %46, %arg8, %csnidle_q : i4
        %51 = comb.mux %46, %arg9, %csnlead_q : i4
        %52 = comb.mux %46, %arg7, %clkdiv_q : i16
        %53 = comb.mux %46, %arg3, %cmd_wr_en_q : i1
        %54 = comb.mux %46, %arg4, %cmd_rd_en_q : i1
        %55 = comb.mux %9, %52, %10 : i16
        %56 = comb.mux %46, %arg7, %55 : i16
        %57 = comb.mux %16, %14, %c-3_i3 : i3
        %58 = comb.mux %12, %57, %17 : i3
        %59 = comb.mux %18, %c-3_i3, %58 : i3
        %60 = comb.icmp ne %59, %c-3_i3 : i3
        %61 = comb.xor %49, %true : i1
        %62 = comb.and %61, %60, %23 : i1
        %63 = comb.xor %54, %true : i1
        %64 = comb.xor %53, %true : i1
        %65 = comb.and %63, %64 : i1
        %66 = comb.mux %46, %25, %26 : i1
        %67 = comb.mux %46, %27, %28 : i1
        %68 = comb.mux %46, %29, %30 : i1
        %69 = comb.mux %68, %c-4_i3, %c1_i3 : i3
        %70 = comb.xor %65, %true : i1
        %71 = comb.xor %66, %true : i1
        %72 = comb.and %71, %70, %67 : i1
        %73 = comb.mux %72, %c-2_i3, %69 : i3
        %74 = comb.and %70, %66 : i1
        %75 = comb.mux %74, %c-1_i3, %73 : i3
        %76 = comb.mux %65, %c0_i3, %75 : i3
        %77 = comb.and %60, %12 : i1
        %78 = comb.and %38, %77 : i1
        %79 = comb.and %39, %78, %36 : i1
        %80 = comb.and %78, %33 : i1
        %81 = comb.or %80, %79 : i1
        %82 = comb.mux %81, %50, %c0_i4 : i4
        %83 = comb.and %77, %23 : i1
        %84 = comb.mux %83, %51, %82 : i4
        %85 = comb.mux %12, %84, %wait_cntr_q : i4
        %86 = comb.xor %60, %true : i1
        %87 = comb.and %40, %86, %12 : i1
        %88 = comb.mux %87, %37, %85 : i4
        %89 = comb.icmp ne %59, %c-4_i3 : i3
        %90 = comb.and %38, %89 : i1
        %91 = comb.icmp ne %59, %c3_i3 : i3
        %92 = comb.and %48, %91 : i1
        %93 = comb.and %62, %53, %11 : i1
        %94 = comb.or %93, %8 : i1
        %95 = comb.mux %94, %clk_cntr_q, %56 : i16
        %true_19 = hw.constant true
        %96 = comb.xor %62, %true_19 : i1
        %97 = comb.or %93, %96 : i1
        %98 = comb.mux %97, %bit_cntr_q, %76 : i3
        %true_20 = hw.constant true
        %99 = comb.xor %46, %true_20 : i1
        %100 = comb.or %93, %99 : i1
        %101 = comb.mux %100, %byte_cntr_cpha0_q, %arg5 : i20
        %true_21 = hw.constant true
        %102 = comb.xor %46, %true_21 : i1
        %103 = comb.or %93, %102 : i1
        %104 = comb.mux %103, %byte_cntr_cpha1_q, %arg5 : i20
        %105 = comb.mux %93, %wait_cntr_q, %88 : i4
        %106 = comb.mux bin %93, %u_sck_flop2Fq_o, %92 : i1
        fsm.update %u_sck_flop2Fq_o, %106 : i1
        fsm.update %wait_cntr_q, %105 : i4
        fsm.update %byte_cntr_cpha1_q, %104 : i20
        fsm.update %byte_cntr_cpha0_q, %101 : i20
        fsm.update %bit_cntr_q, %98 : i3
        fsm.update %clk_cntr_q, %95 : i16
        %107 = comb.xor %93, %true : i1
        %108 = comb.and %46, %107 : i1
        %109 = comb.mux %108, %arg14, %csid_q : i1
        %110 = comb.mux %108, %arg13, %cpol_q : i1
        %111 = comb.mux %108, %arg12, %cpha_q : i1
        %112 = comb.mux %108, %arg11, %full_cyc_q : i1
        %113 = comb.mux %108, %arg8, %csnidle_q : i4
        %114 = comb.mux %108, %arg9, %csnlead_q : i4
        %115 = comb.mux %108, %arg10, %csntrail_q : i4
        %116 = comb.mux %108, %arg7, %clkdiv_q : i16
        %117 = comb.mux %108, %arg6, %csaat_q : i1
        %118 = comb.mux %108, %arg3, %cmd_wr_en_q : i1
        %119 = comb.mux %108, %arg4, %cmd_rd_en_q : i1
        %120 = comb.mux %108, %arg2, %cmd_speed_q : i2
        %121 = comb.and %60, %107 : i1
        %122 = comb.mux bin %121, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %123 = comb.and %12, %107 : i1
        %124 = comb.mux %123, %62, %sample_en_q : i1
        %125 = comb.mux %123, %sample_en_q, %sample_en_q2 : i1
        %126 = comb.mux %107, %90, %csb_q : i1
        %127 = comb.or %47, %126 : i1
        fsm.update %_sh1_12, %107 : i1
        fsm.update %csb_q, %127 : i1
        fsm.update %sample_en_q2, %125 : i1
        fsm.update %sample_en_q, %124 : i1
        fsm.update %segment_rd_en_cpha1, %122 : i1
        fsm.update %cmd_speed_q, %120 : i2
        fsm.update %cmd_wr_en_q, %118 : i1
        fsm.update %cmd_rd_en_q, %119 : i1
        fsm.update %csaat_q, %117 : i1
        fsm.update %clkdiv_q, %116 : i16
        fsm.update %csntrail_q, %115 : i4
        fsm.update %csnlead_q, %114 : i4
        fsm.update %csnidle_q, %113 : i4
        fsm.update %full_cyc_q, %112 : i1
        fsm.update %cpha_q, %111 : i1
        fsm.update %cpol_q, %110 : i1
        fsm.update %csid_q, %109 : i1
      }
      fsm.transition @state_5 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %9 = comb.xor %arg16, %true : i1
        %10 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %11 = comb.mux %arg15, %10, %c0_i3 : i3
        %12 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %13 = comb.mux %12, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %15 = comb.xor %isFirstCycle, %true : i1
        %16 = comb.and %15, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %arg1, %8 : i1
        %19 = comb.and %18, %14 : i1
        %20 = comb.mux %12, %11, %c-3_i3 : i3
        %21 = comb.mux %19, %20, %13 : i3
        %22 = comb.mux %arg18, %c0_i3, %21 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.and %14, %23 : i1
        %25 = comb.mux %24, %c-3_i3, %22 : i3
        %26 = comb.xor %24, %true : i1
        %27 = comb.icmp ne %25, %c-3_i3 : i3
        %true_13 = hw.constant true
        %28 = comb.xor %7, %true_13 : i1
        %29 = comb.and %arg15, %28 : i1
        %true_14 = hw.constant true
        %30 = comb.xor %19, %true_14 : i1
        %31 = comb.or %30, %29 : i1
        %true_15 = hw.constant true
        %32 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %33 = comb.xor %24, %true_16 : i1
        verif.assert %17 : i1
        %34 = comb.and %arg15, %26, %19, %12 : i1
        %35 = comb.mux %34, %arg12, %cpha_q : i1
        %36 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %37 = comb.xor %35, %true : i1
        %38 = comb.and %37, %14, %27, %33, %32, %31, %12, %36, %9 : i1
        %true_17 = hw.constant true
        %39 = comb.xor %12, %true_17 : i1
        %true_18 = hw.constant true
        %40 = comb.xor %arg18, %true_18 : i1
        %41 = comb.and %40, %19, %39 : i1
        %42 = comb.or %38, %24, %41 : i1
        fsm.return %42
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg1, %true : i1
        %9 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %10 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %11 = comb.xor %arg16, %true : i1
        %12 = comb.and %arg1, %9 : i1
        %13 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %14 = comb.mux %arg15, %13, %c0_i3 : i3
        %15 = comb.xor %arg15, %true : i1
        %true_14 = hw.constant true
        %16 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %17 = comb.mux %16, %c1_i3, %c-2_i3 : i3
        %18 = comb.xor %arg18, %true : i1
        %19 = comb.and %12, %18 : i1
        %20 = comb.xor %12, %true : i1
        %21 = comb.and %18, %20 : i1
        %22 = comb.xor %21, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %true_15 = hw.constant true
        %23 = comb.xor %7, %true_15 : i1
        %24 = comb.and %arg15, %23 : i1
        %true_16 = hw.constant true
        %25 = comb.xor %19, %true_16 : i1
        %26 = comb.or %25, %24 : i1
        %true_17 = hw.constant true
        %27 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %28 = comb.xor %21, %true_18 : i1
        %29 = comb.and %28, %27, %26, %16 : i1
        %30 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %31 = comb.icmp eq %arg2, %c0_i2 : i2
        %32 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %33 = comb.icmp eq %arg2, %c1_i2 : i2
        %34 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %35 = comb.icmp eq %arg2, %c-2_i2 : i2
        %36 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %true_19 = hw.constant true
        %37 = comb.xor %16, %true_19 : i1
        %true_20 = hw.constant true
        %38 = comb.xor %arg18, %true_20 : i1
        %39 = comb.and %38, %19, %37 : i1
        %40 = comb.or %21, %39 : i1
        %41 = comb.and %16, %arg15, %7 : i1
        %true_21 = hw.constant true
        %42 = comb.xor %16, %true_21 : i1
        %43 = comb.mux %19, %41, %42 : i1
        %true_22 = hw.constant true
        %44 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %45 = comb.xor %21, %true_23 : i1
        %46 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %47 = comb.xor %29, %true : i1
        %48 = comb.xor %40, %true : i1
        %49 = comb.or %arg18, %12 : i1
        %50 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %51 = comb.and %cmd_wr_en_q, %30 : i1
        %52 = comb.or %51, %cmd_wr_en_last_bit : i1
        %53 = comb.xor %isFirstCycle, %true : i1
        %54 = comb.and %53, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %18 : i1
        %55 = comb.xor %54, %true : i1
        verif.assert %55 : i1
        fsm.update %_sh1_10, %12 : i1
        fsm.update %_sh1_8, %15 : i1
        fsm.update %_sh1_6, %16 : i1
        fsm.update %_sh1, %true_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %52 : i1
        %56 = comb.and %arg15, %22, %19, %16 : i1
        %57 = comb.mux %56, %arg14, %csid_q : i1
        %58 = comb.mux %56, %arg13, %cpol_q : i1
        %59 = comb.mux %56, %arg12, %cpha_q : i1
        %60 = comb.mux %56, %arg8, %csnidle_q : i4
        %61 = comb.mux %56, %arg9, %csnlead_q : i4
        %62 = comb.mux %56, %arg7, %clkdiv_q : i16
        %63 = comb.mux %56, %arg3, %cmd_wr_en_q : i1
        %64 = comb.mux %56, %arg4, %cmd_rd_en_q : i1
        %65 = comb.mux %9, %62, %10 : i16
        %66 = comb.mux %56, %arg7, %65 : i16
        %67 = comb.mux %8, %clk_cntr_q, %66 : i16
        %68 = comb.mux %arg18, %c0_i16, %67 : i16
        %69 = comb.mux %16, %14, %c-3_i3 : i3
        %70 = comb.mux %19, %69, %17 : i3
        %71 = comb.mux %arg18, %c0_i3, %70 : i3
        %72 = comb.mux %21, %c-3_i3, %71 : i3
        %73 = comb.icmp ne %72, %c-3_i3 : i3
        %74 = comb.xor %59, %true : i1
        %75 = comb.and %74, %18, %73, %29 : i1
        %76 = comb.xor %64, %true : i1
        %77 = comb.xor %63, %true : i1
        %78 = comb.and %76, %77 : i1
        %79 = comb.mux %56, %31, %32 : i1
        %80 = comb.mux %56, %33, %34 : i1
        %81 = comb.mux %56, %35, %36 : i1
        %82 = comb.mux %81, %c-4_i3, %c1_i3 : i3
        %83 = comb.xor %78, %true : i1
        %84 = comb.xor %79, %true : i1
        %85 = comb.and %84, %83, %80 : i1
        %86 = comb.mux %85, %c-2_i3, %82 : i3
        %87 = comb.and %83, %79 : i1
        %88 = comb.mux %87, %c-1_i3, %86 : i3
        %89 = comb.mux %78, %c0_i3, %88 : i3
        %90 = comb.and %12, %75 : i1
        %91 = comb.mux %90, %89, %bit_cntr_q : i3
        %92 = comb.mux %arg18, %c0_i3, %91 : i3
        %93 = comb.mux %56, %arg5, %byte_cntr_cpha0_q : i20
        %94 = comb.mux %arg18, %c0_i20, %93 : i20
        %95 = comb.mux %56, %arg5, %byte_cntr_cpha1_q : i20
        %96 = comb.mux %arg18, %c0_i20, %95 : i20
        %97 = comb.and %73, %19 : i1
        %98 = comb.and %47, %97 : i1
        %99 = comb.and %48, %98, %45, %44, %43 : i1
        %100 = comb.and %98, %40 : i1
        %101 = comb.or %100, %99 : i1
        %102 = comb.mux %101, %60, %c0_i4 : i4
        %103 = comb.and %97, %29 : i1
        %104 = comb.mux %103, %61, %102 : i4
        %105 = comb.mux %49, %104, %wait_cntr_q : i4
        %106 = comb.mux %arg18, %c0_i4, %105 : i4
        %107 = comb.xor %73, %true : i1
        %108 = comb.and %50, %107, %19 : i1
        %109 = comb.mux %108, %46, %106 : i4
        %110 = comb.icmp ne %72, %c-4_i3 : i3
        %111 = comb.and %47, %110 : i1
        %112 = comb.icmp ne %72, %c3_i3 : i3
        %113 = comb.and %58, %112 : i1
        %114 = comb.and %75, %63, %11 : i1
        %115 = comb.mux %114, %clk_cntr_q, %68 : i16
        %116 = comb.mux %114, %bit_cntr_q, %92 : i3
        %117 = comb.mux %114, %byte_cntr_cpha0_q, %94 : i20
        %118 = comb.mux %114, %byte_cntr_cpha1_q, %96 : i20
        %119 = comb.mux %114, %wait_cntr_q, %109 : i4
        %120 = comb.mux bin %114, %u_sck_flop2Fq_o, %113 : i1
        fsm.update %u_sck_flop2Fq_o, %120 : i1
        fsm.update %wait_cntr_q, %119 : i4
        fsm.update %byte_cntr_cpha1_q, %118 : i20
        fsm.update %byte_cntr_cpha0_q, %117 : i20
        fsm.update %bit_cntr_q, %116 : i3
        fsm.update %clk_cntr_q, %115 : i16
        %121 = comb.xor %114, %true : i1
        %122 = comb.and %56, %121 : i1
        %123 = comb.mux %122, %arg14, %csid_q : i1
        %124 = comb.mux %122, %arg13, %cpol_q : i1
        %125 = comb.mux %122, %arg12, %cpha_q : i1
        %126 = comb.mux %122, %arg11, %full_cyc_q : i1
        %127 = comb.mux %122, %arg8, %csnidle_q : i4
        %128 = comb.mux %122, %arg9, %csnlead_q : i4
        %129 = comb.mux %122, %arg10, %csntrail_q : i4
        %130 = comb.mux %122, %arg7, %clkdiv_q : i16
        %131 = comb.mux %122, %arg6, %csaat_q : i1
        %132 = comb.mux %122, %arg3, %cmd_wr_en_q : i1
        %133 = comb.mux %122, %arg4, %cmd_rd_en_q : i1
        %134 = comb.mux %122, %arg2, %cmd_speed_q : i2
        %135 = comb.and %73, %121 : i1
        %136 = comb.mux bin %135, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %137 = comb.and %12, %121 : i1
        %138 = comb.mux %137, %75, %sample_en_q : i1
        %139 = comb.mux %137, %sample_en_q, %sample_en_q2 : i1
        %140 = comb.mux %121, %111, %csb_q : i1
        %141 = comb.or %57, %140 : i1
        fsm.update %_sh1_12, %121 : i1
        fsm.update %csb_q, %141 : i1
        fsm.update %sample_en_q2, %139 : i1
        fsm.update %sample_en_q, %138 : i1
        fsm.update %segment_rd_en_cpha1, %136 : i1
        fsm.update %cmd_speed_q, %134 : i2
        fsm.update %cmd_wr_en_q, %132 : i1
        fsm.update %cmd_rd_en_q, %133 : i1
        fsm.update %csaat_q, %131 : i1
        fsm.update %clkdiv_q, %130 : i16
        fsm.update %csntrail_q, %129 : i4
        fsm.update %csnlead_q, %128 : i4
        fsm.update %csnidle_q, %127 : i4
        fsm.update %full_cyc_q, %126 : i1
        fsm.update %cpha_q, %125 : i1
        fsm.update %cpol_q, %124 : i1
        fsm.update %csid_q, %123 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %9 = comb.xor %arg16, %true : i1
        %10 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %11 = comb.mux %arg15, %10, %c0_i3 : i3
        %12 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %13 = comb.mux %12, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %15 = comb.xor %isFirstCycle, %true : i1
        %16 = comb.and %15, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %arg1, %8 : i1
        %19 = comb.and %18, %14 : i1
        %20 = comb.mux %12, %11, %c-3_i3 : i3
        %21 = comb.mux %19, %20, %13 : i3
        %22 = comb.mux %arg18, %c0_i3, %21 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.and %14, %23 : i1
        %25 = comb.mux %24, %c-3_i3, %22 : i3
        %26 = comb.xor %24, %true : i1
        %27 = comb.icmp ne %25, %c-3_i3 : i3
        %true_13 = hw.constant true
        %28 = comb.xor %7, %true_13 : i1
        %29 = comb.and %arg15, %28 : i1
        %true_14 = hw.constant true
        %30 = comb.xor %19, %true_14 : i1
        %31 = comb.or %30, %29 : i1
        %true_15 = hw.constant true
        %32 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %33 = comb.xor %24, %true_16 : i1
        verif.assert %17 : i1
        %34 = comb.and %arg15, %26, %19, %12 : i1
        %35 = comb.mux %34, %arg12, %cpha_q : i1
        %36 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %37 = comb.xor %35, %true : i1
        %38 = comb.and %37, %14, %27, %33, %32, %31, %12, %36, %9 : i1
        %39 = comb.or %38, %24 : i1
        %true_17 = hw.constant true
        %40 = comb.xor %7, %true_17 : i1
        %41 = comb.and %arg15, %40 : i1
        %true_18 = hw.constant true
        %42 = comb.xor %19, %true_18 : i1
        %43 = comb.or %42, %41 : i1
        %true_19 = hw.constant true
        %44 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %45 = comb.xor %39, %true_20 : i1
        %46 = comb.and %45, %44, %43, %12 : i1
        fsm.return %46
      } action {
        %true = hw.constant true
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %true_14 = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg1, %true_14 : i1
        %9 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %10 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %11 = comb.xor %arg16, %true_14 : i1
        %12 = comb.and %arg1, %9 : i1
        %13 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %14 = comb.mux %arg15, %13, %c0_i3 : i3
        %15 = comb.xor %arg15, %true_14 : i1
        %true_15 = hw.constant true
        %16 = comb.xor %12, %true_14 : i1
        %c-3_i3 = hw.constant -3 : i3
        %true_16 = hw.constant true
        %17 = comb.xor %7, %true_16 : i1
        %18 = comb.and %arg15, %17 : i1
        %true_17 = hw.constant true
        %19 = comb.xor %12, %true_17 : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.and %12, %20 : i1
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.icmp eq %arg2, %c0_i2 : i2
        %24 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %25 = comb.icmp eq %arg2, %c1_i2 : i2
        %26 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %27 = comb.icmp eq %arg2, %c-2_i2 : i2
        %28 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %29 = comb.xor %21, %true_14 : i1
        %30 = comb.and %cmd_wr_en_q, %22 : i1
        %31 = comb.or %30, %cmd_wr_en_last_bit : i1
        %32 = comb.xor %isFirstCycle, %true_14 : i1
        %33 = comb.and %32, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12 : i1
        %34 = comb.xor %33, %true_14 : i1
        verif.assert %34 : i1
        fsm.update %_sh1_10, %12 : i1
        fsm.update %_sh1_8, %15 : i1
        fsm.update %_sh1_6, %true : i1
        fsm.update %_sh1, %true_15 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %31 : i1
        %35 = comb.and %arg15, %12 : i1
        %36 = comb.mux %35, %arg14, %csid_q : i1
        %37 = comb.mux %35, %arg13, %cpol_q : i1
        %38 = comb.mux %35, %arg12, %cpha_q : i1
        %39 = comb.mux %35, %arg8, %csnidle_q : i4
        %40 = comb.mux %35, %arg9, %csnlead_q : i4
        %41 = comb.mux %35, %arg7, %clkdiv_q : i16
        %42 = comb.mux %35, %arg3, %cmd_wr_en_q : i1
        %43 = comb.mux %35, %arg4, %cmd_rd_en_q : i1
        %44 = comb.mux %9, %41, %10 : i16
        %45 = comb.mux %35, %arg7, %44 : i16
        %46 = comb.mux %12, %14, %c1_i3 : i3
        %47 = comb.mux %16, %c-3_i3, %46 : i3
        %48 = comb.icmp ne %47, %c-3_i3 : i3
        %49 = comb.xor %38, %true_14 : i1
        %50 = comb.and %49, %48, %21 : i1
        %51 = comb.xor %43, %true_14 : i1
        %52 = comb.xor %42, %true_14 : i1
        %53 = comb.and %51, %52 : i1
        %54 = comb.mux %35, %23, %24 : i1
        %55 = comb.mux %35, %25, %26 : i1
        %56 = comb.mux %35, %27, %28 : i1
        %57 = comb.mux %56, %c-4_i3, %c1_i3 : i3
        %58 = comb.xor %53, %true_14 : i1
        %59 = comb.xor %54, %true_14 : i1
        %60 = comb.and %59, %58, %55 : i1
        %61 = comb.mux %60, %c-2_i3, %57 : i3
        %62 = comb.and %58, %54 : i1
        %63 = comb.mux %62, %c-1_i3, %61 : i3
        %64 = comb.mux %53, %c0_i3, %63 : i3
        %65 = comb.and %48, %12 : i1
        %66 = comb.and %29, %65 : i1
        %67 = comb.and %66, %arg15, %7 : i1
        %68 = comb.and %66, %16 : i1
        %69 = comb.or %68, %67 : i1
        %70 = comb.mux %69, %39, %c0_i4 : i4
        %71 = comb.and %65, %21 : i1
        %72 = comb.mux %71, %40, %70 : i4
        %73 = comb.icmp ne %47, %c-4_i3 : i3
        %74 = comb.and %29, %73 : i1
        %75 = comb.icmp ne %47, %c3_i3 : i3
        %76 = comb.and %37, %75 : i1
        %77 = comb.and %50, %42, %11 : i1
        %78 = comb.or %77, %8 : i1
        %79 = comb.mux %78, %clk_cntr_q, %45 : i16
        %true_18 = hw.constant true
        %80 = comb.xor %50, %true_18 : i1
        %81 = comb.or %77, %80 : i1
        %82 = comb.mux %81, %bit_cntr_q, %64 : i3
        %true_19 = hw.constant true
        %83 = comb.xor %35, %true_19 : i1
        %84 = comb.or %77, %83 : i1
        %85 = comb.mux %84, %byte_cntr_cpha0_q, %arg5 : i20
        %true_20 = hw.constant true
        %86 = comb.xor %35, %true_20 : i1
        %87 = comb.or %77, %86 : i1
        %88 = comb.mux %87, %byte_cntr_cpha1_q, %arg5 : i20
        %true_21 = hw.constant true
        %89 = comb.xor %12, %true_21 : i1
        %90 = comb.or %77, %89 : i1
        %91 = comb.mux %90, %wait_cntr_q, %72 : i4
        %92 = comb.mux bin %77, %u_sck_flop2Fq_o, %76 : i1
        fsm.update %u_sck_flop2Fq_o, %92 : i1
        fsm.update %wait_cntr_q, %91 : i4
        fsm.update %byte_cntr_cpha1_q, %88 : i20
        fsm.update %byte_cntr_cpha0_q, %85 : i20
        fsm.update %bit_cntr_q, %82 : i3
        fsm.update %clk_cntr_q, %79 : i16
        %93 = comb.xor %77, %true_14 : i1
        %94 = comb.and %35, %93 : i1
        %95 = comb.mux %94, %arg14, %csid_q : i1
        %96 = comb.mux %94, %arg13, %cpol_q : i1
        %97 = comb.mux %94, %arg12, %cpha_q : i1
        %98 = comb.mux %94, %arg11, %full_cyc_q : i1
        %99 = comb.mux %94, %arg8, %csnidle_q : i4
        %100 = comb.mux %94, %arg9, %csnlead_q : i4
        %101 = comb.mux %94, %arg10, %csntrail_q : i4
        %102 = comb.mux %94, %arg7, %clkdiv_q : i16
        %103 = comb.mux %94, %arg6, %csaat_q : i1
        %104 = comb.mux %94, %arg3, %cmd_wr_en_q : i1
        %105 = comb.mux %94, %arg4, %cmd_rd_en_q : i1
        %106 = comb.mux %94, %arg2, %cmd_speed_q : i2
        %107 = comb.and %48, %93 : i1
        %108 = comb.mux bin %107, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %109 = comb.and %12, %93 : i1
        %110 = comb.mux %109, %50, %sample_en_q : i1
        %111 = comb.mux %109, %sample_en_q, %sample_en_q2 : i1
        %112 = comb.mux %93, %74, %csb_q : i1
        %113 = comb.or %36, %112 : i1
        fsm.update %_sh1_12, %93 : i1
        fsm.update %csb_q, %113 : i1
        fsm.update %sample_en_q2, %111 : i1
        fsm.update %sample_en_q, %110 : i1
        fsm.update %segment_rd_en_cpha1, %108 : i1
        fsm.update %cmd_speed_q, %106 : i2
        fsm.update %cmd_wr_en_q, %104 : i1
        fsm.update %cmd_rd_en_q, %105 : i1
        fsm.update %csaat_q, %103 : i1
        fsm.update %clkdiv_q, %102 : i16
        fsm.update %csntrail_q, %101 : i4
        fsm.update %csnlead_q, %100 : i4
        fsm.update %csnidle_q, %99 : i4
        fsm.update %full_cyc_q, %98 : i1
        fsm.update %cpha_q, %97 : i1
        fsm.update %cpol_q, %96 : i1
        fsm.update %csid_q, %95 : i1
      }
      fsm.transition @state_0 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %9 = comb.xor %arg16, %true : i1
        %10 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %11 = comb.mux %arg15, %10, %c0_i3 : i3
        %12 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %13 = comb.mux %12, %c1_i3, %c-2_i3 : i3
        %14 = comb.xor %arg18, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %15 = comb.xor %isFirstCycle, %true : i1
        %16 = comb.and %15, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %14 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %arg1, %8 : i1
        %19 = comb.and %18, %14 : i1
        %20 = comb.mux %12, %11, %c-3_i3 : i3
        %21 = comb.mux %19, %20, %13 : i3
        %22 = comb.mux %arg18, %c0_i3, %21 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.and %14, %23 : i1
        %25 = comb.mux %24, %c-3_i3, %22 : i3
        %26 = comb.xor %24, %true : i1
        %27 = comb.icmp ne %25, %c-3_i3 : i3
        %true_13 = hw.constant true
        %28 = comb.xor %7, %true_13 : i1
        %29 = comb.and %arg15, %28 : i1
        %true_14 = hw.constant true
        %30 = comb.xor %19, %true_14 : i1
        %31 = comb.or %30, %29 : i1
        %true_15 = hw.constant true
        %32 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %33 = comb.xor %24, %true_16 : i1
        verif.assert %17 : i1
        %34 = comb.and %arg15, %26, %19, %12 : i1
        %35 = comb.mux %34, %arg12, %cpha_q : i1
        %36 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %37 = comb.xor %35, %true : i1
        %38 = comb.and %37, %14, %27, %33, %32, %31, %12, %36, %9 : i1
        %39 = comb.or %38, %24 : i1
        %true_17 = hw.constant true
        %40 = comb.xor %arg15, %true_17 : i1
        %41 = comb.and %19, %12, %40 : i1
        %42 = comb.or %arg18, %41 : i1
        %true_18 = hw.constant true
        %43 = comb.xor %39, %true_18 : i1
        %44 = comb.and %43, %42 : i1
        fsm.return %44
      } action {
        %false_13 = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i20 = hw.constant 0 : i20
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c3_i3 = hw.constant 3 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-2_i2 = hw.constant -2 : i2
        %c-1_i16 = hw.constant -1 : i16
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.icmp ne %arg13, %cpol_q : i1
        %1 = comb.icmp ne %arg12, %cpha_q : i1
        %2 = comb.icmp ne %arg11, %full_cyc_q : i1
        %3 = comb.icmp ne %arg8, %csnidle_q : i4
        %4 = comb.icmp ne %arg10, %csntrail_q : i4
        %5 = comb.icmp ne %arg9, %csnlead_q : i4
        %6 = comb.icmp ne %arg7, %clkdiv_q : i16
        %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
        %8 = comb.xor %arg1, %true : i1
        %9 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %10 = comb.add %clk_cntr_q, %c-1_i16 : i16
        %11 = comb.xor %arg16, %true : i1
        %12 = comb.and %arg1, %9 : i1
        %13 = comb.mux %7, %c-2_i3, %c1_i3 : i3
        %14 = comb.mux %arg15, %13, %c0_i3 : i3
        %15 = comb.xor %arg15, %true : i1
        %true_14 = hw.constant true
        %16 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %17 = comb.mux %16, %c1_i3, %c-2_i3 : i3
        %18 = comb.xor %arg18, %true : i1
        %19 = comb.and %12, %18 : i1
        %20 = comb.xor %12, %true : i1
        %21 = comb.and %18, %20 : i1
        %22 = comb.xor %21, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %true_15 = hw.constant true
        %23 = comb.xor %7, %true_15 : i1
        %24 = comb.and %arg15, %23 : i1
        %true_16 = hw.constant true
        %25 = comb.xor %19, %true_16 : i1
        %26 = comb.or %25, %24 : i1
        %true_17 = hw.constant true
        %27 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %28 = comb.xor %21, %true_18 : i1
        %29 = comb.and %28, %27, %26, %16 : i1
        %30 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %31 = comb.icmp eq %arg2, %c0_i2 : i2
        %32 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %33 = comb.icmp eq %arg2, %c1_i2 : i2
        %34 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %35 = comb.icmp eq %arg2, %c-2_i2 : i2
        %36 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %true_19 = hw.constant true
        %37 = comb.xor %16, %true_19 : i1
        %true_20 = hw.constant true
        %38 = comb.xor %arg18, %true_20 : i1
        %39 = comb.and %38, %19, %37 : i1
        %40 = comb.or %21, %39 : i1
        %41 = comb.and %16, %arg15, %7 : i1
        %true_21 = hw.constant true
        %42 = comb.xor %16, %true_21 : i1
        %43 = comb.mux %19, %41, %42 : i1
        %true_22 = hw.constant true
        %44 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %45 = comb.xor %21, %true_23 : i1
        %46 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %47 = comb.xor %29, %true : i1
        %48 = comb.xor %40, %true : i1
        %49 = comb.or %arg18, %12 : i1
        %50 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %51 = comb.and %cmd_wr_en_q, %30 : i1
        %52 = comb.or %51, %cmd_wr_en_last_bit : i1
        %53 = comb.xor %isFirstCycle, %true : i1
        %54 = comb.and %53, %_sh1, %_sh1_6, %_sh1_8, %_sh1_10, %_sh1_12, %18 : i1
        %55 = comb.xor %54, %true : i1
        verif.assert %55 : i1
        fsm.update %_sh1_10, %12 : i1
        fsm.update %_sh1_8, %15 : i1
        fsm.update %_sh1_6, %16 : i1
        fsm.update %_sh1, %true_14 : i1
        fsm.update %isFirstCycle, %false_13 : i1
        fsm.update %cmd_wr_en_last_bit, %52 : i1
        %56 = comb.and %arg15, %22, %19, %16 : i1
        %57 = comb.mux %56, %arg14, %csid_q : i1
        %58 = comb.mux %56, %arg13, %cpol_q : i1
        %59 = comb.mux %56, %arg12, %cpha_q : i1
        %60 = comb.mux %56, %arg8, %csnidle_q : i4
        %61 = comb.mux %56, %arg9, %csnlead_q : i4
        %62 = comb.mux %56, %arg7, %clkdiv_q : i16
        %63 = comb.mux %56, %arg3, %cmd_wr_en_q : i1
        %64 = comb.mux %56, %arg4, %cmd_rd_en_q : i1
        %65 = comb.mux %9, %62, %10 : i16
        %66 = comb.mux %56, %arg7, %65 : i16
        %67 = comb.mux %8, %clk_cntr_q, %66 : i16
        %68 = comb.mux %arg18, %c0_i16, %67 : i16
        %69 = comb.mux %16, %14, %c-3_i3 : i3
        %70 = comb.mux %19, %69, %17 : i3
        %71 = comb.mux %arg18, %c0_i3, %70 : i3
        %72 = comb.mux %21, %c-3_i3, %71 : i3
        %73 = comb.icmp ne %72, %c-3_i3 : i3
        %74 = comb.xor %59, %true : i1
        %75 = comb.and %74, %18, %73, %29 : i1
        %76 = comb.xor %64, %true : i1
        %77 = comb.xor %63, %true : i1
        %78 = comb.and %76, %77 : i1
        %79 = comb.mux %56, %31, %32 : i1
        %80 = comb.mux %56, %33, %34 : i1
        %81 = comb.mux %56, %35, %36 : i1
        %82 = comb.mux %81, %c-4_i3, %c1_i3 : i3
        %83 = comb.xor %78, %true : i1
        %84 = comb.xor %79, %true : i1
        %85 = comb.and %84, %83, %80 : i1
        %86 = comb.mux %85, %c-2_i3, %82 : i3
        %87 = comb.and %83, %79 : i1
        %88 = comb.mux %87, %c-1_i3, %86 : i3
        %89 = comb.mux %78, %c0_i3, %88 : i3
        %90 = comb.and %12, %75 : i1
        %91 = comb.mux %90, %89, %bit_cntr_q : i3
        %92 = comb.mux %arg18, %c0_i3, %91 : i3
        %93 = comb.mux %56, %arg5, %byte_cntr_cpha0_q : i20
        %94 = comb.mux %arg18, %c0_i20, %93 : i20
        %95 = comb.mux %56, %arg5, %byte_cntr_cpha1_q : i20
        %96 = comb.mux %arg18, %c0_i20, %95 : i20
        %97 = comb.and %73, %19 : i1
        %98 = comb.and %47, %97 : i1
        %99 = comb.and %48, %98, %45, %44, %43 : i1
        %100 = comb.and %98, %40 : i1
        %101 = comb.or %100, %99 : i1
        %102 = comb.mux %101, %60, %c0_i4 : i4
        %103 = comb.and %97, %29 : i1
        %104 = comb.mux %103, %61, %102 : i4
        %105 = comb.mux %49, %104, %wait_cntr_q : i4
        %106 = comb.mux %arg18, %c0_i4, %105 : i4
        %107 = comb.xor %73, %true : i1
        %108 = comb.and %50, %107, %19 : i1
        %109 = comb.mux %108, %46, %106 : i4
        %110 = comb.icmp ne %72, %c-4_i3 : i3
        %111 = comb.and %47, %110 : i1
        %112 = comb.icmp ne %72, %c3_i3 : i3
        %113 = comb.and %58, %112 : i1
        %114 = comb.and %75, %63, %11 : i1
        %115 = comb.mux %114, %clk_cntr_q, %68 : i16
        %116 = comb.mux %114, %bit_cntr_q, %92 : i3
        %117 = comb.mux %114, %byte_cntr_cpha0_q, %94 : i20
        %118 = comb.mux %114, %byte_cntr_cpha1_q, %96 : i20
        %119 = comb.mux %114, %wait_cntr_q, %109 : i4
        %120 = comb.mux bin %114, %u_sck_flop2Fq_o, %113 : i1
        fsm.update %u_sck_flop2Fq_o, %120 : i1
        fsm.update %wait_cntr_q, %119 : i4
        fsm.update %byte_cntr_cpha1_q, %118 : i20
        fsm.update %byte_cntr_cpha0_q, %117 : i20
        fsm.update %bit_cntr_q, %116 : i3
        fsm.update %clk_cntr_q, %115 : i16
        %121 = comb.xor %114, %true : i1
        %122 = comb.and %56, %121 : i1
        %123 = comb.mux %122, %arg14, %csid_q : i1
        %124 = comb.mux %122, %arg13, %cpol_q : i1
        %125 = comb.mux %122, %arg12, %cpha_q : i1
        %126 = comb.mux %122, %arg11, %full_cyc_q : i1
        %127 = comb.mux %122, %arg8, %csnidle_q : i4
        %128 = comb.mux %122, %arg9, %csnlead_q : i4
        %129 = comb.mux %122, %arg10, %csntrail_q : i4
        %130 = comb.mux %122, %arg7, %clkdiv_q : i16
        %131 = comb.mux %122, %arg6, %csaat_q : i1
        %132 = comb.mux %122, %arg3, %cmd_wr_en_q : i1
        %133 = comb.mux %122, %arg4, %cmd_rd_en_q : i1
        %134 = comb.mux %122, %arg2, %cmd_speed_q : i2
        %135 = comb.and %73, %121 : i1
        %136 = comb.mux bin %135, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %137 = comb.and %12, %121 : i1
        %138 = comb.mux %137, %75, %sample_en_q : i1
        %139 = comb.mux %137, %sample_en_q, %sample_en_q2 : i1
        %140 = comb.mux %121, %111, %csb_q : i1
        %141 = comb.or %57, %140 : i1
        fsm.update %_sh1_12, %121 : i1
        fsm.update %csb_q, %141 : i1
        fsm.update %sample_en_q2, %139 : i1
        fsm.update %sample_en_q, %138 : i1
        fsm.update %segment_rd_en_cpha1, %136 : i1
        fsm.update %cmd_speed_q, %134 : i2
        fsm.update %cmd_wr_en_q, %132 : i1
        fsm.update %cmd_rd_en_q, %133 : i1
        fsm.update %csaat_q, %131 : i1
        fsm.update %clkdiv_q, %130 : i16
        fsm.update %csntrail_q, %129 : i4
        fsm.update %csnlead_q, %128 : i4
        fsm.update %csnidle_q, %127 : i4
        fsm.update %full_cyc_q, %126 : i1
        fsm.update %cpha_q, %125 : i1
        fsm.update %cpol_q, %124 : i1
        fsm.update %csid_q, %123 : i1
      }
    }
  }
}

