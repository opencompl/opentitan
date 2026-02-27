module {
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
    %cmd_len_q = fsm.variable "cmd_len_q" {initValue = 0 : i20} : i20
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
    fsm.state @state_0 output {
      %c0_i4 = hw.constant 0 : i4
      %c0_i2 = hw.constant 0 : i2
      %c0_i20 = hw.constant 0 : i20
      %c0_i3 = hw.constant 0 : i3
      %c-2_i3 = hw.constant -2 : i3
      %c1_i3 = hw.constant 1 : i3
      %c1_i2 = hw.constant 1 : i2
      %c-2_i2 = hw.constant -2 : i2
      %c-1_i2 = hw.constant -1 : i2
      %true = hw.constant true
      %false = hw.constant false
      %0 = comb.icmp ne %arg13, %cpol_q : i1
      %1 = comb.icmp ne %arg12, %cpha_q : i1
      %2 = comb.icmp ne %arg11, %full_cyc_q : i1
      %3 = comb.icmp ne %arg8, %csnidle_q : i4
      %4 = comb.icmp ne %arg10, %csntrail_q : i4
      %5 = comb.icmp ne %arg9, %csnlead_q : i4
      %6 = comb.icmp ne %arg7, %clkdiv_q : i16
      %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
      %false_0 = hw.constant false
      %8 = comb.xor %arg16, %true : i1
      %false_1 = hw.constant false
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
      %c0_i3_2 = hw.constant 0 : i3
      %false_3 = hw.constant false
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
      %39 = comb.and %arg15, %20 : i1
      %40 = comb.mux %39, %arg14, %csid_q : i1
      %41 = comb.mux %39, %arg12, %cpha_q : i1
      %42 = comb.mux %39, %arg11, %full_cyc_q : i1
      %43 = comb.mux %39, %arg3, %cmd_wr_en_q : i1
      %44 = comb.mux %39, %arg4, %cmd_rd_en_q : i1
      %45 = comb.mux %39, %arg2, %cmd_speed_q : i2
      %46 = comb.mux %18, %c0_i3_2, %16 : i3
      %47 = comb.icmp ne %46, %c0_i3_2 : i3
      %true_4 = hw.constant true
      %48 = comb.xor %7, %true_4 : i1
      %49 = comb.and %arg15, %48 : i1
      %50 = comb.mux %14, %49, %11 : i1
      %true_5 = hw.constant true
      %51 = comb.xor %arg18, %true_5 : i1
      %true_6 = hw.constant true
      %52 = comb.xor %18, %true_6 : i1
      %53 = comb.xor %41, %true : i1
      %54 = comb.and %53, %13, %47, %52, %51, %50, %43 : i1
      %55 = comb.mux %42, %sample_en_q2, %sample_en_q : i1
      %56 = comb.icmp eq %arg2, %c0_i2 : i2
      %57 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %58 = comb.mux %39, %56, %57 : i1
      %59 = comb.and %44, %43 : i1
      %60 = comb.xor %59, %true : i1
      %61 = comb.or %58, %60 : i1
      verif.assert %61 : i1
      %62 = comb.icmp ne %45, %c-1_i2 : i2
      verif.assert %62 : i1
      %63 = comb.xor %40, %true : i1
      verif.assert %63 : i1
      %64 = comb.and %54, %8 : i1
      %65 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %66 = comb.icmp eq %arg5, %c0_i20 : i20
      %67 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %68 = comb.mux %39, %66, %67 : i1
      %69 = comb.mux %17, %65, %68 : i1
      %70 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %71 = comb.icmp eq %arg5, %c0_i20 : i20
      %72 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %73 = comb.mux %39, %71, %72 : i1
      %74 = comb.mux %17, %70, %73 : i1
      %75 = comb.mux %53, %69, %74 : i1
      %76 = comb.or %arg18, %75 : i1
      %77 = comb.xor %64, %true : i1
      %78 = comb.and %54, %77 : i1
      %79 = comb.and %55, %77 : i1
      %false_7 = hw.constant false
      %80 = comb.and %20, %77 : i1
      %81 = comb.and %76, %78, %arg16 : i1
      fsm.output %80, %u_sck_flop2Fq_o, %csb_q, %38, %false_3, %81, %78, %false, %79, %false_7, %cmd_speed_q, %42, %false_1, %64, %false_0 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
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
        %c0_i3_0 = hw.constant 0 : i3
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.mux %18, %c0_i3_0, %16 : i3
        %20 = comb.xor %18, %true : i1
        %21 = comb.icmp ne %19, %c0_i3_0 : i3
        %true_1 = hw.constant true
        %22 = comb.xor %7, %true_1 : i1
        %23 = comb.and %arg15, %22 : i1
        %24 = comb.mux %14, %23, %11 : i1
        %true_2 = hw.constant true
        %25 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %26 = comb.xor %18, %true_3 : i1
        %27 = comb.and %arg15, %20, %14 : i1
        %28 = comb.mux %27, %arg14, %csid_q : i1
        %29 = comb.mux %27, %arg12, %cpha_q : i1
        %30 = comb.mux %27, %arg3, %cmd_wr_en_q : i1
        %31 = comb.mux %27, %arg4, %cmd_rd_en_q : i1
        %32 = comb.mux %27, %arg2, %cmd_speed_q : i2
        %33 = comb.xor %29, %true : i1
        %34 = comb.icmp eq %arg2, %c0_i2 : i2
        %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %36 = comb.mux %27, %34, %35 : i1
        %37 = comb.and %31, %30 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %36, %38 : i1
        verif.assert %39 : i1
        %40 = comb.icmp ne %32, %c-1_i2 : i2
        verif.assert %40 : i1
        %41 = comb.xor %28, %true : i1
        verif.assert %41 : i1
        %42 = comb.and %33, %13, %21, %26, %25, %24, %30, %8 : i1
        %43 = comb.or %42, %18 : i1
        %44 = comb.and %arg15, %7 : i1
        %true_4 = hw.constant true
        %45 = comb.xor %11, %true_4 : i1
        %46 = comb.mux %14, %44, %45 : i1
        %true_5 = hw.constant true
        %47 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %48 = comb.xor %43, %true_6 : i1
        %49 = comb.and %48, %47, %46 : i1
        fsm.return %49
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %12 = comb.mux %11, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.xor %18, %true : i1
        %c0_i3_0 = hw.constant 0 : i3
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %22 = comb.or %arg18, %arg1 : i1
        %23 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %24 = comb.and %cmd_wr_en_q, %20 : i1
        %25 = comb.or %24, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %25 : i1
        %26 = comb.and %arg15, %19, %14 : i1
        %27 = comb.mux %26, %arg14, %csid_q : i1
        %28 = comb.mux %26, %arg13, %cpol_q : i1
        %29 = comb.mux %26, %arg12, %cpha_q : i1
        %30 = comb.mux %26, %arg8, %csnidle_q : i4
        %31 = comb.mux %26, %arg9, %csnlead_q : i4
        %32 = comb.mux %26, %arg3, %cmd_wr_en_q : i1
        %33 = comb.mux %26, %arg4, %cmd_rd_en_q : i1
        %34 = comb.mux %26, %arg2, %cmd_speed_q : i2
        %35 = comb.mux %26, %arg7, %clk_cntr_q : i16
        %36 = comb.mux %arg18, %c0_i16, %35 : i16
        %37 = comb.mux %18, %c0_i3_0, %16 : i3
        %38 = comb.icmp ne %37, %c0_i3_0 : i3
        %true_1 = hw.constant true
        %39 = comb.xor %7, %true_1 : i1
        %40 = comb.and %arg15, %39 : i1
        %41 = comb.mux %14, %40, %11 : i1
        %true_2 = hw.constant true
        %42 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %43 = comb.xor %18, %true_3 : i1
        %44 = comb.xor %29, %true : i1
        %45 = comb.and %44, %13, %38, %43, %42, %41 : i1
        %46 = comb.xor %33, %true : i1
        %47 = comb.xor %32, %true : i1
        %48 = comb.and %46, %47 : i1
        %49 = comb.icmp eq %arg2, %c0_i2 : i2
        %50 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %51 = comb.mux %26, %49, %50 : i1
        %52 = comb.icmp eq %arg2, %c1_i2 : i2
        %53 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %54 = comb.mux %26, %52, %53 : i1
        %55 = comb.icmp eq %arg2, %c-2_i2 : i2
        %56 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %57 = comb.mux %26, %55, %56 : i1
        %58 = comb.mux %57, %c-4_i3, %c1_i3 : i3
        %59 = comb.xor %48, %true : i1
        %60 = comb.xor %51, %true : i1
        %61 = comb.and %60, %59, %54 : i1
        %62 = comb.mux %61, %c-2_i3, %58 : i3
        %63 = comb.and %59, %51 : i1
        %64 = comb.mux %63, %c-1_i3, %62 : i3
        %65 = comb.mux %48, %c0_i3, %64 : i3
        %66 = comb.mux %45, %65, %bit_cntr_q : i3
        %67 = comb.mux %17, %bit_cntr_q, %66 : i3
        %68 = comb.mux %arg18, %c0_i3, %67 : i3
        %69 = comb.mux %26, %arg5, %byte_cntr_cpha0_q : i20
        %70 = comb.mux %arg18, %c0_i20, %69 : i20
        %71 = comb.mux %26, %arg5, %byte_cntr_cpha1_q : i20
        %72 = comb.mux %arg18, %c0_i20, %71 : i20
        %true_4 = hw.constant true
        %73 = comb.xor %7, %true_4 : i1
        %74 = comb.and %arg15, %73 : i1
        %75 = comb.mux %14, %74, %11 : i1
        %true_5 = hw.constant true
        %76 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %77 = comb.xor %18, %true_6 : i1
        %78 = comb.and %77, %76, %75 : i1
        %79 = comb.and %arg15, %7 : i1
        %true_7 = hw.constant true
        %80 = comb.xor %11, %true_7 : i1
        %81 = comb.mux %14, %79, %80 : i1
        %true_8 = hw.constant true
        %82 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %83 = comb.xor %18, %true_9 : i1
        %84 = comb.and %38, %14 : i1
        %85 = comb.xor %78, %true : i1
        %86 = comb.and %85, %84 : i1
        %87 = comb.and %86, %83, %82, %81 : i1
        %88 = comb.mux %87, %30, %c0_i4 : i4
        %89 = comb.and %84, %78 : i1
        %90 = comb.mux %89, %31, %88 : i4
        %91 = comb.mux %22, %90, %wait_cntr_q : i4
        %92 = comb.mux %arg18, %c0_i4, %91 : i4
        %93 = comb.xor %38, %true : i1
        %94 = comb.and %23, %93, %14 : i1
        %95 = comb.mux %94, %21, %92 : i4
        %96 = comb.icmp ne %37, %c-4_i3 : i3
        %97 = comb.and %85, %96 : i1
        %98 = comb.icmp ne %37, %c3_i3 : i3
        %99 = comb.and %28, %98 : i1
        %100 = comb.icmp eq %arg2, %c0_i2 : i2
        %101 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %102 = comb.mux %26, %100, %101 : i1
        %103 = comb.and %33, %32 : i1
        %104 = comb.xor %103, %true : i1
        %105 = comb.or %102, %104 : i1
        verif.assert %105 : i1
        %106 = comb.icmp ne %34, %c-1_i2 : i2
        verif.assert %106 : i1
        %107 = comb.xor %27, %true : i1
        verif.assert %107 : i1
        %108 = comb.and %45, %32, %8 : i1
        %109 = comb.mux %108, %clk_cntr_q, %36 : i16
        %110 = comb.mux %108, %bit_cntr_q, %68 : i3
        %111 = comb.mux %108, %byte_cntr_cpha0_q, %70 : i20
        %112 = comb.mux %108, %byte_cntr_cpha1_q, %72 : i20
        %113 = comb.mux %108, %wait_cntr_q, %95 : i4
        fsm.update %wait_cntr_q, %113 : i4
        fsm.update %byte_cntr_cpha1_q, %112 : i20
        fsm.update %byte_cntr_cpha0_q, %111 : i20
        fsm.update %bit_cntr_q, %110 : i3
        fsm.update %clk_cntr_q, %109 : i16
        %114 = comb.xor %108, %true : i1
        %115 = comb.and %26, %114 : i1
        %116 = comb.mux %115, %arg14, %csid_q : i1
        %117 = comb.mux %115, %arg13, %cpol_q : i1
        %118 = comb.mux %115, %arg12, %cpha_q : i1
        %119 = comb.mux %115, %arg11, %full_cyc_q : i1
        %120 = comb.mux %115, %arg8, %csnidle_q : i4
        %121 = comb.mux %115, %arg9, %csnlead_q : i4
        %122 = comb.mux %115, %arg10, %csntrail_q : i4
        %123 = comb.mux %115, %arg7, %clkdiv_q : i16
        %124 = comb.mux %115, %arg6, %csaat_q : i1
        %125 = comb.mux %115, %arg3, %cmd_wr_en_q : i1
        %126 = comb.mux %115, %arg4, %cmd_rd_en_q : i1
        %127 = comb.mux %115, %arg2, %cmd_speed_q : i2
        %128 = comb.mux %115, %arg5, %cmd_len_q : i20
        %129 = comb.and %38, %114 : i1
        %130 = comb.mux bin %129, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %131 = comb.and %arg1, %114 : i1
        %132 = comb.mux %131, %45, %sample_en_q : i1
        %133 = comb.mux %131, %sample_en_q, %sample_en_q2 : i1
        %134 = comb.mux bin %108, %u_sck_flop2Fq_o, %99 : i1
        %135 = comb.mux %114, %97, %csb_q : i1
        %136 = comb.or %27, %135 : i1
        fsm.update %csb_q, %136 : i1
        fsm.update %u_sck_flop2Fq_o, %134 : i1
        fsm.update %sample_en_q2, %133 : i1
        fsm.update %sample_en_q, %132 : i1
        fsm.update %segment_rd_en_cpha1, %130 : i1
        fsm.update %cmd_len_q, %128 : i20
        fsm.update %cmd_speed_q, %127 : i2
        fsm.update %cmd_wr_en_q, %125 : i1
        fsm.update %cmd_rd_en_q, %126 : i1
        fsm.update %csaat_q, %124 : i1
        fsm.update %clkdiv_q, %123 : i16
        fsm.update %csntrail_q, %122 : i4
        fsm.update %csnlead_q, %121 : i4
        fsm.update %csnidle_q, %120 : i4
        fsm.update %full_cyc_q, %119 : i1
        fsm.update %cpha_q, %118 : i1
        fsm.update %cpol_q, %117 : i1
        fsm.update %csid_q, %116 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
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
        %c0_i3_0 = hw.constant 0 : i3
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.mux %18, %c0_i3_0, %16 : i3
        %20 = comb.xor %18, %true : i1
        %21 = comb.icmp ne %19, %c0_i3_0 : i3
        %true_1 = hw.constant true
        %22 = comb.xor %7, %true_1 : i1
        %23 = comb.and %arg15, %22 : i1
        %24 = comb.mux %14, %23, %11 : i1
        %true_2 = hw.constant true
        %25 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %26 = comb.xor %18, %true_3 : i1
        %27 = comb.and %arg15, %20, %14 : i1
        %28 = comb.mux %27, %arg14, %csid_q : i1
        %29 = comb.mux %27, %arg12, %cpha_q : i1
        %30 = comb.mux %27, %arg3, %cmd_wr_en_q : i1
        %31 = comb.mux %27, %arg4, %cmd_rd_en_q : i1
        %32 = comb.mux %27, %arg2, %cmd_speed_q : i2
        %33 = comb.xor %29, %true : i1
        %34 = comb.icmp eq %arg2, %c0_i2 : i2
        %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %36 = comb.mux %27, %34, %35 : i1
        %37 = comb.and %31, %30 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %36, %38 : i1
        verif.assert %39 : i1
        %40 = comb.icmp ne %32, %c-1_i2 : i2
        verif.assert %40 : i1
        %41 = comb.xor %28, %true : i1
        verif.assert %41 : i1
        %42 = comb.and %33, %13, %21, %26, %25, %24, %30, %8 : i1
        %43 = comb.or %42, %18 : i1
        %true_4 = hw.constant true
        %44 = comb.xor %7, %true_4 : i1
        %45 = comb.and %arg15, %44 : i1
        %46 = comb.mux %14, %45, %11 : i1
        %true_5 = hw.constant true
        %47 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %48 = comb.xor %43, %true_6 : i1
        %49 = comb.and %48, %47, %46 : i1
        fsm.return %49
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %12 = comb.mux %11, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.xor %18, %true : i1
        %c0_i3_0 = hw.constant 0 : i3
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %22 = comb.or %arg18, %arg1 : i1
        %23 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %24 = comb.and %cmd_wr_en_q, %20 : i1
        %25 = comb.or %24, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %25 : i1
        %26 = comb.and %arg15, %19, %14 : i1
        %27 = comb.mux %26, %arg14, %csid_q : i1
        %28 = comb.mux %26, %arg13, %cpol_q : i1
        %29 = comb.mux %26, %arg12, %cpha_q : i1
        %30 = comb.mux %26, %arg8, %csnidle_q : i4
        %31 = comb.mux %26, %arg9, %csnlead_q : i4
        %32 = comb.mux %26, %arg3, %cmd_wr_en_q : i1
        %33 = comb.mux %26, %arg4, %cmd_rd_en_q : i1
        %34 = comb.mux %26, %arg2, %cmd_speed_q : i2
        %35 = comb.mux %26, %arg7, %clk_cntr_q : i16
        %36 = comb.mux %arg18, %c0_i16, %35 : i16
        %37 = comb.mux %18, %c0_i3_0, %16 : i3
        %38 = comb.icmp ne %37, %c0_i3_0 : i3
        %true_1 = hw.constant true
        %39 = comb.xor %7, %true_1 : i1
        %40 = comb.and %arg15, %39 : i1
        %41 = comb.mux %14, %40, %11 : i1
        %true_2 = hw.constant true
        %42 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %43 = comb.xor %18, %true_3 : i1
        %44 = comb.xor %29, %true : i1
        %45 = comb.and %44, %13, %38, %43, %42, %41 : i1
        %46 = comb.xor %33, %true : i1
        %47 = comb.xor %32, %true : i1
        %48 = comb.and %46, %47 : i1
        %49 = comb.icmp eq %arg2, %c0_i2 : i2
        %50 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %51 = comb.mux %26, %49, %50 : i1
        %52 = comb.icmp eq %arg2, %c1_i2 : i2
        %53 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %54 = comb.mux %26, %52, %53 : i1
        %55 = comb.icmp eq %arg2, %c-2_i2 : i2
        %56 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %57 = comb.mux %26, %55, %56 : i1
        %58 = comb.mux %57, %c-4_i3, %c1_i3 : i3
        %59 = comb.xor %48, %true : i1
        %60 = comb.xor %51, %true : i1
        %61 = comb.and %60, %59, %54 : i1
        %62 = comb.mux %61, %c-2_i3, %58 : i3
        %63 = comb.and %59, %51 : i1
        %64 = comb.mux %63, %c-1_i3, %62 : i3
        %65 = comb.mux %48, %c0_i3, %64 : i3
        %66 = comb.and %arg1, %45 : i1
        %67 = comb.mux %66, %65, %bit_cntr_q : i3
        %68 = comb.mux %arg18, %c0_i3, %67 : i3
        %69 = comb.mux %26, %arg5, %byte_cntr_cpha0_q : i20
        %70 = comb.mux %arg18, %c0_i20, %69 : i20
        %71 = comb.mux %26, %arg5, %byte_cntr_cpha1_q : i20
        %72 = comb.mux %arg18, %c0_i20, %71 : i20
        %true_4 = hw.constant true
        %73 = comb.xor %7, %true_4 : i1
        %74 = comb.and %arg15, %73 : i1
        %75 = comb.mux %14, %74, %11 : i1
        %true_5 = hw.constant true
        %76 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %77 = comb.xor %18, %true_6 : i1
        %78 = comb.and %77, %76, %75 : i1
        %79 = comb.and %arg15, %7 : i1
        %true_7 = hw.constant true
        %80 = comb.xor %11, %true_7 : i1
        %81 = comb.mux %14, %79, %80 : i1
        %true_8 = hw.constant true
        %82 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %83 = comb.xor %18, %true_9 : i1
        %84 = comb.and %38, %14 : i1
        %85 = comb.xor %78, %true : i1
        %86 = comb.and %85, %84, %83, %82, %81 : i1
        %87 = comb.mux %86, %30, %c0_i4 : i4
        %88 = comb.and %84, %78 : i1
        %89 = comb.mux %88, %31, %87 : i4
        %90 = comb.mux %22, %89, %wait_cntr_q : i4
        %91 = comb.mux %arg18, %c0_i4, %90 : i4
        %92 = comb.xor %38, %true : i1
        %93 = comb.and %23, %92, %14 : i1
        %94 = comb.mux %93, %21, %91 : i4
        %95 = comb.icmp ne %37, %c-4_i3 : i3
        %96 = comb.and %85, %95 : i1
        %97 = comb.icmp ne %37, %c3_i3 : i3
        %98 = comb.and %28, %97 : i1
        %99 = comb.icmp eq %arg2, %c0_i2 : i2
        %100 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %101 = comb.mux %26, %99, %100 : i1
        %102 = comb.and %33, %32 : i1
        %103 = comb.xor %102, %true : i1
        %104 = comb.or %101, %103 : i1
        verif.assert %104 : i1
        %105 = comb.icmp ne %34, %c-1_i2 : i2
        verif.assert %105 : i1
        %106 = comb.xor %27, %true : i1
        verif.assert %106 : i1
        %107 = comb.and %45, %32, %8 : i1
        %108 = comb.mux %107, %clk_cntr_q, %36 : i16
        %109 = comb.mux %107, %bit_cntr_q, %68 : i3
        %110 = comb.mux %107, %byte_cntr_cpha0_q, %70 : i20
        %111 = comb.mux %107, %byte_cntr_cpha1_q, %72 : i20
        %112 = comb.mux %107, %wait_cntr_q, %94 : i4
        fsm.update %wait_cntr_q, %112 : i4
        fsm.update %byte_cntr_cpha1_q, %111 : i20
        fsm.update %byte_cntr_cpha0_q, %110 : i20
        fsm.update %bit_cntr_q, %109 : i3
        fsm.update %clk_cntr_q, %108 : i16
        %113 = comb.xor %107, %true : i1
        %114 = comb.and %26, %113 : i1
        %115 = comb.mux %114, %arg14, %csid_q : i1
        %116 = comb.mux %114, %arg13, %cpol_q : i1
        %117 = comb.mux %114, %arg12, %cpha_q : i1
        %118 = comb.mux %114, %arg11, %full_cyc_q : i1
        %119 = comb.mux %114, %arg8, %csnidle_q : i4
        %120 = comb.mux %114, %arg9, %csnlead_q : i4
        %121 = comb.mux %114, %arg10, %csntrail_q : i4
        %122 = comb.mux %114, %arg7, %clkdiv_q : i16
        %123 = comb.mux %114, %arg6, %csaat_q : i1
        %124 = comb.mux %114, %arg3, %cmd_wr_en_q : i1
        %125 = comb.mux %114, %arg4, %cmd_rd_en_q : i1
        %126 = comb.mux %114, %arg2, %cmd_speed_q : i2
        %127 = comb.mux %114, %arg5, %cmd_len_q : i20
        %128 = comb.and %38, %113 : i1
        %129 = comb.mux bin %128, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %130 = comb.and %arg1, %113 : i1
        %131 = comb.mux %130, %45, %sample_en_q : i1
        %132 = comb.mux %130, %sample_en_q, %sample_en_q2 : i1
        %133 = comb.mux bin %107, %u_sck_flop2Fq_o, %98 : i1
        %134 = comb.mux %113, %96, %csb_q : i1
        %135 = comb.or %27, %134 : i1
        fsm.update %csb_q, %135 : i1
        fsm.update %u_sck_flop2Fq_o, %133 : i1
        fsm.update %sample_en_q2, %132 : i1
        fsm.update %sample_en_q, %131 : i1
        fsm.update %segment_rd_en_cpha1, %129 : i1
        fsm.update %cmd_len_q, %127 : i20
        fsm.update %cmd_speed_q, %126 : i2
        fsm.update %cmd_wr_en_q, %124 : i1
        fsm.update %cmd_rd_en_q, %125 : i1
        fsm.update %csaat_q, %123 : i1
        fsm.update %clkdiv_q, %122 : i16
        fsm.update %csntrail_q, %121 : i4
        fsm.update %csnlead_q, %120 : i4
        fsm.update %csnidle_q, %119 : i4
        fsm.update %full_cyc_q, %118 : i1
        fsm.update %cpha_q, %117 : i1
        fsm.update %cpol_q, %116 : i1
        fsm.update %csid_q, %115 : i1
      }
      fsm.transition @state_0 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
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
        %c0_i3_0 = hw.constant 0 : i3
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.mux %18, %c0_i3_0, %16 : i3
        %20 = comb.xor %18, %true : i1
        %21 = comb.icmp ne %19, %c0_i3_0 : i3
        %true_1 = hw.constant true
        %22 = comb.xor %7, %true_1 : i1
        %23 = comb.and %arg15, %22 : i1
        %24 = comb.mux %14, %23, %11 : i1
        %true_2 = hw.constant true
        %25 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %26 = comb.xor %18, %true_3 : i1
        %27 = comb.and %arg15, %20, %14 : i1
        %28 = comb.mux %27, %arg14, %csid_q : i1
        %29 = comb.mux %27, %arg12, %cpha_q : i1
        %30 = comb.mux %27, %arg3, %cmd_wr_en_q : i1
        %31 = comb.mux %27, %arg4, %cmd_rd_en_q : i1
        %32 = comb.mux %27, %arg2, %cmd_speed_q : i2
        %33 = comb.xor %29, %true : i1
        %34 = comb.icmp eq %arg2, %c0_i2 : i2
        %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %36 = comb.mux %27, %34, %35 : i1
        %37 = comb.and %31, %30 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %36, %38 : i1
        verif.assert %39 : i1
        %40 = comb.icmp ne %32, %c-1_i2 : i2
        verif.assert %40 : i1
        %41 = comb.xor %28, %true : i1
        verif.assert %41 : i1
        %42 = comb.and %33, %13, %21, %26, %25, %24, %30, %8 : i1
        %true_4 = hw.constant true
        %43 = comb.xor %arg15, %true_4 : i1
        %44 = comb.and %14, %43 : i1
        %45 = comb.or %42, %18, %arg18, %44 : i1
        fsm.return %45
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %11 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %12 = comb.mux %11, %c1_i3, %c-2_i3 : i3
        %13 = comb.xor %arg18, %true : i1
        %14 = comb.and %arg1, %13 : i1
        %15 = comb.mux %14, %10, %12 : i3
        %16 = comb.mux %arg18, %c0_i3, %15 : i3
        %17 = comb.xor %arg1, %true : i1
        %18 = comb.and %13, %17 : i1
        %19 = comb.xor %18, %true : i1
        %c0_i3_0 = hw.constant 0 : i3
        %20 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %21 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %22 = comb.or %arg18, %arg1 : i1
        %23 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %24 = comb.and %cmd_wr_en_q, %20 : i1
        %25 = comb.or %24, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %25 : i1
        %26 = comb.and %arg15, %19, %14 : i1
        %27 = comb.mux %26, %arg14, %csid_q : i1
        %28 = comb.mux %26, %arg13, %cpol_q : i1
        %29 = comb.mux %26, %arg12, %cpha_q : i1
        %30 = comb.mux %26, %arg8, %csnidle_q : i4
        %31 = comb.mux %26, %arg9, %csnlead_q : i4
        %32 = comb.mux %26, %arg3, %cmd_wr_en_q : i1
        %33 = comb.mux %26, %arg4, %cmd_rd_en_q : i1
        %34 = comb.mux %26, %arg2, %cmd_speed_q : i2
        %35 = comb.mux %26, %arg7, %clk_cntr_q : i16
        %36 = comb.mux %arg18, %c0_i16, %35 : i16
        %37 = comb.mux %18, %c0_i3_0, %16 : i3
        %38 = comb.icmp ne %37, %c0_i3_0 : i3
        %true_1 = hw.constant true
        %39 = comb.xor %7, %true_1 : i1
        %40 = comb.and %arg15, %39 : i1
        %41 = comb.mux %14, %40, %11 : i1
        %true_2 = hw.constant true
        %42 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %43 = comb.xor %18, %true_3 : i1
        %44 = comb.xor %29, %true : i1
        %45 = comb.and %44, %13, %38, %43, %42, %41 : i1
        %46 = comb.xor %33, %true : i1
        %47 = comb.xor %32, %true : i1
        %48 = comb.and %46, %47 : i1
        %49 = comb.icmp eq %arg2, %c0_i2 : i2
        %50 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %51 = comb.mux %26, %49, %50 : i1
        %52 = comb.icmp eq %arg2, %c1_i2 : i2
        %53 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %54 = comb.mux %26, %52, %53 : i1
        %55 = comb.icmp eq %arg2, %c-2_i2 : i2
        %56 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %57 = comb.mux %26, %55, %56 : i1
        %58 = comb.mux %57, %c-4_i3, %c1_i3 : i3
        %59 = comb.xor %48, %true : i1
        %60 = comb.xor %51, %true : i1
        %61 = comb.and %60, %59, %54 : i1
        %62 = comb.mux %61, %c-2_i3, %58 : i3
        %63 = comb.and %59, %51 : i1
        %64 = comb.mux %63, %c-1_i3, %62 : i3
        %65 = comb.mux %48, %c0_i3, %64 : i3
        %66 = comb.and %arg1, %45 : i1
        %67 = comb.mux %66, %65, %bit_cntr_q : i3
        %68 = comb.mux %arg18, %c0_i3, %67 : i3
        %69 = comb.mux %26, %arg5, %byte_cntr_cpha0_q : i20
        %70 = comb.mux %arg18, %c0_i20, %69 : i20
        %71 = comb.mux %26, %arg5, %byte_cntr_cpha1_q : i20
        %72 = comb.mux %arg18, %c0_i20, %71 : i20
        %true_4 = hw.constant true
        %73 = comb.xor %7, %true_4 : i1
        %74 = comb.and %arg15, %73 : i1
        %75 = comb.mux %14, %74, %11 : i1
        %true_5 = hw.constant true
        %76 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %77 = comb.xor %18, %true_6 : i1
        %78 = comb.and %77, %76, %75 : i1
        %79 = comb.and %arg15, %7 : i1
        %true_7 = hw.constant true
        %80 = comb.xor %11, %true_7 : i1
        %81 = comb.mux %14, %79, %80 : i1
        %true_8 = hw.constant true
        %82 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %83 = comb.xor %18, %true_9 : i1
        %84 = comb.and %38, %14 : i1
        %85 = comb.xor %78, %true : i1
        %86 = comb.and %85, %84, %83, %82, %81 : i1
        %87 = comb.mux %86, %30, %c0_i4 : i4
        %88 = comb.and %84, %78 : i1
        %89 = comb.mux %88, %31, %87 : i4
        %90 = comb.mux %22, %89, %wait_cntr_q : i4
        %91 = comb.mux %arg18, %c0_i4, %90 : i4
        %92 = comb.xor %38, %true : i1
        %93 = comb.and %23, %92, %14 : i1
        %94 = comb.mux %93, %21, %91 : i4
        %95 = comb.icmp ne %37, %c-4_i3 : i3
        %96 = comb.and %85, %95 : i1
        %97 = comb.icmp ne %37, %c3_i3 : i3
        %98 = comb.and %28, %97 : i1
        %99 = comb.icmp eq %arg2, %c0_i2 : i2
        %100 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %101 = comb.mux %26, %99, %100 : i1
        %102 = comb.and %33, %32 : i1
        %103 = comb.xor %102, %true : i1
        %104 = comb.or %101, %103 : i1
        verif.assert %104 : i1
        %105 = comb.icmp ne %34, %c-1_i2 : i2
        verif.assert %105 : i1
        %106 = comb.xor %27, %true : i1
        verif.assert %106 : i1
        %107 = comb.and %45, %32, %8 : i1
        %108 = comb.mux %107, %clk_cntr_q, %36 : i16
        %109 = comb.mux %107, %bit_cntr_q, %68 : i3
        %110 = comb.mux %107, %byte_cntr_cpha0_q, %70 : i20
        %111 = comb.mux %107, %byte_cntr_cpha1_q, %72 : i20
        %112 = comb.mux %107, %wait_cntr_q, %94 : i4
        fsm.update %wait_cntr_q, %112 : i4
        fsm.update %byte_cntr_cpha1_q, %111 : i20
        fsm.update %byte_cntr_cpha0_q, %110 : i20
        fsm.update %bit_cntr_q, %109 : i3
        fsm.update %clk_cntr_q, %108 : i16
        %113 = comb.xor %107, %true : i1
        %114 = comb.and %26, %113 : i1
        %115 = comb.mux %114, %arg14, %csid_q : i1
        %116 = comb.mux %114, %arg13, %cpol_q : i1
        %117 = comb.mux %114, %arg12, %cpha_q : i1
        %118 = comb.mux %114, %arg11, %full_cyc_q : i1
        %119 = comb.mux %114, %arg8, %csnidle_q : i4
        %120 = comb.mux %114, %arg9, %csnlead_q : i4
        %121 = comb.mux %114, %arg10, %csntrail_q : i4
        %122 = comb.mux %114, %arg7, %clkdiv_q : i16
        %123 = comb.mux %114, %arg6, %csaat_q : i1
        %124 = comb.mux %114, %arg3, %cmd_wr_en_q : i1
        %125 = comb.mux %114, %arg4, %cmd_rd_en_q : i1
        %126 = comb.mux %114, %arg2, %cmd_speed_q : i2
        %127 = comb.mux %114, %arg5, %cmd_len_q : i20
        %128 = comb.and %38, %113 : i1
        %129 = comb.mux bin %128, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %130 = comb.and %arg1, %113 : i1
        %131 = comb.mux %130, %45, %sample_en_q : i1
        %132 = comb.mux %130, %sample_en_q, %sample_en_q2 : i1
        %133 = comb.mux bin %107, %u_sck_flop2Fq_o, %98 : i1
        %134 = comb.mux %113, %96, %csb_q : i1
        %135 = comb.or %27, %134 : i1
        fsm.update %csb_q, %135 : i1
        fsm.update %u_sck_flop2Fq_o, %133 : i1
        fsm.update %sample_en_q2, %132 : i1
        fsm.update %sample_en_q, %131 : i1
        fsm.update %segment_rd_en_cpha1, %129 : i1
        fsm.update %cmd_len_q, %127 : i20
        fsm.update %cmd_speed_q, %126 : i2
        fsm.update %cmd_wr_en_q, %124 : i1
        fsm.update %cmd_rd_en_q, %125 : i1
        fsm.update %csaat_q, %123 : i1
        fsm.update %clkdiv_q, %122 : i16
        fsm.update %csntrail_q, %121 : i4
        fsm.update %csnlead_q, %120 : i4
        fsm.update %csnidle_q, %119 : i4
        fsm.update %full_cyc_q, %118 : i1
        fsm.update %cpha_q, %117 : i1
        fsm.update %cpol_q, %116 : i1
        fsm.update %csid_q, %115 : i1
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
      %c-1_i2 = hw.constant -1 : i2
      %true = hw.constant true
      %false = hw.constant false
      %false_0 = hw.constant false
      %true_1 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %false_2 = hw.constant false
      %2 = comb.and %arg1, %0 : i1
      %3 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %4 = comb.mux %3, %c1_i3, %c-2_i3 : i3
      %5 = comb.xor %arg18, %true : i1
      %6 = comb.and %2, %5 : i1
      %7 = comb.xor %2, %true : i1
      %8 = comb.and %5, %7 : i1
      %c1_i3_3 = hw.constant 1 : i3
      %9 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
      %10 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
      %11 = comb.xor %cpha_q, %true : i1
      %false_4 = hw.constant false
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
      %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %36 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
      %37 = comb.xor %36, %true : i1
      %38 = comb.or %35, %37 : i1
      verif.assert %38 : i1
      %39 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
      verif.assert %39 : i1
      %40 = comb.xor %csid_q, %true : i1
      verif.assert %40 : i1
      %false_5 = hw.constant false
      %true_6 = hw.constant true
      %41 = comb.concat %false_5, %3, %true_6 : i1, i1, i1
      %42 = comb.mux %6, %41, %4 : i3
      %43 = comb.mux %arg18, %c0_i3, %42 : i3
      %44 = comb.mux %8, %c1_i3_3, %43 : i3
      %45 = comb.icmp ne %44, %c1_i3_3 : i3
      %46 = comb.and %5, %45 : i1
      %47 = comb.xor %6, %3 : i1
      %true_7 = hw.constant true
      %48 = comb.xor %arg18, %true_7 : i1
      %49 = comb.and %48, %47 : i1
      %50 = comb.or %8, %49 : i1
      %51 = comb.and %46, %50 : i1
      %true_8 = hw.constant true
      %52 = comb.xor %arg18, %true_8 : i1
      %true_9 = hw.constant true
      %53 = comb.xor %8, %true_9 : i1
      %54 = comb.and %53, %52, %6, %3 : i1
      %55 = comb.and %46, %54, %9 : i1
      %56 = comb.mux %11, %51, %55 : i1
      %57 = comb.and %56, %cmd_wr_en_q : i1
      %58 = comb.and %57, %1 : i1
      %59 = comb.xor %58, %true : i1
      %60 = comb.and %57, %59 : i1
      %61 = comb.and %16, %59 : i1
      %62 = comb.and %cpha_q, %46, %54, %10, %59 : i1
      %63 = comb.and %15, %60, %arg16 : i1
      fsm.output %false_0, %u_sck_flop2Fq_o, %csb_q, %34, %false_4, %63, %60, %false, %61, %62, %cmd_speed_q, %full_cyc_q, %false_2, %58, %true_1 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c1_i3_0 = hw.constant 1 : i3
        %5 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %6 = comb.and %arg1, %0 : i1
        %7 = comb.and %6, %4 : i1
        %false = hw.constant false
        %true_1 = hw.constant true
        %8 = comb.concat %false, %2, %true_1 : i1, i1, i1
        %9 = comb.mux %7, %8, %3 : i3
        %10 = comb.mux %arg18, %c0_i3, %9 : i3
        %11 = comb.xor %6, %true : i1
        %12 = comb.and %4, %11 : i1
        %13 = comb.mux %12, %c1_i3_0, %10 : i3
        %14 = comb.icmp ne %13, %c1_i3_0 : i3
        %15 = comb.and %4, %14 : i1
        %16 = comb.xor %7, %2 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %arg18, %true_2 : i1
        %18 = comb.and %17, %16 : i1
        %19 = comb.or %12, %18 : i1
        %20 = comb.and %15, %19 : i1
        %true_3 = hw.constant true
        %21 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %22 = comb.xor %12, %true_4 : i1
        %23 = comb.and %15, %22, %21, %7, %2, %5 : i1
        %24 = comb.xor %cpha_q, %true : i1
        %25 = comb.mux %24, %20, %23 : i1
        %26 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %27 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %28 = comb.xor %27, %true : i1
        %29 = comb.or %26, %28 : i1
        verif.assert %29 : i1
        %30 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %30 : i1
        %31 = comb.xor %csid_q, %true : i1
        verif.assert %31 : i1
        %32 = comb.and %25, %cmd_wr_en_q, %1 : i1
        %33 = comb.or %32, %12 : i1
        %true_5 = hw.constant true
        %34 = comb.xor %2, %true_5 : i1
        %true_6 = hw.constant true
        %35 = comb.xor %7, %true_6 : i1
        %true_7 = hw.constant true
        %36 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %37 = comb.xor %33, %true_8 : i1
        %38 = comb.and %37, %36, %35, %34 : i1
        fsm.return %38
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.xor %7, %true : i1
        %13 = comb.and %10, %12 : i1
        %c1_i3_0 = hw.constant 1 : i3
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.xor %cmd_rd_en_q, %true : i1
        %18 = comb.xor %cmd_wr_en_q, %true : i1
        %19 = comb.and %17, %18 : i1
        %20 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %23 = comb.mux %22, %c-4_i3, %c1_i3 : i3
        %24 = comb.xor %19, %true : i1
        %25 = comb.xor %20, %true : i1
        %26 = comb.and %25, %24, %21 : i1
        %27 = comb.mux %26, %c2_i3, %23 : i3
        %28 = comb.mux %26, %c-2_i3, %23 : i3
        %29 = comb.and %24, %20 : i1
        %30 = comb.mux %29, %c1_i3, %27 : i3
        %31 = comb.mux %29, %c-1_i3, %28 : i3
        %32 = comb.mux %19, %c0_i3, %30 : i3
        %33 = comb.mux %19, %c0_i3, %31 : i3
        %34 = comb.sub %bit_cntr_q, %32 : i3
        %35 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %36 = comb.or %arg18, %7 : i1
        %37 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %38 = comb.and %cmd_wr_en_q, %14 : i1
        %39 = comb.or %38, %cmd_wr_en_last_bit : i1
        %40 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %41 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %40, %42 : i1
        verif.assert %43 : i1
        %44 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %44 : i1
        %45 = comb.xor %csid_q, %true : i1
        verif.assert %45 : i1
        fsm.update %cmd_wr_en_last_bit, %39 : i1
        %false = hw.constant false
        %true_1 = hw.constant true
        %46 = comb.concat %false, %8, %true_1 : i1, i1, i1
        %47 = comb.mux %11, %46, %9 : i3
        %48 = comb.mux %arg18, %c0_i3, %47 : i3
        %49 = comb.mux %13, %c1_i3_0, %48 : i3
        %50 = comb.icmp ne %49, %c1_i3_0 : i3
        %51 = comb.and %10, %50 : i1
        %52 = comb.xor %11, %8 : i1
        %true_2 = hw.constant true
        %53 = comb.xor %arg18, %true_2 : i1
        %54 = comb.and %53, %52 : i1
        %55 = comb.or %13, %54 : i1
        %56 = comb.and %51, %55 : i1
        %true_3 = hw.constant true
        %57 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %58 = comb.xor %13, %true_4 : i1
        %59 = comb.and %58, %57, %11, %8 : i1
        %60 = comb.and %51, %59, %14 : i1
        %61 = comb.mux %16, %56, %60 : i1
        %62 = comb.and %cpha_q, %51, %59, %15 : i1
        %63 = comb.mux %62, %34, %bit_cntr_q : i3
        %64 = comb.mux %61, %33, %63 : i3
        %65 = comb.mux %12, %bit_cntr_q, %64 : i3
        %66 = comb.mux %arg18, %c0_i3, %65 : i3
        %67 = comb.xor %11, %8 : i1
        %true_5 = hw.constant true
        %68 = comb.xor %arg18, %true_5 : i1
        %69 = comb.and %68, %67 : i1
        %70 = comb.or %13, %69 : i1
        %true_6 = hw.constant true
        %71 = comb.xor %8, %true_6 : i1
        %true_7 = hw.constant true
        %72 = comb.xor %11, %true_7 : i1
        %true_8 = hw.constant true
        %73 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %74 = comb.xor %13, %true_9 : i1
        %75 = comb.and %50, %11 : i1
        %76 = comb.xor %70, %true : i1
        %77 = comb.and %76, %75 : i1
        %78 = comb.and %77, %74, %73, %72, %71 : i1
        %79 = comb.mux %78, %csnidle_q, %c0_i4 : i4
        %80 = comb.and %75, %70 : i1
        %81 = comb.mux %80, %csnlead_q, %79 : i4
        %82 = comb.mux %36, %81, %wait_cntr_q : i4
        %83 = comb.mux %arg18, %c0_i4, %82 : i4
        %84 = comb.xor %50, %true : i1
        %85 = comb.and %37, %84, %11 : i1
        %86 = comb.mux %85, %35, %83 : i4
        %true_10 = hw.constant true
        %87 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %88 = comb.xor %13, %true_11 : i1
        %89 = comb.icmp ne %49, %c-4_i3 : i3
        %90 = comb.and %76, %88, %87, %11, %8 : i1
        %91 = comb.xor %90, %true : i1
        %92 = comb.and %76, %91, %89 : i1
        %93 = comb.icmp ne %49, %c3_i3 : i3
        %94 = comb.mux %cpol_q, %93, %59 : i1
        %95 = comb.and %61, %cmd_wr_en_q, %6 : i1
        %96 = comb.mux %95, %clk_cntr_q, %5 : i16
        %97 = comb.mux %95, %bit_cntr_q, %66 : i3
        %true_12 = hw.constant true
        %98 = comb.xor %arg18, %true_12 : i1
        %99 = comb.or %95, %98 : i1
        %100 = comb.mux %99, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_13 = hw.constant true
        %101 = comb.xor %arg18, %true_13 : i1
        %102 = comb.or %95, %101 : i1
        %103 = comb.mux %102, %byte_cntr_cpha1_q, %c0_i20 : i20
        %104 = comb.mux %95, %wait_cntr_q, %86 : i4
        fsm.update %wait_cntr_q, %104 : i4
        fsm.update %byte_cntr_cpha1_q, %103 : i20
        fsm.update %byte_cntr_cpha0_q, %100 : i20
        fsm.update %bit_cntr_q, %97 : i3
        fsm.update %clk_cntr_q, %96 : i16
        %105 = comb.xor %95, %true : i1
        %106 = comb.and %62, %105 : i1
        %107 = comb.and %50, %105 : i1
        %108 = comb.mux bin %107, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %109 = comb.or %61, %106 : i1
        %110 = comb.and %7, %105 : i1
        %111 = comb.mux %110, %109, %sample_en_q : i1
        %112 = comb.mux %110, %sample_en_q, %sample_en_q2 : i1
        %113 = comb.mux bin %95, %u_sck_flop2Fq_o, %94 : i1
        %114 = comb.mux %105, %92, %csb_q : i1
        %115 = comb.or %csid_q, %114 : i1
        fsm.update %csb_q, %115 : i1
        fsm.update %u_sck_flop2Fq_o, %113 : i1
        fsm.update %sample_en_q2, %112 : i1
        fsm.update %sample_en_q, %111 : i1
        fsm.update %segment_rd_en_cpha1, %108 : i1
      }
      fsm.transition @state_3 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c1_i3_0 = hw.constant 1 : i3
        %5 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %6 = comb.and %arg1, %0 : i1
        %7 = comb.and %6, %4 : i1
        %false = hw.constant false
        %true_1 = hw.constant true
        %8 = comb.concat %false, %2, %true_1 : i1, i1, i1
        %9 = comb.mux %7, %8, %3 : i3
        %10 = comb.mux %arg18, %c0_i3, %9 : i3
        %11 = comb.xor %6, %true : i1
        %12 = comb.and %4, %11 : i1
        %13 = comb.mux %12, %c1_i3_0, %10 : i3
        %14 = comb.icmp ne %13, %c1_i3_0 : i3
        %15 = comb.and %4, %14 : i1
        %16 = comb.xor %7, %2 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %arg18, %true_2 : i1
        %18 = comb.and %17, %16 : i1
        %19 = comb.or %12, %18 : i1
        %20 = comb.and %15, %19 : i1
        %true_3 = hw.constant true
        %21 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %22 = comb.xor %12, %true_4 : i1
        %23 = comb.and %15, %22, %21, %7, %2, %5 : i1
        %24 = comb.xor %cpha_q, %true : i1
        %25 = comb.mux %24, %20, %23 : i1
        %26 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %27 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %28 = comb.xor %27, %true : i1
        %29 = comb.or %26, %28 : i1
        verif.assert %29 : i1
        %30 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %30 : i1
        %31 = comb.xor %csid_q, %true : i1
        verif.assert %31 : i1
        %32 = comb.and %25, %cmd_wr_en_q, %1 : i1
        %33 = comb.or %32, %12 : i1
        %true_5 = hw.constant true
        %34 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %35 = comb.xor %33, %true_6 : i1
        %36 = comb.and %35, %34, %7, %2 : i1
        fsm.return %36
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.xor %7, %true : i1
        %13 = comb.and %10, %12 : i1
        %c1_i3_0 = hw.constant 1 : i3
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.xor %cmd_rd_en_q, %true : i1
        %18 = comb.xor %cmd_wr_en_q, %true : i1
        %19 = comb.and %17, %18 : i1
        %20 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %23 = comb.mux %22, %c-4_i3, %c1_i3 : i3
        %24 = comb.xor %19, %true : i1
        %25 = comb.xor %20, %true : i1
        %26 = comb.and %25, %24, %21 : i1
        %27 = comb.mux %26, %c2_i3, %23 : i3
        %28 = comb.mux %26, %c-2_i3, %23 : i3
        %29 = comb.and %24, %20 : i1
        %30 = comb.mux %29, %c1_i3, %27 : i3
        %31 = comb.mux %29, %c-1_i3, %28 : i3
        %32 = comb.mux %19, %c0_i3, %30 : i3
        %33 = comb.mux %19, %c0_i3, %31 : i3
        %34 = comb.sub %bit_cntr_q, %32 : i3
        %35 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %36 = comb.or %arg18, %7 : i1
        %37 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %38 = comb.and %cmd_wr_en_q, %14 : i1
        %39 = comb.or %38, %cmd_wr_en_last_bit : i1
        %40 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %41 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %40, %42 : i1
        verif.assert %43 : i1
        %44 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %44 : i1
        %45 = comb.xor %csid_q, %true : i1
        verif.assert %45 : i1
        fsm.update %cmd_wr_en_last_bit, %39 : i1
        %false = hw.constant false
        %true_1 = hw.constant true
        %46 = comb.concat %false, %8, %true_1 : i1, i1, i1
        %47 = comb.mux %11, %46, %9 : i3
        %48 = comb.mux %arg18, %c0_i3, %47 : i3
        %49 = comb.mux %13, %c1_i3_0, %48 : i3
        %50 = comb.icmp ne %49, %c1_i3_0 : i3
        %51 = comb.and %10, %50 : i1
        %52 = comb.xor %11, %8 : i1
        %true_2 = hw.constant true
        %53 = comb.xor %arg18, %true_2 : i1
        %54 = comb.and %53, %52 : i1
        %55 = comb.or %13, %54 : i1
        %56 = comb.and %51, %55 : i1
        %true_3 = hw.constant true
        %57 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %58 = comb.xor %13, %true_4 : i1
        %59 = comb.and %58, %57, %11, %8 : i1
        %60 = comb.and %51, %59, %14 : i1
        %61 = comb.mux %16, %56, %60 : i1
        %62 = comb.and %cpha_q, %51, %59, %15 : i1
        %63 = comb.mux %62, %34, %bit_cntr_q : i3
        %64 = comb.mux %61, %33, %63 : i3
        %65 = comb.mux %12, %bit_cntr_q, %64 : i3
        %66 = comb.mux %arg18, %c0_i3, %65 : i3
        %67 = comb.xor %11, %8 : i1
        %true_5 = hw.constant true
        %68 = comb.xor %arg18, %true_5 : i1
        %69 = comb.and %68, %67 : i1
        %70 = comb.or %13, %69 : i1
        %true_6 = hw.constant true
        %71 = comb.xor %8, %true_6 : i1
        %true_7 = hw.constant true
        %72 = comb.xor %11, %true_7 : i1
        %true_8 = hw.constant true
        %73 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %74 = comb.xor %13, %true_9 : i1
        %75 = comb.and %50, %11 : i1
        %76 = comb.xor %70, %true : i1
        %77 = comb.and %76, %75, %74, %73, %72, %71 : i1
        %78 = comb.mux %77, %csnidle_q, %c0_i4 : i4
        %79 = comb.and %75, %70 : i1
        %80 = comb.mux %79, %csnlead_q, %78 : i4
        %81 = comb.mux %36, %80, %wait_cntr_q : i4
        %82 = comb.mux %arg18, %c0_i4, %81 : i4
        %83 = comb.xor %50, %true : i1
        %84 = comb.and %37, %83, %11 : i1
        %85 = comb.mux %84, %35, %82 : i4
        %true_10 = hw.constant true
        %86 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %87 = comb.xor %13, %true_11 : i1
        %88 = comb.icmp ne %49, %c-4_i3 : i3
        %89 = comb.and %76, %87, %86, %11, %8 : i1
        %90 = comb.xor %89, %true : i1
        %91 = comb.and %76, %90, %88 : i1
        %92 = comb.icmp ne %49, %c3_i3 : i3
        %93 = comb.mux %cpol_q, %92, %59 : i1
        %94 = comb.and %61, %cmd_wr_en_q, %6 : i1
        %95 = comb.mux %94, %clk_cntr_q, %5 : i16
        %96 = comb.mux %94, %bit_cntr_q, %66 : i3
        %true_12 = hw.constant true
        %97 = comb.xor %arg18, %true_12 : i1
        %98 = comb.or %94, %97 : i1
        %99 = comb.mux %98, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_13 = hw.constant true
        %100 = comb.xor %arg18, %true_13 : i1
        %101 = comb.or %94, %100 : i1
        %102 = comb.mux %101, %byte_cntr_cpha1_q, %c0_i20 : i20
        %103 = comb.mux %94, %wait_cntr_q, %85 : i4
        fsm.update %wait_cntr_q, %103 : i4
        fsm.update %byte_cntr_cpha1_q, %102 : i20
        fsm.update %byte_cntr_cpha0_q, %99 : i20
        fsm.update %bit_cntr_q, %96 : i3
        fsm.update %clk_cntr_q, %95 : i16
        %104 = comb.xor %94, %true : i1
        %105 = comb.and %62, %104 : i1
        %106 = comb.and %50, %104 : i1
        %107 = comb.mux bin %106, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %108 = comb.or %61, %105 : i1
        %109 = comb.and %7, %104 : i1
        %110 = comb.mux %109, %108, %sample_en_q : i1
        %111 = comb.mux %109, %sample_en_q, %sample_en_q2 : i1
        %112 = comb.mux bin %94, %u_sck_flop2Fq_o, %93 : i1
        %113 = comb.mux %104, %91, %csb_q : i1
        %114 = comb.or %csid_q, %113 : i1
        fsm.update %csb_q, %114 : i1
        fsm.update %u_sck_flop2Fq_o, %112 : i1
        fsm.update %sample_en_q2, %111 : i1
        fsm.update %sample_en_q, %110 : i1
        fsm.update %segment_rd_en_cpha1, %107 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c1_i3_0 = hw.constant 1 : i3
        %5 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %6 = comb.and %arg1, %0 : i1
        %7 = comb.and %6, %4 : i1
        %false = hw.constant false
        %true_1 = hw.constant true
        %8 = comb.concat %false, %2, %true_1 : i1, i1, i1
        %9 = comb.mux %7, %8, %3 : i3
        %10 = comb.mux %arg18, %c0_i3, %9 : i3
        %11 = comb.xor %6, %true : i1
        %12 = comb.and %4, %11 : i1
        %13 = comb.mux %12, %c1_i3_0, %10 : i3
        %14 = comb.icmp ne %13, %c1_i3_0 : i3
        %15 = comb.and %4, %14 : i1
        %16 = comb.xor %7, %2 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %arg18, %true_2 : i1
        %18 = comb.and %17, %16 : i1
        %19 = comb.or %12, %18 : i1
        %20 = comb.and %15, %19 : i1
        %true_3 = hw.constant true
        %21 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %22 = comb.xor %12, %true_4 : i1
        %23 = comb.and %15, %22, %21, %7, %2, %5 : i1
        %24 = comb.xor %cpha_q, %true : i1
        %25 = comb.mux %24, %20, %23 : i1
        %26 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %27 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %28 = comb.xor %27, %true : i1
        %29 = comb.or %26, %28 : i1
        verif.assert %29 : i1
        %30 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %30 : i1
        %31 = comb.xor %csid_q, %true : i1
        verif.assert %31 : i1
        %32 = comb.and %25, %cmd_wr_en_q, %1 : i1
        %33 = comb.xor %7, %2 : i1
        %true_5 = hw.constant true
        %34 = comb.xor %arg18, %true_5 : i1
        %35 = comb.and %34, %33 : i1
        %36 = comb.or %32, %12, %35 : i1
        fsm.return %36
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.xor %7, %true : i1
        %13 = comb.and %10, %12 : i1
        %c1_i3_0 = hw.constant 1 : i3
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.xor %cmd_rd_en_q, %true : i1
        %18 = comb.xor %cmd_wr_en_q, %true : i1
        %19 = comb.and %17, %18 : i1
        %20 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %23 = comb.mux %22, %c-4_i3, %c1_i3 : i3
        %24 = comb.xor %19, %true : i1
        %25 = comb.xor %20, %true : i1
        %26 = comb.and %25, %24, %21 : i1
        %27 = comb.mux %26, %c2_i3, %23 : i3
        %28 = comb.mux %26, %c-2_i3, %23 : i3
        %29 = comb.and %24, %20 : i1
        %30 = comb.mux %29, %c1_i3, %27 : i3
        %31 = comb.mux %29, %c-1_i3, %28 : i3
        %32 = comb.mux %19, %c0_i3, %30 : i3
        %33 = comb.mux %19, %c0_i3, %31 : i3
        %34 = comb.sub %bit_cntr_q, %32 : i3
        %35 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %36 = comb.or %arg18, %7 : i1
        %37 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %38 = comb.and %cmd_wr_en_q, %14 : i1
        %39 = comb.or %38, %cmd_wr_en_last_bit : i1
        %40 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %41 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %40, %42 : i1
        verif.assert %43 : i1
        %44 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %44 : i1
        %45 = comb.xor %csid_q, %true : i1
        verif.assert %45 : i1
        fsm.update %cmd_wr_en_last_bit, %39 : i1
        %false = hw.constant false
        %true_1 = hw.constant true
        %46 = comb.concat %false, %8, %true_1 : i1, i1, i1
        %47 = comb.mux %11, %46, %9 : i3
        %48 = comb.mux %arg18, %c0_i3, %47 : i3
        %49 = comb.mux %13, %c1_i3_0, %48 : i3
        %50 = comb.icmp ne %49, %c1_i3_0 : i3
        %51 = comb.and %10, %50 : i1
        %52 = comb.xor %11, %8 : i1
        %true_2 = hw.constant true
        %53 = comb.xor %arg18, %true_2 : i1
        %54 = comb.and %53, %52 : i1
        %55 = comb.or %13, %54 : i1
        %56 = comb.and %51, %55 : i1
        %true_3 = hw.constant true
        %57 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %58 = comb.xor %13, %true_4 : i1
        %59 = comb.and %58, %57, %11, %8 : i1
        %60 = comb.and %51, %59, %14 : i1
        %61 = comb.mux %16, %56, %60 : i1
        %62 = comb.and %cpha_q, %51, %59, %15 : i1
        %63 = comb.mux %62, %34, %bit_cntr_q : i3
        %64 = comb.mux %61, %33, %63 : i3
        %65 = comb.mux %12, %bit_cntr_q, %64 : i3
        %66 = comb.mux %arg18, %c0_i3, %65 : i3
        %67 = comb.xor %11, %8 : i1
        %true_5 = hw.constant true
        %68 = comb.xor %arg18, %true_5 : i1
        %69 = comb.and %68, %67 : i1
        %70 = comb.or %13, %69 : i1
        %true_6 = hw.constant true
        %71 = comb.xor %8, %true_6 : i1
        %true_7 = hw.constant true
        %72 = comb.xor %11, %true_7 : i1
        %true_8 = hw.constant true
        %73 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %74 = comb.xor %13, %true_9 : i1
        %75 = comb.and %50, %11 : i1
        %76 = comb.xor %70, %true : i1
        %77 = comb.and %76, %75, %74, %73, %72, %71 : i1
        %78 = comb.mux %77, %csnidle_q, %c0_i4 : i4
        %79 = comb.and %75, %70 : i1
        %80 = comb.mux %79, %csnlead_q, %78 : i4
        %81 = comb.mux %36, %80, %wait_cntr_q : i4
        %82 = comb.mux %arg18, %c0_i4, %81 : i4
        %83 = comb.xor %50, %true : i1
        %84 = comb.and %37, %83, %11 : i1
        %85 = comb.mux %84, %35, %82 : i4
        %true_10 = hw.constant true
        %86 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %87 = comb.xor %13, %true_11 : i1
        %88 = comb.icmp ne %49, %c-4_i3 : i3
        %89 = comb.and %76, %87, %86, %11, %8 : i1
        %90 = comb.xor %89, %true : i1
        %91 = comb.and %76, %90, %88 : i1
        %92 = comb.icmp ne %49, %c3_i3 : i3
        %93 = comb.mux %cpol_q, %92, %59 : i1
        %94 = comb.and %61, %cmd_wr_en_q, %6 : i1
        %95 = comb.mux %94, %clk_cntr_q, %5 : i16
        %96 = comb.mux %94, %bit_cntr_q, %66 : i3
        %true_12 = hw.constant true
        %97 = comb.xor %arg18, %true_12 : i1
        %98 = comb.or %94, %97 : i1
        %99 = comb.mux %98, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_13 = hw.constant true
        %100 = comb.xor %arg18, %true_13 : i1
        %101 = comb.or %94, %100 : i1
        %102 = comb.mux %101, %byte_cntr_cpha1_q, %c0_i20 : i20
        %103 = comb.mux %94, %wait_cntr_q, %85 : i4
        fsm.update %wait_cntr_q, %103 : i4
        fsm.update %byte_cntr_cpha1_q, %102 : i20
        fsm.update %byte_cntr_cpha0_q, %99 : i20
        fsm.update %bit_cntr_q, %96 : i3
        fsm.update %clk_cntr_q, %95 : i16
        %104 = comb.xor %94, %true : i1
        %105 = comb.and %62, %104 : i1
        %106 = comb.and %50, %104 : i1
        %107 = comb.mux bin %106, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %108 = comb.or %61, %105 : i1
        %109 = comb.and %7, %104 : i1
        %110 = comb.mux %109, %108, %sample_en_q : i1
        %111 = comb.mux %109, %sample_en_q, %sample_en_q2 : i1
        %112 = comb.mux bin %94, %u_sck_flop2Fq_o, %93 : i1
        %113 = comb.mux %104, %91, %csb_q : i1
        %114 = comb.or %csid_q, %113 : i1
        fsm.update %csb_q, %114 : i1
        fsm.update %u_sck_flop2Fq_o, %112 : i1
        fsm.update %sample_en_q2, %111 : i1
        fsm.update %sample_en_q, %110 : i1
        fsm.update %segment_rd_en_cpha1, %107 : i1
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
      %c-1_i2 = hw.constant -1 : i2
      %true = hw.constant true
      %false = hw.constant false
      %false_0 = hw.constant false
      %true_1 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %false_2 = hw.constant false
      %2 = comb.and %arg1, %0 : i1
      %3 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %4 = comb.mux %3, %c1_i3, %c-2_i3 : i3
      %5 = comb.xor %arg18, %true : i1
      %6 = comb.mux %arg18, %c0_i3, %4 : i3
      %7 = comb.xor %2, %true : i1
      %8 = comb.and %5, %7 : i1
      %c-2_i3_3 = hw.constant -2 : i3
      %9 = comb.xor %cpha_q, %true : i1
      %false_4 = hw.constant false
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
      %33 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %34 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
      %35 = comb.xor %34, %true : i1
      %36 = comb.or %33, %35 : i1
      verif.assert %36 : i1
      %37 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
      verif.assert %37 : i1
      %38 = comb.xor %csid_q, %true : i1
      verif.assert %38 : i1
      %39 = comb.mux %8, %c-2_i3_3, %6 : i3
      %40 = comb.icmp ne %39, %c-2_i3_3 : i3
      %true_5 = hw.constant true
      %41 = comb.xor %arg18, %true_5 : i1
      %true_6 = hw.constant true
      %42 = comb.xor %8, %true_6 : i1
      %43 = comb.and %9, %5, %40, %42, %41, %3, %cmd_wr_en_q : i1
      %44 = comb.and %43, %1 : i1
      %45 = comb.xor %44, %true : i1
      %46 = comb.and %43, %45 : i1
      %47 = comb.and %14, %45 : i1
      %false_7 = hw.constant false
      %48 = comb.and %13, %46, %arg16 : i1
      fsm.output %false_0, %u_sck_flop2Fq_o, %csb_q, %32, %false_4, %48, %46, %false, %47, %false_7, %cmd_speed_q, %full_cyc_q, %false_2, %44, %true_1 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-2_i3_0 = hw.constant -2 : i3
        %5 = comb.and %arg1, %0 : i1
        %6 = comb.mux %arg18, %c0_i3, %3 : i3
        %7 = comb.xor %5, %true : i1
        %8 = comb.and %4, %7 : i1
        %9 = comb.mux %8, %c-2_i3_0, %6 : i3
        %10 = comb.icmp ne %9, %c-2_i3_0 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %12 = comb.xor %8, %true_2 : i1
        %13 = comb.xor %cpha_q, %true : i1
        %14 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %15 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.or %14, %16 : i1
        verif.assert %17 : i1
        %18 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %18 : i1
        %19 = comb.xor %csid_q, %true : i1
        verif.assert %19 : i1
        %20 = comb.and %13, %4, %10, %12, %11, %2, %cmd_wr_en_q, %1 : i1
        %21 = comb.or %20, %8 : i1
        %true_3 = hw.constant true
        %22 = comb.xor %2, %true_3 : i1
        %true_4 = hw.constant true
        %23 = comb.xor %arg18, %true_4 : i1
        %24 = comb.and %23, %22 : i1
        %25 = comb.or %21, %24 : i1
        fsm.return %25
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.mux %arg18, %c0_i3, %9 : i3
        %13 = comb.xor %7, %true : i1
        %14 = comb.and %10, %13 : i1
        %c-2_i3_0 = hw.constant -2 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.xor %cmd_rd_en_q, %true : i1
        %18 = comb.xor %cmd_wr_en_q, %true : i1
        %19 = comb.and %17, %18 : i1
        %20 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %23 = comb.mux %22, %c-4_i3, %c1_i3 : i3
        %24 = comb.xor %19, %true : i1
        %25 = comb.xor %20, %true : i1
        %26 = comb.and %25, %24, %21 : i1
        %27 = comb.mux %26, %c-2_i3, %23 : i3
        %28 = comb.and %24, %20 : i1
        %29 = comb.mux %28, %c-1_i3, %27 : i3
        %30 = comb.mux %19, %c0_i3, %29 : i3
        %31 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %32 = comb.or %arg18, %7 : i1
        %33 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %34 = comb.and %cmd_wr_en_q, %15 : i1
        %35 = comb.or %34, %cmd_wr_en_last_bit : i1
        %36 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %37 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %36, %38 : i1
        verif.assert %39 : i1
        %40 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %40 : i1
        %41 = comb.xor %csid_q, %true : i1
        verif.assert %41 : i1
        fsm.update %cmd_wr_en_last_bit, %35 : i1
        %42 = comb.mux %14, %c-2_i3_0, %12 : i3
        %43 = comb.icmp ne %42, %c-2_i3_0 : i3
        %true_1 = hw.constant true
        %44 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %14, %true_2 : i1
        %46 = comb.and %16, %10, %43, %45, %44, %8 : i1
        %47 = comb.mux %46, %30, %bit_cntr_q : i3
        %48 = comb.mux %13, %bit_cntr_q, %47 : i3
        %49 = comb.mux %arg18, %c0_i3, %48 : i3
        %true_3 = hw.constant true
        %50 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %51 = comb.xor %14, %true_4 : i1
        %52 = comb.and %51, %50, %8 : i1
        %true_5 = hw.constant true
        %53 = comb.xor %8, %true_5 : i1
        %true_6 = hw.constant true
        %54 = comb.xor %arg18, %true_6 : i1
        %55 = comb.and %54, %53 : i1
        %56 = comb.or %14, %55 : i1
        %57 = comb.and %43, %11 : i1
        %58 = comb.xor %52, %true : i1
        %59 = comb.and %58, %57 : i1
        %60 = comb.and %59, %56 : i1
        %61 = comb.mux %60, %csnidle_q, %c0_i4 : i4
        %62 = comb.and %57, %52 : i1
        %63 = comb.mux %62, %csnlead_q, %61 : i4
        %64 = comb.mux %32, %63, %wait_cntr_q : i4
        %65 = comb.mux %arg18, %c0_i4, %64 : i4
        %66 = comb.xor %43, %true : i1
        %67 = comb.and %33, %66, %11 : i1
        %68 = comb.mux %67, %31, %65 : i4
        %69 = comb.icmp ne %42, %c-4_i3 : i3
        %70 = comb.and %58, %69 : i1
        %71 = comb.icmp ne %42, %c3_i3 : i3
        %72 = comb.and %cpol_q, %71 : i1
        %73 = comb.and %46, %cmd_wr_en_q, %6 : i1
        %74 = comb.mux %73, %clk_cntr_q, %5 : i16
        %75 = comb.mux %73, %bit_cntr_q, %49 : i3
        %true_7 = hw.constant true
        %76 = comb.xor %arg18, %true_7 : i1
        %77 = comb.or %73, %76 : i1
        %78 = comb.mux %77, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_8 = hw.constant true
        %79 = comb.xor %arg18, %true_8 : i1
        %80 = comb.or %73, %79 : i1
        %81 = comb.mux %80, %byte_cntr_cpha1_q, %c0_i20 : i20
        %82 = comb.mux %73, %wait_cntr_q, %68 : i4
        fsm.update %wait_cntr_q, %82 : i4
        fsm.update %byte_cntr_cpha1_q, %81 : i20
        fsm.update %byte_cntr_cpha0_q, %78 : i20
        fsm.update %bit_cntr_q, %75 : i3
        fsm.update %clk_cntr_q, %74 : i16
        %83 = comb.xor %73, %true : i1
        %84 = comb.and %43, %83 : i1
        %85 = comb.mux bin %84, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %86 = comb.and %7, %83 : i1
        %87 = comb.mux %86, %46, %sample_en_q : i1
        %88 = comb.mux %86, %sample_en_q, %sample_en_q2 : i1
        %89 = comb.mux bin %73, %u_sck_flop2Fq_o, %72 : i1
        %90 = comb.mux %83, %70, %csb_q : i1
        %91 = comb.or %csid_q, %90 : i1
        fsm.update %csb_q, %91 : i1
        fsm.update %u_sck_flop2Fq_o, %89 : i1
        fsm.update %sample_en_q2, %88 : i1
        fsm.update %sample_en_q, %87 : i1
        fsm.update %segment_rd_en_cpha1, %85 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-2_i3_0 = hw.constant -2 : i3
        %5 = comb.and %arg1, %0 : i1
        %6 = comb.mux %arg18, %c0_i3, %3 : i3
        %7 = comb.xor %5, %true : i1
        %8 = comb.and %4, %7 : i1
        %9 = comb.mux %8, %c-2_i3_0, %6 : i3
        %10 = comb.icmp ne %9, %c-2_i3_0 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %12 = comb.xor %8, %true_2 : i1
        %13 = comb.xor %cpha_q, %true : i1
        %14 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %15 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.or %14, %16 : i1
        verif.assert %17 : i1
        %18 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %18 : i1
        %19 = comb.xor %csid_q, %true : i1
        verif.assert %19 : i1
        %20 = comb.and %13, %4, %10, %12, %11, %2, %cmd_wr_en_q, %1 : i1
        %21 = comb.or %20, %8 : i1
        %true_3 = hw.constant true
        %22 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %23 = comb.xor %21, %true_4 : i1
        %24 = comb.and %23, %22, %2 : i1
        fsm.return %24
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.mux %arg18, %c0_i3, %9 : i3
        %13 = comb.xor %7, %true : i1
        %14 = comb.and %10, %13 : i1
        %c-2_i3_0 = hw.constant -2 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.xor %cmd_rd_en_q, %true : i1
        %18 = comb.xor %cmd_wr_en_q, %true : i1
        %19 = comb.and %17, %18 : i1
        %20 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %23 = comb.mux %22, %c-4_i3, %c1_i3 : i3
        %24 = comb.xor %19, %true : i1
        %25 = comb.xor %20, %true : i1
        %26 = comb.and %25, %24, %21 : i1
        %27 = comb.mux %26, %c-2_i3, %23 : i3
        %28 = comb.and %24, %20 : i1
        %29 = comb.mux %28, %c-1_i3, %27 : i3
        %30 = comb.mux %19, %c0_i3, %29 : i3
        %31 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %32 = comb.or %arg18, %7 : i1
        %33 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %34 = comb.and %cmd_wr_en_q, %15 : i1
        %35 = comb.or %34, %cmd_wr_en_last_bit : i1
        %36 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %37 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %36, %38 : i1
        verif.assert %39 : i1
        %40 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %40 : i1
        %41 = comb.xor %csid_q, %true : i1
        verif.assert %41 : i1
        fsm.update %cmd_wr_en_last_bit, %35 : i1
        %42 = comb.mux %14, %c-2_i3_0, %12 : i3
        %43 = comb.icmp ne %42, %c-2_i3_0 : i3
        %true_1 = hw.constant true
        %44 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %14, %true_2 : i1
        %46 = comb.and %16, %10, %43, %45, %44, %8 : i1
        %47 = comb.and %7, %46 : i1
        %48 = comb.mux %47, %30, %bit_cntr_q : i3
        %49 = comb.mux %arg18, %c0_i3, %48 : i3
        %true_3 = hw.constant true
        %50 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %51 = comb.xor %14, %true_4 : i1
        %52 = comb.and %51, %50, %8 : i1
        %true_5 = hw.constant true
        %53 = comb.xor %8, %true_5 : i1
        %true_6 = hw.constant true
        %54 = comb.xor %arg18, %true_6 : i1
        %55 = comb.and %54, %53 : i1
        %56 = comb.or %14, %55 : i1
        %57 = comb.and %43, %11 : i1
        %58 = comb.xor %52, %true : i1
        %59 = comb.and %58, %57, %56 : i1
        %60 = comb.mux %59, %csnidle_q, %c0_i4 : i4
        %61 = comb.and %57, %52 : i1
        %62 = comb.mux %61, %csnlead_q, %60 : i4
        %63 = comb.mux %32, %62, %wait_cntr_q : i4
        %64 = comb.mux %arg18, %c0_i4, %63 : i4
        %65 = comb.xor %43, %true : i1
        %66 = comb.and %33, %65, %11 : i1
        %67 = comb.mux %66, %31, %64 : i4
        %68 = comb.icmp ne %42, %c-4_i3 : i3
        %69 = comb.and %58, %68 : i1
        %70 = comb.icmp ne %42, %c3_i3 : i3
        %71 = comb.and %cpol_q, %70 : i1
        %72 = comb.and %46, %cmd_wr_en_q, %6 : i1
        %73 = comb.mux %72, %clk_cntr_q, %5 : i16
        %74 = comb.mux %72, %bit_cntr_q, %49 : i3
        %true_7 = hw.constant true
        %75 = comb.xor %arg18, %true_7 : i1
        %76 = comb.or %72, %75 : i1
        %77 = comb.mux %76, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_8 = hw.constant true
        %78 = comb.xor %arg18, %true_8 : i1
        %79 = comb.or %72, %78 : i1
        %80 = comb.mux %79, %byte_cntr_cpha1_q, %c0_i20 : i20
        %81 = comb.mux %72, %wait_cntr_q, %67 : i4
        fsm.update %wait_cntr_q, %81 : i4
        fsm.update %byte_cntr_cpha1_q, %80 : i20
        fsm.update %byte_cntr_cpha0_q, %77 : i20
        fsm.update %bit_cntr_q, %74 : i3
        fsm.update %clk_cntr_q, %73 : i16
        %82 = comb.xor %72, %true : i1
        %83 = comb.and %43, %82 : i1
        %84 = comb.mux bin %83, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %85 = comb.and %7, %82 : i1
        %86 = comb.mux %85, %46, %sample_en_q : i1
        %87 = comb.mux %85, %sample_en_q, %sample_en_q2 : i1
        %88 = comb.mux bin %72, %u_sck_flop2Fq_o, %71 : i1
        %89 = comb.mux %82, %69, %csb_q : i1
        %90 = comb.or %csid_q, %89 : i1
        fsm.update %csb_q, %90 : i1
        fsm.update %u_sck_flop2Fq_o, %88 : i1
        fsm.update %sample_en_q2, %87 : i1
        fsm.update %sample_en_q, %86 : i1
        fsm.update %segment_rd_en_cpha1, %84 : i1
      }
      fsm.transition @state_0 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-2_i3_0 = hw.constant -2 : i3
        %5 = comb.and %arg1, %0 : i1
        %6 = comb.mux %arg18, %c0_i3, %3 : i3
        %7 = comb.xor %5, %true : i1
        %8 = comb.and %4, %7 : i1
        %9 = comb.mux %8, %c-2_i3_0, %6 : i3
        %10 = comb.icmp ne %9, %c-2_i3_0 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %12 = comb.xor %8, %true_2 : i1
        %13 = comb.xor %cpha_q, %true : i1
        %14 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %15 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.or %14, %16 : i1
        verif.assert %17 : i1
        %18 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %18 : i1
        %19 = comb.xor %csid_q, %true : i1
        verif.assert %19 : i1
        %20 = comb.and %13, %4, %10, %12, %11, %2, %cmd_wr_en_q, %1 : i1
        %21 = comb.or %20, %8 : i1
        %true_3 = hw.constant true
        %22 = comb.xor %21, %true_3 : i1
        %23 = comb.and %22, %arg18 : i1
        fsm.return %23
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.mux %arg18, %c0_i3, %9 : i3
        %13 = comb.xor %7, %true : i1
        %14 = comb.and %10, %13 : i1
        %c-2_i3_0 = hw.constant -2 : i3
        %15 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %16 = comb.xor %cpha_q, %true : i1
        %17 = comb.xor %cmd_rd_en_q, %true : i1
        %18 = comb.xor %cmd_wr_en_q, %true : i1
        %19 = comb.and %17, %18 : i1
        %20 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %22 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %23 = comb.mux %22, %c-4_i3, %c1_i3 : i3
        %24 = comb.xor %19, %true : i1
        %25 = comb.xor %20, %true : i1
        %26 = comb.and %25, %24, %21 : i1
        %27 = comb.mux %26, %c-2_i3, %23 : i3
        %28 = comb.and %24, %20 : i1
        %29 = comb.mux %28, %c-1_i3, %27 : i3
        %30 = comb.mux %19, %c0_i3, %29 : i3
        %31 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %32 = comb.or %arg18, %7 : i1
        %33 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %34 = comb.and %cmd_wr_en_q, %15 : i1
        %35 = comb.or %34, %cmd_wr_en_last_bit : i1
        %36 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %37 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %36, %38 : i1
        verif.assert %39 : i1
        %40 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %40 : i1
        %41 = comb.xor %csid_q, %true : i1
        verif.assert %41 : i1
        fsm.update %cmd_wr_en_last_bit, %35 : i1
        %42 = comb.mux %14, %c-2_i3_0, %12 : i3
        %43 = comb.icmp ne %42, %c-2_i3_0 : i3
        %true_1 = hw.constant true
        %44 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %14, %true_2 : i1
        %46 = comb.and %16, %10, %43, %45, %44, %8 : i1
        %47 = comb.and %7, %46 : i1
        %48 = comb.mux %47, %30, %bit_cntr_q : i3
        %49 = comb.mux %arg18, %c0_i3, %48 : i3
        %true_3 = hw.constant true
        %50 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %51 = comb.xor %14, %true_4 : i1
        %52 = comb.and %51, %50, %8 : i1
        %true_5 = hw.constant true
        %53 = comb.xor %8, %true_5 : i1
        %true_6 = hw.constant true
        %54 = comb.xor %arg18, %true_6 : i1
        %55 = comb.and %54, %53 : i1
        %56 = comb.or %14, %55 : i1
        %57 = comb.and %43, %11 : i1
        %58 = comb.xor %52, %true : i1
        %59 = comb.and %58, %57, %56 : i1
        %60 = comb.mux %59, %csnidle_q, %c0_i4 : i4
        %61 = comb.and %57, %52 : i1
        %62 = comb.mux %61, %csnlead_q, %60 : i4
        %63 = comb.mux %32, %62, %wait_cntr_q : i4
        %64 = comb.mux %arg18, %c0_i4, %63 : i4
        %65 = comb.xor %43, %true : i1
        %66 = comb.and %33, %65, %11 : i1
        %67 = comb.mux %66, %31, %64 : i4
        %68 = comb.icmp ne %42, %c-4_i3 : i3
        %69 = comb.and %58, %68 : i1
        %70 = comb.icmp ne %42, %c3_i3 : i3
        %71 = comb.and %cpol_q, %70 : i1
        %72 = comb.and %46, %cmd_wr_en_q, %6 : i1
        %73 = comb.mux %72, %clk_cntr_q, %5 : i16
        %74 = comb.mux %72, %bit_cntr_q, %49 : i3
        %true_7 = hw.constant true
        %75 = comb.xor %arg18, %true_7 : i1
        %76 = comb.or %72, %75 : i1
        %77 = comb.mux %76, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_8 = hw.constant true
        %78 = comb.xor %arg18, %true_8 : i1
        %79 = comb.or %72, %78 : i1
        %80 = comb.mux %79, %byte_cntr_cpha1_q, %c0_i20 : i20
        %81 = comb.mux %72, %wait_cntr_q, %67 : i4
        fsm.update %wait_cntr_q, %81 : i4
        fsm.update %byte_cntr_cpha1_q, %80 : i20
        fsm.update %byte_cntr_cpha0_q, %77 : i20
        fsm.update %bit_cntr_q, %74 : i3
        fsm.update %clk_cntr_q, %73 : i16
        %82 = comb.xor %72, %true : i1
        %83 = comb.and %43, %82 : i1
        %84 = comb.mux bin %83, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %85 = comb.and %7, %82 : i1
        %86 = comb.mux %85, %46, %sample_en_q : i1
        %87 = comb.mux %85, %sample_en_q, %sample_en_q2 : i1
        %88 = comb.mux bin %72, %u_sck_flop2Fq_o, %71 : i1
        %89 = comb.mux %82, %69, %csb_q : i1
        %90 = comb.or %csid_q, %89 : i1
        fsm.update %csb_q, %90 : i1
        fsm.update %u_sck_flop2Fq_o, %88 : i1
        fsm.update %sample_en_q2, %87 : i1
        fsm.update %sample_en_q, %86 : i1
        fsm.update %segment_rd_en_cpha1, %84 : i1
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
      %c-1_i2 = hw.constant -1 : i2
      %c-1_i20 = hw.constant -1 : i20
      %true = hw.constant true
      %true_0 = hw.constant true
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
      %42 = comb.xor %20, %true : i1
      %43 = comb.icmp ne %22, %c0_i20 : i20
      %44 = comb.or %42, %43, %cpha_q : i1
      %45 = comb.and %15, %44 : i1
      %46 = comb.mux %45, %c2_i3, %13 : i3
      %47 = comb.xor %44, %true : i1
      %48 = comb.and %47, %15 : i1
      %49 = comb.mux %48, %16, %46 : i3
      %50 = comb.mux %arg18, %c0_i3, %49 : i3
      %51 = comb.mux %18, %c3_i3, %50 : i3
      %52 = comb.and %19, %48, %csaat_q, %10 : i1
      %53 = comb.icmp ne %51, %c3_i3 : i3
      %54 = comb.and %14, %53 : i1
      %true_1 = hw.constant true
      %55 = comb.xor %45, %true_1 : i1
      %true_2 = hw.constant true
      %56 = comb.xor %48, %true_2 : i1
      %true_3 = hw.constant true
      %57 = comb.xor %arg18, %true_3 : i1
      %true_4 = hw.constant true
      %58 = comb.xor %18, %true_4 : i1
      %59 = comb.and %58, %57, %56, %55, %11 : i1
      %true_5 = hw.constant true
      %60 = comb.xor %cpha_q, %true_5 : i1
      %61 = comb.and %csaat_q, %8, %60 : i1
      %62 = comb.mux %48, %61, %45 : i1
      %true_6 = hw.constant true
      %63 = comb.xor %arg18, %true_6 : i1
      %true_7 = hw.constant true
      %64 = comb.xor %18, %true_7 : i1
      %65 = comb.and %64, %63, %62 : i1
      %66 = comb.and %65, %20 : i1
      %67 = comb.or %59, %66 : i1
      %68 = comb.and %54, %67 : i1
      %69 = comb.and %54, %65, %21 : i1
      %70 = comb.and %54, %20 : i1
      %true_8 = hw.constant true
      %71 = comb.xor %arg18, %true_8 : i1
      %72 = comb.and %71, %48, %csaat_q, %8, %cpha_q : i1
      %73 = comb.or %18, %72 : i1
      %74 = comb.and %54, %73, %20 : i1
      %75 = comb.and %54, %73, %21 : i1
      %76 = comb.and %arg15, %52 : i1
      %77 = comb.mux %76, %arg14, %csid_q : i1
      %78 = comb.mux %76, %arg12, %cpha_q : i1
      %79 = comb.mux %76, %arg11, %full_cyc_q : i1
      %80 = comb.mux %76, %arg3, %cmd_wr_en_q : i1
      %81 = comb.mux %76, %arg4, %cmd_rd_en_q : i1
      %82 = comb.mux %76, %arg2, %cmd_speed_q : i2
      %83 = comb.xor %78, %true : i1
      %84 = comb.mux %83, %68, %74 : i1
      %85 = comb.mux %83, %69, %75 : i1
      %86 = comb.mux %83, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
      %87 = comb.and %84, %80 : i1
      %88 = comb.and %83, %70, %86 : i1
      %89 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %90 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %91 = comb.mux %83, %89, %90 : i1
      %92 = comb.mux %79, %sample_en_q2, %sample_en_q : i1
      %93 = comb.icmp eq %arg2, %c0_i2 : i2
      %94 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %95 = comb.mux %76, %93, %94 : i1
      %96 = comb.and %81, %80 : i1
      %97 = comb.xor %96, %true : i1
      %98 = comb.or %95, %97 : i1
      verif.assert %98 : i1
      %99 = comb.icmp ne %82, %c-1_i2 : i2
      verif.assert %99 : i1
      %100 = comb.xor %77, %true : i1
      verif.assert %100 : i1
      %101 = comb.and %87, %1 : i1
      %102 = comb.and %88, %2 : i1
      %103 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %104 = comb.icmp eq %arg5, %c0_i20 : i20
      %105 = comb.icmp eq %23, %c0_i20 : i20
      %106 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %107 = comb.mux %70, %105, %106 : i1
      %108 = comb.mux %76, %104, %107 : i1
      %109 = comb.mux %17, %103, %108 : i1
      %110 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %111 = comb.icmp eq %arg5, %c0_i20 : i20
      %112 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %113 = comb.mux %76, %111, %112 : i1
      %114 = comb.mux %17, %110, %113 : i1
      %115 = comb.mux %83, %109, %114 : i1
      %116 = comb.or %arg18, %115 : i1
      %117 = comb.or %102, %101 : i1
      %118 = comb.xor %117, %true : i1
      %119 = comb.and %87, %118 : i1
      %120 = comb.and %88, %118 : i1
      %121 = comb.and %92, %118 : i1
      %122 = comb.and %85, %118 : i1
      %123 = comb.and %52, %118 : i1
      %124 = comb.and %91, %120, %arg17 : i1
      %125 = comb.and %116, %119, %arg16 : i1
      fsm.output %123, %u_sck_flop2Fq_o, %csb_q, %41, %124, %125, %119, %120, %121, %122, %cmd_speed_q, %79, %102, %101, %true_0 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_7 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %17 = comb.and %arg1, %0 : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ne %16, %c0_i20 : i20
        %20 = comb.or %18, %19, %cpha_q : i1
        %21 = comb.and %17, %13 : i1
        %22 = comb.and %21, %20 : i1
        %23 = comb.mux %22, %c2_i3, %12 : i3
        %24 = comb.xor %20, %true : i1
        %25 = comb.and %24, %21 : i1
        %26 = comb.mux %25, %14, %23 : i3
        %27 = comb.mux %arg18, %c0_i3, %26 : i3
        %28 = comb.xor %17, %true : i1
        %29 = comb.and %13, %28 : i1
        %30 = comb.mux %29, %c3_i3, %27 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.icmp ne %30, %c3_i3 : i3
        %33 = comb.and %13, %32 : i1
        %true_0 = hw.constant true
        %34 = comb.xor %22, %true_0 : i1
        %true_1 = hw.constant true
        %35 = comb.xor %25, %true_1 : i1
        %true_2 = hw.constant true
        %36 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %37 = comb.xor %29, %true_3 : i1
        %38 = comb.and %37, %36, %35, %34, %10 : i1
        %true_4 = hw.constant true
        %39 = comb.xor %cpha_q, %true_4 : i1
        %40 = comb.and %csaat_q, %7, %39 : i1
        %41 = comb.mux %25, %40, %22 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %29, %true_6 : i1
        %44 = comb.and %43, %42, %41, %15 : i1
        %45 = comb.or %38, %44 : i1
        %46 = comb.and %33, %45 : i1
        %true_7 = hw.constant true
        %47 = comb.xor %arg18, %true_7 : i1
        %48 = comb.and %47, %25, %csaat_q, %7, %cpha_q : i1
        %49 = comb.or %29, %48 : i1
        %50 = comb.and %33, %49, %15 : i1
        %51 = comb.and %arg15, %31, %25, %csaat_q, %9 : i1
        %52 = comb.mux %51, %arg14, %csid_q : i1
        %53 = comb.mux %51, %arg12, %cpha_q : i1
        %54 = comb.mux %51, %arg3, %cmd_wr_en_q : i1
        %55 = comb.mux %51, %arg4, %cmd_rd_en_q : i1
        %56 = comb.mux %51, %arg2, %cmd_speed_q : i2
        %57 = comb.xor %53, %true : i1
        %58 = comb.mux %57, %46, %50 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.icmp eq %arg2, %c0_i2 : i2
        %61 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %62 = comb.mux %51, %60, %61 : i1
        %63 = comb.and %55, %54 : i1
        %64 = comb.xor %63, %true : i1
        %65 = comb.or %62, %64 : i1
        verif.assert %65 : i1
        %66 = comb.icmp ne %56, %c-1_i2 : i2
        verif.assert %66 : i1
        %67 = comb.xor %52, %true : i1
        verif.assert %67 : i1
        %68 = comb.and %58, %54, %1 : i1
        %69 = comb.and %57, %33, %15, %59, %2 : i1
        %70 = comb.or %69, %68 : i1
        %71 = comb.or %70, %29 : i1
        %72 = comb.extract %5 from 0 : (i3) -> i2
        %c-1_i2_8 = hw.constant -1 : i2
        %73 = comb.icmp eq %72, %c-1_i2_8 : i2
        %true_9 = hw.constant true
        %74 = comb.xor %7, %true_9 : i1
        %true_10 = hw.constant true
        %75 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %76 = comb.xor %71, %true_11 : i1
        %77 = comb.and %76, %75, %25, %csaat_q, %74, %73 : i1
        fsm.return %77
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.xor %arg18, %true : i1
        %17 = comb.and %5, %16 : i1
        %18 = comb.mux %14, %c-4_i3, %11 : i3
        %19 = comb.xor %5, %true : i1
        %20 = comb.and %16, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c3_i3_0 = hw.constant 3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %24 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %25 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %26 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %27 = comb.or %arg18, %5 : i1
        %28 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %29 = comb.and %cmd_wr_en_q, %22 : i1
        %30 = comb.xor %22, %true : i1
        %31 = comb.icmp ne %24, %c0_i20 : i20
        %32 = comb.or %30, %31, %cpha_q : i1
        %33 = comb.and %17, %32 : i1
        %34 = comb.mux %33, %c2_i3, %15 : i3
        %35 = comb.xor %32, %true : i1
        %36 = comb.and %35, %17 : i1
        %37 = comb.mux %36, %18, %34 : i3
        %38 = comb.mux %arg18, %c0_i3, %37 : i3
        %39 = comb.mux %20, %c3_i3_0, %38 : i3
        %40 = comb.icmp ne %39, %c3_i3_0 : i3
        %41 = comb.and %16, %40 : i1
        %true_1 = hw.constant true
        %42 = comb.xor %33, %true_1 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %36, %true_2 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %45 = comb.xor %20, %true_4 : i1
        %46 = comb.and %45, %44, %43, %42, %13 : i1
        %true_5 = hw.constant true
        %47 = comb.xor %cpha_q, %true_5 : i1
        %48 = comb.and %csaat_q, %10, %47 : i1
        %49 = comb.mux %36, %48, %33 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %20, %true_7 : i1
        %52 = comb.and %51, %50, %49 : i1
        %53 = comb.and %52, %22 : i1
        %54 = comb.or %46, %53 : i1
        %55 = comb.and %41, %54 : i1
        %56 = comb.and %41, %52, %23 : i1
        %57 = comb.and %41, %22 : i1
        %true_8 = hw.constant true
        %58 = comb.xor %arg18, %true_8 : i1
        %59 = comb.and %58, %36, %csaat_q, %10, %cpha_q : i1
        %60 = comb.or %20, %59 : i1
        %61 = comb.and %41, %60, %22 : i1
        %62 = comb.and %41, %60, %23 : i1
        %63 = comb.mux %57, %25, %byte_cntr_cpha0_q : i20
        %true_9 = hw.constant true
        %64 = comb.xor %33, %true_9 : i1
        %true_10 = hw.constant true
        %65 = comb.xor %36, %true_10 : i1
        %true_11 = hw.constant true
        %66 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %67 = comb.xor %20, %true_12 : i1
        %68 = comb.and %67, %66, %65, %64, %13 : i1
        %69 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_13 = hw.constant 0 : i2
        %70 = comb.icmp eq %69, %c0_i2_13 : i2
        %true_14 = hw.constant true
        %71 = comb.xor %10, %true_14 : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.or %14, %72 : i1
        %true_15 = hw.constant true
        %74 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %75 = comb.xor %20, %true_16 : i1
        %76 = comb.and %75, %74, %36, %73 : i1
        %77 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_17 = hw.constant 1 : i2
        %78 = comb.icmp eq %77, %c1_i2_17 : i2
        %true_18 = hw.constant true
        %79 = comb.xor %10, %true_18 : i1
        %true_19 = hw.constant true
        %80 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %81 = comb.xor %20, %true_20 : i1
        %82 = comb.and %81, %80, %36, %csaat_q, %79, %78 : i1
        %83 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_21 = hw.constant -2 : i2
        %84 = comb.icmp eq %83, %c-2_i2_21 : i2
        %true_22 = hw.constant true
        %85 = comb.xor %10, %true_22 : i1
        %86 = comb.and %csaat_q, %85, %84 : i1
        %true_23 = hw.constant true
        %87 = comb.xor %13, %true_23 : i1
        %true_24 = hw.constant true
        %88 = comb.xor %33, %true_24 : i1
        %89 = comb.and %88, %87 : i1
        %90 = comb.mux %36, %86, %89 : i1
        %true_25 = hw.constant true
        %91 = comb.xor %arg18, %true_25 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %20, %true_26 : i1
        %93 = comb.and %40, %17 : i1
        %94 = comb.xor %68, %true : i1
        %95 = comb.and %94, %93 : i1
        %96 = comb.xor %76, %true : i1
        %97 = comb.and %96, %95 : i1
        %98 = comb.xor %82, %true : i1
        %99 = comb.and %98, %97, %92, %91, %90 : i1
        %100 = comb.and %97, %82 : i1
        %101 = comb.or %100, %99 : i1
        %102 = comb.and %95, %76 : i1
        %103 = comb.and %93, %68 : i1
        %104 = comb.xor %40, %true : i1
        %105 = comb.and %28, %104, %17 : i1
        %true_27 = hw.constant true
        %106 = comb.xor %cpha_q, %true_27 : i1
        %107 = comb.and %csaat_q, %10, %106 : i1
        %108 = comb.mux %36, %107, %33 : i1
        %true_28 = hw.constant true
        %109 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %110 = comb.xor %20, %true_29 : i1
        %111 = comb.and %110, %109, %108 : i1
        %true_30 = hw.constant true
        %112 = comb.xor %arg18, %true_30 : i1
        %113 = comb.and %112, %36, %csaat_q, %10, %cpha_q : i1
        %114 = comb.or %20, %113 : i1
        %115 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_31 = hw.constant -1 : i2
        %116 = comb.icmp eq %115, %c-1_i2_31 : i2
        %true_32 = hw.constant true
        %117 = comb.xor %10, %true_32 : i1
        %true_33 = hw.constant true
        %118 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %119 = comb.xor %20, %true_34 : i1
        %120 = comb.icmp ne %39, %c-4_i3 : i3
        %121 = comb.xor %111, %true : i1
        %122 = comb.and %121, %94 : i1
        %123 = comb.xor %114, %true : i1
        %124 = comb.and %123, %122, %119, %118, %36, %csaat_q, %117, %116 : i1
        %125 = comb.xor %124, %true : i1
        %126 = comb.and %122, %114 : i1
        %127 = comb.xor %126, %true : i1
        %128 = comb.and %94, %111 : i1
        %129 = comb.xor %128, %true : i1
        %130 = comb.and %94, %129, %127, %125, %120 : i1
        %131 = comb.icmp ne %39, %c3_i3 : i3
        %132 = comb.and %arg15, %21, %36, %csaat_q, %12 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg8, %csnidle_q : i4
        %137 = comb.mux %132, %arg9, %csnlead_q : i4
        %138 = comb.mux %132, %arg10, %csntrail_q : i4
        %139 = comb.mux %132, %arg7, %clkdiv_q : i16
        %140 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %141 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %142 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %143 = comb.mux %1, %139, %2 : i16
        %144 = comb.mux %132, %arg7, %143 : i16
        %145 = comb.mux %0, %clk_cntr_q, %144 : i16
        %146 = comb.mux %arg18, %c0_i16, %145 : i16
        %147 = comb.xor %135, %true : i1
        %148 = comb.mux %147, %55, %61 : i1
        %149 = comb.and %147, %57 : i1
        %150 = comb.mux %147, %56, %62 : i1
        %151 = comb.mux %147, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %152 = comb.xor %141, %true : i1
        %153 = comb.xor %140, %true : i1
        %154 = comb.and %152, %153 : i1
        %155 = comb.icmp eq %arg2, %c0_i2 : i2
        %156 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %157 = comb.mux %132, %155, %156 : i1
        %158 = comb.icmp eq %arg2, %c1_i2 : i2
        %159 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %160 = comb.mux %132, %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c-2_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %163 = comb.mux %132, %161, %162 : i1
        %164 = comb.mux %163, %c-4_i3, %c1_i3 : i3
        %165 = comb.xor %154, %true : i1
        %166 = comb.xor %157, %true : i1
        %167 = comb.and %166, %165, %160 : i1
        %168 = comb.mux %167, %c2_i3, %164 : i3
        %169 = comb.mux %167, %c-2_i3, %164 : i3
        %170 = comb.and %165, %157 : i1
        %171 = comb.mux %170, %c1_i3, %168 : i3
        %172 = comb.mux %170, %c-1_i3, %169 : i3
        %173 = comb.mux %154, %c0_i3, %171 : i3
        %174 = comb.mux %154, %c0_i3, %172 : i3
        %175 = comb.sub %bit_cntr_q, %173 : i3
        %176 = comb.mux %150, %175, %bit_cntr_q : i3
        %177 = comb.mux %148, %174, %176 : i3
        %178 = comb.mux %19, %bit_cntr_q, %177 : i3
        %179 = comb.mux %arg18, %c0_i3, %178 : i3
        %180 = comb.mux %132, %arg5, %63 : i20
        %181 = comb.mux %19, %byte_cntr_cpha0_q, %180 : i20
        %182 = comb.mux %arg18, %c0_i20, %181 : i20
        %183 = comb.mux %132, %arg5, %byte_cntr_cpha1_q : i20
        %184 = comb.mux %arg18, %c0_i20, %183 : i20
        %185 = comb.mux %101, %136, %c0_i4 : i4
        %186 = comb.mux %102, %138, %185 : i4
        %187 = comb.mux %103, %137, %186 : i4
        %188 = comb.mux %27, %187, %wait_cntr_q : i4
        %189 = comb.mux %arg18, %c0_i4, %188 : i4
        %190 = comb.mux %105, %26, %189 : i4
        %191 = comb.mux %134, %131, %60 : i1
        %192 = comb.xor %149, %true : i1
        %193 = comb.and %192, %cmd_wr_en_last_bit : i1
        %194 = comb.or %29, %193 : i1
        %195 = comb.icmp eq %arg2, %c0_i2 : i2
        %196 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %197 = comb.mux %132, %195, %196 : i1
        %198 = comb.and %141, %140 : i1
        %199 = comb.xor %198, %true : i1
        %200 = comb.or %197, %199 : i1
        verif.assert %200 : i1
        %201 = comb.icmp ne %142, %c-1_i2 : i2
        verif.assert %201 : i1
        %202 = comb.xor %133, %true : i1
        verif.assert %202 : i1
        fsm.update %cmd_wr_en_last_bit, %194 : i1
        %203 = comb.and %148, %140, %3 : i1
        %204 = comb.and %149, %151, %4 : i1
        %205 = comb.or %204, %203 : i1
        %206 = comb.xor %205, %true : i1
        %207 = comb.and %150, %206 : i1
        %208 = comb.and %132, %206 : i1
        %209 = comb.mux %208, %arg14, %csid_q : i1
        %210 = comb.mux %208, %arg13, %cpol_q : i1
        %211 = comb.mux %208, %arg12, %cpha_q : i1
        %212 = comb.mux %208, %arg11, %full_cyc_q : i1
        %213 = comb.mux %208, %arg8, %csnidle_q : i4
        %214 = comb.mux %208, %arg9, %csnlead_q : i4
        %215 = comb.mux %208, %arg10, %csntrail_q : i4
        %216 = comb.mux %208, %arg7, %clkdiv_q : i16
        %217 = comb.mux %208, %arg6, %csaat_q : i1
        %218 = comb.mux %208, %arg3, %cmd_wr_en_q : i1
        %219 = comb.mux %208, %arg4, %cmd_rd_en_q : i1
        %220 = comb.mux %208, %arg2, %cmd_speed_q : i2
        %221 = comb.mux %208, %arg5, %cmd_len_q : i20
        %222 = comb.mux %205, %clk_cntr_q, %146 : i16
        %223 = comb.and %40, %206 : i1
        %224 = comb.mux bin %223, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %225 = comb.mux %205, %bit_cntr_q, %179 : i3
        %226 = comb.mux %205, %byte_cntr_cpha0_q, %182 : i20
        %227 = comb.mux %205, %byte_cntr_cpha1_q, %184 : i20
        %228 = comb.mux %205, %wait_cntr_q, %190 : i4
        %229 = comb.or %148, %207 : i1
        %230 = comb.and %5, %206 : i1
        %231 = comb.mux %230, %229, %sample_en_q : i1
        %232 = comb.mux %230, %sample_en_q, %sample_en_q2 : i1
        %233 = comb.mux bin %205, %u_sck_flop2Fq_o, %191 : i1
        %234 = comb.mux %206, %130, %csb_q : i1
        %235 = comb.or %133, %234 : i1
        fsm.update %csb_q, %235 : i1
        fsm.update %u_sck_flop2Fq_o, %233 : i1
        fsm.update %sample_en_q2, %232 : i1
        fsm.update %sample_en_q, %231 : i1
        fsm.update %wait_cntr_q, %228 : i4
        fsm.update %byte_cntr_cpha1_q, %227 : i20
        fsm.update %byte_cntr_cpha0_q, %226 : i20
        fsm.update %bit_cntr_q, %225 : i3
        fsm.update %segment_rd_en_cpha1, %224 : i1
        fsm.update %clk_cntr_q, %222 : i16
        fsm.update %cmd_len_q, %221 : i20
        fsm.update %cmd_speed_q, %220 : i2
        fsm.update %cmd_wr_en_q, %218 : i1
        fsm.update %cmd_rd_en_q, %219 : i1
        fsm.update %csaat_q, %217 : i1
        fsm.update %clkdiv_q, %216 : i16
        fsm.update %csntrail_q, %215 : i4
        fsm.update %csnlead_q, %214 : i4
        fsm.update %csnidle_q, %213 : i4
        fsm.update %full_cyc_q, %212 : i1
        fsm.update %cpha_q, %211 : i1
        fsm.update %cpol_q, %210 : i1
        fsm.update %csid_q, %209 : i1
      }
      fsm.transition @state_6 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %17 = comb.and %arg1, %0 : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ne %16, %c0_i20 : i20
        %20 = comb.or %18, %19, %cpha_q : i1
        %21 = comb.and %17, %13 : i1
        %22 = comb.and %21, %20 : i1
        %23 = comb.mux %22, %c2_i3, %12 : i3
        %24 = comb.xor %20, %true : i1
        %25 = comb.and %24, %21 : i1
        %26 = comb.mux %25, %14, %23 : i3
        %27 = comb.mux %arg18, %c0_i3, %26 : i3
        %28 = comb.xor %17, %true : i1
        %29 = comb.and %13, %28 : i1
        %30 = comb.mux %29, %c3_i3, %27 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.icmp ne %30, %c3_i3 : i3
        %33 = comb.and %13, %32 : i1
        %true_0 = hw.constant true
        %34 = comb.xor %22, %true_0 : i1
        %true_1 = hw.constant true
        %35 = comb.xor %25, %true_1 : i1
        %true_2 = hw.constant true
        %36 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %37 = comb.xor %29, %true_3 : i1
        %38 = comb.and %37, %36, %35, %34, %10 : i1
        %true_4 = hw.constant true
        %39 = comb.xor %cpha_q, %true_4 : i1
        %40 = comb.and %csaat_q, %7, %39 : i1
        %41 = comb.mux %25, %40, %22 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %29, %true_6 : i1
        %44 = comb.and %43, %42, %41, %15 : i1
        %45 = comb.or %38, %44 : i1
        %46 = comb.and %33, %45 : i1
        %true_7 = hw.constant true
        %47 = comb.xor %arg18, %true_7 : i1
        %48 = comb.and %47, %25, %csaat_q, %7, %cpha_q : i1
        %49 = comb.or %29, %48 : i1
        %50 = comb.and %33, %49, %15 : i1
        %51 = comb.and %arg15, %31, %25, %csaat_q, %9 : i1
        %52 = comb.mux %51, %arg14, %csid_q : i1
        %53 = comb.mux %51, %arg12, %cpha_q : i1
        %54 = comb.mux %51, %arg3, %cmd_wr_en_q : i1
        %55 = comb.mux %51, %arg4, %cmd_rd_en_q : i1
        %56 = comb.mux %51, %arg2, %cmd_speed_q : i2
        %57 = comb.xor %53, %true : i1
        %58 = comb.mux %57, %46, %50 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.icmp eq %arg2, %c0_i2 : i2
        %61 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %62 = comb.mux %51, %60, %61 : i1
        %63 = comb.and %55, %54 : i1
        %64 = comb.xor %63, %true : i1
        %65 = comb.or %62, %64 : i1
        verif.assert %65 : i1
        %66 = comb.icmp ne %56, %c-1_i2 : i2
        verif.assert %66 : i1
        %67 = comb.xor %52, %true : i1
        verif.assert %67 : i1
        %68 = comb.and %58, %54, %1 : i1
        %69 = comb.and %57, %33, %15, %59, %2 : i1
        %70 = comb.or %69, %68, %29 : i1
        %71 = comb.extract %5 from 0 : (i3) -> i2
        %c-2_i2 = hw.constant -2 : i2
        %72 = comb.icmp eq %71, %c-2_i2 : i2
        %true_8 = hw.constant true
        %73 = comb.xor %7, %true_8 : i1
        %74 = comb.and %csaat_q, %73, %72 : i1
        %true_9 = hw.constant true
        %75 = comb.xor %10, %true_9 : i1
        %true_10 = hw.constant true
        %76 = comb.xor %22, %true_10 : i1
        %77 = comb.and %76, %75 : i1
        %78 = comb.mux %25, %74, %77 : i1
        %true_11 = hw.constant true
        %79 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %80 = comb.xor %70, %true_12 : i1
        %81 = comb.and %80, %79, %78 : i1
        fsm.return %81
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.xor %arg18, %true : i1
        %17 = comb.and %5, %16 : i1
        %18 = comb.mux %14, %c-4_i3, %11 : i3
        %19 = comb.xor %5, %true : i1
        %20 = comb.and %16, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c3_i3_0 = hw.constant 3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %24 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %25 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %26 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %27 = comb.or %arg18, %5 : i1
        %28 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %29 = comb.and %cmd_wr_en_q, %22 : i1
        %30 = comb.xor %22, %true : i1
        %31 = comb.icmp ne %24, %c0_i20 : i20
        %32 = comb.or %30, %31, %cpha_q : i1
        %33 = comb.and %17, %32 : i1
        %34 = comb.mux %33, %c2_i3, %15 : i3
        %35 = comb.xor %32, %true : i1
        %36 = comb.and %35, %17 : i1
        %37 = comb.mux %36, %18, %34 : i3
        %38 = comb.mux %arg18, %c0_i3, %37 : i3
        %39 = comb.mux %20, %c3_i3_0, %38 : i3
        %40 = comb.icmp ne %39, %c3_i3_0 : i3
        %41 = comb.and %16, %40 : i1
        %true_1 = hw.constant true
        %42 = comb.xor %33, %true_1 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %36, %true_2 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %45 = comb.xor %20, %true_4 : i1
        %46 = comb.and %45, %44, %43, %42, %13 : i1
        %true_5 = hw.constant true
        %47 = comb.xor %cpha_q, %true_5 : i1
        %48 = comb.and %csaat_q, %10, %47 : i1
        %49 = comb.mux %36, %48, %33 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %20, %true_7 : i1
        %52 = comb.and %51, %50, %49 : i1
        %53 = comb.and %52, %22 : i1
        %54 = comb.or %46, %53 : i1
        %55 = comb.and %41, %54 : i1
        %56 = comb.and %41, %52, %23 : i1
        %57 = comb.and %41, %22 : i1
        %true_8 = hw.constant true
        %58 = comb.xor %arg18, %true_8 : i1
        %59 = comb.and %58, %36, %csaat_q, %10, %cpha_q : i1
        %60 = comb.or %20, %59 : i1
        %61 = comb.and %41, %60, %22 : i1
        %62 = comb.and %41, %60, %23 : i1
        %63 = comb.mux %57, %25, %byte_cntr_cpha0_q : i20
        %true_9 = hw.constant true
        %64 = comb.xor %33, %true_9 : i1
        %true_10 = hw.constant true
        %65 = comb.xor %36, %true_10 : i1
        %true_11 = hw.constant true
        %66 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %67 = comb.xor %20, %true_12 : i1
        %68 = comb.and %67, %66, %65, %64, %13 : i1
        %69 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_13 = hw.constant 0 : i2
        %70 = comb.icmp eq %69, %c0_i2_13 : i2
        %true_14 = hw.constant true
        %71 = comb.xor %10, %true_14 : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.or %14, %72 : i1
        %true_15 = hw.constant true
        %74 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %75 = comb.xor %20, %true_16 : i1
        %76 = comb.and %75, %74, %36, %73 : i1
        %77 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_17 = hw.constant 1 : i2
        %78 = comb.icmp eq %77, %c1_i2_17 : i2
        %true_18 = hw.constant true
        %79 = comb.xor %10, %true_18 : i1
        %true_19 = hw.constant true
        %80 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %81 = comb.xor %20, %true_20 : i1
        %82 = comb.and %81, %80, %36, %csaat_q, %79, %78 : i1
        %83 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_21 = hw.constant -2 : i2
        %84 = comb.icmp eq %83, %c-2_i2_21 : i2
        %true_22 = hw.constant true
        %85 = comb.xor %10, %true_22 : i1
        %86 = comb.and %csaat_q, %85, %84 : i1
        %true_23 = hw.constant true
        %87 = comb.xor %13, %true_23 : i1
        %true_24 = hw.constant true
        %88 = comb.xor %33, %true_24 : i1
        %89 = comb.and %88, %87 : i1
        %90 = comb.mux %36, %86, %89 : i1
        %true_25 = hw.constant true
        %91 = comb.xor %arg18, %true_25 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %20, %true_26 : i1
        %93 = comb.and %40, %17 : i1
        %94 = comb.xor %68, %true : i1
        %95 = comb.and %94, %93 : i1
        %96 = comb.xor %76, %true : i1
        %97 = comb.and %96, %95 : i1
        %98 = comb.xor %82, %true : i1
        %99 = comb.and %98, %97, %92, %91, %90 : i1
        %100 = comb.and %97, %82 : i1
        %101 = comb.or %100, %99 : i1
        %102 = comb.and %95, %76 : i1
        %103 = comb.and %93, %68 : i1
        %104 = comb.xor %40, %true : i1
        %105 = comb.and %28, %104, %17 : i1
        %true_27 = hw.constant true
        %106 = comb.xor %cpha_q, %true_27 : i1
        %107 = comb.and %csaat_q, %10, %106 : i1
        %108 = comb.mux %36, %107, %33 : i1
        %true_28 = hw.constant true
        %109 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %110 = comb.xor %20, %true_29 : i1
        %111 = comb.and %110, %109, %108 : i1
        %true_30 = hw.constant true
        %112 = comb.xor %arg18, %true_30 : i1
        %113 = comb.and %112, %36, %csaat_q, %10, %cpha_q : i1
        %114 = comb.or %20, %113 : i1
        %115 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_31 = hw.constant -1 : i2
        %116 = comb.icmp eq %115, %c-1_i2_31 : i2
        %true_32 = hw.constant true
        %117 = comb.xor %10, %true_32 : i1
        %true_33 = hw.constant true
        %118 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %119 = comb.xor %20, %true_34 : i1
        %120 = comb.icmp ne %39, %c-4_i3 : i3
        %121 = comb.xor %111, %true : i1
        %122 = comb.and %121, %94 : i1
        %123 = comb.xor %114, %true : i1
        %124 = comb.and %123, %122, %119, %118, %36, %csaat_q, %117, %116 : i1
        %125 = comb.xor %124, %true : i1
        %126 = comb.and %122, %114 : i1
        %127 = comb.xor %126, %true : i1
        %128 = comb.and %94, %111 : i1
        %129 = comb.xor %128, %true : i1
        %130 = comb.and %94, %129, %127, %125, %120 : i1
        %131 = comb.icmp ne %39, %c3_i3 : i3
        %132 = comb.and %arg15, %21, %36, %csaat_q, %12 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg8, %csnidle_q : i4
        %137 = comb.mux %132, %arg9, %csnlead_q : i4
        %138 = comb.mux %132, %arg10, %csntrail_q : i4
        %139 = comb.mux %132, %arg7, %clkdiv_q : i16
        %140 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %141 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %142 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %143 = comb.mux %1, %139, %2 : i16
        %144 = comb.mux %132, %arg7, %143 : i16
        %145 = comb.mux %0, %clk_cntr_q, %144 : i16
        %146 = comb.mux %arg18, %c0_i16, %145 : i16
        %147 = comb.xor %135, %true : i1
        %148 = comb.mux %147, %55, %61 : i1
        %149 = comb.and %147, %57 : i1
        %150 = comb.mux %147, %56, %62 : i1
        %151 = comb.mux %147, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %152 = comb.xor %141, %true : i1
        %153 = comb.xor %140, %true : i1
        %154 = comb.and %152, %153 : i1
        %155 = comb.icmp eq %arg2, %c0_i2 : i2
        %156 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %157 = comb.mux %132, %155, %156 : i1
        %158 = comb.icmp eq %arg2, %c1_i2 : i2
        %159 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %160 = comb.mux %132, %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c-2_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %163 = comb.mux %132, %161, %162 : i1
        %164 = comb.mux %163, %c-4_i3, %c1_i3 : i3
        %165 = comb.xor %154, %true : i1
        %166 = comb.xor %157, %true : i1
        %167 = comb.and %166, %165, %160 : i1
        %168 = comb.mux %167, %c2_i3, %164 : i3
        %169 = comb.mux %167, %c-2_i3, %164 : i3
        %170 = comb.and %165, %157 : i1
        %171 = comb.mux %170, %c1_i3, %168 : i3
        %172 = comb.mux %170, %c-1_i3, %169 : i3
        %173 = comb.mux %154, %c0_i3, %171 : i3
        %174 = comb.mux %154, %c0_i3, %172 : i3
        %175 = comb.sub %bit_cntr_q, %173 : i3
        %176 = comb.mux %150, %175, %bit_cntr_q : i3
        %177 = comb.mux %148, %174, %176 : i3
        %178 = comb.mux %19, %bit_cntr_q, %177 : i3
        %179 = comb.mux %arg18, %c0_i3, %178 : i3
        %180 = comb.mux %132, %arg5, %63 : i20
        %181 = comb.mux %19, %byte_cntr_cpha0_q, %180 : i20
        %182 = comb.mux %arg18, %c0_i20, %181 : i20
        %183 = comb.mux %132, %arg5, %byte_cntr_cpha1_q : i20
        %184 = comb.mux %arg18, %c0_i20, %183 : i20
        %185 = comb.mux %101, %136, %c0_i4 : i4
        %186 = comb.mux %102, %138, %185 : i4
        %187 = comb.mux %103, %137, %186 : i4
        %188 = comb.mux %27, %187, %wait_cntr_q : i4
        %189 = comb.mux %arg18, %c0_i4, %188 : i4
        %190 = comb.mux %105, %26, %189 : i4
        %191 = comb.mux %134, %131, %60 : i1
        %192 = comb.xor %149, %true : i1
        %193 = comb.and %192, %cmd_wr_en_last_bit : i1
        %194 = comb.or %29, %193 : i1
        %195 = comb.icmp eq %arg2, %c0_i2 : i2
        %196 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %197 = comb.mux %132, %195, %196 : i1
        %198 = comb.and %141, %140 : i1
        %199 = comb.xor %198, %true : i1
        %200 = comb.or %197, %199 : i1
        verif.assert %200 : i1
        %201 = comb.icmp ne %142, %c-1_i2 : i2
        verif.assert %201 : i1
        %202 = comb.xor %133, %true : i1
        verif.assert %202 : i1
        fsm.update %cmd_wr_en_last_bit, %194 : i1
        %203 = comb.and %148, %140, %3 : i1
        %204 = comb.and %149, %151, %4 : i1
        %205 = comb.or %204, %203 : i1
        %206 = comb.xor %205, %true : i1
        %207 = comb.and %150, %206 : i1
        %208 = comb.and %132, %206 : i1
        %209 = comb.mux %208, %arg14, %csid_q : i1
        %210 = comb.mux %208, %arg13, %cpol_q : i1
        %211 = comb.mux %208, %arg12, %cpha_q : i1
        %212 = comb.mux %208, %arg11, %full_cyc_q : i1
        %213 = comb.mux %208, %arg8, %csnidle_q : i4
        %214 = comb.mux %208, %arg9, %csnlead_q : i4
        %215 = comb.mux %208, %arg10, %csntrail_q : i4
        %216 = comb.mux %208, %arg7, %clkdiv_q : i16
        %217 = comb.mux %208, %arg6, %csaat_q : i1
        %218 = comb.mux %208, %arg3, %cmd_wr_en_q : i1
        %219 = comb.mux %208, %arg4, %cmd_rd_en_q : i1
        %220 = comb.mux %208, %arg2, %cmd_speed_q : i2
        %221 = comb.mux %208, %arg5, %cmd_len_q : i20
        %222 = comb.mux %205, %clk_cntr_q, %146 : i16
        %223 = comb.and %40, %206 : i1
        %224 = comb.mux bin %223, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %225 = comb.mux %205, %bit_cntr_q, %179 : i3
        %226 = comb.mux %205, %byte_cntr_cpha0_q, %182 : i20
        %227 = comb.mux %205, %byte_cntr_cpha1_q, %184 : i20
        %228 = comb.mux %205, %wait_cntr_q, %190 : i4
        %229 = comb.or %148, %207 : i1
        %230 = comb.and %5, %206 : i1
        %231 = comb.mux %230, %229, %sample_en_q : i1
        %232 = comb.mux %230, %sample_en_q, %sample_en_q2 : i1
        %233 = comb.mux bin %205, %u_sck_flop2Fq_o, %191 : i1
        %234 = comb.mux %206, %130, %csb_q : i1
        %235 = comb.or %133, %234 : i1
        fsm.update %csb_q, %235 : i1
        fsm.update %u_sck_flop2Fq_o, %233 : i1
        fsm.update %sample_en_q2, %232 : i1
        fsm.update %sample_en_q, %231 : i1
        fsm.update %wait_cntr_q, %228 : i4
        fsm.update %byte_cntr_cpha1_q, %227 : i20
        fsm.update %byte_cntr_cpha0_q, %226 : i20
        fsm.update %bit_cntr_q, %225 : i3
        fsm.update %segment_rd_en_cpha1, %224 : i1
        fsm.update %clk_cntr_q, %222 : i16
        fsm.update %cmd_len_q, %221 : i20
        fsm.update %cmd_speed_q, %220 : i2
        fsm.update %cmd_wr_en_q, %218 : i1
        fsm.update %cmd_rd_en_q, %219 : i1
        fsm.update %csaat_q, %217 : i1
        fsm.update %clkdiv_q, %216 : i16
        fsm.update %csntrail_q, %215 : i4
        fsm.update %csnlead_q, %214 : i4
        fsm.update %csnidle_q, %213 : i4
        fsm.update %full_cyc_q, %212 : i1
        fsm.update %cpha_q, %211 : i1
        fsm.update %cpol_q, %210 : i1
        fsm.update %csid_q, %209 : i1
      }
      fsm.transition @state_3 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %17 = comb.and %arg1, %0 : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ne %16, %c0_i20 : i20
        %20 = comb.or %18, %19, %cpha_q : i1
        %21 = comb.and %17, %13 : i1
        %22 = comb.and %21, %20 : i1
        %23 = comb.mux %22, %c2_i3, %12 : i3
        %24 = comb.xor %20, %true : i1
        %25 = comb.and %24, %21 : i1
        %26 = comb.mux %25, %14, %23 : i3
        %27 = comb.mux %arg18, %c0_i3, %26 : i3
        %28 = comb.xor %17, %true : i1
        %29 = comb.and %13, %28 : i1
        %30 = comb.mux %29, %c3_i3, %27 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.icmp ne %30, %c3_i3 : i3
        %33 = comb.and %13, %32 : i1
        %true_0 = hw.constant true
        %34 = comb.xor %22, %true_0 : i1
        %true_1 = hw.constant true
        %35 = comb.xor %25, %true_1 : i1
        %true_2 = hw.constant true
        %36 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %37 = comb.xor %29, %true_3 : i1
        %38 = comb.and %37, %36, %35, %34, %10 : i1
        %true_4 = hw.constant true
        %39 = comb.xor %cpha_q, %true_4 : i1
        %40 = comb.and %csaat_q, %7, %39 : i1
        %41 = comb.mux %25, %40, %22 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %29, %true_6 : i1
        %44 = comb.and %43, %42, %41, %15 : i1
        %45 = comb.or %38, %44 : i1
        %46 = comb.and %33, %45 : i1
        %true_7 = hw.constant true
        %47 = comb.xor %arg18, %true_7 : i1
        %48 = comb.and %47, %25, %csaat_q, %7, %cpha_q : i1
        %49 = comb.or %29, %48 : i1
        %50 = comb.and %33, %49, %15 : i1
        %51 = comb.and %arg15, %31, %25, %csaat_q, %9 : i1
        %52 = comb.mux %51, %arg14, %csid_q : i1
        %53 = comb.mux %51, %arg12, %cpha_q : i1
        %54 = comb.mux %51, %arg3, %cmd_wr_en_q : i1
        %55 = comb.mux %51, %arg4, %cmd_rd_en_q : i1
        %56 = comb.mux %51, %arg2, %cmd_speed_q : i2
        %57 = comb.xor %53, %true : i1
        %58 = comb.mux %57, %46, %50 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.icmp eq %arg2, %c0_i2 : i2
        %61 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %62 = comb.mux %51, %60, %61 : i1
        %63 = comb.and %55, %54 : i1
        %64 = comb.xor %63, %true : i1
        %65 = comb.or %62, %64 : i1
        verif.assert %65 : i1
        %66 = comb.icmp ne %56, %c-1_i2 : i2
        verif.assert %66 : i1
        %67 = comb.xor %52, %true : i1
        verif.assert %67 : i1
        %68 = comb.and %58, %54, %1 : i1
        %69 = comb.and %57, %33, %15, %59, %2 : i1
        %true_8 = hw.constant true
        %70 = comb.xor %arg18, %true_8 : i1
        %71 = comb.and %70, %25, %csaat_q, %7, %cpha_q : i1
        %72 = comb.or %69, %68, %29, %71 : i1
        fsm.return %72
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.xor %arg18, %true : i1
        %17 = comb.and %5, %16 : i1
        %18 = comb.mux %14, %c-4_i3, %11 : i3
        %19 = comb.xor %5, %true : i1
        %20 = comb.and %16, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c3_i3_0 = hw.constant 3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %24 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %25 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %26 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %27 = comb.or %arg18, %5 : i1
        %28 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %29 = comb.and %cmd_wr_en_q, %22 : i1
        %30 = comb.xor %22, %true : i1
        %31 = comb.icmp ne %24, %c0_i20 : i20
        %32 = comb.or %30, %31, %cpha_q : i1
        %33 = comb.and %17, %32 : i1
        %34 = comb.mux %33, %c2_i3, %15 : i3
        %35 = comb.xor %32, %true : i1
        %36 = comb.and %35, %17 : i1
        %37 = comb.mux %36, %18, %34 : i3
        %38 = comb.mux %arg18, %c0_i3, %37 : i3
        %39 = comb.mux %20, %c3_i3_0, %38 : i3
        %40 = comb.icmp ne %39, %c3_i3_0 : i3
        %41 = comb.and %16, %40 : i1
        %true_1 = hw.constant true
        %42 = comb.xor %33, %true_1 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %36, %true_2 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %45 = comb.xor %20, %true_4 : i1
        %46 = comb.and %45, %44, %43, %42, %13 : i1
        %true_5 = hw.constant true
        %47 = comb.xor %cpha_q, %true_5 : i1
        %48 = comb.and %csaat_q, %10, %47 : i1
        %49 = comb.mux %36, %48, %33 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %20, %true_7 : i1
        %52 = comb.and %51, %50, %49 : i1
        %53 = comb.and %52, %22 : i1
        %54 = comb.or %46, %53 : i1
        %55 = comb.and %41, %54 : i1
        %56 = comb.and %41, %52, %23 : i1
        %57 = comb.and %41, %22 : i1
        %true_8 = hw.constant true
        %58 = comb.xor %arg18, %true_8 : i1
        %59 = comb.and %58, %36, %csaat_q, %10, %cpha_q : i1
        %60 = comb.or %20, %59 : i1
        %61 = comb.and %41, %60, %22 : i1
        %62 = comb.and %41, %60, %23 : i1
        %63 = comb.mux %57, %25, %byte_cntr_cpha0_q : i20
        %true_9 = hw.constant true
        %64 = comb.xor %33, %true_9 : i1
        %true_10 = hw.constant true
        %65 = comb.xor %36, %true_10 : i1
        %true_11 = hw.constant true
        %66 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %67 = comb.xor %20, %true_12 : i1
        %68 = comb.and %67, %66, %65, %64, %13 : i1
        %69 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_13 = hw.constant 0 : i2
        %70 = comb.icmp eq %69, %c0_i2_13 : i2
        %true_14 = hw.constant true
        %71 = comb.xor %10, %true_14 : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.or %14, %72 : i1
        %true_15 = hw.constant true
        %74 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %75 = comb.xor %20, %true_16 : i1
        %76 = comb.and %75, %74, %36, %73 : i1
        %77 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_17 = hw.constant 1 : i2
        %78 = comb.icmp eq %77, %c1_i2_17 : i2
        %true_18 = hw.constant true
        %79 = comb.xor %10, %true_18 : i1
        %true_19 = hw.constant true
        %80 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %81 = comb.xor %20, %true_20 : i1
        %82 = comb.and %81, %80, %36, %csaat_q, %79, %78 : i1
        %83 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_21 = hw.constant -2 : i2
        %84 = comb.icmp eq %83, %c-2_i2_21 : i2
        %true_22 = hw.constant true
        %85 = comb.xor %10, %true_22 : i1
        %86 = comb.and %csaat_q, %85, %84 : i1
        %true_23 = hw.constant true
        %87 = comb.xor %13, %true_23 : i1
        %true_24 = hw.constant true
        %88 = comb.xor %33, %true_24 : i1
        %89 = comb.and %88, %87 : i1
        %90 = comb.mux %36, %86, %89 : i1
        %true_25 = hw.constant true
        %91 = comb.xor %arg18, %true_25 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %20, %true_26 : i1
        %93 = comb.and %40, %17 : i1
        %94 = comb.xor %68, %true : i1
        %95 = comb.and %94, %93 : i1
        %96 = comb.xor %76, %true : i1
        %97 = comb.and %96, %95 : i1
        %98 = comb.xor %82, %true : i1
        %99 = comb.and %98, %97, %92, %91, %90 : i1
        %100 = comb.and %97, %82 : i1
        %101 = comb.or %100, %99 : i1
        %102 = comb.and %95, %76 : i1
        %103 = comb.and %93, %68 : i1
        %104 = comb.xor %40, %true : i1
        %105 = comb.and %28, %104, %17 : i1
        %true_27 = hw.constant true
        %106 = comb.xor %cpha_q, %true_27 : i1
        %107 = comb.and %csaat_q, %10, %106 : i1
        %108 = comb.mux %36, %107, %33 : i1
        %true_28 = hw.constant true
        %109 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %110 = comb.xor %20, %true_29 : i1
        %111 = comb.and %110, %109, %108 : i1
        %true_30 = hw.constant true
        %112 = comb.xor %arg18, %true_30 : i1
        %113 = comb.and %112, %36, %csaat_q, %10, %cpha_q : i1
        %114 = comb.or %20, %113 : i1
        %115 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_31 = hw.constant -1 : i2
        %116 = comb.icmp eq %115, %c-1_i2_31 : i2
        %true_32 = hw.constant true
        %117 = comb.xor %10, %true_32 : i1
        %true_33 = hw.constant true
        %118 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %119 = comb.xor %20, %true_34 : i1
        %120 = comb.icmp ne %39, %c-4_i3 : i3
        %121 = comb.xor %111, %true : i1
        %122 = comb.and %121, %94 : i1
        %123 = comb.xor %114, %true : i1
        %124 = comb.and %123, %122, %119, %118, %36, %csaat_q, %117, %116 : i1
        %125 = comb.xor %124, %true : i1
        %126 = comb.and %122, %114 : i1
        %127 = comb.xor %126, %true : i1
        %128 = comb.and %94, %111 : i1
        %129 = comb.xor %128, %true : i1
        %130 = comb.and %94, %129, %127, %125, %120 : i1
        %131 = comb.icmp ne %39, %c3_i3 : i3
        %132 = comb.and %arg15, %21, %36, %csaat_q, %12 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg8, %csnidle_q : i4
        %137 = comb.mux %132, %arg9, %csnlead_q : i4
        %138 = comb.mux %132, %arg10, %csntrail_q : i4
        %139 = comb.mux %132, %arg7, %clkdiv_q : i16
        %140 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %141 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %142 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %143 = comb.mux %1, %139, %2 : i16
        %144 = comb.mux %132, %arg7, %143 : i16
        %145 = comb.mux %0, %clk_cntr_q, %144 : i16
        %146 = comb.mux %arg18, %c0_i16, %145 : i16
        %147 = comb.xor %135, %true : i1
        %148 = comb.mux %147, %55, %61 : i1
        %149 = comb.and %147, %57 : i1
        %150 = comb.mux %147, %56, %62 : i1
        %151 = comb.mux %147, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %152 = comb.xor %141, %true : i1
        %153 = comb.xor %140, %true : i1
        %154 = comb.and %152, %153 : i1
        %155 = comb.icmp eq %arg2, %c0_i2 : i2
        %156 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %157 = comb.mux %132, %155, %156 : i1
        %158 = comb.icmp eq %arg2, %c1_i2 : i2
        %159 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %160 = comb.mux %132, %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c-2_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %163 = comb.mux %132, %161, %162 : i1
        %164 = comb.mux %163, %c-4_i3, %c1_i3 : i3
        %165 = comb.xor %154, %true : i1
        %166 = comb.xor %157, %true : i1
        %167 = comb.and %166, %165, %160 : i1
        %168 = comb.mux %167, %c2_i3, %164 : i3
        %169 = comb.mux %167, %c-2_i3, %164 : i3
        %170 = comb.and %165, %157 : i1
        %171 = comb.mux %170, %c1_i3, %168 : i3
        %172 = comb.mux %170, %c-1_i3, %169 : i3
        %173 = comb.mux %154, %c0_i3, %171 : i3
        %174 = comb.mux %154, %c0_i3, %172 : i3
        %175 = comb.sub %bit_cntr_q, %173 : i3
        %176 = comb.mux %150, %175, %bit_cntr_q : i3
        %177 = comb.mux %148, %174, %176 : i3
        %178 = comb.mux %19, %bit_cntr_q, %177 : i3
        %179 = comb.mux %arg18, %c0_i3, %178 : i3
        %180 = comb.mux %132, %arg5, %63 : i20
        %181 = comb.mux %19, %byte_cntr_cpha0_q, %180 : i20
        %182 = comb.mux %arg18, %c0_i20, %181 : i20
        %183 = comb.mux %132, %arg5, %byte_cntr_cpha1_q : i20
        %184 = comb.mux %arg18, %c0_i20, %183 : i20
        %185 = comb.mux %101, %136, %c0_i4 : i4
        %186 = comb.mux %102, %138, %185 : i4
        %187 = comb.mux %103, %137, %186 : i4
        %188 = comb.mux %27, %187, %wait_cntr_q : i4
        %189 = comb.mux %arg18, %c0_i4, %188 : i4
        %190 = comb.mux %105, %26, %189 : i4
        %191 = comb.mux %134, %131, %60 : i1
        %192 = comb.xor %149, %true : i1
        %193 = comb.and %192, %cmd_wr_en_last_bit : i1
        %194 = comb.or %29, %193 : i1
        %195 = comb.icmp eq %arg2, %c0_i2 : i2
        %196 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %197 = comb.mux %132, %195, %196 : i1
        %198 = comb.and %141, %140 : i1
        %199 = comb.xor %198, %true : i1
        %200 = comb.or %197, %199 : i1
        verif.assert %200 : i1
        %201 = comb.icmp ne %142, %c-1_i2 : i2
        verif.assert %201 : i1
        %202 = comb.xor %133, %true : i1
        verif.assert %202 : i1
        fsm.update %cmd_wr_en_last_bit, %194 : i1
        %203 = comb.and %148, %140, %3 : i1
        %204 = comb.and %149, %151, %4 : i1
        %205 = comb.or %204, %203 : i1
        %206 = comb.xor %205, %true : i1
        %207 = comb.and %150, %206 : i1
        %208 = comb.and %132, %206 : i1
        %209 = comb.mux %208, %arg14, %csid_q : i1
        %210 = comb.mux %208, %arg13, %cpol_q : i1
        %211 = comb.mux %208, %arg12, %cpha_q : i1
        %212 = comb.mux %208, %arg11, %full_cyc_q : i1
        %213 = comb.mux %208, %arg8, %csnidle_q : i4
        %214 = comb.mux %208, %arg9, %csnlead_q : i4
        %215 = comb.mux %208, %arg10, %csntrail_q : i4
        %216 = comb.mux %208, %arg7, %clkdiv_q : i16
        %217 = comb.mux %208, %arg6, %csaat_q : i1
        %218 = comb.mux %208, %arg3, %cmd_wr_en_q : i1
        %219 = comb.mux %208, %arg4, %cmd_rd_en_q : i1
        %220 = comb.mux %208, %arg2, %cmd_speed_q : i2
        %221 = comb.mux %208, %arg5, %cmd_len_q : i20
        %222 = comb.mux %205, %clk_cntr_q, %146 : i16
        %223 = comb.and %40, %206 : i1
        %224 = comb.mux bin %223, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %225 = comb.mux %205, %bit_cntr_q, %179 : i3
        %226 = comb.mux %205, %byte_cntr_cpha0_q, %182 : i20
        %227 = comb.mux %205, %byte_cntr_cpha1_q, %184 : i20
        %228 = comb.mux %205, %wait_cntr_q, %190 : i4
        %229 = comb.or %148, %207 : i1
        %230 = comb.and %5, %206 : i1
        %231 = comb.mux %230, %229, %sample_en_q : i1
        %232 = comb.mux %230, %sample_en_q, %sample_en_q2 : i1
        %233 = comb.mux bin %205, %u_sck_flop2Fq_o, %191 : i1
        %234 = comb.mux %206, %130, %csb_q : i1
        %235 = comb.or %133, %234 : i1
        fsm.update %csb_q, %235 : i1
        fsm.update %u_sck_flop2Fq_o, %233 : i1
        fsm.update %sample_en_q2, %232 : i1
        fsm.update %sample_en_q, %231 : i1
        fsm.update %wait_cntr_q, %228 : i4
        fsm.update %byte_cntr_cpha1_q, %227 : i20
        fsm.update %byte_cntr_cpha0_q, %226 : i20
        fsm.update %bit_cntr_q, %225 : i3
        fsm.update %segment_rd_en_cpha1, %224 : i1
        fsm.update %clk_cntr_q, %222 : i16
        fsm.update %cmd_len_q, %221 : i20
        fsm.update %cmd_speed_q, %220 : i2
        fsm.update %cmd_wr_en_q, %218 : i1
        fsm.update %cmd_rd_en_q, %219 : i1
        fsm.update %csaat_q, %217 : i1
        fsm.update %clkdiv_q, %216 : i16
        fsm.update %csntrail_q, %215 : i4
        fsm.update %csnlead_q, %214 : i4
        fsm.update %csnidle_q, %213 : i4
        fsm.update %full_cyc_q, %212 : i1
        fsm.update %cpha_q, %211 : i1
        fsm.update %cpol_q, %210 : i1
        fsm.update %csid_q, %209 : i1
      }
      fsm.transition @state_2 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %17 = comb.and %arg1, %0 : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ne %16, %c0_i20 : i20
        %20 = comb.or %18, %19, %cpha_q : i1
        %21 = comb.and %17, %13 : i1
        %22 = comb.and %21, %20 : i1
        %23 = comb.mux %22, %c2_i3, %12 : i3
        %24 = comb.xor %20, %true : i1
        %25 = comb.and %24, %21 : i1
        %26 = comb.mux %25, %14, %23 : i3
        %27 = comb.mux %arg18, %c0_i3, %26 : i3
        %28 = comb.xor %17, %true : i1
        %29 = comb.and %13, %28 : i1
        %30 = comb.mux %29, %c3_i3, %27 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.icmp ne %30, %c3_i3 : i3
        %33 = comb.and %13, %32 : i1
        %true_0 = hw.constant true
        %34 = comb.xor %22, %true_0 : i1
        %true_1 = hw.constant true
        %35 = comb.xor %25, %true_1 : i1
        %true_2 = hw.constant true
        %36 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %37 = comb.xor %29, %true_3 : i1
        %38 = comb.and %37, %36, %35, %34, %10 : i1
        %true_4 = hw.constant true
        %39 = comb.xor %cpha_q, %true_4 : i1
        %40 = comb.and %csaat_q, %7, %39 : i1
        %41 = comb.mux %25, %40, %22 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %29, %true_6 : i1
        %44 = comb.and %43, %42, %41, %15 : i1
        %45 = comb.or %38, %44 : i1
        %46 = comb.and %33, %45 : i1
        %true_7 = hw.constant true
        %47 = comb.xor %arg18, %true_7 : i1
        %48 = comb.and %47, %25, %csaat_q, %7, %cpha_q : i1
        %49 = comb.or %29, %48 : i1
        %50 = comb.and %33, %49, %15 : i1
        %51 = comb.and %arg15, %31, %25, %csaat_q, %9 : i1
        %52 = comb.mux %51, %arg14, %csid_q : i1
        %53 = comb.mux %51, %arg12, %cpha_q : i1
        %54 = comb.mux %51, %arg3, %cmd_wr_en_q : i1
        %55 = comb.mux %51, %arg4, %cmd_rd_en_q : i1
        %56 = comb.mux %51, %arg2, %cmd_speed_q : i2
        %57 = comb.xor %53, %true : i1
        %58 = comb.mux %57, %46, %50 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.icmp eq %arg2, %c0_i2 : i2
        %61 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %62 = comb.mux %51, %60, %61 : i1
        %63 = comb.and %55, %54 : i1
        %64 = comb.xor %63, %true : i1
        %65 = comb.or %62, %64 : i1
        verif.assert %65 : i1
        %66 = comb.icmp ne %56, %c-1_i2 : i2
        verif.assert %66 : i1
        %67 = comb.xor %52, %true : i1
        verif.assert %67 : i1
        %68 = comb.and %58, %54, %1 : i1
        %69 = comb.and %57, %33, %15, %59, %2 : i1
        %70 = comb.or %69, %68, %29 : i1
        %true_8 = hw.constant true
        %71 = comb.xor %cpha_q, %true_8 : i1
        %72 = comb.and %csaat_q, %7, %71 : i1
        %73 = comb.mux %25, %72, %22 : i1
        %true_9 = hw.constant true
        %74 = comb.xor %arg18, %true_9 : i1
        %true_10 = hw.constant true
        %75 = comb.xor %70, %true_10 : i1
        %76 = comb.and %75, %74, %73 : i1
        fsm.return %76
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.xor %arg18, %true : i1
        %17 = comb.and %5, %16 : i1
        %18 = comb.mux %14, %c-4_i3, %11 : i3
        %19 = comb.xor %5, %true : i1
        %20 = comb.and %16, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c3_i3_0 = hw.constant 3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %24 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %25 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %26 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %27 = comb.or %arg18, %5 : i1
        %28 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %29 = comb.and %cmd_wr_en_q, %22 : i1
        %30 = comb.xor %22, %true : i1
        %31 = comb.icmp ne %24, %c0_i20 : i20
        %32 = comb.or %30, %31, %cpha_q : i1
        %33 = comb.and %17, %32 : i1
        %34 = comb.mux %33, %c2_i3, %15 : i3
        %35 = comb.xor %32, %true : i1
        %36 = comb.and %35, %17 : i1
        %37 = comb.mux %36, %18, %34 : i3
        %38 = comb.mux %arg18, %c0_i3, %37 : i3
        %39 = comb.mux %20, %c3_i3_0, %38 : i3
        %40 = comb.icmp ne %39, %c3_i3_0 : i3
        %41 = comb.and %16, %40 : i1
        %true_1 = hw.constant true
        %42 = comb.xor %33, %true_1 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %36, %true_2 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %45 = comb.xor %20, %true_4 : i1
        %46 = comb.and %45, %44, %43, %42, %13 : i1
        %true_5 = hw.constant true
        %47 = comb.xor %cpha_q, %true_5 : i1
        %48 = comb.and %csaat_q, %10, %47 : i1
        %49 = comb.mux %36, %48, %33 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %20, %true_7 : i1
        %52 = comb.and %51, %50, %49 : i1
        %53 = comb.and %52, %22 : i1
        %54 = comb.or %46, %53 : i1
        %55 = comb.and %41, %54 : i1
        %56 = comb.and %41, %52, %23 : i1
        %57 = comb.and %41, %22 : i1
        %true_8 = hw.constant true
        %58 = comb.xor %arg18, %true_8 : i1
        %59 = comb.and %58, %36, %csaat_q, %10, %cpha_q : i1
        %60 = comb.or %20, %59 : i1
        %61 = comb.and %41, %60, %22 : i1
        %62 = comb.and %41, %60, %23 : i1
        %63 = comb.mux %57, %25, %byte_cntr_cpha0_q : i20
        %true_9 = hw.constant true
        %64 = comb.xor %33, %true_9 : i1
        %true_10 = hw.constant true
        %65 = comb.xor %36, %true_10 : i1
        %true_11 = hw.constant true
        %66 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %67 = comb.xor %20, %true_12 : i1
        %68 = comb.and %67, %66, %65, %64, %13 : i1
        %69 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_13 = hw.constant 0 : i2
        %70 = comb.icmp eq %69, %c0_i2_13 : i2
        %true_14 = hw.constant true
        %71 = comb.xor %10, %true_14 : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.or %14, %72 : i1
        %true_15 = hw.constant true
        %74 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %75 = comb.xor %20, %true_16 : i1
        %76 = comb.and %75, %74, %36, %73 : i1
        %77 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_17 = hw.constant 1 : i2
        %78 = comb.icmp eq %77, %c1_i2_17 : i2
        %true_18 = hw.constant true
        %79 = comb.xor %10, %true_18 : i1
        %true_19 = hw.constant true
        %80 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %81 = comb.xor %20, %true_20 : i1
        %82 = comb.and %81, %80, %36, %csaat_q, %79, %78 : i1
        %83 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_21 = hw.constant -2 : i2
        %84 = comb.icmp eq %83, %c-2_i2_21 : i2
        %true_22 = hw.constant true
        %85 = comb.xor %10, %true_22 : i1
        %86 = comb.and %csaat_q, %85, %84 : i1
        %true_23 = hw.constant true
        %87 = comb.xor %13, %true_23 : i1
        %true_24 = hw.constant true
        %88 = comb.xor %33, %true_24 : i1
        %89 = comb.and %88, %87 : i1
        %90 = comb.mux %36, %86, %89 : i1
        %true_25 = hw.constant true
        %91 = comb.xor %arg18, %true_25 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %20, %true_26 : i1
        %93 = comb.and %40, %17 : i1
        %94 = comb.xor %68, %true : i1
        %95 = comb.and %94, %93 : i1
        %96 = comb.xor %76, %true : i1
        %97 = comb.and %96, %95 : i1
        %98 = comb.xor %82, %true : i1
        %99 = comb.and %98, %97, %92, %91, %90 : i1
        %100 = comb.and %97, %82 : i1
        %101 = comb.or %100, %99 : i1
        %102 = comb.and %95, %76 : i1
        %103 = comb.and %93, %68 : i1
        %104 = comb.xor %40, %true : i1
        %105 = comb.and %28, %104, %17 : i1
        %true_27 = hw.constant true
        %106 = comb.xor %cpha_q, %true_27 : i1
        %107 = comb.and %csaat_q, %10, %106 : i1
        %108 = comb.mux %36, %107, %33 : i1
        %true_28 = hw.constant true
        %109 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %110 = comb.xor %20, %true_29 : i1
        %111 = comb.and %110, %109, %108 : i1
        %true_30 = hw.constant true
        %112 = comb.xor %arg18, %true_30 : i1
        %113 = comb.and %112, %36, %csaat_q, %10, %cpha_q : i1
        %114 = comb.or %20, %113 : i1
        %115 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_31 = hw.constant -1 : i2
        %116 = comb.icmp eq %115, %c-1_i2_31 : i2
        %true_32 = hw.constant true
        %117 = comb.xor %10, %true_32 : i1
        %true_33 = hw.constant true
        %118 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %119 = comb.xor %20, %true_34 : i1
        %120 = comb.icmp ne %39, %c-4_i3 : i3
        %121 = comb.xor %111, %true : i1
        %122 = comb.and %121, %94 : i1
        %123 = comb.xor %114, %true : i1
        %124 = comb.and %123, %122, %119, %118, %36, %csaat_q, %117, %116 : i1
        %125 = comb.xor %124, %true : i1
        %126 = comb.and %122, %114 : i1
        %127 = comb.xor %126, %true : i1
        %128 = comb.and %94, %111 : i1
        %129 = comb.xor %128, %true : i1
        %130 = comb.and %94, %129, %127, %125, %120 : i1
        %131 = comb.icmp ne %39, %c3_i3 : i3
        %132 = comb.and %arg15, %21, %36, %csaat_q, %12 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg8, %csnidle_q : i4
        %137 = comb.mux %132, %arg9, %csnlead_q : i4
        %138 = comb.mux %132, %arg10, %csntrail_q : i4
        %139 = comb.mux %132, %arg7, %clkdiv_q : i16
        %140 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %141 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %142 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %143 = comb.mux %1, %139, %2 : i16
        %144 = comb.mux %132, %arg7, %143 : i16
        %145 = comb.mux %0, %clk_cntr_q, %144 : i16
        %146 = comb.mux %arg18, %c0_i16, %145 : i16
        %147 = comb.xor %135, %true : i1
        %148 = comb.mux %147, %55, %61 : i1
        %149 = comb.and %147, %57 : i1
        %150 = comb.mux %147, %56, %62 : i1
        %151 = comb.mux %147, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %152 = comb.xor %141, %true : i1
        %153 = comb.xor %140, %true : i1
        %154 = comb.and %152, %153 : i1
        %155 = comb.icmp eq %arg2, %c0_i2 : i2
        %156 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %157 = comb.mux %132, %155, %156 : i1
        %158 = comb.icmp eq %arg2, %c1_i2 : i2
        %159 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %160 = comb.mux %132, %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c-2_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %163 = comb.mux %132, %161, %162 : i1
        %164 = comb.mux %163, %c-4_i3, %c1_i3 : i3
        %165 = comb.xor %154, %true : i1
        %166 = comb.xor %157, %true : i1
        %167 = comb.and %166, %165, %160 : i1
        %168 = comb.mux %167, %c2_i3, %164 : i3
        %169 = comb.mux %167, %c-2_i3, %164 : i3
        %170 = comb.and %165, %157 : i1
        %171 = comb.mux %170, %c1_i3, %168 : i3
        %172 = comb.mux %170, %c-1_i3, %169 : i3
        %173 = comb.mux %154, %c0_i3, %171 : i3
        %174 = comb.mux %154, %c0_i3, %172 : i3
        %175 = comb.sub %bit_cntr_q, %173 : i3
        %176 = comb.mux %150, %175, %bit_cntr_q : i3
        %177 = comb.mux %148, %174, %176 : i3
        %178 = comb.mux %19, %bit_cntr_q, %177 : i3
        %179 = comb.mux %arg18, %c0_i3, %178 : i3
        %180 = comb.mux %132, %arg5, %63 : i20
        %181 = comb.mux %19, %byte_cntr_cpha0_q, %180 : i20
        %182 = comb.mux %arg18, %c0_i20, %181 : i20
        %183 = comb.mux %132, %arg5, %byte_cntr_cpha1_q : i20
        %184 = comb.mux %arg18, %c0_i20, %183 : i20
        %185 = comb.mux %101, %136, %c0_i4 : i4
        %186 = comb.mux %102, %138, %185 : i4
        %187 = comb.mux %103, %137, %186 : i4
        %188 = comb.mux %27, %187, %wait_cntr_q : i4
        %189 = comb.mux %arg18, %c0_i4, %188 : i4
        %190 = comb.mux %105, %26, %189 : i4
        %191 = comb.mux %134, %131, %60 : i1
        %192 = comb.xor %149, %true : i1
        %193 = comb.and %192, %cmd_wr_en_last_bit : i1
        %194 = comb.or %29, %193 : i1
        %195 = comb.icmp eq %arg2, %c0_i2 : i2
        %196 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %197 = comb.mux %132, %195, %196 : i1
        %198 = comb.and %141, %140 : i1
        %199 = comb.xor %198, %true : i1
        %200 = comb.or %197, %199 : i1
        verif.assert %200 : i1
        %201 = comb.icmp ne %142, %c-1_i2 : i2
        verif.assert %201 : i1
        %202 = comb.xor %133, %true : i1
        verif.assert %202 : i1
        fsm.update %cmd_wr_en_last_bit, %194 : i1
        %203 = comb.and %148, %140, %3 : i1
        %204 = comb.and %149, %151, %4 : i1
        %205 = comb.or %204, %203 : i1
        %206 = comb.xor %205, %true : i1
        %207 = comb.and %150, %206 : i1
        %208 = comb.and %132, %206 : i1
        %209 = comb.mux %208, %arg14, %csid_q : i1
        %210 = comb.mux %208, %arg13, %cpol_q : i1
        %211 = comb.mux %208, %arg12, %cpha_q : i1
        %212 = comb.mux %208, %arg11, %full_cyc_q : i1
        %213 = comb.mux %208, %arg8, %csnidle_q : i4
        %214 = comb.mux %208, %arg9, %csnlead_q : i4
        %215 = comb.mux %208, %arg10, %csntrail_q : i4
        %216 = comb.mux %208, %arg7, %clkdiv_q : i16
        %217 = comb.mux %208, %arg6, %csaat_q : i1
        %218 = comb.mux %208, %arg3, %cmd_wr_en_q : i1
        %219 = comb.mux %208, %arg4, %cmd_rd_en_q : i1
        %220 = comb.mux %208, %arg2, %cmd_speed_q : i2
        %221 = comb.mux %208, %arg5, %cmd_len_q : i20
        %222 = comb.mux %205, %clk_cntr_q, %146 : i16
        %223 = comb.and %40, %206 : i1
        %224 = comb.mux bin %223, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %225 = comb.mux %205, %bit_cntr_q, %179 : i3
        %226 = comb.mux %205, %byte_cntr_cpha0_q, %182 : i20
        %227 = comb.mux %205, %byte_cntr_cpha1_q, %184 : i20
        %228 = comb.mux %205, %wait_cntr_q, %190 : i4
        %229 = comb.or %148, %207 : i1
        %230 = comb.and %5, %206 : i1
        %231 = comb.mux %230, %229, %sample_en_q : i1
        %232 = comb.mux %230, %sample_en_q, %sample_en_q2 : i1
        %233 = comb.mux bin %205, %u_sck_flop2Fq_o, %191 : i1
        %234 = comb.mux %206, %130, %csb_q : i1
        %235 = comb.or %133, %234 : i1
        fsm.update %csb_q, %235 : i1
        fsm.update %u_sck_flop2Fq_o, %233 : i1
        fsm.update %sample_en_q2, %232 : i1
        fsm.update %sample_en_q, %231 : i1
        fsm.update %wait_cntr_q, %228 : i4
        fsm.update %byte_cntr_cpha1_q, %227 : i20
        fsm.update %byte_cntr_cpha0_q, %226 : i20
        fsm.update %bit_cntr_q, %225 : i3
        fsm.update %segment_rd_en_cpha1, %224 : i1
        fsm.update %clk_cntr_q, %222 : i16
        fsm.update %cmd_len_q, %221 : i20
        fsm.update %cmd_speed_q, %220 : i2
        fsm.update %cmd_wr_en_q, %218 : i1
        fsm.update %cmd_rd_en_q, %219 : i1
        fsm.update %csaat_q, %217 : i1
        fsm.update %clkdiv_q, %216 : i16
        fsm.update %csntrail_q, %215 : i4
        fsm.update %csnlead_q, %214 : i4
        fsm.update %csnidle_q, %213 : i4
        fsm.update %full_cyc_q, %212 : i1
        fsm.update %cpha_q, %211 : i1
        fsm.update %cpol_q, %210 : i1
        fsm.update %csid_q, %209 : i1
      }
      fsm.transition @state_1 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %17 = comb.and %arg1, %0 : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ne %16, %c0_i20 : i20
        %20 = comb.or %18, %19, %cpha_q : i1
        %21 = comb.and %17, %13 : i1
        %22 = comb.and %21, %20 : i1
        %23 = comb.mux %22, %c2_i3, %12 : i3
        %24 = comb.xor %20, %true : i1
        %25 = comb.and %24, %21 : i1
        %26 = comb.mux %25, %14, %23 : i3
        %27 = comb.mux %arg18, %c0_i3, %26 : i3
        %28 = comb.xor %17, %true : i1
        %29 = comb.and %13, %28 : i1
        %30 = comb.mux %29, %c3_i3, %27 : i3
        %31 = comb.xor %29, %true : i1
        %32 = comb.icmp ne %30, %c3_i3 : i3
        %33 = comb.and %13, %32 : i1
        %true_0 = hw.constant true
        %34 = comb.xor %22, %true_0 : i1
        %true_1 = hw.constant true
        %35 = comb.xor %25, %true_1 : i1
        %true_2 = hw.constant true
        %36 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %37 = comb.xor %29, %true_3 : i1
        %38 = comb.and %37, %36, %35, %34, %10 : i1
        %true_4 = hw.constant true
        %39 = comb.xor %cpha_q, %true_4 : i1
        %40 = comb.and %csaat_q, %7, %39 : i1
        %41 = comb.mux %25, %40, %22 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %29, %true_6 : i1
        %44 = comb.and %43, %42, %41, %15 : i1
        %45 = comb.or %38, %44 : i1
        %46 = comb.and %33, %45 : i1
        %true_7 = hw.constant true
        %47 = comb.xor %arg18, %true_7 : i1
        %48 = comb.and %47, %25, %csaat_q, %7, %cpha_q : i1
        %49 = comb.or %29, %48 : i1
        %50 = comb.and %33, %49, %15 : i1
        %51 = comb.and %arg15, %31, %25, %csaat_q, %9 : i1
        %52 = comb.mux %51, %arg14, %csid_q : i1
        %53 = comb.mux %51, %arg12, %cpha_q : i1
        %54 = comb.mux %51, %arg3, %cmd_wr_en_q : i1
        %55 = comb.mux %51, %arg4, %cmd_rd_en_q : i1
        %56 = comb.mux %51, %arg2, %cmd_speed_q : i2
        %57 = comb.xor %53, %true : i1
        %58 = comb.mux %57, %46, %50 : i1
        %59 = comb.mux %57, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %60 = comb.icmp eq %arg2, %c0_i2 : i2
        %61 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %62 = comb.mux %51, %60, %61 : i1
        %63 = comb.and %55, %54 : i1
        %64 = comb.xor %63, %true : i1
        %65 = comb.or %62, %64 : i1
        verif.assert %65 : i1
        %66 = comb.icmp ne %56, %c-1_i2 : i2
        verif.assert %66 : i1
        %67 = comb.xor %52, %true : i1
        verif.assert %67 : i1
        %68 = comb.and %58, %54, %1 : i1
        %69 = comb.and %57, %33, %15, %59, %2 : i1
        %70 = comb.or %69, %68, %29 : i1
        %true_8 = hw.constant true
        %71 = comb.xor %22, %true_8 : i1
        %true_9 = hw.constant true
        %72 = comb.xor %25, %true_9 : i1
        %true_10 = hw.constant true
        %73 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %74 = comb.xor %70, %true_11 : i1
        %75 = comb.and %74, %73, %72, %71, %10 : i1
        fsm.return %75
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %13 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %14 = comb.xor %csaat_q, %true : i1
        %15 = comb.mux %13, %c1_i3, %c-2_i3 : i3
        %16 = comb.xor %arg18, %true : i1
        %17 = comb.and %5, %16 : i1
        %18 = comb.mux %14, %c-4_i3, %11 : i3
        %19 = comb.xor %5, %true : i1
        %20 = comb.and %16, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c3_i3_0 = hw.constant 3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %24 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %25 = comb.add %byte_cntr_cpha0_q, %c-1_i20 : i20
        %26 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %27 = comb.or %arg18, %5 : i1
        %28 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %29 = comb.and %cmd_wr_en_q, %22 : i1
        %30 = comb.xor %22, %true : i1
        %31 = comb.icmp ne %24, %c0_i20 : i20
        %32 = comb.or %30, %31, %cpha_q : i1
        %33 = comb.and %17, %32 : i1
        %34 = comb.mux %33, %c2_i3, %15 : i3
        %35 = comb.xor %32, %true : i1
        %36 = comb.and %35, %17 : i1
        %37 = comb.mux %36, %18, %34 : i3
        %38 = comb.mux %arg18, %c0_i3, %37 : i3
        %39 = comb.mux %20, %c3_i3_0, %38 : i3
        %40 = comb.icmp ne %39, %c3_i3_0 : i3
        %41 = comb.and %16, %40 : i1
        %true_1 = hw.constant true
        %42 = comb.xor %33, %true_1 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %36, %true_2 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %45 = comb.xor %20, %true_4 : i1
        %46 = comb.and %45, %44, %43, %42, %13 : i1
        %true_5 = hw.constant true
        %47 = comb.xor %cpha_q, %true_5 : i1
        %48 = comb.and %csaat_q, %10, %47 : i1
        %49 = comb.mux %36, %48, %33 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %20, %true_7 : i1
        %52 = comb.and %51, %50, %49 : i1
        %53 = comb.and %52, %22 : i1
        %54 = comb.or %46, %53 : i1
        %55 = comb.and %41, %54 : i1
        %56 = comb.and %41, %52, %23 : i1
        %57 = comb.and %41, %22 : i1
        %true_8 = hw.constant true
        %58 = comb.xor %arg18, %true_8 : i1
        %59 = comb.and %58, %36, %csaat_q, %10, %cpha_q : i1
        %60 = comb.or %20, %59 : i1
        %61 = comb.and %41, %60, %22 : i1
        %62 = comb.and %41, %60, %23 : i1
        %63 = comb.mux %57, %25, %byte_cntr_cpha0_q : i20
        %true_9 = hw.constant true
        %64 = comb.xor %33, %true_9 : i1
        %true_10 = hw.constant true
        %65 = comb.xor %36, %true_10 : i1
        %true_11 = hw.constant true
        %66 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %67 = comb.xor %20, %true_12 : i1
        %68 = comb.and %67, %66, %65, %64, %13 : i1
        %69 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_13 = hw.constant 0 : i2
        %70 = comb.icmp eq %69, %c0_i2_13 : i2
        %true_14 = hw.constant true
        %71 = comb.xor %10, %true_14 : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.or %14, %72 : i1
        %true_15 = hw.constant true
        %74 = comb.xor %arg18, %true_15 : i1
        %true_16 = hw.constant true
        %75 = comb.xor %20, %true_16 : i1
        %76 = comb.and %75, %74, %36, %73 : i1
        %77 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_17 = hw.constant 1 : i2
        %78 = comb.icmp eq %77, %c1_i2_17 : i2
        %true_18 = hw.constant true
        %79 = comb.xor %10, %true_18 : i1
        %true_19 = hw.constant true
        %80 = comb.xor %arg18, %true_19 : i1
        %true_20 = hw.constant true
        %81 = comb.xor %20, %true_20 : i1
        %82 = comb.and %81, %80, %36, %csaat_q, %79, %78 : i1
        %83 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_21 = hw.constant -2 : i2
        %84 = comb.icmp eq %83, %c-2_i2_21 : i2
        %true_22 = hw.constant true
        %85 = comb.xor %10, %true_22 : i1
        %86 = comb.and %csaat_q, %85, %84 : i1
        %true_23 = hw.constant true
        %87 = comb.xor %13, %true_23 : i1
        %true_24 = hw.constant true
        %88 = comb.xor %33, %true_24 : i1
        %89 = comb.and %88, %87 : i1
        %90 = comb.mux %36, %86, %89 : i1
        %true_25 = hw.constant true
        %91 = comb.xor %arg18, %true_25 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %20, %true_26 : i1
        %93 = comb.and %40, %17 : i1
        %94 = comb.xor %68, %true : i1
        %95 = comb.and %94, %93 : i1
        %96 = comb.xor %76, %true : i1
        %97 = comb.and %96, %95 : i1
        %98 = comb.xor %82, %true : i1
        %99 = comb.and %98, %97, %92, %91, %90 : i1
        %100 = comb.and %97, %82 : i1
        %101 = comb.or %100, %99 : i1
        %102 = comb.and %95, %76 : i1
        %103 = comb.and %93, %68 : i1
        %104 = comb.xor %40, %true : i1
        %105 = comb.and %28, %104, %17 : i1
        %true_27 = hw.constant true
        %106 = comb.xor %cpha_q, %true_27 : i1
        %107 = comb.and %csaat_q, %10, %106 : i1
        %108 = comb.mux %36, %107, %33 : i1
        %true_28 = hw.constant true
        %109 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %110 = comb.xor %20, %true_29 : i1
        %111 = comb.and %110, %109, %108 : i1
        %true_30 = hw.constant true
        %112 = comb.xor %arg18, %true_30 : i1
        %113 = comb.and %112, %36, %csaat_q, %10, %cpha_q : i1
        %114 = comb.or %20, %113 : i1
        %115 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_31 = hw.constant -1 : i2
        %116 = comb.icmp eq %115, %c-1_i2_31 : i2
        %true_32 = hw.constant true
        %117 = comb.xor %10, %true_32 : i1
        %true_33 = hw.constant true
        %118 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %119 = comb.xor %20, %true_34 : i1
        %120 = comb.icmp ne %39, %c-4_i3 : i3
        %121 = comb.xor %111, %true : i1
        %122 = comb.and %121, %94 : i1
        %123 = comb.xor %114, %true : i1
        %124 = comb.and %123, %122, %119, %118, %36, %csaat_q, %117, %116 : i1
        %125 = comb.xor %124, %true : i1
        %126 = comb.and %122, %114 : i1
        %127 = comb.xor %126, %true : i1
        %128 = comb.and %94, %111 : i1
        %129 = comb.xor %128, %true : i1
        %130 = comb.and %94, %129, %127, %125, %120 : i1
        %131 = comb.icmp ne %39, %c3_i3 : i3
        %132 = comb.and %arg15, %21, %36, %csaat_q, %12 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg8, %csnidle_q : i4
        %137 = comb.mux %132, %arg9, %csnlead_q : i4
        %138 = comb.mux %132, %arg10, %csntrail_q : i4
        %139 = comb.mux %132, %arg7, %clkdiv_q : i16
        %140 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %141 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %142 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %143 = comb.mux %1, %139, %2 : i16
        %144 = comb.mux %132, %arg7, %143 : i16
        %145 = comb.mux %0, %clk_cntr_q, %144 : i16
        %146 = comb.mux %arg18, %c0_i16, %145 : i16
        %147 = comb.xor %135, %true : i1
        %148 = comb.mux %147, %55, %61 : i1
        %149 = comb.and %147, %57 : i1
        %150 = comb.mux %147, %56, %62 : i1
        %151 = comb.mux %147, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %152 = comb.xor %141, %true : i1
        %153 = comb.xor %140, %true : i1
        %154 = comb.and %152, %153 : i1
        %155 = comb.icmp eq %arg2, %c0_i2 : i2
        %156 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %157 = comb.mux %132, %155, %156 : i1
        %158 = comb.icmp eq %arg2, %c1_i2 : i2
        %159 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %160 = comb.mux %132, %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c-2_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %163 = comb.mux %132, %161, %162 : i1
        %164 = comb.mux %163, %c-4_i3, %c1_i3 : i3
        %165 = comb.xor %154, %true : i1
        %166 = comb.xor %157, %true : i1
        %167 = comb.and %166, %165, %160 : i1
        %168 = comb.mux %167, %c2_i3, %164 : i3
        %169 = comb.mux %167, %c-2_i3, %164 : i3
        %170 = comb.and %165, %157 : i1
        %171 = comb.mux %170, %c1_i3, %168 : i3
        %172 = comb.mux %170, %c-1_i3, %169 : i3
        %173 = comb.mux %154, %c0_i3, %171 : i3
        %174 = comb.mux %154, %c0_i3, %172 : i3
        %175 = comb.sub %bit_cntr_q, %173 : i3
        %176 = comb.mux %150, %175, %bit_cntr_q : i3
        %177 = comb.mux %148, %174, %176 : i3
        %178 = comb.mux %19, %bit_cntr_q, %177 : i3
        %179 = comb.mux %arg18, %c0_i3, %178 : i3
        %180 = comb.mux %132, %arg5, %63 : i20
        %181 = comb.mux %19, %byte_cntr_cpha0_q, %180 : i20
        %182 = comb.mux %arg18, %c0_i20, %181 : i20
        %183 = comb.mux %132, %arg5, %byte_cntr_cpha1_q : i20
        %184 = comb.mux %arg18, %c0_i20, %183 : i20
        %185 = comb.mux %101, %136, %c0_i4 : i4
        %186 = comb.mux %102, %138, %185 : i4
        %187 = comb.mux %103, %137, %186 : i4
        %188 = comb.mux %27, %187, %wait_cntr_q : i4
        %189 = comb.mux %arg18, %c0_i4, %188 : i4
        %190 = comb.mux %105, %26, %189 : i4
        %191 = comb.mux %134, %131, %60 : i1
        %192 = comb.xor %149, %true : i1
        %193 = comb.and %192, %cmd_wr_en_last_bit : i1
        %194 = comb.or %29, %193 : i1
        %195 = comb.icmp eq %arg2, %c0_i2 : i2
        %196 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %197 = comb.mux %132, %195, %196 : i1
        %198 = comb.and %141, %140 : i1
        %199 = comb.xor %198, %true : i1
        %200 = comb.or %197, %199 : i1
        verif.assert %200 : i1
        %201 = comb.icmp ne %142, %c-1_i2 : i2
        verif.assert %201 : i1
        %202 = comb.xor %133, %true : i1
        verif.assert %202 : i1
        fsm.update %cmd_wr_en_last_bit, %194 : i1
        %203 = comb.and %148, %140, %3 : i1
        %204 = comb.and %149, %151, %4 : i1
        %205 = comb.or %204, %203 : i1
        %206 = comb.xor %205, %true : i1
        %207 = comb.and %150, %206 : i1
        %208 = comb.and %132, %206 : i1
        %209 = comb.mux %208, %arg14, %csid_q : i1
        %210 = comb.mux %208, %arg13, %cpol_q : i1
        %211 = comb.mux %208, %arg12, %cpha_q : i1
        %212 = comb.mux %208, %arg11, %full_cyc_q : i1
        %213 = comb.mux %208, %arg8, %csnidle_q : i4
        %214 = comb.mux %208, %arg9, %csnlead_q : i4
        %215 = comb.mux %208, %arg10, %csntrail_q : i4
        %216 = comb.mux %208, %arg7, %clkdiv_q : i16
        %217 = comb.mux %208, %arg6, %csaat_q : i1
        %218 = comb.mux %208, %arg3, %cmd_wr_en_q : i1
        %219 = comb.mux %208, %arg4, %cmd_rd_en_q : i1
        %220 = comb.mux %208, %arg2, %cmd_speed_q : i2
        %221 = comb.mux %208, %arg5, %cmd_len_q : i20
        %222 = comb.mux %205, %clk_cntr_q, %146 : i16
        %223 = comb.and %40, %206 : i1
        %224 = comb.mux bin %223, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %225 = comb.mux %205, %bit_cntr_q, %179 : i3
        %226 = comb.mux %205, %byte_cntr_cpha0_q, %182 : i20
        %227 = comb.mux %205, %byte_cntr_cpha1_q, %184 : i20
        %228 = comb.mux %205, %wait_cntr_q, %190 : i4
        %229 = comb.or %148, %207 : i1
        %230 = comb.and %5, %206 : i1
        %231 = comb.mux %230, %229, %sample_en_q : i1
        %232 = comb.mux %230, %sample_en_q, %sample_en_q2 : i1
        %233 = comb.mux bin %205, %u_sck_flop2Fq_o, %191 : i1
        %234 = comb.mux %206, %130, %csb_q : i1
        %235 = comb.or %133, %234 : i1
        fsm.update %csb_q, %235 : i1
        fsm.update %u_sck_flop2Fq_o, %233 : i1
        fsm.update %sample_en_q2, %232 : i1
        fsm.update %sample_en_q, %231 : i1
        fsm.update %wait_cntr_q, %228 : i4
        fsm.update %byte_cntr_cpha1_q, %227 : i20
        fsm.update %byte_cntr_cpha0_q, %226 : i20
        fsm.update %bit_cntr_q, %225 : i3
        fsm.update %segment_rd_en_cpha1, %224 : i1
        fsm.update %clk_cntr_q, %222 : i16
        fsm.update %cmd_len_q, %221 : i20
        fsm.update %cmd_speed_q, %220 : i2
        fsm.update %cmd_wr_en_q, %218 : i1
        fsm.update %cmd_rd_en_q, %219 : i1
        fsm.update %csaat_q, %217 : i1
        fsm.update %clkdiv_q, %216 : i16
        fsm.update %csntrail_q, %215 : i4
        fsm.update %csnlead_q, %214 : i4
        fsm.update %csnidle_q, %213 : i4
        fsm.update %full_cyc_q, %212 : i1
        fsm.update %cpha_q, %211 : i1
        fsm.update %cpol_q, %210 : i1
        fsm.update %csid_q, %209 : i1
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
      %c-1_i2 = hw.constant -1 : i2
      %c-1_i20 = hw.constant -1 : i20
      %true = hw.constant true
      %true_0 = hw.constant true
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
      %43 = comb.xor %21, %true : i1
      %44 = comb.icmp ne %23, %c0_i20 : i20
      %45 = comb.or %43, %44, %12 : i1
      %46 = comb.xor %45, %true : i1
      %47 = comb.and %46, %16 : i1
      %48 = comb.mux %47, %17, %14 : i3
      %49 = comb.and %16, %45 : i1
      %50 = comb.mux %49, %c3_i3, %48 : i3
      %51 = comb.xor %49, %true : i1
      %52 = comb.mux %arg18, %c0_i3, %50 : i3
      %53 = comb.mux %19, %c2_i3, %52 : i3
      %54 = comb.and %20, %51, %47, %csaat_q, %10 : i1
      %55 = comb.icmp ne %53, %c2_i3 : i3
      %56 = comb.and %15, %55 : i1
      %true_1 = hw.constant true
      %57 = comb.xor %47, %true_1 : i1
      %true_2 = hw.constant true
      %58 = comb.xor %49, %true_2 : i1
      %true_3 = hw.constant true
      %59 = comb.xor %arg18, %true_3 : i1
      %true_4 = hw.constant true
      %60 = comb.xor %19, %true_4 : i1
      %61 = comb.and %60, %59, %58, %57, %11 : i1
      %true_5 = hw.constant true
      %62 = comb.xor %cpha_q, %true_5 : i1
      %true_6 = hw.constant true
      %63 = comb.xor %49, %true_6 : i1
      %true_7 = hw.constant true
      %64 = comb.xor %arg18, %true_7 : i1
      %65 = comb.and %64, %63, %47, %csaat_q, %8, %62 : i1
      %66 = comb.or %19, %65 : i1
      %67 = comb.and %66, %21 : i1
      %68 = comb.or %61, %67 : i1
      %69 = comb.and %56, %68 : i1
      %70 = comb.and %56, %66, %22 : i1
      %71 = comb.and %47, %csaat_q, %8, %cpha_q : i1
      %72 = comb.or %49, %71 : i1
      %true_8 = hw.constant true
      %73 = comb.xor %arg18, %true_8 : i1
      %true_9 = hw.constant true
      %74 = comb.xor %19, %true_9 : i1
      %75 = comb.and %74, %73, %72 : i1
      %76 = comb.and %56, %75, %21 : i1
      %77 = comb.and %56, %75, %22 : i1
      %78 = comb.and %56, %21 : i1
      %79 = comb.and %arg15, %54 : i1
      %80 = comb.mux %79, %arg14, %csid_q : i1
      %81 = comb.mux %79, %arg12, %cpha_q : i1
      %82 = comb.mux %79, %arg11, %full_cyc_q : i1
      %83 = comb.mux %79, %arg3, %cmd_wr_en_q : i1
      %84 = comb.mux %79, %arg4, %cmd_rd_en_q : i1
      %85 = comb.mux %79, %arg2, %cmd_speed_q : i2
      %86 = comb.xor %81, %true : i1
      %87 = comb.mux %86, %69, %76 : i1
      %88 = comb.mux %86, %70, %77 : i1
      %89 = comb.mux %86, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
      %90 = comb.and %87, %83 : i1
      %91 = comb.and %81, %78, %89 : i1
      %92 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %93 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %94 = comb.mux %86, %92, %93 : i1
      %95 = comb.mux %82, %sample_en_q2, %sample_en_q : i1
      %96 = comb.icmp eq %arg2, %c0_i2 : i2
      %97 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %98 = comb.mux %79, %96, %97 : i1
      %99 = comb.and %84, %83 : i1
      %100 = comb.xor %99, %true : i1
      %101 = comb.or %98, %100 : i1
      verif.assert %101 : i1
      %102 = comb.icmp ne %85, %c-1_i2 : i2
      verif.assert %102 : i1
      %103 = comb.xor %80, %true : i1
      verif.assert %103 : i1
      %104 = comb.and %90, %1 : i1
      %105 = comb.and %91, %2 : i1
      %106 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %107 = comb.icmp eq %arg5, %c0_i20 : i20
      %108 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %109 = comb.mux %79, %107, %108 : i1
      %110 = comb.mux %18, %106, %109 : i1
      %111 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %112 = comb.icmp eq %arg5, %c0_i20 : i20
      %113 = comb.icmp eq %24, %c0_i20 : i20
      %114 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %115 = comb.mux %78, %113, %114 : i1
      %116 = comb.mux %79, %112, %115 : i1
      %117 = comb.mux %18, %111, %116 : i1
      %118 = comb.mux %86, %110, %117 : i1
      %119 = comb.or %arg18, %118 : i1
      %120 = comb.or %105, %104 : i1
      %121 = comb.xor %120, %true : i1
      %122 = comb.and %90, %121 : i1
      %123 = comb.and %91, %121 : i1
      %124 = comb.and %95, %121 : i1
      %125 = comb.and %88, %121 : i1
      %126 = comb.and %54, %121 : i1
      %127 = comb.and %94, %123, %arg17 : i1
      %128 = comb.and %119, %122, %arg16 : i1
      fsm.output %126, %u_sck_flop2Fq_o, %csb_q, %42, %127, %128, %122, %123, %124, %125, %cmd_speed_q, %82, %105, %104, %true_0 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_7 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %18 = comb.and %arg1, %0 : i1
        %19 = comb.xor %16, %true : i1
        %20 = comb.icmp ne %17, %c0_i20 : i20
        %21 = comb.or %19, %20, %11 : i1
        %22 = comb.and %18, %14 : i1
        %23 = comb.xor %21, %true : i1
        %24 = comb.and %23, %22 : i1
        %25 = comb.mux %24, %15, %13 : i3
        %26 = comb.and %22, %21 : i1
        %27 = comb.mux %26, %c3_i3, %25 : i3
        %28 = comb.xor %26, %true : i1
        %29 = comb.mux %arg18, %c0_i3, %27 : i3
        %30 = comb.xor %18, %true : i1
        %31 = comb.and %14, %30 : i1
        %32 = comb.mux %31, %c2_i3, %29 : i3
        %33 = comb.xor %31, %true : i1
        %34 = comb.icmp ne %32, %c2_i3 : i3
        %35 = comb.and %14, %34 : i1
        %true_0 = hw.constant true
        %36 = comb.xor %24, %true_0 : i1
        %true_1 = hw.constant true
        %37 = comb.xor %26, %true_1 : i1
        %true_2 = hw.constant true
        %38 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %39 = comb.xor %31, %true_3 : i1
        %40 = comb.and %39, %38, %37, %36, %10 : i1
        %true_4 = hw.constant true
        %41 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %26, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %arg18, %true_6 : i1
        %44 = comb.and %43, %42, %24, %csaat_q, %7, %41 : i1
        %45 = comb.or %31, %44 : i1
        %46 = comb.and %45, %16 : i1
        %47 = comb.or %40, %46 : i1
        %48 = comb.and %35, %47 : i1
        %49 = comb.and %24, %csaat_q, %7, %cpha_q : i1
        %50 = comb.or %26, %49 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %31, %true_8 : i1
        %53 = comb.and %35, %52, %51, %50, %16 : i1
        %54 = comb.and %arg15, %33, %28, %24, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg14, %csid_q : i1
        %56 = comb.mux %54, %arg12, %cpha_q : i1
        %57 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %58 = comb.mux %54, %arg4, %cmd_rd_en_q : i1
        %59 = comb.mux %54, %arg2, %cmd_speed_q : i2
        %60 = comb.xor %56, %true : i1
        %61 = comb.mux %60, %48, %53 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.icmp eq %arg2, %c0_i2 : i2
        %64 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %65 = comb.mux %54, %63, %64 : i1
        %66 = comb.and %58, %57 : i1
        %67 = comb.xor %66, %true : i1
        %68 = comb.or %65, %67 : i1
        verif.assert %68 : i1
        %69 = comb.icmp ne %59, %c-1_i2 : i2
        verif.assert %69 : i1
        %70 = comb.xor %55, %true : i1
        verif.assert %70 : i1
        %71 = comb.and %61, %57, %1 : i1
        %72 = comb.and %56, %35, %16, %62, %2 : i1
        %73 = comb.or %72, %71 : i1
        %74 = comb.or %73, %31 : i1
        %75 = comb.extract %5 from 0 : (i3) -> i2
        %c-1_i2_9 = hw.constant -1 : i2
        %76 = comb.icmp eq %75, %c-1_i2_9 : i2
        %true_10 = hw.constant true
        %77 = comb.xor %7, %true_10 : i1
        %true_11 = hw.constant true
        %78 = comb.xor %26, %true_11 : i1
        %true_12 = hw.constant true
        %79 = comb.xor %arg18, %true_12 : i1
        %true_13 = hw.constant true
        %80 = comb.xor %74, %true_13 : i1
        %81 = comb.and %80, %79, %78, %24, %csaat_q, %77, %76 : i1
        fsm.return %81
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %c2_i3_0 = hw.constant 2 : i3
        %23 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %24 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %25 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %26 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %27 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %28 = comb.or %arg18, %5 : i1
        %29 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %30 = comb.and %cmd_wr_en_q, %23 : i1
        %31 = comb.xor %23, %true : i1
        %32 = comb.icmp ne %25, %c0_i20 : i20
        %33 = comb.or %31, %32, %14 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %34, %18 : i1
        %36 = comb.mux %35, %19, %16 : i3
        %37 = comb.and %18, %33 : i1
        %38 = comb.mux %37, %c3_i3, %36 : i3
        %39 = comb.xor %37, %true : i1
        %40 = comb.mux %arg18, %c0_i3, %38 : i3
        %41 = comb.mux %21, %c2_i3_0, %40 : i3
        %42 = comb.icmp ne %41, %c2_i3_0 : i3
        %43 = comb.and %17, %42 : i1
        %true_1 = hw.constant true
        %44 = comb.xor %35, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %37, %true_2 : i1
        %true_3 = hw.constant true
        %46 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %21, %true_4 : i1
        %48 = comb.and %47, %46, %45, %44, %13 : i1
        %true_5 = hw.constant true
        %49 = comb.xor %cpha_q, %true_5 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %37, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %52 = comb.and %51, %50, %35, %csaat_q, %10, %49 : i1
        %53 = comb.or %21, %52 : i1
        %54 = comb.and %53, %23 : i1
        %55 = comb.or %48, %54 : i1
        %56 = comb.and %43, %55 : i1
        %57 = comb.and %43, %53, %24 : i1
        %58 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %59 = comb.or %37, %58 : i1
        %true_8 = hw.constant true
        %60 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %61 = comb.xor %21, %true_9 : i1
        %62 = comb.and %61, %60, %59 : i1
        %63 = comb.and %43, %62, %23 : i1
        %64 = comb.and %43, %62, %24 : i1
        %65 = comb.and %43, %23 : i1
        %66 = comb.mux %65, %26, %byte_cntr_cpha1_q : i20
        %true_10 = hw.constant true
        %67 = comb.xor %35, %true_10 : i1
        %true_11 = hw.constant true
        %68 = comb.xor %37, %true_11 : i1
        %true_12 = hw.constant true
        %69 = comb.xor %arg18, %true_12 : i1
        %true_13 = hw.constant true
        %70 = comb.xor %21, %true_13 : i1
        %71 = comb.and %70, %69, %68, %67, %13 : i1
        %72 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_14 = hw.constant 0 : i2
        %73 = comb.icmp eq %72, %c0_i2_14 : i2
        %true_15 = hw.constant true
        %74 = comb.xor %10, %true_15 : i1
        %75 = comb.and %74, %73 : i1
        %76 = comb.or %15, %75 : i1
        %true_16 = hw.constant true
        %77 = comb.xor %37, %true_16 : i1
        %true_17 = hw.constant true
        %78 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %79 = comb.xor %21, %true_18 : i1
        %80 = comb.and %79, %78, %77, %35, %76 : i1
        %81 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_19 = hw.constant 1 : i2
        %82 = comb.icmp eq %81, %c1_i2_19 : i2
        %true_20 = hw.constant true
        %83 = comb.xor %10, %true_20 : i1
        %true_21 = hw.constant true
        %84 = comb.xor %37, %true_21 : i1
        %true_22 = hw.constant true
        %85 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %86 = comb.xor %21, %true_23 : i1
        %87 = comb.and %86, %85, %84, %35, %csaat_q, %83, %82 : i1
        %88 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_24 = hw.constant -2 : i2
        %89 = comb.icmp eq %88, %c-2_i2_24 : i2
        %true_25 = hw.constant true
        %90 = comb.xor %10, %true_25 : i1
        %91 = comb.and %csaat_q, %90, %89 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %13, %true_26 : i1
        %93 = comb.mux %35, %91, %92 : i1
        %true_27 = hw.constant true
        %94 = comb.xor %37, %true_27 : i1
        %true_28 = hw.constant true
        %95 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %96 = comb.xor %21, %true_29 : i1
        %97 = comb.and %42, %18 : i1
        %98 = comb.xor %71, %true : i1
        %99 = comb.and %98, %97 : i1
        %100 = comb.xor %80, %true : i1
        %101 = comb.and %100, %99 : i1
        %102 = comb.xor %87, %true : i1
        %103 = comb.and %102, %101, %96, %95, %94, %93 : i1
        %104 = comb.and %101, %87 : i1
        %105 = comb.or %104, %103 : i1
        %106 = comb.and %99, %80 : i1
        %107 = comb.and %97, %71 : i1
        %108 = comb.xor %42, %true : i1
        %109 = comb.and %29, %108, %18 : i1
        %true_30 = hw.constant true
        %110 = comb.xor %cpha_q, %true_30 : i1
        %true_31 = hw.constant true
        %111 = comb.xor %37, %true_31 : i1
        %true_32 = hw.constant true
        %112 = comb.xor %arg18, %true_32 : i1
        %113 = comb.and %112, %111, %35, %csaat_q, %10, %110 : i1
        %114 = comb.or %21, %113 : i1
        %115 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %116 = comb.or %37, %115 : i1
        %true_33 = hw.constant true
        %117 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %118 = comb.xor %21, %true_34 : i1
        %119 = comb.and %118, %117, %116 : i1
        %120 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_35 = hw.constant -1 : i2
        %121 = comb.icmp eq %120, %c-1_i2_35 : i2
        %true_36 = hw.constant true
        %122 = comb.xor %10, %true_36 : i1
        %true_37 = hw.constant true
        %123 = comb.xor %37, %true_37 : i1
        %true_38 = hw.constant true
        %124 = comb.xor %arg18, %true_38 : i1
        %true_39 = hw.constant true
        %125 = comb.xor %21, %true_39 : i1
        %126 = comb.icmp ne %41, %c-4_i3 : i3
        %127 = comb.xor %114, %true : i1
        %128 = comb.and %127, %98 : i1
        %129 = comb.xor %119, %true : i1
        %130 = comb.and %129, %128, %125, %124, %123, %35, %csaat_q, %122, %121 : i1
        %131 = comb.xor %130, %true : i1
        %132 = comb.and %128, %119 : i1
        %133 = comb.xor %132, %true : i1
        %134 = comb.and %98, %114 : i1
        %135 = comb.xor %134, %true : i1
        %136 = comb.and %98, %135, %133, %131, %126 : i1
        %137 = comb.icmp ne %41, %c3_i3 : i3
        %138 = comb.and %arg15, %22, %39, %35, %csaat_q, %12 : i1
        %139 = comb.mux %138, %arg14, %csid_q : i1
        %140 = comb.mux %138, %arg13, %cpol_q : i1
        %141 = comb.mux %138, %arg12, %cpha_q : i1
        %142 = comb.mux %138, %arg8, %csnidle_q : i4
        %143 = comb.mux %138, %arg9, %csnlead_q : i4
        %144 = comb.mux %138, %arg10, %csntrail_q : i4
        %145 = comb.mux %138, %arg7, %clkdiv_q : i16
        %146 = comb.mux %138, %arg3, %cmd_wr_en_q : i1
        %147 = comb.mux %138, %arg4, %cmd_rd_en_q : i1
        %148 = comb.mux %138, %arg2, %cmd_speed_q : i2
        %149 = comb.mux %1, %145, %2 : i16
        %150 = comb.mux %138, %arg7, %149 : i16
        %151 = comb.mux %0, %clk_cntr_q, %150 : i16
        %152 = comb.mux %arg18, %c0_i16, %151 : i16
        %153 = comb.xor %141, %true : i1
        %154 = comb.mux %153, %56, %63 : i1
        %155 = comb.and %141, %65 : i1
        %156 = comb.mux %153, %57, %64 : i1
        %157 = comb.mux %153, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %158 = comb.xor %147, %true : i1
        %159 = comb.xor %146, %true : i1
        %160 = comb.and %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c0_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %163 = comb.mux %138, %161, %162 : i1
        %164 = comb.icmp eq %arg2, %c1_i2 : i2
        %165 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %166 = comb.mux %138, %164, %165 : i1
        %167 = comb.icmp eq %arg2, %c-2_i2 : i2
        %168 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %169 = comb.mux %138, %167, %168 : i1
        %170 = comb.mux %169, %c-4_i3, %c1_i3 : i3
        %171 = comb.xor %160, %true : i1
        %172 = comb.xor %163, %true : i1
        %173 = comb.and %172, %171, %166 : i1
        %174 = comb.mux %173, %c2_i3, %170 : i3
        %175 = comb.mux %173, %c-2_i3, %170 : i3
        %176 = comb.and %171, %163 : i1
        %177 = comb.mux %176, %c1_i3, %174 : i3
        %178 = comb.mux %176, %c-1_i3, %175 : i3
        %179 = comb.mux %160, %c0_i3, %177 : i3
        %180 = comb.mux %160, %c0_i3, %178 : i3
        %181 = comb.sub %bit_cntr_q, %179 : i3
        %182 = comb.mux %156, %181, %bit_cntr_q : i3
        %183 = comb.mux %154, %180, %182 : i3
        %184 = comb.mux %20, %bit_cntr_q, %183 : i3
        %185 = comb.mux %arg18, %c0_i3, %184 : i3
        %186 = comb.mux %138, %arg5, %byte_cntr_cpha0_q : i20
        %187 = comb.mux %arg18, %c0_i20, %186 : i20
        %188 = comb.mux %138, %arg5, %66 : i20
        %189 = comb.mux %20, %byte_cntr_cpha1_q, %188 : i20
        %190 = comb.mux %arg18, %c0_i20, %189 : i20
        %191 = comb.mux %105, %142, %c0_i4 : i4
        %192 = comb.mux %106, %144, %191 : i4
        %193 = comb.mux %107, %143, %192 : i4
        %194 = comb.mux %28, %193, %wait_cntr_q : i4
        %195 = comb.mux %arg18, %c0_i4, %194 : i4
        %196 = comb.mux %109, %27, %195 : i4
        %197 = comb.mux %140, %137, %62 : i1
        %198 = comb.xor %155, %true : i1
        %199 = comb.and %198, %cmd_wr_en_last_bit : i1
        %200 = comb.or %30, %199 : i1
        %201 = comb.icmp eq %arg2, %c0_i2 : i2
        %202 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %203 = comb.mux %138, %201, %202 : i1
        %204 = comb.and %147, %146 : i1
        %205 = comb.xor %204, %true : i1
        %206 = comb.or %203, %205 : i1
        verif.assert %206 : i1
        %207 = comb.icmp ne %148, %c-1_i2 : i2
        verif.assert %207 : i1
        %208 = comb.xor %139, %true : i1
        verif.assert %208 : i1
        fsm.update %cmd_wr_en_last_bit, %200 : i1
        %209 = comb.and %154, %146, %3 : i1
        %210 = comb.and %155, %157, %4 : i1
        %211 = comb.or %210, %209 : i1
        %212 = comb.xor %211, %true : i1
        %213 = comb.and %156, %212 : i1
        %214 = comb.and %138, %212 : i1
        %215 = comb.mux %214, %arg14, %csid_q : i1
        %216 = comb.mux %214, %arg13, %cpol_q : i1
        %217 = comb.mux %214, %arg12, %cpha_q : i1
        %218 = comb.mux %214, %arg11, %full_cyc_q : i1
        %219 = comb.mux %214, %arg8, %csnidle_q : i4
        %220 = comb.mux %214, %arg9, %csnlead_q : i4
        %221 = comb.mux %214, %arg10, %csntrail_q : i4
        %222 = comb.mux %214, %arg7, %clkdiv_q : i16
        %223 = comb.mux %214, %arg6, %csaat_q : i1
        %224 = comb.mux %214, %arg3, %cmd_wr_en_q : i1
        %225 = comb.mux %214, %arg4, %cmd_rd_en_q : i1
        %226 = comb.mux %214, %arg2, %cmd_speed_q : i2
        %227 = comb.mux %214, %arg5, %cmd_len_q : i20
        %228 = comb.mux %211, %clk_cntr_q, %152 : i16
        %229 = comb.and %42, %212 : i1
        %230 = comb.mux bin %229, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %231 = comb.mux %211, %bit_cntr_q, %185 : i3
        %232 = comb.mux %211, %byte_cntr_cpha0_q, %187 : i20
        %233 = comb.mux %211, %byte_cntr_cpha1_q, %190 : i20
        %234 = comb.mux %211, %wait_cntr_q, %196 : i4
        %235 = comb.or %154, %213 : i1
        %236 = comb.and %5, %212 : i1
        %237 = comb.mux %236, %235, %sample_en_q : i1
        %238 = comb.mux %236, %sample_en_q, %sample_en_q2 : i1
        %239 = comb.mux bin %211, %u_sck_flop2Fq_o, %197 : i1
        %240 = comb.mux %212, %136, %csb_q : i1
        %241 = comb.or %139, %240 : i1
        fsm.update %csb_q, %241 : i1
        fsm.update %u_sck_flop2Fq_o, %239 : i1
        fsm.update %sample_en_q2, %238 : i1
        fsm.update %sample_en_q, %237 : i1
        fsm.update %wait_cntr_q, %234 : i4
        fsm.update %byte_cntr_cpha1_q, %233 : i20
        fsm.update %byte_cntr_cpha0_q, %232 : i20
        fsm.update %bit_cntr_q, %231 : i3
        fsm.update %segment_rd_en_cpha1, %230 : i1
        fsm.update %clk_cntr_q, %228 : i16
        fsm.update %cmd_len_q, %227 : i20
        fsm.update %cmd_speed_q, %226 : i2
        fsm.update %cmd_wr_en_q, %224 : i1
        fsm.update %cmd_rd_en_q, %225 : i1
        fsm.update %csaat_q, %223 : i1
        fsm.update %clkdiv_q, %222 : i16
        fsm.update %csntrail_q, %221 : i4
        fsm.update %csnlead_q, %220 : i4
        fsm.update %csnidle_q, %219 : i4
        fsm.update %full_cyc_q, %218 : i1
        fsm.update %cpha_q, %217 : i1
        fsm.update %cpol_q, %216 : i1
        fsm.update %csid_q, %215 : i1
      }
      fsm.transition @state_6 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %18 = comb.and %arg1, %0 : i1
        %19 = comb.xor %16, %true : i1
        %20 = comb.icmp ne %17, %c0_i20 : i20
        %21 = comb.or %19, %20, %11 : i1
        %22 = comb.and %18, %14 : i1
        %23 = comb.xor %21, %true : i1
        %24 = comb.and %23, %22 : i1
        %25 = comb.mux %24, %15, %13 : i3
        %26 = comb.and %22, %21 : i1
        %27 = comb.mux %26, %c3_i3, %25 : i3
        %28 = comb.xor %26, %true : i1
        %29 = comb.mux %arg18, %c0_i3, %27 : i3
        %30 = comb.xor %18, %true : i1
        %31 = comb.and %14, %30 : i1
        %32 = comb.mux %31, %c2_i3, %29 : i3
        %33 = comb.xor %31, %true : i1
        %34 = comb.icmp ne %32, %c2_i3 : i3
        %35 = comb.and %14, %34 : i1
        %true_0 = hw.constant true
        %36 = comb.xor %24, %true_0 : i1
        %true_1 = hw.constant true
        %37 = comb.xor %26, %true_1 : i1
        %true_2 = hw.constant true
        %38 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %39 = comb.xor %31, %true_3 : i1
        %40 = comb.and %39, %38, %37, %36, %10 : i1
        %true_4 = hw.constant true
        %41 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %26, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %arg18, %true_6 : i1
        %44 = comb.and %43, %42, %24, %csaat_q, %7, %41 : i1
        %45 = comb.or %31, %44 : i1
        %46 = comb.and %45, %16 : i1
        %47 = comb.or %40, %46 : i1
        %48 = comb.and %35, %47 : i1
        %49 = comb.and %24, %csaat_q, %7, %cpha_q : i1
        %50 = comb.or %26, %49 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %31, %true_8 : i1
        %53 = comb.and %35, %52, %51, %50, %16 : i1
        %54 = comb.and %arg15, %33, %28, %24, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg14, %csid_q : i1
        %56 = comb.mux %54, %arg12, %cpha_q : i1
        %57 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %58 = comb.mux %54, %arg4, %cmd_rd_en_q : i1
        %59 = comb.mux %54, %arg2, %cmd_speed_q : i2
        %60 = comb.xor %56, %true : i1
        %61 = comb.mux %60, %48, %53 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.icmp eq %arg2, %c0_i2 : i2
        %64 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %65 = comb.mux %54, %63, %64 : i1
        %66 = comb.and %58, %57 : i1
        %67 = comb.xor %66, %true : i1
        %68 = comb.or %65, %67 : i1
        verif.assert %68 : i1
        %69 = comb.icmp ne %59, %c-1_i2 : i2
        verif.assert %69 : i1
        %70 = comb.xor %55, %true : i1
        verif.assert %70 : i1
        %71 = comb.and %61, %57, %1 : i1
        %72 = comb.and %56, %35, %16, %62, %2 : i1
        %73 = comb.or %72, %71, %31 : i1
        %74 = comb.extract %5 from 0 : (i3) -> i2
        %c-2_i2 = hw.constant -2 : i2
        %75 = comb.icmp eq %74, %c-2_i2 : i2
        %true_9 = hw.constant true
        %76 = comb.xor %7, %true_9 : i1
        %77 = comb.and %csaat_q, %76, %75 : i1
        %true_10 = hw.constant true
        %78 = comb.xor %10, %true_10 : i1
        %79 = comb.mux %24, %77, %78 : i1
        %true_11 = hw.constant true
        %80 = comb.xor %26, %true_11 : i1
        %true_12 = hw.constant true
        %81 = comb.xor %arg18, %true_12 : i1
        %true_13 = hw.constant true
        %82 = comb.xor %73, %true_13 : i1
        %83 = comb.and %82, %81, %80, %79 : i1
        fsm.return %83
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %c2_i3_0 = hw.constant 2 : i3
        %23 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %24 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %25 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %26 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %27 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %28 = comb.or %arg18, %5 : i1
        %29 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %30 = comb.and %cmd_wr_en_q, %23 : i1
        %31 = comb.xor %23, %true : i1
        %32 = comb.icmp ne %25, %c0_i20 : i20
        %33 = comb.or %31, %32, %14 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %34, %18 : i1
        %36 = comb.mux %35, %19, %16 : i3
        %37 = comb.and %18, %33 : i1
        %38 = comb.mux %37, %c3_i3, %36 : i3
        %39 = comb.xor %37, %true : i1
        %40 = comb.mux %arg18, %c0_i3, %38 : i3
        %41 = comb.mux %21, %c2_i3_0, %40 : i3
        %42 = comb.icmp ne %41, %c2_i3_0 : i3
        %43 = comb.and %17, %42 : i1
        %true_1 = hw.constant true
        %44 = comb.xor %35, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %37, %true_2 : i1
        %true_3 = hw.constant true
        %46 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %21, %true_4 : i1
        %48 = comb.and %47, %46, %45, %44, %13 : i1
        %true_5 = hw.constant true
        %49 = comb.xor %cpha_q, %true_5 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %37, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %52 = comb.and %51, %50, %35, %csaat_q, %10, %49 : i1
        %53 = comb.or %21, %52 : i1
        %54 = comb.and %53, %23 : i1
        %55 = comb.or %48, %54 : i1
        %56 = comb.and %43, %55 : i1
        %57 = comb.and %43, %53, %24 : i1
        %58 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %59 = comb.or %37, %58 : i1
        %true_8 = hw.constant true
        %60 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %61 = comb.xor %21, %true_9 : i1
        %62 = comb.and %61, %60, %59 : i1
        %63 = comb.and %43, %62, %23 : i1
        %64 = comb.and %43, %62, %24 : i1
        %65 = comb.and %43, %23 : i1
        %66 = comb.mux %65, %26, %byte_cntr_cpha1_q : i20
        %true_10 = hw.constant true
        %67 = comb.xor %35, %true_10 : i1
        %true_11 = hw.constant true
        %68 = comb.xor %37, %true_11 : i1
        %true_12 = hw.constant true
        %69 = comb.xor %arg18, %true_12 : i1
        %true_13 = hw.constant true
        %70 = comb.xor %21, %true_13 : i1
        %71 = comb.and %70, %69, %68, %67, %13 : i1
        %72 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_14 = hw.constant 0 : i2
        %73 = comb.icmp eq %72, %c0_i2_14 : i2
        %true_15 = hw.constant true
        %74 = comb.xor %10, %true_15 : i1
        %75 = comb.and %74, %73 : i1
        %76 = comb.or %15, %75 : i1
        %true_16 = hw.constant true
        %77 = comb.xor %37, %true_16 : i1
        %true_17 = hw.constant true
        %78 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %79 = comb.xor %21, %true_18 : i1
        %80 = comb.and %79, %78, %77, %35, %76 : i1
        %81 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_19 = hw.constant 1 : i2
        %82 = comb.icmp eq %81, %c1_i2_19 : i2
        %true_20 = hw.constant true
        %83 = comb.xor %10, %true_20 : i1
        %true_21 = hw.constant true
        %84 = comb.xor %37, %true_21 : i1
        %true_22 = hw.constant true
        %85 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %86 = comb.xor %21, %true_23 : i1
        %87 = comb.and %86, %85, %84, %35, %csaat_q, %83, %82 : i1
        %88 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_24 = hw.constant -2 : i2
        %89 = comb.icmp eq %88, %c-2_i2_24 : i2
        %true_25 = hw.constant true
        %90 = comb.xor %10, %true_25 : i1
        %91 = comb.and %csaat_q, %90, %89 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %13, %true_26 : i1
        %93 = comb.mux %35, %91, %92 : i1
        %true_27 = hw.constant true
        %94 = comb.xor %37, %true_27 : i1
        %true_28 = hw.constant true
        %95 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %96 = comb.xor %21, %true_29 : i1
        %97 = comb.and %42, %18 : i1
        %98 = comb.xor %71, %true : i1
        %99 = comb.and %98, %97 : i1
        %100 = comb.xor %80, %true : i1
        %101 = comb.and %100, %99 : i1
        %102 = comb.xor %87, %true : i1
        %103 = comb.and %102, %101, %96, %95, %94, %93 : i1
        %104 = comb.and %101, %87 : i1
        %105 = comb.or %104, %103 : i1
        %106 = comb.and %99, %80 : i1
        %107 = comb.and %97, %71 : i1
        %108 = comb.xor %42, %true : i1
        %109 = comb.and %29, %108, %18 : i1
        %true_30 = hw.constant true
        %110 = comb.xor %cpha_q, %true_30 : i1
        %true_31 = hw.constant true
        %111 = comb.xor %37, %true_31 : i1
        %true_32 = hw.constant true
        %112 = comb.xor %arg18, %true_32 : i1
        %113 = comb.and %112, %111, %35, %csaat_q, %10, %110 : i1
        %114 = comb.or %21, %113 : i1
        %115 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %116 = comb.or %37, %115 : i1
        %true_33 = hw.constant true
        %117 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %118 = comb.xor %21, %true_34 : i1
        %119 = comb.and %118, %117, %116 : i1
        %120 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_35 = hw.constant -1 : i2
        %121 = comb.icmp eq %120, %c-1_i2_35 : i2
        %true_36 = hw.constant true
        %122 = comb.xor %10, %true_36 : i1
        %true_37 = hw.constant true
        %123 = comb.xor %37, %true_37 : i1
        %true_38 = hw.constant true
        %124 = comb.xor %arg18, %true_38 : i1
        %true_39 = hw.constant true
        %125 = comb.xor %21, %true_39 : i1
        %126 = comb.icmp ne %41, %c-4_i3 : i3
        %127 = comb.xor %114, %true : i1
        %128 = comb.and %127, %98 : i1
        %129 = comb.xor %119, %true : i1
        %130 = comb.and %129, %128, %125, %124, %123, %35, %csaat_q, %122, %121 : i1
        %131 = comb.xor %130, %true : i1
        %132 = comb.and %128, %119 : i1
        %133 = comb.xor %132, %true : i1
        %134 = comb.and %98, %114 : i1
        %135 = comb.xor %134, %true : i1
        %136 = comb.and %98, %135, %133, %131, %126 : i1
        %137 = comb.icmp ne %41, %c3_i3 : i3
        %138 = comb.and %arg15, %22, %39, %35, %csaat_q, %12 : i1
        %139 = comb.mux %138, %arg14, %csid_q : i1
        %140 = comb.mux %138, %arg13, %cpol_q : i1
        %141 = comb.mux %138, %arg12, %cpha_q : i1
        %142 = comb.mux %138, %arg8, %csnidle_q : i4
        %143 = comb.mux %138, %arg9, %csnlead_q : i4
        %144 = comb.mux %138, %arg10, %csntrail_q : i4
        %145 = comb.mux %138, %arg7, %clkdiv_q : i16
        %146 = comb.mux %138, %arg3, %cmd_wr_en_q : i1
        %147 = comb.mux %138, %arg4, %cmd_rd_en_q : i1
        %148 = comb.mux %138, %arg2, %cmd_speed_q : i2
        %149 = comb.mux %1, %145, %2 : i16
        %150 = comb.mux %138, %arg7, %149 : i16
        %151 = comb.mux %0, %clk_cntr_q, %150 : i16
        %152 = comb.mux %arg18, %c0_i16, %151 : i16
        %153 = comb.xor %141, %true : i1
        %154 = comb.mux %153, %56, %63 : i1
        %155 = comb.and %141, %65 : i1
        %156 = comb.mux %153, %57, %64 : i1
        %157 = comb.mux %153, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %158 = comb.xor %147, %true : i1
        %159 = comb.xor %146, %true : i1
        %160 = comb.and %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c0_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %163 = comb.mux %138, %161, %162 : i1
        %164 = comb.icmp eq %arg2, %c1_i2 : i2
        %165 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %166 = comb.mux %138, %164, %165 : i1
        %167 = comb.icmp eq %arg2, %c-2_i2 : i2
        %168 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %169 = comb.mux %138, %167, %168 : i1
        %170 = comb.mux %169, %c-4_i3, %c1_i3 : i3
        %171 = comb.xor %160, %true : i1
        %172 = comb.xor %163, %true : i1
        %173 = comb.and %172, %171, %166 : i1
        %174 = comb.mux %173, %c2_i3, %170 : i3
        %175 = comb.mux %173, %c-2_i3, %170 : i3
        %176 = comb.and %171, %163 : i1
        %177 = comb.mux %176, %c1_i3, %174 : i3
        %178 = comb.mux %176, %c-1_i3, %175 : i3
        %179 = comb.mux %160, %c0_i3, %177 : i3
        %180 = comb.mux %160, %c0_i3, %178 : i3
        %181 = comb.sub %bit_cntr_q, %179 : i3
        %182 = comb.mux %156, %181, %bit_cntr_q : i3
        %183 = comb.mux %154, %180, %182 : i3
        %184 = comb.mux %20, %bit_cntr_q, %183 : i3
        %185 = comb.mux %arg18, %c0_i3, %184 : i3
        %186 = comb.mux %138, %arg5, %byte_cntr_cpha0_q : i20
        %187 = comb.mux %arg18, %c0_i20, %186 : i20
        %188 = comb.mux %138, %arg5, %66 : i20
        %189 = comb.mux %20, %byte_cntr_cpha1_q, %188 : i20
        %190 = comb.mux %arg18, %c0_i20, %189 : i20
        %191 = comb.mux %105, %142, %c0_i4 : i4
        %192 = comb.mux %106, %144, %191 : i4
        %193 = comb.mux %107, %143, %192 : i4
        %194 = comb.mux %28, %193, %wait_cntr_q : i4
        %195 = comb.mux %arg18, %c0_i4, %194 : i4
        %196 = comb.mux %109, %27, %195 : i4
        %197 = comb.mux %140, %137, %62 : i1
        %198 = comb.xor %155, %true : i1
        %199 = comb.and %198, %cmd_wr_en_last_bit : i1
        %200 = comb.or %30, %199 : i1
        %201 = comb.icmp eq %arg2, %c0_i2 : i2
        %202 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %203 = comb.mux %138, %201, %202 : i1
        %204 = comb.and %147, %146 : i1
        %205 = comb.xor %204, %true : i1
        %206 = comb.or %203, %205 : i1
        verif.assert %206 : i1
        %207 = comb.icmp ne %148, %c-1_i2 : i2
        verif.assert %207 : i1
        %208 = comb.xor %139, %true : i1
        verif.assert %208 : i1
        fsm.update %cmd_wr_en_last_bit, %200 : i1
        %209 = comb.and %154, %146, %3 : i1
        %210 = comb.and %155, %157, %4 : i1
        %211 = comb.or %210, %209 : i1
        %212 = comb.xor %211, %true : i1
        %213 = comb.and %156, %212 : i1
        %214 = comb.and %138, %212 : i1
        %215 = comb.mux %214, %arg14, %csid_q : i1
        %216 = comb.mux %214, %arg13, %cpol_q : i1
        %217 = comb.mux %214, %arg12, %cpha_q : i1
        %218 = comb.mux %214, %arg11, %full_cyc_q : i1
        %219 = comb.mux %214, %arg8, %csnidle_q : i4
        %220 = comb.mux %214, %arg9, %csnlead_q : i4
        %221 = comb.mux %214, %arg10, %csntrail_q : i4
        %222 = comb.mux %214, %arg7, %clkdiv_q : i16
        %223 = comb.mux %214, %arg6, %csaat_q : i1
        %224 = comb.mux %214, %arg3, %cmd_wr_en_q : i1
        %225 = comb.mux %214, %arg4, %cmd_rd_en_q : i1
        %226 = comb.mux %214, %arg2, %cmd_speed_q : i2
        %227 = comb.mux %214, %arg5, %cmd_len_q : i20
        %228 = comb.mux %211, %clk_cntr_q, %152 : i16
        %229 = comb.and %42, %212 : i1
        %230 = comb.mux bin %229, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %231 = comb.mux %211, %bit_cntr_q, %185 : i3
        %232 = comb.mux %211, %byte_cntr_cpha0_q, %187 : i20
        %233 = comb.mux %211, %byte_cntr_cpha1_q, %190 : i20
        %234 = comb.mux %211, %wait_cntr_q, %196 : i4
        %235 = comb.or %154, %213 : i1
        %236 = comb.and %5, %212 : i1
        %237 = comb.mux %236, %235, %sample_en_q : i1
        %238 = comb.mux %236, %sample_en_q, %sample_en_q2 : i1
        %239 = comb.mux bin %211, %u_sck_flop2Fq_o, %197 : i1
        %240 = comb.mux %212, %136, %csb_q : i1
        %241 = comb.or %139, %240 : i1
        fsm.update %csb_q, %241 : i1
        fsm.update %u_sck_flop2Fq_o, %239 : i1
        fsm.update %sample_en_q2, %238 : i1
        fsm.update %sample_en_q, %237 : i1
        fsm.update %wait_cntr_q, %234 : i4
        fsm.update %byte_cntr_cpha1_q, %233 : i20
        fsm.update %byte_cntr_cpha0_q, %232 : i20
        fsm.update %bit_cntr_q, %231 : i3
        fsm.update %segment_rd_en_cpha1, %230 : i1
        fsm.update %clk_cntr_q, %228 : i16
        fsm.update %cmd_len_q, %227 : i20
        fsm.update %cmd_speed_q, %226 : i2
        fsm.update %cmd_wr_en_q, %224 : i1
        fsm.update %cmd_rd_en_q, %225 : i1
        fsm.update %csaat_q, %223 : i1
        fsm.update %clkdiv_q, %222 : i16
        fsm.update %csntrail_q, %221 : i4
        fsm.update %csnlead_q, %220 : i4
        fsm.update %csnidle_q, %219 : i4
        fsm.update %full_cyc_q, %218 : i1
        fsm.update %cpha_q, %217 : i1
        fsm.update %cpol_q, %216 : i1
        fsm.update %csid_q, %215 : i1
      }
      fsm.transition @state_3 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %18 = comb.and %arg1, %0 : i1
        %19 = comb.xor %16, %true : i1
        %20 = comb.icmp ne %17, %c0_i20 : i20
        %21 = comb.or %19, %20, %11 : i1
        %22 = comb.and %18, %14 : i1
        %23 = comb.xor %21, %true : i1
        %24 = comb.and %23, %22 : i1
        %25 = comb.mux %24, %15, %13 : i3
        %26 = comb.and %22, %21 : i1
        %27 = comb.mux %26, %c3_i3, %25 : i3
        %28 = comb.xor %26, %true : i1
        %29 = comb.mux %arg18, %c0_i3, %27 : i3
        %30 = comb.xor %18, %true : i1
        %31 = comb.and %14, %30 : i1
        %32 = comb.mux %31, %c2_i3, %29 : i3
        %33 = comb.xor %31, %true : i1
        %34 = comb.icmp ne %32, %c2_i3 : i3
        %35 = comb.and %14, %34 : i1
        %true_0 = hw.constant true
        %36 = comb.xor %24, %true_0 : i1
        %true_1 = hw.constant true
        %37 = comb.xor %26, %true_1 : i1
        %true_2 = hw.constant true
        %38 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %39 = comb.xor %31, %true_3 : i1
        %40 = comb.and %39, %38, %37, %36, %10 : i1
        %true_4 = hw.constant true
        %41 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %26, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %arg18, %true_6 : i1
        %44 = comb.and %43, %42, %24, %csaat_q, %7, %41 : i1
        %45 = comb.or %31, %44 : i1
        %46 = comb.and %45, %16 : i1
        %47 = comb.or %40, %46 : i1
        %48 = comb.and %35, %47 : i1
        %49 = comb.and %24, %csaat_q, %7, %cpha_q : i1
        %50 = comb.or %26, %49 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %31, %true_8 : i1
        %53 = comb.and %35, %52, %51, %50, %16 : i1
        %54 = comb.and %arg15, %33, %28, %24, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg14, %csid_q : i1
        %56 = comb.mux %54, %arg12, %cpha_q : i1
        %57 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %58 = comb.mux %54, %arg4, %cmd_rd_en_q : i1
        %59 = comb.mux %54, %arg2, %cmd_speed_q : i2
        %60 = comb.xor %56, %true : i1
        %61 = comb.mux %60, %48, %53 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.icmp eq %arg2, %c0_i2 : i2
        %64 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %65 = comb.mux %54, %63, %64 : i1
        %66 = comb.and %58, %57 : i1
        %67 = comb.xor %66, %true : i1
        %68 = comb.or %65, %67 : i1
        verif.assert %68 : i1
        %69 = comb.icmp ne %59, %c-1_i2 : i2
        verif.assert %69 : i1
        %70 = comb.xor %55, %true : i1
        verif.assert %70 : i1
        %71 = comb.and %61, %57, %1 : i1
        %72 = comb.and %56, %35, %16, %62, %2 : i1
        %73 = comb.or %72, %71, %31 : i1
        %74 = comb.and %24, %csaat_q, %7, %cpha_q : i1
        %75 = comb.or %26, %74 : i1
        %true_9 = hw.constant true
        %76 = comb.xor %arg18, %true_9 : i1
        %true_10 = hw.constant true
        %77 = comb.xor %73, %true_10 : i1
        %78 = comb.and %77, %76, %75 : i1
        fsm.return %78
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %c2_i3_0 = hw.constant 2 : i3
        %23 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %24 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %25 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %26 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %27 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %28 = comb.or %arg18, %5 : i1
        %29 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %30 = comb.and %cmd_wr_en_q, %23 : i1
        %31 = comb.xor %23, %true : i1
        %32 = comb.icmp ne %25, %c0_i20 : i20
        %33 = comb.or %31, %32, %14 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %34, %18 : i1
        %36 = comb.mux %35, %19, %16 : i3
        %37 = comb.and %18, %33 : i1
        %38 = comb.mux %37, %c3_i3, %36 : i3
        %39 = comb.xor %37, %true : i1
        %40 = comb.mux %arg18, %c0_i3, %38 : i3
        %41 = comb.mux %21, %c2_i3_0, %40 : i3
        %42 = comb.icmp ne %41, %c2_i3_0 : i3
        %43 = comb.and %17, %42 : i1
        %true_1 = hw.constant true
        %44 = comb.xor %35, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %37, %true_2 : i1
        %true_3 = hw.constant true
        %46 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %21, %true_4 : i1
        %48 = comb.and %47, %46, %45, %44, %13 : i1
        %true_5 = hw.constant true
        %49 = comb.xor %cpha_q, %true_5 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %37, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %52 = comb.and %51, %50, %35, %csaat_q, %10, %49 : i1
        %53 = comb.or %21, %52 : i1
        %54 = comb.and %53, %23 : i1
        %55 = comb.or %48, %54 : i1
        %56 = comb.and %43, %55 : i1
        %57 = comb.and %43, %53, %24 : i1
        %58 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %59 = comb.or %37, %58 : i1
        %true_8 = hw.constant true
        %60 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %61 = comb.xor %21, %true_9 : i1
        %62 = comb.and %61, %60, %59 : i1
        %63 = comb.and %43, %62, %23 : i1
        %64 = comb.and %43, %62, %24 : i1
        %65 = comb.and %43, %23 : i1
        %66 = comb.mux %65, %26, %byte_cntr_cpha1_q : i20
        %true_10 = hw.constant true
        %67 = comb.xor %35, %true_10 : i1
        %true_11 = hw.constant true
        %68 = comb.xor %37, %true_11 : i1
        %true_12 = hw.constant true
        %69 = comb.xor %arg18, %true_12 : i1
        %true_13 = hw.constant true
        %70 = comb.xor %21, %true_13 : i1
        %71 = comb.and %70, %69, %68, %67, %13 : i1
        %72 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_14 = hw.constant 0 : i2
        %73 = comb.icmp eq %72, %c0_i2_14 : i2
        %true_15 = hw.constant true
        %74 = comb.xor %10, %true_15 : i1
        %75 = comb.and %74, %73 : i1
        %76 = comb.or %15, %75 : i1
        %true_16 = hw.constant true
        %77 = comb.xor %37, %true_16 : i1
        %true_17 = hw.constant true
        %78 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %79 = comb.xor %21, %true_18 : i1
        %80 = comb.and %79, %78, %77, %35, %76 : i1
        %81 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_19 = hw.constant 1 : i2
        %82 = comb.icmp eq %81, %c1_i2_19 : i2
        %true_20 = hw.constant true
        %83 = comb.xor %10, %true_20 : i1
        %true_21 = hw.constant true
        %84 = comb.xor %37, %true_21 : i1
        %true_22 = hw.constant true
        %85 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %86 = comb.xor %21, %true_23 : i1
        %87 = comb.and %86, %85, %84, %35, %csaat_q, %83, %82 : i1
        %88 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_24 = hw.constant -2 : i2
        %89 = comb.icmp eq %88, %c-2_i2_24 : i2
        %true_25 = hw.constant true
        %90 = comb.xor %10, %true_25 : i1
        %91 = comb.and %csaat_q, %90, %89 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %13, %true_26 : i1
        %93 = comb.mux %35, %91, %92 : i1
        %true_27 = hw.constant true
        %94 = comb.xor %37, %true_27 : i1
        %true_28 = hw.constant true
        %95 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %96 = comb.xor %21, %true_29 : i1
        %97 = comb.and %42, %18 : i1
        %98 = comb.xor %71, %true : i1
        %99 = comb.and %98, %97 : i1
        %100 = comb.xor %80, %true : i1
        %101 = comb.and %100, %99 : i1
        %102 = comb.xor %87, %true : i1
        %103 = comb.and %102, %101, %96, %95, %94, %93 : i1
        %104 = comb.and %101, %87 : i1
        %105 = comb.or %104, %103 : i1
        %106 = comb.and %99, %80 : i1
        %107 = comb.and %97, %71 : i1
        %108 = comb.xor %42, %true : i1
        %109 = comb.and %29, %108, %18 : i1
        %true_30 = hw.constant true
        %110 = comb.xor %cpha_q, %true_30 : i1
        %true_31 = hw.constant true
        %111 = comb.xor %37, %true_31 : i1
        %true_32 = hw.constant true
        %112 = comb.xor %arg18, %true_32 : i1
        %113 = comb.and %112, %111, %35, %csaat_q, %10, %110 : i1
        %114 = comb.or %21, %113 : i1
        %115 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %116 = comb.or %37, %115 : i1
        %true_33 = hw.constant true
        %117 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %118 = comb.xor %21, %true_34 : i1
        %119 = comb.and %118, %117, %116 : i1
        %120 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_35 = hw.constant -1 : i2
        %121 = comb.icmp eq %120, %c-1_i2_35 : i2
        %true_36 = hw.constant true
        %122 = comb.xor %10, %true_36 : i1
        %true_37 = hw.constant true
        %123 = comb.xor %37, %true_37 : i1
        %true_38 = hw.constant true
        %124 = comb.xor %arg18, %true_38 : i1
        %true_39 = hw.constant true
        %125 = comb.xor %21, %true_39 : i1
        %126 = comb.icmp ne %41, %c-4_i3 : i3
        %127 = comb.xor %114, %true : i1
        %128 = comb.and %127, %98 : i1
        %129 = comb.xor %119, %true : i1
        %130 = comb.and %129, %128, %125, %124, %123, %35, %csaat_q, %122, %121 : i1
        %131 = comb.xor %130, %true : i1
        %132 = comb.and %128, %119 : i1
        %133 = comb.xor %132, %true : i1
        %134 = comb.and %98, %114 : i1
        %135 = comb.xor %134, %true : i1
        %136 = comb.and %98, %135, %133, %131, %126 : i1
        %137 = comb.icmp ne %41, %c3_i3 : i3
        %138 = comb.and %arg15, %22, %39, %35, %csaat_q, %12 : i1
        %139 = comb.mux %138, %arg14, %csid_q : i1
        %140 = comb.mux %138, %arg13, %cpol_q : i1
        %141 = comb.mux %138, %arg12, %cpha_q : i1
        %142 = comb.mux %138, %arg8, %csnidle_q : i4
        %143 = comb.mux %138, %arg9, %csnlead_q : i4
        %144 = comb.mux %138, %arg10, %csntrail_q : i4
        %145 = comb.mux %138, %arg7, %clkdiv_q : i16
        %146 = comb.mux %138, %arg3, %cmd_wr_en_q : i1
        %147 = comb.mux %138, %arg4, %cmd_rd_en_q : i1
        %148 = comb.mux %138, %arg2, %cmd_speed_q : i2
        %149 = comb.mux %1, %145, %2 : i16
        %150 = comb.mux %138, %arg7, %149 : i16
        %151 = comb.mux %0, %clk_cntr_q, %150 : i16
        %152 = comb.mux %arg18, %c0_i16, %151 : i16
        %153 = comb.xor %141, %true : i1
        %154 = comb.mux %153, %56, %63 : i1
        %155 = comb.and %141, %65 : i1
        %156 = comb.mux %153, %57, %64 : i1
        %157 = comb.mux %153, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %158 = comb.xor %147, %true : i1
        %159 = comb.xor %146, %true : i1
        %160 = comb.and %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c0_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %163 = comb.mux %138, %161, %162 : i1
        %164 = comb.icmp eq %arg2, %c1_i2 : i2
        %165 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %166 = comb.mux %138, %164, %165 : i1
        %167 = comb.icmp eq %arg2, %c-2_i2 : i2
        %168 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %169 = comb.mux %138, %167, %168 : i1
        %170 = comb.mux %169, %c-4_i3, %c1_i3 : i3
        %171 = comb.xor %160, %true : i1
        %172 = comb.xor %163, %true : i1
        %173 = comb.and %172, %171, %166 : i1
        %174 = comb.mux %173, %c2_i3, %170 : i3
        %175 = comb.mux %173, %c-2_i3, %170 : i3
        %176 = comb.and %171, %163 : i1
        %177 = comb.mux %176, %c1_i3, %174 : i3
        %178 = comb.mux %176, %c-1_i3, %175 : i3
        %179 = comb.mux %160, %c0_i3, %177 : i3
        %180 = comb.mux %160, %c0_i3, %178 : i3
        %181 = comb.sub %bit_cntr_q, %179 : i3
        %182 = comb.mux %156, %181, %bit_cntr_q : i3
        %183 = comb.mux %154, %180, %182 : i3
        %184 = comb.mux %20, %bit_cntr_q, %183 : i3
        %185 = comb.mux %arg18, %c0_i3, %184 : i3
        %186 = comb.mux %138, %arg5, %byte_cntr_cpha0_q : i20
        %187 = comb.mux %arg18, %c0_i20, %186 : i20
        %188 = comb.mux %138, %arg5, %66 : i20
        %189 = comb.mux %20, %byte_cntr_cpha1_q, %188 : i20
        %190 = comb.mux %arg18, %c0_i20, %189 : i20
        %191 = comb.mux %105, %142, %c0_i4 : i4
        %192 = comb.mux %106, %144, %191 : i4
        %193 = comb.mux %107, %143, %192 : i4
        %194 = comb.mux %28, %193, %wait_cntr_q : i4
        %195 = comb.mux %arg18, %c0_i4, %194 : i4
        %196 = comb.mux %109, %27, %195 : i4
        %197 = comb.mux %140, %137, %62 : i1
        %198 = comb.xor %155, %true : i1
        %199 = comb.and %198, %cmd_wr_en_last_bit : i1
        %200 = comb.or %30, %199 : i1
        %201 = comb.icmp eq %arg2, %c0_i2 : i2
        %202 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %203 = comb.mux %138, %201, %202 : i1
        %204 = comb.and %147, %146 : i1
        %205 = comb.xor %204, %true : i1
        %206 = comb.or %203, %205 : i1
        verif.assert %206 : i1
        %207 = comb.icmp ne %148, %c-1_i2 : i2
        verif.assert %207 : i1
        %208 = comb.xor %139, %true : i1
        verif.assert %208 : i1
        fsm.update %cmd_wr_en_last_bit, %200 : i1
        %209 = comb.and %154, %146, %3 : i1
        %210 = comb.and %155, %157, %4 : i1
        %211 = comb.or %210, %209 : i1
        %212 = comb.xor %211, %true : i1
        %213 = comb.and %156, %212 : i1
        %214 = comb.and %138, %212 : i1
        %215 = comb.mux %214, %arg14, %csid_q : i1
        %216 = comb.mux %214, %arg13, %cpol_q : i1
        %217 = comb.mux %214, %arg12, %cpha_q : i1
        %218 = comb.mux %214, %arg11, %full_cyc_q : i1
        %219 = comb.mux %214, %arg8, %csnidle_q : i4
        %220 = comb.mux %214, %arg9, %csnlead_q : i4
        %221 = comb.mux %214, %arg10, %csntrail_q : i4
        %222 = comb.mux %214, %arg7, %clkdiv_q : i16
        %223 = comb.mux %214, %arg6, %csaat_q : i1
        %224 = comb.mux %214, %arg3, %cmd_wr_en_q : i1
        %225 = comb.mux %214, %arg4, %cmd_rd_en_q : i1
        %226 = comb.mux %214, %arg2, %cmd_speed_q : i2
        %227 = comb.mux %214, %arg5, %cmd_len_q : i20
        %228 = comb.mux %211, %clk_cntr_q, %152 : i16
        %229 = comb.and %42, %212 : i1
        %230 = comb.mux bin %229, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %231 = comb.mux %211, %bit_cntr_q, %185 : i3
        %232 = comb.mux %211, %byte_cntr_cpha0_q, %187 : i20
        %233 = comb.mux %211, %byte_cntr_cpha1_q, %190 : i20
        %234 = comb.mux %211, %wait_cntr_q, %196 : i4
        %235 = comb.or %154, %213 : i1
        %236 = comb.and %5, %212 : i1
        %237 = comb.mux %236, %235, %sample_en_q : i1
        %238 = comb.mux %236, %sample_en_q, %sample_en_q2 : i1
        %239 = comb.mux bin %211, %u_sck_flop2Fq_o, %197 : i1
        %240 = comb.mux %212, %136, %csb_q : i1
        %241 = comb.or %139, %240 : i1
        fsm.update %csb_q, %241 : i1
        fsm.update %u_sck_flop2Fq_o, %239 : i1
        fsm.update %sample_en_q2, %238 : i1
        fsm.update %sample_en_q, %237 : i1
        fsm.update %wait_cntr_q, %234 : i4
        fsm.update %byte_cntr_cpha1_q, %233 : i20
        fsm.update %byte_cntr_cpha0_q, %232 : i20
        fsm.update %bit_cntr_q, %231 : i3
        fsm.update %segment_rd_en_cpha1, %230 : i1
        fsm.update %clk_cntr_q, %228 : i16
        fsm.update %cmd_len_q, %227 : i20
        fsm.update %cmd_speed_q, %226 : i2
        fsm.update %cmd_wr_en_q, %224 : i1
        fsm.update %cmd_rd_en_q, %225 : i1
        fsm.update %csaat_q, %223 : i1
        fsm.update %clkdiv_q, %222 : i16
        fsm.update %csntrail_q, %221 : i4
        fsm.update %csnlead_q, %220 : i4
        fsm.update %csnidle_q, %219 : i4
        fsm.update %full_cyc_q, %218 : i1
        fsm.update %cpha_q, %217 : i1
        fsm.update %cpol_q, %216 : i1
        fsm.update %csid_q, %215 : i1
      }
      fsm.transition @state_2 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %18 = comb.and %arg1, %0 : i1
        %19 = comb.xor %16, %true : i1
        %20 = comb.icmp ne %17, %c0_i20 : i20
        %21 = comb.or %19, %20, %11 : i1
        %22 = comb.and %18, %14 : i1
        %23 = comb.xor %21, %true : i1
        %24 = comb.and %23, %22 : i1
        %25 = comb.mux %24, %15, %13 : i3
        %26 = comb.and %22, %21 : i1
        %27 = comb.mux %26, %c3_i3, %25 : i3
        %28 = comb.xor %26, %true : i1
        %29 = comb.mux %arg18, %c0_i3, %27 : i3
        %30 = comb.xor %18, %true : i1
        %31 = comb.and %14, %30 : i1
        %32 = comb.mux %31, %c2_i3, %29 : i3
        %33 = comb.xor %31, %true : i1
        %34 = comb.icmp ne %32, %c2_i3 : i3
        %35 = comb.and %14, %34 : i1
        %true_0 = hw.constant true
        %36 = comb.xor %24, %true_0 : i1
        %true_1 = hw.constant true
        %37 = comb.xor %26, %true_1 : i1
        %true_2 = hw.constant true
        %38 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %39 = comb.xor %31, %true_3 : i1
        %40 = comb.and %39, %38, %37, %36, %10 : i1
        %true_4 = hw.constant true
        %41 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %26, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %arg18, %true_6 : i1
        %44 = comb.and %43, %42, %24, %csaat_q, %7, %41 : i1
        %45 = comb.or %31, %44 : i1
        %46 = comb.and %45, %16 : i1
        %47 = comb.or %40, %46 : i1
        %48 = comb.and %35, %47 : i1
        %49 = comb.and %24, %csaat_q, %7, %cpha_q : i1
        %50 = comb.or %26, %49 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %31, %true_8 : i1
        %53 = comb.and %35, %52, %51, %50, %16 : i1
        %54 = comb.and %arg15, %33, %28, %24, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg14, %csid_q : i1
        %56 = comb.mux %54, %arg12, %cpha_q : i1
        %57 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %58 = comb.mux %54, %arg4, %cmd_rd_en_q : i1
        %59 = comb.mux %54, %arg2, %cmd_speed_q : i2
        %60 = comb.xor %56, %true : i1
        %61 = comb.mux %60, %48, %53 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.icmp eq %arg2, %c0_i2 : i2
        %64 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %65 = comb.mux %54, %63, %64 : i1
        %66 = comb.and %58, %57 : i1
        %67 = comb.xor %66, %true : i1
        %68 = comb.or %65, %67 : i1
        verif.assert %68 : i1
        %69 = comb.icmp ne %59, %c-1_i2 : i2
        verif.assert %69 : i1
        %70 = comb.xor %55, %true : i1
        verif.assert %70 : i1
        %71 = comb.and %61, %57, %1 : i1
        %72 = comb.and %56, %35, %16, %62, %2 : i1
        %true_9 = hw.constant true
        %73 = comb.xor %cpha_q, %true_9 : i1
        %true_10 = hw.constant true
        %74 = comb.xor %26, %true_10 : i1
        %true_11 = hw.constant true
        %75 = comb.xor %arg18, %true_11 : i1
        %76 = comb.and %75, %74, %24, %csaat_q, %7, %73 : i1
        %77 = comb.or %72, %71, %31, %76 : i1
        fsm.return %77
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %c2_i3_0 = hw.constant 2 : i3
        %23 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %24 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %25 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %26 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %27 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %28 = comb.or %arg18, %5 : i1
        %29 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %30 = comb.and %cmd_wr_en_q, %23 : i1
        %31 = comb.xor %23, %true : i1
        %32 = comb.icmp ne %25, %c0_i20 : i20
        %33 = comb.or %31, %32, %14 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %34, %18 : i1
        %36 = comb.mux %35, %19, %16 : i3
        %37 = comb.and %18, %33 : i1
        %38 = comb.mux %37, %c3_i3, %36 : i3
        %39 = comb.xor %37, %true : i1
        %40 = comb.mux %arg18, %c0_i3, %38 : i3
        %41 = comb.mux %21, %c2_i3_0, %40 : i3
        %42 = comb.icmp ne %41, %c2_i3_0 : i3
        %43 = comb.and %17, %42 : i1
        %true_1 = hw.constant true
        %44 = comb.xor %35, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %37, %true_2 : i1
        %true_3 = hw.constant true
        %46 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %21, %true_4 : i1
        %48 = comb.and %47, %46, %45, %44, %13 : i1
        %true_5 = hw.constant true
        %49 = comb.xor %cpha_q, %true_5 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %37, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %52 = comb.and %51, %50, %35, %csaat_q, %10, %49 : i1
        %53 = comb.or %21, %52 : i1
        %54 = comb.and %53, %23 : i1
        %55 = comb.or %48, %54 : i1
        %56 = comb.and %43, %55 : i1
        %57 = comb.and %43, %53, %24 : i1
        %58 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %59 = comb.or %37, %58 : i1
        %true_8 = hw.constant true
        %60 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %61 = comb.xor %21, %true_9 : i1
        %62 = comb.and %61, %60, %59 : i1
        %63 = comb.and %43, %62, %23 : i1
        %64 = comb.and %43, %62, %24 : i1
        %65 = comb.and %43, %23 : i1
        %66 = comb.mux %65, %26, %byte_cntr_cpha1_q : i20
        %true_10 = hw.constant true
        %67 = comb.xor %35, %true_10 : i1
        %true_11 = hw.constant true
        %68 = comb.xor %37, %true_11 : i1
        %true_12 = hw.constant true
        %69 = comb.xor %arg18, %true_12 : i1
        %true_13 = hw.constant true
        %70 = comb.xor %21, %true_13 : i1
        %71 = comb.and %70, %69, %68, %67, %13 : i1
        %72 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_14 = hw.constant 0 : i2
        %73 = comb.icmp eq %72, %c0_i2_14 : i2
        %true_15 = hw.constant true
        %74 = comb.xor %10, %true_15 : i1
        %75 = comb.and %74, %73 : i1
        %76 = comb.or %15, %75 : i1
        %true_16 = hw.constant true
        %77 = comb.xor %37, %true_16 : i1
        %true_17 = hw.constant true
        %78 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %79 = comb.xor %21, %true_18 : i1
        %80 = comb.and %79, %78, %77, %35, %76 : i1
        %81 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_19 = hw.constant 1 : i2
        %82 = comb.icmp eq %81, %c1_i2_19 : i2
        %true_20 = hw.constant true
        %83 = comb.xor %10, %true_20 : i1
        %true_21 = hw.constant true
        %84 = comb.xor %37, %true_21 : i1
        %true_22 = hw.constant true
        %85 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %86 = comb.xor %21, %true_23 : i1
        %87 = comb.and %86, %85, %84, %35, %csaat_q, %83, %82 : i1
        %88 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_24 = hw.constant -2 : i2
        %89 = comb.icmp eq %88, %c-2_i2_24 : i2
        %true_25 = hw.constant true
        %90 = comb.xor %10, %true_25 : i1
        %91 = comb.and %csaat_q, %90, %89 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %13, %true_26 : i1
        %93 = comb.mux %35, %91, %92 : i1
        %true_27 = hw.constant true
        %94 = comb.xor %37, %true_27 : i1
        %true_28 = hw.constant true
        %95 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %96 = comb.xor %21, %true_29 : i1
        %97 = comb.and %42, %18 : i1
        %98 = comb.xor %71, %true : i1
        %99 = comb.and %98, %97 : i1
        %100 = comb.xor %80, %true : i1
        %101 = comb.and %100, %99 : i1
        %102 = comb.xor %87, %true : i1
        %103 = comb.and %102, %101, %96, %95, %94, %93 : i1
        %104 = comb.and %101, %87 : i1
        %105 = comb.or %104, %103 : i1
        %106 = comb.and %99, %80 : i1
        %107 = comb.and %97, %71 : i1
        %108 = comb.xor %42, %true : i1
        %109 = comb.and %29, %108, %18 : i1
        %true_30 = hw.constant true
        %110 = comb.xor %cpha_q, %true_30 : i1
        %true_31 = hw.constant true
        %111 = comb.xor %37, %true_31 : i1
        %true_32 = hw.constant true
        %112 = comb.xor %arg18, %true_32 : i1
        %113 = comb.and %112, %111, %35, %csaat_q, %10, %110 : i1
        %114 = comb.or %21, %113 : i1
        %115 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %116 = comb.or %37, %115 : i1
        %true_33 = hw.constant true
        %117 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %118 = comb.xor %21, %true_34 : i1
        %119 = comb.and %118, %117, %116 : i1
        %120 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_35 = hw.constant -1 : i2
        %121 = comb.icmp eq %120, %c-1_i2_35 : i2
        %true_36 = hw.constant true
        %122 = comb.xor %10, %true_36 : i1
        %true_37 = hw.constant true
        %123 = comb.xor %37, %true_37 : i1
        %true_38 = hw.constant true
        %124 = comb.xor %arg18, %true_38 : i1
        %true_39 = hw.constant true
        %125 = comb.xor %21, %true_39 : i1
        %126 = comb.icmp ne %41, %c-4_i3 : i3
        %127 = comb.xor %114, %true : i1
        %128 = comb.and %127, %98 : i1
        %129 = comb.xor %119, %true : i1
        %130 = comb.and %129, %128, %125, %124, %123, %35, %csaat_q, %122, %121 : i1
        %131 = comb.xor %130, %true : i1
        %132 = comb.and %128, %119 : i1
        %133 = comb.xor %132, %true : i1
        %134 = comb.and %98, %114 : i1
        %135 = comb.xor %134, %true : i1
        %136 = comb.and %98, %135, %133, %131, %126 : i1
        %137 = comb.icmp ne %41, %c3_i3 : i3
        %138 = comb.and %arg15, %22, %39, %35, %csaat_q, %12 : i1
        %139 = comb.mux %138, %arg14, %csid_q : i1
        %140 = comb.mux %138, %arg13, %cpol_q : i1
        %141 = comb.mux %138, %arg12, %cpha_q : i1
        %142 = comb.mux %138, %arg8, %csnidle_q : i4
        %143 = comb.mux %138, %arg9, %csnlead_q : i4
        %144 = comb.mux %138, %arg10, %csntrail_q : i4
        %145 = comb.mux %138, %arg7, %clkdiv_q : i16
        %146 = comb.mux %138, %arg3, %cmd_wr_en_q : i1
        %147 = comb.mux %138, %arg4, %cmd_rd_en_q : i1
        %148 = comb.mux %138, %arg2, %cmd_speed_q : i2
        %149 = comb.mux %1, %145, %2 : i16
        %150 = comb.mux %138, %arg7, %149 : i16
        %151 = comb.mux %0, %clk_cntr_q, %150 : i16
        %152 = comb.mux %arg18, %c0_i16, %151 : i16
        %153 = comb.xor %141, %true : i1
        %154 = comb.mux %153, %56, %63 : i1
        %155 = comb.and %141, %65 : i1
        %156 = comb.mux %153, %57, %64 : i1
        %157 = comb.mux %153, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %158 = comb.xor %147, %true : i1
        %159 = comb.xor %146, %true : i1
        %160 = comb.and %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c0_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %163 = comb.mux %138, %161, %162 : i1
        %164 = comb.icmp eq %arg2, %c1_i2 : i2
        %165 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %166 = comb.mux %138, %164, %165 : i1
        %167 = comb.icmp eq %arg2, %c-2_i2 : i2
        %168 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %169 = comb.mux %138, %167, %168 : i1
        %170 = comb.mux %169, %c-4_i3, %c1_i3 : i3
        %171 = comb.xor %160, %true : i1
        %172 = comb.xor %163, %true : i1
        %173 = comb.and %172, %171, %166 : i1
        %174 = comb.mux %173, %c2_i3, %170 : i3
        %175 = comb.mux %173, %c-2_i3, %170 : i3
        %176 = comb.and %171, %163 : i1
        %177 = comb.mux %176, %c1_i3, %174 : i3
        %178 = comb.mux %176, %c-1_i3, %175 : i3
        %179 = comb.mux %160, %c0_i3, %177 : i3
        %180 = comb.mux %160, %c0_i3, %178 : i3
        %181 = comb.sub %bit_cntr_q, %179 : i3
        %182 = comb.mux %156, %181, %bit_cntr_q : i3
        %183 = comb.mux %154, %180, %182 : i3
        %184 = comb.mux %20, %bit_cntr_q, %183 : i3
        %185 = comb.mux %arg18, %c0_i3, %184 : i3
        %186 = comb.mux %138, %arg5, %byte_cntr_cpha0_q : i20
        %187 = comb.mux %arg18, %c0_i20, %186 : i20
        %188 = comb.mux %138, %arg5, %66 : i20
        %189 = comb.mux %20, %byte_cntr_cpha1_q, %188 : i20
        %190 = comb.mux %arg18, %c0_i20, %189 : i20
        %191 = comb.mux %105, %142, %c0_i4 : i4
        %192 = comb.mux %106, %144, %191 : i4
        %193 = comb.mux %107, %143, %192 : i4
        %194 = comb.mux %28, %193, %wait_cntr_q : i4
        %195 = comb.mux %arg18, %c0_i4, %194 : i4
        %196 = comb.mux %109, %27, %195 : i4
        %197 = comb.mux %140, %137, %62 : i1
        %198 = comb.xor %155, %true : i1
        %199 = comb.and %198, %cmd_wr_en_last_bit : i1
        %200 = comb.or %30, %199 : i1
        %201 = comb.icmp eq %arg2, %c0_i2 : i2
        %202 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %203 = comb.mux %138, %201, %202 : i1
        %204 = comb.and %147, %146 : i1
        %205 = comb.xor %204, %true : i1
        %206 = comb.or %203, %205 : i1
        verif.assert %206 : i1
        %207 = comb.icmp ne %148, %c-1_i2 : i2
        verif.assert %207 : i1
        %208 = comb.xor %139, %true : i1
        verif.assert %208 : i1
        fsm.update %cmd_wr_en_last_bit, %200 : i1
        %209 = comb.and %154, %146, %3 : i1
        %210 = comb.and %155, %157, %4 : i1
        %211 = comb.or %210, %209 : i1
        %212 = comb.xor %211, %true : i1
        %213 = comb.and %156, %212 : i1
        %214 = comb.and %138, %212 : i1
        %215 = comb.mux %214, %arg14, %csid_q : i1
        %216 = comb.mux %214, %arg13, %cpol_q : i1
        %217 = comb.mux %214, %arg12, %cpha_q : i1
        %218 = comb.mux %214, %arg11, %full_cyc_q : i1
        %219 = comb.mux %214, %arg8, %csnidle_q : i4
        %220 = comb.mux %214, %arg9, %csnlead_q : i4
        %221 = comb.mux %214, %arg10, %csntrail_q : i4
        %222 = comb.mux %214, %arg7, %clkdiv_q : i16
        %223 = comb.mux %214, %arg6, %csaat_q : i1
        %224 = comb.mux %214, %arg3, %cmd_wr_en_q : i1
        %225 = comb.mux %214, %arg4, %cmd_rd_en_q : i1
        %226 = comb.mux %214, %arg2, %cmd_speed_q : i2
        %227 = comb.mux %214, %arg5, %cmd_len_q : i20
        %228 = comb.mux %211, %clk_cntr_q, %152 : i16
        %229 = comb.and %42, %212 : i1
        %230 = comb.mux bin %229, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %231 = comb.mux %211, %bit_cntr_q, %185 : i3
        %232 = comb.mux %211, %byte_cntr_cpha0_q, %187 : i20
        %233 = comb.mux %211, %byte_cntr_cpha1_q, %190 : i20
        %234 = comb.mux %211, %wait_cntr_q, %196 : i4
        %235 = comb.or %154, %213 : i1
        %236 = comb.and %5, %212 : i1
        %237 = comb.mux %236, %235, %sample_en_q : i1
        %238 = comb.mux %236, %sample_en_q, %sample_en_q2 : i1
        %239 = comb.mux bin %211, %u_sck_flop2Fq_o, %197 : i1
        %240 = comb.mux %212, %136, %csb_q : i1
        %241 = comb.or %139, %240 : i1
        fsm.update %csb_q, %241 : i1
        fsm.update %u_sck_flop2Fq_o, %239 : i1
        fsm.update %sample_en_q2, %238 : i1
        fsm.update %sample_en_q, %237 : i1
        fsm.update %wait_cntr_q, %234 : i4
        fsm.update %byte_cntr_cpha1_q, %233 : i20
        fsm.update %byte_cntr_cpha0_q, %232 : i20
        fsm.update %bit_cntr_q, %231 : i3
        fsm.update %segment_rd_en_cpha1, %230 : i1
        fsm.update %clk_cntr_q, %228 : i16
        fsm.update %cmd_len_q, %227 : i20
        fsm.update %cmd_speed_q, %226 : i2
        fsm.update %cmd_wr_en_q, %224 : i1
        fsm.update %cmd_rd_en_q, %225 : i1
        fsm.update %csaat_q, %223 : i1
        fsm.update %clkdiv_q, %222 : i16
        fsm.update %csntrail_q, %221 : i4
        fsm.update %csnlead_q, %220 : i4
        fsm.update %csnidle_q, %219 : i4
        fsm.update %full_cyc_q, %218 : i1
        fsm.update %cpha_q, %217 : i1
        fsm.update %cpol_q, %216 : i1
        fsm.update %csid_q, %215 : i1
      }
      fsm.transition @state_1 guard {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %18 = comb.and %arg1, %0 : i1
        %19 = comb.xor %16, %true : i1
        %20 = comb.icmp ne %17, %c0_i20 : i20
        %21 = comb.or %19, %20, %11 : i1
        %22 = comb.and %18, %14 : i1
        %23 = comb.xor %21, %true : i1
        %24 = comb.and %23, %22 : i1
        %25 = comb.mux %24, %15, %13 : i3
        %26 = comb.and %22, %21 : i1
        %27 = comb.mux %26, %c3_i3, %25 : i3
        %28 = comb.xor %26, %true : i1
        %29 = comb.mux %arg18, %c0_i3, %27 : i3
        %30 = comb.xor %18, %true : i1
        %31 = comb.and %14, %30 : i1
        %32 = comb.mux %31, %c2_i3, %29 : i3
        %33 = comb.xor %31, %true : i1
        %34 = comb.icmp ne %32, %c2_i3 : i3
        %35 = comb.and %14, %34 : i1
        %true_0 = hw.constant true
        %36 = comb.xor %24, %true_0 : i1
        %true_1 = hw.constant true
        %37 = comb.xor %26, %true_1 : i1
        %true_2 = hw.constant true
        %38 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %39 = comb.xor %31, %true_3 : i1
        %40 = comb.and %39, %38, %37, %36, %10 : i1
        %true_4 = hw.constant true
        %41 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %42 = comb.xor %26, %true_5 : i1
        %true_6 = hw.constant true
        %43 = comb.xor %arg18, %true_6 : i1
        %44 = comb.and %43, %42, %24, %csaat_q, %7, %41 : i1
        %45 = comb.or %31, %44 : i1
        %46 = comb.and %45, %16 : i1
        %47 = comb.or %40, %46 : i1
        %48 = comb.and %35, %47 : i1
        %49 = comb.and %24, %csaat_q, %7, %cpha_q : i1
        %50 = comb.or %26, %49 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %31, %true_8 : i1
        %53 = comb.and %35, %52, %51, %50, %16 : i1
        %54 = comb.and %arg15, %33, %28, %24, %csaat_q, %9 : i1
        %55 = comb.mux %54, %arg14, %csid_q : i1
        %56 = comb.mux %54, %arg12, %cpha_q : i1
        %57 = comb.mux %54, %arg3, %cmd_wr_en_q : i1
        %58 = comb.mux %54, %arg4, %cmd_rd_en_q : i1
        %59 = comb.mux %54, %arg2, %cmd_speed_q : i2
        %60 = comb.xor %56, %true : i1
        %61 = comb.mux %60, %48, %53 : i1
        %62 = comb.mux %60, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %63 = comb.icmp eq %arg2, %c0_i2 : i2
        %64 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %65 = comb.mux %54, %63, %64 : i1
        %66 = comb.and %58, %57 : i1
        %67 = comb.xor %66, %true : i1
        %68 = comb.or %65, %67 : i1
        verif.assert %68 : i1
        %69 = comb.icmp ne %59, %c-1_i2 : i2
        verif.assert %69 : i1
        %70 = comb.xor %55, %true : i1
        verif.assert %70 : i1
        %71 = comb.and %61, %57, %1 : i1
        %72 = comb.and %56, %35, %16, %62, %2 : i1
        %73 = comb.or %72, %71, %31 : i1
        %true_9 = hw.constant true
        %74 = comb.xor %24, %true_9 : i1
        %true_10 = hw.constant true
        %75 = comb.xor %26, %true_10 : i1
        %true_11 = hw.constant true
        %76 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %77 = comb.xor %73, %true_12 : i1
        %78 = comb.and %77, %76, %75, %74, %10 : i1
        fsm.return %78
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %c2_i3_0 = hw.constant 2 : i3
        %23 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %24 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %25 = comb.mux %cpha_q, %byte_cntr_cpha1_q, %byte_cntr_cpha0_q : i20
        %26 = comb.add %byte_cntr_cpha1_q, %c-1_i20 : i20
        %27 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %28 = comb.or %arg18, %5 : i1
        %29 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %30 = comb.and %cmd_wr_en_q, %23 : i1
        %31 = comb.xor %23, %true : i1
        %32 = comb.icmp ne %25, %c0_i20 : i20
        %33 = comb.or %31, %32, %14 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %34, %18 : i1
        %36 = comb.mux %35, %19, %16 : i3
        %37 = comb.and %18, %33 : i1
        %38 = comb.mux %37, %c3_i3, %36 : i3
        %39 = comb.xor %37, %true : i1
        %40 = comb.mux %arg18, %c0_i3, %38 : i3
        %41 = comb.mux %21, %c2_i3_0, %40 : i3
        %42 = comb.icmp ne %41, %c2_i3_0 : i3
        %43 = comb.and %17, %42 : i1
        %true_1 = hw.constant true
        %44 = comb.xor %35, %true_1 : i1
        %true_2 = hw.constant true
        %45 = comb.xor %37, %true_2 : i1
        %true_3 = hw.constant true
        %46 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %21, %true_4 : i1
        %48 = comb.and %47, %46, %45, %44, %13 : i1
        %true_5 = hw.constant true
        %49 = comb.xor %cpha_q, %true_5 : i1
        %true_6 = hw.constant true
        %50 = comb.xor %37, %true_6 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %52 = comb.and %51, %50, %35, %csaat_q, %10, %49 : i1
        %53 = comb.or %21, %52 : i1
        %54 = comb.and %53, %23 : i1
        %55 = comb.or %48, %54 : i1
        %56 = comb.and %43, %55 : i1
        %57 = comb.and %43, %53, %24 : i1
        %58 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %59 = comb.or %37, %58 : i1
        %true_8 = hw.constant true
        %60 = comb.xor %arg18, %true_8 : i1
        %true_9 = hw.constant true
        %61 = comb.xor %21, %true_9 : i1
        %62 = comb.and %61, %60, %59 : i1
        %63 = comb.and %43, %62, %23 : i1
        %64 = comb.and %43, %62, %24 : i1
        %65 = comb.and %43, %23 : i1
        %66 = comb.mux %65, %26, %byte_cntr_cpha1_q : i20
        %true_10 = hw.constant true
        %67 = comb.xor %35, %true_10 : i1
        %true_11 = hw.constant true
        %68 = comb.xor %37, %true_11 : i1
        %true_12 = hw.constant true
        %69 = comb.xor %arg18, %true_12 : i1
        %true_13 = hw.constant true
        %70 = comb.xor %21, %true_13 : i1
        %71 = comb.and %70, %69, %68, %67, %13 : i1
        %72 = comb.extract %8 from 0 : (i3) -> i2
        %c0_i2_14 = hw.constant 0 : i2
        %73 = comb.icmp eq %72, %c0_i2_14 : i2
        %true_15 = hw.constant true
        %74 = comb.xor %10, %true_15 : i1
        %75 = comb.and %74, %73 : i1
        %76 = comb.or %15, %75 : i1
        %true_16 = hw.constant true
        %77 = comb.xor %37, %true_16 : i1
        %true_17 = hw.constant true
        %78 = comb.xor %arg18, %true_17 : i1
        %true_18 = hw.constant true
        %79 = comb.xor %21, %true_18 : i1
        %80 = comb.and %79, %78, %77, %35, %76 : i1
        %81 = comb.extract %8 from 0 : (i3) -> i2
        %c1_i2_19 = hw.constant 1 : i2
        %82 = comb.icmp eq %81, %c1_i2_19 : i2
        %true_20 = hw.constant true
        %83 = comb.xor %10, %true_20 : i1
        %true_21 = hw.constant true
        %84 = comb.xor %37, %true_21 : i1
        %true_22 = hw.constant true
        %85 = comb.xor %arg18, %true_22 : i1
        %true_23 = hw.constant true
        %86 = comb.xor %21, %true_23 : i1
        %87 = comb.and %86, %85, %84, %35, %csaat_q, %83, %82 : i1
        %88 = comb.extract %8 from 0 : (i3) -> i2
        %c-2_i2_24 = hw.constant -2 : i2
        %89 = comb.icmp eq %88, %c-2_i2_24 : i2
        %true_25 = hw.constant true
        %90 = comb.xor %10, %true_25 : i1
        %91 = comb.and %csaat_q, %90, %89 : i1
        %true_26 = hw.constant true
        %92 = comb.xor %13, %true_26 : i1
        %93 = comb.mux %35, %91, %92 : i1
        %true_27 = hw.constant true
        %94 = comb.xor %37, %true_27 : i1
        %true_28 = hw.constant true
        %95 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %96 = comb.xor %21, %true_29 : i1
        %97 = comb.and %42, %18 : i1
        %98 = comb.xor %71, %true : i1
        %99 = comb.and %98, %97 : i1
        %100 = comb.xor %80, %true : i1
        %101 = comb.and %100, %99 : i1
        %102 = comb.xor %87, %true : i1
        %103 = comb.and %102, %101, %96, %95, %94, %93 : i1
        %104 = comb.and %101, %87 : i1
        %105 = comb.or %104, %103 : i1
        %106 = comb.and %99, %80 : i1
        %107 = comb.and %97, %71 : i1
        %108 = comb.xor %42, %true : i1
        %109 = comb.and %29, %108, %18 : i1
        %true_30 = hw.constant true
        %110 = comb.xor %cpha_q, %true_30 : i1
        %true_31 = hw.constant true
        %111 = comb.xor %37, %true_31 : i1
        %true_32 = hw.constant true
        %112 = comb.xor %arg18, %true_32 : i1
        %113 = comb.and %112, %111, %35, %csaat_q, %10, %110 : i1
        %114 = comb.or %21, %113 : i1
        %115 = comb.and %35, %csaat_q, %10, %cpha_q : i1
        %116 = comb.or %37, %115 : i1
        %true_33 = hw.constant true
        %117 = comb.xor %arg18, %true_33 : i1
        %true_34 = hw.constant true
        %118 = comb.xor %21, %true_34 : i1
        %119 = comb.and %118, %117, %116 : i1
        %120 = comb.extract %8 from 0 : (i3) -> i2
        %c-1_i2_35 = hw.constant -1 : i2
        %121 = comb.icmp eq %120, %c-1_i2_35 : i2
        %true_36 = hw.constant true
        %122 = comb.xor %10, %true_36 : i1
        %true_37 = hw.constant true
        %123 = comb.xor %37, %true_37 : i1
        %true_38 = hw.constant true
        %124 = comb.xor %arg18, %true_38 : i1
        %true_39 = hw.constant true
        %125 = comb.xor %21, %true_39 : i1
        %126 = comb.icmp ne %41, %c-4_i3 : i3
        %127 = comb.xor %114, %true : i1
        %128 = comb.and %127, %98 : i1
        %129 = comb.xor %119, %true : i1
        %130 = comb.and %129, %128, %125, %124, %123, %35, %csaat_q, %122, %121 : i1
        %131 = comb.xor %130, %true : i1
        %132 = comb.and %128, %119 : i1
        %133 = comb.xor %132, %true : i1
        %134 = comb.and %98, %114 : i1
        %135 = comb.xor %134, %true : i1
        %136 = comb.and %98, %135, %133, %131, %126 : i1
        %137 = comb.icmp ne %41, %c3_i3 : i3
        %138 = comb.and %arg15, %22, %39, %35, %csaat_q, %12 : i1
        %139 = comb.mux %138, %arg14, %csid_q : i1
        %140 = comb.mux %138, %arg13, %cpol_q : i1
        %141 = comb.mux %138, %arg12, %cpha_q : i1
        %142 = comb.mux %138, %arg8, %csnidle_q : i4
        %143 = comb.mux %138, %arg9, %csnlead_q : i4
        %144 = comb.mux %138, %arg10, %csntrail_q : i4
        %145 = comb.mux %138, %arg7, %clkdiv_q : i16
        %146 = comb.mux %138, %arg3, %cmd_wr_en_q : i1
        %147 = comb.mux %138, %arg4, %cmd_rd_en_q : i1
        %148 = comb.mux %138, %arg2, %cmd_speed_q : i2
        %149 = comb.mux %1, %145, %2 : i16
        %150 = comb.mux %138, %arg7, %149 : i16
        %151 = comb.mux %0, %clk_cntr_q, %150 : i16
        %152 = comb.mux %arg18, %c0_i16, %151 : i16
        %153 = comb.xor %141, %true : i1
        %154 = comb.mux %153, %56, %63 : i1
        %155 = comb.and %141, %65 : i1
        %156 = comb.mux %153, %57, %64 : i1
        %157 = comb.mux %153, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %158 = comb.xor %147, %true : i1
        %159 = comb.xor %146, %true : i1
        %160 = comb.and %158, %159 : i1
        %161 = comb.icmp eq %arg2, %c0_i2 : i2
        %162 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %163 = comb.mux %138, %161, %162 : i1
        %164 = comb.icmp eq %arg2, %c1_i2 : i2
        %165 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %166 = comb.mux %138, %164, %165 : i1
        %167 = comb.icmp eq %arg2, %c-2_i2 : i2
        %168 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %169 = comb.mux %138, %167, %168 : i1
        %170 = comb.mux %169, %c-4_i3, %c1_i3 : i3
        %171 = comb.xor %160, %true : i1
        %172 = comb.xor %163, %true : i1
        %173 = comb.and %172, %171, %166 : i1
        %174 = comb.mux %173, %c2_i3, %170 : i3
        %175 = comb.mux %173, %c-2_i3, %170 : i3
        %176 = comb.and %171, %163 : i1
        %177 = comb.mux %176, %c1_i3, %174 : i3
        %178 = comb.mux %176, %c-1_i3, %175 : i3
        %179 = comb.mux %160, %c0_i3, %177 : i3
        %180 = comb.mux %160, %c0_i3, %178 : i3
        %181 = comb.sub %bit_cntr_q, %179 : i3
        %182 = comb.mux %156, %181, %bit_cntr_q : i3
        %183 = comb.mux %154, %180, %182 : i3
        %184 = comb.mux %20, %bit_cntr_q, %183 : i3
        %185 = comb.mux %arg18, %c0_i3, %184 : i3
        %186 = comb.mux %138, %arg5, %byte_cntr_cpha0_q : i20
        %187 = comb.mux %arg18, %c0_i20, %186 : i20
        %188 = comb.mux %138, %arg5, %66 : i20
        %189 = comb.mux %20, %byte_cntr_cpha1_q, %188 : i20
        %190 = comb.mux %arg18, %c0_i20, %189 : i20
        %191 = comb.mux %105, %142, %c0_i4 : i4
        %192 = comb.mux %106, %144, %191 : i4
        %193 = comb.mux %107, %143, %192 : i4
        %194 = comb.mux %28, %193, %wait_cntr_q : i4
        %195 = comb.mux %arg18, %c0_i4, %194 : i4
        %196 = comb.mux %109, %27, %195 : i4
        %197 = comb.mux %140, %137, %62 : i1
        %198 = comb.xor %155, %true : i1
        %199 = comb.and %198, %cmd_wr_en_last_bit : i1
        %200 = comb.or %30, %199 : i1
        %201 = comb.icmp eq %arg2, %c0_i2 : i2
        %202 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %203 = comb.mux %138, %201, %202 : i1
        %204 = comb.and %147, %146 : i1
        %205 = comb.xor %204, %true : i1
        %206 = comb.or %203, %205 : i1
        verif.assert %206 : i1
        %207 = comb.icmp ne %148, %c-1_i2 : i2
        verif.assert %207 : i1
        %208 = comb.xor %139, %true : i1
        verif.assert %208 : i1
        fsm.update %cmd_wr_en_last_bit, %200 : i1
        %209 = comb.and %154, %146, %3 : i1
        %210 = comb.and %155, %157, %4 : i1
        %211 = comb.or %210, %209 : i1
        %212 = comb.xor %211, %true : i1
        %213 = comb.and %156, %212 : i1
        %214 = comb.and %138, %212 : i1
        %215 = comb.mux %214, %arg14, %csid_q : i1
        %216 = comb.mux %214, %arg13, %cpol_q : i1
        %217 = comb.mux %214, %arg12, %cpha_q : i1
        %218 = comb.mux %214, %arg11, %full_cyc_q : i1
        %219 = comb.mux %214, %arg8, %csnidle_q : i4
        %220 = comb.mux %214, %arg9, %csnlead_q : i4
        %221 = comb.mux %214, %arg10, %csntrail_q : i4
        %222 = comb.mux %214, %arg7, %clkdiv_q : i16
        %223 = comb.mux %214, %arg6, %csaat_q : i1
        %224 = comb.mux %214, %arg3, %cmd_wr_en_q : i1
        %225 = comb.mux %214, %arg4, %cmd_rd_en_q : i1
        %226 = comb.mux %214, %arg2, %cmd_speed_q : i2
        %227 = comb.mux %214, %arg5, %cmd_len_q : i20
        %228 = comb.mux %211, %clk_cntr_q, %152 : i16
        %229 = comb.and %42, %212 : i1
        %230 = comb.mux bin %229, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %231 = comb.mux %211, %bit_cntr_q, %185 : i3
        %232 = comb.mux %211, %byte_cntr_cpha0_q, %187 : i20
        %233 = comb.mux %211, %byte_cntr_cpha1_q, %190 : i20
        %234 = comb.mux %211, %wait_cntr_q, %196 : i4
        %235 = comb.or %154, %213 : i1
        %236 = comb.and %5, %212 : i1
        %237 = comb.mux %236, %235, %sample_en_q : i1
        %238 = comb.mux %236, %sample_en_q, %sample_en_q2 : i1
        %239 = comb.mux bin %211, %u_sck_flop2Fq_o, %197 : i1
        %240 = comb.mux %212, %136, %csb_q : i1
        %241 = comb.or %139, %240 : i1
        fsm.update %csb_q, %241 : i1
        fsm.update %u_sck_flop2Fq_o, %239 : i1
        fsm.update %sample_en_q2, %238 : i1
        fsm.update %sample_en_q, %237 : i1
        fsm.update %wait_cntr_q, %234 : i4
        fsm.update %byte_cntr_cpha1_q, %233 : i20
        fsm.update %byte_cntr_cpha0_q, %232 : i20
        fsm.update %bit_cntr_q, %231 : i3
        fsm.update %segment_rd_en_cpha1, %230 : i1
        fsm.update %clk_cntr_q, %228 : i16
        fsm.update %cmd_len_q, %227 : i20
        fsm.update %cmd_speed_q, %226 : i2
        fsm.update %cmd_wr_en_q, %224 : i1
        fsm.update %cmd_rd_en_q, %225 : i1
        fsm.update %csaat_q, %223 : i1
        fsm.update %clkdiv_q, %222 : i16
        fsm.update %csntrail_q, %221 : i4
        fsm.update %csnlead_q, %220 : i4
        fsm.update %csnidle_q, %219 : i4
        fsm.update %full_cyc_q, %218 : i1
        fsm.update %cpha_q, %217 : i1
        fsm.update %cpol_q, %216 : i1
        fsm.update %csid_q, %215 : i1
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
      %c-1_i2 = hw.constant -1 : i2
      %true = hw.constant true
      %false = hw.constant false
      %false_0 = hw.constant false
      %0 = comb.xor %arg16, %true : i1
      %false_1 = hw.constant false
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
      %c-1_i3_2 = hw.constant -1 : i3
      %18 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
      %19 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
      %false_3 = hw.constant false
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
      %38 = comb.and %arg15, %17 : i1
      %39 = comb.mux %38, %arg14, %csid_q : i1
      %40 = comb.mux %38, %arg12, %cpha_q : i1
      %41 = comb.mux %38, %arg11, %full_cyc_q : i1
      %42 = comb.mux %38, %arg3, %cmd_wr_en_q : i1
      %43 = comb.mux %38, %arg4, %cmd_rd_en_q : i1
      %44 = comb.mux %38, %arg2, %cmd_speed_q : i2
      %45 = comb.mux %15, %c-1_i3_2, %13 : i3
      %46 = comb.icmp ne %45, %c-1_i3_2 : i3
      %47 = comb.and %10, %46 : i1
      %true_4 = hw.constant true
      %48 = comb.xor %11, %true_4 : i1
      %true_5 = hw.constant true
      %49 = comb.xor %arg18, %true_5 : i1
      %true_6 = hw.constant true
      %50 = comb.xor %15, %true_6 : i1
      %51 = comb.and %50, %49, %48, %8 : i1
      %true_7 = hw.constant true
      %52 = comb.xor %cpha_q, %true_7 : i1
      %true_8 = hw.constant true
      %53 = comb.xor %arg18, %true_8 : i1
      %true_9 = hw.constant true
      %54 = comb.xor %15, %true_9 : i1
      %55 = comb.and %54, %53, %11, %5, %52 : i1
      %56 = comb.and %55, %18 : i1
      %57 = comb.or %51, %56 : i1
      %58 = comb.and %47, %57 : i1
      %59 = comb.and %47, %55, %19 : i1
      %true_10 = hw.constant true
      %60 = comb.xor %arg18, %true_10 : i1
      %true_11 = hw.constant true
      %61 = comb.xor %15, %true_11 : i1
      %62 = comb.and %61, %60, %11, %5, %cpha_q : i1
      %63 = comb.and %47, %62, %18 : i1
      %64 = comb.and %47, %62, %19 : i1
      %65 = comb.xor %40, %true : i1
      %66 = comb.mux %65, %58, %63 : i1
      %67 = comb.mux %65, %59, %64 : i1
      %68 = comb.and %66, %42 : i1
      %69 = comb.mux %41, %sample_en_q2, %sample_en_q : i1
      %70 = comb.icmp eq %arg2, %c0_i2 : i2
      %71 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %72 = comb.mux %38, %70, %71 : i1
      %73 = comb.and %43, %42 : i1
      %74 = comb.xor %73, %true : i1
      %75 = comb.or %72, %74 : i1
      verif.assert %75 : i1
      %76 = comb.icmp ne %44, %c-1_i2 : i2
      verif.assert %76 : i1
      %77 = comb.xor %39, %true : i1
      verif.assert %77 : i1
      %78 = comb.and %68, %0 : i1
      %79 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %80 = comb.icmp eq %arg5, %c0_i20 : i20
      %81 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %82 = comb.mux %38, %80, %81 : i1
      %83 = comb.mux %14, %79, %82 : i1
      %84 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %85 = comb.icmp eq %arg5, %c0_i20 : i20
      %86 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %87 = comb.mux %38, %85, %86 : i1
      %88 = comb.mux %14, %84, %87 : i1
      %89 = comb.mux %65, %83, %88 : i1
      %90 = comb.or %arg18, %89 : i1
      %91 = comb.xor %78, %true : i1
      %92 = comb.and %68, %91 : i1
      %93 = comb.and %69, %91 : i1
      %94 = comb.and %67, %91 : i1
      %95 = comb.and %17, %91 : i1
      %96 = comb.and %90, %92, %arg16 : i1
      fsm.output %95, %u_sck_flop2Fq_o, %csb_q, %37, %false_3, %96, %92, %false, %93, %94, %cmd_speed_q, %41, %false_1, %78, %false_0 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_7 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
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
        %c-1_i3_0 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.and %arg1, %10 : i1
        %13 = comb.mux %12, %6, %9 : i3
        %14 = comb.mux %arg18, %c0_i3, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.and %10, %15 : i1
        %17 = comb.mux %16, %c-1_i3_0, %14 : i3
        %18 = comb.xor %16, %true : i1
        %19 = comb.icmp ne %17, %c-1_i3_0 : i3
        %20 = comb.and %10, %19 : i1
        %true_1 = hw.constant true
        %21 = comb.xor %12, %true_1 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %16, %true_3 : i1
        %24 = comb.and %23, %22, %21, %8 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %16, %true_6 : i1
        %28 = comb.and %27, %26, %12, %5, %25, %11 : i1
        %29 = comb.or %24, %28 : i1
        %30 = comb.and %20, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %32 = comb.xor %16, %true_8 : i1
        %33 = comb.and %20, %32, %31, %12, %5, %cpha_q, %11 : i1
        %34 = comb.and %arg15, %18, %12, %7 : i1
        %35 = comb.mux %34, %arg14, %csid_q : i1
        %36 = comb.mux %34, %arg12, %cpha_q : i1
        %37 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %38 = comb.mux %34, %arg4, %cmd_rd_en_q : i1
        %39 = comb.mux %34, %arg2, %cmd_speed_q : i2
        %40 = comb.xor %36, %true : i1
        %41 = comb.mux %40, %30, %33 : i1
        %42 = comb.icmp eq %arg2, %c0_i2 : i2
        %43 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %44 = comb.mux %34, %42, %43 : i1
        %45 = comb.and %38, %37 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %44, %46 : i1
        verif.assert %47 : i1
        %48 = comb.icmp ne %39, %c-1_i2 : i2
        verif.assert %48 : i1
        %49 = comb.xor %35, %true : i1
        verif.assert %49 : i1
        %50 = comb.and %41, %37, %0 : i1
        %51 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2_9 = hw.constant -1 : i2
        %52 = comb.icmp eq %51, %c-1_i2_9 : i2
        %true_10 = hw.constant true
        %53 = comb.xor %5, %true_10 : i1
        %true_11 = hw.constant true
        %54 = comb.xor %arg18, %true_11 : i1
        %55 = comb.and %54, %12, %53, %52 : i1
        %56 = comb.or %50, %16, %55 : i1
        fsm.return %56
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %arg1, %10 : i1
        %12 = comb.mux %11, %6, %9 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %arg1, %true : i1
        %15 = comb.and %10, %14 : i1
        %16 = comb.xor %15, %true : i1
        %c-1_i3_0 = hw.constant -1 : i3
        %17 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %18 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %19 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %20 = comb.or %arg18, %arg1 : i1
        %21 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %22 = comb.and %cmd_wr_en_q, %17 : i1
        %23 = comb.or %22, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %23 : i1
        %24 = comb.and %arg15, %16, %11, %7 : i1
        %25 = comb.mux %24, %arg14, %csid_q : i1
        %26 = comb.mux %24, %arg13, %cpol_q : i1
        %27 = comb.mux %24, %arg12, %cpha_q : i1
        %28 = comb.mux %24, %arg8, %csnidle_q : i4
        %29 = comb.mux %24, %arg9, %csnlead_q : i4
        %30 = comb.mux %24, %arg10, %csntrail_q : i4
        %31 = comb.mux %24, %arg3, %cmd_wr_en_q : i1
        %32 = comb.mux %24, %arg4, %cmd_rd_en_q : i1
        %33 = comb.mux %24, %arg2, %cmd_speed_q : i2
        %34 = comb.mux %24, %arg7, %clk_cntr_q : i16
        %35 = comb.mux %arg18, %c0_i16, %34 : i16
        %36 = comb.mux %15, %c-1_i3_0, %13 : i3
        %37 = comb.icmp ne %36, %c-1_i3_0 : i3
        %38 = comb.and %10, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %11, %true_1 : i1
        %true_2 = hw.constant true
        %40 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %41 = comb.xor %15, %true_3 : i1
        %42 = comb.and %41, %40, %39, %8 : i1
        %true_4 = hw.constant true
        %43 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %44 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %45 = comb.xor %15, %true_6 : i1
        %46 = comb.and %45, %44, %11, %5, %43 : i1
        %47 = comb.and %46, %17 : i1
        %48 = comb.or %42, %47 : i1
        %49 = comb.and %38, %48 : i1
        %50 = comb.and %38, %46, %18 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %15, %true_8 : i1
        %53 = comb.and %52, %51, %11, %5, %cpha_q : i1
        %54 = comb.and %38, %53, %17 : i1
        %55 = comb.and %38, %53, %18 : i1
        %56 = comb.xor %27, %true : i1
        %57 = comb.mux %56, %49, %54 : i1
        %58 = comb.mux %56, %50, %55 : i1
        %59 = comb.xor %32, %true : i1
        %60 = comb.xor %31, %true : i1
        %61 = comb.and %59, %60 : i1
        %62 = comb.icmp eq %arg2, %c0_i2 : i2
        %63 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %64 = comb.mux %24, %62, %63 : i1
        %65 = comb.icmp eq %arg2, %c1_i2 : i2
        %66 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %67 = comb.mux %24, %65, %66 : i1
        %68 = comb.icmp eq %arg2, %c-2_i2 : i2
        %69 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %70 = comb.mux %24, %68, %69 : i1
        %71 = comb.mux %70, %c-4_i3, %c1_i3 : i3
        %72 = comb.xor %61, %true : i1
        %73 = comb.xor %64, %true : i1
        %74 = comb.and %73, %72, %67 : i1
        %75 = comb.mux %74, %c2_i3, %71 : i3
        %76 = comb.mux %74, %c-2_i3, %71 : i3
        %77 = comb.and %72, %64 : i1
        %78 = comb.mux %77, %c1_i3, %75 : i3
        %79 = comb.mux %77, %c-1_i3, %76 : i3
        %80 = comb.mux %61, %c0_i3, %78 : i3
        %81 = comb.mux %61, %c0_i3, %79 : i3
        %82 = comb.sub %bit_cntr_q, %80 : i3
        %83 = comb.mux %58, %82, %bit_cntr_q : i3
        %84 = comb.mux %57, %81, %83 : i3
        %85 = comb.mux %14, %bit_cntr_q, %84 : i3
        %86 = comb.mux %arg18, %c0_i3, %85 : i3
        %87 = comb.mux %24, %arg5, %byte_cntr_cpha0_q : i20
        %88 = comb.mux %arg18, %c0_i20, %87 : i20
        %89 = comb.mux %24, %arg5, %byte_cntr_cpha1_q : i20
        %90 = comb.mux %arg18, %c0_i20, %89 : i20
        %true_9 = hw.constant true
        %91 = comb.xor %11, %true_9 : i1
        %true_10 = hw.constant true
        %92 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %93 = comb.xor %15, %true_11 : i1
        %94 = comb.and %93, %92, %91, %8 : i1
        %95 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_12 = hw.constant 0 : i2
        %96 = comb.icmp eq %95, %c0_i2_12 : i2
        %true_13 = hw.constant true
        %97 = comb.xor %5, %true_13 : i1
        %true_14 = hw.constant true
        %98 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %99 = comb.xor %15, %true_15 : i1
        %100 = comb.and %99, %98, %11, %97, %96 : i1
        %101 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_16 = hw.constant 1 : i2
        %102 = comb.icmp eq %101, %c1_i2_16 : i2
        %true_17 = hw.constant true
        %103 = comb.xor %5, %true_17 : i1
        %true_18 = hw.constant true
        %104 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %105 = comb.xor %15, %true_19 : i1
        %106 = comb.and %105, %104, %11, %103, %102 : i1
        %107 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_20 = hw.constant -2 : i2
        %108 = comb.icmp eq %107, %c-2_i2_20 : i2
        %true_21 = hw.constant true
        %109 = comb.xor %5, %true_21 : i1
        %110 = comb.and %109, %108 : i1
        %true_22 = hw.constant true
        %111 = comb.xor %8, %true_22 : i1
        %112 = comb.mux %11, %110, %111 : i1
        %true_23 = hw.constant true
        %113 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %114 = comb.xor %15, %true_24 : i1
        %115 = comb.and %37, %11 : i1
        %116 = comb.xor %94, %true : i1
        %117 = comb.and %116, %115 : i1
        %118 = comb.xor %100, %true : i1
        %119 = comb.and %118, %117 : i1
        %120 = comb.xor %106, %true : i1
        %121 = comb.and %120, %119, %114, %113, %112 : i1
        %122 = comb.and %119, %106 : i1
        %123 = comb.or %122, %121 : i1
        %124 = comb.mux %123, %28, %c0_i4 : i4
        %125 = comb.and %117, %100 : i1
        %126 = comb.mux %125, %30, %124 : i4
        %127 = comb.and %115, %94 : i1
        %128 = comb.mux %127, %29, %126 : i4
        %129 = comb.mux %20, %128, %wait_cntr_q : i4
        %130 = comb.mux %arg18, %c0_i4, %129 : i4
        %131 = comb.xor %37, %true : i1
        %132 = comb.and %21, %131, %11 : i1
        %133 = comb.mux %132, %19, %130 : i4
        %true_25 = hw.constant true
        %134 = comb.xor %cpha_q, %true_25 : i1
        %true_26 = hw.constant true
        %135 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %136 = comb.xor %15, %true_27 : i1
        %137 = comb.and %136, %135, %11, %5, %134 : i1
        %true_28 = hw.constant true
        %138 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %139 = comb.xor %15, %true_29 : i1
        %140 = comb.and %139, %138, %11, %5, %cpha_q : i1
        %141 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2_30 = hw.constant -1 : i2
        %142 = comb.icmp eq %141, %c-1_i2_30 : i2
        %true_31 = hw.constant true
        %143 = comb.xor %5, %true_31 : i1
        %true_32 = hw.constant true
        %144 = comb.xor %arg18, %true_32 : i1
        %145 = comb.and %144, %11, %143, %142 : i1
        %146 = comb.or %15, %145 : i1
        %147 = comb.icmp ne %36, %c-4_i3 : i3
        %148 = comb.xor %137, %true : i1
        %149 = comb.and %148, %116 : i1
        %150 = comb.xor %140, %true : i1
        %151 = comb.and %150, %149, %146 : i1
        %152 = comb.xor %151, %true : i1
        %153 = comb.and %149, %140 : i1
        %154 = comb.xor %153, %true : i1
        %155 = comb.and %116, %137 : i1
        %156 = comb.xor %155, %true : i1
        %157 = comb.and %116, %156, %154, %152, %147 : i1
        %158 = comb.icmp ne %36, %c3_i3 : i3
        %159 = comb.mux %26, %158, %53 : i1
        %160 = comb.icmp eq %arg2, %c0_i2 : i2
        %161 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %162 = comb.mux %24, %160, %161 : i1
        %163 = comb.and %32, %31 : i1
        %164 = comb.xor %163, %true : i1
        %165 = comb.or %162, %164 : i1
        verif.assert %165 : i1
        %166 = comb.icmp ne %33, %c-1_i2 : i2
        verif.assert %166 : i1
        %167 = comb.xor %25, %true : i1
        verif.assert %167 : i1
        %168 = comb.and %57, %31, %0 : i1
        %169 = comb.mux %168, %clk_cntr_q, %35 : i16
        %170 = comb.mux %168, %bit_cntr_q, %86 : i3
        %171 = comb.mux %168, %byte_cntr_cpha0_q, %88 : i20
        %172 = comb.mux %168, %byte_cntr_cpha1_q, %90 : i20
        %173 = comb.mux %168, %wait_cntr_q, %133 : i4
        fsm.update %wait_cntr_q, %173 : i4
        fsm.update %byte_cntr_cpha1_q, %172 : i20
        fsm.update %byte_cntr_cpha0_q, %171 : i20
        fsm.update %bit_cntr_q, %170 : i3
        fsm.update %clk_cntr_q, %169 : i16
        %174 = comb.xor %168, %true : i1
        %175 = comb.and %58, %174 : i1
        %176 = comb.and %24, %174 : i1
        %177 = comb.mux %176, %arg14, %csid_q : i1
        %178 = comb.mux %176, %arg13, %cpol_q : i1
        %179 = comb.mux %176, %arg12, %cpha_q : i1
        %180 = comb.mux %176, %arg11, %full_cyc_q : i1
        %181 = comb.mux %176, %arg8, %csnidle_q : i4
        %182 = comb.mux %176, %arg9, %csnlead_q : i4
        %183 = comb.mux %176, %arg10, %csntrail_q : i4
        %184 = comb.mux %176, %arg7, %clkdiv_q : i16
        %185 = comb.mux %176, %arg6, %csaat_q : i1
        %186 = comb.mux %176, %arg3, %cmd_wr_en_q : i1
        %187 = comb.mux %176, %arg4, %cmd_rd_en_q : i1
        %188 = comb.mux %176, %arg2, %cmd_speed_q : i2
        %189 = comb.mux %176, %arg5, %cmd_len_q : i20
        %190 = comb.and %37, %174 : i1
        %191 = comb.mux bin %190, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %192 = comb.or %57, %175 : i1
        %193 = comb.and %arg1, %174 : i1
        %194 = comb.mux %193, %192, %sample_en_q : i1
        %195 = comb.mux %193, %sample_en_q, %sample_en_q2 : i1
        %196 = comb.mux bin %168, %u_sck_flop2Fq_o, %159 : i1
        %197 = comb.mux %174, %157, %csb_q : i1
        %198 = comb.or %25, %197 : i1
        fsm.update %csb_q, %198 : i1
        fsm.update %u_sck_flop2Fq_o, %196 : i1
        fsm.update %sample_en_q2, %195 : i1
        fsm.update %sample_en_q, %194 : i1
        fsm.update %segment_rd_en_cpha1, %191 : i1
        fsm.update %cmd_len_q, %189 : i20
        fsm.update %cmd_speed_q, %188 : i2
        fsm.update %cmd_wr_en_q, %186 : i1
        fsm.update %cmd_rd_en_q, %187 : i1
        fsm.update %csaat_q, %185 : i1
        fsm.update %clkdiv_q, %184 : i16
        fsm.update %csntrail_q, %183 : i4
        fsm.update %csnlead_q, %182 : i4
        fsm.update %csnidle_q, %181 : i4
        fsm.update %full_cyc_q, %180 : i1
        fsm.update %cpha_q, %179 : i1
        fsm.update %cpol_q, %178 : i1
        fsm.update %csid_q, %177 : i1
      }
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
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
        %c-1_i3_0 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.and %arg1, %10 : i1
        %13 = comb.mux %12, %6, %9 : i3
        %14 = comb.mux %arg18, %c0_i3, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.and %10, %15 : i1
        %17 = comb.mux %16, %c-1_i3_0, %14 : i3
        %18 = comb.xor %16, %true : i1
        %19 = comb.icmp ne %17, %c-1_i3_0 : i3
        %20 = comb.and %10, %19 : i1
        %true_1 = hw.constant true
        %21 = comb.xor %12, %true_1 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %16, %true_3 : i1
        %24 = comb.and %23, %22, %21, %8 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %16, %true_6 : i1
        %28 = comb.and %27, %26, %12, %5, %25, %11 : i1
        %29 = comb.or %24, %28 : i1
        %30 = comb.and %20, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %32 = comb.xor %16, %true_8 : i1
        %33 = comb.and %20, %32, %31, %12, %5, %cpha_q, %11 : i1
        %34 = comb.and %arg15, %18, %12, %7 : i1
        %35 = comb.mux %34, %arg14, %csid_q : i1
        %36 = comb.mux %34, %arg12, %cpha_q : i1
        %37 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %38 = comb.mux %34, %arg4, %cmd_rd_en_q : i1
        %39 = comb.mux %34, %arg2, %cmd_speed_q : i2
        %40 = comb.xor %36, %true : i1
        %41 = comb.mux %40, %30, %33 : i1
        %42 = comb.icmp eq %arg2, %c0_i2 : i2
        %43 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %44 = comb.mux %34, %42, %43 : i1
        %45 = comb.and %38, %37 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %44, %46 : i1
        verif.assert %47 : i1
        %48 = comb.icmp ne %39, %c-1_i2 : i2
        verif.assert %48 : i1
        %49 = comb.xor %35, %true : i1
        verif.assert %49 : i1
        %50 = comb.and %41, %37, %0 : i1
        %51 = comb.or %50, %16 : i1
        %52 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2 = hw.constant -2 : i2
        %53 = comb.icmp eq %52, %c-2_i2 : i2
        %true_9 = hw.constant true
        %54 = comb.xor %5, %true_9 : i1
        %55 = comb.and %54, %53 : i1
        %true_10 = hw.constant true
        %56 = comb.xor %8, %true_10 : i1
        %57 = comb.mux %12, %55, %56 : i1
        %true_11 = hw.constant true
        %58 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %59 = comb.xor %51, %true_12 : i1
        %60 = comb.and %59, %58, %57 : i1
        fsm.return %60
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %arg1, %10 : i1
        %12 = comb.mux %11, %6, %9 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %arg1, %true : i1
        %15 = comb.and %10, %14 : i1
        %16 = comb.xor %15, %true : i1
        %c-1_i3_0 = hw.constant -1 : i3
        %17 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %18 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %19 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %20 = comb.or %arg18, %arg1 : i1
        %21 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %22 = comb.and %cmd_wr_en_q, %17 : i1
        %23 = comb.or %22, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %23 : i1
        %24 = comb.and %arg15, %16, %11, %7 : i1
        %25 = comb.mux %24, %arg14, %csid_q : i1
        %26 = comb.mux %24, %arg13, %cpol_q : i1
        %27 = comb.mux %24, %arg12, %cpha_q : i1
        %28 = comb.mux %24, %arg8, %csnidle_q : i4
        %29 = comb.mux %24, %arg9, %csnlead_q : i4
        %30 = comb.mux %24, %arg10, %csntrail_q : i4
        %31 = comb.mux %24, %arg3, %cmd_wr_en_q : i1
        %32 = comb.mux %24, %arg4, %cmd_rd_en_q : i1
        %33 = comb.mux %24, %arg2, %cmd_speed_q : i2
        %34 = comb.mux %24, %arg7, %clk_cntr_q : i16
        %35 = comb.mux %arg18, %c0_i16, %34 : i16
        %36 = comb.mux %15, %c-1_i3_0, %13 : i3
        %37 = comb.icmp ne %36, %c-1_i3_0 : i3
        %38 = comb.and %10, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %11, %true_1 : i1
        %true_2 = hw.constant true
        %40 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %41 = comb.xor %15, %true_3 : i1
        %42 = comb.and %41, %40, %39, %8 : i1
        %true_4 = hw.constant true
        %43 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %44 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %45 = comb.xor %15, %true_6 : i1
        %46 = comb.and %45, %44, %11, %5, %43 : i1
        %47 = comb.and %46, %17 : i1
        %48 = comb.or %42, %47 : i1
        %49 = comb.and %38, %48 : i1
        %50 = comb.and %38, %46, %18 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %15, %true_8 : i1
        %53 = comb.and %52, %51, %11, %5, %cpha_q : i1
        %54 = comb.and %38, %53, %17 : i1
        %55 = comb.and %38, %53, %18 : i1
        %56 = comb.xor %27, %true : i1
        %57 = comb.mux %56, %49, %54 : i1
        %58 = comb.mux %56, %50, %55 : i1
        %59 = comb.xor %32, %true : i1
        %60 = comb.xor %31, %true : i1
        %61 = comb.and %59, %60 : i1
        %62 = comb.icmp eq %arg2, %c0_i2 : i2
        %63 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %64 = comb.mux %24, %62, %63 : i1
        %65 = comb.icmp eq %arg2, %c1_i2 : i2
        %66 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %67 = comb.mux %24, %65, %66 : i1
        %68 = comb.icmp eq %arg2, %c-2_i2 : i2
        %69 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %70 = comb.mux %24, %68, %69 : i1
        %71 = comb.mux %70, %c-4_i3, %c1_i3 : i3
        %72 = comb.xor %61, %true : i1
        %73 = comb.xor %64, %true : i1
        %74 = comb.and %73, %72, %67 : i1
        %75 = comb.mux %74, %c2_i3, %71 : i3
        %76 = comb.mux %74, %c-2_i3, %71 : i3
        %77 = comb.and %72, %64 : i1
        %78 = comb.mux %77, %c1_i3, %75 : i3
        %79 = comb.mux %77, %c-1_i3, %76 : i3
        %80 = comb.mux %61, %c0_i3, %78 : i3
        %81 = comb.mux %61, %c0_i3, %79 : i3
        %82 = comb.sub %bit_cntr_q, %80 : i3
        %83 = comb.mux %58, %82, %bit_cntr_q : i3
        %84 = comb.mux %57, %81, %83 : i3
        %85 = comb.mux %14, %bit_cntr_q, %84 : i3
        %86 = comb.mux %arg18, %c0_i3, %85 : i3
        %87 = comb.mux %24, %arg5, %byte_cntr_cpha0_q : i20
        %88 = comb.mux %arg18, %c0_i20, %87 : i20
        %89 = comb.mux %24, %arg5, %byte_cntr_cpha1_q : i20
        %90 = comb.mux %arg18, %c0_i20, %89 : i20
        %true_9 = hw.constant true
        %91 = comb.xor %11, %true_9 : i1
        %true_10 = hw.constant true
        %92 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %93 = comb.xor %15, %true_11 : i1
        %94 = comb.and %93, %92, %91, %8 : i1
        %95 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_12 = hw.constant 0 : i2
        %96 = comb.icmp eq %95, %c0_i2_12 : i2
        %true_13 = hw.constant true
        %97 = comb.xor %5, %true_13 : i1
        %true_14 = hw.constant true
        %98 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %99 = comb.xor %15, %true_15 : i1
        %100 = comb.and %99, %98, %11, %97, %96 : i1
        %101 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_16 = hw.constant 1 : i2
        %102 = comb.icmp eq %101, %c1_i2_16 : i2
        %true_17 = hw.constant true
        %103 = comb.xor %5, %true_17 : i1
        %true_18 = hw.constant true
        %104 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %105 = comb.xor %15, %true_19 : i1
        %106 = comb.and %105, %104, %11, %103, %102 : i1
        %107 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_20 = hw.constant -2 : i2
        %108 = comb.icmp eq %107, %c-2_i2_20 : i2
        %true_21 = hw.constant true
        %109 = comb.xor %5, %true_21 : i1
        %110 = comb.and %109, %108 : i1
        %true_22 = hw.constant true
        %111 = comb.xor %8, %true_22 : i1
        %112 = comb.mux %11, %110, %111 : i1
        %true_23 = hw.constant true
        %113 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %114 = comb.xor %15, %true_24 : i1
        %115 = comb.and %37, %11 : i1
        %116 = comb.xor %94, %true : i1
        %117 = comb.and %116, %115 : i1
        %118 = comb.xor %100, %true : i1
        %119 = comb.and %118, %117 : i1
        %120 = comb.xor %106, %true : i1
        %121 = comb.and %120, %119, %114, %113, %112 : i1
        %122 = comb.and %119, %106 : i1
        %123 = comb.or %122, %121 : i1
        %124 = comb.mux %123, %28, %c0_i4 : i4
        %125 = comb.and %117, %100 : i1
        %126 = comb.mux %125, %30, %124 : i4
        %127 = comb.and %115, %94 : i1
        %128 = comb.mux %127, %29, %126 : i4
        %129 = comb.mux %20, %128, %wait_cntr_q : i4
        %130 = comb.mux %arg18, %c0_i4, %129 : i4
        %131 = comb.xor %37, %true : i1
        %132 = comb.and %21, %131, %11 : i1
        %133 = comb.mux %132, %19, %130 : i4
        %true_25 = hw.constant true
        %134 = comb.xor %cpha_q, %true_25 : i1
        %true_26 = hw.constant true
        %135 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %136 = comb.xor %15, %true_27 : i1
        %137 = comb.and %136, %135, %11, %5, %134 : i1
        %true_28 = hw.constant true
        %138 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %139 = comb.xor %15, %true_29 : i1
        %140 = comb.and %139, %138, %11, %5, %cpha_q : i1
        %141 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2_30 = hw.constant -1 : i2
        %142 = comb.icmp eq %141, %c-1_i2_30 : i2
        %true_31 = hw.constant true
        %143 = comb.xor %5, %true_31 : i1
        %true_32 = hw.constant true
        %144 = comb.xor %arg18, %true_32 : i1
        %145 = comb.and %144, %11, %143, %142 : i1
        %146 = comb.or %15, %145 : i1
        %147 = comb.icmp ne %36, %c-4_i3 : i3
        %148 = comb.xor %137, %true : i1
        %149 = comb.and %148, %116 : i1
        %150 = comb.xor %140, %true : i1
        %151 = comb.and %150, %149, %146 : i1
        %152 = comb.xor %151, %true : i1
        %153 = comb.and %149, %140 : i1
        %154 = comb.xor %153, %true : i1
        %155 = comb.and %116, %137 : i1
        %156 = comb.xor %155, %true : i1
        %157 = comb.and %116, %156, %154, %152, %147 : i1
        %158 = comb.icmp ne %36, %c3_i3 : i3
        %159 = comb.mux %26, %158, %53 : i1
        %160 = comb.icmp eq %arg2, %c0_i2 : i2
        %161 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %162 = comb.mux %24, %160, %161 : i1
        %163 = comb.and %32, %31 : i1
        %164 = comb.xor %163, %true : i1
        %165 = comb.or %162, %164 : i1
        verif.assert %165 : i1
        %166 = comb.icmp ne %33, %c-1_i2 : i2
        verif.assert %166 : i1
        %167 = comb.xor %25, %true : i1
        verif.assert %167 : i1
        %168 = comb.and %57, %31, %0 : i1
        %169 = comb.mux %168, %clk_cntr_q, %35 : i16
        %170 = comb.mux %168, %bit_cntr_q, %86 : i3
        %171 = comb.mux %168, %byte_cntr_cpha0_q, %88 : i20
        %172 = comb.mux %168, %byte_cntr_cpha1_q, %90 : i20
        %173 = comb.mux %168, %wait_cntr_q, %133 : i4
        fsm.update %wait_cntr_q, %173 : i4
        fsm.update %byte_cntr_cpha1_q, %172 : i20
        fsm.update %byte_cntr_cpha0_q, %171 : i20
        fsm.update %bit_cntr_q, %170 : i3
        fsm.update %clk_cntr_q, %169 : i16
        %174 = comb.xor %168, %true : i1
        %175 = comb.and %58, %174 : i1
        %176 = comb.and %24, %174 : i1
        %177 = comb.mux %176, %arg14, %csid_q : i1
        %178 = comb.mux %176, %arg13, %cpol_q : i1
        %179 = comb.mux %176, %arg12, %cpha_q : i1
        %180 = comb.mux %176, %arg11, %full_cyc_q : i1
        %181 = comb.mux %176, %arg8, %csnidle_q : i4
        %182 = comb.mux %176, %arg9, %csnlead_q : i4
        %183 = comb.mux %176, %arg10, %csntrail_q : i4
        %184 = comb.mux %176, %arg7, %clkdiv_q : i16
        %185 = comb.mux %176, %arg6, %csaat_q : i1
        %186 = comb.mux %176, %arg3, %cmd_wr_en_q : i1
        %187 = comb.mux %176, %arg4, %cmd_rd_en_q : i1
        %188 = comb.mux %176, %arg2, %cmd_speed_q : i2
        %189 = comb.mux %176, %arg5, %cmd_len_q : i20
        %190 = comb.and %37, %174 : i1
        %191 = comb.mux bin %190, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %192 = comb.or %57, %175 : i1
        %193 = comb.and %arg1, %174 : i1
        %194 = comb.mux %193, %192, %sample_en_q : i1
        %195 = comb.mux %193, %sample_en_q, %sample_en_q2 : i1
        %196 = comb.mux bin %168, %u_sck_flop2Fq_o, %159 : i1
        %197 = comb.mux %174, %157, %csb_q : i1
        %198 = comb.or %25, %197 : i1
        fsm.update %csb_q, %198 : i1
        fsm.update %u_sck_flop2Fq_o, %196 : i1
        fsm.update %sample_en_q2, %195 : i1
        fsm.update %sample_en_q, %194 : i1
        fsm.update %segment_rd_en_cpha1, %191 : i1
        fsm.update %cmd_len_q, %189 : i20
        fsm.update %cmd_speed_q, %188 : i2
        fsm.update %cmd_wr_en_q, %186 : i1
        fsm.update %cmd_rd_en_q, %187 : i1
        fsm.update %csaat_q, %185 : i1
        fsm.update %clkdiv_q, %184 : i16
        fsm.update %csntrail_q, %183 : i4
        fsm.update %csnlead_q, %182 : i4
        fsm.update %csnidle_q, %181 : i4
        fsm.update %full_cyc_q, %180 : i1
        fsm.update %cpha_q, %179 : i1
        fsm.update %cpol_q, %178 : i1
        fsm.update %csid_q, %177 : i1
      }
      fsm.transition @state_4 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
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
        %c-1_i3_0 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.and %arg1, %10 : i1
        %13 = comb.mux %12, %6, %9 : i3
        %14 = comb.mux %arg18, %c0_i3, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.and %10, %15 : i1
        %17 = comb.mux %16, %c-1_i3_0, %14 : i3
        %18 = comb.xor %16, %true : i1
        %19 = comb.icmp ne %17, %c-1_i3_0 : i3
        %20 = comb.and %10, %19 : i1
        %true_1 = hw.constant true
        %21 = comb.xor %12, %true_1 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %16, %true_3 : i1
        %24 = comb.and %23, %22, %21, %8 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %16, %true_6 : i1
        %28 = comb.and %27, %26, %12, %5, %25, %11 : i1
        %29 = comb.or %24, %28 : i1
        %30 = comb.and %20, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %32 = comb.xor %16, %true_8 : i1
        %33 = comb.and %20, %32, %31, %12, %5, %cpha_q, %11 : i1
        %34 = comb.and %arg15, %18, %12, %7 : i1
        %35 = comb.mux %34, %arg14, %csid_q : i1
        %36 = comb.mux %34, %arg12, %cpha_q : i1
        %37 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %38 = comb.mux %34, %arg4, %cmd_rd_en_q : i1
        %39 = comb.mux %34, %arg2, %cmd_speed_q : i2
        %40 = comb.xor %36, %true : i1
        %41 = comb.mux %40, %30, %33 : i1
        %42 = comb.icmp eq %arg2, %c0_i2 : i2
        %43 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %44 = comb.mux %34, %42, %43 : i1
        %45 = comb.and %38, %37 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %44, %46 : i1
        verif.assert %47 : i1
        %48 = comb.icmp ne %39, %c-1_i2 : i2
        verif.assert %48 : i1
        %49 = comb.xor %35, %true : i1
        verif.assert %49 : i1
        %50 = comb.and %41, %37, %0 : i1
        %51 = comb.or %50, %16 : i1
        %52 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_9 = hw.constant 0 : i2
        %53 = comb.icmp eq %52, %c0_i2_9 : i2
        %true_10 = hw.constant true
        %54 = comb.xor %5, %true_10 : i1
        %true_11 = hw.constant true
        %55 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %56 = comb.xor %51, %true_12 : i1
        %57 = comb.and %56, %55, %12, %54, %53 : i1
        fsm.return %57
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %arg1, %10 : i1
        %12 = comb.mux %11, %6, %9 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %arg1, %true : i1
        %15 = comb.and %10, %14 : i1
        %16 = comb.xor %15, %true : i1
        %c-1_i3_0 = hw.constant -1 : i3
        %17 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %18 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %19 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %20 = comb.or %arg18, %arg1 : i1
        %21 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %22 = comb.and %cmd_wr_en_q, %17 : i1
        %23 = comb.or %22, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %23 : i1
        %24 = comb.and %arg15, %16, %11, %7 : i1
        %25 = comb.mux %24, %arg14, %csid_q : i1
        %26 = comb.mux %24, %arg13, %cpol_q : i1
        %27 = comb.mux %24, %arg12, %cpha_q : i1
        %28 = comb.mux %24, %arg8, %csnidle_q : i4
        %29 = comb.mux %24, %arg9, %csnlead_q : i4
        %30 = comb.mux %24, %arg10, %csntrail_q : i4
        %31 = comb.mux %24, %arg3, %cmd_wr_en_q : i1
        %32 = comb.mux %24, %arg4, %cmd_rd_en_q : i1
        %33 = comb.mux %24, %arg2, %cmd_speed_q : i2
        %34 = comb.mux %24, %arg7, %clk_cntr_q : i16
        %35 = comb.mux %arg18, %c0_i16, %34 : i16
        %36 = comb.mux %15, %c-1_i3_0, %13 : i3
        %37 = comb.icmp ne %36, %c-1_i3_0 : i3
        %38 = comb.and %10, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %11, %true_1 : i1
        %true_2 = hw.constant true
        %40 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %41 = comb.xor %15, %true_3 : i1
        %42 = comb.and %41, %40, %39, %8 : i1
        %true_4 = hw.constant true
        %43 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %44 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %45 = comb.xor %15, %true_6 : i1
        %46 = comb.and %45, %44, %11, %5, %43 : i1
        %47 = comb.and %46, %17 : i1
        %48 = comb.or %42, %47 : i1
        %49 = comb.and %38, %48 : i1
        %50 = comb.and %38, %46, %18 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %15, %true_8 : i1
        %53 = comb.and %52, %51, %11, %5, %cpha_q : i1
        %54 = comb.and %38, %53, %17 : i1
        %55 = comb.and %38, %53, %18 : i1
        %56 = comb.xor %27, %true : i1
        %57 = comb.mux %56, %49, %54 : i1
        %58 = comb.mux %56, %50, %55 : i1
        %59 = comb.xor %32, %true : i1
        %60 = comb.xor %31, %true : i1
        %61 = comb.and %59, %60 : i1
        %62 = comb.icmp eq %arg2, %c0_i2 : i2
        %63 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %64 = comb.mux %24, %62, %63 : i1
        %65 = comb.icmp eq %arg2, %c1_i2 : i2
        %66 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %67 = comb.mux %24, %65, %66 : i1
        %68 = comb.icmp eq %arg2, %c-2_i2 : i2
        %69 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %70 = comb.mux %24, %68, %69 : i1
        %71 = comb.mux %70, %c-4_i3, %c1_i3 : i3
        %72 = comb.xor %61, %true : i1
        %73 = comb.xor %64, %true : i1
        %74 = comb.and %73, %72, %67 : i1
        %75 = comb.mux %74, %c2_i3, %71 : i3
        %76 = comb.mux %74, %c-2_i3, %71 : i3
        %77 = comb.and %72, %64 : i1
        %78 = comb.mux %77, %c1_i3, %75 : i3
        %79 = comb.mux %77, %c-1_i3, %76 : i3
        %80 = comb.mux %61, %c0_i3, %78 : i3
        %81 = comb.mux %61, %c0_i3, %79 : i3
        %82 = comb.sub %bit_cntr_q, %80 : i3
        %83 = comb.mux %58, %82, %bit_cntr_q : i3
        %84 = comb.mux %57, %81, %83 : i3
        %85 = comb.mux %14, %bit_cntr_q, %84 : i3
        %86 = comb.mux %arg18, %c0_i3, %85 : i3
        %87 = comb.mux %24, %arg5, %byte_cntr_cpha0_q : i20
        %88 = comb.mux %arg18, %c0_i20, %87 : i20
        %89 = comb.mux %24, %arg5, %byte_cntr_cpha1_q : i20
        %90 = comb.mux %arg18, %c0_i20, %89 : i20
        %true_9 = hw.constant true
        %91 = comb.xor %11, %true_9 : i1
        %true_10 = hw.constant true
        %92 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %93 = comb.xor %15, %true_11 : i1
        %94 = comb.and %93, %92, %91, %8 : i1
        %95 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_12 = hw.constant 0 : i2
        %96 = comb.icmp eq %95, %c0_i2_12 : i2
        %true_13 = hw.constant true
        %97 = comb.xor %5, %true_13 : i1
        %true_14 = hw.constant true
        %98 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %99 = comb.xor %15, %true_15 : i1
        %100 = comb.and %99, %98, %11, %97, %96 : i1
        %101 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_16 = hw.constant 1 : i2
        %102 = comb.icmp eq %101, %c1_i2_16 : i2
        %true_17 = hw.constant true
        %103 = comb.xor %5, %true_17 : i1
        %true_18 = hw.constant true
        %104 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %105 = comb.xor %15, %true_19 : i1
        %106 = comb.and %105, %104, %11, %103, %102 : i1
        %107 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_20 = hw.constant -2 : i2
        %108 = comb.icmp eq %107, %c-2_i2_20 : i2
        %true_21 = hw.constant true
        %109 = comb.xor %5, %true_21 : i1
        %110 = comb.and %109, %108 : i1
        %true_22 = hw.constant true
        %111 = comb.xor %8, %true_22 : i1
        %112 = comb.mux %11, %110, %111 : i1
        %true_23 = hw.constant true
        %113 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %114 = comb.xor %15, %true_24 : i1
        %115 = comb.and %37, %11 : i1
        %116 = comb.xor %94, %true : i1
        %117 = comb.and %116, %115 : i1
        %118 = comb.xor %100, %true : i1
        %119 = comb.and %118, %117 : i1
        %120 = comb.xor %106, %true : i1
        %121 = comb.and %120, %119, %114, %113, %112 : i1
        %122 = comb.and %119, %106 : i1
        %123 = comb.or %122, %121 : i1
        %124 = comb.mux %123, %28, %c0_i4 : i4
        %125 = comb.and %117, %100 : i1
        %126 = comb.mux %125, %30, %124 : i4
        %127 = comb.and %115, %94 : i1
        %128 = comb.mux %127, %29, %126 : i4
        %129 = comb.mux %20, %128, %wait_cntr_q : i4
        %130 = comb.mux %arg18, %c0_i4, %129 : i4
        %131 = comb.xor %37, %true : i1
        %132 = comb.and %21, %131, %11 : i1
        %133 = comb.mux %132, %19, %130 : i4
        %true_25 = hw.constant true
        %134 = comb.xor %cpha_q, %true_25 : i1
        %true_26 = hw.constant true
        %135 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %136 = comb.xor %15, %true_27 : i1
        %137 = comb.and %136, %135, %11, %5, %134 : i1
        %true_28 = hw.constant true
        %138 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %139 = comb.xor %15, %true_29 : i1
        %140 = comb.and %139, %138, %11, %5, %cpha_q : i1
        %141 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2_30 = hw.constant -1 : i2
        %142 = comb.icmp eq %141, %c-1_i2_30 : i2
        %true_31 = hw.constant true
        %143 = comb.xor %5, %true_31 : i1
        %true_32 = hw.constant true
        %144 = comb.xor %arg18, %true_32 : i1
        %145 = comb.and %144, %11, %143, %142 : i1
        %146 = comb.or %15, %145 : i1
        %147 = comb.icmp ne %36, %c-4_i3 : i3
        %148 = comb.xor %137, %true : i1
        %149 = comb.and %148, %116 : i1
        %150 = comb.xor %140, %true : i1
        %151 = comb.and %150, %149, %146 : i1
        %152 = comb.xor %151, %true : i1
        %153 = comb.and %149, %140 : i1
        %154 = comb.xor %153, %true : i1
        %155 = comb.and %116, %137 : i1
        %156 = comb.xor %155, %true : i1
        %157 = comb.and %116, %156, %154, %152, %147 : i1
        %158 = comb.icmp ne %36, %c3_i3 : i3
        %159 = comb.mux %26, %158, %53 : i1
        %160 = comb.icmp eq %arg2, %c0_i2 : i2
        %161 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %162 = comb.mux %24, %160, %161 : i1
        %163 = comb.and %32, %31 : i1
        %164 = comb.xor %163, %true : i1
        %165 = comb.or %162, %164 : i1
        verif.assert %165 : i1
        %166 = comb.icmp ne %33, %c-1_i2 : i2
        verif.assert %166 : i1
        %167 = comb.xor %25, %true : i1
        verif.assert %167 : i1
        %168 = comb.and %57, %31, %0 : i1
        %169 = comb.mux %168, %clk_cntr_q, %35 : i16
        %170 = comb.mux %168, %bit_cntr_q, %86 : i3
        %171 = comb.mux %168, %byte_cntr_cpha0_q, %88 : i20
        %172 = comb.mux %168, %byte_cntr_cpha1_q, %90 : i20
        %173 = comb.mux %168, %wait_cntr_q, %133 : i4
        fsm.update %wait_cntr_q, %173 : i4
        fsm.update %byte_cntr_cpha1_q, %172 : i20
        fsm.update %byte_cntr_cpha0_q, %171 : i20
        fsm.update %bit_cntr_q, %170 : i3
        fsm.update %clk_cntr_q, %169 : i16
        %174 = comb.xor %168, %true : i1
        %175 = comb.and %58, %174 : i1
        %176 = comb.and %24, %174 : i1
        %177 = comb.mux %176, %arg14, %csid_q : i1
        %178 = comb.mux %176, %arg13, %cpol_q : i1
        %179 = comb.mux %176, %arg12, %cpha_q : i1
        %180 = comb.mux %176, %arg11, %full_cyc_q : i1
        %181 = comb.mux %176, %arg8, %csnidle_q : i4
        %182 = comb.mux %176, %arg9, %csnlead_q : i4
        %183 = comb.mux %176, %arg10, %csntrail_q : i4
        %184 = comb.mux %176, %arg7, %clkdiv_q : i16
        %185 = comb.mux %176, %arg6, %csaat_q : i1
        %186 = comb.mux %176, %arg3, %cmd_wr_en_q : i1
        %187 = comb.mux %176, %arg4, %cmd_rd_en_q : i1
        %188 = comb.mux %176, %arg2, %cmd_speed_q : i2
        %189 = comb.mux %176, %arg5, %cmd_len_q : i20
        %190 = comb.and %37, %174 : i1
        %191 = comb.mux bin %190, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %192 = comb.or %57, %175 : i1
        %193 = comb.and %arg1, %174 : i1
        %194 = comb.mux %193, %192, %sample_en_q : i1
        %195 = comb.mux %193, %sample_en_q, %sample_en_q2 : i1
        %196 = comb.mux bin %168, %u_sck_flop2Fq_o, %159 : i1
        %197 = comb.mux %174, %157, %csb_q : i1
        %198 = comb.or %25, %197 : i1
        fsm.update %csb_q, %198 : i1
        fsm.update %u_sck_flop2Fq_o, %196 : i1
        fsm.update %sample_en_q2, %195 : i1
        fsm.update %sample_en_q, %194 : i1
        fsm.update %segment_rd_en_cpha1, %191 : i1
        fsm.update %cmd_len_q, %189 : i20
        fsm.update %cmd_speed_q, %188 : i2
        fsm.update %cmd_wr_en_q, %186 : i1
        fsm.update %cmd_rd_en_q, %187 : i1
        fsm.update %csaat_q, %185 : i1
        fsm.update %clkdiv_q, %184 : i16
        fsm.update %csntrail_q, %183 : i4
        fsm.update %csnlead_q, %182 : i4
        fsm.update %csnidle_q, %181 : i4
        fsm.update %full_cyc_q, %180 : i1
        fsm.update %cpha_q, %179 : i1
        fsm.update %cpol_q, %178 : i1
        fsm.update %csid_q, %177 : i1
      }
      fsm.transition @state_3 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
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
        %c-1_i3_0 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.and %arg1, %10 : i1
        %13 = comb.mux %12, %6, %9 : i3
        %14 = comb.mux %arg18, %c0_i3, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.and %10, %15 : i1
        %17 = comb.mux %16, %c-1_i3_0, %14 : i3
        %18 = comb.xor %16, %true : i1
        %19 = comb.icmp ne %17, %c-1_i3_0 : i3
        %20 = comb.and %10, %19 : i1
        %true_1 = hw.constant true
        %21 = comb.xor %12, %true_1 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %16, %true_3 : i1
        %24 = comb.and %23, %22, %21, %8 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %16, %true_6 : i1
        %28 = comb.and %27, %26, %12, %5, %25, %11 : i1
        %29 = comb.or %24, %28 : i1
        %30 = comb.and %20, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %32 = comb.xor %16, %true_8 : i1
        %33 = comb.and %20, %32, %31, %12, %5, %cpha_q, %11 : i1
        %34 = comb.and %arg15, %18, %12, %7 : i1
        %35 = comb.mux %34, %arg14, %csid_q : i1
        %36 = comb.mux %34, %arg12, %cpha_q : i1
        %37 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %38 = comb.mux %34, %arg4, %cmd_rd_en_q : i1
        %39 = comb.mux %34, %arg2, %cmd_speed_q : i2
        %40 = comb.xor %36, %true : i1
        %41 = comb.mux %40, %30, %33 : i1
        %42 = comb.icmp eq %arg2, %c0_i2 : i2
        %43 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %44 = comb.mux %34, %42, %43 : i1
        %45 = comb.and %38, %37 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %44, %46 : i1
        verif.assert %47 : i1
        %48 = comb.icmp ne %39, %c-1_i2 : i2
        verif.assert %48 : i1
        %49 = comb.xor %35, %true : i1
        verif.assert %49 : i1
        %50 = comb.and %41, %37, %0 : i1
        %51 = comb.or %50, %16 : i1
        %true_9 = hw.constant true
        %52 = comb.xor %arg18, %true_9 : i1
        %true_10 = hw.constant true
        %53 = comb.xor %51, %true_10 : i1
        %54 = comb.and %53, %52, %12, %5, %cpha_q : i1
        fsm.return %54
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %arg1, %10 : i1
        %12 = comb.mux %11, %6, %9 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %arg1, %true : i1
        %15 = comb.and %10, %14 : i1
        %16 = comb.xor %15, %true : i1
        %c-1_i3_0 = hw.constant -1 : i3
        %17 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %18 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %19 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %20 = comb.or %arg18, %arg1 : i1
        %21 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %22 = comb.and %cmd_wr_en_q, %17 : i1
        %23 = comb.or %22, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %23 : i1
        %24 = comb.and %arg15, %16, %11, %7 : i1
        %25 = comb.mux %24, %arg14, %csid_q : i1
        %26 = comb.mux %24, %arg13, %cpol_q : i1
        %27 = comb.mux %24, %arg12, %cpha_q : i1
        %28 = comb.mux %24, %arg8, %csnidle_q : i4
        %29 = comb.mux %24, %arg9, %csnlead_q : i4
        %30 = comb.mux %24, %arg10, %csntrail_q : i4
        %31 = comb.mux %24, %arg3, %cmd_wr_en_q : i1
        %32 = comb.mux %24, %arg4, %cmd_rd_en_q : i1
        %33 = comb.mux %24, %arg2, %cmd_speed_q : i2
        %34 = comb.mux %24, %arg7, %clk_cntr_q : i16
        %35 = comb.mux %arg18, %c0_i16, %34 : i16
        %36 = comb.mux %15, %c-1_i3_0, %13 : i3
        %37 = comb.icmp ne %36, %c-1_i3_0 : i3
        %38 = comb.and %10, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %11, %true_1 : i1
        %true_2 = hw.constant true
        %40 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %41 = comb.xor %15, %true_3 : i1
        %42 = comb.and %41, %40, %39, %8 : i1
        %true_4 = hw.constant true
        %43 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %44 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %45 = comb.xor %15, %true_6 : i1
        %46 = comb.and %45, %44, %11, %5, %43 : i1
        %47 = comb.and %46, %17 : i1
        %48 = comb.or %42, %47 : i1
        %49 = comb.and %38, %48 : i1
        %50 = comb.and %38, %46, %18 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %15, %true_8 : i1
        %53 = comb.and %52, %51, %11, %5, %cpha_q : i1
        %54 = comb.and %38, %53, %17 : i1
        %55 = comb.and %38, %53, %18 : i1
        %56 = comb.xor %27, %true : i1
        %57 = comb.mux %56, %49, %54 : i1
        %58 = comb.mux %56, %50, %55 : i1
        %59 = comb.xor %32, %true : i1
        %60 = comb.xor %31, %true : i1
        %61 = comb.and %59, %60 : i1
        %62 = comb.icmp eq %arg2, %c0_i2 : i2
        %63 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %64 = comb.mux %24, %62, %63 : i1
        %65 = comb.icmp eq %arg2, %c1_i2 : i2
        %66 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %67 = comb.mux %24, %65, %66 : i1
        %68 = comb.icmp eq %arg2, %c-2_i2 : i2
        %69 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %70 = comb.mux %24, %68, %69 : i1
        %71 = comb.mux %70, %c-4_i3, %c1_i3 : i3
        %72 = comb.xor %61, %true : i1
        %73 = comb.xor %64, %true : i1
        %74 = comb.and %73, %72, %67 : i1
        %75 = comb.mux %74, %c2_i3, %71 : i3
        %76 = comb.mux %74, %c-2_i3, %71 : i3
        %77 = comb.and %72, %64 : i1
        %78 = comb.mux %77, %c1_i3, %75 : i3
        %79 = comb.mux %77, %c-1_i3, %76 : i3
        %80 = comb.mux %61, %c0_i3, %78 : i3
        %81 = comb.mux %61, %c0_i3, %79 : i3
        %82 = comb.sub %bit_cntr_q, %80 : i3
        %83 = comb.mux %58, %82, %bit_cntr_q : i3
        %84 = comb.mux %57, %81, %83 : i3
        %85 = comb.mux %14, %bit_cntr_q, %84 : i3
        %86 = comb.mux %arg18, %c0_i3, %85 : i3
        %87 = comb.mux %24, %arg5, %byte_cntr_cpha0_q : i20
        %88 = comb.mux %arg18, %c0_i20, %87 : i20
        %89 = comb.mux %24, %arg5, %byte_cntr_cpha1_q : i20
        %90 = comb.mux %arg18, %c0_i20, %89 : i20
        %true_9 = hw.constant true
        %91 = comb.xor %11, %true_9 : i1
        %true_10 = hw.constant true
        %92 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %93 = comb.xor %15, %true_11 : i1
        %94 = comb.and %93, %92, %91, %8 : i1
        %95 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_12 = hw.constant 0 : i2
        %96 = comb.icmp eq %95, %c0_i2_12 : i2
        %true_13 = hw.constant true
        %97 = comb.xor %5, %true_13 : i1
        %true_14 = hw.constant true
        %98 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %99 = comb.xor %15, %true_15 : i1
        %100 = comb.and %99, %98, %11, %97, %96 : i1
        %101 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_16 = hw.constant 1 : i2
        %102 = comb.icmp eq %101, %c1_i2_16 : i2
        %true_17 = hw.constant true
        %103 = comb.xor %5, %true_17 : i1
        %true_18 = hw.constant true
        %104 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %105 = comb.xor %15, %true_19 : i1
        %106 = comb.and %105, %104, %11, %103, %102 : i1
        %107 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_20 = hw.constant -2 : i2
        %108 = comb.icmp eq %107, %c-2_i2_20 : i2
        %true_21 = hw.constant true
        %109 = comb.xor %5, %true_21 : i1
        %110 = comb.and %109, %108 : i1
        %true_22 = hw.constant true
        %111 = comb.xor %8, %true_22 : i1
        %112 = comb.mux %11, %110, %111 : i1
        %true_23 = hw.constant true
        %113 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %114 = comb.xor %15, %true_24 : i1
        %115 = comb.and %37, %11 : i1
        %116 = comb.xor %94, %true : i1
        %117 = comb.and %116, %115 : i1
        %118 = comb.xor %100, %true : i1
        %119 = comb.and %118, %117 : i1
        %120 = comb.xor %106, %true : i1
        %121 = comb.and %120, %119, %114, %113, %112 : i1
        %122 = comb.and %119, %106 : i1
        %123 = comb.or %122, %121 : i1
        %124 = comb.mux %123, %28, %c0_i4 : i4
        %125 = comb.and %117, %100 : i1
        %126 = comb.mux %125, %30, %124 : i4
        %127 = comb.and %115, %94 : i1
        %128 = comb.mux %127, %29, %126 : i4
        %129 = comb.mux %20, %128, %wait_cntr_q : i4
        %130 = comb.mux %arg18, %c0_i4, %129 : i4
        %131 = comb.xor %37, %true : i1
        %132 = comb.and %21, %131, %11 : i1
        %133 = comb.mux %132, %19, %130 : i4
        %true_25 = hw.constant true
        %134 = comb.xor %cpha_q, %true_25 : i1
        %true_26 = hw.constant true
        %135 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %136 = comb.xor %15, %true_27 : i1
        %137 = comb.and %136, %135, %11, %5, %134 : i1
        %true_28 = hw.constant true
        %138 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %139 = comb.xor %15, %true_29 : i1
        %140 = comb.and %139, %138, %11, %5, %cpha_q : i1
        %141 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2_30 = hw.constant -1 : i2
        %142 = comb.icmp eq %141, %c-1_i2_30 : i2
        %true_31 = hw.constant true
        %143 = comb.xor %5, %true_31 : i1
        %true_32 = hw.constant true
        %144 = comb.xor %arg18, %true_32 : i1
        %145 = comb.and %144, %11, %143, %142 : i1
        %146 = comb.or %15, %145 : i1
        %147 = comb.icmp ne %36, %c-4_i3 : i3
        %148 = comb.xor %137, %true : i1
        %149 = comb.and %148, %116 : i1
        %150 = comb.xor %140, %true : i1
        %151 = comb.and %150, %149, %146 : i1
        %152 = comb.xor %151, %true : i1
        %153 = comb.and %149, %140 : i1
        %154 = comb.xor %153, %true : i1
        %155 = comb.and %116, %137 : i1
        %156 = comb.xor %155, %true : i1
        %157 = comb.and %116, %156, %154, %152, %147 : i1
        %158 = comb.icmp ne %36, %c3_i3 : i3
        %159 = comb.mux %26, %158, %53 : i1
        %160 = comb.icmp eq %arg2, %c0_i2 : i2
        %161 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %162 = comb.mux %24, %160, %161 : i1
        %163 = comb.and %32, %31 : i1
        %164 = comb.xor %163, %true : i1
        %165 = comb.or %162, %164 : i1
        verif.assert %165 : i1
        %166 = comb.icmp ne %33, %c-1_i2 : i2
        verif.assert %166 : i1
        %167 = comb.xor %25, %true : i1
        verif.assert %167 : i1
        %168 = comb.and %57, %31, %0 : i1
        %169 = comb.mux %168, %clk_cntr_q, %35 : i16
        %170 = comb.mux %168, %bit_cntr_q, %86 : i3
        %171 = comb.mux %168, %byte_cntr_cpha0_q, %88 : i20
        %172 = comb.mux %168, %byte_cntr_cpha1_q, %90 : i20
        %173 = comb.mux %168, %wait_cntr_q, %133 : i4
        fsm.update %wait_cntr_q, %173 : i4
        fsm.update %byte_cntr_cpha1_q, %172 : i20
        fsm.update %byte_cntr_cpha0_q, %171 : i20
        fsm.update %bit_cntr_q, %170 : i3
        fsm.update %clk_cntr_q, %169 : i16
        %174 = comb.xor %168, %true : i1
        %175 = comb.and %58, %174 : i1
        %176 = comb.and %24, %174 : i1
        %177 = comb.mux %176, %arg14, %csid_q : i1
        %178 = comb.mux %176, %arg13, %cpol_q : i1
        %179 = comb.mux %176, %arg12, %cpha_q : i1
        %180 = comb.mux %176, %arg11, %full_cyc_q : i1
        %181 = comb.mux %176, %arg8, %csnidle_q : i4
        %182 = comb.mux %176, %arg9, %csnlead_q : i4
        %183 = comb.mux %176, %arg10, %csntrail_q : i4
        %184 = comb.mux %176, %arg7, %clkdiv_q : i16
        %185 = comb.mux %176, %arg6, %csaat_q : i1
        %186 = comb.mux %176, %arg3, %cmd_wr_en_q : i1
        %187 = comb.mux %176, %arg4, %cmd_rd_en_q : i1
        %188 = comb.mux %176, %arg2, %cmd_speed_q : i2
        %189 = comb.mux %176, %arg5, %cmd_len_q : i20
        %190 = comb.and %37, %174 : i1
        %191 = comb.mux bin %190, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %192 = comb.or %57, %175 : i1
        %193 = comb.and %arg1, %174 : i1
        %194 = comb.mux %193, %192, %sample_en_q : i1
        %195 = comb.mux %193, %sample_en_q, %sample_en_q2 : i1
        %196 = comb.mux bin %168, %u_sck_flop2Fq_o, %159 : i1
        %197 = comb.mux %174, %157, %csb_q : i1
        %198 = comb.or %25, %197 : i1
        fsm.update %csb_q, %198 : i1
        fsm.update %u_sck_flop2Fq_o, %196 : i1
        fsm.update %sample_en_q2, %195 : i1
        fsm.update %sample_en_q, %194 : i1
        fsm.update %segment_rd_en_cpha1, %191 : i1
        fsm.update %cmd_len_q, %189 : i20
        fsm.update %cmd_speed_q, %188 : i2
        fsm.update %cmd_wr_en_q, %186 : i1
        fsm.update %cmd_rd_en_q, %187 : i1
        fsm.update %csaat_q, %185 : i1
        fsm.update %clkdiv_q, %184 : i16
        fsm.update %csntrail_q, %183 : i4
        fsm.update %csnlead_q, %182 : i4
        fsm.update %csnidle_q, %181 : i4
        fsm.update %full_cyc_q, %180 : i1
        fsm.update %cpha_q, %179 : i1
        fsm.update %cpol_q, %178 : i1
        fsm.update %csid_q, %177 : i1
      }
      fsm.transition @state_2 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
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
        %c-1_i3_0 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.and %arg1, %10 : i1
        %13 = comb.mux %12, %6, %9 : i3
        %14 = comb.mux %arg18, %c0_i3, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.and %10, %15 : i1
        %17 = comb.mux %16, %c-1_i3_0, %14 : i3
        %18 = comb.xor %16, %true : i1
        %19 = comb.icmp ne %17, %c-1_i3_0 : i3
        %20 = comb.and %10, %19 : i1
        %true_1 = hw.constant true
        %21 = comb.xor %12, %true_1 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %16, %true_3 : i1
        %24 = comb.and %23, %22, %21, %8 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %16, %true_6 : i1
        %28 = comb.and %27, %26, %12, %5, %25, %11 : i1
        %29 = comb.or %24, %28 : i1
        %30 = comb.and %20, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %32 = comb.xor %16, %true_8 : i1
        %33 = comb.and %20, %32, %31, %12, %5, %cpha_q, %11 : i1
        %34 = comb.and %arg15, %18, %12, %7 : i1
        %35 = comb.mux %34, %arg14, %csid_q : i1
        %36 = comb.mux %34, %arg12, %cpha_q : i1
        %37 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %38 = comb.mux %34, %arg4, %cmd_rd_en_q : i1
        %39 = comb.mux %34, %arg2, %cmd_speed_q : i2
        %40 = comb.xor %36, %true : i1
        %41 = comb.mux %40, %30, %33 : i1
        %42 = comb.icmp eq %arg2, %c0_i2 : i2
        %43 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %44 = comb.mux %34, %42, %43 : i1
        %45 = comb.and %38, %37 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %44, %46 : i1
        verif.assert %47 : i1
        %48 = comb.icmp ne %39, %c-1_i2 : i2
        verif.assert %48 : i1
        %49 = comb.xor %35, %true : i1
        verif.assert %49 : i1
        %50 = comb.and %41, %37, %0 : i1
        %51 = comb.or %50, %16 : i1
        %true_9 = hw.constant true
        %52 = comb.xor %cpha_q, %true_9 : i1
        %true_10 = hw.constant true
        %53 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %54 = comb.xor %51, %true_11 : i1
        %55 = comb.and %54, %53, %12, %5, %52 : i1
        fsm.return %55
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %arg1, %10 : i1
        %12 = comb.mux %11, %6, %9 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %arg1, %true : i1
        %15 = comb.and %10, %14 : i1
        %16 = comb.xor %15, %true : i1
        %c-1_i3_0 = hw.constant -1 : i3
        %17 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %18 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %19 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %20 = comb.or %arg18, %arg1 : i1
        %21 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %22 = comb.and %cmd_wr_en_q, %17 : i1
        %23 = comb.or %22, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %23 : i1
        %24 = comb.and %arg15, %16, %11, %7 : i1
        %25 = comb.mux %24, %arg14, %csid_q : i1
        %26 = comb.mux %24, %arg13, %cpol_q : i1
        %27 = comb.mux %24, %arg12, %cpha_q : i1
        %28 = comb.mux %24, %arg8, %csnidle_q : i4
        %29 = comb.mux %24, %arg9, %csnlead_q : i4
        %30 = comb.mux %24, %arg10, %csntrail_q : i4
        %31 = comb.mux %24, %arg3, %cmd_wr_en_q : i1
        %32 = comb.mux %24, %arg4, %cmd_rd_en_q : i1
        %33 = comb.mux %24, %arg2, %cmd_speed_q : i2
        %34 = comb.mux %24, %arg7, %clk_cntr_q : i16
        %35 = comb.mux %arg18, %c0_i16, %34 : i16
        %36 = comb.mux %15, %c-1_i3_0, %13 : i3
        %37 = comb.icmp ne %36, %c-1_i3_0 : i3
        %38 = comb.and %10, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %11, %true_1 : i1
        %true_2 = hw.constant true
        %40 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %41 = comb.xor %15, %true_3 : i1
        %42 = comb.and %41, %40, %39, %8 : i1
        %true_4 = hw.constant true
        %43 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %44 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %45 = comb.xor %15, %true_6 : i1
        %46 = comb.and %45, %44, %11, %5, %43 : i1
        %47 = comb.and %46, %17 : i1
        %48 = comb.or %42, %47 : i1
        %49 = comb.and %38, %48 : i1
        %50 = comb.and %38, %46, %18 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %15, %true_8 : i1
        %53 = comb.and %52, %51, %11, %5, %cpha_q : i1
        %54 = comb.and %38, %53, %17 : i1
        %55 = comb.and %38, %53, %18 : i1
        %56 = comb.xor %27, %true : i1
        %57 = comb.mux %56, %49, %54 : i1
        %58 = comb.mux %56, %50, %55 : i1
        %59 = comb.xor %32, %true : i1
        %60 = comb.xor %31, %true : i1
        %61 = comb.and %59, %60 : i1
        %62 = comb.icmp eq %arg2, %c0_i2 : i2
        %63 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %64 = comb.mux %24, %62, %63 : i1
        %65 = comb.icmp eq %arg2, %c1_i2 : i2
        %66 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %67 = comb.mux %24, %65, %66 : i1
        %68 = comb.icmp eq %arg2, %c-2_i2 : i2
        %69 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %70 = comb.mux %24, %68, %69 : i1
        %71 = comb.mux %70, %c-4_i3, %c1_i3 : i3
        %72 = comb.xor %61, %true : i1
        %73 = comb.xor %64, %true : i1
        %74 = comb.and %73, %72, %67 : i1
        %75 = comb.mux %74, %c2_i3, %71 : i3
        %76 = comb.mux %74, %c-2_i3, %71 : i3
        %77 = comb.and %72, %64 : i1
        %78 = comb.mux %77, %c1_i3, %75 : i3
        %79 = comb.mux %77, %c-1_i3, %76 : i3
        %80 = comb.mux %61, %c0_i3, %78 : i3
        %81 = comb.mux %61, %c0_i3, %79 : i3
        %82 = comb.sub %bit_cntr_q, %80 : i3
        %83 = comb.mux %58, %82, %bit_cntr_q : i3
        %84 = comb.mux %57, %81, %83 : i3
        %85 = comb.mux %14, %bit_cntr_q, %84 : i3
        %86 = comb.mux %arg18, %c0_i3, %85 : i3
        %87 = comb.mux %24, %arg5, %byte_cntr_cpha0_q : i20
        %88 = comb.mux %arg18, %c0_i20, %87 : i20
        %89 = comb.mux %24, %arg5, %byte_cntr_cpha1_q : i20
        %90 = comb.mux %arg18, %c0_i20, %89 : i20
        %true_9 = hw.constant true
        %91 = comb.xor %11, %true_9 : i1
        %true_10 = hw.constant true
        %92 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %93 = comb.xor %15, %true_11 : i1
        %94 = comb.and %93, %92, %91, %8 : i1
        %95 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_12 = hw.constant 0 : i2
        %96 = comb.icmp eq %95, %c0_i2_12 : i2
        %true_13 = hw.constant true
        %97 = comb.xor %5, %true_13 : i1
        %true_14 = hw.constant true
        %98 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %99 = comb.xor %15, %true_15 : i1
        %100 = comb.and %99, %98, %11, %97, %96 : i1
        %101 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_16 = hw.constant 1 : i2
        %102 = comb.icmp eq %101, %c1_i2_16 : i2
        %true_17 = hw.constant true
        %103 = comb.xor %5, %true_17 : i1
        %true_18 = hw.constant true
        %104 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %105 = comb.xor %15, %true_19 : i1
        %106 = comb.and %105, %104, %11, %103, %102 : i1
        %107 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_20 = hw.constant -2 : i2
        %108 = comb.icmp eq %107, %c-2_i2_20 : i2
        %true_21 = hw.constant true
        %109 = comb.xor %5, %true_21 : i1
        %110 = comb.and %109, %108 : i1
        %true_22 = hw.constant true
        %111 = comb.xor %8, %true_22 : i1
        %112 = comb.mux %11, %110, %111 : i1
        %true_23 = hw.constant true
        %113 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %114 = comb.xor %15, %true_24 : i1
        %115 = comb.and %37, %11 : i1
        %116 = comb.xor %94, %true : i1
        %117 = comb.and %116, %115 : i1
        %118 = comb.xor %100, %true : i1
        %119 = comb.and %118, %117 : i1
        %120 = comb.xor %106, %true : i1
        %121 = comb.and %120, %119, %114, %113, %112 : i1
        %122 = comb.and %119, %106 : i1
        %123 = comb.or %122, %121 : i1
        %124 = comb.mux %123, %28, %c0_i4 : i4
        %125 = comb.and %117, %100 : i1
        %126 = comb.mux %125, %30, %124 : i4
        %127 = comb.and %115, %94 : i1
        %128 = comb.mux %127, %29, %126 : i4
        %129 = comb.mux %20, %128, %wait_cntr_q : i4
        %130 = comb.mux %arg18, %c0_i4, %129 : i4
        %131 = comb.xor %37, %true : i1
        %132 = comb.and %21, %131, %11 : i1
        %133 = comb.mux %132, %19, %130 : i4
        %true_25 = hw.constant true
        %134 = comb.xor %cpha_q, %true_25 : i1
        %true_26 = hw.constant true
        %135 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %136 = comb.xor %15, %true_27 : i1
        %137 = comb.and %136, %135, %11, %5, %134 : i1
        %true_28 = hw.constant true
        %138 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %139 = comb.xor %15, %true_29 : i1
        %140 = comb.and %139, %138, %11, %5, %cpha_q : i1
        %141 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2_30 = hw.constant -1 : i2
        %142 = comb.icmp eq %141, %c-1_i2_30 : i2
        %true_31 = hw.constant true
        %143 = comb.xor %5, %true_31 : i1
        %true_32 = hw.constant true
        %144 = comb.xor %arg18, %true_32 : i1
        %145 = comb.and %144, %11, %143, %142 : i1
        %146 = comb.or %15, %145 : i1
        %147 = comb.icmp ne %36, %c-4_i3 : i3
        %148 = comb.xor %137, %true : i1
        %149 = comb.and %148, %116 : i1
        %150 = comb.xor %140, %true : i1
        %151 = comb.and %150, %149, %146 : i1
        %152 = comb.xor %151, %true : i1
        %153 = comb.and %149, %140 : i1
        %154 = comb.xor %153, %true : i1
        %155 = comb.and %116, %137 : i1
        %156 = comb.xor %155, %true : i1
        %157 = comb.and %116, %156, %154, %152, %147 : i1
        %158 = comb.icmp ne %36, %c3_i3 : i3
        %159 = comb.mux %26, %158, %53 : i1
        %160 = comb.icmp eq %arg2, %c0_i2 : i2
        %161 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %162 = comb.mux %24, %160, %161 : i1
        %163 = comb.and %32, %31 : i1
        %164 = comb.xor %163, %true : i1
        %165 = comb.or %162, %164 : i1
        verif.assert %165 : i1
        %166 = comb.icmp ne %33, %c-1_i2 : i2
        verif.assert %166 : i1
        %167 = comb.xor %25, %true : i1
        verif.assert %167 : i1
        %168 = comb.and %57, %31, %0 : i1
        %169 = comb.mux %168, %clk_cntr_q, %35 : i16
        %170 = comb.mux %168, %bit_cntr_q, %86 : i3
        %171 = comb.mux %168, %byte_cntr_cpha0_q, %88 : i20
        %172 = comb.mux %168, %byte_cntr_cpha1_q, %90 : i20
        %173 = comb.mux %168, %wait_cntr_q, %133 : i4
        fsm.update %wait_cntr_q, %173 : i4
        fsm.update %byte_cntr_cpha1_q, %172 : i20
        fsm.update %byte_cntr_cpha0_q, %171 : i20
        fsm.update %bit_cntr_q, %170 : i3
        fsm.update %clk_cntr_q, %169 : i16
        %174 = comb.xor %168, %true : i1
        %175 = comb.and %58, %174 : i1
        %176 = comb.and %24, %174 : i1
        %177 = comb.mux %176, %arg14, %csid_q : i1
        %178 = comb.mux %176, %arg13, %cpol_q : i1
        %179 = comb.mux %176, %arg12, %cpha_q : i1
        %180 = comb.mux %176, %arg11, %full_cyc_q : i1
        %181 = comb.mux %176, %arg8, %csnidle_q : i4
        %182 = comb.mux %176, %arg9, %csnlead_q : i4
        %183 = comb.mux %176, %arg10, %csntrail_q : i4
        %184 = comb.mux %176, %arg7, %clkdiv_q : i16
        %185 = comb.mux %176, %arg6, %csaat_q : i1
        %186 = comb.mux %176, %arg3, %cmd_wr_en_q : i1
        %187 = comb.mux %176, %arg4, %cmd_rd_en_q : i1
        %188 = comb.mux %176, %arg2, %cmd_speed_q : i2
        %189 = comb.mux %176, %arg5, %cmd_len_q : i20
        %190 = comb.and %37, %174 : i1
        %191 = comb.mux bin %190, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %192 = comb.or %57, %175 : i1
        %193 = comb.and %arg1, %174 : i1
        %194 = comb.mux %193, %192, %sample_en_q : i1
        %195 = comb.mux %193, %sample_en_q, %sample_en_q2 : i1
        %196 = comb.mux bin %168, %u_sck_flop2Fq_o, %159 : i1
        %197 = comb.mux %174, %157, %csb_q : i1
        %198 = comb.or %25, %197 : i1
        fsm.update %csb_q, %198 : i1
        fsm.update %u_sck_flop2Fq_o, %196 : i1
        fsm.update %sample_en_q2, %195 : i1
        fsm.update %sample_en_q, %194 : i1
        fsm.update %segment_rd_en_cpha1, %191 : i1
        fsm.update %cmd_len_q, %189 : i20
        fsm.update %cmd_speed_q, %188 : i2
        fsm.update %cmd_wr_en_q, %186 : i1
        fsm.update %cmd_rd_en_q, %187 : i1
        fsm.update %csaat_q, %185 : i1
        fsm.update %clkdiv_q, %184 : i16
        fsm.update %csntrail_q, %183 : i4
        fsm.update %csnlead_q, %182 : i4
        fsm.update %csnidle_q, %181 : i4
        fsm.update %full_cyc_q, %180 : i1
        fsm.update %cpha_q, %179 : i1
        fsm.update %cpol_q, %178 : i1
        fsm.update %csid_q, %177 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-1_i3 = hw.constant -1 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-4_i3 = hw.constant -4 : i3
        %c1_i2 = hw.constant 1 : i2
        %c-1_i2 = hw.constant -1 : i2
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
        %c-1_i3_0 = hw.constant -1 : i3
        %11 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %12 = comb.and %arg1, %10 : i1
        %13 = comb.mux %12, %6, %9 : i3
        %14 = comb.mux %arg18, %c0_i3, %13 : i3
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.and %10, %15 : i1
        %17 = comb.mux %16, %c-1_i3_0, %14 : i3
        %18 = comb.xor %16, %true : i1
        %19 = comb.icmp ne %17, %c-1_i3_0 : i3
        %20 = comb.and %10, %19 : i1
        %true_1 = hw.constant true
        %21 = comb.xor %12, %true_1 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %16, %true_3 : i1
        %24 = comb.and %23, %22, %21, %8 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %16, %true_6 : i1
        %28 = comb.and %27, %26, %12, %5, %25, %11 : i1
        %29 = comb.or %24, %28 : i1
        %30 = comb.and %20, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %32 = comb.xor %16, %true_8 : i1
        %33 = comb.and %20, %32, %31, %12, %5, %cpha_q, %11 : i1
        %34 = comb.and %arg15, %18, %12, %7 : i1
        %35 = comb.mux %34, %arg14, %csid_q : i1
        %36 = comb.mux %34, %arg12, %cpha_q : i1
        %37 = comb.mux %34, %arg3, %cmd_wr_en_q : i1
        %38 = comb.mux %34, %arg4, %cmd_rd_en_q : i1
        %39 = comb.mux %34, %arg2, %cmd_speed_q : i2
        %40 = comb.xor %36, %true : i1
        %41 = comb.mux %40, %30, %33 : i1
        %42 = comb.icmp eq %arg2, %c0_i2 : i2
        %43 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %44 = comb.mux %34, %42, %43 : i1
        %45 = comb.and %38, %37 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %44, %46 : i1
        verif.assert %47 : i1
        %48 = comb.icmp ne %39, %c-1_i2 : i2
        verif.assert %48 : i1
        %49 = comb.xor %35, %true : i1
        verif.assert %49 : i1
        %50 = comb.and %41, %37, %0 : i1
        %51 = comb.or %50, %16 : i1
        %true_9 = hw.constant true
        %52 = comb.xor %12, %true_9 : i1
        %true_10 = hw.constant true
        %53 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %54 = comb.xor %51, %true_11 : i1
        %55 = comb.and %54, %53, %52, %8 : i1
        fsm.return %55
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %arg1, %10 : i1
        %12 = comb.mux %11, %6, %9 : i3
        %13 = comb.mux %arg18, %c0_i3, %12 : i3
        %14 = comb.xor %arg1, %true : i1
        %15 = comb.and %10, %14 : i1
        %16 = comb.xor %15, %true : i1
        %c-1_i3_0 = hw.constant -1 : i3
        %17 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %18 = comb.icmp ne %bit_cntr_q, %c0_i3 : i3
        %19 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %20 = comb.or %arg18, %arg1 : i1
        %21 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %22 = comb.and %cmd_wr_en_q, %17 : i1
        %23 = comb.or %22, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %23 : i1
        %24 = comb.and %arg15, %16, %11, %7 : i1
        %25 = comb.mux %24, %arg14, %csid_q : i1
        %26 = comb.mux %24, %arg13, %cpol_q : i1
        %27 = comb.mux %24, %arg12, %cpha_q : i1
        %28 = comb.mux %24, %arg8, %csnidle_q : i4
        %29 = comb.mux %24, %arg9, %csnlead_q : i4
        %30 = comb.mux %24, %arg10, %csntrail_q : i4
        %31 = comb.mux %24, %arg3, %cmd_wr_en_q : i1
        %32 = comb.mux %24, %arg4, %cmd_rd_en_q : i1
        %33 = comb.mux %24, %arg2, %cmd_speed_q : i2
        %34 = comb.mux %24, %arg7, %clk_cntr_q : i16
        %35 = comb.mux %arg18, %c0_i16, %34 : i16
        %36 = comb.mux %15, %c-1_i3_0, %13 : i3
        %37 = comb.icmp ne %36, %c-1_i3_0 : i3
        %38 = comb.and %10, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %11, %true_1 : i1
        %true_2 = hw.constant true
        %40 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %41 = comb.xor %15, %true_3 : i1
        %42 = comb.and %41, %40, %39, %8 : i1
        %true_4 = hw.constant true
        %43 = comb.xor %cpha_q, %true_4 : i1
        %true_5 = hw.constant true
        %44 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %45 = comb.xor %15, %true_6 : i1
        %46 = comb.and %45, %44, %11, %5, %43 : i1
        %47 = comb.and %46, %17 : i1
        %48 = comb.or %42, %47 : i1
        %49 = comb.and %38, %48 : i1
        %50 = comb.and %38, %46, %18 : i1
        %true_7 = hw.constant true
        %51 = comb.xor %arg18, %true_7 : i1
        %true_8 = hw.constant true
        %52 = comb.xor %15, %true_8 : i1
        %53 = comb.and %52, %51, %11, %5, %cpha_q : i1
        %54 = comb.and %38, %53, %17 : i1
        %55 = comb.and %38, %53, %18 : i1
        %56 = comb.xor %27, %true : i1
        %57 = comb.mux %56, %49, %54 : i1
        %58 = comb.mux %56, %50, %55 : i1
        %59 = comb.xor %32, %true : i1
        %60 = comb.xor %31, %true : i1
        %61 = comb.and %59, %60 : i1
        %62 = comb.icmp eq %arg2, %c0_i2 : i2
        %63 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %64 = comb.mux %24, %62, %63 : i1
        %65 = comb.icmp eq %arg2, %c1_i2 : i2
        %66 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %67 = comb.mux %24, %65, %66 : i1
        %68 = comb.icmp eq %arg2, %c-2_i2 : i2
        %69 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %70 = comb.mux %24, %68, %69 : i1
        %71 = comb.mux %70, %c-4_i3, %c1_i3 : i3
        %72 = comb.xor %61, %true : i1
        %73 = comb.xor %64, %true : i1
        %74 = comb.and %73, %72, %67 : i1
        %75 = comb.mux %74, %c2_i3, %71 : i3
        %76 = comb.mux %74, %c-2_i3, %71 : i3
        %77 = comb.and %72, %64 : i1
        %78 = comb.mux %77, %c1_i3, %75 : i3
        %79 = comb.mux %77, %c-1_i3, %76 : i3
        %80 = comb.mux %61, %c0_i3, %78 : i3
        %81 = comb.mux %61, %c0_i3, %79 : i3
        %82 = comb.sub %bit_cntr_q, %80 : i3
        %83 = comb.mux %58, %82, %bit_cntr_q : i3
        %84 = comb.mux %57, %81, %83 : i3
        %85 = comb.mux %14, %bit_cntr_q, %84 : i3
        %86 = comb.mux %arg18, %c0_i3, %85 : i3
        %87 = comb.mux %24, %arg5, %byte_cntr_cpha0_q : i20
        %88 = comb.mux %arg18, %c0_i20, %87 : i20
        %89 = comb.mux %24, %arg5, %byte_cntr_cpha1_q : i20
        %90 = comb.mux %arg18, %c0_i20, %89 : i20
        %true_9 = hw.constant true
        %91 = comb.xor %11, %true_9 : i1
        %true_10 = hw.constant true
        %92 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %93 = comb.xor %15, %true_11 : i1
        %94 = comb.and %93, %92, %91, %8 : i1
        %95 = comb.extract %3 from 0 : (i3) -> i2
        %c0_i2_12 = hw.constant 0 : i2
        %96 = comb.icmp eq %95, %c0_i2_12 : i2
        %true_13 = hw.constant true
        %97 = comb.xor %5, %true_13 : i1
        %true_14 = hw.constant true
        %98 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %99 = comb.xor %15, %true_15 : i1
        %100 = comb.and %99, %98, %11, %97, %96 : i1
        %101 = comb.extract %3 from 0 : (i3) -> i2
        %c1_i2_16 = hw.constant 1 : i2
        %102 = comb.icmp eq %101, %c1_i2_16 : i2
        %true_17 = hw.constant true
        %103 = comb.xor %5, %true_17 : i1
        %true_18 = hw.constant true
        %104 = comb.xor %arg18, %true_18 : i1
        %true_19 = hw.constant true
        %105 = comb.xor %15, %true_19 : i1
        %106 = comb.and %105, %104, %11, %103, %102 : i1
        %107 = comb.extract %3 from 0 : (i3) -> i2
        %c-2_i2_20 = hw.constant -2 : i2
        %108 = comb.icmp eq %107, %c-2_i2_20 : i2
        %true_21 = hw.constant true
        %109 = comb.xor %5, %true_21 : i1
        %110 = comb.and %109, %108 : i1
        %true_22 = hw.constant true
        %111 = comb.xor %8, %true_22 : i1
        %112 = comb.mux %11, %110, %111 : i1
        %true_23 = hw.constant true
        %113 = comb.xor %arg18, %true_23 : i1
        %true_24 = hw.constant true
        %114 = comb.xor %15, %true_24 : i1
        %115 = comb.and %37, %11 : i1
        %116 = comb.xor %94, %true : i1
        %117 = comb.and %116, %115 : i1
        %118 = comb.xor %100, %true : i1
        %119 = comb.and %118, %117 : i1
        %120 = comb.xor %106, %true : i1
        %121 = comb.and %120, %119, %114, %113, %112 : i1
        %122 = comb.and %119, %106 : i1
        %123 = comb.or %122, %121 : i1
        %124 = comb.mux %123, %28, %c0_i4 : i4
        %125 = comb.and %117, %100 : i1
        %126 = comb.mux %125, %30, %124 : i4
        %127 = comb.and %115, %94 : i1
        %128 = comb.mux %127, %29, %126 : i4
        %129 = comb.mux %20, %128, %wait_cntr_q : i4
        %130 = comb.mux %arg18, %c0_i4, %129 : i4
        %131 = comb.xor %37, %true : i1
        %132 = comb.and %21, %131, %11 : i1
        %133 = comb.mux %132, %19, %130 : i4
        %true_25 = hw.constant true
        %134 = comb.xor %cpha_q, %true_25 : i1
        %true_26 = hw.constant true
        %135 = comb.xor %arg18, %true_26 : i1
        %true_27 = hw.constant true
        %136 = comb.xor %15, %true_27 : i1
        %137 = comb.and %136, %135, %11, %5, %134 : i1
        %true_28 = hw.constant true
        %138 = comb.xor %arg18, %true_28 : i1
        %true_29 = hw.constant true
        %139 = comb.xor %15, %true_29 : i1
        %140 = comb.and %139, %138, %11, %5, %cpha_q : i1
        %141 = comb.extract %3 from 0 : (i3) -> i2
        %c-1_i2_30 = hw.constant -1 : i2
        %142 = comb.icmp eq %141, %c-1_i2_30 : i2
        %true_31 = hw.constant true
        %143 = comb.xor %5, %true_31 : i1
        %true_32 = hw.constant true
        %144 = comb.xor %arg18, %true_32 : i1
        %145 = comb.and %144, %11, %143, %142 : i1
        %146 = comb.or %15, %145 : i1
        %147 = comb.icmp ne %36, %c-4_i3 : i3
        %148 = comb.xor %137, %true : i1
        %149 = comb.and %148, %116 : i1
        %150 = comb.xor %140, %true : i1
        %151 = comb.and %150, %149, %146 : i1
        %152 = comb.xor %151, %true : i1
        %153 = comb.and %149, %140 : i1
        %154 = comb.xor %153, %true : i1
        %155 = comb.and %116, %137 : i1
        %156 = comb.xor %155, %true : i1
        %157 = comb.and %116, %156, %154, %152, %147 : i1
        %158 = comb.icmp ne %36, %c3_i3 : i3
        %159 = comb.mux %26, %158, %53 : i1
        %160 = comb.icmp eq %arg2, %c0_i2 : i2
        %161 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %162 = comb.mux %24, %160, %161 : i1
        %163 = comb.and %32, %31 : i1
        %164 = comb.xor %163, %true : i1
        %165 = comb.or %162, %164 : i1
        verif.assert %165 : i1
        %166 = comb.icmp ne %33, %c-1_i2 : i2
        verif.assert %166 : i1
        %167 = comb.xor %25, %true : i1
        verif.assert %167 : i1
        %168 = comb.and %57, %31, %0 : i1
        %169 = comb.mux %168, %clk_cntr_q, %35 : i16
        %170 = comb.mux %168, %bit_cntr_q, %86 : i3
        %171 = comb.mux %168, %byte_cntr_cpha0_q, %88 : i20
        %172 = comb.mux %168, %byte_cntr_cpha1_q, %90 : i20
        %173 = comb.mux %168, %wait_cntr_q, %133 : i4
        fsm.update %wait_cntr_q, %173 : i4
        fsm.update %byte_cntr_cpha1_q, %172 : i20
        fsm.update %byte_cntr_cpha0_q, %171 : i20
        fsm.update %bit_cntr_q, %170 : i3
        fsm.update %clk_cntr_q, %169 : i16
        %174 = comb.xor %168, %true : i1
        %175 = comb.and %58, %174 : i1
        %176 = comb.and %24, %174 : i1
        %177 = comb.mux %176, %arg14, %csid_q : i1
        %178 = comb.mux %176, %arg13, %cpol_q : i1
        %179 = comb.mux %176, %arg12, %cpha_q : i1
        %180 = comb.mux %176, %arg11, %full_cyc_q : i1
        %181 = comb.mux %176, %arg8, %csnidle_q : i4
        %182 = comb.mux %176, %arg9, %csnlead_q : i4
        %183 = comb.mux %176, %arg10, %csntrail_q : i4
        %184 = comb.mux %176, %arg7, %clkdiv_q : i16
        %185 = comb.mux %176, %arg6, %csaat_q : i1
        %186 = comb.mux %176, %arg3, %cmd_wr_en_q : i1
        %187 = comb.mux %176, %arg4, %cmd_rd_en_q : i1
        %188 = comb.mux %176, %arg2, %cmd_speed_q : i2
        %189 = comb.mux %176, %arg5, %cmd_len_q : i20
        %190 = comb.and %37, %174 : i1
        %191 = comb.mux bin %190, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %192 = comb.or %57, %175 : i1
        %193 = comb.and %arg1, %174 : i1
        %194 = comb.mux %193, %192, %sample_en_q : i1
        %195 = comb.mux %193, %sample_en_q, %sample_en_q2 : i1
        %196 = comb.mux bin %168, %u_sck_flop2Fq_o, %159 : i1
        %197 = comb.mux %174, %157, %csb_q : i1
        %198 = comb.or %25, %197 : i1
        fsm.update %csb_q, %198 : i1
        fsm.update %u_sck_flop2Fq_o, %196 : i1
        fsm.update %sample_en_q2, %195 : i1
        fsm.update %sample_en_q, %194 : i1
        fsm.update %segment_rd_en_cpha1, %191 : i1
        fsm.update %cmd_len_q, %189 : i20
        fsm.update %cmd_speed_q, %188 : i2
        fsm.update %cmd_wr_en_q, %186 : i1
        fsm.update %cmd_rd_en_q, %187 : i1
        fsm.update %csaat_q, %185 : i1
        fsm.update %clkdiv_q, %184 : i16
        fsm.update %csntrail_q, %183 : i4
        fsm.update %csnlead_q, %182 : i4
        fsm.update %csnidle_q, %181 : i4
        fsm.update %full_cyc_q, %180 : i1
        fsm.update %cpha_q, %179 : i1
        fsm.update %cpol_q, %178 : i1
        fsm.update %csid_q, %177 : i1
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
      %c-1_i2 = hw.constant -1 : i2
      %true = hw.constant true
      %false = hw.constant false
      %false_0 = hw.constant false
      %true_1 = hw.constant true
      %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %1 = comb.xor %arg16, %true : i1
      %false_2 = hw.constant false
      %2 = comb.and %arg1, %0 : i1
      %3 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
      %4 = comb.mux %3, %c1_i3, %c-2_i3 : i3
      %5 = comb.xor %arg18, %true : i1
      %6 = comb.and %2, %5 : i1
      %7 = comb.xor %2, %true : i1
      %8 = comb.and %5, %7 : i1
      %c-4_i3 = hw.constant -4 : i3
      %9 = comb.xor %cpha_q, %true : i1
      %false_3 = hw.constant false
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
      %33 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %34 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
      %35 = comb.xor %34, %true : i1
      %36 = comb.or %33, %35 : i1
      verif.assert %36 : i1
      %37 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
      verif.assert %37 : i1
      %38 = comb.xor %csid_q, %true : i1
      verif.assert %38 : i1
      %c-2_i2_4 = hw.constant -2 : i2
      %39 = comb.concat %c-2_i2_4, %3 : i2, i1
      %40 = comb.mux %6, %39, %4 : i3
      %41 = comb.mux %arg18, %c0_i3, %40 : i3
      %42 = comb.mux %8, %c-4_i3, %41 : i3
      %43 = comb.icmp ne %42, %c-4_i3 : i3
      %true_5 = hw.constant true
      %44 = comb.xor %6, %true_5 : i1
      %true_6 = hw.constant true
      %45 = comb.xor %arg18, %true_6 : i1
      %true_7 = hw.constant true
      %46 = comb.xor %8, %true_7 : i1
      %47 = comb.and %9, %5, %43, %46, %45, %44, %3, %cmd_wr_en_q : i1
      %48 = comb.and %47, %1 : i1
      %49 = comb.xor %48, %true : i1
      %50 = comb.and %47, %49 : i1
      %51 = comb.and %14, %49 : i1
      %false_8 = hw.constant false
      %52 = comb.and %13, %50, %arg16 : i1
      fsm.output %false_0, %u_sck_flop2Fq_o, %csb_q, %32, %false_3, %52, %50, %false, %51, %false_8, %cmd_speed_q, %full_cyc_q, %false_2, %48, %true_1 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.and %arg1, %0 : i1
        %6 = comb.and %5, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %7 = comb.concat %c-2_i2, %2 : i2, i1
        %8 = comb.mux %6, %7, %3 : i3
        %9 = comb.mux %arg18, %c0_i3, %8 : i3
        %10 = comb.xor %5, %true : i1
        %11 = comb.and %4, %10 : i1
        %12 = comb.mux %11, %c-4_i3, %9 : i3
        %13 = comb.icmp ne %12, %c-4_i3 : i3
        %true_0 = hw.constant true
        %14 = comb.xor %6, %true_0 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %11, %true_2 : i1
        %17 = comb.xor %cpha_q, %true : i1
        %18 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %19 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.or %18, %20 : i1
        verif.assert %21 : i1
        %22 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %22 : i1
        %23 = comb.xor %csid_q, %true : i1
        verif.assert %23 : i1
        %24 = comb.and %17, %4, %13, %16, %15, %14, %2, %cmd_wr_en_q, %1 : i1
        %25 = comb.or %24, %11 : i1
        %true_3 = hw.constant true
        %26 = comb.xor %2, %true_3 : i1
        %true_4 = hw.constant true
        %27 = comb.xor %6, %true_4 : i1
        %true_5 = hw.constant true
        %28 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %25, %true_6 : i1
        %30 = comb.and %29, %28, %27, %26 : i1
        fsm.return %30
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.xor %7, %true : i1
        %13 = comb.and %10, %12 : i1
        %c-4_i3_0 = hw.constant -4 : i3
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.xor %cpha_q, %true : i1
        %16 = comb.xor %cmd_rd_en_q, %true : i1
        %17 = comb.xor %cmd_wr_en_q, %true : i1
        %18 = comb.and %16, %17 : i1
        %19 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %20 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %22 = comb.mux %21, %c-4_i3, %c1_i3 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.xor %19, %true : i1
        %25 = comb.and %24, %23, %20 : i1
        %26 = comb.mux %25, %c-2_i3, %22 : i3
        %27 = comb.and %23, %19 : i1
        %28 = comb.mux %27, %c-1_i3, %26 : i3
        %29 = comb.mux %18, %c0_i3, %28 : i3
        %30 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %31 = comb.or %arg18, %7 : i1
        %32 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %33 = comb.and %cmd_wr_en_q, %14 : i1
        %34 = comb.or %33, %cmd_wr_en_last_bit : i1
        %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %36 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.or %35, %37 : i1
        verif.assert %38 : i1
        %39 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %39 : i1
        %40 = comb.xor %csid_q, %true : i1
        verif.assert %40 : i1
        fsm.update %cmd_wr_en_last_bit, %34 : i1
        %c-2_i2_1 = hw.constant -2 : i2
        %41 = comb.concat %c-2_i2_1, %8 : i2, i1
        %42 = comb.mux %11, %41, %9 : i3
        %43 = comb.mux %arg18, %c0_i3, %42 : i3
        %44 = comb.mux %13, %c-4_i3_0, %43 : i3
        %45 = comb.icmp ne %44, %c-4_i3_0 : i3
        %true_2 = hw.constant true
        %46 = comb.xor %11, %true_2 : i1
        %true_3 = hw.constant true
        %47 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %48 = comb.xor %13, %true_4 : i1
        %49 = comb.and %15, %10, %45, %48, %47, %46, %8 : i1
        %50 = comb.mux %49, %29, %bit_cntr_q : i3
        %51 = comb.mux %12, %bit_cntr_q, %50 : i3
        %52 = comb.mux %arg18, %c0_i3, %51 : i3
        %true_5 = hw.constant true
        %53 = comb.xor %11, %true_5 : i1
        %true_6 = hw.constant true
        %54 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %55 = comb.xor %13, %true_7 : i1
        %56 = comb.and %55, %54, %53, %8 : i1
        %true_8 = hw.constant true
        %57 = comb.xor %8, %true_8 : i1
        %true_9 = hw.constant true
        %58 = comb.xor %arg18, %true_9 : i1
        %59 = comb.and %58, %11, %57 : i1
        %60 = comb.or %13, %59 : i1
        %true_10 = hw.constant true
        %61 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %62 = comb.xor %13, %true_11 : i1
        %63 = comb.and %62, %61, %11, %8 : i1
        %true_12 = hw.constant true
        %64 = comb.xor %8, %true_12 : i1
        %true_13 = hw.constant true
        %65 = comb.xor %11, %true_13 : i1
        %true_14 = hw.constant true
        %66 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %67 = comb.xor %13, %true_15 : i1
        %68 = comb.and %45, %11 : i1
        %69 = comb.xor %56, %true : i1
        %70 = comb.and %69, %68 : i1
        %71 = comb.xor %60, %true : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.xor %63, %true : i1
        %74 = comb.and %73, %72, %67, %66, %65, %64 : i1
        %75 = comb.and %72, %63 : i1
        %76 = comb.or %75, %74 : i1
        %77 = comb.mux %76, %csnidle_q, %c0_i4 : i4
        %78 = comb.and %70, %60 : i1
        %79 = comb.mux %78, %csntrail_q, %77 : i4
        %80 = comb.and %68, %56 : i1
        %81 = comb.mux %80, %csnlead_q, %79 : i4
        %82 = comb.mux %31, %81, %wait_cntr_q : i4
        %83 = comb.mux %arg18, %c0_i4, %82 : i4
        %84 = comb.xor %45, %true : i1
        %85 = comb.and %32, %84, %11 : i1
        %86 = comb.mux %85, %30, %83 : i4
        %87 = comb.icmp ne %44, %c-4_i3 : i3
        %88 = comb.and %69, %87 : i1
        %89 = comb.icmp ne %44, %c3_i3 : i3
        %90 = comb.and %cpol_q, %89 : i1
        %91 = comb.and %49, %cmd_wr_en_q, %6 : i1
        %92 = comb.mux %91, %clk_cntr_q, %5 : i16
        %93 = comb.mux %91, %bit_cntr_q, %52 : i3
        %true_16 = hw.constant true
        %94 = comb.xor %arg18, %true_16 : i1
        %95 = comb.or %91, %94 : i1
        %96 = comb.mux %95, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_17 = hw.constant true
        %97 = comb.xor %arg18, %true_17 : i1
        %98 = comb.or %91, %97 : i1
        %99 = comb.mux %98, %byte_cntr_cpha1_q, %c0_i20 : i20
        %100 = comb.mux %91, %wait_cntr_q, %86 : i4
        fsm.update %wait_cntr_q, %100 : i4
        fsm.update %byte_cntr_cpha1_q, %99 : i20
        fsm.update %byte_cntr_cpha0_q, %96 : i20
        fsm.update %bit_cntr_q, %93 : i3
        fsm.update %clk_cntr_q, %92 : i16
        %101 = comb.xor %91, %true : i1
        %102 = comb.and %45, %101 : i1
        %103 = comb.mux bin %102, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %104 = comb.and %7, %101 : i1
        %105 = comb.mux %104, %49, %sample_en_q : i1
        %106 = comb.mux %104, %sample_en_q, %sample_en_q2 : i1
        %107 = comb.mux bin %91, %u_sck_flop2Fq_o, %90 : i1
        %108 = comb.mux %101, %88, %csb_q : i1
        %109 = comb.or %csid_q, %108 : i1
        fsm.update %csb_q, %109 : i1
        fsm.update %u_sck_flop2Fq_o, %107 : i1
        fsm.update %sample_en_q2, %106 : i1
        fsm.update %sample_en_q, %105 : i1
        fsm.update %segment_rd_en_cpha1, %103 : i1
      }
      fsm.transition @state_5 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.and %arg1, %0 : i1
        %6 = comb.and %5, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %7 = comb.concat %c-2_i2, %2 : i2, i1
        %8 = comb.mux %6, %7, %3 : i3
        %9 = comb.mux %arg18, %c0_i3, %8 : i3
        %10 = comb.xor %5, %true : i1
        %11 = comb.and %4, %10 : i1
        %12 = comb.mux %11, %c-4_i3, %9 : i3
        %13 = comb.icmp ne %12, %c-4_i3 : i3
        %true_0 = hw.constant true
        %14 = comb.xor %6, %true_0 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %11, %true_2 : i1
        %17 = comb.xor %cpha_q, %true : i1
        %18 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %19 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.or %18, %20 : i1
        verif.assert %21 : i1
        %22 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %22 : i1
        %23 = comb.xor %csid_q, %true : i1
        verif.assert %23 : i1
        %24 = comb.and %17, %4, %13, %16, %15, %14, %2, %cmd_wr_en_q, %1 : i1
        %25 = comb.or %24, %11 : i1
        %true_3 = hw.constant true
        %26 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %27 = comb.xor %25, %true_4 : i1
        %28 = comb.and %27, %26, %6, %2 : i1
        fsm.return %28
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.xor %7, %true : i1
        %13 = comb.and %10, %12 : i1
        %c-4_i3_0 = hw.constant -4 : i3
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.xor %cpha_q, %true : i1
        %16 = comb.xor %cmd_rd_en_q, %true : i1
        %17 = comb.xor %cmd_wr_en_q, %true : i1
        %18 = comb.and %16, %17 : i1
        %19 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %20 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %22 = comb.mux %21, %c-4_i3, %c1_i3 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.xor %19, %true : i1
        %25 = comb.and %24, %23, %20 : i1
        %26 = comb.mux %25, %c-2_i3, %22 : i3
        %27 = comb.and %23, %19 : i1
        %28 = comb.mux %27, %c-1_i3, %26 : i3
        %29 = comb.mux %18, %c0_i3, %28 : i3
        %30 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %31 = comb.or %arg18, %7 : i1
        %32 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %33 = comb.and %cmd_wr_en_q, %14 : i1
        %34 = comb.or %33, %cmd_wr_en_last_bit : i1
        %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %36 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.or %35, %37 : i1
        verif.assert %38 : i1
        %39 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %39 : i1
        %40 = comb.xor %csid_q, %true : i1
        verif.assert %40 : i1
        fsm.update %cmd_wr_en_last_bit, %34 : i1
        %c-2_i2_1 = hw.constant -2 : i2
        %41 = comb.concat %c-2_i2_1, %8 : i2, i1
        %42 = comb.mux %11, %41, %9 : i3
        %43 = comb.mux %arg18, %c0_i3, %42 : i3
        %44 = comb.mux %13, %c-4_i3_0, %43 : i3
        %45 = comb.icmp ne %44, %c-4_i3_0 : i3
        %true_2 = hw.constant true
        %46 = comb.xor %11, %true_2 : i1
        %true_3 = hw.constant true
        %47 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %48 = comb.xor %13, %true_4 : i1
        %49 = comb.and %15, %10, %45, %48, %47, %46, %8 : i1
        %50 = comb.and %7, %49 : i1
        %51 = comb.mux %50, %29, %bit_cntr_q : i3
        %52 = comb.mux %arg18, %c0_i3, %51 : i3
        %true_5 = hw.constant true
        %53 = comb.xor %11, %true_5 : i1
        %true_6 = hw.constant true
        %54 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %55 = comb.xor %13, %true_7 : i1
        %56 = comb.and %55, %54, %53, %8 : i1
        %true_8 = hw.constant true
        %57 = comb.xor %8, %true_8 : i1
        %true_9 = hw.constant true
        %58 = comb.xor %arg18, %true_9 : i1
        %59 = comb.and %58, %11, %57 : i1
        %60 = comb.or %13, %59 : i1
        %true_10 = hw.constant true
        %61 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %62 = comb.xor %13, %true_11 : i1
        %63 = comb.and %62, %61, %11, %8 : i1
        %true_12 = hw.constant true
        %64 = comb.xor %8, %true_12 : i1
        %true_13 = hw.constant true
        %65 = comb.xor %11, %true_13 : i1
        %true_14 = hw.constant true
        %66 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %67 = comb.xor %13, %true_15 : i1
        %68 = comb.and %45, %11 : i1
        %69 = comb.xor %56, %true : i1
        %70 = comb.and %69, %68 : i1
        %71 = comb.xor %60, %true : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.xor %63, %true : i1
        %74 = comb.and %73, %72, %67, %66, %65, %64 : i1
        %75 = comb.and %72, %63 : i1
        %76 = comb.or %75, %74 : i1
        %77 = comb.mux %76, %csnidle_q, %c0_i4 : i4
        %78 = comb.and %70, %60 : i1
        %79 = comb.mux %78, %csntrail_q, %77 : i4
        %80 = comb.and %68, %56 : i1
        %81 = comb.mux %80, %csnlead_q, %79 : i4
        %82 = comb.mux %31, %81, %wait_cntr_q : i4
        %83 = comb.mux %arg18, %c0_i4, %82 : i4
        %84 = comb.xor %45, %true : i1
        %85 = comb.and %32, %84, %11 : i1
        %86 = comb.mux %85, %30, %83 : i4
        %87 = comb.icmp ne %44, %c-4_i3 : i3
        %88 = comb.and %69, %87 : i1
        %89 = comb.icmp ne %44, %c3_i3 : i3
        %90 = comb.and %cpol_q, %89 : i1
        %91 = comb.and %49, %cmd_wr_en_q, %6 : i1
        %92 = comb.mux %91, %clk_cntr_q, %5 : i16
        %93 = comb.mux %91, %bit_cntr_q, %52 : i3
        %true_16 = hw.constant true
        %94 = comb.xor %arg18, %true_16 : i1
        %95 = comb.or %91, %94 : i1
        %96 = comb.mux %95, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_17 = hw.constant true
        %97 = comb.xor %arg18, %true_17 : i1
        %98 = comb.or %91, %97 : i1
        %99 = comb.mux %98, %byte_cntr_cpha1_q, %c0_i20 : i20
        %100 = comb.mux %91, %wait_cntr_q, %86 : i4
        fsm.update %wait_cntr_q, %100 : i4
        fsm.update %byte_cntr_cpha1_q, %99 : i20
        fsm.update %byte_cntr_cpha0_q, %96 : i20
        fsm.update %bit_cntr_q, %93 : i3
        fsm.update %clk_cntr_q, %92 : i16
        %101 = comb.xor %91, %true : i1
        %102 = comb.and %45, %101 : i1
        %103 = comb.mux bin %102, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %104 = comb.and %7, %101 : i1
        %105 = comb.mux %104, %49, %sample_en_q : i1
        %106 = comb.mux %104, %sample_en_q, %sample_en_q2 : i1
        %107 = comb.mux bin %91, %u_sck_flop2Fq_o, %90 : i1
        %108 = comb.mux %101, %88, %csb_q : i1
        %109 = comb.or %csid_q, %108 : i1
        fsm.update %csb_q, %109 : i1
        fsm.update %u_sck_flop2Fq_o, %107 : i1
        fsm.update %sample_en_q2, %106 : i1
        fsm.update %sample_en_q, %105 : i1
        fsm.update %segment_rd_en_cpha1, %103 : i1
      }
      fsm.transition @state_4 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.and %arg1, %0 : i1
        %6 = comb.and %5, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %7 = comb.concat %c-2_i2, %2 : i2, i1
        %8 = comb.mux %6, %7, %3 : i3
        %9 = comb.mux %arg18, %c0_i3, %8 : i3
        %10 = comb.xor %5, %true : i1
        %11 = comb.and %4, %10 : i1
        %12 = comb.mux %11, %c-4_i3, %9 : i3
        %13 = comb.icmp ne %12, %c-4_i3 : i3
        %true_0 = hw.constant true
        %14 = comb.xor %6, %true_0 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %11, %true_2 : i1
        %17 = comb.xor %cpha_q, %true : i1
        %18 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %19 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.or %18, %20 : i1
        verif.assert %21 : i1
        %22 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %22 : i1
        %23 = comb.xor %csid_q, %true : i1
        verif.assert %23 : i1
        %24 = comb.and %17, %4, %13, %16, %15, %14, %2, %cmd_wr_en_q, %1 : i1
        %true_3 = hw.constant true
        %25 = comb.xor %2, %true_3 : i1
        %true_4 = hw.constant true
        %26 = comb.xor %arg18, %true_4 : i1
        %27 = comb.and %26, %6, %25 : i1
        %28 = comb.or %24, %11, %27 : i1
        fsm.return %28
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.xor %7, %true : i1
        %13 = comb.and %10, %12 : i1
        %c-4_i3_0 = hw.constant -4 : i3
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.xor %cpha_q, %true : i1
        %16 = comb.xor %cmd_rd_en_q, %true : i1
        %17 = comb.xor %cmd_wr_en_q, %true : i1
        %18 = comb.and %16, %17 : i1
        %19 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %20 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %22 = comb.mux %21, %c-4_i3, %c1_i3 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.xor %19, %true : i1
        %25 = comb.and %24, %23, %20 : i1
        %26 = comb.mux %25, %c-2_i3, %22 : i3
        %27 = comb.and %23, %19 : i1
        %28 = comb.mux %27, %c-1_i3, %26 : i3
        %29 = comb.mux %18, %c0_i3, %28 : i3
        %30 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %31 = comb.or %arg18, %7 : i1
        %32 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %33 = comb.and %cmd_wr_en_q, %14 : i1
        %34 = comb.or %33, %cmd_wr_en_last_bit : i1
        %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %36 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.or %35, %37 : i1
        verif.assert %38 : i1
        %39 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %39 : i1
        %40 = comb.xor %csid_q, %true : i1
        verif.assert %40 : i1
        fsm.update %cmd_wr_en_last_bit, %34 : i1
        %c-2_i2_1 = hw.constant -2 : i2
        %41 = comb.concat %c-2_i2_1, %8 : i2, i1
        %42 = comb.mux %11, %41, %9 : i3
        %43 = comb.mux %arg18, %c0_i3, %42 : i3
        %44 = comb.mux %13, %c-4_i3_0, %43 : i3
        %45 = comb.icmp ne %44, %c-4_i3_0 : i3
        %true_2 = hw.constant true
        %46 = comb.xor %11, %true_2 : i1
        %true_3 = hw.constant true
        %47 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %48 = comb.xor %13, %true_4 : i1
        %49 = comb.and %15, %10, %45, %48, %47, %46, %8 : i1
        %50 = comb.and %7, %49 : i1
        %51 = comb.mux %50, %29, %bit_cntr_q : i3
        %52 = comb.mux %arg18, %c0_i3, %51 : i3
        %true_5 = hw.constant true
        %53 = comb.xor %11, %true_5 : i1
        %true_6 = hw.constant true
        %54 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %55 = comb.xor %13, %true_7 : i1
        %56 = comb.and %55, %54, %53, %8 : i1
        %true_8 = hw.constant true
        %57 = comb.xor %8, %true_8 : i1
        %true_9 = hw.constant true
        %58 = comb.xor %arg18, %true_9 : i1
        %59 = comb.and %58, %11, %57 : i1
        %60 = comb.or %13, %59 : i1
        %true_10 = hw.constant true
        %61 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %62 = comb.xor %13, %true_11 : i1
        %63 = comb.and %62, %61, %11, %8 : i1
        %true_12 = hw.constant true
        %64 = comb.xor %8, %true_12 : i1
        %true_13 = hw.constant true
        %65 = comb.xor %11, %true_13 : i1
        %true_14 = hw.constant true
        %66 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %67 = comb.xor %13, %true_15 : i1
        %68 = comb.and %45, %11 : i1
        %69 = comb.xor %56, %true : i1
        %70 = comb.and %69, %68 : i1
        %71 = comb.xor %60, %true : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.xor %63, %true : i1
        %74 = comb.and %73, %72, %67, %66, %65, %64 : i1
        %75 = comb.and %72, %63 : i1
        %76 = comb.or %75, %74 : i1
        %77 = comb.mux %76, %csnidle_q, %c0_i4 : i4
        %78 = comb.and %70, %60 : i1
        %79 = comb.mux %78, %csntrail_q, %77 : i4
        %80 = comb.and %68, %56 : i1
        %81 = comb.mux %80, %csnlead_q, %79 : i4
        %82 = comb.mux %31, %81, %wait_cntr_q : i4
        %83 = comb.mux %arg18, %c0_i4, %82 : i4
        %84 = comb.xor %45, %true : i1
        %85 = comb.and %32, %84, %11 : i1
        %86 = comb.mux %85, %30, %83 : i4
        %87 = comb.icmp ne %44, %c-4_i3 : i3
        %88 = comb.and %69, %87 : i1
        %89 = comb.icmp ne %44, %c3_i3 : i3
        %90 = comb.and %cpol_q, %89 : i1
        %91 = comb.and %49, %cmd_wr_en_q, %6 : i1
        %92 = comb.mux %91, %clk_cntr_q, %5 : i16
        %93 = comb.mux %91, %bit_cntr_q, %52 : i3
        %true_16 = hw.constant true
        %94 = comb.xor %arg18, %true_16 : i1
        %95 = comb.or %91, %94 : i1
        %96 = comb.mux %95, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_17 = hw.constant true
        %97 = comb.xor %arg18, %true_17 : i1
        %98 = comb.or %91, %97 : i1
        %99 = comb.mux %98, %byte_cntr_cpha1_q, %c0_i20 : i20
        %100 = comb.mux %91, %wait_cntr_q, %86 : i4
        fsm.update %wait_cntr_q, %100 : i4
        fsm.update %byte_cntr_cpha1_q, %99 : i20
        fsm.update %byte_cntr_cpha0_q, %96 : i20
        fsm.update %bit_cntr_q, %93 : i3
        fsm.update %clk_cntr_q, %92 : i16
        %101 = comb.xor %91, %true : i1
        %102 = comb.and %45, %101 : i1
        %103 = comb.mux bin %102, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %104 = comb.and %7, %101 : i1
        %105 = comb.mux %104, %49, %sample_en_q : i1
        %106 = comb.mux %104, %sample_en_q, %sample_en_q2 : i1
        %107 = comb.mux bin %91, %u_sck_flop2Fq_o, %90 : i1
        %108 = comb.mux %101, %88, %csb_q : i1
        %109 = comb.or %csid_q, %108 : i1
        fsm.update %csb_q, %109 : i1
        fsm.update %u_sck_flop2Fq_o, %107 : i1
        fsm.update %sample_en_q2, %106 : i1
        fsm.update %sample_en_q, %105 : i1
        fsm.update %segment_rd_en_cpha1, %103 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
        %true = hw.constant true
        %0 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
        %1 = comb.xor %arg16, %true : i1
        %2 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %3 = comb.mux %2, %c1_i3, %c-2_i3 : i3
        %4 = comb.xor %arg18, %true : i1
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.and %arg1, %0 : i1
        %6 = comb.and %5, %4 : i1
        %c-2_i2 = hw.constant -2 : i2
        %7 = comb.concat %c-2_i2, %2 : i2, i1
        %8 = comb.mux %6, %7, %3 : i3
        %9 = comb.mux %arg18, %c0_i3, %8 : i3
        %10 = comb.xor %5, %true : i1
        %11 = comb.and %4, %10 : i1
        %12 = comb.mux %11, %c-4_i3, %9 : i3
        %13 = comb.icmp ne %12, %c-4_i3 : i3
        %true_0 = hw.constant true
        %14 = comb.xor %6, %true_0 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %arg18, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %11, %true_2 : i1
        %17 = comb.xor %cpha_q, %true : i1
        %18 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %19 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.or %18, %20 : i1
        verif.assert %21 : i1
        %22 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %22 : i1
        %23 = comb.xor %csid_q, %true : i1
        verif.assert %23 : i1
        %24 = comb.and %17, %4, %13, %16, %15, %14, %2, %cmd_wr_en_q, %1 : i1
        %25 = comb.or %24, %11 : i1
        %true_3 = hw.constant true
        %26 = comb.xor %6, %true_3 : i1
        %true_4 = hw.constant true
        %27 = comb.xor %arg18, %true_4 : i1
        %true_5 = hw.constant true
        %28 = comb.xor %25, %true_5 : i1
        %29 = comb.and %28, %27, %26, %2 : i1
        fsm.return %29
      } action {
        fsm.update %cmd_len_q, %cmd_len_q : i20
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
        %c-1_i2 = hw.constant -1 : i2
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
        %8 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %9 = comb.mux %8, %c1_i3, %c-2_i3 : i3
        %10 = comb.xor %arg18, %true : i1
        %11 = comb.and %7, %10 : i1
        %12 = comb.xor %7, %true : i1
        %13 = comb.and %10, %12 : i1
        %c-4_i3_0 = hw.constant -4 : i3
        %14 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %15 = comb.xor %cpha_q, %true : i1
        %16 = comb.xor %cmd_rd_en_q, %true : i1
        %17 = comb.xor %cmd_wr_en_q, %true : i1
        %18 = comb.and %16, %17 : i1
        %19 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %20 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %21 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %22 = comb.mux %21, %c-4_i3, %c1_i3 : i3
        %23 = comb.xor %18, %true : i1
        %24 = comb.xor %19, %true : i1
        %25 = comb.and %24, %23, %20 : i1
        %26 = comb.mux %25, %c-2_i3, %22 : i3
        %27 = comb.and %23, %19 : i1
        %28 = comb.mux %27, %c-1_i3, %26 : i3
        %29 = comb.mux %18, %c0_i3, %28 : i3
        %30 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %31 = comb.or %arg18, %7 : i1
        %32 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %33 = comb.and %cmd_wr_en_q, %14 : i1
        %34 = comb.or %33, %cmd_wr_en_last_bit : i1
        %35 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %36 = comb.and %cmd_rd_en_q, %cmd_wr_en_q : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.or %35, %37 : i1
        verif.assert %38 : i1
        %39 = comb.icmp ne %cmd_speed_q, %c-1_i2 : i2
        verif.assert %39 : i1
        %40 = comb.xor %csid_q, %true : i1
        verif.assert %40 : i1
        fsm.update %cmd_wr_en_last_bit, %34 : i1
        %c-2_i2_1 = hw.constant -2 : i2
        %41 = comb.concat %c-2_i2_1, %8 : i2, i1
        %42 = comb.mux %11, %41, %9 : i3
        %43 = comb.mux %arg18, %c0_i3, %42 : i3
        %44 = comb.mux %13, %c-4_i3_0, %43 : i3
        %45 = comb.icmp ne %44, %c-4_i3_0 : i3
        %true_2 = hw.constant true
        %46 = comb.xor %11, %true_2 : i1
        %true_3 = hw.constant true
        %47 = comb.xor %arg18, %true_3 : i1
        %true_4 = hw.constant true
        %48 = comb.xor %13, %true_4 : i1
        %49 = comb.and %15, %10, %45, %48, %47, %46, %8 : i1
        %50 = comb.and %7, %49 : i1
        %51 = comb.mux %50, %29, %bit_cntr_q : i3
        %52 = comb.mux %arg18, %c0_i3, %51 : i3
        %true_5 = hw.constant true
        %53 = comb.xor %11, %true_5 : i1
        %true_6 = hw.constant true
        %54 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %55 = comb.xor %13, %true_7 : i1
        %56 = comb.and %55, %54, %53, %8 : i1
        %true_8 = hw.constant true
        %57 = comb.xor %8, %true_8 : i1
        %true_9 = hw.constant true
        %58 = comb.xor %arg18, %true_9 : i1
        %59 = comb.and %58, %11, %57 : i1
        %60 = comb.or %13, %59 : i1
        %true_10 = hw.constant true
        %61 = comb.xor %arg18, %true_10 : i1
        %true_11 = hw.constant true
        %62 = comb.xor %13, %true_11 : i1
        %63 = comb.and %62, %61, %11, %8 : i1
        %true_12 = hw.constant true
        %64 = comb.xor %8, %true_12 : i1
        %true_13 = hw.constant true
        %65 = comb.xor %11, %true_13 : i1
        %true_14 = hw.constant true
        %66 = comb.xor %arg18, %true_14 : i1
        %true_15 = hw.constant true
        %67 = comb.xor %13, %true_15 : i1
        %68 = comb.and %45, %11 : i1
        %69 = comb.xor %56, %true : i1
        %70 = comb.and %69, %68 : i1
        %71 = comb.xor %60, %true : i1
        %72 = comb.and %71, %70 : i1
        %73 = comb.xor %63, %true : i1
        %74 = comb.and %73, %72, %67, %66, %65, %64 : i1
        %75 = comb.and %72, %63 : i1
        %76 = comb.or %75, %74 : i1
        %77 = comb.mux %76, %csnidle_q, %c0_i4 : i4
        %78 = comb.and %70, %60 : i1
        %79 = comb.mux %78, %csntrail_q, %77 : i4
        %80 = comb.and %68, %56 : i1
        %81 = comb.mux %80, %csnlead_q, %79 : i4
        %82 = comb.mux %31, %81, %wait_cntr_q : i4
        %83 = comb.mux %arg18, %c0_i4, %82 : i4
        %84 = comb.xor %45, %true : i1
        %85 = comb.and %32, %84, %11 : i1
        %86 = comb.mux %85, %30, %83 : i4
        %87 = comb.icmp ne %44, %c-4_i3 : i3
        %88 = comb.and %69, %87 : i1
        %89 = comb.icmp ne %44, %c3_i3 : i3
        %90 = comb.and %cpol_q, %89 : i1
        %91 = comb.and %49, %cmd_wr_en_q, %6 : i1
        %92 = comb.mux %91, %clk_cntr_q, %5 : i16
        %93 = comb.mux %91, %bit_cntr_q, %52 : i3
        %true_16 = hw.constant true
        %94 = comb.xor %arg18, %true_16 : i1
        %95 = comb.or %91, %94 : i1
        %96 = comb.mux %95, %byte_cntr_cpha0_q, %c0_i20 : i20
        %true_17 = hw.constant true
        %97 = comb.xor %arg18, %true_17 : i1
        %98 = comb.or %91, %97 : i1
        %99 = comb.mux %98, %byte_cntr_cpha1_q, %c0_i20 : i20
        %100 = comb.mux %91, %wait_cntr_q, %86 : i4
        fsm.update %wait_cntr_q, %100 : i4
        fsm.update %byte_cntr_cpha1_q, %99 : i20
        fsm.update %byte_cntr_cpha0_q, %96 : i20
        fsm.update %bit_cntr_q, %93 : i3
        fsm.update %clk_cntr_q, %92 : i16
        %101 = comb.xor %91, %true : i1
        %102 = comb.and %45, %101 : i1
        %103 = comb.mux bin %102, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %104 = comb.and %7, %101 : i1
        %105 = comb.mux %104, %49, %sample_en_q : i1
        %106 = comb.mux %104, %sample_en_q, %sample_en_q2 : i1
        %107 = comb.mux bin %91, %u_sck_flop2Fq_o, %90 : i1
        %108 = comb.mux %101, %88, %csb_q : i1
        %109 = comb.or %csid_q, %108 : i1
        fsm.update %csb_q, %109 : i1
        fsm.update %u_sck_flop2Fq_o, %107 : i1
        fsm.update %sample_en_q2, %106 : i1
        fsm.update %sample_en_q, %105 : i1
        fsm.update %segment_rd_en_cpha1, %103 : i1
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
      %c-1_i2 = hw.constant -1 : i2
      %true = hw.constant true
      %false = hw.constant false
      %0 = comb.icmp ne %arg13, %cpol_q : i1
      %1 = comb.icmp ne %arg12, %cpha_q : i1
      %2 = comb.icmp ne %arg11, %full_cyc_q : i1
      %3 = comb.icmp ne %arg8, %csnidle_q : i4
      %4 = comb.icmp ne %arg10, %csntrail_q : i4
      %5 = comb.icmp ne %arg9, %csnlead_q : i4
      %6 = comb.icmp ne %arg7, %clkdiv_q : i16
      %7 = comb.or %0, %1, %2, %3, %4, %5, %6 : i1
      %true_0 = hw.constant true
      %8 = comb.icmp eq %clk_cntr_q, %c0_i16 : i16
      %9 = comb.xor %arg16, %true : i1
      %false_1 = hw.constant false
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
      %false_2 = hw.constant false
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
      %39 = comb.and %arg15, %20 : i1
      %40 = comb.mux %39, %arg14, %csid_q : i1
      %41 = comb.mux %39, %arg12, %cpha_q : i1
      %42 = comb.mux %39, %arg11, %full_cyc_q : i1
      %43 = comb.mux %39, %arg3, %cmd_wr_en_q : i1
      %44 = comb.mux %39, %arg4, %cmd_rd_en_q : i1
      %45 = comb.mux %39, %arg2, %cmd_speed_q : i2
      %46 = comb.mux %13, %12, %c-3_i3 : i3
      %47 = comb.mux %16, %46, %14 : i3
      %48 = comb.mux %arg18, %c0_i3, %47 : i3
      %49 = comb.mux %18, %c-3_i3, %48 : i3
      %50 = comb.icmp ne %49, %c-3_i3 : i3
      %true_3 = hw.constant true
      %51 = comb.xor %7, %true_3 : i1
      %52 = comb.and %arg15, %51 : i1
      %true_4 = hw.constant true
      %53 = comb.xor %16, %true_4 : i1
      %54 = comb.or %53, %52 : i1
      %true_5 = hw.constant true
      %55 = comb.xor %arg18, %true_5 : i1
      %true_6 = hw.constant true
      %56 = comb.xor %18, %true_6 : i1
      %57 = comb.xor %41, %true : i1
      %58 = comb.and %57, %15, %50, %56, %55, %54, %13, %43 : i1
      %59 = comb.mux %42, %sample_en_q2, %sample_en_q : i1
      %60 = comb.icmp eq %arg2, %c0_i2 : i2
      %61 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
      %62 = comb.mux %39, %60, %61 : i1
      %63 = comb.and %44, %43 : i1
      %64 = comb.xor %63, %true : i1
      %65 = comb.or %62, %64 : i1
      verif.assert %65 : i1
      %66 = comb.icmp ne %45, %c-1_i2 : i2
      verif.assert %66 : i1
      %67 = comb.xor %40, %true : i1
      verif.assert %67 : i1
      %68 = comb.and %58, %9 : i1
      %69 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %70 = comb.icmp eq %arg5, %c0_i20 : i20
      %71 = comb.icmp eq %byte_cntr_cpha0_q, %c0_i20 : i20
      %72 = comb.mux %39, %70, %71 : i1
      %73 = comb.mux %17, %69, %72 : i1
      %74 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %75 = comb.icmp eq %arg5, %c0_i20 : i20
      %76 = comb.icmp eq %byte_cntr_cpha1_q, %c0_i20 : i20
      %77 = comb.mux %39, %75, %76 : i1
      %78 = comb.mux %17, %74, %77 : i1
      %79 = comb.mux %57, %73, %78 : i1
      %80 = comb.or %arg18, %79 : i1
      %81 = comb.xor %68, %true : i1
      %82 = comb.and %58, %81 : i1
      %83 = comb.and %59, %81 : i1
      %false_7 = hw.constant false
      %84 = comb.and %20, %81 : i1
      %85 = comb.and %80, %82, %arg16 : i1
      fsm.output %84, %u_sck_flop2Fq_o, %csb_q, %38, %false_2, %85, %82, %false, %83, %false_7, %cmd_speed_q, %42, %false_1, %68, %true_0 : i1, i1, i1, i4, i1, i1, i1, i1, i1, i1, i2, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_6 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.and %arg1, %8 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.mux %12, %11, %c-3_i3 : i3
        %18 = comb.mux %16, %17, %13 : i3
        %19 = comb.mux %arg18, %c0_i3, %18 : i3
        %20 = comb.xor %15, %true : i1
        %21 = comb.and %14, %20 : i1
        %22 = comb.mux %21, %c-3_i3, %19 : i3
        %23 = comb.xor %21, %true : i1
        %24 = comb.icmp ne %22, %c-3_i3 : i3
        %true_0 = hw.constant true
        %25 = comb.xor %7, %true_0 : i1
        %26 = comb.and %arg15, %25 : i1
        %true_1 = hw.constant true
        %27 = comb.xor %16, %true_1 : i1
        %28 = comb.or %27, %26 : i1
        %true_2 = hw.constant true
        %29 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %30 = comb.xor %21, %true_3 : i1
        %31 = comb.and %arg15, %23, %16, %12 : i1
        %32 = comb.mux %31, %arg14, %csid_q : i1
        %33 = comb.mux %31, %arg12, %cpha_q : i1
        %34 = comb.mux %31, %arg3, %cmd_wr_en_q : i1
        %35 = comb.mux %31, %arg4, %cmd_rd_en_q : i1
        %36 = comb.mux %31, %arg2, %cmd_speed_q : i2
        %37 = comb.xor %33, %true : i1
        %38 = comb.icmp eq %arg2, %c0_i2 : i2
        %39 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %40 = comb.mux %31, %38, %39 : i1
        %41 = comb.and %35, %34 : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %40, %42 : i1
        verif.assert %43 : i1
        %44 = comb.icmp ne %36, %c-1_i2 : i2
        verif.assert %44 : i1
        %45 = comb.xor %32, %true : i1
        verif.assert %45 : i1
        %46 = comb.and %37, %14, %24, %30, %29, %28, %12, %34, %9 : i1
        %47 = comb.or %46, %21 : i1
        %48 = comb.and %12, %arg15, %7 : i1
        %true_4 = hw.constant true
        %49 = comb.xor %12, %true_4 : i1
        %50 = comb.mux %16, %48, %49 : i1
        %true_5 = hw.constant true
        %51 = comb.xor %arg18, %true_5 : i1
        %true_6 = hw.constant true
        %52 = comb.xor %47, %true_6 : i1
        %53 = comb.and %52, %51, %50 : i1
        fsm.return %53
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %16 = comb.mux %15, %c1_i3, %c-2_i3 : i3
        %17 = comb.xor %arg18, %true : i1
        %18 = comb.and %12, %17 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.and %17, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %24 = comb.or %arg18, %12 : i1
        %25 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %26 = comb.and %cmd_wr_en_q, %22 : i1
        %27 = comb.or %26, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %27 : i1
        %28 = comb.and %arg15, %21, %18, %15 : i1
        %29 = comb.mux %28, %arg14, %csid_q : i1
        %30 = comb.mux %28, %arg13, %cpol_q : i1
        %31 = comb.mux %28, %arg12, %cpha_q : i1
        %32 = comb.mux %28, %arg8, %csnidle_q : i4
        %33 = comb.mux %28, %arg9, %csnlead_q : i4
        %34 = comb.mux %28, %arg7, %clkdiv_q : i16
        %35 = comb.mux %28, %arg3, %cmd_wr_en_q : i1
        %36 = comb.mux %28, %arg4, %cmd_rd_en_q : i1
        %37 = comb.mux %28, %arg2, %cmd_speed_q : i2
        %38 = comb.mux %9, %34, %10 : i16
        %39 = comb.mux %28, %arg7, %38 : i16
        %40 = comb.mux %8, %clk_cntr_q, %39 : i16
        %41 = comb.mux %arg18, %c0_i16, %40 : i16
        %42 = comb.mux %15, %14, %c-3_i3 : i3
        %43 = comb.mux %18, %42, %16 : i3
        %44 = comb.mux %arg18, %c0_i3, %43 : i3
        %45 = comb.mux %20, %c-3_i3, %44 : i3
        %46 = comb.icmp ne %45, %c-3_i3 : i3
        %true_0 = hw.constant true
        %47 = comb.xor %7, %true_0 : i1
        %48 = comb.and %arg15, %47 : i1
        %true_1 = hw.constant true
        %49 = comb.xor %18, %true_1 : i1
        %50 = comb.or %49, %48 : i1
        %true_2 = hw.constant true
        %51 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %52 = comb.xor %20, %true_3 : i1
        %53 = comb.xor %31, %true : i1
        %54 = comb.and %53, %17, %46, %52, %51, %50, %15 : i1
        %55 = comb.xor %36, %true : i1
        %56 = comb.xor %35, %true : i1
        %57 = comb.and %55, %56 : i1
        %58 = comb.icmp eq %arg2, %c0_i2 : i2
        %59 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %60 = comb.mux %28, %58, %59 : i1
        %61 = comb.icmp eq %arg2, %c1_i2 : i2
        %62 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %63 = comb.mux %28, %61, %62 : i1
        %64 = comb.icmp eq %arg2, %c-2_i2 : i2
        %65 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %66 = comb.mux %28, %64, %65 : i1
        %67 = comb.mux %66, %c-4_i3, %c1_i3 : i3
        %68 = comb.xor %57, %true : i1
        %69 = comb.xor %60, %true : i1
        %70 = comb.and %69, %68, %63 : i1
        %71 = comb.mux %70, %c-2_i3, %67 : i3
        %72 = comb.and %68, %60 : i1
        %73 = comb.mux %72, %c-1_i3, %71 : i3
        %74 = comb.mux %57, %c0_i3, %73 : i3
        %75 = comb.mux %54, %74, %bit_cntr_q : i3
        %76 = comb.mux %19, %bit_cntr_q, %75 : i3
        %77 = comb.mux %arg18, %c0_i3, %76 : i3
        %78 = comb.mux %28, %arg5, %byte_cntr_cpha0_q : i20
        %79 = comb.mux %arg18, %c0_i20, %78 : i20
        %80 = comb.mux %28, %arg5, %byte_cntr_cpha1_q : i20
        %81 = comb.mux %arg18, %c0_i20, %80 : i20
        %true_4 = hw.constant true
        %82 = comb.xor %7, %true_4 : i1
        %83 = comb.and %arg15, %82 : i1
        %true_5 = hw.constant true
        %84 = comb.xor %18, %true_5 : i1
        %85 = comb.or %84, %83 : i1
        %true_6 = hw.constant true
        %86 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %87 = comb.xor %20, %true_7 : i1
        %88 = comb.and %87, %86, %85, %15 : i1
        %true_8 = hw.constant true
        %89 = comb.xor %15, %true_8 : i1
        %true_9 = hw.constant true
        %90 = comb.xor %arg18, %true_9 : i1
        %91 = comb.and %90, %18, %89 : i1
        %92 = comb.or %20, %91 : i1
        %93 = comb.and %15, %arg15, %7 : i1
        %true_10 = hw.constant true
        %94 = comb.xor %15, %true_10 : i1
        %95 = comb.mux %18, %93, %94 : i1
        %true_11 = hw.constant true
        %96 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %97 = comb.xor %20, %true_12 : i1
        %98 = comb.and %46, %18 : i1
        %99 = comb.xor %88, %true : i1
        %100 = comb.and %99, %98 : i1
        %101 = comb.xor %92, %true : i1
        %102 = comb.and %101, %100, %97, %96, %95 : i1
        %103 = comb.and %100, %92 : i1
        %104 = comb.or %103, %102 : i1
        %105 = comb.mux %104, %32, %c0_i4 : i4
        %106 = comb.and %98, %88 : i1
        %107 = comb.mux %106, %33, %105 : i4
        %108 = comb.mux %24, %107, %wait_cntr_q : i4
        %109 = comb.mux %arg18, %c0_i4, %108 : i4
        %110 = comb.xor %46, %true : i1
        %111 = comb.and %25, %110, %18 : i1
        %112 = comb.mux %111, %23, %109 : i4
        %113 = comb.icmp ne %45, %c-4_i3 : i3
        %114 = comb.and %99, %113 : i1
        %115 = comb.icmp ne %45, %c3_i3 : i3
        %116 = comb.and %30, %115 : i1
        %117 = comb.icmp eq %arg2, %c0_i2 : i2
        %118 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %119 = comb.mux %28, %117, %118 : i1
        %120 = comb.and %36, %35 : i1
        %121 = comb.xor %120, %true : i1
        %122 = comb.or %119, %121 : i1
        verif.assert %122 : i1
        %123 = comb.icmp ne %37, %c-1_i2 : i2
        verif.assert %123 : i1
        %124 = comb.xor %29, %true : i1
        verif.assert %124 : i1
        %125 = comb.and %54, %35, %11 : i1
        %126 = comb.mux %125, %clk_cntr_q, %41 : i16
        %127 = comb.mux %125, %bit_cntr_q, %77 : i3
        %128 = comb.mux %125, %byte_cntr_cpha0_q, %79 : i20
        %129 = comb.mux %125, %byte_cntr_cpha1_q, %81 : i20
        %130 = comb.mux %125, %wait_cntr_q, %112 : i4
        fsm.update %wait_cntr_q, %130 : i4
        fsm.update %byte_cntr_cpha1_q, %129 : i20
        fsm.update %byte_cntr_cpha0_q, %128 : i20
        fsm.update %bit_cntr_q, %127 : i3
        fsm.update %clk_cntr_q, %126 : i16
        %131 = comb.xor %125, %true : i1
        %132 = comb.and %28, %131 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg11, %full_cyc_q : i1
        %137 = comb.mux %132, %arg8, %csnidle_q : i4
        %138 = comb.mux %132, %arg9, %csnlead_q : i4
        %139 = comb.mux %132, %arg10, %csntrail_q : i4
        %140 = comb.mux %132, %arg7, %clkdiv_q : i16
        %141 = comb.mux %132, %arg6, %csaat_q : i1
        %142 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %143 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %144 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %145 = comb.mux %132, %arg5, %cmd_len_q : i20
        %146 = comb.and %46, %131 : i1
        %147 = comb.mux bin %146, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %148 = comb.and %12, %131 : i1
        %149 = comb.mux %148, %54, %sample_en_q : i1
        %150 = comb.mux %148, %sample_en_q, %sample_en_q2 : i1
        %151 = comb.mux bin %125, %u_sck_flop2Fq_o, %116 : i1
        %152 = comb.mux %131, %114, %csb_q : i1
        %153 = comb.or %29, %152 : i1
        fsm.update %csb_q, %153 : i1
        fsm.update %u_sck_flop2Fq_o, %151 : i1
        fsm.update %sample_en_q2, %150 : i1
        fsm.update %sample_en_q, %149 : i1
        fsm.update %segment_rd_en_cpha1, %147 : i1
        fsm.update %cmd_len_q, %145 : i20
        fsm.update %cmd_speed_q, %144 : i2
        fsm.update %cmd_wr_en_q, %142 : i1
        fsm.update %cmd_rd_en_q, %143 : i1
        fsm.update %csaat_q, %141 : i1
        fsm.update %clkdiv_q, %140 : i16
        fsm.update %csntrail_q, %139 : i4
        fsm.update %csnlead_q, %138 : i4
        fsm.update %csnidle_q, %137 : i4
        fsm.update %full_cyc_q, %136 : i1
        fsm.update %cpha_q, %135 : i1
        fsm.update %cpol_q, %134 : i1
        fsm.update %csid_q, %133 : i1
      }
      fsm.transition @state_5 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.and %arg1, %8 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.mux %12, %11, %c-3_i3 : i3
        %18 = comb.mux %16, %17, %13 : i3
        %19 = comb.mux %arg18, %c0_i3, %18 : i3
        %20 = comb.xor %15, %true : i1
        %21 = comb.and %14, %20 : i1
        %22 = comb.mux %21, %c-3_i3, %19 : i3
        %23 = comb.xor %21, %true : i1
        %24 = comb.icmp ne %22, %c-3_i3 : i3
        %true_0 = hw.constant true
        %25 = comb.xor %7, %true_0 : i1
        %26 = comb.and %arg15, %25 : i1
        %true_1 = hw.constant true
        %27 = comb.xor %16, %true_1 : i1
        %28 = comb.or %27, %26 : i1
        %true_2 = hw.constant true
        %29 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %30 = comb.xor %21, %true_3 : i1
        %31 = comb.and %arg15, %23, %16, %12 : i1
        %32 = comb.mux %31, %arg14, %csid_q : i1
        %33 = comb.mux %31, %arg12, %cpha_q : i1
        %34 = comb.mux %31, %arg3, %cmd_wr_en_q : i1
        %35 = comb.mux %31, %arg4, %cmd_rd_en_q : i1
        %36 = comb.mux %31, %arg2, %cmd_speed_q : i2
        %37 = comb.xor %33, %true : i1
        %38 = comb.icmp eq %arg2, %c0_i2 : i2
        %39 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %40 = comb.mux %31, %38, %39 : i1
        %41 = comb.and %35, %34 : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %40, %42 : i1
        verif.assert %43 : i1
        %44 = comb.icmp ne %36, %c-1_i2 : i2
        verif.assert %44 : i1
        %45 = comb.xor %32, %true : i1
        verif.assert %45 : i1
        %46 = comb.and %37, %14, %24, %30, %29, %28, %12, %34, %9 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %12, %true_4 : i1
        %true_5 = hw.constant true
        %48 = comb.xor %arg18, %true_5 : i1
        %49 = comb.and %48, %16, %47 : i1
        %50 = comb.or %46, %21, %49 : i1
        fsm.return %50
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %16 = comb.mux %15, %c1_i3, %c-2_i3 : i3
        %17 = comb.xor %arg18, %true : i1
        %18 = comb.and %12, %17 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.and %17, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %24 = comb.or %arg18, %12 : i1
        %25 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %26 = comb.and %cmd_wr_en_q, %22 : i1
        %27 = comb.or %26, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %27 : i1
        %28 = comb.and %arg15, %21, %18, %15 : i1
        %29 = comb.mux %28, %arg14, %csid_q : i1
        %30 = comb.mux %28, %arg13, %cpol_q : i1
        %31 = comb.mux %28, %arg12, %cpha_q : i1
        %32 = comb.mux %28, %arg8, %csnidle_q : i4
        %33 = comb.mux %28, %arg9, %csnlead_q : i4
        %34 = comb.mux %28, %arg7, %clkdiv_q : i16
        %35 = comb.mux %28, %arg3, %cmd_wr_en_q : i1
        %36 = comb.mux %28, %arg4, %cmd_rd_en_q : i1
        %37 = comb.mux %28, %arg2, %cmd_speed_q : i2
        %38 = comb.mux %9, %34, %10 : i16
        %39 = comb.mux %28, %arg7, %38 : i16
        %40 = comb.mux %8, %clk_cntr_q, %39 : i16
        %41 = comb.mux %arg18, %c0_i16, %40 : i16
        %42 = comb.mux %15, %14, %c-3_i3 : i3
        %43 = comb.mux %18, %42, %16 : i3
        %44 = comb.mux %arg18, %c0_i3, %43 : i3
        %45 = comb.mux %20, %c-3_i3, %44 : i3
        %46 = comb.icmp ne %45, %c-3_i3 : i3
        %true_0 = hw.constant true
        %47 = comb.xor %7, %true_0 : i1
        %48 = comb.and %arg15, %47 : i1
        %true_1 = hw.constant true
        %49 = comb.xor %18, %true_1 : i1
        %50 = comb.or %49, %48 : i1
        %true_2 = hw.constant true
        %51 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %52 = comb.xor %20, %true_3 : i1
        %53 = comb.xor %31, %true : i1
        %54 = comb.and %53, %17, %46, %52, %51, %50, %15 : i1
        %55 = comb.xor %36, %true : i1
        %56 = comb.xor %35, %true : i1
        %57 = comb.and %55, %56 : i1
        %58 = comb.icmp eq %arg2, %c0_i2 : i2
        %59 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %60 = comb.mux %28, %58, %59 : i1
        %61 = comb.icmp eq %arg2, %c1_i2 : i2
        %62 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %63 = comb.mux %28, %61, %62 : i1
        %64 = comb.icmp eq %arg2, %c-2_i2 : i2
        %65 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %66 = comb.mux %28, %64, %65 : i1
        %67 = comb.mux %66, %c-4_i3, %c1_i3 : i3
        %68 = comb.xor %57, %true : i1
        %69 = comb.xor %60, %true : i1
        %70 = comb.and %69, %68, %63 : i1
        %71 = comb.mux %70, %c-2_i3, %67 : i3
        %72 = comb.and %68, %60 : i1
        %73 = comb.mux %72, %c-1_i3, %71 : i3
        %74 = comb.mux %57, %c0_i3, %73 : i3
        %75 = comb.and %12, %54 : i1
        %76 = comb.mux %75, %74, %bit_cntr_q : i3
        %77 = comb.mux %arg18, %c0_i3, %76 : i3
        %78 = comb.mux %28, %arg5, %byte_cntr_cpha0_q : i20
        %79 = comb.mux %arg18, %c0_i20, %78 : i20
        %80 = comb.mux %28, %arg5, %byte_cntr_cpha1_q : i20
        %81 = comb.mux %arg18, %c0_i20, %80 : i20
        %true_4 = hw.constant true
        %82 = comb.xor %7, %true_4 : i1
        %83 = comb.and %arg15, %82 : i1
        %true_5 = hw.constant true
        %84 = comb.xor %18, %true_5 : i1
        %85 = comb.or %84, %83 : i1
        %true_6 = hw.constant true
        %86 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %87 = comb.xor %20, %true_7 : i1
        %88 = comb.and %87, %86, %85, %15 : i1
        %true_8 = hw.constant true
        %89 = comb.xor %15, %true_8 : i1
        %true_9 = hw.constant true
        %90 = comb.xor %arg18, %true_9 : i1
        %91 = comb.and %90, %18, %89 : i1
        %92 = comb.or %20, %91 : i1
        %93 = comb.and %15, %arg15, %7 : i1
        %true_10 = hw.constant true
        %94 = comb.xor %15, %true_10 : i1
        %95 = comb.mux %18, %93, %94 : i1
        %true_11 = hw.constant true
        %96 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %97 = comb.xor %20, %true_12 : i1
        %98 = comb.and %46, %18 : i1
        %99 = comb.xor %88, %true : i1
        %100 = comb.and %99, %98 : i1
        %101 = comb.xor %92, %true : i1
        %102 = comb.and %101, %100, %97, %96, %95 : i1
        %103 = comb.and %100, %92 : i1
        %104 = comb.or %103, %102 : i1
        %105 = comb.mux %104, %32, %c0_i4 : i4
        %106 = comb.and %98, %88 : i1
        %107 = comb.mux %106, %33, %105 : i4
        %108 = comb.mux %24, %107, %wait_cntr_q : i4
        %109 = comb.mux %arg18, %c0_i4, %108 : i4
        %110 = comb.xor %46, %true : i1
        %111 = comb.and %25, %110, %18 : i1
        %112 = comb.mux %111, %23, %109 : i4
        %113 = comb.icmp ne %45, %c-4_i3 : i3
        %114 = comb.and %99, %113 : i1
        %115 = comb.icmp ne %45, %c3_i3 : i3
        %116 = comb.and %30, %115 : i1
        %117 = comb.icmp eq %arg2, %c0_i2 : i2
        %118 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %119 = comb.mux %28, %117, %118 : i1
        %120 = comb.and %36, %35 : i1
        %121 = comb.xor %120, %true : i1
        %122 = comb.or %119, %121 : i1
        verif.assert %122 : i1
        %123 = comb.icmp ne %37, %c-1_i2 : i2
        verif.assert %123 : i1
        %124 = comb.xor %29, %true : i1
        verif.assert %124 : i1
        %125 = comb.and %54, %35, %11 : i1
        %126 = comb.mux %125, %clk_cntr_q, %41 : i16
        %127 = comb.mux %125, %bit_cntr_q, %77 : i3
        %128 = comb.mux %125, %byte_cntr_cpha0_q, %79 : i20
        %129 = comb.mux %125, %byte_cntr_cpha1_q, %81 : i20
        %130 = comb.mux %125, %wait_cntr_q, %112 : i4
        fsm.update %wait_cntr_q, %130 : i4
        fsm.update %byte_cntr_cpha1_q, %129 : i20
        fsm.update %byte_cntr_cpha0_q, %128 : i20
        fsm.update %bit_cntr_q, %127 : i3
        fsm.update %clk_cntr_q, %126 : i16
        %131 = comb.xor %125, %true : i1
        %132 = comb.and %28, %131 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg11, %full_cyc_q : i1
        %137 = comb.mux %132, %arg8, %csnidle_q : i4
        %138 = comb.mux %132, %arg9, %csnlead_q : i4
        %139 = comb.mux %132, %arg10, %csntrail_q : i4
        %140 = comb.mux %132, %arg7, %clkdiv_q : i16
        %141 = comb.mux %132, %arg6, %csaat_q : i1
        %142 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %143 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %144 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %145 = comb.mux %132, %arg5, %cmd_len_q : i20
        %146 = comb.and %46, %131 : i1
        %147 = comb.mux bin %146, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %148 = comb.and %12, %131 : i1
        %149 = comb.mux %148, %54, %sample_en_q : i1
        %150 = comb.mux %148, %sample_en_q, %sample_en_q2 : i1
        %151 = comb.mux bin %125, %u_sck_flop2Fq_o, %116 : i1
        %152 = comb.mux %131, %114, %csb_q : i1
        %153 = comb.or %29, %152 : i1
        fsm.update %csb_q, %153 : i1
        fsm.update %u_sck_flop2Fq_o, %151 : i1
        fsm.update %sample_en_q2, %150 : i1
        fsm.update %sample_en_q, %149 : i1
        fsm.update %segment_rd_en_cpha1, %147 : i1
        fsm.update %cmd_len_q, %145 : i20
        fsm.update %cmd_speed_q, %144 : i2
        fsm.update %cmd_wr_en_q, %142 : i1
        fsm.update %cmd_rd_en_q, %143 : i1
        fsm.update %csaat_q, %141 : i1
        fsm.update %clkdiv_q, %140 : i16
        fsm.update %csntrail_q, %139 : i4
        fsm.update %csnlead_q, %138 : i4
        fsm.update %csnidle_q, %137 : i4
        fsm.update %full_cyc_q, %136 : i1
        fsm.update %cpha_q, %135 : i1
        fsm.update %cpol_q, %134 : i1
        fsm.update %csid_q, %133 : i1
      }
      fsm.transition @state_1 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.and %arg1, %8 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.mux %12, %11, %c-3_i3 : i3
        %18 = comb.mux %16, %17, %13 : i3
        %19 = comb.mux %arg18, %c0_i3, %18 : i3
        %20 = comb.xor %15, %true : i1
        %21 = comb.and %14, %20 : i1
        %22 = comb.mux %21, %c-3_i3, %19 : i3
        %23 = comb.xor %21, %true : i1
        %24 = comb.icmp ne %22, %c-3_i3 : i3
        %true_0 = hw.constant true
        %25 = comb.xor %7, %true_0 : i1
        %26 = comb.and %arg15, %25 : i1
        %true_1 = hw.constant true
        %27 = comb.xor %16, %true_1 : i1
        %28 = comb.or %27, %26 : i1
        %true_2 = hw.constant true
        %29 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %30 = comb.xor %21, %true_3 : i1
        %31 = comb.and %arg15, %23, %16, %12 : i1
        %32 = comb.mux %31, %arg14, %csid_q : i1
        %33 = comb.mux %31, %arg12, %cpha_q : i1
        %34 = comb.mux %31, %arg3, %cmd_wr_en_q : i1
        %35 = comb.mux %31, %arg4, %cmd_rd_en_q : i1
        %36 = comb.mux %31, %arg2, %cmd_speed_q : i2
        %37 = comb.xor %33, %true : i1
        %38 = comb.icmp eq %arg2, %c0_i2 : i2
        %39 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %40 = comb.mux %31, %38, %39 : i1
        %41 = comb.and %35, %34 : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %40, %42 : i1
        verif.assert %43 : i1
        %44 = comb.icmp ne %36, %c-1_i2 : i2
        verif.assert %44 : i1
        %45 = comb.xor %32, %true : i1
        verif.assert %45 : i1
        %46 = comb.and %37, %14, %24, %30, %29, %28, %12, %34, %9 : i1
        %47 = comb.or %46, %21 : i1
        %true_4 = hw.constant true
        %48 = comb.xor %7, %true_4 : i1
        %49 = comb.and %arg15, %48 : i1
        %true_5 = hw.constant true
        %50 = comb.xor %16, %true_5 : i1
        %51 = comb.or %50, %49 : i1
        %true_6 = hw.constant true
        %52 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %53 = comb.xor %47, %true_7 : i1
        %54 = comb.and %53, %52, %51, %12 : i1
        fsm.return %54
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %16 = comb.mux %15, %c1_i3, %c-2_i3 : i3
        %17 = comb.xor %arg18, %true : i1
        %18 = comb.and %12, %17 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.and %17, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %24 = comb.or %arg18, %12 : i1
        %25 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %26 = comb.and %cmd_wr_en_q, %22 : i1
        %27 = comb.or %26, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %27 : i1
        %28 = comb.and %arg15, %21, %18, %15 : i1
        %29 = comb.mux %28, %arg14, %csid_q : i1
        %30 = comb.mux %28, %arg13, %cpol_q : i1
        %31 = comb.mux %28, %arg12, %cpha_q : i1
        %32 = comb.mux %28, %arg8, %csnidle_q : i4
        %33 = comb.mux %28, %arg9, %csnlead_q : i4
        %34 = comb.mux %28, %arg7, %clkdiv_q : i16
        %35 = comb.mux %28, %arg3, %cmd_wr_en_q : i1
        %36 = comb.mux %28, %arg4, %cmd_rd_en_q : i1
        %37 = comb.mux %28, %arg2, %cmd_speed_q : i2
        %38 = comb.mux %9, %34, %10 : i16
        %39 = comb.mux %28, %arg7, %38 : i16
        %40 = comb.mux %8, %clk_cntr_q, %39 : i16
        %41 = comb.mux %arg18, %c0_i16, %40 : i16
        %42 = comb.mux %15, %14, %c-3_i3 : i3
        %43 = comb.mux %18, %42, %16 : i3
        %44 = comb.mux %arg18, %c0_i3, %43 : i3
        %45 = comb.mux %20, %c-3_i3, %44 : i3
        %46 = comb.icmp ne %45, %c-3_i3 : i3
        %true_0 = hw.constant true
        %47 = comb.xor %7, %true_0 : i1
        %48 = comb.and %arg15, %47 : i1
        %true_1 = hw.constant true
        %49 = comb.xor %18, %true_1 : i1
        %50 = comb.or %49, %48 : i1
        %true_2 = hw.constant true
        %51 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %52 = comb.xor %20, %true_3 : i1
        %53 = comb.xor %31, %true : i1
        %54 = comb.and %53, %17, %46, %52, %51, %50, %15 : i1
        %55 = comb.xor %36, %true : i1
        %56 = comb.xor %35, %true : i1
        %57 = comb.and %55, %56 : i1
        %58 = comb.icmp eq %arg2, %c0_i2 : i2
        %59 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %60 = comb.mux %28, %58, %59 : i1
        %61 = comb.icmp eq %arg2, %c1_i2 : i2
        %62 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %63 = comb.mux %28, %61, %62 : i1
        %64 = comb.icmp eq %arg2, %c-2_i2 : i2
        %65 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %66 = comb.mux %28, %64, %65 : i1
        %67 = comb.mux %66, %c-4_i3, %c1_i3 : i3
        %68 = comb.xor %57, %true : i1
        %69 = comb.xor %60, %true : i1
        %70 = comb.and %69, %68, %63 : i1
        %71 = comb.mux %70, %c-2_i3, %67 : i3
        %72 = comb.and %68, %60 : i1
        %73 = comb.mux %72, %c-1_i3, %71 : i3
        %74 = comb.mux %57, %c0_i3, %73 : i3
        %75 = comb.and %12, %54 : i1
        %76 = comb.mux %75, %74, %bit_cntr_q : i3
        %77 = comb.mux %arg18, %c0_i3, %76 : i3
        %78 = comb.mux %28, %arg5, %byte_cntr_cpha0_q : i20
        %79 = comb.mux %arg18, %c0_i20, %78 : i20
        %80 = comb.mux %28, %arg5, %byte_cntr_cpha1_q : i20
        %81 = comb.mux %arg18, %c0_i20, %80 : i20
        %true_4 = hw.constant true
        %82 = comb.xor %7, %true_4 : i1
        %83 = comb.and %arg15, %82 : i1
        %true_5 = hw.constant true
        %84 = comb.xor %18, %true_5 : i1
        %85 = comb.or %84, %83 : i1
        %true_6 = hw.constant true
        %86 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %87 = comb.xor %20, %true_7 : i1
        %88 = comb.and %87, %86, %85, %15 : i1
        %true_8 = hw.constant true
        %89 = comb.xor %15, %true_8 : i1
        %true_9 = hw.constant true
        %90 = comb.xor %arg18, %true_9 : i1
        %91 = comb.and %90, %18, %89 : i1
        %92 = comb.or %20, %91 : i1
        %93 = comb.and %15, %arg15, %7 : i1
        %true_10 = hw.constant true
        %94 = comb.xor %15, %true_10 : i1
        %95 = comb.mux %18, %93, %94 : i1
        %true_11 = hw.constant true
        %96 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %97 = comb.xor %20, %true_12 : i1
        %98 = comb.and %46, %18 : i1
        %99 = comb.xor %88, %true : i1
        %100 = comb.and %99, %98 : i1
        %101 = comb.xor %92, %true : i1
        %102 = comb.and %101, %100, %97, %96, %95 : i1
        %103 = comb.and %100, %92 : i1
        %104 = comb.or %103, %102 : i1
        %105 = comb.mux %104, %32, %c0_i4 : i4
        %106 = comb.and %98, %88 : i1
        %107 = comb.mux %106, %33, %105 : i4
        %108 = comb.mux %24, %107, %wait_cntr_q : i4
        %109 = comb.mux %arg18, %c0_i4, %108 : i4
        %110 = comb.xor %46, %true : i1
        %111 = comb.and %25, %110, %18 : i1
        %112 = comb.mux %111, %23, %109 : i4
        %113 = comb.icmp ne %45, %c-4_i3 : i3
        %114 = comb.and %99, %113 : i1
        %115 = comb.icmp ne %45, %c3_i3 : i3
        %116 = comb.and %30, %115 : i1
        %117 = comb.icmp eq %arg2, %c0_i2 : i2
        %118 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %119 = comb.mux %28, %117, %118 : i1
        %120 = comb.and %36, %35 : i1
        %121 = comb.xor %120, %true : i1
        %122 = comb.or %119, %121 : i1
        verif.assert %122 : i1
        %123 = comb.icmp ne %37, %c-1_i2 : i2
        verif.assert %123 : i1
        %124 = comb.xor %29, %true : i1
        verif.assert %124 : i1
        %125 = comb.and %54, %35, %11 : i1
        %126 = comb.mux %125, %clk_cntr_q, %41 : i16
        %127 = comb.mux %125, %bit_cntr_q, %77 : i3
        %128 = comb.mux %125, %byte_cntr_cpha0_q, %79 : i20
        %129 = comb.mux %125, %byte_cntr_cpha1_q, %81 : i20
        %130 = comb.mux %125, %wait_cntr_q, %112 : i4
        fsm.update %wait_cntr_q, %130 : i4
        fsm.update %byte_cntr_cpha1_q, %129 : i20
        fsm.update %byte_cntr_cpha0_q, %128 : i20
        fsm.update %bit_cntr_q, %127 : i3
        fsm.update %clk_cntr_q, %126 : i16
        %131 = comb.xor %125, %true : i1
        %132 = comb.and %28, %131 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg11, %full_cyc_q : i1
        %137 = comb.mux %132, %arg8, %csnidle_q : i4
        %138 = comb.mux %132, %arg9, %csnlead_q : i4
        %139 = comb.mux %132, %arg10, %csntrail_q : i4
        %140 = comb.mux %132, %arg7, %clkdiv_q : i16
        %141 = comb.mux %132, %arg6, %csaat_q : i1
        %142 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %143 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %144 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %145 = comb.mux %132, %arg5, %cmd_len_q : i20
        %146 = comb.and %46, %131 : i1
        %147 = comb.mux bin %146, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %148 = comb.and %12, %131 : i1
        %149 = comb.mux %148, %54, %sample_en_q : i1
        %150 = comb.mux %148, %sample_en_q, %sample_en_q2 : i1
        %151 = comb.mux bin %125, %u_sck_flop2Fq_o, %116 : i1
        %152 = comb.mux %131, %114, %csb_q : i1
        %153 = comb.or %29, %152 : i1
        fsm.update %csb_q, %153 : i1
        fsm.update %u_sck_flop2Fq_o, %151 : i1
        fsm.update %sample_en_q2, %150 : i1
        fsm.update %sample_en_q, %149 : i1
        fsm.update %segment_rd_en_cpha1, %147 : i1
        fsm.update %cmd_len_q, %145 : i20
        fsm.update %cmd_speed_q, %144 : i2
        fsm.update %cmd_wr_en_q, %142 : i1
        fsm.update %cmd_rd_en_q, %143 : i1
        fsm.update %csaat_q, %141 : i1
        fsm.update %clkdiv_q, %140 : i16
        fsm.update %csntrail_q, %139 : i4
        fsm.update %csnlead_q, %138 : i4
        fsm.update %csnidle_q, %137 : i4
        fsm.update %full_cyc_q, %136 : i1
        fsm.update %cpha_q, %135 : i1
        fsm.update %cpol_q, %134 : i1
        fsm.update %csid_q, %133 : i1
      }
      fsm.transition @state_0 guard {
        %c0_i4 = hw.constant 0 : i4
        %c0_i16 = hw.constant 0 : i16
        %c0_i2 = hw.constant 0 : i2
        %c0_i3 = hw.constant 0 : i3
        %c-2_i3 = hw.constant -2 : i3
        %c1_i3 = hw.constant 1 : i3
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.and %arg1, %8 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.mux %12, %11, %c-3_i3 : i3
        %18 = comb.mux %16, %17, %13 : i3
        %19 = comb.mux %arg18, %c0_i3, %18 : i3
        %20 = comb.xor %15, %true : i1
        %21 = comb.and %14, %20 : i1
        %22 = comb.mux %21, %c-3_i3, %19 : i3
        %23 = comb.xor %21, %true : i1
        %24 = comb.icmp ne %22, %c-3_i3 : i3
        %true_0 = hw.constant true
        %25 = comb.xor %7, %true_0 : i1
        %26 = comb.and %arg15, %25 : i1
        %true_1 = hw.constant true
        %27 = comb.xor %16, %true_1 : i1
        %28 = comb.or %27, %26 : i1
        %true_2 = hw.constant true
        %29 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %30 = comb.xor %21, %true_3 : i1
        %31 = comb.and %arg15, %23, %16, %12 : i1
        %32 = comb.mux %31, %arg14, %csid_q : i1
        %33 = comb.mux %31, %arg12, %cpha_q : i1
        %34 = comb.mux %31, %arg3, %cmd_wr_en_q : i1
        %35 = comb.mux %31, %arg4, %cmd_rd_en_q : i1
        %36 = comb.mux %31, %arg2, %cmd_speed_q : i2
        %37 = comb.xor %33, %true : i1
        %38 = comb.icmp eq %arg2, %c0_i2 : i2
        %39 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %40 = comb.mux %31, %38, %39 : i1
        %41 = comb.and %35, %34 : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %40, %42 : i1
        verif.assert %43 : i1
        %44 = comb.icmp ne %36, %c-1_i2 : i2
        verif.assert %44 : i1
        %45 = comb.xor %32, %true : i1
        verif.assert %45 : i1
        %46 = comb.and %37, %14, %24, %30, %29, %28, %12, %34, %9 : i1
        %47 = comb.or %46, %21 : i1
        %true_4 = hw.constant true
        %48 = comb.xor %arg15, %true_4 : i1
        %49 = comb.and %16, %12, %48 : i1
        %50 = comb.or %arg18, %49 : i1
        %true_5 = hw.constant true
        %51 = comb.xor %47, %true_5 : i1
        %52 = comb.and %51, %50 : i1
        fsm.return %52
      } action {
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
        %c-1_i2 = hw.constant -1 : i2
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
        %15 = comb.icmp eq %wait_cntr_q, %c0_i4 : i4
        %16 = comb.mux %15, %c1_i3, %c-2_i3 : i3
        %17 = comb.xor %arg18, %true : i1
        %18 = comb.and %12, %17 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.and %17, %19 : i1
        %21 = comb.xor %20, %true : i1
        %c-3_i3 = hw.constant -3 : i3
        %22 = comb.icmp eq %bit_cntr_q, %c0_i3 : i3
        %23 = comb.add %wait_cntr_q, %c-1_i4 : i4
        %24 = comb.or %arg18, %12 : i1
        %25 = comb.icmp ne %wait_cntr_q, %c0_i4 : i4
        %26 = comb.and %cmd_wr_en_q, %22 : i1
        %27 = comb.or %26, %cmd_wr_en_last_bit : i1
        fsm.update %cmd_wr_en_last_bit, %27 : i1
        %28 = comb.and %arg15, %21, %18, %15 : i1
        %29 = comb.mux %28, %arg14, %csid_q : i1
        %30 = comb.mux %28, %arg13, %cpol_q : i1
        %31 = comb.mux %28, %arg12, %cpha_q : i1
        %32 = comb.mux %28, %arg8, %csnidle_q : i4
        %33 = comb.mux %28, %arg9, %csnlead_q : i4
        %34 = comb.mux %28, %arg7, %clkdiv_q : i16
        %35 = comb.mux %28, %arg3, %cmd_wr_en_q : i1
        %36 = comb.mux %28, %arg4, %cmd_rd_en_q : i1
        %37 = comb.mux %28, %arg2, %cmd_speed_q : i2
        %38 = comb.mux %9, %34, %10 : i16
        %39 = comb.mux %28, %arg7, %38 : i16
        %40 = comb.mux %8, %clk_cntr_q, %39 : i16
        %41 = comb.mux %arg18, %c0_i16, %40 : i16
        %42 = comb.mux %15, %14, %c-3_i3 : i3
        %43 = comb.mux %18, %42, %16 : i3
        %44 = comb.mux %arg18, %c0_i3, %43 : i3
        %45 = comb.mux %20, %c-3_i3, %44 : i3
        %46 = comb.icmp ne %45, %c-3_i3 : i3
        %true_0 = hw.constant true
        %47 = comb.xor %7, %true_0 : i1
        %48 = comb.and %arg15, %47 : i1
        %true_1 = hw.constant true
        %49 = comb.xor %18, %true_1 : i1
        %50 = comb.or %49, %48 : i1
        %true_2 = hw.constant true
        %51 = comb.xor %arg18, %true_2 : i1
        %true_3 = hw.constant true
        %52 = comb.xor %20, %true_3 : i1
        %53 = comb.xor %31, %true : i1
        %54 = comb.and %53, %17, %46, %52, %51, %50, %15 : i1
        %55 = comb.xor %36, %true : i1
        %56 = comb.xor %35, %true : i1
        %57 = comb.and %55, %56 : i1
        %58 = comb.icmp eq %arg2, %c0_i2 : i2
        %59 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %60 = comb.mux %28, %58, %59 : i1
        %61 = comb.icmp eq %arg2, %c1_i2 : i2
        %62 = comb.icmp eq %cmd_speed_q, %c1_i2 : i2
        %63 = comb.mux %28, %61, %62 : i1
        %64 = comb.icmp eq %arg2, %c-2_i2 : i2
        %65 = comb.icmp eq %cmd_speed_q, %c-2_i2 : i2
        %66 = comb.mux %28, %64, %65 : i1
        %67 = comb.mux %66, %c-4_i3, %c1_i3 : i3
        %68 = comb.xor %57, %true : i1
        %69 = comb.xor %60, %true : i1
        %70 = comb.and %69, %68, %63 : i1
        %71 = comb.mux %70, %c-2_i3, %67 : i3
        %72 = comb.and %68, %60 : i1
        %73 = comb.mux %72, %c-1_i3, %71 : i3
        %74 = comb.mux %57, %c0_i3, %73 : i3
        %75 = comb.and %12, %54 : i1
        %76 = comb.mux %75, %74, %bit_cntr_q : i3
        %77 = comb.mux %arg18, %c0_i3, %76 : i3
        %78 = comb.mux %28, %arg5, %byte_cntr_cpha0_q : i20
        %79 = comb.mux %arg18, %c0_i20, %78 : i20
        %80 = comb.mux %28, %arg5, %byte_cntr_cpha1_q : i20
        %81 = comb.mux %arg18, %c0_i20, %80 : i20
        %true_4 = hw.constant true
        %82 = comb.xor %7, %true_4 : i1
        %83 = comb.and %arg15, %82 : i1
        %true_5 = hw.constant true
        %84 = comb.xor %18, %true_5 : i1
        %85 = comb.or %84, %83 : i1
        %true_6 = hw.constant true
        %86 = comb.xor %arg18, %true_6 : i1
        %true_7 = hw.constant true
        %87 = comb.xor %20, %true_7 : i1
        %88 = comb.and %87, %86, %85, %15 : i1
        %true_8 = hw.constant true
        %89 = comb.xor %15, %true_8 : i1
        %true_9 = hw.constant true
        %90 = comb.xor %arg18, %true_9 : i1
        %91 = comb.and %90, %18, %89 : i1
        %92 = comb.or %20, %91 : i1
        %93 = comb.and %15, %arg15, %7 : i1
        %true_10 = hw.constant true
        %94 = comb.xor %15, %true_10 : i1
        %95 = comb.mux %18, %93, %94 : i1
        %true_11 = hw.constant true
        %96 = comb.xor %arg18, %true_11 : i1
        %true_12 = hw.constant true
        %97 = comb.xor %20, %true_12 : i1
        %98 = comb.and %46, %18 : i1
        %99 = comb.xor %88, %true : i1
        %100 = comb.and %99, %98 : i1
        %101 = comb.xor %92, %true : i1
        %102 = comb.and %101, %100, %97, %96, %95 : i1
        %103 = comb.and %100, %92 : i1
        %104 = comb.or %103, %102 : i1
        %105 = comb.mux %104, %32, %c0_i4 : i4
        %106 = comb.and %98, %88 : i1
        %107 = comb.mux %106, %33, %105 : i4
        %108 = comb.mux %24, %107, %wait_cntr_q : i4
        %109 = comb.mux %arg18, %c0_i4, %108 : i4
        %110 = comb.xor %46, %true : i1
        %111 = comb.and %25, %110, %18 : i1
        %112 = comb.mux %111, %23, %109 : i4
        %113 = comb.icmp ne %45, %c-4_i3 : i3
        %114 = comb.and %99, %113 : i1
        %115 = comb.icmp ne %45, %c3_i3 : i3
        %116 = comb.and %30, %115 : i1
        %117 = comb.icmp eq %arg2, %c0_i2 : i2
        %118 = comb.icmp eq %cmd_speed_q, %c0_i2 : i2
        %119 = comb.mux %28, %117, %118 : i1
        %120 = comb.and %36, %35 : i1
        %121 = comb.xor %120, %true : i1
        %122 = comb.or %119, %121 : i1
        verif.assert %122 : i1
        %123 = comb.icmp ne %37, %c-1_i2 : i2
        verif.assert %123 : i1
        %124 = comb.xor %29, %true : i1
        verif.assert %124 : i1
        %125 = comb.and %54, %35, %11 : i1
        %126 = comb.mux %125, %clk_cntr_q, %41 : i16
        %127 = comb.mux %125, %bit_cntr_q, %77 : i3
        %128 = comb.mux %125, %byte_cntr_cpha0_q, %79 : i20
        %129 = comb.mux %125, %byte_cntr_cpha1_q, %81 : i20
        %130 = comb.mux %125, %wait_cntr_q, %112 : i4
        fsm.update %wait_cntr_q, %130 : i4
        fsm.update %byte_cntr_cpha1_q, %129 : i20
        fsm.update %byte_cntr_cpha0_q, %128 : i20
        fsm.update %bit_cntr_q, %127 : i3
        fsm.update %clk_cntr_q, %126 : i16
        %131 = comb.xor %125, %true : i1
        %132 = comb.and %28, %131 : i1
        %133 = comb.mux %132, %arg14, %csid_q : i1
        %134 = comb.mux %132, %arg13, %cpol_q : i1
        %135 = comb.mux %132, %arg12, %cpha_q : i1
        %136 = comb.mux %132, %arg11, %full_cyc_q : i1
        %137 = comb.mux %132, %arg8, %csnidle_q : i4
        %138 = comb.mux %132, %arg9, %csnlead_q : i4
        %139 = comb.mux %132, %arg10, %csntrail_q : i4
        %140 = comb.mux %132, %arg7, %clkdiv_q : i16
        %141 = comb.mux %132, %arg6, %csaat_q : i1
        %142 = comb.mux %132, %arg3, %cmd_wr_en_q : i1
        %143 = comb.mux %132, %arg4, %cmd_rd_en_q : i1
        %144 = comb.mux %132, %arg2, %cmd_speed_q : i2
        %145 = comb.mux %132, %arg5, %cmd_len_q : i20
        %146 = comb.and %46, %131 : i1
        %147 = comb.mux bin %146, %cmd_rd_en_q, %segment_rd_en_cpha1 : i1
        %148 = comb.and %12, %131 : i1
        %149 = comb.mux %148, %54, %sample_en_q : i1
        %150 = comb.mux %148, %sample_en_q, %sample_en_q2 : i1
        %151 = comb.mux bin %125, %u_sck_flop2Fq_o, %116 : i1
        %152 = comb.mux %131, %114, %csb_q : i1
        %153 = comb.or %29, %152 : i1
        fsm.update %csb_q, %153 : i1
        fsm.update %u_sck_flop2Fq_o, %151 : i1
        fsm.update %sample_en_q2, %150 : i1
        fsm.update %sample_en_q, %149 : i1
        fsm.update %segment_rd_en_cpha1, %147 : i1
        fsm.update %cmd_len_q, %145 : i20
        fsm.update %cmd_speed_q, %144 : i2
        fsm.update %cmd_wr_en_q, %142 : i1
        fsm.update %cmd_rd_en_q, %143 : i1
        fsm.update %csaat_q, %141 : i1
        fsm.update %clkdiv_q, %140 : i16
        fsm.update %csntrail_q, %139 : i4
        fsm.update %csnlead_q, %138 : i4
        fsm.update %csnidle_q, %137 : i4
        fsm.update %full_cyc_q, %136 : i1
        fsm.update %cpha_q, %135 : i1
        fsm.update %cpol_q, %134 : i1
        fsm.update %csid_q, %133 : i1
      }
    }
  }
}

