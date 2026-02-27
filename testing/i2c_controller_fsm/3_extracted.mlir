module {
  fsm.machine @i2c_controller_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i7, %arg8: i8, %arg9: i1, %arg10: i1, %arg11: i1, %arg12: i1, %arg13: i1, %arg14: i1, %arg15: i1, %arg16: i13, %arg17: i13, %arg18: i13, %arg19: i13, %arg20: i13, %arg21: i13, %arg22: i13, %arg23: i13, %arg24: i1, %arg25: i30, %arg26: i1, %arg27: i31, %arg28: i1) -> (i1, i1, i1, i1, i1, i8, i1, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "state_0"} {
    %tcount_q = fsm.variable "tcount_q" {initValue = -1 : i16} : i16
    %stretch_idle_cnt = fsm.variable "stretch_idle_cnt" {initValue = 0 : i31} : i31
    %stretch_predict_cnt_expired = fsm.variable "stretch_predict_cnt_expired" {initValue = false} : i1
    %unhandled_nak_cnt = fsm.variable "unhandled_nak_cnt" {initValue = 0 : i31} : i31
    %unhandled_nak_cnt_expired = fsm.variable "unhandled_nak_cnt_expired" {initValue = false} : i1
    %bit_index = fsm.variable "bit_index" {initValue = -1 : i3} : i3
    %read_byte = fsm.variable "read_byte" {initValue = 0 : i8} : i8
    %byte_index = fsm.variable "byte_index" {initValue = 0 : i9} : i9
    %scl_i_q = fsm.variable "scl_i_q" {initValue = true} : i1
    %sda_i_q = fsm.variable "sda_i_q" {initValue = true} : i1
    %trans_started = fsm.variable "trans_started" {initValue = false} : i1
    %pend_restart = fsm.variable "pend_restart" {initValue = false} : i1
    %auto_stop_q = fsm.variable "auto_stop_q" {initValue = false} : i1
    fsm.state @state_0 output {
      %true = hw.constant true
      %c0_i8 = hw.constant 0 : i8
      %0 = comb.xor %trans_started, %true : i1
      %true_0 = hw.constant true
      %false = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %1 = ltl.past %0, 1 : i1
      %2 = comb.xor %1, %true : i1
      %3 = comb.and bin %0, %2 : i1
      %4 = ltl.delay %0, 1, 0 : i1
      %5 = ltl.implication %3, %4 : i1, !ltl.sequence
      verif.assert %5 : !ltl.property
      fsm.output %0, %true_0, %false, %false_1, %false_2, %c0_i8, %0, %false_3, %unhandled_nak_cnt_expired, %arg24, %false_4, %false_7, %false_5, %false_6 : i1, i1, i1, i1, i1, i8, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %0 = comb.xor %arg4, %true : i1
        %1 = comb.xor %trans_started, %true : i1
        %2 = comb.or %arg14, %arg15, %arg5 : i1
        %3 = comb.or %trans_started, %arg3 : i1
        %4 = comb.icmp eq %arg7, %c1_i7 : i7
        %5 = comb.or %0, %4, %arg14, %1 : i1
        %6 = comb.xor %5, %true : i1
        %7 = comb.xor %2, %true : i1
        %8 = comb.xor %arg6, %true : i1
        %9 = comb.and %7, %arg4 : i1
        %10 = comb.and %arg6, %9 : i1
        %11 = comb.and %2, %arg4 : i1
        %12 = comb.and %9, %8 : i1
        %13 = comb.and %trans_started, %arg24 : i1
        %14 = comb.and %arg4, %6 : i1
        %15 = comb.mux %10, %3, %14 : i1
        %true_0 = hw.constant true
        %16 = comb.xor %11, %true_0 : i1
        %true_1 = hw.constant true
        %17 = comb.xor %12, %true_1 : i1
        %true_2 = hw.constant true
        %18 = comb.xor %13, %true_2 : i1
        %19 = comb.and %18, %17, %16, %15 : i1
        %20 = ltl.past %1, 1 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and bin %1, %21 : i1
        %23 = ltl.delay %1, 1, 0 : i1
        %24 = ltl.implication %22, %23 : i1, !ltl.sequence
        verif.assert %24 : !ltl.property
        fsm.return %19
      } action {
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %byte_index, %byte_index : i9
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %c2_i31 = hw.constant 2 : i31
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg17 : i3, i13
        %1 = comb.concat %c0_i3, %arg23 : i3, i13
        %2 = comb.concat %c0_i3, %arg19 : i3, i13
        %3 = comb.add %2, %0 : i16
        %4 = comb.sub %3, %1 : i16
        %5 = comb.xor %arg4, %true : i1
        %6 = comb.add %tcount_q, %c-1_i16 : i16
        %7 = comb.concat %c0_i18, %arg18 : i18, i13
        %8 = comb.add %7, %c2_i31 : i31
        %9 = comb.icmp eq %stretch_idle_cnt, %8 : i31
        %10 = comb.add %unhandled_nak_cnt, %c1_i31 : i31
        %11 = comb.icmp ugt %unhandled_nak_cnt, %arg27 : i31
        %12 = comb.and %pend_restart, %5 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %arg15, %true : i1
        %15 = comb.and %arg14, %arg4, %arg28, %14 : i1
        %16 = comb.xor %trans_started, %true : i1
        %17 = comb.or %arg14, %arg15, %arg5 : i1
        %18 = comb.and %trans_started, %unhandled_nak_cnt_expired : i1
        %19 = comb.or %arg4, %trans_started : i1
        %20 = comb.xor %17, %true : i1
        %21 = comb.and %20, %arg4 : i1
        %22 = comb.and %arg6, %21 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %23, %19 : i1
        %true_0 = hw.constant true
        %25 = comb.xor %trans_started, %true_0 : i1
        %26 = comb.or %22, %arg4, %25 : i1
        %27 = comb.or %22, %arg4 : i1
        %true_1 = hw.constant true
        %28 = comb.xor %27, %true_1 : i1
        %29 = comb.and %28, %trans_started : i1
        %30 = comb.or %29, %auto_stop_q : i1
        %31 = comb.or %18, %auto_stop_q : i1
        %32 = comb.and %17, %arg4 : i1
        %33 = comb.mux %32, %18, %24 : i1
        %34 = comb.mux %32, %31, %30 : i1
        %35 = comb.xor %arg6, %true : i1
        %36 = comb.and %21, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %37, %33 : i1
        %39 = comb.mux %36, %auto_stop_q, %34 : i1
        %40 = ltl.past %16, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.and bin %16, %41 : i1
        %43 = ltl.delay %16, 1, 0 : i1
        %44 = ltl.implication %42, %43 : i1, !ltl.sequence
        verif.assert %44 : !ltl.property
        fsm.update %auto_stop_q, %39 : i1
        fsm.update %stretch_predict_cnt_expired, %9 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %true_2 = hw.constant true
        %45 = comb.xor %26, %true_2 : i1
        %46 = comb.mux %32, %18, %45 : i1
        %true_3 = hw.constant true
        %47 = comb.xor %36, %true_3 : i1
        %48 = comb.and %trans_started, %5 : i1
        %49 = comb.or %arg4, %48 : i1
        %50 = comb.xor %38, %true : i1
        %51 = comb.or %38, %49 : i1
        %52 = comb.mux %51, %c1_i16, %tcount_q : i16
        %53 = comb.and %47, %46, %38 : i1
        %54 = comb.mux %53, %4, %52 : i16
        %55 = comb.and %49, %50 : i1
        %56 = comb.mux %55, %6, %54 : i16
        %57 = comb.xor %15, %true : i1
        %58 = comb.mux %57, %c0_i31, %10 : i31
        %59 = comb.and %15, %11 : i1
        %60 = comb.or %57, %11 : i1
        %61 = comb.mux bin %60, %59, %unhandled_nak_cnt_expired : i1
        %62 = comb.or %5, %arg24 : i1
        %63 = comb.and %trans_started, %62 : i1
        %64 = comb.xor %63, %true : i1
        %true_4 = hw.constant true
        %65 = comb.xor %63, %true_4 : i1
        %66 = comb.or %65, %64 : i1
        %67 = comb.and %66, %trans_started : i1
        %true_5 = hw.constant true
        %68 = comb.xor %12, %true_5 : i1
        %69 = comb.or %68, %13 : i1
        %70 = comb.and %69, %pend_restart : i1
        fsm.update %pend_restart, %70 : i1
        fsm.update %trans_started, %67 : i1
        fsm.update %unhandled_nak_cnt_expired, %61 : i1
        fsm.update %unhandled_nak_cnt, %58 : i31
        fsm.update %tcount_q, %56 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %0 = comb.xor %arg4, %true : i1
        %1 = comb.xor %trans_started, %true : i1
        %2 = comb.or %arg14, %arg15, %arg5 : i1
        %3 = comb.and %trans_started, %unhandled_nak_cnt_expired : i1
        %4 = comb.or %trans_started, %arg3 : i1
        %5 = comb.icmp eq %arg7, %c1_i7 : i7
        %6 = comb.or %5, %arg14, %1 : i1
        %7 = comb.xor %2, %true : i1
        %8 = comb.xor %arg6, %true : i1
        %9 = comb.and %7, %arg4 : i1
        %10 = comb.and %arg6, %9 : i1
        %11 = comb.and %2, %arg4 : i1
        %12 = comb.and %9, %8 : i1
        %13 = comb.and %trans_started, %arg24 : i1
        %true_0 = hw.constant true
        %14 = comb.xor %3, %true_0 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %4, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %trans_started, %true_2 : i1
        %17 = comb.mux %0, %16, %6 : i1
        %18 = comb.mux %10, %15, %17 : i1
        %19 = comb.mux %11, %14, %18 : i1
        %20 = comb.or %13, %12, %19 : i1
        %21 = ltl.past %1, 1 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.and bin %1, %22 : i1
        %24 = ltl.delay %1, 1, 0 : i1
        %25 = ltl.implication %23, %24 : i1, !ltl.sequence
        verif.assert %25 : !ltl.property
        fsm.return %20
      } action {
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %byte_index, %byte_index : i9
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %c2_i31 = hw.constant 2 : i31
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg17 : i3, i13
        %1 = comb.concat %c0_i3, %arg23 : i3, i13
        %2 = comb.concat %c0_i3, %arg19 : i3, i13
        %3 = comb.add %2, %0 : i16
        %4 = comb.sub %3, %1 : i16
        %5 = comb.xor %arg4, %true : i1
        %6 = comb.add %tcount_q, %c-1_i16 : i16
        %7 = comb.concat %c0_i18, %arg18 : i18, i13
        %8 = comb.add %7, %c2_i31 : i31
        %9 = comb.icmp eq %stretch_idle_cnt, %8 : i31
        %10 = comb.add %unhandled_nak_cnt, %c1_i31 : i31
        %11 = comb.icmp ugt %unhandled_nak_cnt, %arg27 : i31
        %12 = comb.and %pend_restart, %5 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %arg15, %true : i1
        %15 = comb.and %arg14, %arg4, %arg28, %14 : i1
        %16 = comb.xor %trans_started, %true : i1
        %17 = comb.or %arg14, %arg15, %arg5 : i1
        %18 = comb.and %trans_started, %unhandled_nak_cnt_expired : i1
        %19 = comb.or %arg4, %trans_started : i1
        %20 = comb.xor %17, %true : i1
        %21 = comb.and %20, %arg4 : i1
        %22 = comb.and %arg6, %21 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %23, %19 : i1
        %true_0 = hw.constant true
        %25 = comb.xor %trans_started, %true_0 : i1
        %26 = comb.or %22, %arg4, %25 : i1
        %27 = comb.or %22, %arg4 : i1
        %true_1 = hw.constant true
        %28 = comb.xor %27, %true_1 : i1
        %29 = comb.and %28, %trans_started : i1
        %30 = comb.or %29, %auto_stop_q : i1
        %31 = comb.or %18, %auto_stop_q : i1
        %32 = comb.and %17, %arg4 : i1
        %33 = comb.mux %32, %18, %24 : i1
        %34 = comb.mux %32, %31, %30 : i1
        %35 = comb.xor %arg6, %true : i1
        %36 = comb.and %21, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %37, %33 : i1
        %39 = comb.mux %36, %auto_stop_q, %34 : i1
        %40 = ltl.past %16, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.and bin %16, %41 : i1
        %43 = ltl.delay %16, 1, 0 : i1
        %44 = ltl.implication %42, %43 : i1, !ltl.sequence
        verif.assert %44 : !ltl.property
        fsm.update %auto_stop_q, %39 : i1
        fsm.update %stretch_predict_cnt_expired, %9 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %true_2 = hw.constant true
        %45 = comb.xor %26, %true_2 : i1
        %46 = comb.mux %32, %18, %45 : i1
        %true_3 = hw.constant true
        %47 = comb.xor %36, %true_3 : i1
        %48 = comb.and %trans_started, %5 : i1
        %49 = comb.or %arg4, %48 : i1
        %50 = comb.xor %38, %true : i1
        %51 = comb.or %38, %49 : i1
        %52 = comb.mux %51, %c1_i16, %tcount_q : i16
        %53 = comb.and %47, %46, %38 : i1
        %54 = comb.mux %53, %4, %52 : i16
        %55 = comb.and %49, %50 : i1
        %56 = comb.mux %55, %6, %54 : i16
        %57 = comb.xor %15, %true : i1
        %58 = comb.mux %57, %c0_i31, %10 : i31
        %59 = comb.and %15, %11 : i1
        %60 = comb.or %57, %11 : i1
        %61 = comb.mux bin %60, %59, %unhandled_nak_cnt_expired : i1
        %62 = comb.or %5, %arg24 : i1
        %63 = comb.and %trans_started, %62 : i1
        %64 = comb.xor %63, %true : i1
        %true_4 = hw.constant true
        %65 = comb.xor %63, %true_4 : i1
        %66 = comb.or %65, %64 : i1
        %67 = comb.and %66, %trans_started : i1
        %true_5 = hw.constant true
        %68 = comb.xor %12, %true_5 : i1
        %69 = comb.or %68, %13 : i1
        %70 = comb.and %69, %pend_restart : i1
        fsm.update %pend_restart, %70 : i1
        fsm.update %trans_started, %67 : i1
        fsm.update %unhandled_nak_cnt_expired, %61 : i1
        fsm.update %unhandled_nak_cnt, %58 : i31
        fsm.update %tcount_q, %56 : i16
      }
    }
    fsm.state @state_1 output {
      %true = hw.constant true
      %c0_i8 = hw.constant 0 : i8
      %0 = comb.xor %trans_started, %true : i1
      %1 = comb.and %arg9, %0 : i1
      %true_0 = hw.constant true
      %false = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %2 = ltl.past %1, 1 : i1
      %3 = comb.xor %2, %true : i1
      %4 = comb.and bin %1, %3 : i1
      %5 = ltl.delay %1, 1, 0 : i1
      %6 = ltl.implication %4, %5 : i1, !ltl.sequence
      verif.assert %6 : !ltl.property
      fsm.output %1, %true_0, %false, %false_2, %false_3, %c0_i8, %false_1, %false_4, %unhandled_nak_cnt_expired, %arg24, %false_5, %false_8, %false_6, %false_7 : i1, i1, i1, i1, i1, i8, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %0 = comb.xor %arg4, %true : i1
        %1 = comb.xor %trans_started, %true : i1
        %2 = comb.and %arg9, %1 : i1
        %3 = comb.icmp eq %arg7, %c1_i7 : i7
        %4 = comb.or %0, %3, %arg14, %1 : i1
        %5 = comb.xor %4, %true : i1
        %c3_i4 = hw.constant 3 : i4
        %c-7_i4 = hw.constant -7 : i4
        %6 = comb.mux %2, %c3_i4, %c-7_i4 : i4
        %7 = comb.xor %arg11, %true : i1
        %c0_i3 = hw.constant 0 : i3
        %8 = comb.concat %c0_i3, %5 : i3, i1
        %9 = comb.mux %7, %6, %8 : i4
        %10 = comb.and %trans_started, %arg24 : i1
        %11 = comb.extract %9 from 3 : (i4) -> i1
        %12 = comb.extract %9 from 0 : (i4) -> i2
        %13 = comb.concat %11, %12 : i1, i2
        %c1_i3 = hw.constant 1 : i3
        %14 = comb.icmp eq %13, %c1_i3 : i3
        %true_0 = hw.constant true
        %15 = comb.xor %arg11, %true_0 : i1
        %true_1 = hw.constant true
        %16 = comb.xor %10, %true_1 : i1
        %17 = comb.and %16, %15, %14 : i1
        %18 = ltl.past %2, 1 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and bin %2, %19 : i1
        %21 = ltl.delay %2, 1, 0 : i1
        %22 = ltl.implication %20, %21 : i1, !ltl.sequence
        verif.assert %22 : !ltl.property
        fsm.return %17
      } action {
        fsm.update %auto_stop_q, %auto_stop_q : i1
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %false = hw.constant false
        %c2_i31 = hw.constant 2 : i31
        %c0_i31 = hw.constant 0 : i31
        %c1_i16 = hw.constant 1 : i16
        %c-7_i4 = hw.constant -7 : i4
        %c3_i4 = hw.constant 3 : i4
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.concat %c0_i3, %arg17 : i3, i13
        %1 = comb.concat %c0_i3, %arg23 : i3, i13
        %2 = comb.sub %0, %1 : i16
        %3 = comb.xor %arg4, %true : i1
        %4 = comb.concat %c0_i18, %arg18 : i18, i13
        %5 = comb.add %4, %c2_i31 : i31
        %6 = comb.icmp eq %stretch_idle_cnt, %5 : i31
        %false_0 = hw.constant false
        %7 = comb.concat %false, %arg8 : i1, i8
        %8 = comb.concat %arg11, %c0_i8 : i1, i8
        %9 = comb.icmp ne %arg8, %c0_i8 : i8
        %10 = comb.and %9, %arg11 : i1
        %11 = comb.mux %10, %7, %8 : i9
        %12 = comb.and %pend_restart, %3 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %trans_started, %true : i1
        %15 = comb.and %arg9, %14 : i1
        %16 = comb.mux %15, %c0_i4, %c3_i4 : i4
        %17 = comb.xor %15, %true : i1
        %18 = comb.xor %arg11, %true : i1
        %19 = comb.mux %18, %16, %c-7_i4 : i4
        %20 = comb.mux %arg11, %c3_i4, %19 : i4
        %21 = comb.xor %arg11, %true : i1
        %22 = ltl.past %15, 1 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and bin %15, %23 : i1
        %25 = ltl.delay %15, 1, 0 : i1
        %26 = ltl.implication %24, %25 : i1, !ltl.sequence
        verif.assert %26 : !ltl.property
        fsm.update %unhandled_nak_cnt_expired, %false_0 : i1
        fsm.update %unhandled_nak_cnt, %c0_i31 : i31
        fsm.update %stretch_predict_cnt_expired, %6 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %27 = comb.extract %20 from 3 : (i4) -> i1
        %28 = comb.extract %20 from 0 : (i4) -> i2
        %29 = comb.concat %27, %28 : i1, i2
        %c0_i3_1 = hw.constant 0 : i3
        %30 = comb.icmp eq %29, %c0_i3_1 : i3
        %31 = comb.extract %20 from 3 : (i4) -> i1
        %32 = comb.extract %20 from 0 : (i4) -> i2
        %33 = comb.concat %31, %32 : i1, i2
        %c1_i3 = hw.constant 1 : i3
        %34 = comb.icmp eq %33, %c1_i3 : i3
        %35 = comb.extract %20 from 3 : (i4) -> i1
        %36 = comb.extract %20 from 0 : (i4) -> i2
        %37 = comb.concat %35, %36 : i1, i2
        %c2_i3 = hw.constant 2 : i3
        %38 = comb.icmp eq %37, %c2_i3 : i3
        %39 = comb.extract %20 from 3 : (i4) -> i1
        %40 = comb.extract %20 from 0 : (i4) -> i2
        %41 = comb.concat %39, %40 : i1, i2
        %c3_i3 = hw.constant 3 : i3
        %42 = comb.icmp eq %41, %c3_i3 : i3
        %43 = comb.extract %20 from 3 : (i4) -> i1
        %44 = comb.extract %20 from 0 : (i4) -> i2
        %45 = comb.concat %43, %44 : i1, i2
        %c-4_i3 = hw.constant -4 : i3
        %46 = comb.icmp eq %45, %c-4_i3 : i3
        %47 = comb.xor %30, %true : i1
        %48 = comb.xor %34, %true : i1
        %49 = comb.xor %38, %true : i1
        %50 = comb.xor %42, %true : i1
        %51 = comb.and %47, %34 : i1
        %52 = comb.mux %51, %arg20, %arg22 : i13
        %53 = comb.xor %51, %true : i1
        %54 = comb.or %30, %53 : i1
        %55 = comb.mux %54, %arg18, %arg19 : i13
        %56 = comb.mux %30, %arg21, %52 : i13
        %57 = comb.concat %c0_i3, %55 : i3, i13
        %58 = comb.concat %c0_i3, %56 : i3, i13
        %59 = comb.add %57, %58 : i16
        %60 = comb.mux %38, %arg23, %arg16 : i13
        %61 = comb.concat %c0_i3, %60 : i3, i13
        %62 = comb.and %48, %47 : i1
        %63 = comb.and %49, %62 : i1
        %64 = comb.and %42, %63 : i1
        %65 = comb.mux %64, %2, %c1_i16 : i16
        %66 = comb.and %38, %62 : i1
        %67 = comb.mux %66, %61, %65 : i16
        %68 = comb.and %46, %50, %63 : i1
        %69 = comb.and %34, %47 : i1
        %70 = comb.or %68, %69, %30 : i1
        %71 = comb.mux %70, %59, %67 : i16
        %72 = comb.mux %arg11, %11, %byte_index : i9
        %73 = comb.or %3, %arg24 : i1
        %74 = comb.and %trans_started, %73 : i1
        %75 = comb.xor %74, %true : i1
        %true_2 = hw.constant true
        %76 = comb.xor %74, %true_2 : i1
        %77 = comb.or %76, %75 : i1
        %78 = comb.and %77, %trans_started : i1
        %79 = comb.and %13, %21, %18, %17, %arg9 : i1
        %80 = comb.or %79, %pend_restart : i1
        %81 = comb.and %13, %80 : i1
        %82 = comb.or %12, %79 : i1
        %83 = comb.mux bin %82, %81, %pend_restart : i1
        fsm.update %pend_restart, %83 : i1
        fsm.update %trans_started, %78 : i1
        fsm.update %byte_index, %72 : i9
        fsm.update %tcount_q, %71 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %0 = comb.xor %arg4, %true : i1
        %1 = comb.xor %trans_started, %true : i1
        %2 = comb.and %arg9, %1 : i1
        %3 = comb.icmp eq %arg7, %c1_i7 : i7
        %4 = comb.or %0, %3, %arg14, %1 : i1
        %5 = comb.xor %4, %true : i1
        %c3_i4 = hw.constant 3 : i4
        %c-7_i4 = hw.constant -7 : i4
        %6 = comb.mux %2, %c3_i4, %c-7_i4 : i4
        %7 = comb.xor %arg11, %true : i1
        %c0_i3 = hw.constant 0 : i3
        %8 = comb.concat %c0_i3, %5 : i3, i1
        %9 = comb.mux %7, %6, %8 : i4
        %10 = comb.and %trans_started, %arg24 : i1
        %11 = comb.extract %9 from 3 : (i4) -> i1
        %12 = comb.extract %9 from 0 : (i4) -> i2
        %13 = comb.concat %11, %12 : i1, i2
        %c0_i3_0 = hw.constant 0 : i3
        %14 = comb.icmp eq %13, %c0_i3_0 : i3
        %true_1 = hw.constant true
        %15 = comb.xor %arg11, %true_1 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.or %10, %16 : i1
        %18 = ltl.past %2, 1 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and bin %2, %19 : i1
        %21 = ltl.delay %2, 1, 0 : i1
        %22 = ltl.implication %20, %21 : i1, !ltl.sequence
        verif.assert %22 : !ltl.property
        fsm.return %17
      } action {
        fsm.update %auto_stop_q, %auto_stop_q : i1
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %false = hw.constant false
        %c2_i31 = hw.constant 2 : i31
        %c0_i31 = hw.constant 0 : i31
        %c1_i16 = hw.constant 1 : i16
        %c-7_i4 = hw.constant -7 : i4
        %c3_i4 = hw.constant 3 : i4
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.concat %c0_i3, %arg17 : i3, i13
        %1 = comb.concat %c0_i3, %arg23 : i3, i13
        %2 = comb.sub %0, %1 : i16
        %3 = comb.xor %arg4, %true : i1
        %4 = comb.concat %c0_i18, %arg18 : i18, i13
        %5 = comb.add %4, %c2_i31 : i31
        %6 = comb.icmp eq %stretch_idle_cnt, %5 : i31
        %false_0 = hw.constant false
        %7 = comb.concat %false, %arg8 : i1, i8
        %8 = comb.concat %arg11, %c0_i8 : i1, i8
        %9 = comb.icmp ne %arg8, %c0_i8 : i8
        %10 = comb.and %9, %arg11 : i1
        %11 = comb.mux %10, %7, %8 : i9
        %12 = comb.and %pend_restart, %3 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %trans_started, %true : i1
        %15 = comb.and %arg9, %14 : i1
        %16 = comb.mux %15, %c0_i4, %c3_i4 : i4
        %17 = comb.xor %15, %true : i1
        %18 = comb.xor %arg11, %true : i1
        %19 = comb.mux %18, %16, %c-7_i4 : i4
        %20 = comb.mux %arg11, %c3_i4, %19 : i4
        %21 = comb.xor %arg11, %true : i1
        %22 = ltl.past %15, 1 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and bin %15, %23 : i1
        %25 = ltl.delay %15, 1, 0 : i1
        %26 = ltl.implication %24, %25 : i1, !ltl.sequence
        verif.assert %26 : !ltl.property
        fsm.update %unhandled_nak_cnt_expired, %false_0 : i1
        fsm.update %unhandled_nak_cnt, %c0_i31 : i31
        fsm.update %stretch_predict_cnt_expired, %6 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %27 = comb.extract %20 from 3 : (i4) -> i1
        %28 = comb.extract %20 from 0 : (i4) -> i2
        %29 = comb.concat %27, %28 : i1, i2
        %c0_i3_1 = hw.constant 0 : i3
        %30 = comb.icmp eq %29, %c0_i3_1 : i3
        %31 = comb.extract %20 from 3 : (i4) -> i1
        %32 = comb.extract %20 from 0 : (i4) -> i2
        %33 = comb.concat %31, %32 : i1, i2
        %c1_i3 = hw.constant 1 : i3
        %34 = comb.icmp eq %33, %c1_i3 : i3
        %35 = comb.extract %20 from 3 : (i4) -> i1
        %36 = comb.extract %20 from 0 : (i4) -> i2
        %37 = comb.concat %35, %36 : i1, i2
        %c2_i3 = hw.constant 2 : i3
        %38 = comb.icmp eq %37, %c2_i3 : i3
        %39 = comb.extract %20 from 3 : (i4) -> i1
        %40 = comb.extract %20 from 0 : (i4) -> i2
        %41 = comb.concat %39, %40 : i1, i2
        %c3_i3 = hw.constant 3 : i3
        %42 = comb.icmp eq %41, %c3_i3 : i3
        %43 = comb.extract %20 from 3 : (i4) -> i1
        %44 = comb.extract %20 from 0 : (i4) -> i2
        %45 = comb.concat %43, %44 : i1, i2
        %c-4_i3 = hw.constant -4 : i3
        %46 = comb.icmp eq %45, %c-4_i3 : i3
        %47 = comb.xor %30, %true : i1
        %48 = comb.xor %34, %true : i1
        %49 = comb.xor %38, %true : i1
        %50 = comb.xor %42, %true : i1
        %51 = comb.and %47, %34 : i1
        %52 = comb.mux %51, %arg20, %arg22 : i13
        %53 = comb.xor %51, %true : i1
        %54 = comb.or %30, %53 : i1
        %55 = comb.mux %54, %arg18, %arg19 : i13
        %56 = comb.mux %30, %arg21, %52 : i13
        %57 = comb.concat %c0_i3, %55 : i3, i13
        %58 = comb.concat %c0_i3, %56 : i3, i13
        %59 = comb.add %57, %58 : i16
        %60 = comb.mux %38, %arg23, %arg16 : i13
        %61 = comb.concat %c0_i3, %60 : i3, i13
        %62 = comb.and %48, %47 : i1
        %63 = comb.and %49, %62 : i1
        %64 = comb.and %42, %63 : i1
        %65 = comb.mux %64, %2, %c1_i16 : i16
        %66 = comb.and %38, %62 : i1
        %67 = comb.mux %66, %61, %65 : i16
        %68 = comb.and %46, %50, %63 : i1
        %69 = comb.and %34, %47 : i1
        %70 = comb.or %68, %69, %30 : i1
        %71 = comb.mux %70, %59, %67 : i16
        %72 = comb.mux %arg11, %11, %byte_index : i9
        %73 = comb.or %3, %arg24 : i1
        %74 = comb.and %trans_started, %73 : i1
        %75 = comb.xor %74, %true : i1
        %true_2 = hw.constant true
        %76 = comb.xor %74, %true_2 : i1
        %77 = comb.or %76, %75 : i1
        %78 = comb.and %77, %trans_started : i1
        %79 = comb.and %13, %21, %18, %17, %arg9 : i1
        %80 = comb.or %79, %pend_restart : i1
        %81 = comb.and %13, %80 : i1
        %82 = comb.or %12, %79 : i1
        %83 = comb.mux bin %82, %81, %pend_restart : i1
        fsm.update %pend_restart, %83 : i1
        fsm.update %trans_started, %78 : i1
        fsm.update %byte_index, %72 : i9
        fsm.update %tcount_q, %71 : i16
      }
    }
  }
}

