module {
  fsm.machine @adc_ctrl_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i4, %arg6: i24, %arg7: i8, %arg8: i16, %arg9: i8, %arg10: i10, %arg11: i1) -> (i1, i2, i1, i1, i5, i1) attributes {initialState = "state_0"} {
    %trigger_q = fsm.variable "trigger_q" {initValue = false} : i1
    %pwrup_timer_cnt_q = fsm.variable "pwrup_timer_cnt_q" {initValue = 0 : i4} : i4
    %lp_sample_cnt_q = fsm.variable "lp_sample_cnt_q" {initValue = 0 : i8} : i8
    %np_sample_cnt_q = fsm.variable "np_sample_cnt_q" {initValue = 0 : i16} : i16
    %wakeup_timer_cnt_q = fsm.variable "wakeup_timer_cnt_q" {initValue = 0 : i24} : i24
    %adc_ctrl_match_q = fsm.variable "adc_ctrl_match_q" {initValue = 0 : i8} : i8
    fsm.state @state_0 output {
      %c0_i2 = hw.constant 0 : i2
      %c0_i16 = hw.constant 0 : i16
      %c0_i5 = hw.constant 0 : i5
      %true = hw.constant true
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %0 = comb.icmp eq %np_sample_cnt_q, %c0_i16 : i16
      verif.assert %0 : i1
      fsm.output %true, %c0_i2, %false, %false_0, %c0_i5, %false_1 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %c0_i16 = hw.constant 0 : i16
        %0 = comb.xor %trigger_q, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.and %trigger_q, %1 : i1
        %3 = comb.or %2, %arg1 : i1
        %4 = comb.icmp eq %np_sample_cnt_q, %c0_i16 : i16
        verif.assert %4 : i1
        %true_0 = hw.constant true
        %5 = comb.xor %3, %true_0 : i1
        %6 = comb.and %5, %0, %arg2 : i1
        fsm.return %6
      } action {
        %false = hw.constant false
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.mux %arg1, %c0_i4, %pwrup_timer_cnt_q : i4
        %2 = comb.mux %arg1, %c0_i8, %lp_sample_cnt_q : i8
        %3 = comb.mux %arg1, %c0_i16, %np_sample_cnt_q : i16
        %4 = comb.mux %arg1, %c0_i24, %wakeup_timer_cnt_q : i24
        %5 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %6 = comb.icmp eq %np_sample_cnt_q, %c0_i16 : i16
        verif.assert %6 : i1
        fsm.update %adc_ctrl_match_q, %5 : i8
        fsm.update %wakeup_timer_cnt_q, %4 : i24
        fsm.update %np_sample_cnt_q, %3 : i16
        fsm.update %lp_sample_cnt_q, %2 : i8
        fsm.update %pwrup_timer_cnt_q, %1 : i4
        fsm.update %false, %0 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c0_i16 = hw.constant 0 : i16
        %0 = comb.xor %trigger_q, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.icmp eq %np_sample_cnt_q, %c0_i16 : i16
        verif.assert %4 : i1
        %true_0 = hw.constant true
        %5 = comb.xor %1, %true_0 : i1
        %6 = comb.or %3, %arg1, %5 : i1
        fsm.return %6
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %13 = comb.icmp eq %np_sample_cnt_q, %c0_i16 : i16
        verif.assert %13 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_1 output {
      %c0_i2 = hw.constant 0 : i2
      %c1_i5 = hw.constant 1 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c0_i2, %false_0, %false_1, %c1_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %4 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %5 = comb.xor %arg4, %true : i1
        %6 = comb.xor %3, %true : i1
        %7 = comb.and %4, %6 : i1
        %8 = comb.xor %arg3, %true : i1
        %9 = comb.and %8, %7 : i1
        %10 = comb.xor %arg4, %true : i1
        %11 = comb.and %9, %arg4 : i1
        %12 = comb.and %7, %arg3 : i1
        %13 = comb.xor %4, %true : i1
        %14 = comb.and %6, %13 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %11, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %12, %true_2 : i1
        %true_3 = hw.constant true
        %17 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %18 = comb.xor %14, %true_4 : i1
        %true_5 = hw.constant true
        %19 = comb.xor %2, %true_5 : i1
        %20 = comb.and %19, %18, %17, %16, %15, %10, %9, %5 : i1
        fsm.return %20
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i8, %lp_sample_cnt_q : i8
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i16, %np_sample_cnt_q : i16
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i24, %wakeup_timer_cnt_q : i24
        %10 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %10 : i8
        fsm.update %wakeup_timer_cnt_q, %9 : i24
        fsm.update %np_sample_cnt_q, %7 : i16
        fsm.update %lp_sample_cnt_q, %5 : i8
        fsm.update %trigger_q, %1 : i1
        fsm.update %pwrup_timer_cnt_q, %c0_i4 : i4
      }
      fsm.transition @state_6 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %4 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %5 = comb.xor %3, %true : i1
        %6 = comb.and %4, %5 : i1
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.and %6, %arg3 : i1
        %9 = comb.xor %4, %true : i1
        %10 = comb.and %5, %9 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %11 = comb.xor %8, %true_1 : i1
        %true_2 = hw.constant true
        %12 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %13 = comb.xor %10, %true_3 : i1
        %true_4 = hw.constant true
        %14 = comb.xor %2, %true_4 : i1
        %15 = comb.and %14, %13, %12, %11, %7, %6, %arg4 : i1
        fsm.return %15
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i8, %lp_sample_cnt_q : i8
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i16, %np_sample_cnt_q : i16
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i24, %wakeup_timer_cnt_q : i24
        %10 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %10 : i8
        fsm.update %wakeup_timer_cnt_q, %9 : i24
        fsm.update %np_sample_cnt_q, %7 : i16
        fsm.update %lp_sample_cnt_q, %5 : i8
        fsm.update %trigger_q, %1 : i1
        fsm.update %pwrup_timer_cnt_q, %c0_i4 : i4
      }
      fsm.transition @state_2 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %4 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %5 = comb.xor %3, %true : i1
        %6 = comb.xor %4, %true : i1
        %7 = comb.and %5, %6 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %8 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %9 = comb.xor %7, %true_2 : i1
        %true_3 = hw.constant true
        %10 = comb.xor %2, %true_3 : i1
        %11 = comb.and %10, %9, %8, %4, %5, %arg3 : i1
        fsm.return %11
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i8, %lp_sample_cnt_q : i8
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i16, %np_sample_cnt_q : i16
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i24, %wakeup_timer_cnt_q : i24
        %10 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %10 : i8
        fsm.update %wakeup_timer_cnt_q, %9 : i24
        fsm.update %np_sample_cnt_q, %7 : i16
        fsm.update %lp_sample_cnt_q, %5 : i8
        fsm.update %trigger_q, %1 : i1
        fsm.update %pwrup_timer_cnt_q, %c0_i4 : i4
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %4 = comb.xor %3, %true : i1
        %5 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %6 = comb.and %4, %5 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %7 = comb.or %6, %3 : i1
        %true_1 = hw.constant true
        %8 = comb.xor %2, %true_1 : i1
        %9 = comb.and %8, %7 : i1
        fsm.return %9
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.add %pwrup_timer_cnt_q, %c1_i4 : i4
        %5 = comb.or %arg1, %3 : i1
        %6 = comb.mux %5, %c0_i8, %lp_sample_cnt_q : i8
        %7 = comb.or %arg1, %3 : i1
        %8 = comb.mux %7, %c0_i16, %np_sample_cnt_q : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %12 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %13 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %14 = comb.xor %12, %true : i1
        %15 = comb.and %13, %14 : i1
        %16 = comb.xor %arg3, %true : i1
        %17 = comb.and %16, %15 : i1
        %18 = comb.xor %arg4, %true : i1
        %19 = comb.and %18, %17 : i1
        %20 = comb.and %17, %arg4 : i1
        %21 = comb.and %15, %arg3 : i1
        %22 = comb.or %21, %20, %19 : i1
        %23 = comb.xor %12, %true : i1
        %24 = comb.xor %13, %true : i1
        %25 = comb.and %14, %24 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %26, %23, %22 : i1
        %28 = comb.and %26, %12 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %11 : i8
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %np_sample_cnt_q, %8 : i16
        fsm.update %lp_sample_cnt_q, %6 : i8
        fsm.update %trigger_q, %1 : i1
        %29 = comb.mux %28, %4, %pwrup_timer_cnt_q : i4
        %30 = comb.or %27, %arg1, %3 : i1
        %31 = comb.mux %30, %c0_i4, %29 : i4
        fsm.update %pwrup_timer_cnt_q, %31 : i4
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %3 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %4 = comb.xor %2, %true : i1
        %5 = comb.and %3, %4 : i1
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.and %6, %5 : i1
        %8 = comb.xor %arg4, %true : i1
        %9 = comb.and %8, %7 : i1
        %10 = comb.and %7, %arg4 : i1
        %11 = comb.and %5, %arg3 : i1
        %12 = comb.xor %3, %true : i1
        %13 = comb.and %4, %12 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %14 = comb.xor %9, %true_1 : i1
        %true_2 = hw.constant true
        %15 = comb.xor %10, %true_2 : i1
        %true_3 = hw.constant true
        %16 = comb.xor %11, %true_3 : i1
        %true_4 = hw.constant true
        %17 = comb.xor %2, %true_4 : i1
        %true_5 = hw.constant true
        %18 = comb.xor %13, %true_5 : i1
        %19 = comb.and %18, %17, %16, %15, %14 : i1
        %20 = comb.or %1, %arg1, %19 : i1
        fsm.return %20
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.add %pwrup_timer_cnt_q, %c1_i4 : i4
        %5 = comb.or %arg1, %3 : i1
        %6 = comb.mux %5, %c0_i8, %lp_sample_cnt_q : i8
        %7 = comb.or %arg1, %3 : i1
        %8 = comb.mux %7, %c0_i16, %np_sample_cnt_q : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %12 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %13 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %14 = comb.xor %12, %true : i1
        %15 = comb.and %13, %14 : i1
        %16 = comb.xor %arg3, %true : i1
        %17 = comb.and %16, %15 : i1
        %18 = comb.xor %arg4, %true : i1
        %19 = comb.and %18, %17 : i1
        %20 = comb.and %17, %arg4 : i1
        %21 = comb.and %15, %arg3 : i1
        %22 = comb.or %21, %20, %19 : i1
        %23 = comb.xor %12, %true : i1
        %24 = comb.xor %13, %true : i1
        %25 = comb.and %14, %24 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %26, %23, %22 : i1
        %28 = comb.and %26, %12 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %11 : i8
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %np_sample_cnt_q, %8 : i16
        fsm.update %lp_sample_cnt_q, %6 : i8
        fsm.update %trigger_q, %1 : i1
        %29 = comb.mux %28, %4, %pwrup_timer_cnt_q : i4
        %30 = comb.or %27, %arg1, %3 : i1
        %31 = comb.mux %30, %c0_i4, %29 : i4
        fsm.update %pwrup_timer_cnt_q, %31 : i4
      }
    }
    fsm.state @state_2 output {
      %c1_i2 = hw.constant 1 : i2
      %c2_i5 = hw.constant 2 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c1_i2, %false_0, %false_1, %c2_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_3 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_2 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_6 output {
      %c1_i2 = hw.constant 1 : i2
      %c6_i5 = hw.constant 6 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c1_i2, %false_0, %false_1, %c6_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_6 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_12 output {
      %c1_i2 = hw.constant 1 : i2
      %c12_i5 = hw.constant 12 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c1_i2, %false_0, %false_1, %c12_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_3 output {
      %c0_i2 = hw.constant 0 : i2
      %c3_i5 = hw.constant 3 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c0_i2, %false_0, %false_1, %c3_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.xor %arg11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %2, %true_1 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_3 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %2 = comb.or %1, %arg1 : i1
        fsm.return %2
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_7 output {
      %c0_i2 = hw.constant 0 : i2
      %c7_i5 = hw.constant 7 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c0_i2, %false_0, %false_1, %c7_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.xor %arg11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %2, %true_1 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %2 = comb.or %1, %arg1 : i1
        fsm.return %2
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_13 output {
      %c0_i2 = hw.constant 0 : i2
      %c13_i5 = hw.constant 13 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c0_i2, %false_0, %false_1, %c13_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.xor %arg11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %2, %true_1 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %2 = comb.or %1, %arg1 : i1
        fsm.return %2
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_4 output {
      %c-2_i2 = hw.constant -2 : i2
      %c4_i5 = hw.constant 4 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c-2_i2, %false_0, %false_1, %c4_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_8 output {
      %c-2_i2 = hw.constant -2 : i2
      %c8_i5 = hw.constant 8 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c-2_i2, %false_0, %false_1, %c8_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_14 output {
      %c-2_i2 = hw.constant -2 : i2
      %c14_i5 = hw.constant 14 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c-2_i2, %false_0, %false_1, %c14_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_15 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        %4 = comb.and %3, %arg11 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3 : i1
        fsm.return %5
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_5 output {
      %c0_i2 = hw.constant 0 : i2
      %c5_i5 = hw.constant 5 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %true = hw.constant true
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      verif.assert %true_2 : i1
      fsm.output %false, %c0_i2, %false_0, %true, %c5_i5, %false_1 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_0 guard {
        %true = hw.constant true
        verif.assert %true : i1
        %true_0 = hw.constant true
        fsm.return %true_0
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_9 output {
      %true = hw.constant true
      %c-1_i8 = hw.constant -1 : i8
      %c0_i2 = hw.constant 0 : i2
      %c0_i8 = hw.constant 0 : i8
      %0 = comb.icmp ne %arg9, %c0_i8 : i8
      %1 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
      %2 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
      %3 = comb.or %1, %2 : i1
      %4 = comb.and %0, %3 : i1
      %c9_i5 = hw.constant 9 : i5
      %5 = comb.add %arg7, %c-1_i8 : i8
      %6 = comb.xor %arg11, %true : i1
      %7 = comb.xor %4, %true : i1
      %8 = comb.icmp ult %lp_sample_cnt_q, %5 : i8
      %9 = comb.icmp eq %lp_sample_cnt_q, %5 : i8
      %10 = comb.and %4, %6 : i1
      %11 = comb.xor %8, %true : i1
      %12 = comb.and %10, %8 : i1
      %13 = comb.xor %12, %true : i1
      %14 = comb.and %6, %7 : i1
      %15 = comb.xor %14, %true : i1
      %16 = comb.xor %arg11, %true : i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %17 = comb.and %16, %15, %13, %11, %10, %9 : i1
      %true_2 = hw.constant true
      verif.assert %true_2 : i1
      fsm.output %false, %c0_i2, %false_0, %false_1, %c9_i5, %17 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.or %1, %arg1 : i1
        %8 = comb.add %arg7, %c-1_i8 : i8
        %9 = comb.xor %arg11, %true : i1
        %10 = comb.xor %6, %true : i1
        %11 = comb.icmp ult %lp_sample_cnt_q, %8 : i8
        %12 = comb.icmp eq %lp_sample_cnt_q, %8 : i8
        %c-4_i3 = hw.constant -4 : i3
        %c1_i3 = hw.constant 1 : i3
        %13 = comb.mux %12, %c-4_i3, %c1_i3 : i3
        %14 = comb.and %6, %9 : i1
        %15 = comb.xor %11, %true : i1
        %16 = comb.and %14, %11 : i1
        %17 = comb.and %9, %10 : i1
        %18 = comb.or %17, %16 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %19 = comb.extract %13 from 2 : (i3) -> i1
        %20 = comb.extract %13 from 0 : (i3) -> i1
        %21 = comb.concat %19, %20 : i1, i1
        %c-2_i2 = hw.constant -2 : i2
        %22 = comb.icmp eq %21, %c-2_i2 : i2
        %true_1 = hw.constant true
        %23 = comb.xor %18, %true_1 : i1
        %true_2 = hw.constant true
        %24 = comb.xor %arg11, %true_2 : i1
        %true_3 = hw.constant true
        %25 = comb.xor %7, %true_3 : i1
        %26 = comb.and %25, %24, %23, %15, %14, %22 : i1
        fsm.return %26
      } action {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i16, %np_sample_cnt_q : i16
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i24, %wakeup_timer_cnt_q : i24
        %10 = comb.add %arg7, %c-1_i8 : i8
        %11 = comb.icmp eq %lp_sample_cnt_q, %10 : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %9 : i24
        fsm.update %np_sample_cnt_q, %7 : i16
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %12 = comb.or %11, %arg1, %3 : i1
        %13 = comb.mux %12, %c0_i8, %lp_sample_cnt_q : i8
        %14 = comb.mux %arg1, %c0_i8, %arg9 : i8
        fsm.update %adc_ctrl_match_q, %14 : i8
        fsm.update %lp_sample_cnt_q, %13 : i8
      }
      fsm.transition @state_10 guard {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.or %1, %arg1 : i1
        %8 = comb.add %arg7, %c-1_i8 : i8
        %9 = comb.xor %arg11, %true : i1
        %10 = comb.xor %6, %true : i1
        %11 = comb.icmp ult %lp_sample_cnt_q, %8 : i8
        %12 = comb.and %6, %9, %11 : i1
        %13 = comb.and %9, %10 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %14 = comb.or %13, %12 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %7, %true_2 : i1
        %17 = comb.and %16, %15, %14 : i1
        fsm.return %17
      } action {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c1_i8 = hw.constant 1 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.add %lp_sample_cnt_q, %c1_i8 : i8
        %7 = comb.or %arg1, %3 : i1
        %8 = comb.mux %7, %c0_i16, %np_sample_cnt_q : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.icmp ne %arg9, %c0_i8 : i8
        %12 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %13 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %14 = comb.or %12, %13 : i1
        %15 = comb.and %11, %14 : i1
        %16 = comb.add %arg7, %c-1_i8 : i8
        %17 = comb.xor %15, %true : i1
        %18 = comb.icmp ult %lp_sample_cnt_q, %16 : i8
        %19 = comb.icmp eq %lp_sample_cnt_q, %16 : i8
        %20 = comb.xor %18, %true : i1
        %21 = comb.and %20, %15 : i1
        %22 = comb.and %15, %18 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %23, %21, %19 : i1
        %25 = comb.or %17, %22, %21 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %np_sample_cnt_q, %8 : i16
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %26 = comb.mux %22, %6, %lp_sample_cnt_q : i8
        %27 = comb.or %17, %24, %arg1, %3 : i1
        %28 = comb.mux %27, %c0_i8, %26 : i8
        %29 = comb.xor %25, %true : i1
        %30 = comb.or %arg1, %29 : i1
        %31 = comb.mux %30, %c0_i8, %arg9 : i8
        %32 = comb.or %arg1, %25 : i1
        %33 = comb.mux bin %32, %31, %adc_ctrl_match_q : i8
        fsm.update %adc_ctrl_match_q, %33 : i8
        fsm.update %lp_sample_cnt_q, %28 : i8
      }
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.or %1, %arg1 : i1
        %8 = comb.add %arg7, %c-1_i8 : i8
        %9 = comb.xor %arg11, %true : i1
        %10 = comb.xor %6, %true : i1
        %11 = comb.icmp ult %lp_sample_cnt_q, %8 : i8
        %12 = comb.icmp eq %lp_sample_cnt_q, %8 : i8
        %c-4_i3 = hw.constant -4 : i3
        %c1_i3 = hw.constant 1 : i3
        %13 = comb.mux %12, %c-4_i3, %c1_i3 : i3
        %14 = comb.and %6, %9 : i1
        %15 = comb.xor %11, %true : i1
        %16 = comb.and %14, %11 : i1
        %17 = comb.and %9, %10 : i1
        %18 = comb.or %17, %16 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %19 = comb.extract %13 from 2 : (i3) -> i1
        %20 = comb.extract %13 from 0 : (i3) -> i1
        %21 = comb.concat %19, %20 : i1, i1
        %c1_i2 = hw.constant 1 : i2
        %22 = comb.icmp eq %21, %c1_i2 : i2
        %true_1 = hw.constant true
        %23 = comb.xor %18, %true_1 : i1
        %24 = comb.and %23, %15, %14, %22 : i1
        %25 = comb.or %arg11, %24 : i1
        %true_2 = hw.constant true
        %26 = comb.xor %7, %true_2 : i1
        %27 = comb.and %26, %25 : i1
        fsm.return %27
      } action {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c1_i8 = hw.constant 1 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.add %lp_sample_cnt_q, %c1_i8 : i8
        %7 = comb.or %arg1, %3 : i1
        %8 = comb.mux %7, %c0_i16, %np_sample_cnt_q : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.icmp ne %arg9, %c0_i8 : i8
        %12 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %13 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %14 = comb.or %12, %13 : i1
        %15 = comb.and %11, %14 : i1
        %16 = comb.add %arg7, %c-1_i8 : i8
        %17 = comb.xor %arg11, %true : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ult %lp_sample_cnt_q, %16 : i8
        %20 = comb.icmp eq %lp_sample_cnt_q, %16 : i8
        %21 = comb.and %15, %17 : i1
        %22 = comb.xor %19, %true : i1
        %23 = comb.and %22, %21 : i1
        %24 = comb.and %21, %19 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %25, %23, %20 : i1
        %27 = comb.and %17, %18 : i1
        %28 = comb.xor %27, %true : i1
        %29 = comb.or %27, %26 : i1
        %30 = comb.or %27, %24, %23 : i1
        %31 = comb.xor %arg11, %true : i1
        %32 = comb.and %31, %29 : i1
        %33 = comb.and %31, %28, %24 : i1
        %34 = comb.and %31, %30 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %np_sample_cnt_q, %8 : i16
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %35 = comb.mux %33, %6, %lp_sample_cnt_q : i8
        %36 = comb.or %32, %arg1, %3 : i1
        %37 = comb.mux %36, %c0_i8, %35 : i8
        %38 = comb.xor %34, %true : i1
        %39 = comb.or %arg1, %38 : i1
        %40 = comb.mux %39, %c0_i8, %arg9 : i8
        %41 = comb.or %arg1, %34 : i1
        %42 = comb.mux bin %41, %40, %adc_ctrl_match_q : i8
        fsm.update %adc_ctrl_match_q, %42 : i8
        fsm.update %lp_sample_cnt_q, %37 : i8
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.add %arg7, %c-1_i8 : i8
        %8 = comb.xor %arg11, %true : i1
        %9 = comb.xor %6, %true : i1
        %10 = comb.icmp ult %lp_sample_cnt_q, %7 : i8
        %11 = comb.and %6, %8 : i1
        %12 = comb.xor %10, %true : i1
        %13 = comb.and %12, %11 : i1
        %14 = comb.and %11, %10 : i1
        %15 = comb.and %8, %9 : i1
        %16 = comb.or %15, %14 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %17 = comb.xor %13, %true_1 : i1
        %true_2 = hw.constant true
        %18 = comb.xor %16, %true_2 : i1
        %true_3 = hw.constant true
        %19 = comb.xor %arg11, %true_3 : i1
        %20 = comb.and %19, %18, %17 : i1
        %21 = comb.or %1, %arg1, %20 : i1
        fsm.return %21
      } action {
        %true = hw.constant true
        %c-1_i8 = hw.constant -1 : i8
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c1_i8 = hw.constant 1 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.add %lp_sample_cnt_q, %c1_i8 : i8
        %7 = comb.or %arg1, %3 : i1
        %8 = comb.mux %7, %c0_i16, %np_sample_cnt_q : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.icmp ne %arg9, %c0_i8 : i8
        %12 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %13 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %14 = comb.or %12, %13 : i1
        %15 = comb.and %11, %14 : i1
        %16 = comb.add %arg7, %c-1_i8 : i8
        %17 = comb.xor %arg11, %true : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ult %lp_sample_cnt_q, %16 : i8
        %20 = comb.icmp eq %lp_sample_cnt_q, %16 : i8
        %21 = comb.and %15, %17 : i1
        %22 = comb.xor %19, %true : i1
        %23 = comb.and %22, %21 : i1
        %24 = comb.and %21, %19 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %25, %23, %20 : i1
        %27 = comb.and %17, %18 : i1
        %28 = comb.xor %27, %true : i1
        %29 = comb.or %27, %26 : i1
        %30 = comb.or %27, %24, %23 : i1
        %31 = comb.xor %arg11, %true : i1
        %32 = comb.and %31, %29 : i1
        %33 = comb.and %31, %28, %24 : i1
        %34 = comb.and %31, %30 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %np_sample_cnt_q, %8 : i16
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %35 = comb.mux %33, %6, %lp_sample_cnt_q : i8
        %36 = comb.or %32, %arg1, %3 : i1
        %37 = comb.mux %36, %c0_i8, %35 : i8
        %38 = comb.xor %34, %true : i1
        %39 = comb.or %arg1, %38 : i1
        %40 = comb.mux %39, %c0_i8, %arg9 : i8
        %41 = comb.or %arg1, %34 : i1
        %42 = comb.mux bin %41, %40, %adc_ctrl_match_q : i8
        fsm.update %adc_ctrl_match_q, %42 : i8
        fsm.update %lp_sample_cnt_q, %37 : i8
      }
    }
    fsm.state @state_15 output {
      %c0_i2 = hw.constant 0 : i2
      %c15_i5 = hw.constant 15 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c0_i2, %false_0, %false_1, %c15_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_16 guard {
        %true = hw.constant true
        %c-1_i16 = hw.constant -1 : i16
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.or %1, %arg1 : i1
        %8 = comb.add %arg8, %c-1_i16 : i16
        %9 = comb.xor %arg11, %true : i1
        %10 = comb.xor %6, %true : i1
        %11 = comb.icmp ult %np_sample_cnt_q, %8 : i16
        %12 = comb.icmp eq %np_sample_cnt_q, %8 : i16
        %13 = comb.and %6, %9 : i1
        %14 = comb.xor %11, %true : i1
        %15 = comb.and %13, %11 : i1
        %16 = comb.and %10, %9 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %17 = comb.xor %15, %true_1 : i1
        %true_2 = hw.constant true
        %18 = comb.xor %16, %true_2 : i1
        %true_3 = hw.constant true
        %19 = comb.xor %arg11, %true_3 : i1
        %true_4 = hw.constant true
        %20 = comb.xor %7, %true_4 : i1
        %21 = comb.and %20, %19, %18, %17, %14, %13, %12 : i1
        fsm.return %21
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c1_i16 = hw.constant 1 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.add %np_sample_cnt_q, %c1_i16 : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %11 = comb.or %arg1, %3 : i1
        %12 = comb.mux %11, %c0_i16, %8 : i16
        %13 = comb.mux %arg1, %c0_i8, %arg9 : i8
        fsm.update %adc_ctrl_match_q, %13 : i8
        fsm.update %np_sample_cnt_q, %12 : i16
      }
      fsm.transition @state_15 guard {
        %true = hw.constant true
        %c-1_i16 = hw.constant -1 : i16
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.or %1, %arg1 : i1
        %8 = comb.add %arg8, %c-1_i16 : i16
        %9 = comb.xor %arg11, %true : i1
        %10 = comb.xor %6, %true : i1
        %11 = comb.icmp ult %np_sample_cnt_q, %8 : i16
        %12 = comb.icmp eq %np_sample_cnt_q, %8 : i16
        %13 = comb.and %6, %9 : i1
        %14 = comb.xor %11, %true : i1
        %15 = comb.and %14, %13 : i1
        %16 = comb.xor %12, %true : i1
        %17 = comb.and %15, %12 : i1
        %18 = comb.and %13, %11 : i1
        %19 = comb.and %10, %9 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %20 = comb.icmp ule %np_sample_cnt_q, %8 : i16
        %true_1 = hw.constant true
        %21 = comb.xor %17, %true_1 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %18, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %19, %true_3 : i1
        %24 = comb.and %23, %22, %21, %16, %15, %20 : i1
        %25 = comb.or %arg11, %24 : i1
        %true_4 = hw.constant true
        %26 = comb.xor %7, %true_4 : i1
        %27 = comb.and %26, %25 : i1
        fsm.return %27
      } action {
        %true = hw.constant true
        %c-1_i16 = hw.constant -1 : i16
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c1_i16 = hw.constant 1 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.add %np_sample_cnt_q, %c1_i16 : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.icmp ne %arg9, %c0_i8 : i8
        %12 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %13 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %14 = comb.or %12, %13 : i1
        %15 = comb.and %11, %14 : i1
        %16 = comb.add %arg8, %c-1_i16 : i16
        %17 = comb.xor %arg11, %true : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ult %np_sample_cnt_q, %16 : i16
        %20 = comb.icmp eq %np_sample_cnt_q, %16 : i16
        %21 = comb.and %15, %17 : i1
        %22 = comb.xor %19, %true : i1
        %23 = comb.and %22, %21 : i1
        %24 = comb.xor %20, %true : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.and %23, %20 : i1
        %27 = comb.and %21, %19 : i1
        %28 = comb.or %27, %26 : i1
        %29 = comb.and %18, %17 : i1
        %30 = comb.xor %29, %true : i1
        %31 = comb.or %29, %27, %26, %25 : i1
        %32 = comb.xor %arg11, %true : i1
        %33 = comb.and %32, %29 : i1
        %34 = comb.and %32, %30, %28 : i1
        %35 = comb.and %32, %31 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %36 = comb.mux %34, %8, %np_sample_cnt_q : i16
        %37 = comb.or %33, %arg1, %3 : i1
        %38 = comb.mux %37, %c0_i16, %36 : i16
        %39 = comb.xor %35, %true : i1
        %40 = comb.or %arg1, %39 : i1
        %41 = comb.mux %40, %c0_i8, %arg9 : i8
        %42 = comb.or %arg1, %35 : i1
        %43 = comb.mux bin %42, %41, %adc_ctrl_match_q : i8
        fsm.update %adc_ctrl_match_q, %43 : i8
        fsm.update %np_sample_cnt_q, %38 : i16
      }
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %c-1_i16 = hw.constant -1 : i16
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.or %1, %arg1 : i1
        %8 = comb.add %arg8, %c-1_i16 : i16
        %9 = comb.xor %arg11, %true : i1
        %c3_i3 = hw.constant 3 : i3
        %c-2_i3 = hw.constant -2 : i3
        %10 = comb.mux %arg4, %c3_i3, %c-2_i3 : i3
        %11 = comb.icmp ult %np_sample_cnt_q, %8 : i16
        %12 = comb.icmp eq %np_sample_cnt_q, %8 : i16
        %13 = comb.icmp ugt %np_sample_cnt_q, %8 : i16
        %14 = comb.and %6, %9 : i1
        %15 = comb.xor %11, %true : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.xor %12, %true : i1
        %18 = comb.and %16, %12 : i1
        %19 = comb.and %14, %11 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %20 = comb.extract %10 from 2 : (i3) -> i1
        %21 = comb.extract %10 from 0 : (i3) -> i1
        %22 = comb.concat %20, %21 : i1, i1
        %c-2_i2 = hw.constant -2 : i2
        %23 = comb.icmp eq %22, %c-2_i2 : i2
        %true_1 = hw.constant true
        %24 = comb.xor %18, %true_1 : i1
        %25 = comb.and %24, %17, %16, %13 : i1
        %26 = comb.or %19, %25 : i1
        %27 = comb.or %6, %arg11 : i1
        %28 = comb.mux %27, %26, %23 : i1
        %true_2 = hw.constant true
        %29 = comb.xor %arg11, %true_2 : i1
        %true_3 = hw.constant true
        %30 = comb.xor %7, %true_3 : i1
        %31 = comb.and %30, %29, %28 : i1
        fsm.return %31
      } action {
        %true = hw.constant true
        %c-1_i16 = hw.constant -1 : i16
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c1_i16 = hw.constant 1 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.add %np_sample_cnt_q, %c1_i16 : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.icmp ne %arg9, %c0_i8 : i8
        %12 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %13 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %14 = comb.or %12, %13 : i1
        %15 = comb.and %11, %14 : i1
        %16 = comb.add %arg8, %c-1_i16 : i16
        %17 = comb.xor %15, %true : i1
        %18 = comb.icmp ult %np_sample_cnt_q, %16 : i16
        %19 = comb.icmp eq %np_sample_cnt_q, %16 : i16
        %20 = comb.xor %18, %true : i1
        %21 = comb.and %20, %15 : i1
        %22 = comb.xor %19, %true : i1
        %23 = comb.and %22, %21 : i1
        %24 = comb.and %21, %19 : i1
        %25 = comb.and %15, %18 : i1
        %26 = comb.or %25, %24 : i1
        %27 = comb.or %17, %25, %24, %23 : i1
        %28 = comb.and %15, %26 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %29 = comb.mux %28, %8, %np_sample_cnt_q : i16
        %30 = comb.or %17, %arg1, %3 : i1
        %31 = comb.mux %30, %c0_i16, %29 : i16
        %32 = comb.xor %27, %true : i1
        %33 = comb.or %arg1, %32 : i1
        %34 = comb.mux %33, %c0_i8, %arg9 : i8
        %35 = comb.or %arg1, %27 : i1
        %36 = comb.mux bin %35, %34, %adc_ctrl_match_q : i8
        fsm.update %adc_ctrl_match_q, %36 : i8
        fsm.update %np_sample_cnt_q, %31 : i16
      }
      fsm.transition @state_6 guard {
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.or %1, %arg1 : i1
        %8 = comb.xor %arg11, %true : i1
        %9 = comb.xor %6, %true : i1
        %c3_i3 = hw.constant 3 : i3
        %c-2_i3 = hw.constant -2 : i3
        %10 = comb.mux %arg4, %c3_i3, %c-2_i3 : i3
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %11 = comb.extract %10 from 2 : (i3) -> i1
        %12 = comb.extract %10 from 0 : (i3) -> i1
        %13 = comb.concat %11, %12 : i1, i1
        %c1_i2 = hw.constant 1 : i2
        %14 = comb.icmp eq %13, %c1_i2 : i2
        %true_1 = hw.constant true
        %15 = comb.xor %arg11, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %7, %true_2 : i1
        %17 = comb.and %16, %15, %9, %8, %14 : i1
        fsm.return %17
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i24, %wakeup_timer_cnt_q : i24
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %9 : i24
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %10 = comb.mux %arg1, %c0_i8, %arg9 : i8
        fsm.update %adc_ctrl_match_q, %10 : i8
        fsm.update %np_sample_cnt_q, %c0_i16 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c-1_i16 = hw.constant -1 : i16
        %c0_i8 = hw.constant 0 : i8
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.icmp ne %arg9, %c0_i8 : i8
        %3 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %4 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %5 = comb.or %3, %4 : i1
        %6 = comb.and %2, %5 : i1
        %7 = comb.add %arg8, %c-1_i16 : i16
        %8 = comb.xor %arg11, %true : i1
        %9 = comb.xor %6, %true : i1
        %10 = comb.icmp ult %np_sample_cnt_q, %7 : i16
        %11 = comb.icmp eq %np_sample_cnt_q, %7 : i16
        %12 = comb.and %6, %8 : i1
        %13 = comb.xor %10, %true : i1
        %14 = comb.and %13, %12 : i1
        %15 = comb.xor %11, %true : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.and %14, %11 : i1
        %18 = comb.and %12, %10 : i1
        %19 = comb.and %9, %8 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %20 = comb.xor %16, %true_1 : i1
        %true_2 = hw.constant true
        %21 = comb.xor %17, %true_2 : i1
        %true_3 = hw.constant true
        %22 = comb.xor %18, %true_3 : i1
        %true_4 = hw.constant true
        %23 = comb.xor %19, %true_4 : i1
        %true_5 = hw.constant true
        %24 = comb.xor %arg11, %true_5 : i1
        %25 = comb.and %24, %23, %22, %21, %20 : i1
        %26 = comb.or %1, %arg1, %25 : i1
        fsm.return %26
      } action {
        %true = hw.constant true
        %c-1_i16 = hw.constant -1 : i16
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c1_i16 = hw.constant 1 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.add %np_sample_cnt_q, %c1_i16 : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.icmp ne %arg9, %c0_i8 : i8
        %12 = comb.icmp eq %arg9, %adc_ctrl_match_q : i8
        %13 = comb.icmp eq %adc_ctrl_match_q, %c0_i8 : i8
        %14 = comb.or %12, %13 : i1
        %15 = comb.and %11, %14 : i1
        %16 = comb.add %arg8, %c-1_i16 : i16
        %17 = comb.xor %arg11, %true : i1
        %18 = comb.xor %15, %true : i1
        %19 = comb.icmp ult %np_sample_cnt_q, %16 : i16
        %20 = comb.icmp eq %np_sample_cnt_q, %16 : i16
        %21 = comb.and %15, %17 : i1
        %22 = comb.xor %19, %true : i1
        %23 = comb.and %22, %21 : i1
        %24 = comb.xor %20, %true : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.and %23, %20 : i1
        %27 = comb.and %21, %19 : i1
        %28 = comb.or %27, %26 : i1
        %29 = comb.and %18, %17 : i1
        %30 = comb.xor %29, %true : i1
        %31 = comb.or %29, %27, %26, %25 : i1
        %32 = comb.xor %arg11, %true : i1
        %33 = comb.and %32, %29 : i1
        %34 = comb.and %32, %30, %28 : i1
        %35 = comb.and %32, %31 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %36 = comb.mux %34, %8, %np_sample_cnt_q : i16
        %37 = comb.or %33, %arg1, %3 : i1
        %38 = comb.mux %37, %c0_i16, %36 : i16
        %39 = comb.xor %35, %true : i1
        %40 = comb.or %arg1, %39 : i1
        %41 = comb.mux %40, %c0_i8, %arg9 : i8
        %42 = comb.or %arg1, %35 : i1
        %43 = comb.mux bin %42, %41, %adc_ctrl_match_q : i8
        fsm.update %adc_ctrl_match_q, %43 : i8
        fsm.update %np_sample_cnt_q, %38 : i16
      }
    }
    fsm.state @state_10 output {
      %c0_i2 = hw.constant 0 : i2
      %c10_i5 = hw.constant 10 : i5
      %true = hw.constant true
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      verif.assert %true_2 : i1
      fsm.output %true, %c0_i2, %false, %false_0, %c10_i5, %false_1 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_11 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %wakeup_timer_cnt_q, %arg6 : i24
        %4 = comb.icmp eq %wakeup_timer_cnt_q, %arg6 : i24
        %5 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %6 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %7 = comb.xor %2, %true_2 : i1
        %8 = comb.and %7, %6, %5, %4 : i1
        fsm.return %8
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %10 : i8
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        fsm.update %wakeup_timer_cnt_q, %c0_i24 : i24
      }
      fsm.transition @state_10 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %wakeup_timer_cnt_q, %arg6 : i24
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %5 = comb.icmp ne %wakeup_timer_cnt_q, %arg6 : i24
        %6 = comb.and %4, %5 : i1
        %7 = comb.or %3, %6 : i1
        %true_1 = hw.constant true
        %8 = comb.xor %2, %true_1 : i1
        %9 = comb.and %8, %7 : i1
        fsm.return %9
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c1_i24 = hw.constant 1 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.add %wakeup_timer_cnt_q, %c1_i24 : i24
        %11 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %12 = comb.icmp ne %wakeup_timer_cnt_q, %arg6 : i24
        %13 = comb.icmp eq %wakeup_timer_cnt_q, %arg6 : i24
        %14 = comb.xor %12, %true : i1
        %15 = comb.xor %12, %true : i1
        %16 = comb.and %15, %14, %13 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %11 : i8
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %17 = comb.mux %12, %10, %wakeup_timer_cnt_q : i24
        %18 = comb.or %16, %arg1, %3 : i1
        %19 = comb.mux %18, %c0_i24, %17 : i24
        fsm.update %wakeup_timer_cnt_q, %19 : i24
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %2 = comb.or %1, %arg1 : i1
        fsm.return %2
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c1_i24 = hw.constant 1 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.add %wakeup_timer_cnt_q, %c1_i24 : i24
        %11 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %12 = comb.icmp ne %wakeup_timer_cnt_q, %arg6 : i24
        %13 = comb.icmp eq %wakeup_timer_cnt_q, %arg6 : i24
        %14 = comb.xor %12, %true : i1
        %15 = comb.xor %12, %true : i1
        %16 = comb.and %15, %14, %13 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %11 : i8
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
        %17 = comb.mux %12, %10, %wakeup_timer_cnt_q : i24
        %18 = comb.or %16, %arg1, %3 : i1
        %19 = comb.mux %18, %c0_i24, %17 : i24
        fsm.update %wakeup_timer_cnt_q, %19 : i24
      }
    }
    fsm.state @state_16 output {
      %c0_i2 = hw.constant 0 : i2
      %c-16_i5 = hw.constant -16 : i5
      %false = hw.constant false
      %true = hw.constant true
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      verif.assert %true_2 : i1
      fsm.output %false, %c0_i2, %true, %false_0, %c-16_i5, %false_1 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %2, %true_1 : i1
        fsm.return %3
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %2 = comb.or %1, %arg1 : i1
        fsm.return %2
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i4, %pwrup_timer_cnt_q : i4
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i8, %lp_sample_cnt_q : i8
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i16, %np_sample_cnt_q : i16
        %10 = comb.or %arg1, %3 : i1
        %11 = comb.mux %10, %c0_i24, %wakeup_timer_cnt_q : i24
        %12 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %12 : i8
        fsm.update %wakeup_timer_cnt_q, %11 : i24
        fsm.update %np_sample_cnt_q, %9 : i16
        fsm.update %lp_sample_cnt_q, %7 : i8
        fsm.update %pwrup_timer_cnt_q, %5 : i4
        fsm.update %trigger_q, %1 : i1
      }
    }
    fsm.state @state_11 output {
      %c0_i2 = hw.constant 0 : i2
      %c11_i5 = hw.constant 11 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      verif.assert %true : i1
      fsm.output %false, %c0_i2, %false_0, %false_1, %c11_i5, %false_2 : i1, i2, i1, i1, i5, i1
    } transitions {
      fsm.transition @state_11 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %4 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %c6_i4 = hw.constant 6 : i4
        %c-5_i4 = hw.constant -5 : i4
        %5 = comb.mux %4, %c6_i4, %c-5_i4 : i4
        %6 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %7 = comb.extract %5 from 2 : (i4) -> i2
        %8 = comb.extract %5 from 0 : (i4) -> i1
        %9 = comb.concat %7, %8 : i2, i1
        %c-3_i3 = hw.constant -3 : i3
        %10 = comb.icmp eq %9, %c-3_i3 : i3
        %11 = comb.and %6, %10 : i1
        %12 = comb.or %3, %11 : i1
        %true_1 = hw.constant true
        %13 = comb.xor %2, %true_1 : i1
        %14 = comb.and %13, %12 : i1
        fsm.return %14
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.add %pwrup_timer_cnt_q, %c1_i4 : i4
        %5 = comb.or %arg1, %3 : i1
        %6 = comb.mux %5, %c0_i8, %lp_sample_cnt_q : i8
        %7 = comb.or %arg1, %3 : i1
        %8 = comb.mux %7, %c0_i16, %np_sample_cnt_q : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %12 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %13 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %14 = comb.xor %12, %true : i1
        %15 = comb.xor %12, %true : i1
        %16 = comb.and %15, %14, %13 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %11 : i8
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %np_sample_cnt_q, %8 : i16
        fsm.update %lp_sample_cnt_q, %6 : i8
        fsm.update %trigger_q, %1 : i1
        %17 = comb.mux %12, %4, %pwrup_timer_cnt_q : i4
        %18 = comb.or %16, %arg1, %3 : i1
        %19 = comb.mux %18, %c0_i4, %17 : i4
        fsm.update %pwrup_timer_cnt_q, %19 : i4
      }
      fsm.transition @state_6 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %2 = comb.or %1, %arg1 : i1
        %3 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %4 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %c6_i4 = hw.constant 6 : i4
        %c-5_i4 = hw.constant -5 : i4
        %5 = comb.mux %4, %c6_i4, %c-5_i4 : i4
        %6 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %7 = comb.extract %5 from 2 : (i4) -> i2
        %8 = comb.extract %5 from 0 : (i4) -> i1
        %9 = comb.concat %7, %8 : i2, i1
        %c2_i3 = hw.constant 2 : i3
        %10 = comb.icmp eq %9, %c2_i3 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %12 = comb.xor %2, %true_2 : i1
        %13 = comb.and %12, %11, %6, %10 : i1
        fsm.return %13
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.or %arg1, %3 : i1
        %5 = comb.mux %4, %c0_i8, %lp_sample_cnt_q : i8
        %6 = comb.or %arg1, %3 : i1
        %7 = comb.mux %6, %c0_i16, %np_sample_cnt_q : i16
        %8 = comb.or %arg1, %3 : i1
        %9 = comb.mux %8, %c0_i24, %wakeup_timer_cnt_q : i24
        %10 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %10 : i8
        fsm.update %wakeup_timer_cnt_q, %9 : i24
        fsm.update %np_sample_cnt_q, %7 : i16
        fsm.update %lp_sample_cnt_q, %5 : i8
        fsm.update %trigger_q, %1 : i1
        fsm.update %pwrup_timer_cnt_q, %c0_i4 : i4
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.and %trigger_q, %0 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %2 = comb.or %1, %arg1 : i1
        fsm.return %2
      } action {
        %true = hw.constant true
        %c0_i24 = hw.constant 0 : i24
        %c0_i16 = hw.constant 0 : i16
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.and %0, %arg2 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %trigger_q, %2 : i1
        %4 = comb.add %pwrup_timer_cnt_q, %c1_i4 : i4
        %5 = comb.or %arg1, %3 : i1
        %6 = comb.mux %5, %c0_i8, %lp_sample_cnt_q : i8
        %7 = comb.or %arg1, %3 : i1
        %8 = comb.mux %7, %c0_i16, %np_sample_cnt_q : i16
        %9 = comb.or %arg1, %3 : i1
        %10 = comb.mux %9, %c0_i24, %wakeup_timer_cnt_q : i24
        %11 = comb.mux bin %arg1, %c0_i8, %adc_ctrl_match_q : i8
        %12 = comb.icmp ne %pwrup_timer_cnt_q, %arg5 : i4
        %13 = comb.icmp eq %pwrup_timer_cnt_q, %arg5 : i4
        %14 = comb.xor %12, %true : i1
        %15 = comb.xor %12, %true : i1
        %16 = comb.and %15, %14, %13 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %adc_ctrl_match_q, %11 : i8
        fsm.update %wakeup_timer_cnt_q, %10 : i24
        fsm.update %np_sample_cnt_q, %8 : i16
        fsm.update %lp_sample_cnt_q, %6 : i8
        fsm.update %trigger_q, %1 : i1
        %17 = comb.mux %12, %4, %pwrup_timer_cnt_q : i4
        %18 = comb.or %16, %arg1, %3 : i1
        %19 = comb.mux %18, %c0_i4, %17 : i4
        fsm.update %pwrup_timer_cnt_q, %19 : i4
      }
    }
  }
}

