module {
  %false = hw.constant false
  %false_0 = hw.constant false
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
    %isFirstCycle = fsm.variable "isFirstCycle" {initValue = true} : i1
    %isSecondCycle = fsm.variable "isSecondCycle" {initValue = false} : i1
    %false_1 = hw.constant false
    %_sh1 = fsm.variable "_sh1" {initValue = false} : i1
    %false_2 = hw.constant false
    %_sh1_3 = fsm.variable "_sh1" {initValue = false} : i1
    fsm.state @state_0 output {
      %true = hw.constant true
      %c0_i8 = hw.constant 0 : i8
      %0 = comb.xor %trans_started, %true : i1
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
      %false_11 = hw.constant false
      %false_12 = hw.constant false
      %1 = comb.xor %isFirstCycle, %true : i1
      %2 = comb.xor %isSecondCycle, %true : i1
      %3 = comb.icmp ult %_sh1_3, %_sh1 : i1
      %4 = comb.and %1, %2, %3 : i1
      %5 = comb.xor %4, %true : i1
      %6 = comb.or %5, %0 : i1
      verif.assert %6 : i1
      fsm.output %0, %true_4, %false_5, %false_6, %false_7, %c0_i8, %0, %false_8, %unhandled_nak_cnt_expired, %arg24, %false_9, %false_12, %false_10, %false_11 : i1, i1, i1, i1, i1, i8, i1, i1, i1, i1, i1, i1, i1, i1
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
        %9 = comb.xor %isFirstCycle, %true : i1
        %10 = comb.xor %isSecondCycle, %true : i1
        %11 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %12 = comb.and %9, %10, %11 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.and %7, %arg4 : i1
        %15 = comb.and %arg6, %14 : i1
        %16 = comb.and %2, %arg4 : i1
        %17 = comb.and %14, %8 : i1
        %18 = comb.and %trans_started, %arg24 : i1
        %19 = comb.and %arg4, %6 : i1
        %20 = comb.mux %15, %3, %19 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %16, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %17, %true_5 : i1
        %true_6 = hw.constant true
        %23 = comb.xor %18, %true_6 : i1
        %24 = comb.and %23, %22, %21, %20 : i1
        %25 = comb.or %13, %1 : i1
        verif.assert %25 : i1
        fsm.return %24
      } action {
        fsm.update %_sh1_3, %_sh1 : i1
        fsm.update %isSecondCycle, %isFirstCycle : i1
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %byte_index, %byte_index : i9
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %false_4 = hw.constant false
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
        %6 = comb.and %trans_started, %5 : i1
        %7 = comb.or %arg4, %6 : i1
        %8 = comb.add %tcount_q, %c-1_i16 : i16
        %9 = comb.concat %c0_i18, %arg18 : i18, i13
        %10 = comb.add %9, %c2_i31 : i31
        %11 = comb.icmp eq %stretch_idle_cnt, %10 : i31
        %12 = comb.add %unhandled_nak_cnt, %c1_i31 : i31
        %13 = comb.icmp ugt %unhandled_nak_cnt, %arg27 : i31
        %14 = comb.or %5, %arg24 : i1
        %15 = comb.and %trans_started, %14 : i1
        %16 = comb.xor %15, %true : i1
        %true_5 = hw.constant true
        %17 = comb.xor %15, %true_5 : i1
        %18 = comb.or %17, %16 : i1
        %19 = comb.and %18, %trans_started : i1
        %20 = comb.and %pend_restart, %5 : i1
        %21 = comb.xor %20, %true : i1
        %true_6 = hw.constant true
        %22 = comb.xor %20, %true_6 : i1
        %23 = comb.or %22, %21 : i1
        %24 = comb.and %23, %pend_restart : i1
        %25 = comb.xor %arg15, %true : i1
        %26 = comb.and %arg14, %arg4, %arg28, %25 : i1
        %27 = comb.xor %trans_started, %true : i1
        %28 = comb.or %arg14, %arg15, %arg5 : i1
        %29 = comb.or %arg4, %trans_started : i1
        %30 = comb.xor %28, %true : i1
        %31 = comb.and %arg6, %30, %arg4 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %32, %29 : i1
        %true_7 = hw.constant true
        %34 = comb.xor %31, %true_7 : i1
        %35 = comb.and %34, %5, %trans_started : i1
        %36 = comb.or %35, %auto_stop_q : i1
        %37 = comb.xor %isFirstCycle, %true : i1
        %38 = comb.xor %isSecondCycle, %true : i1
        %39 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %40 = comb.and %37, %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %41, %27 : i1
        verif.assert %42 : i1
        fsm.update %_sh1, %27 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %auto_stop_q, %36 : i1
        fsm.update %pend_restart, %24 : i1
        fsm.update %trans_started, %19 : i1
        fsm.update %stretch_predict_cnt_expired, %11 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %true_8 = hw.constant true
        %43 = comb.xor %31, %true_8 : i1
        %44 = comb.xor %33, %true : i1
        %45 = comb.or %33, %7 : i1
        %46 = comb.mux %45, %c1_i16, %tcount_q : i16
        %47 = comb.and %43, %5, %trans_started, %33 : i1
        %48 = comb.mux %47, %4, %46 : i16
        %49 = comb.and %7, %44 : i1
        %50 = comb.mux %49, %8, %48 : i16
        %51 = comb.xor %26, %true : i1
        %52 = comb.mux %51, %c0_i31, %12 : i31
        %53 = comb.and %26, %13 : i1
        %54 = comb.or %51, %13 : i1
        %55 = comb.mux bin %54, %53, %unhandled_nak_cnt_expired : i1
        fsm.update %unhandled_nak_cnt_expired, %55 : i1
        fsm.update %unhandled_nak_cnt, %52 : i31
        fsm.update %tcount_q, %50 : i16
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
        %9 = comb.xor %isFirstCycle, %true : i1
        %10 = comb.xor %isSecondCycle, %true : i1
        %11 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %12 = comb.and %9, %10, %11 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.and %7, %arg4 : i1
        %15 = comb.and %arg6, %14 : i1
        %16 = comb.and %2, %arg4 : i1
        %17 = comb.and %14, %8 : i1
        %18 = comb.and %trans_started, %arg24 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %trans_started, %true_6 : i1
        %22 = comb.mux %0, %21, %6 : i1
        %23 = comb.mux %15, %20, %22 : i1
        %24 = comb.mux %16, %19, %23 : i1
        %25 = comb.or %18, %17, %24 : i1
        %26 = comb.or %13, %1 : i1
        verif.assert %26 : i1
        fsm.return %25
      } action {
        fsm.update %_sh1_3, %_sh1 : i1
        fsm.update %isSecondCycle, %isFirstCycle : i1
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %byte_index, %byte_index : i9
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %false_4 = hw.constant false
        %c2_i31 = hw.constant 2 : i31
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
        %0 = comb.concat %c0_i3, %arg17 : i3, i13
        %1 = comb.concat %c0_i3, %arg23 : i3, i13
        %2 = comb.concat %c0_i3, %arg19 : i3, i13
        %3 = comb.add %2, %0 : i16
        %4 = comb.sub %3, %1 : i16
        %5 = comb.xor %arg4, %true : i1
        %6 = comb.and %trans_started, %5 : i1
        %7 = comb.or %arg4, %6 : i1
        %8 = comb.add %tcount_q, %c-1_i16 : i16
        %9 = comb.concat %c0_i18, %arg18 : i18, i13
        %10 = comb.add %9, %c2_i31 : i31
        %11 = comb.icmp eq %stretch_idle_cnt, %10 : i31
        %12 = comb.add %unhandled_nak_cnt, %c1_i31 : i31
        %13 = comb.icmp ugt %unhandled_nak_cnt, %arg27 : i31
        %14 = comb.or %5, %arg24 : i1
        %15 = comb.and %trans_started, %14 : i1
        %16 = comb.xor %15, %true : i1
        %true_6 = hw.constant true
        %17 = comb.xor %15, %true_6 : i1
        %18 = comb.or %17, %16 : i1
        %19 = comb.and %18, %trans_started : i1
        %20 = comb.and %pend_restart, %5 : i1
        %21 = comb.xor %20, %true : i1
        %true_7 = hw.constant true
        %22 = comb.xor %20, %true_7 : i1
        %23 = comb.or %22, %21 : i1
        %24 = comb.and %23, %pend_restart : i1
        %25 = comb.xor %arg15, %true : i1
        %26 = comb.and %arg14, %arg4, %arg28, %25 : i1
        %27 = comb.xor %trans_started, %true : i1
        %28 = comb.or %arg14, %arg15, %arg5 : i1
        %29 = comb.and %trans_started, %unhandled_nak_cnt_expired : i1
        %30 = comb.or %arg4, %trans_started : i1
        %31 = comb.xor %28, %true : i1
        %32 = comb.and %31, %arg4 : i1
        %33 = comb.and %arg6, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %34, %30 : i1
        %true_8 = hw.constant true
        %36 = comb.xor %33, %true_8 : i1
        %37 = comb.and %36, %5, %trans_started : i1
        %38 = comb.or %37, %auto_stop_q : i1
        %39 = comb.or %29, %auto_stop_q : i1
        %40 = comb.and %28, %arg4 : i1
        %41 = comb.mux %40, %29, %35 : i1
        %42 = comb.mux %40, %39, %38 : i1
        %43 = comb.xor %arg6, %true : i1
        %44 = comb.and %32, %43 : i1
        %45 = comb.xor %44, %true : i1
        %46 = comb.and %45, %41 : i1
        %47 = comb.mux %44, %auto_stop_q, %42 : i1
        %48 = comb.xor %isFirstCycle, %true : i1
        %49 = comb.xor %isSecondCycle, %true : i1
        %50 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %51 = comb.and %48, %49, %50 : i1
        %52 = comb.xor %51, %true : i1
        %53 = comb.or %52, %27 : i1
        verif.assert %53 : i1
        fsm.update %_sh1, %27 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %auto_stop_q, %47 : i1
        fsm.update %pend_restart, %24 : i1
        fsm.update %trans_started, %19 : i1
        fsm.update %stretch_predict_cnt_expired, %11 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %true_9 = hw.constant true
        %54 = comb.xor %33, %true_9 : i1
        %55 = comb.and %54, %5, %trans_started : i1
        %56 = comb.mux %40, %29, %55 : i1
        %57 = comb.xor %44, %true_5 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.or %46, %7 : i1
        %60 = comb.mux %59, %c1_i16, %tcount_q : i16
        %61 = comb.and %57, %56, %46 : i1
        %62 = comb.mux %61, %4, %60 : i16
        %63 = comb.and %7, %58 : i1
        %64 = comb.mux %63, %8, %62 : i16
        %65 = comb.xor %26, %true : i1
        %66 = comb.mux %65, %c0_i31, %12 : i31
        %67 = comb.and %26, %13 : i1
        %68 = comb.or %65, %13 : i1
        %69 = comb.mux bin %68, %67, %unhandled_nak_cnt_expired : i1
        fsm.update %unhandled_nak_cnt_expired, %69 : i1
        fsm.update %unhandled_nak_cnt, %66 : i31
        fsm.update %tcount_q, %64 : i16
      }
    }
    fsm.state @state_1 output {
      %true = hw.constant true
      %c0_i8 = hw.constant 0 : i8
      %0 = comb.xor %trans_started, %true : i1
      %1 = comb.and %arg9, %0 : i1
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
      %false_11 = hw.constant false
      %false_12 = hw.constant false
      %false_13 = hw.constant false
      %2 = comb.xor %isFirstCycle, %true : i1
      %3 = comb.xor %isSecondCycle, %true : i1
      %4 = comb.icmp ult %_sh1_3, %_sh1 : i1
      %5 = comb.and %2, %3, %4 : i1
      %6 = comb.xor %5, %true : i1
      %7 = comb.or %6, %1 : i1
      verif.assert %7 : i1
      fsm.output %1, %true_4, %false_5, %false_7, %false_8, %c0_i8, %false_6, %false_9, %unhandled_nak_cnt_expired, %arg24, %false_10, %false_13, %false_11, %false_12 : i1, i1, i1, i1, i1, i8, i1, i1, i1, i1, i1, i1, i1, i1
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.xor %isSecondCycle, %true : i1
        %10 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %11 = comb.and %8, %9, %10 : i1
        %12 = comb.xor %11, %true : i1
        %c0_i3 = hw.constant 0 : i3
        %13 = comb.concat %c0_i3, %5 : i3, i1
        %14 = comb.mux %7, %6, %13 : i4
        %15 = comb.and %trans_started, %arg24 : i1
        %16 = comb.extract %14 from 3 : (i4) -> i1
        %17 = comb.extract %14 from 0 : (i4) -> i2
        %18 = comb.concat %16, %17 : i1, i2
        %c1_i3 = hw.constant 1 : i3
        %19 = comb.icmp eq %18, %c1_i3 : i3
        %true_4 = hw.constant true
        %20 = comb.xor %arg11, %true_4 : i1
        %true_5 = hw.constant true
        %21 = comb.xor %15, %true_5 : i1
        %22 = comb.and %21, %20, %19 : i1
        %23 = comb.or %12, %2 : i1
        verif.assert %23 : i1
        fsm.return %22
      } action {
        fsm.update %_sh1_3, %_sh1 : i1
        fsm.update %isSecondCycle, %isFirstCycle : i1
        fsm.update %auto_stop_q, %auto_stop_q : i1
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %false_4 = hw.constant false
        %c2_i31 = hw.constant 2 : i31
        %c0_i31 = hw.constant 0 : i31
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg17 : i3, i13
        %1 = comb.concat %c0_i3, %arg23 : i3, i13
        %2 = comb.sub %0, %1 : i16
        %3 = comb.xor %arg4, %true : i1
        %4 = comb.concat %c0_i18, %arg18 : i18, i13
        %5 = comb.add %4, %c2_i31 : i31
        %6 = comb.icmp eq %stretch_idle_cnt, %5 : i31
        %false_5 = hw.constant false
        %7 = comb.or %3, %arg24 : i1
        %8 = comb.and %trans_started, %7 : i1
        %9 = comb.xor %8, %true : i1
        %true_6 = hw.constant true
        %10 = comb.xor %8, %true_6 : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.and %11, %trans_started : i1
        %13 = comb.and %pend_restart, %3 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %trans_started, %true : i1
        %16 = comb.and %arg9, %15 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.xor %isFirstCycle, %true : i1
        %19 = comb.xor %isSecondCycle, %true : i1
        %20 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %21 = comb.and %18, %19, %20 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.or %22, %16 : i1
        verif.assert %23 : i1
        fsm.update %_sh1, %16 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %trans_started, %12 : i1
        fsm.update %byte_index, %byte_index : i9
        fsm.update %unhandled_nak_cnt_expired, %false_5 : i1
        fsm.update %unhandled_nak_cnt, %c0_i31 : i31
        fsm.update %stretch_predict_cnt_expired, %6 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %true_7 = hw.constant true
        %24 = comb.xor %16, %true_7 : i1
        %25 = comb.xor %16, %true : i1
        %26 = comb.mux %16, %arg21, %arg22 : i13
        %27 = comb.concat %c0_i3, %arg18 : i3, i13
        %28 = comb.concat %c0_i3, %26 : i3, i13
        %29 = comb.add %27, %28 : i16
        %30 = comb.and %24, %25 : i1
        %31 = comb.mux %30, %2, %c1_i16 : i16
        %32 = comb.mux %16, %29, %31 : i16
        %33 = comb.and %14, %17, %arg9 : i1
        %34 = comb.or %33, %pend_restart : i1
        %35 = comb.and %14, %34 : i1
        %36 = comb.or %13, %33 : i1
        %37 = comb.mux bin %36, %35, %pend_restart : i1
        fsm.update %pend_restart, %37 : i1
        fsm.update %tcount_q, %32 : i16
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.xor %isSecondCycle, %true : i1
        %10 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %11 = comb.and %8, %9, %10 : i1
        %12 = comb.xor %11, %true : i1
        %c0_i3 = hw.constant 0 : i3
        %13 = comb.concat %c0_i3, %5 : i3, i1
        %14 = comb.mux %7, %6, %13 : i4
        %15 = comb.and %trans_started, %arg24 : i1
        %16 = comb.extract %14 from 3 : (i4) -> i1
        %17 = comb.extract %14 from 0 : (i4) -> i2
        %18 = comb.concat %16, %17 : i1, i2
        %c0_i3_4 = hw.constant 0 : i3
        %19 = comb.icmp eq %18, %c0_i3_4 : i3
        %true_5 = hw.constant true
        %20 = comb.xor %arg11, %true_5 : i1
        %21 = comb.and %20, %19 : i1
        %22 = comb.or %15, %21 : i1
        %23 = comb.or %12, %2 : i1
        verif.assert %23 : i1
        fsm.return %22
      } action {
        fsm.update %_sh1_3, %_sh1 : i1
        fsm.update %isSecondCycle, %isFirstCycle : i1
        fsm.update %auto_stop_q, %auto_stop_q : i1
        fsm.update %sda_i_q, %arg2 : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %read_byte, %read_byte : i8
        fsm.update %bit_index, %bit_index : i3
        %true = hw.constant true
        %c0_i18 = hw.constant 0 : i18
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %false_4 = hw.constant false
        %c2_i31 = hw.constant 2 : i31
        %c0_i31 = hw.constant 0 : i31
        %c1_i16 = hw.constant 1 : i16
        %c-7_i4 = hw.constant -7 : i4
        %c3_i4 = hw.constant 3 : i4
        %c0_i4 = hw.constant 0 : i4
        %c0_i3_5 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c2_i3 = hw.constant 2 : i3
        %c3_i3 = hw.constant 3 : i3
        %c-4_i3 = hw.constant -4 : i3
        %0 = comb.concat %c0_i3, %arg17 : i3, i13
        %1 = comb.concat %c0_i3, %arg23 : i3, i13
        %2 = comb.sub %0, %1 : i16
        %3 = comb.xor %arg4, %true : i1
        %4 = comb.concat %c0_i18, %arg18 : i18, i13
        %5 = comb.add %4, %c2_i31 : i31
        %6 = comb.icmp eq %stretch_idle_cnt, %5 : i31
        %false_6 = hw.constant false
        %7 = comb.concat %false_4, %arg8 : i1, i8
        %8 = comb.concat %arg11, %c0_i8 : i1, i8
        %9 = comb.icmp ne %arg8, %c0_i8 : i8
        %10 = comb.and %9, %arg11 : i1
        %11 = comb.mux %10, %7, %8 : i9
        %12 = comb.mux %arg11, %11, %byte_index : i9
        %13 = comb.or %3, %arg24 : i1
        %14 = comb.and %trans_started, %13 : i1
        %15 = comb.xor %14, %true : i1
        %true_7 = hw.constant true
        %16 = comb.xor %14, %true_7 : i1
        %17 = comb.or %16, %15 : i1
        %18 = comb.and %17, %trans_started : i1
        %19 = comb.and %pend_restart, %3 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.xor %trans_started, %true : i1
        %22 = comb.and %arg9, %21 : i1
        %23 = comb.mux %22, %c0_i4, %c3_i4 : i4
        %24 = comb.xor %22, %true : i1
        %25 = comb.xor %arg11, %true : i1
        %26 = comb.mux %25, %23, %c-7_i4 : i4
        %27 = comb.xor %arg11, %true : i1
        %28 = comb.mux %arg11, %c3_i4, %26 : i4
        %29 = comb.xor %isFirstCycle, %true : i1
        %30 = comb.xor %isSecondCycle, %true : i1
        %31 = comb.icmp ult %_sh1_3, %_sh1 : i1
        %32 = comb.and %29, %30, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %33, %22 : i1
        verif.assert %34 : i1
        fsm.update %_sh1, %22 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %trans_started, %18 : i1
        fsm.update %byte_index, %12 : i9
        fsm.update %unhandled_nak_cnt_expired, %false_6 : i1
        fsm.update %unhandled_nak_cnt, %c0_i31 : i31
        fsm.update %stretch_predict_cnt_expired, %6 : i1
        fsm.update %stretch_idle_cnt, %c0_i31 : i31
        %35 = comb.extract %28 from 3 : (i4) -> i1
        %36 = comb.extract %28 from 0 : (i4) -> i2
        %37 = comb.concat %35, %36 : i1, i2
        %38 = comb.icmp eq %37, %c0_i3_5 : i3
        %39 = comb.extract %28 from 3 : (i4) -> i1
        %40 = comb.extract %28 from 0 : (i4) -> i2
        %41 = comb.concat %39, %40 : i1, i2
        %42 = comb.icmp eq %41, %c1_i3 : i3
        %43 = comb.extract %28 from 3 : (i4) -> i1
        %44 = comb.extract %28 from 0 : (i4) -> i2
        %45 = comb.concat %43, %44 : i1, i2
        %46 = comb.icmp eq %45, %c2_i3 : i3
        %47 = comb.extract %28 from 3 : (i4) -> i1
        %48 = comb.extract %28 from 0 : (i4) -> i2
        %49 = comb.concat %47, %48 : i1, i2
        %50 = comb.icmp eq %49, %c3_i3 : i3
        %51 = comb.extract %28 from 3 : (i4) -> i1
        %52 = comb.extract %28 from 0 : (i4) -> i2
        %53 = comb.concat %51, %52 : i1, i2
        %54 = comb.icmp eq %53, %c-4_i3 : i3
        %55 = comb.xor %38, %true : i1
        %56 = comb.xor %42, %true : i1
        %57 = comb.xor %46, %true : i1
        %58 = comb.xor %50, %true : i1
        %59 = comb.and %55, %42 : i1
        %60 = comb.mux %59, %arg20, %arg22 : i13
        %61 = comb.xor %59, %true : i1
        %62 = comb.or %38, %61 : i1
        %63 = comb.mux %62, %arg18, %arg19 : i13
        %64 = comb.mux %38, %arg21, %60 : i13
        %65 = comb.concat %c0_i3, %63 : i3, i13
        %66 = comb.concat %c0_i3, %64 : i3, i13
        %67 = comb.add %65, %66 : i16
        %68 = comb.mux %46, %arg23, %arg16 : i13
        %69 = comb.concat %c0_i3, %68 : i3, i13
        %70 = comb.and %56, %55 : i1
        %71 = comb.and %57, %70 : i1
        %72 = comb.and %50, %71 : i1
        %73 = comb.mux %72, %2, %c1_i16 : i16
        %74 = comb.and %46, %70 : i1
        %75 = comb.mux %74, %69, %73 : i16
        %76 = comb.and %54, %58, %71 : i1
        %77 = comb.and %42, %55 : i1
        %78 = comb.or %76, %77, %38 : i1
        %79 = comb.mux %78, %67, %75 : i16
        %80 = comb.and %20, %27, %25, %24, %arg9 : i1
        %81 = comb.or %80, %pend_restart : i1
        %82 = comb.and %20, %81 : i1
        %83 = comb.or %19, %80 : i1
        %84 = comb.mux bin %83, %82, %pend_restart : i1
        fsm.update %pend_restart, %84 : i1
        fsm.update %tcount_q, %79 : i16
      }
    }
  }
}

