module {
  fsm.machine @i2c_target_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i8, %arg8: i7, %arg9: i11, %arg10: i13, %arg11: i13, %arg12: i13, %arg13: i31, %arg14: i1, %arg15: i1, %arg16: i1, %arg17: i1, %arg18: i1, %arg19: i1, %arg20: i1, %arg21: i9, %arg22: i1, %arg23: i7, %arg24: i7, %arg25: i7, %arg26: i7) -> (i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "state_0"} {
    %tcount_q = fsm.variable "tcount_q" {initValue = -1 : i16} : i16
    %stretch_active_cnt = fsm.variable "stretch_active_cnt" {initValue = 0 : i31} : i31
    %auto_ack_cnt_q = fsm.variable "auto_ack_cnt_q" {initValue = 0 : i9} : i9
    %nack_transaction_q = fsm.variable "nack_transaction_q" {initValue = false} : i1
    %scl_i_q = fsm.variable "scl_i_q" {initValue = true} : i1
    %restart_det_q = fsm.variable "restart_det_q" {initValue = false} : i1
    %xact_for_us_q = fsm.variable "xact_for_us_q" {initValue = false} : i1
    %xfer_for_us_q = fsm.variable "xfer_for_us_q" {initValue = false} : i1
    %bit_idx = fsm.variable "bit_idx" {initValue = 0 : i4} : i4
    %input_byte = fsm.variable "input_byte" {initValue = 0 : i8} : i8
    %host_ack = fsm.variable "host_ack" {initValue = false} : i1
    %rw_bit_q = fsm.variable "rw_bit_q" {initValue = false} : i1
    %sda_q = fsm.variable "sda_q" {initValue = true} : i1
    fsm.state @state_0 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %true_2 = hw.constant true
      %false = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %15 = comb.and %4, %arg17, %rw_bit_q : i1
      %16 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %17 = ltl.past %true_2, 1 : i1
      %18 = comb.xor %17, %true : i1
      %19 = ltl.delay %true_2, 1, 0 : i1
      %20 = ltl.implication %18, %19 : i1, !ltl.sequence
      verif.assert %20 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %21 = comb.and %2, %7, %9, %arg16 : i1
      fsm.output %true_2, %true_1, %false, %false_3, %10, %11, %16, %true_0, %auto_ack_cnt_q, %false_4, %input_byte, %21, %13, %false_6, %1, %14, %15, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.mux bin %arg3, %c0_i31, %stretch_active_cnt : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %false_3 = hw.constant false
        %35 = comb.and %32, %34, %arg16 : i1
        %36 = ltl.past %true_2, 1 : i1
        %37 = comb.xor %36, %true : i1
        %38 = ltl.delay %true_2, 1, 0 : i1
        %39 = ltl.implication %37, %38 : i1, !ltl.sequence
        verif.assert %39 : !ltl.property
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.update %sda_q, %true_1 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %false_0 : i1
        fsm.update %xact_for_us_q, %false : i1
        fsm.update %restart_det_q, %false_3 : i1
        fsm.update %nack_transaction_q, %35 : i1
        fsm.update %stretch_active_cnt, %2 : i31
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.mux bin %arg3, %c0_i31, %stretch_active_cnt : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %false_3 = hw.constant false
        %35 = comb.and %32, %34, %arg16 : i1
        %36 = ltl.past %true_2, 1 : i1
        %37 = comb.xor %36, %true : i1
        %38 = ltl.delay %true_2, 1, 0 : i1
        %39 = ltl.implication %37, %38 : i1, !ltl.sequence
        verif.assert %39 : !ltl.property
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.update %sda_q, %true_1 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %false_0 : i1
        fsm.update %xact_for_us_q, %false : i1
        fsm.update %restart_det_q, %false_3 : i1
        fsm.update %nack_transaction_q, %35 : i1
        fsm.update %stretch_active_cnt, %2 : i31
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %5 = comb.or %3, %4 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %1, %true_3 : i1
        %7 = comb.and %6, %5 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.mux bin %arg3, %c0_i31, %stretch_active_cnt : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %false = hw.constant false
        %false_0 = hw.constant false
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %false_3 = hw.constant false
        %35 = comb.and %32, %34, %arg16 : i1
        %36 = ltl.past %true_2, 1 : i1
        %37 = comb.xor %36, %true : i1
        %38 = ltl.delay %true_2, 1, 0 : i1
        %39 = ltl.implication %37, %38 : i1, !ltl.sequence
        verif.assert %39 : !ltl.property
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.update %sda_q, %true_1 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %false_0 : i1
        fsm.update %xact_for_us_q, %false : i1
        fsm.update %restart_det_q, %false_3 : i1
        fsm.update %nack_transaction_q, %35 : i1
        fsm.update %stretch_active_cnt, %2 : i31
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_1 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %true_0, %false_2, %false_3, %10, %11, %18, %false, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %scl_i_q, %true : i1
        %10 = comb.and %9, %arg1 : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.extract %input_byte from 0 : (i8) -> i7
        %13 = comb.concat %12, %arg2 : i7, i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.xor %arg2, %true : i1
        %16 = comb.and %10, %11 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %10, %17, %15 : i1
        %19 = comb.and %10, %17 : i1
        %20 = comb.mux bin %19, %18, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %21 = comb.or %arg4, %arg17 : i1
        %22 = comb.and %arg5, %21 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %arg5, %arg3, %23 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.or %22, %25 : i1
        %27 = comb.xor %26, %true_2 : i1
        %28 = comb.or %27, %restart_det_q : i1
        %29 = comb.and %23, %25, %arg16 : i1
        %30 = comb.or %29, %nack_transaction_q : i1
        %31 = comb.xor %arg1, %true : i1
        %32 = ltl.past %true_1, 1 : i1
        %33 = comb.xor %32, %true : i1
        %34 = ltl.delay %true_1, 1, 0 : i1
        %35 = ltl.implication %33, %34 : i1, !ltl.sequence
        verif.assert %35 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %20 : i1
        fsm.update %xfer_for_us_q, %false : i1
        fsm.update %restart_det_q, %28 : i1
        fsm.update %nack_transaction_q, %30 : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %1 : i16
        %36 = comb.or %31, %2 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %37, %4, %6 : i1
        %39 = comb.mux %38, %5, %8 : i4
        %40 = comb.and %11, %10 : i1
        %41 = comb.mux %40, %13, %c0_i8 : i8
        %42 = comb.and %10, %2 : i1
        %43 = comb.and %arg1, %14 : i1
        %44 = comb.or %43, %42 : i1
        %45 = comb.mux bin %44, %input_byte, %41 : i8
        fsm.update %input_byte, %45 : i8
        fsm.update %bit_idx, %39 : i4
      }
      fsm.transition @state_2 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %1, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %scl_i_q, %true : i1
        %10 = comb.and %9, %arg1 : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.extract %input_byte from 0 : (i8) -> i7
        %13 = comb.concat %12, %arg2 : i7, i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.xor %arg2, %true : i1
        %16 = comb.and %10, %11 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %10, %17, %15 : i1
        %19 = comb.and %10, %17 : i1
        %20 = comb.mux bin %19, %18, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %21 = comb.or %arg4, %arg17 : i1
        %22 = comb.and %arg5, %21 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %arg5, %arg3, %23 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.or %22, %25 : i1
        %27 = comb.xor %26, %true_2 : i1
        %28 = comb.or %27, %restart_det_q : i1
        %29 = comb.and %23, %25, %arg16 : i1
        %30 = comb.or %29, %nack_transaction_q : i1
        %31 = comb.xor %arg1, %true : i1
        %32 = ltl.past %true_1, 1 : i1
        %33 = comb.xor %32, %true : i1
        %34 = ltl.delay %true_1, 1, 0 : i1
        %35 = ltl.implication %33, %34 : i1, !ltl.sequence
        verif.assert %35 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %20 : i1
        fsm.update %xfer_for_us_q, %false : i1
        fsm.update %restart_det_q, %28 : i1
        fsm.update %nack_transaction_q, %30 : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %1 : i16
        %36 = comb.or %31, %2 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %37, %4, %6 : i1
        %39 = comb.mux %38, %5, %8 : i4
        %40 = comb.and %11, %10 : i1
        %41 = comb.mux %40, %13, %c0_i8 : i8
        %42 = comb.and %10, %2 : i1
        %43 = comb.and %arg1, %14 : i1
        %44 = comb.or %43, %42 : i1
        %45 = comb.mux bin %44, %input_byte, %41 : i8
        fsm.update %input_byte, %45 : i8
        fsm.update %bit_idx, %39 : i4
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %6 = comb.and %5, %4, %arg1 : i1
        %7 = comb.or %1, %6 : i1
        %8 = comb.and %arg5, %7 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %scl_i_q, %true : i1
        %10 = comb.and %9, %arg1 : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.extract %input_byte from 0 : (i8) -> i7
        %13 = comb.concat %12, %arg2 : i7, i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.xor %arg2, %true : i1
        %16 = comb.and %10, %11 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %10, %17, %15 : i1
        %19 = comb.and %10, %17 : i1
        %20 = comb.mux bin %19, %18, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %21 = comb.or %arg4, %arg17 : i1
        %22 = comb.and %arg5, %21 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %arg5, %arg3, %23 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.or %22, %25 : i1
        %27 = comb.xor %26, %true_2 : i1
        %28 = comb.or %27, %restart_det_q : i1
        %29 = comb.and %23, %25, %arg16 : i1
        %30 = comb.or %29, %nack_transaction_q : i1
        %31 = comb.xor %arg1, %true : i1
        %32 = ltl.past %true_1, 1 : i1
        %33 = comb.xor %32, %true : i1
        %34 = ltl.delay %true_1, 1, 0 : i1
        %35 = ltl.implication %33, %34 : i1, !ltl.sequence
        verif.assert %35 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %20 : i1
        fsm.update %xfer_for_us_q, %false : i1
        fsm.update %restart_det_q, %28 : i1
        fsm.update %nack_transaction_q, %30 : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %1 : i16
        %36 = comb.or %31, %2 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %37, %4, %6 : i1
        %39 = comb.mux %38, %5, %8 : i4
        %40 = comb.and %11, %10 : i1
        %41 = comb.mux %40, %13, %c0_i8 : i8
        %42 = comb.and %10, %2 : i1
        %43 = comb.and %arg1, %14 : i1
        %44 = comb.or %43, %42 : i1
        %45 = comb.mux bin %44, %input_byte, %41 : i8
        fsm.update %input_byte, %45 : i8
        fsm.update %bit_idx, %39 : i4
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %scl_i_q, %true : i1
        %10 = comb.and %9, %arg1 : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.extract %input_byte from 0 : (i8) -> i7
        %13 = comb.concat %12, %arg2 : i7, i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.xor %arg2, %true : i1
        %16 = comb.and %10, %11 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %10, %17, %15 : i1
        %19 = comb.and %10, %17 : i1
        %20 = comb.mux bin %19, %18, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %21 = comb.or %arg4, %arg17 : i1
        %22 = comb.and %arg5, %21 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %arg5, %arg3, %23 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.or %22, %25 : i1
        %27 = comb.xor %26, %true_2 : i1
        %28 = comb.or %27, %restart_det_q : i1
        %29 = comb.and %23, %25, %arg16 : i1
        %30 = comb.or %29, %nack_transaction_q : i1
        %31 = comb.xor %arg1, %true : i1
        %32 = ltl.past %true_1, 1 : i1
        %33 = comb.xor %32, %true : i1
        %34 = ltl.delay %true_1, 1, 0 : i1
        %35 = ltl.implication %33, %34 : i1, !ltl.sequence
        verif.assert %35 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %20 : i1
        fsm.update %xfer_for_us_q, %false : i1
        fsm.update %restart_det_q, %28 : i1
        fsm.update %nack_transaction_q, %30 : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %1 : i16
        %36 = comb.or %31, %2 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %37, %4, %6 : i1
        %39 = comb.mux %38, %5, %8 : i4
        %40 = comb.and %11, %10 : i1
        %41 = comb.mux %40, %13, %c0_i8 : i8
        %42 = comb.and %10, %2 : i1
        %43 = comb.and %arg1, %14 : i1
        %44 = comb.or %43, %42 : i1
        %45 = comb.mux bin %44, %input_byte, %41 : i8
        fsm.update %input_byte, %45 : i8
        fsm.update %bit_idx, %39 : i4
      }
    }
    fsm.state @state_13 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %false = hw.constant false
      %1 = comb.xor %nack_transaction_q, %true : i1
      %false_0 = hw.constant false
      %true_1 = hw.constant true
      %true_2 = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %2 = comb.or %arg4, %arg17 : i1
      %3 = comb.and %arg5, %2 : i1
      %4 = comb.or %nack_transaction_q, %arg17 : i1
      %5 = comb.concat %4, %c-2_i2, %input_byte : i1, i2, i8
      %6 = comb.xor %3, %true : i1
      %7 = comb.and %arg5, %arg3, %6 : i1
      %8 = comb.xor %7, %true : i1
      %9 = comb.and %3, %xact_for_us_q : i1
      %10 = comb.mux %3, %5, %c0_i11 : i11
      %11 = comb.or %3, %7, %arg16 : i1
      %12 = comb.and %11, %xfer_for_us_q : i1
      %13 = comb.and %6, %8, %arg16 : i1
      %14 = comb.or %13, %nack_transaction_q : i1
      %15 = comb.and %6, %8, %arg16, %rw_bit_q : i1
      %16 = comb.and %3, %arg17, %rw_bit_q : i1
      %17 = comb.icmp ult %0, %c3_i7 : i7
      %false_7 = hw.constant false
      %18 = ltl.past %true_2, 1 : i1
      %19 = comb.xor %18, %true : i1
      %20 = ltl.delay %true_2, 1, 0 : i1
      %21 = ltl.implication %19, %20 : i1, !ltl.sequence
      verif.assert %21 : !ltl.property
      %true_8 = hw.constant true
      verif.assert %true_8 : i1
      %22 = comb.and %1, %14 : i1
      fsm.output %true_2, %true_1, %false_3, %false_4, %9, %10, %17, %false_0, %auto_ack_cnt_q, %false_5, %input_byte, %22, %12, %false_7, %false, %15, %16, %false_6 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_2 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c0_i7 = hw.constant 0 : i7
      %c-8_i4 = hw.constant -8 : i4
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.icmp eq %bit_idx, %c-8_i4 : i4
      %1 = comb.extract %input_byte from 1 : (i8) -> i7
      %2 = comb.and %1, %arg24 : i7
      %3 = comb.icmp eq %2, %arg23 : i7
      %4 = comb.icmp ne %arg24, %c0_i7 : i7
      %5 = comb.and %3, %4 : i1
      %6 = comb.and %1, %arg26 : i7
      %7 = comb.icmp eq %6, %arg25 : i7
      %8 = comb.icmp ne %arg26, %c0_i7 : i7
      %9 = comb.and %7, %8 : i1
      %10 = comb.or %5, %9 : i1
      %11 = comb.xor %0, %true : i1
      %12 = comb.sub %c-64_i7, %arg8 : i7
      %13 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %14 = comb.xor %nack_transaction_q, %true : i1
      %15 = comb.xor %0, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %16 = comb.or %arg4, %arg17 : i1
      %17 = comb.and %arg5, %16 : i1
      %18 = comb.or %nack_transaction_q, %arg17 : i1
      %19 = comb.concat %18, %c-2_i2, %input_byte : i1, i2, i8
      %20 = comb.xor %17, %true : i1
      %21 = comb.and %arg5, %arg3, %20 : i1
      %22 = comb.xor %21, %true : i1
      %23 = comb.and %17, %xact_for_us_q : i1
      %24 = comb.mux %17, %19, %c0_i11 : i11
      %25 = comb.or %17, %21, %arg16 : i1
      %26 = comb.and %25, %xfer_for_us_q : i1
      %27 = comb.and %20, %22, %arg16 : i1
      %28 = comb.and %20, %22, %arg16, %rw_bit_q : i1
      %29 = comb.and %17, %arg17, %rw_bit_q : i1
      %30 = comb.icmp ult %12, %c3_i7 : i7
      %31 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
      %32 = comb.and %arg14, %31 : i1
      %false_6 = hw.constant false
      %33 = ltl.past %true_1, 1 : i1
      %34 = comb.xor %33, %true : i1
      %35 = ltl.delay %true_1, 1, 0 : i1
      %36 = ltl.implication %34, %35 : i1, !ltl.sequence
      verif.assert %36 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %37 = comb.mux %0, %10, %32 : i1
      %38 = comb.and %37, %15 : i1
      %39 = comb.or %38, %nack_transaction_q : i1
      %40 = comb.and %0, %39 : i1
      %41 = comb.mux %11, %nack_transaction_q, %40 : i1
      %42 = comb.or %27, %41 : i1
      %43 = comb.and %14, %42 : i1
      fsm.output %true_1, %true_0, %false_2, %false_3, %23, %24, %30, %false, %auto_ack_cnt_q, %false_4, %input_byte, %43, %26, %false_6, %13, %28, %29, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %false = hw.constant false
        %0 = ltl.past %true_1, 1 : i1
        %1 = comb.xor %0, %true : i1
        %2 = ltl.delay %true_1, 1, 0 : i1
        %3 = ltl.implication %1, %2 : i1, !ltl.sequence
        verif.assert %3 : !ltl.property
        fsm.return %false
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.extract %input_byte from 1 : (i8) -> i7
        %13 = comb.and %12, %arg24 : i7
        %14 = comb.icmp eq %13, %arg23 : i7
        %15 = comb.icmp ne %arg24, %c0_i7 : i7
        %16 = comb.and %14, %15 : i1
        %17 = comb.and %12, %arg26 : i7
        %18 = comb.icmp eq %17, %arg25 : i7
        %19 = comb.icmp ne %arg26, %c0_i7 : i7
        %20 = comb.and %18, %19 : i1
        %21 = comb.or %16, %20 : i1
        %22 = comb.xor %scl_i_q, %true : i1
        %23 = comb.and %22, %arg1 : i1
        %24 = comb.xor %2, %true : i1
        %25 = comb.extract %input_byte from 0 : (i8) -> i7
        %26 = comb.concat %25, %arg2 : i7, i1
        %27 = comb.and %24, %23 : i1
        %28 = comb.mux %27, %26, %c0_i8 : i8
        %29 = comb.and %23, %2 : i1
        %30 = comb.xor %23, %true : i1
        %31 = comb.or %30, %29 : i1
        %32 = comb.mux bin %31, %input_byte, %28 : i8
        %33 = comb.xor %arg2, %true : i1
        %34 = comb.and %23, %24 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.and %23, %35, %33 : i1
        %37 = comb.and %23, %35 : i1
        %38 = comb.mux bin %37, %36, %host_ack : i1
        %39 = comb.extract %input_byte from 0 : (i8) -> i1
        %40 = comb.xor %2, %true : i1
        %41 = comb.xor %2, %true : i1
        %42 = comb.and %2, %41 : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %43 = comb.or %arg4, %arg17 : i1
        %44 = comb.and %arg5, %43 : i1
        %45 = comb.xor %42, %true : i1
        %46 = comb.xor %44, %true : i1
        %47 = comb.and %arg5, %arg3, %46 : i1
        %48 = comb.xor %47, %true : i1
        %49 = comb.or %44, %48 : i1
        %50 = comb.mux %49, %restart_det_q, %45 : i1
        %51 = comb.and %46, %48, %arg16 : i1
        %52 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %53 = comb.and %arg14, %52 : i1
        %54 = comb.mux %2, %21, %rw_bit_q : i1
        %55 = comb.and %2, %54 : i1
        %56 = ltl.past %true_1, 1 : i1
        %57 = comb.xor %56, %true : i1
        %58 = ltl.delay %true_1, 1, 0 : i1
        %59 = ltl.implication %57, %58 : i1, !ltl.sequence
        verif.assert %59 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %38 : i1
        fsm.update %input_byte, %32 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %50 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %60 = comb.xor %55, %true : i1
        %61 = comb.or %55, %arg5 : i1
        %62 = comb.mux %61, %c1_i16, %tcount_q : i16
        %63 = comb.mux %55, %0, %62 : i16
        %64 = comb.and %arg5, %60 : i1
        %65 = comb.mux %64, %1, %63 : i16
        %66 = comb.and %arg3, %42 : i1
        %67 = comb.and %2, %21 : i1
        %68 = comb.mux bin %67, %39, %rw_bit_q : i1
        %69 = comb.mux %2, %21, %53 : i1
        %70 = comb.and %69, %2 : i1
        %71 = comb.or %70, %xact_for_us_q : i1
        %72 = comb.and %69, %40 : i1
        %73 = comb.or %72, %nack_transaction_q : i1
        %74 = comb.and %2, %71 : i1
        %75 = comb.and %2, %73 : i1
        %76 = comb.mux %24, %xact_for_us_q, %74 : i1
        %77 = comb.and %2, %69 : i1
        %78 = comb.or %77, %xfer_for_us_q : i1
        %79 = comb.mux %24, %nack_transaction_q, %75 : i1
        %80 = comb.or %51, %79 : i1
        fsm.update %rw_bit_q, %68 : i1
        fsm.update %xfer_for_us_q, %78 : i1
        fsm.update %xact_for_us_q, %76 : i1
        fsm.update %nack_transaction_q, %80 : i1
        fsm.update %tcount_q, %65 : i16
        %81 = comb.mux bin %66, %c0_i31, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %81 : i31
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %false = hw.constant false
        %0 = ltl.past %true_1, 1 : i1
        %1 = comb.xor %0, %true : i1
        %2 = ltl.delay %true_1, 1, 0 : i1
        %3 = ltl.implication %1, %2 : i1, !ltl.sequence
        verif.assert %3 : !ltl.property
        fsm.return %false
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.extract %input_byte from 1 : (i8) -> i7
        %13 = comb.and %12, %arg24 : i7
        %14 = comb.icmp eq %13, %arg23 : i7
        %15 = comb.icmp ne %arg24, %c0_i7 : i7
        %16 = comb.and %14, %15 : i1
        %17 = comb.and %12, %arg26 : i7
        %18 = comb.icmp eq %17, %arg25 : i7
        %19 = comb.icmp ne %arg26, %c0_i7 : i7
        %20 = comb.and %18, %19 : i1
        %21 = comb.or %16, %20 : i1
        %22 = comb.xor %scl_i_q, %true : i1
        %23 = comb.and %22, %arg1 : i1
        %24 = comb.xor %2, %true : i1
        %25 = comb.extract %input_byte from 0 : (i8) -> i7
        %26 = comb.concat %25, %arg2 : i7, i1
        %27 = comb.and %24, %23 : i1
        %28 = comb.mux %27, %26, %c0_i8 : i8
        %29 = comb.and %23, %2 : i1
        %30 = comb.xor %23, %true : i1
        %31 = comb.or %30, %29 : i1
        %32 = comb.mux bin %31, %input_byte, %28 : i8
        %33 = comb.xor %arg2, %true : i1
        %34 = comb.and %23, %24 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.and %23, %35, %33 : i1
        %37 = comb.and %23, %35 : i1
        %38 = comb.mux bin %37, %36, %host_ack : i1
        %39 = comb.extract %input_byte from 0 : (i8) -> i1
        %40 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %41 = comb.or %arg4, %arg17 : i1
        %42 = comb.and %arg5, %41 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %42, %true : i1
        %44 = comb.and %arg5, %arg3, %43 : i1
        %45 = comb.xor %44, %true : i1
        %46 = comb.or %42, %45 : i1
        %47 = comb.xor %46, %true_2 : i1
        %48 = comb.or %47, %restart_det_q : i1
        %49 = comb.and %43, %45, %arg16 : i1
        %50 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %51 = comb.and %arg14, %50 : i1
        %52 = comb.mux %2, %21, %rw_bit_q : i1
        %53 = comb.and %2, %52 : i1
        %54 = ltl.past %true_1, 1 : i1
        %55 = comb.xor %54, %true : i1
        %56 = ltl.delay %true_1, 1, 0 : i1
        %57 = ltl.implication %55, %56 : i1, !ltl.sequence
        verif.assert %57 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %38 : i1
        fsm.update %input_byte, %32 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %48 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %58 = comb.xor %53, %true : i1
        %59 = comb.or %53, %arg5 : i1
        %60 = comb.mux %59, %c1_i16, %tcount_q : i16
        %61 = comb.mux %53, %0, %60 : i16
        %62 = comb.and %arg5, %58 : i1
        %63 = comb.mux %62, %1, %61 : i16
        %64 = comb.and %2, %21 : i1
        %65 = comb.mux bin %64, %39, %rw_bit_q : i1
        %66 = comb.mux %2, %21, %51 : i1
        %67 = comb.and %66, %2 : i1
        %68 = comb.or %67, %xact_for_us_q : i1
        %69 = comb.and %66, %40 : i1
        %70 = comb.or %69, %nack_transaction_q : i1
        %71 = comb.and %2, %68 : i1
        %72 = comb.and %2, %70 : i1
        %73 = comb.mux %24, %xact_for_us_q, %71 : i1
        %74 = comb.and %2, %66 : i1
        %75 = comb.or %74, %xfer_for_us_q : i1
        %76 = comb.mux %24, %nack_transaction_q, %72 : i1
        %77 = comb.or %49, %76 : i1
        fsm.update %rw_bit_q, %65 : i1
        fsm.update %xfer_for_us_q, %75 : i1
        fsm.update %xact_for_us_q, %73 : i1
        fsm.update %nack_transaction_q, %77 : i1
        fsm.update %tcount_q, %63 : i16
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
      }
      fsm.transition @state_3 guard {
        %true = hw.constant true
        %c0_i7 = hw.constant 0 : i7
        %c-8_i4 = hw.constant -8 : i4
        %0 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %1 = comb.extract %input_byte from 1 : (i8) -> i7
        %2 = comb.and %1, %arg24 : i7
        %3 = comb.icmp eq %2, %arg23 : i7
        %4 = comb.icmp ne %arg24, %c0_i7 : i7
        %5 = comb.and %3, %4 : i1
        %6 = comb.and %1, %arg26 : i7
        %7 = comb.icmp eq %6, %arg25 : i7
        %8 = comb.icmp ne %arg26, %c0_i7 : i7
        %9 = comb.and %7, %8 : i1
        %10 = comb.or %5, %9 : i1
        %11 = comb.or %arg4, %arg17 : i1
        %12 = comb.and %arg5, %arg3 : i1
        %13 = comb.xor %12, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %14 = comb.mux %0, %10, %rw_bit_q : i1
        %15 = comb.and %13, %arg5, %11 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %17 = comb.xor %15, %true_3 : i1
        %true_4 = hw.constant true
        %18 = comb.xor %12, %true_4 : i1
        %19 = comb.and %arg5, %18, %17, %16, %0, %14 : i1
        %20 = ltl.past %true_1, 1 : i1
        %21 = comb.xor %20, %true : i1
        %22 = ltl.delay %true_1, 1, 0 : i1
        %23 = ltl.implication %21, %22 : i1, !ltl.sequence
        verif.assert %23 : !ltl.property
        fsm.return %19
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.extract %input_byte from 1 : (i8) -> i7
        %13 = comb.and %12, %arg24 : i7
        %14 = comb.icmp eq %13, %arg23 : i7
        %15 = comb.icmp ne %arg24, %c0_i7 : i7
        %16 = comb.and %14, %15 : i1
        %17 = comb.and %12, %arg26 : i7
        %18 = comb.icmp eq %17, %arg25 : i7
        %19 = comb.icmp ne %arg26, %c0_i7 : i7
        %20 = comb.and %18, %19 : i1
        %21 = comb.or %16, %20 : i1
        %22 = comb.xor %scl_i_q, %true : i1
        %23 = comb.and %22, %arg1 : i1
        %24 = comb.xor %2, %true : i1
        %25 = comb.extract %input_byte from 0 : (i8) -> i7
        %26 = comb.concat %25, %arg2 : i7, i1
        %27 = comb.and %24, %23 : i1
        %28 = comb.mux %27, %26, %c0_i8 : i8
        %29 = comb.and %23, %2 : i1
        %30 = comb.xor %23, %true : i1
        %31 = comb.or %30, %29 : i1
        %32 = comb.mux bin %31, %input_byte, %28 : i8
        %33 = comb.xor %arg2, %true : i1
        %34 = comb.and %23, %24 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.and %23, %35, %33 : i1
        %37 = comb.and %23, %35 : i1
        %38 = comb.mux bin %37, %36, %host_ack : i1
        %39 = comb.extract %input_byte from 0 : (i8) -> i1
        %40 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %41 = comb.or %arg4, %arg17 : i1
        %42 = comb.and %arg5, %41 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %42, %true : i1
        %44 = comb.and %arg5, %arg3, %43 : i1
        %45 = comb.xor %44, %true : i1
        %46 = comb.or %42, %45 : i1
        %47 = comb.xor %46, %true_2 : i1
        %48 = comb.or %47, %restart_det_q : i1
        %49 = comb.and %43, %45, %arg16 : i1
        %50 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %51 = comb.and %arg14, %50 : i1
        %52 = comb.mux %2, %21, %rw_bit_q : i1
        %53 = comb.and %2, %52 : i1
        %54 = ltl.past %true_1, 1 : i1
        %55 = comb.xor %54, %true : i1
        %56 = ltl.delay %true_1, 1, 0 : i1
        %57 = ltl.implication %55, %56 : i1, !ltl.sequence
        verif.assert %57 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %38 : i1
        fsm.update %input_byte, %32 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %48 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %58 = comb.xor %53, %true : i1
        %59 = comb.or %53, %arg5 : i1
        %60 = comb.mux %59, %c1_i16, %tcount_q : i16
        %61 = comb.mux %53, %0, %60 : i16
        %62 = comb.and %arg5, %58 : i1
        %63 = comb.mux %62, %1, %61 : i16
        %64 = comb.and %2, %21 : i1
        %65 = comb.mux bin %64, %39, %rw_bit_q : i1
        %66 = comb.mux %2, %21, %51 : i1
        %67 = comb.and %66, %2 : i1
        %68 = comb.or %67, %xact_for_us_q : i1
        %69 = comb.and %66, %40 : i1
        %70 = comb.or %69, %nack_transaction_q : i1
        %71 = comb.and %2, %68 : i1
        %72 = comb.and %2, %70 : i1
        %73 = comb.mux %24, %xact_for_us_q, %71 : i1
        %74 = comb.and %2, %66 : i1
        %75 = comb.or %74, %xfer_for_us_q : i1
        %76 = comb.mux %24, %nack_transaction_q, %72 : i1
        %77 = comb.or %49, %76 : i1
        fsm.update %rw_bit_q, %65 : i1
        fsm.update %xfer_for_us_q, %75 : i1
        fsm.update %xact_for_us_q, %73 : i1
        fsm.update %nack_transaction_q, %77 : i1
        fsm.update %tcount_q, %63 : i16
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.extract %input_byte from 1 : (i8) -> i7
        %13 = comb.and %12, %arg24 : i7
        %14 = comb.icmp eq %13, %arg23 : i7
        %15 = comb.icmp ne %arg24, %c0_i7 : i7
        %16 = comb.and %14, %15 : i1
        %17 = comb.and %12, %arg26 : i7
        %18 = comb.icmp eq %17, %arg25 : i7
        %19 = comb.icmp ne %arg26, %c0_i7 : i7
        %20 = comb.and %18, %19 : i1
        %21 = comb.or %16, %20 : i1
        %22 = comb.xor %scl_i_q, %true : i1
        %23 = comb.and %22, %arg1 : i1
        %24 = comb.xor %2, %true : i1
        %25 = comb.extract %input_byte from 0 : (i8) -> i7
        %26 = comb.concat %25, %arg2 : i7, i1
        %27 = comb.and %24, %23 : i1
        %28 = comb.mux %27, %26, %c0_i8 : i8
        %29 = comb.and %23, %2 : i1
        %30 = comb.xor %23, %true : i1
        %31 = comb.or %30, %29 : i1
        %32 = comb.mux bin %31, %input_byte, %28 : i8
        %33 = comb.xor %arg2, %true : i1
        %34 = comb.and %23, %24 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.and %23, %35, %33 : i1
        %37 = comb.and %23, %35 : i1
        %38 = comb.mux bin %37, %36, %host_ack : i1
        %39 = comb.extract %input_byte from 0 : (i8) -> i1
        %40 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %41 = comb.or %arg4, %arg17 : i1
        %42 = comb.and %arg5, %41 : i1
        %true_2 = hw.constant true
        %43 = comb.xor %42, %true : i1
        %44 = comb.and %arg5, %arg3, %43 : i1
        %45 = comb.xor %44, %true : i1
        %46 = comb.or %42, %45 : i1
        %47 = comb.xor %46, %true_2 : i1
        %48 = comb.or %47, %restart_det_q : i1
        %49 = comb.and %43, %45, %arg16 : i1
        %50 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %51 = comb.and %arg14, %50 : i1
        %52 = comb.mux %2, %21, %rw_bit_q : i1
        %53 = comb.and %2, %52 : i1
        %54 = ltl.past %true_1, 1 : i1
        %55 = comb.xor %54, %true : i1
        %56 = ltl.delay %true_1, 1, 0 : i1
        %57 = ltl.implication %55, %56 : i1, !ltl.sequence
        verif.assert %57 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %38 : i1
        fsm.update %input_byte, %32 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %48 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %58 = comb.xor %53, %true : i1
        %59 = comb.or %53, %arg5 : i1
        %60 = comb.mux %59, %c1_i16, %tcount_q : i16
        %61 = comb.mux %53, %0, %60 : i16
        %62 = comb.and %arg5, %58 : i1
        %63 = comb.mux %62, %1, %61 : i16
        %64 = comb.and %2, %21 : i1
        %65 = comb.mux bin %64, %39, %rw_bit_q : i1
        %66 = comb.mux %2, %21, %51 : i1
        %67 = comb.and %66, %2 : i1
        %68 = comb.or %67, %xact_for_us_q : i1
        %69 = comb.and %66, %40 : i1
        %70 = comb.or %69, %nack_transaction_q : i1
        %71 = comb.and %2, %68 : i1
        %72 = comb.and %2, %70 : i1
        %73 = comb.mux %24, %xact_for_us_q, %71 : i1
        %74 = comb.and %2, %66 : i1
        %75 = comb.or %74, %xfer_for_us_q : i1
        %76 = comb.mux %24, %nack_transaction_q, %72 : i1
        %77 = comb.or %49, %76 : i1
        fsm.update %rw_bit_q, %65 : i1
        fsm.update %xfer_for_us_q, %75 : i1
        fsm.update %xact_for_us_q, %73 : i1
        fsm.update %nack_transaction_q, %77 : i1
        fsm.update %tcount_q, %63 : i16
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
      }
    }
    fsm.state @state_3 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %arg1, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %true_0, %false_2, %false_3, %10, %11, %18, %false, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_21 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.xor %arg15, %true : i1
        %7 = comb.and %arg5, %arg3 : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %9 = comb.and %2, %0, %arg15 : i1
        %10 = comb.mux %9, %nack_transaction_q, %5 : i1
        %11 = comb.and %2, %0 : i1
        %12 = comb.and %arg15, %11 : i1
        %13 = comb.and %11, %6 : i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.and %14, %12 : i1
        %16 = comb.and %0, %3 : i1
        %17 = comb.and %8, %arg5, %4 : i1
        %true_2 = hw.constant true
        %18 = comb.xor %9, %true_2 : i1
        %true_3 = hw.constant true
        %19 = comb.xor %13, %true_3 : i1
        %true_4 = hw.constant true
        %20 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %21 = comb.xor %15, %true_5 : i1
        %true_6 = hw.constant true
        %22 = comb.xor %16, %true_6 : i1
        %true_7 = hw.constant true
        %23 = comb.xor %arg16, %true_7 : i1
        %true_8 = hw.constant true
        %24 = comb.xor %17, %true_8 : i1
        %true_9 = hw.constant true
        %25 = comb.xor %7, %true_9 : i1
        %26 = comb.and %arg5, %25, %24, %23, %22, %21, %20, %19, %12, %10, %18 : i1
        %27 = ltl.past %true_1, 1 : i1
        %28 = comb.xor %27, %true : i1
        %29 = ltl.delay %true_1, 1, 0 : i1
        %30 = ltl.implication %28, %29 : i1, !ltl.sequence
        verif.assert %30 : !ltl.property
        fsm.return %26
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_19 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %8 = comb.and %2, %0, %arg15 : i1
        %9 = comb.mux %8, %5, %rw_bit_q : i1
        %c-4_i3 = hw.constant -4 : i3
        %c1_i3 = hw.constant 1 : i3
        %10 = comb.mux %8, %c-4_i3, %c1_i3 : i3
        %11 = comb.mux %8, %nack_transaction_q, %5 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.and %0, %3 : i1
        %14 = comb.and %7, %arg5, %4 : i1
        %15 = comb.extract %10 from 2 : (i3) -> i1
        %16 = comb.extract %10 from 0 : (i3) -> i1
        %17 = comb.concat %15, %16 : i1, i1
        %c-2_i2 = hw.constant -2 : i2
        %18 = comb.icmp eq %17, %c-2_i2 : i2
        %true_2 = hw.constant true
        %19 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %20 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %14, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %6, %true_5 : i1
        %23 = comb.and %arg5, %22, %21, %20, %19, %12, %arg15, %2, %0, %9, %18 : i1
        %24 = ltl.past %true_1, 1 : i1
        %25 = comb.xor %24, %true : i1
        %26 = ltl.delay %true_1, 1, 0 : i1
        %27 = ltl.implication %25, %26 : i1, !ltl.sequence
        verif.assert %27 : !ltl.property
        fsm.return %23
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %8 = comb.and %2, %0, %arg15 : i1
        %9 = comb.mux %8, %5, %rw_bit_q : i1
        %c2_i3 = hw.constant 2 : i3
        %c-1_i3 = hw.constant -1 : i3
        %10 = comb.mux %8, %c2_i3, %c-1_i3 : i3
        %11 = comb.mux %8, %nack_transaction_q, %5 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.and %0, %3 : i1
        %14 = comb.and %7, %arg5, %4 : i1
        %15 = comb.extract %10 from 2 : (i3) -> i1
        %16 = comb.extract %10 from 0 : (i3) -> i1
        %17 = comb.concat %15, %16 : i1, i1
        %c-1_i2 = hw.constant -1 : i2
        %18 = comb.icmp eq %17, %c-1_i2 : i2
        %true_2 = hw.constant true
        %19 = comb.xor %9, %true_2 : i1
        %true_3 = hw.constant true
        %20 = comb.xor %13, %true_3 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %14, %true_5 : i1
        %true_6 = hw.constant true
        %23 = comb.xor %6, %true_6 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20, %12, %arg15, %2, %0, %19, %18 : i1
        %25 = ltl.past %true_1, 1 : i1
        %26 = comb.xor %25, %true : i1
        %27 = ltl.delay %true_1, 1, 0 : i1
        %28 = ltl.implication %26, %27 : i1, !ltl.sequence
        verif.assert %28 : !ltl.property
        fsm.return %24
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.xor %arg15, %true : i1
        %7 = comb.and %arg5, %arg3 : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %9 = comb.and %2, %0, %arg15 : i1
        %10 = comb.mux %9, %nack_transaction_q, %5 : i1
        %11 = comb.and %2, %0 : i1
        %12 = comb.and %arg15, %11 : i1
        %13 = comb.and %11, %6 : i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.and %14, %12 : i1
        %16 = comb.and %0, %3 : i1
        %17 = comb.and %8, %arg5, %4 : i1
        %true_2 = hw.constant true
        %18 = comb.xor %13, %true_2 : i1
        %19 = comb.and %18, %12, %10, %9 : i1
        %20 = comb.or %arg1, %19 : i1
        %true_3 = hw.constant true
        %21 = comb.xor %15, %true_3 : i1
        %true_4 = hw.constant true
        %22 = comb.xor %16, %true_4 : i1
        %23 = comb.and %22, %21, %20 : i1
        %24 = comb.or %arg16, %23 : i1
        %true_5 = hw.constant true
        %25 = comb.xor %17, %true_5 : i1
        %true_6 = hw.constant true
        %26 = comb.xor %7, %true_6 : i1
        %27 = comb.and %arg5, %26, %25, %24 : i1
        %28 = ltl.past %true_1, 1 : i1
        %29 = comb.xor %28, %true : i1
        %30 = ltl.delay %true_1, 1, 0 : i1
        %31 = ltl.implication %29, %30 : i1, !ltl.sequence
        verif.assert %31 : !ltl.property
        fsm.return %27
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %8 = comb.and %2, %0, %arg15 : i1
        %9 = comb.mux %8, %5, %rw_bit_q : i1
        %c-4_i3 = hw.constant -4 : i3
        %c1_i3 = hw.constant 1 : i3
        %10 = comb.mux %8, %c-4_i3, %c1_i3 : i3
        %11 = comb.mux %8, %nack_transaction_q, %5 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.and %0, %3 : i1
        %14 = comb.and %7, %arg5, %4 : i1
        %15 = comb.extract %10 from 2 : (i3) -> i1
        %16 = comb.extract %10 from 0 : (i3) -> i1
        %17 = comb.concat %15, %16 : i1, i1
        %c1_i2 = hw.constant 1 : i2
        %18 = comb.icmp eq %17, %c1_i2 : i2
        %true_2 = hw.constant true
        %19 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %20 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %14, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %6, %true_5 : i1
        %23 = comb.and %arg5, %22, %21, %20, %19, %12, %arg15, %2, %0, %9, %18 : i1
        %24 = ltl.past %true_1, 1 : i1
        %25 = comb.xor %24, %true : i1
        %26 = ltl.delay %true_1, 1, 0 : i1
        %27 = ltl.implication %25, %26 : i1, !ltl.sequence
        verif.assert %27 : !ltl.property
        fsm.return %23
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.xor %arg15, %true : i1
        %7 = comb.and %arg5, %arg3 : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %9 = comb.and %2, %0, %arg15 : i1
        %10 = comb.mux %9, %5, %rw_bit_q : i1
        %c2_i3 = hw.constant 2 : i3
        %c-1_i3 = hw.constant -1 : i3
        %11 = comb.mux %9, %c2_i3, %c-1_i3 : i3
        %12 = comb.mux %9, %nack_transaction_q, %5 : i1
        %13 = comb.and %2, %0 : i1
        %14 = comb.xor %12, %true : i1
        %15 = comb.and %14, %arg15, %13 : i1
        %16 = comb.and %0, %3 : i1
        %17 = comb.and %8, %arg5, %4 : i1
        %18 = comb.extract %11 from 2 : (i3) -> i1
        %19 = comb.extract %11 from 0 : (i3) -> i1
        %20 = comb.concat %18, %19 : i1, i1
        %c0_i2 = hw.constant 0 : i2
        %21 = comb.icmp eq %20, %c0_i2 : i2
        %true_2 = hw.constant true
        %22 = comb.xor %10, %true_2 : i1
        %23 = comb.and %22, %21 : i1
        %true_3 = hw.constant true
        %24 = comb.xor %arg1, %true_3 : i1
        %25 = comb.and %24, %13, %6 : i1
        %26 = comb.mux %15, %23, %25 : i1
        %true_4 = hw.constant true
        %27 = comb.xor %16, %true_4 : i1
        %true_5 = hw.constant true
        %28 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %17, %true_6 : i1
        %true_7 = hw.constant true
        %30 = comb.xor %7, %true_7 : i1
        %31 = comb.and %arg5, %30, %29, %28, %27, %26 : i1
        %32 = ltl.past %true_1, 1 : i1
        %33 = comb.xor %32, %true : i1
        %34 = ltl.delay %true_1, 1, 0 : i1
        %35 = ltl.implication %33, %34 : i1, !ltl.sequence
        verif.assert %35 : !ltl.property
        fsm.return %31
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_3 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %8 = comb.and %2, %0, %arg15 : i1
        %9 = comb.mux %8, %5, %rw_bit_q : i1
        %c-4_i3 = hw.constant -4 : i3
        %c1_i3 = hw.constant 1 : i3
        %10 = comb.mux %8, %c-4_i3, %c1_i3 : i3
        %11 = comb.mux %8, %nack_transaction_q, %5 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.and %0, %3 : i1
        %14 = comb.and %7, %arg5, %4 : i1
        %15 = comb.extract %10 from 2 : (i3) -> i1
        %16 = comb.extract %10 from 0 : (i3) -> i1
        %17 = comb.concat %15, %16 : i1, i1
        %c0_i2 = hw.constant 0 : i2
        %18 = comb.icmp eq %17, %c0_i2 : i2
        %19 = comb.and %12, %arg15, %2, %0, %9, %18 : i1
        %20 = comb.or %13, %19 : i1
        %true_2 = hw.constant true
        %21 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %22 = comb.xor %14, %true_3 : i1
        %true_4 = hw.constant true
        %23 = comb.xor %6, %true_4 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20 : i1
        %25 = ltl.past %true_1, 1 : i1
        %26 = comb.xor %25, %true : i1
        %27 = ltl.delay %true_1, 1, 0 : i1
        %28 = ltl.implication %26, %27 : i1, !ltl.sequence
        verif.assert %28 : !ltl.property
        fsm.return %24
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.xor %arg15, %true : i1
        %7 = comb.xor %arg5, %true : i1
        %8 = comb.and %arg5, %arg3 : i1
        %9 = comb.xor %8, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %10 = comb.and %2, %0, %arg15 : i1
        %11 = comb.mux %10, %nack_transaction_q, %5 : i1
        %12 = comb.and %2, %0 : i1
        %13 = comb.and %arg15, %12 : i1
        %14 = comb.and %13, %11 : i1
        %15 = comb.and %12, %6 : i1
        %16 = comb.xor %11, %true : i1
        %17 = comb.and %16, %13 : i1
        %18 = comb.and %0, %3 : i1
        %19 = comb.and %9, %arg5, %4 : i1
        %true_2 = hw.constant true
        %20 = comb.xor %14, %true_2 : i1
        %true_3 = hw.constant true
        %21 = comb.xor %15, %true_3 : i1
        %true_4 = hw.constant true
        %22 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %23 = comb.xor %17, %true_5 : i1
        %true_6 = hw.constant true
        %24 = comb.xor %18, %true_6 : i1
        %true_7 = hw.constant true
        %25 = comb.xor %arg16, %true_7 : i1
        %26 = comb.and %25, %24, %23, %22, %21, %20 : i1
        %27 = comb.or %19, %26 : i1
        %true_8 = hw.constant true
        %28 = comb.xor %8, %true_8 : i1
        %29 = comb.and %28, %27 : i1
        %30 = comb.or %7, %29 : i1
        %31 = ltl.past %true_1, 1 : i1
        %32 = comb.xor %31, %true : i1
        %33 = ltl.delay %true_1, 1, 0 : i1
        %34 = ltl.implication %32, %33 : i1, !ltl.sequence
        verif.assert %34 : !ltl.property
        fsm.return %30
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_7 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %true_0, %false_2, %false_3, %10, %11, %18, %false, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_22 guard {
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg6, %true : i1
        %2 = comb.extract %arg8 from 1 : (i7) -> i6
        %3 = comb.icmp ne %2, %c0_i6 : i6
        %4 = comb.or %1, %arg18, %3 : i1
        %5 = comb.and %arg5, %arg3 : i1
        %6 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %7 = comb.and %6, %arg5, %0 : i1
        %true_2 = hw.constant true
        %8 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %9 = comb.xor %7, %true_3 : i1
        %true_4 = hw.constant true
        %10 = comb.xor %5, %true_4 : i1
        %11 = comb.and %arg5, %10, %9, %8, %4 : i1
        %12 = ltl.past %true_1, 1 : i1
        %13 = comb.xor %12, %true : i1
        %14 = ltl.delay %true_1, 1, 0 : i1
        %15 = ltl.implication %13, %14 : i1, !ltl.sequence
        verif.assert %15 : !ltl.property
        fsm.return %11
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg6, %true : i1
        %2 = comb.extract %arg8 from 1 : (i7) -> i6
        %3 = comb.icmp ne %2, %c0_i6 : i6
        %4 = comb.or %1, %arg18, %3 : i1
        %5 = comb.and %arg5, %arg3 : i1
        %6 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %7 = comb.and %6, %arg5, %0 : i1
        %true_2 = hw.constant true
        %8 = comb.xor %4, %true_2 : i1
        %true_3 = hw.constant true
        %9 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %10 = comb.xor %7, %true_4 : i1
        %true_5 = hw.constant true
        %11 = comb.xor %5, %true_5 : i1
        %12 = comb.and %arg5, %11, %10, %9, %8 : i1
        %13 = ltl.past %true_1, 1 : i1
        %14 = comb.xor %13, %true : i1
        %15 = ltl.delay %true_1, 1, 0 : i1
        %16 = ltl.implication %14, %15 : i1, !ltl.sequence
        verif.assert %16 : !ltl.property
        fsm.return %12
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_14 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %true_0, %false_2, %false_3, %10, %11, %18, %false, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_15 guard {
        %true = hw.constant true
        %c-8_i4 = hw.constant -8 : i4
        %0 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.and %3, %arg5, %1 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %2, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %43 = comb.xor %2, %true : i1
        %44 = comb.or %2, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %2, %0, %45 : i16
        %47 = comb.and %arg5, %43 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c-8_i4 = hw.constant -8 : i4
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %4 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %1, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %43 = comb.xor %2, %true : i1
        %44 = comb.or %2, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %2, %0, %45 : i16
        %47 = comb.and %arg5, %43 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
    }
    fsm.state @state_4 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_2, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_2, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_2, %false, %true_0, %false_3, %10, %11, %18, %false_1, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %1, %true_4 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_0, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_0, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg1, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %7 = comb.xor %1, %true_5 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_0, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_0, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_19 output {
      %true = hw.constant true
      %c0_i6 = hw.constant 0 : i6
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %3 = comb.extract %0 from 1 : (i7) -> i6
      %4 = comb.icmp ne %3, %c0_i6 : i6
      %true_0 = hw.constant true
      %false = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %5 = comb.or %arg4, %arg17 : i1
      %6 = comb.and %arg5, %5 : i1
      %7 = comb.or %nack_transaction_q, %arg17 : i1
      %8 = comb.concat %7, %c-2_i2, %input_byte : i1, i2, i8
      %9 = comb.xor %6, %true : i1
      %10 = comb.and %arg5, %arg3, %9 : i1
      %11 = comb.xor %10, %true : i1
      %12 = comb.or %6, %10, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %9, %11, %arg16 : i1
      %15 = comb.and %9, %11, %arg16, %rw_bit_q : i1
      %16 = comb.and %6, %arg17, %rw_bit_q : i1
      %17 = comb.icmp ult %0, %c3_i7 : i7
      %18 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
      %19 = comb.and %arg14, %18 : i1
      %false_3 = hw.constant false
      %true_4 = hw.constant true
      verif.assert %true_4 : i1
      %c-3_i3 = hw.constant -3 : i3
      %20 = comb.concat %c-3_i3, %input_byte : i3, i8
      %21 = comb.xor %19, %true : i1
      %false_5 = hw.constant false
      %22 = comb.mux %19, %20, %c0_i11 : i11
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %23 = comb.and %19, %4 : i1
      %24 = comb.mux %21, %nack_transaction_q, %19 : i1
      %25 = comb.mux %6, %xact_for_us_q, %23 : i1
      %26 = comb.mux %6, %8, %22 : i11
      %27 = comb.or %14, %24 : i1
      %28 = ltl.boolean_constant true
      verif.assert %28 : !ltl.property
      %29 = comb.and %2, %27 : i1
      fsm.output %false_5, %true_0, %false, %false_1, %25, %26, %17, %false_6, %auto_ack_cnt_q, %false_7, %input_byte, %29, %13, %false_3, %1, %15, %16, %false_2 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_25 guard {
        %true = hw.constant true
        %0 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %1 = comb.and %arg14, %0 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %1, %2 : i1
        %false = hw.constant false
        %4 = ltl.past %3, 1 : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and bin %3, %5 : i1
        %7 = ltl.delay %3, 1, 0 : i1
        %8 = ltl.implication %6, %7 : i1, !ltl.sequence
        verif.assert %8 : !ltl.property
        fsm.return %false
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.and %39, %41, %arg16 : i1
        %44 = comb.icmp ult %35, %c3_i7 : i7
        %45 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %46 = comb.and %arg14, %45 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %47 = comb.xor %46, %true : i1
        %48 = comb.and %47, %36 : i1
        %49 = comb.or %48, %44 : i1
        %50 = comb.xor %46, %true : i1
        %51 = comb.xor %46, %true : i1
        %52 = comb.and %46, %49 : i1
        %53 = comb.and %46, %51 : i1
        %54 = comb.mux %50, %44, %52 : i1
        %55 = comb.and %46, %51 : i1
        %56 = comb.mux %50, %nack_transaction_q, %46 : i1
        %57 = comb.xor %55, %true : i1
        %58 = comb.mux %42, %restart_det_q, %57 : i1
        %59 = comb.or %43, %56 : i1
        %60 = comb.and %46, %36 : i1
        %61 = comb.or %60, %44 : i1
        %62 = comb.xor %61, %true : i1
        %63 = comb.and %50, %62 : i1
        %64 = comb.or %46, %61 : i1
        %65 = ltl.past %53, 1 : i1
        %66 = comb.xor %65, %true : i1
        %67 = comb.and bin %53, %66 : i1
        %68 = ltl.delay %53, 1, 0 : i1
        %69 = ltl.implication %67, %68 : i1, !ltl.sequence
        verif.assert %69 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %58 : i1
        fsm.update %nack_transaction_q, %59 : i1
        %true_2 = hw.constant true
        %70 = comb.xor %64, %true_2 : i1
        %71 = comb.xor %63, %true : i1
        %72 = comb.or %63, %arg5 : i1
        %73 = comb.mux %72, %c1_i16, %tcount_q : i16
        %74 = comb.and %70, %63 : i1
        %75 = comb.mux %74, %2, %73 : i16
        %76 = comb.and %arg5, %71 : i1
        %77 = comb.mux %76, %3, %75 : i16
        %78 = comb.and %arg3, %55 : i1
        %79 = comb.mux %78, %c0_i31, %stretch_active_cnt : i31
        %80 = comb.mux %54, %4, %79 : i31
        %81 = comb.or %54, %78 : i1
        %82 = comb.mux bin %81, %80, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %82 : i31
        fsm.update %tcount_q, %77 : i16
      }
      fsm.transition @state_20 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.sub %c-64_i7, %arg8 : i7
        %4 = comb.xor %2, %true : i1
        %5 = comb.or %arg4, %arg17 : i1
        %6 = comb.icmp ult %3, %c3_i7 : i7
        %7 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %8 = comb.and %arg14, %7 : i1
        %9 = comb.and %arg5, %arg3 : i1
        %10 = comb.xor %9, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %11 = comb.xor %8, %true : i1
        %12 = comb.and %8, %4 : i1
        %13 = comb.or %12, %6 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %10, %arg5, %5 : i1
        %true_1 = hw.constant true
        %16 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %15, %true_2 : i1
        %true_3 = hw.constant true
        %18 = comb.xor %9, %true_3 : i1
        %19 = comb.and %arg5, %18, %17, %16, %11, %14 : i1
        %20 = ltl.boolean_constant true
        verif.assert %20 : !ltl.property
        fsm.return %19
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.and %39, %41, %arg16 : i1
        %44 = comb.icmp ult %35, %c3_i7 : i7
        %45 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %46 = comb.and %arg14, %45 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %47 = comb.xor %46, %true : i1
        %48 = comb.and %47, %36 : i1
        %49 = comb.or %48, %44 : i1
        %50 = comb.xor %46, %true : i1
        %51 = comb.and %46, %49 : i1
        %52 = comb.mux %50, %44, %51 : i1
        %53 = comb.mux %50, %nack_transaction_q, %46 : i1
        %true_2 = hw.constant true
        %54 = comb.xor %42, %true_2 : i1
        %55 = comb.or %54, %restart_det_q : i1
        %56 = comb.or %43, %53 : i1
        %57 = comb.and %46, %36 : i1
        %58 = comb.or %57, %44 : i1
        %59 = comb.xor %58, %true : i1
        %60 = comb.and %50, %59 : i1
        %61 = comb.or %46, %58 : i1
        %62 = ltl.boolean_constant true
        verif.assert %62 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %55 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %63 = comb.xor %61, %true_3 : i1
        %64 = comb.xor %60, %true : i1
        %65 = comb.or %60, %arg5 : i1
        %66 = comb.mux %65, %c1_i16, %tcount_q : i16
        %67 = comb.and %63, %60 : i1
        %68 = comb.mux %67, %2, %66 : i16
        %69 = comb.and %arg5, %64 : i1
        %70 = comb.mux %69, %3, %68 : i16
        %71 = comb.mux bin %52, %4, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %71 : i31
        fsm.update %tcount_q, %70 : i16
      }
      fsm.transition @state_19 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.sub %c-64_i7, %arg8 : i7
        %4 = comb.xor %2, %true : i1
        %5 = comb.or %arg4, %arg17 : i1
        %6 = comb.icmp ult %3, %c3_i7 : i7
        %7 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %8 = comb.and %arg14, %7 : i1
        %9 = comb.and %arg5, %arg3 : i1
        %10 = comb.xor %9, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %11 = comb.xor %8, %true : i1
        %12 = comb.and %8, %4 : i1
        %13 = comb.or %12, %6 : i1
        %14 = comb.and %10, %arg5, %5 : i1
        %true_1 = hw.constant true
        %15 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %16 = comb.xor %14, %true_2 : i1
        %true_3 = hw.constant true
        %17 = comb.xor %9, %true_3 : i1
        %18 = comb.and %arg5, %17, %16, %15, %11, %13 : i1
        %19 = ltl.boolean_constant true
        verif.assert %19 : !ltl.property
        fsm.return %18
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.and %39, %41, %arg16 : i1
        %44 = comb.icmp ult %35, %c3_i7 : i7
        %45 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %46 = comb.and %arg14, %45 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %47 = comb.xor %46, %true : i1
        %48 = comb.and %47, %36 : i1
        %49 = comb.or %48, %44 : i1
        %50 = comb.xor %46, %true : i1
        %51 = comb.and %46, %49 : i1
        %52 = comb.mux %50, %44, %51 : i1
        %53 = comb.mux %50, %nack_transaction_q, %46 : i1
        %true_2 = hw.constant true
        %54 = comb.xor %42, %true_2 : i1
        %55 = comb.or %54, %restart_det_q : i1
        %56 = comb.or %43, %53 : i1
        %57 = comb.and %46, %36 : i1
        %58 = comb.or %57, %44 : i1
        %59 = comb.xor %58, %true : i1
        %60 = comb.and %50, %59 : i1
        %61 = comb.or %46, %58 : i1
        %62 = ltl.boolean_constant true
        verif.assert %62 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %55 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %63 = comb.xor %61, %true_3 : i1
        %64 = comb.xor %60, %true : i1
        %65 = comb.or %60, %arg5 : i1
        %66 = comb.mux %65, %c1_i16, %tcount_q : i16
        %67 = comb.and %63, %60 : i1
        %68 = comb.mux %67, %2, %66 : i16
        %69 = comb.and %arg5, %64 : i1
        %70 = comb.mux %69, %3, %68 : i16
        %71 = comb.mux bin %52, %4, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %71 : i31
        fsm.update %tcount_q, %70 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %5 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %6 = comb.and %4, %arg5, %0 : i1
        %7 = comb.extract %5 from 2 : (i4) -> i2
        %8 = comb.extract %5 from 0 : (i4) -> i1
        %9 = comb.concat %7, %8 : i2, i1
        %c-1_i3 = hw.constant -1 : i3
        %10 = comb.icmp eq %9, %c-1_i3 : i3
        %11 = comb.and %2, %10 : i1
        %12 = comb.or %arg16, %11 : i1
        %true_1 = hw.constant true
        %13 = comb.xor %6, %true_1 : i1
        %true_2 = hw.constant true
        %14 = comb.xor %3, %true_2 : i1
        %15 = comb.and %arg5, %14, %13, %12 : i1
        %16 = ltl.boolean_constant true
        verif.assert %16 : !ltl.property
        fsm.return %15
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.and %39, %41, %arg16 : i1
        %44 = comb.icmp ult %35, %c3_i7 : i7
        %45 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %46 = comb.and %arg14, %45 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %47 = comb.xor %46, %true : i1
        %48 = comb.and %47, %36 : i1
        %49 = comb.or %48, %44 : i1
        %50 = comb.xor %46, %true : i1
        %51 = comb.and %46, %49 : i1
        %52 = comb.mux %50, %44, %51 : i1
        %53 = comb.mux %50, %nack_transaction_q, %46 : i1
        %true_2 = hw.constant true
        %54 = comb.xor %42, %true_2 : i1
        %55 = comb.or %54, %restart_det_q : i1
        %56 = comb.or %43, %53 : i1
        %57 = comb.and %46, %36 : i1
        %58 = comb.or %57, %44 : i1
        %59 = comb.xor %58, %true : i1
        %60 = comb.and %50, %59 : i1
        %61 = comb.or %46, %58 : i1
        %62 = ltl.boolean_constant true
        verif.assert %62 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %55 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %63 = comb.xor %61, %true_3 : i1
        %64 = comb.xor %60, %true : i1
        %65 = comb.or %60, %arg5 : i1
        %66 = comb.mux %65, %c1_i16, %tcount_q : i16
        %67 = comb.and %63, %60 : i1
        %68 = comb.mux %67, %2, %66 : i16
        %69 = comb.and %arg5, %64 : i1
        %70 = comb.mux %69, %3, %68 : i16
        %71 = comb.mux bin %52, %4, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %71 : i31
        fsm.update %tcount_q, %70 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %5 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %6 = comb.and %4, %arg5, %0 : i1
        %7 = comb.extract %5 from 2 : (i4) -> i2
        %8 = comb.extract %5 from 0 : (i4) -> i1
        %9 = comb.concat %7, %8 : i2, i1
        %c1_i3 = hw.constant 1 : i3
        %10 = comb.icmp eq %9, %c1_i3 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %12 = comb.xor %6, %true_2 : i1
        %13 = comb.and %12, %11, %2, %10 : i1
        %14 = comb.or %3, %13 : i1
        %15 = comb.and %arg5, %14 : i1
        %16 = ltl.boolean_constant true
        verif.assert %16 : !ltl.property
        fsm.return %15
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.and %39, %41, %arg16 : i1
        %44 = comb.icmp ult %35, %c3_i7 : i7
        %45 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %46 = comb.and %arg14, %45 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %47 = comb.xor %46, %true : i1
        %48 = comb.and %47, %36 : i1
        %49 = comb.or %48, %44 : i1
        %50 = comb.xor %46, %true : i1
        %51 = comb.and %46, %49 : i1
        %52 = comb.mux %50, %44, %51 : i1
        %53 = comb.mux %50, %nack_transaction_q, %46 : i1
        %true_2 = hw.constant true
        %54 = comb.xor %42, %true_2 : i1
        %55 = comb.or %54, %restart_det_q : i1
        %56 = comb.or %43, %53 : i1
        %57 = comb.and %46, %36 : i1
        %58 = comb.or %57, %44 : i1
        %59 = comb.xor %58, %true : i1
        %60 = comb.and %50, %59 : i1
        %61 = comb.or %46, %58 : i1
        %62 = ltl.boolean_constant true
        verif.assert %62 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %55 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %63 = comb.xor %61, %true_3 : i1
        %64 = comb.xor %60, %true : i1
        %65 = comb.or %60, %arg5 : i1
        %66 = comb.mux %65, %c1_i16, %tcount_q : i16
        %67 = comb.and %63, %60 : i1
        %68 = comb.mux %67, %2, %66 : i16
        %69 = comb.and %arg5, %64 : i1
        %70 = comb.mux %69, %3, %68 : i16
        %71 = comb.mux bin %52, %4, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %71 : i31
        fsm.update %tcount_q, %70 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.xor %arg5, %true : i1
        %4 = comb.and %arg5, %arg3 : i1
        %5 = comb.xor %4, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %6 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %7 = comb.and %5, %arg5, %0 : i1
        %8 = comb.extract %6 from 2 : (i4) -> i2
        %9 = comb.extract %6 from 0 : (i4) -> i1
        %10 = comb.concat %8, %9 : i2, i1
        %c0_i3 = hw.constant 0 : i3
        %11 = comb.icmp eq %10, %c0_i3 : i3
        %true_1 = hw.constant true
        %12 = comb.xor %arg16, %true_1 : i1
        %13 = comb.and %12, %2, %11 : i1
        %14 = comb.or %7, %13 : i1
        %true_2 = hw.constant true
        %15 = comb.xor %4, %true_2 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.or %3, %16 : i1
        %18 = ltl.boolean_constant true
        verif.assert %18 : !ltl.property
        fsm.return %17
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.and %39, %41, %arg16 : i1
        %44 = comb.icmp ult %35, %c3_i7 : i7
        %45 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %46 = comb.and %arg14, %45 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %47 = comb.xor %46, %true : i1
        %48 = comb.and %47, %36 : i1
        %49 = comb.or %48, %44 : i1
        %50 = comb.xor %46, %true : i1
        %51 = comb.and %46, %49 : i1
        %52 = comb.mux %50, %44, %51 : i1
        %53 = comb.mux %50, %nack_transaction_q, %46 : i1
        %true_2 = hw.constant true
        %54 = comb.xor %42, %true_2 : i1
        %55 = comb.or %54, %restart_det_q : i1
        %56 = comb.or %43, %53 : i1
        %57 = comb.and %46, %36 : i1
        %58 = comb.or %57, %44 : i1
        %59 = comb.xor %58, %true : i1
        %60 = comb.and %50, %59 : i1
        %61 = comb.or %46, %58 : i1
        %62 = ltl.boolean_constant true
        verif.assert %62 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %55 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %63 = comb.xor %61, %true_3 : i1
        %64 = comb.xor %60, %true : i1
        %65 = comb.or %60, %arg5 : i1
        %66 = comb.mux %65, %c1_i16, %tcount_q : i16
        %67 = comb.and %63, %60 : i1
        %68 = comb.mux %67, %2, %66 : i16
        %69 = comb.and %arg5, %64 : i1
        %70 = comb.mux %69, %3, %68 : i16
        %71 = comb.mux bin %52, %4, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %71 : i31
        fsm.update %tcount_q, %70 : i16
      }
    }
    fsm.state @state_21 output {
      %true = hw.constant true
      %c0_i6 = hw.constant 0 : i6
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %false = hw.constant false
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %3 = comb.concat %false, %restart_det_q, %true, %input_byte : i1, i1, i1, i8
      %4 = comb.extract %0 from 1 : (i7) -> i6
      %5 = comb.icmp ne %4, %c0_i6 : i6
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %6 = comb.or %arg4, %arg17 : i1
      %7 = comb.and %arg5, %6 : i1
      %8 = comb.or %nack_transaction_q, %arg17 : i1
      %9 = comb.concat %8, %c-2_i2, %input_byte : i1, i2, i8
      %10 = comb.xor %7, %true : i1
      %11 = comb.and %arg5, %arg3, %10 : i1
      %12 = comb.xor %11, %true : i1
      %13 = comb.or %7, %11, %arg16 : i1
      %14 = comb.and %13, %xfer_for_us_q : i1
      %15 = comb.and %10, %12, %arg16 : i1
      %16 = comb.and %10, %12, %arg16, %rw_bit_q : i1
      %17 = comb.and %7, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %19 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
      %20 = comb.and %arg14, %19 : i1
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      verif.assert %true_5 : i1
      %21 = comb.xor %18, %true : i1
      %22 = comb.concat %c-2_i2, %20, %input_byte : i2, i1, i8
      %23 = comb.xor %20, %true : i1
      %24 = comb.and %23, %18 : i1
      %25 = comb.xor %24, %true : i1
      %26 = comb.and %24, %nack_transaction_q : i1
      %27 = comb.xor %20, %true : i1
      %28 = comb.or %20, %26 : i1
      %29 = comb.mux %27, %c0_i11, %22 : i11
      %30 = comb.and %20, %5 : i1
      %31 = comb.and %21, %23 : i1
      %32 = comb.xor %31, %true : i1
      %true_6 = hw.constant true
      %33 = comb.xor %31, %true_6 : i1
      %34 = comb.and %33, %27, %25 : i1
      %35 = comb.or %31, %30 : i1
      %36 = comb.mux %31, %3, %29 : i11
      %37 = comb.and %32, %27, %25 : i1
      %false_7 = hw.constant false
      %38 = comb.mux %31, %nack_transaction_q, %28 : i1
      %39 = comb.mux %7, %xact_for_us_q, %35 : i1
      %40 = comb.mux %7, %9, %36 : i11
      %41 = comb.or %15, %38 : i1
      %42 = ltl.past %34, 1 : i1
      %43 = comb.xor %42, %true : i1
      %44 = comb.and bin %34, %43 : i1
      %45 = ltl.delay %34, 1, 0 : i1
      %46 = ltl.implication %44, %45 : i1, !ltl.sequence
      verif.assert %46 : !ltl.property
      %47 = comb.and %2, %41 : i1
      fsm.output %34, %true_0, %false_1, %false_2, %39, %40, %18, %37, %auto_ack_cnt_q, %false_7, %input_byte, %47, %14, %false_4, %1, %16, %17, %false_3 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_22 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.icmp ult %0, %c3_i7 : i7
        %3 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %4 = comb.and %arg14, %3 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.xor %2, %true : i1
        %9 = comb.xor %4, %true : i1
        %10 = comb.and %9, %2 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %8, %9 : i1
        %14 = comb.xor %13, %true : i1
        %true_1 = hw.constant true
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %15, %12, %11 : i1
        %17 = comb.and %14, %12, %11 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.and %18, %5 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %7, %20, %1 : i1
        %22 = comb.and %20, %6 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %10, %true_2 : i1
        %true_3 = hw.constant true
        %24 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %21, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %22, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %19, %true_6 : i1
        %28 = comb.and %27, %26, %25, %24, %23, %13, %rw_bit_q : i1
        %29 = ltl.past %16, 1 : i1
        %30 = comb.xor %29, %true : i1
        %31 = comb.and bin %16, %30 : i1
        %32 = ltl.delay %16, 1, 0 : i1
        %33 = ltl.implication %31, %32 : i1, !ltl.sequence
        verif.assert %33 : !ltl.property
        fsm.return %28
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.xor %arg19, %true : i1
        %4 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %5 = comb.or %3, %4 : i1
        %6 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %7 = comb.xor %arg1, %true : i1
        %8 = comb.and %scl_i_q, %7 : i1
        %9 = comb.add %bit_idx, %c1_i4 : i4
        %10 = comb.xor %arg3, %true : i1
        %11 = comb.or %arg3, %8 : i1
        %12 = comb.mux %11, %c0_i4, %bit_idx : i4
        %13 = comb.xor %6, %true : i1
        %14 = comb.and %13, %8, %10 : i1
        %15 = comb.mux %14, %9, %12 : i4
        %16 = comb.xor %scl_i_q, %true : i1
        %17 = comb.and %16, %arg1 : i1
        %18 = comb.xor %6, %true : i1
        %19 = comb.extract %input_byte from 0 : (i8) -> i7
        %20 = comb.concat %19, %arg2 : i7, i1
        %21 = comb.and %18, %17 : i1
        %22 = comb.mux %21, %20, %c0_i8 : i8
        %23 = comb.and %17, %6 : i1
        %24 = comb.xor %17, %true : i1
        %25 = comb.or %24, %23 : i1
        %26 = comb.mux bin %25, %input_byte, %22 : i8
        %27 = comb.xor %arg2, %true : i1
        %28 = comb.and %17, %18 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %17, %29, %27 : i1
        %31 = comb.and %17, %29 : i1
        %32 = comb.mux bin %31, %30, %host_ack : i1
        %33 = comb.sub %c-64_i7, %arg8 : i7
        %34 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        %35 = comb.or %arg4, %arg17 : i1
        %36 = comb.and %arg5, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %arg5, %arg3, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.or %36, %39 : i1
        %41 = comb.and %37, %39, %arg16 : i1
        %42 = comb.icmp ult %33, %c3_i7 : i7
        %43 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %44 = comb.and %arg14, %43 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %45 = comb.xor %42, %true : i1
        %46 = comb.xor %44, %true : i1
        %47 = comb.xor %44, %true : i1
        %48 = comb.and %47, %34 : i1
        %49 = comb.or %48, %42 : i1
        %50 = comb.xor %44, %true : i1
        %51 = comb.and %50, %42 : i1
        %52 = comb.xor %51, %true : i1
        %53 = comb.and %51, %nack_transaction_q : i1
        %54 = comb.xor %44, %true : i1
        %55 = comb.mux %44, %49, %51 : i1
        %56 = comb.or %44, %53 : i1
        %57 = comb.and %45, %50 : i1
        %58 = comb.xor %57, %true : i1
        %true_2 = hw.constant true
        %59 = comb.xor %57, %true_2 : i1
        %60 = comb.and %59, %54, %52 : i1
        %61 = comb.mux %57, %42, %55 : i1
        %62 = comb.and %58, %54, %52 : i1
        %63 = comb.or %57, %44, %51 : i1
        %64 = comb.and %63, %xact_for_us_q : i1
        %65 = comb.or %57, %44, %51 : i1
        %66 = comb.mux %65, %auto_ack_cnt_q, %c0_i9 : i9
        %67 = comb.or %57, %44, %51 : i1
        %68 = comb.and %67, %restart_det_q : i1
        %69 = comb.mux %57, %nack_transaction_q, %56 : i1
        %70 = comb.xor %62, %true : i1
        %71 = comb.mux %40, %68, %70 : i1
        %72 = comb.or %41, %69 : i1
        %73 = ltl.past %60, 1 : i1
        %74 = comb.xor %73, %true : i1
        %75 = comb.and bin %60, %74 : i1
        %76 = ltl.delay %60, 1, 0 : i1
        %77 = ltl.implication %75, %76 : i1, !ltl.sequence
        verif.assert %77 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %64 : i1
        fsm.update %restart_det_q, %71 : i1
        fsm.update %nack_transaction_q, %72 : i1
        %78 = comb.and %arg3, %62 : i1
        %79 = comb.mux %78, %c0_i31, %stretch_active_cnt : i31
        %80 = comb.mux %61, %2, %79 : i31
        %81 = comb.or %61, %78 : i1
        %82 = comb.mux bin %81, %80, %stretch_active_cnt : i31
        %83 = comb.and %arg20, %58, %44, %46, %34 : i1
        %84 = comb.mux %83, %arg21, %66 : i9
        fsm.update %auto_ack_cnt_q, %84 : i9
        fsm.update %stretch_active_cnt, %82 : i31
      }
      fsm.transition @state_21 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.icmp ult %0, %c3_i7 : i7
        %3 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %4 = comb.and %arg14, %3 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.xor %2, %true : i1
        %9 = comb.xor %4, %true : i1
        %10 = comb.and %9, %2 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %8, %9 : i1
        %14 = comb.xor %13, %true : i1
        %true_1 = hw.constant true
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %15, %12, %11 : i1
        %17 = comb.and %14, %12, %11 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.and %18, %5 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %7, %20, %1 : i1
        %22 = comb.and %20, %6 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %24 = comb.xor %21, %true_3 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %22, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %19, %true_5 : i1
        %27 = comb.and %26, %25, %24, %23, %10 : i1
        %28 = ltl.past %16, 1 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and bin %16, %29 : i1
        %31 = ltl.delay %16, 1, 0 : i1
        %32 = ltl.implication %30, %31 : i1, !ltl.sequence
        verif.assert %32 : !ltl.property
        fsm.return %27
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.xor %arg19, %true : i1
        %4 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %5 = comb.or %3, %4 : i1
        %6 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %7 = comb.xor %arg1, %true : i1
        %8 = comb.and %scl_i_q, %7 : i1
        %9 = comb.add %bit_idx, %c1_i4 : i4
        %10 = comb.xor %arg3, %true : i1
        %11 = comb.or %arg3, %8 : i1
        %12 = comb.mux %11, %c0_i4, %bit_idx : i4
        %13 = comb.xor %6, %true : i1
        %14 = comb.and %13, %8, %10 : i1
        %15 = comb.mux %14, %9, %12 : i4
        %16 = comb.xor %scl_i_q, %true : i1
        %17 = comb.and %16, %arg1 : i1
        %18 = comb.xor %6, %true : i1
        %19 = comb.extract %input_byte from 0 : (i8) -> i7
        %20 = comb.concat %19, %arg2 : i7, i1
        %21 = comb.and %18, %17 : i1
        %22 = comb.mux %21, %20, %c0_i8 : i8
        %23 = comb.and %17, %6 : i1
        %24 = comb.xor %17, %true : i1
        %25 = comb.or %24, %23 : i1
        %26 = comb.mux bin %25, %input_byte, %22 : i8
        %27 = comb.xor %arg2, %true : i1
        %28 = comb.and %17, %18 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %17, %29, %27 : i1
        %31 = comb.and %17, %29 : i1
        %32 = comb.mux bin %31, %30, %host_ack : i1
        %33 = comb.sub %c-64_i7, %arg8 : i7
        %34 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        %35 = comb.or %arg4, %arg17 : i1
        %36 = comb.and %arg5, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %arg5, %arg3, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.or %36, %39 : i1
        %41 = comb.and %37, %39, %arg16 : i1
        %42 = comb.icmp ult %33, %c3_i7 : i7
        %43 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %44 = comb.and %arg14, %43 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %45 = comb.xor %42, %true : i1
        %46 = comb.xor %44, %true : i1
        %47 = comb.and %46, %34 : i1
        %48 = comb.or %47, %42 : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %42 : i1
        %51 = comb.xor %50, %true : i1
        %52 = comb.and %50, %nack_transaction_q : i1
        %53 = comb.xor %44, %true : i1
        %54 = comb.mux %44, %48, %50 : i1
        %55 = comb.or %44, %52 : i1
        %56 = comb.and %45, %49 : i1
        %57 = comb.xor %56, %true : i1
        %true_2 = hw.constant true
        %58 = comb.xor %56, %true_2 : i1
        %59 = comb.and %58, %53, %51 : i1
        %60 = comb.mux %56, %42, %54 : i1
        %61 = comb.and %57, %53, %51 : i1
        %62 = comb.or %56, %44, %50 : i1
        %63 = comb.and %62, %xact_for_us_q : i1
        %64 = comb.or %56, %44, %50 : i1
        %65 = comb.mux %64, %auto_ack_cnt_q, %c0_i9 : i9
        %66 = comb.or %56, %44, %50 : i1
        %67 = comb.and %66, %restart_det_q : i1
        %68 = comb.mux %56, %nack_transaction_q, %55 : i1
        %69 = comb.xor %61, %true : i1
        %70 = comb.mux %40, %67, %69 : i1
        %71 = comb.or %41, %68 : i1
        %72 = ltl.past %59, 1 : i1
        %73 = comb.xor %72, %true : i1
        %74 = comb.and bin %59, %73 : i1
        %75 = ltl.delay %59, 1, 0 : i1
        %76 = ltl.implication %74, %75 : i1, !ltl.sequence
        verif.assert %76 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %63 : i1
        fsm.update %restart_det_q, %70 : i1
        fsm.update %nack_transaction_q, %71 : i1
        %77 = comb.and %arg3, %61 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %60, %2, %78 : i31
        %80 = comb.or %60, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %65 : i9
        fsm.update %stretch_active_cnt, %81 : i31
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.icmp ult %0, %c3_i7 : i7
        %3 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %4 = comb.and %arg14, %3 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.xor %2, %true : i1
        %9 = comb.xor %4, %true : i1
        %10 = comb.and %9, %2 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %8, %9 : i1
        %14 = comb.xor %13, %true : i1
        %true_1 = hw.constant true
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %15, %12, %11 : i1
        %17 = comb.and %14, %12, %11 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.and %18, %5 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %7, %20, %1 : i1
        %22 = comb.and %20, %6 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %rw_bit_q, %true_2 : i1
        %true_3 = hw.constant true
        %24 = comb.xor %10, %true_3 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %21, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %22, %true_6 : i1
        %true_7 = hw.constant true
        %28 = comb.xor %19, %true_7 : i1
        %29 = comb.and %28, %27, %26, %25, %24, %13, %23 : i1
        %30 = ltl.past %16, 1 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and bin %16, %31 : i1
        %33 = ltl.delay %16, 1, 0 : i1
        %34 = ltl.implication %32, %33 : i1, !ltl.sequence
        verif.assert %34 : !ltl.property
        fsm.return %29
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.xor %arg19, %true : i1
        %4 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %5 = comb.or %3, %4 : i1
        %6 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %7 = comb.xor %arg1, %true : i1
        %8 = comb.and %scl_i_q, %7 : i1
        %9 = comb.add %bit_idx, %c1_i4 : i4
        %10 = comb.xor %arg3, %true : i1
        %11 = comb.or %arg3, %8 : i1
        %12 = comb.mux %11, %c0_i4, %bit_idx : i4
        %13 = comb.xor %6, %true : i1
        %14 = comb.and %13, %8, %10 : i1
        %15 = comb.mux %14, %9, %12 : i4
        %16 = comb.xor %scl_i_q, %true : i1
        %17 = comb.and %16, %arg1 : i1
        %18 = comb.xor %6, %true : i1
        %19 = comb.extract %input_byte from 0 : (i8) -> i7
        %20 = comb.concat %19, %arg2 : i7, i1
        %21 = comb.and %18, %17 : i1
        %22 = comb.mux %21, %20, %c0_i8 : i8
        %23 = comb.and %17, %6 : i1
        %24 = comb.xor %17, %true : i1
        %25 = comb.or %24, %23 : i1
        %26 = comb.mux bin %25, %input_byte, %22 : i8
        %27 = comb.xor %arg2, %true : i1
        %28 = comb.and %17, %18 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %17, %29, %27 : i1
        %31 = comb.and %17, %29 : i1
        %32 = comb.mux bin %31, %30, %host_ack : i1
        %33 = comb.sub %c-64_i7, %arg8 : i7
        %34 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        %35 = comb.or %arg4, %arg17 : i1
        %36 = comb.and %arg5, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %arg5, %arg3, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.or %36, %39 : i1
        %41 = comb.and %37, %39, %arg16 : i1
        %42 = comb.icmp ult %33, %c3_i7 : i7
        %43 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %44 = comb.and %arg14, %43 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %45 = comb.xor %42, %true : i1
        %46 = comb.xor %44, %true : i1
        %47 = comb.and %46, %34 : i1
        %48 = comb.or %47, %42 : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %42 : i1
        %51 = comb.xor %50, %true : i1
        %52 = comb.and %50, %nack_transaction_q : i1
        %53 = comb.xor %44, %true : i1
        %54 = comb.mux %44, %48, %50 : i1
        %55 = comb.or %44, %52 : i1
        %56 = comb.and %45, %49 : i1
        %57 = comb.xor %56, %true : i1
        %true_2 = hw.constant true
        %58 = comb.xor %56, %true_2 : i1
        %59 = comb.and %58, %53, %51 : i1
        %60 = comb.mux %56, %42, %54 : i1
        %61 = comb.and %57, %53, %51 : i1
        %62 = comb.or %56, %44, %50 : i1
        %63 = comb.and %62, %xact_for_us_q : i1
        %64 = comb.or %56, %44, %50 : i1
        %65 = comb.mux %64, %auto_ack_cnt_q, %c0_i9 : i9
        %66 = comb.or %56, %44, %50 : i1
        %67 = comb.and %66, %restart_det_q : i1
        %68 = comb.mux %56, %nack_transaction_q, %55 : i1
        %69 = comb.xor %61, %true : i1
        %70 = comb.mux %40, %67, %69 : i1
        %71 = comb.or %41, %68 : i1
        %72 = ltl.past %59, 1 : i1
        %73 = comb.xor %72, %true : i1
        %74 = comb.and bin %59, %73 : i1
        %75 = ltl.delay %59, 1, 0 : i1
        %76 = ltl.implication %74, %75 : i1, !ltl.sequence
        verif.assert %76 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %63 : i1
        fsm.update %restart_det_q, %70 : i1
        fsm.update %nack_transaction_q, %71 : i1
        %77 = comb.and %arg3, %61 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %60, %2, %78 : i31
        %80 = comb.or %60, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %65 : i9
        fsm.update %stretch_active_cnt, %81 : i31
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.icmp ult %0, %c3_i7 : i7
        %3 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %4 = comb.and %arg14, %3 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.xor %2, %true : i1
        %9 = comb.xor %4, %true : i1
        %10 = comb.and %9, %2 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %8, %9 : i1
        %14 = comb.xor %13, %true : i1
        %true_1 = hw.constant true
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %15, %12, %11 : i1
        %17 = comb.and %14, %12, %11 : i1
        %18 = comb.xor %17, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %19 = comb.mux %4, %c-3_i4, %c0_i4 : i4
        %20 = comb.and %18, %5 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %7, %21, %1 : i1
        %23 = comb.and %21, %6 : i1
        %24 = comb.extract %19 from 2 : (i4) -> i2
        %25 = comb.extract %19 from 0 : (i4) -> i1
        %26 = comb.concat %24, %25 : i2, i1
        %c-1_i3 = hw.constant -1 : i3
        %27 = comb.icmp eq %26, %c-1_i3 : i3
        %true_2 = hw.constant true
        %28 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %29 = comb.xor %10, %true_3 : i1
        %30 = comb.and %29, %28, %27 : i1
        %31 = comb.or %arg16, %30 : i1
        %true_4 = hw.constant true
        %32 = comb.xor %22, %true_4 : i1
        %true_5 = hw.constant true
        %33 = comb.xor %23, %true_5 : i1
        %true_6 = hw.constant true
        %34 = comb.xor %20, %true_6 : i1
        %35 = comb.and %34, %33, %32, %31 : i1
        %36 = ltl.past %16, 1 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and bin %16, %37 : i1
        %39 = ltl.delay %16, 1, 0 : i1
        %40 = ltl.implication %38, %39 : i1, !ltl.sequence
        verif.assert %40 : !ltl.property
        fsm.return %35
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.xor %arg19, %true : i1
        %4 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %5 = comb.or %3, %4 : i1
        %6 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %7 = comb.xor %arg1, %true : i1
        %8 = comb.and %scl_i_q, %7 : i1
        %9 = comb.add %bit_idx, %c1_i4 : i4
        %10 = comb.xor %arg3, %true : i1
        %11 = comb.or %arg3, %8 : i1
        %12 = comb.mux %11, %c0_i4, %bit_idx : i4
        %13 = comb.xor %6, %true : i1
        %14 = comb.and %13, %8, %10 : i1
        %15 = comb.mux %14, %9, %12 : i4
        %16 = comb.xor %scl_i_q, %true : i1
        %17 = comb.and %16, %arg1 : i1
        %18 = comb.xor %6, %true : i1
        %19 = comb.extract %input_byte from 0 : (i8) -> i7
        %20 = comb.concat %19, %arg2 : i7, i1
        %21 = comb.and %18, %17 : i1
        %22 = comb.mux %21, %20, %c0_i8 : i8
        %23 = comb.and %17, %6 : i1
        %24 = comb.xor %17, %true : i1
        %25 = comb.or %24, %23 : i1
        %26 = comb.mux bin %25, %input_byte, %22 : i8
        %27 = comb.xor %arg2, %true : i1
        %28 = comb.and %17, %18 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %17, %29, %27 : i1
        %31 = comb.and %17, %29 : i1
        %32 = comb.mux bin %31, %30, %host_ack : i1
        %33 = comb.sub %c-64_i7, %arg8 : i7
        %34 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        %35 = comb.or %arg4, %arg17 : i1
        %36 = comb.and %arg5, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %arg5, %arg3, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.or %36, %39 : i1
        %41 = comb.and %37, %39, %arg16 : i1
        %42 = comb.icmp ult %33, %c3_i7 : i7
        %43 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %44 = comb.and %arg14, %43 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %45 = comb.xor %42, %true : i1
        %46 = comb.xor %44, %true : i1
        %47 = comb.and %46, %34 : i1
        %48 = comb.or %47, %42 : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %42 : i1
        %51 = comb.xor %50, %true : i1
        %52 = comb.and %50, %nack_transaction_q : i1
        %53 = comb.xor %44, %true : i1
        %54 = comb.mux %44, %48, %50 : i1
        %55 = comb.or %44, %52 : i1
        %56 = comb.and %45, %49 : i1
        %57 = comb.xor %56, %true : i1
        %true_2 = hw.constant true
        %58 = comb.xor %56, %true_2 : i1
        %59 = comb.and %58, %53, %51 : i1
        %60 = comb.mux %56, %42, %54 : i1
        %61 = comb.and %57, %53, %51 : i1
        %62 = comb.or %56, %44, %50 : i1
        %63 = comb.and %62, %xact_for_us_q : i1
        %64 = comb.or %56, %44, %50 : i1
        %65 = comb.mux %64, %auto_ack_cnt_q, %c0_i9 : i9
        %66 = comb.or %56, %44, %50 : i1
        %67 = comb.and %66, %restart_det_q : i1
        %68 = comb.mux %56, %nack_transaction_q, %55 : i1
        %69 = comb.xor %61, %true : i1
        %70 = comb.mux %40, %67, %69 : i1
        %71 = comb.or %41, %68 : i1
        %72 = ltl.past %59, 1 : i1
        %73 = comb.xor %72, %true : i1
        %74 = comb.and bin %59, %73 : i1
        %75 = ltl.delay %59, 1, 0 : i1
        %76 = ltl.implication %74, %75 : i1, !ltl.sequence
        verif.assert %76 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %63 : i1
        fsm.update %restart_det_q, %70 : i1
        fsm.update %nack_transaction_q, %71 : i1
        %77 = comb.and %arg3, %61 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %60, %2, %78 : i31
        %80 = comb.or %60, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %65 : i9
        fsm.update %stretch_active_cnt, %81 : i31
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.icmp ult %0, %c3_i7 : i7
        %3 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %4 = comb.and %arg14, %3 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.xor %2, %true : i1
        %9 = comb.xor %4, %true : i1
        %10 = comb.and %9, %2 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %8, %9 : i1
        %14 = comb.xor %13, %true : i1
        %true_1 = hw.constant true
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %15, %12, %11 : i1
        %17 = comb.and %14, %12, %11 : i1
        %18 = comb.xor %17, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %19 = comb.mux %4, %c-3_i4, %c0_i4 : i4
        %20 = comb.and %18, %5 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %7, %21, %1 : i1
        %23 = comb.and %21, %6 : i1
        %24 = comb.extract %19 from 2 : (i4) -> i2
        %25 = comb.extract %19 from 0 : (i4) -> i1
        %26 = comb.concat %24, %25 : i2, i1
        %c1_i3 = hw.constant 1 : i3
        %27 = comb.icmp eq %26, %c1_i3 : i3
        %true_2 = hw.constant true
        %28 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %29 = comb.xor %10, %true_3 : i1
        %true_4 = hw.constant true
        %30 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %31 = comb.xor %22, %true_5 : i1
        %32 = comb.and %31, %30, %29, %28, %27 : i1
        %33 = comb.or %23, %32 : i1
        %true_6 = hw.constant true
        %34 = comb.xor %20, %true_6 : i1
        %35 = comb.and %34, %33 : i1
        %36 = ltl.past %16, 1 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and bin %16, %37 : i1
        %39 = ltl.delay %16, 1, 0 : i1
        %40 = ltl.implication %38, %39 : i1, !ltl.sequence
        verif.assert %40 : !ltl.property
        fsm.return %35
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.xor %arg19, %true : i1
        %4 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %5 = comb.or %3, %4 : i1
        %6 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %7 = comb.xor %arg1, %true : i1
        %8 = comb.and %scl_i_q, %7 : i1
        %9 = comb.add %bit_idx, %c1_i4 : i4
        %10 = comb.xor %arg3, %true : i1
        %11 = comb.or %arg3, %8 : i1
        %12 = comb.mux %11, %c0_i4, %bit_idx : i4
        %13 = comb.xor %6, %true : i1
        %14 = comb.and %13, %8, %10 : i1
        %15 = comb.mux %14, %9, %12 : i4
        %16 = comb.xor %scl_i_q, %true : i1
        %17 = comb.and %16, %arg1 : i1
        %18 = comb.xor %6, %true : i1
        %19 = comb.extract %input_byte from 0 : (i8) -> i7
        %20 = comb.concat %19, %arg2 : i7, i1
        %21 = comb.and %18, %17 : i1
        %22 = comb.mux %21, %20, %c0_i8 : i8
        %23 = comb.and %17, %6 : i1
        %24 = comb.xor %17, %true : i1
        %25 = comb.or %24, %23 : i1
        %26 = comb.mux bin %25, %input_byte, %22 : i8
        %27 = comb.xor %arg2, %true : i1
        %28 = comb.and %17, %18 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %17, %29, %27 : i1
        %31 = comb.and %17, %29 : i1
        %32 = comb.mux bin %31, %30, %host_ack : i1
        %33 = comb.sub %c-64_i7, %arg8 : i7
        %34 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        %35 = comb.or %arg4, %arg17 : i1
        %36 = comb.and %arg5, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %arg5, %arg3, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.or %36, %39 : i1
        %41 = comb.and %37, %39, %arg16 : i1
        %42 = comb.icmp ult %33, %c3_i7 : i7
        %43 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %44 = comb.and %arg14, %43 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %45 = comb.xor %42, %true : i1
        %46 = comb.xor %44, %true : i1
        %47 = comb.and %46, %34 : i1
        %48 = comb.or %47, %42 : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %42 : i1
        %51 = comb.xor %50, %true : i1
        %52 = comb.and %50, %nack_transaction_q : i1
        %53 = comb.xor %44, %true : i1
        %54 = comb.mux %44, %48, %50 : i1
        %55 = comb.or %44, %52 : i1
        %56 = comb.and %45, %49 : i1
        %57 = comb.xor %56, %true : i1
        %true_2 = hw.constant true
        %58 = comb.xor %56, %true_2 : i1
        %59 = comb.and %58, %53, %51 : i1
        %60 = comb.mux %56, %42, %54 : i1
        %61 = comb.and %57, %53, %51 : i1
        %62 = comb.or %56, %44, %50 : i1
        %63 = comb.and %62, %xact_for_us_q : i1
        %64 = comb.or %56, %44, %50 : i1
        %65 = comb.mux %64, %auto_ack_cnt_q, %c0_i9 : i9
        %66 = comb.or %56, %44, %50 : i1
        %67 = comb.and %66, %restart_det_q : i1
        %68 = comb.mux %56, %nack_transaction_q, %55 : i1
        %69 = comb.xor %61, %true : i1
        %70 = comb.mux %40, %67, %69 : i1
        %71 = comb.or %41, %68 : i1
        %72 = ltl.past %59, 1 : i1
        %73 = comb.xor %72, %true : i1
        %74 = comb.and bin %59, %73 : i1
        %75 = ltl.delay %59, 1, 0 : i1
        %76 = ltl.implication %74, %75 : i1, !ltl.sequence
        verif.assert %76 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %63 : i1
        fsm.update %restart_det_q, %70 : i1
        fsm.update %nack_transaction_q, %71 : i1
        %77 = comb.and %arg3, %61 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %60, %2, %78 : i31
        %80 = comb.or %60, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %65 : i9
        fsm.update %stretch_active_cnt, %81 : i31
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.icmp ult %0, %c3_i7 : i7
        %3 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %4 = comb.and %arg14, %3 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.xor %2, %true : i1
        %9 = comb.xor %4, %true : i1
        %10 = comb.and %9, %2 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %8, %9 : i1
        %14 = comb.xor %13, %true : i1
        %true_1 = hw.constant true
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %15, %12, %11 : i1
        %17 = comb.and %14, %12, %11 : i1
        %18 = comb.xor %17, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %19 = comb.mux %4, %c-3_i4, %c0_i4 : i4
        %20 = comb.and %18, %5 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %7, %21, %1 : i1
        %23 = comb.and %21, %6 : i1
        %24 = comb.extract %19 from 2 : (i4) -> i2
        %25 = comb.extract %19 from 0 : (i4) -> i1
        %26 = comb.concat %24, %25 : i2, i1
        %c0_i3 = hw.constant 0 : i3
        %27 = comb.icmp eq %26, %c0_i3 : i3
        %true_2 = hw.constant true
        %28 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %29 = comb.xor %10, %true_3 : i1
        %true_4 = hw.constant true
        %30 = comb.xor %arg16, %true_4 : i1
        %31 = comb.and %30, %29, %28, %27 : i1
        %32 = comb.or %22, %31 : i1
        %true_5 = hw.constant true
        %33 = comb.xor %23, %true_5 : i1
        %34 = comb.and %33, %32 : i1
        %35 = comb.or %20, %34 : i1
        %36 = ltl.past %16, 1 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and bin %16, %37 : i1
        %39 = ltl.delay %16, 1, 0 : i1
        %40 = ltl.implication %38, %39 : i1, !ltl.sequence
        verif.assert %40 : !ltl.property
        fsm.return %35
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.xor %arg19, %true : i1
        %4 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %5 = comb.or %3, %4 : i1
        %6 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %7 = comb.xor %arg1, %true : i1
        %8 = comb.and %scl_i_q, %7 : i1
        %9 = comb.add %bit_idx, %c1_i4 : i4
        %10 = comb.xor %arg3, %true : i1
        %11 = comb.or %arg3, %8 : i1
        %12 = comb.mux %11, %c0_i4, %bit_idx : i4
        %13 = comb.xor %6, %true : i1
        %14 = comb.and %13, %8, %10 : i1
        %15 = comb.mux %14, %9, %12 : i4
        %16 = comb.xor %scl_i_q, %true : i1
        %17 = comb.and %16, %arg1 : i1
        %18 = comb.xor %6, %true : i1
        %19 = comb.extract %input_byte from 0 : (i8) -> i7
        %20 = comb.concat %19, %arg2 : i7, i1
        %21 = comb.and %18, %17 : i1
        %22 = comb.mux %21, %20, %c0_i8 : i8
        %23 = comb.and %17, %6 : i1
        %24 = comb.xor %17, %true : i1
        %25 = comb.or %24, %23 : i1
        %26 = comb.mux bin %25, %input_byte, %22 : i8
        %27 = comb.xor %arg2, %true : i1
        %28 = comb.and %17, %18 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %17, %29, %27 : i1
        %31 = comb.and %17, %29 : i1
        %32 = comb.mux bin %31, %30, %host_ack : i1
        %33 = comb.sub %c-64_i7, %arg8 : i7
        %34 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        %35 = comb.or %arg4, %arg17 : i1
        %36 = comb.and %arg5, %35 : i1
        %37 = comb.xor %36, %true : i1
        %38 = comb.and %arg5, %arg3, %37 : i1
        %39 = comb.xor %38, %true : i1
        %40 = comb.or %36, %39 : i1
        %41 = comb.and %37, %39, %arg16 : i1
        %42 = comb.icmp ult %33, %c3_i7 : i7
        %43 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %44 = comb.and %arg14, %43 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %45 = comb.xor %42, %true : i1
        %46 = comb.xor %44, %true : i1
        %47 = comb.and %46, %34 : i1
        %48 = comb.or %47, %42 : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %42 : i1
        %51 = comb.xor %50, %true : i1
        %52 = comb.and %50, %nack_transaction_q : i1
        %53 = comb.xor %44, %true : i1
        %54 = comb.mux %44, %48, %50 : i1
        %55 = comb.or %44, %52 : i1
        %56 = comb.and %45, %49 : i1
        %57 = comb.xor %56, %true : i1
        %true_2 = hw.constant true
        %58 = comb.xor %56, %true_2 : i1
        %59 = comb.and %58, %53, %51 : i1
        %60 = comb.mux %56, %42, %54 : i1
        %61 = comb.and %57, %53, %51 : i1
        %62 = comb.or %56, %44, %50 : i1
        %63 = comb.and %62, %xact_for_us_q : i1
        %64 = comb.or %56, %44, %50 : i1
        %65 = comb.mux %64, %auto_ack_cnt_q, %c0_i9 : i9
        %66 = comb.or %56, %44, %50 : i1
        %67 = comb.and %66, %restart_det_q : i1
        %68 = comb.mux %56, %nack_transaction_q, %55 : i1
        %69 = comb.xor %61, %true : i1
        %70 = comb.mux %40, %67, %69 : i1
        %71 = comb.or %41, %68 : i1
        %72 = ltl.past %59, 1 : i1
        %73 = comb.xor %72, %true : i1
        %74 = comb.and bin %59, %73 : i1
        %75 = ltl.delay %59, 1, 0 : i1
        %76 = ltl.implication %74, %75 : i1, !ltl.sequence
        verif.assert %76 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %63 : i1
        fsm.update %restart_det_q, %70 : i1
        fsm.update %nack_transaction_q, %71 : i1
        %77 = comb.and %arg3, %61 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %60, %2, %78 : i31
        %80 = comb.or %60, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
        fsm.update %auto_ack_cnt_q, %65 : i9
        fsm.update %stretch_active_cnt, %81 : i31
      }
    }
    fsm.state @state_5 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_2, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_2, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_2, %false, %true_0, %false_3, %10, %11, %18, %false_1, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg1, %true_3 : i1
        %45 = comb.or %39, %arg5 : i1
        %46 = comb.mux %45, %c1_i16, %tcount_q : i16
        %47 = comb.and %44, %39 : i1
        %48 = comb.mux %47, %0, %46 : i16
        %49 = comb.and %arg5, %arg1 : i1
        %50 = comb.mux %49, %1, %48 : i16
        fsm.update %tcount_q, %50 : i16
      }
      fsm.transition @state_6 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %1, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %1, %true_4 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
    }
    fsm.state @state_8 output {
      %true = hw.constant true
      %c1_i7 = hw.constant 1 : i7
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i5 = hw.constant 0 : i5
      %c0_i11 = hw.constant 0 : i11
      %c0_i7 = hw.constant 0 : i7
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.extract %arg7 from 0 : (i8) -> i1
      %2 = comb.extract %arg7 from 1 : (i8) -> i1
      %3 = comb.extract %arg7 from 2 : (i8) -> i1
      %4 = comb.extract %arg7 from 3 : (i8) -> i1
      %5 = comb.extract %arg7 from 4 : (i8) -> i1
      %6 = comb.extract %arg7 from 5 : (i8) -> i1
      %7 = comb.extract %arg7 from 6 : (i8) -> i1
      %8 = comb.extract %arg7 from 7 : (i8) -> i1
      %9 = comb.concat %1, %2, %3, %4, %5, %6, %7, %8 : i1, i1, i1, i1, i1, i1, i1, i1
      %10 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %11 = comb.xor %nack_transaction_q, %true : i1
      %12 = comb.extract %bit_idx from 0 : (i4) -> i3
      %13 = comb.concat %c0_i5, %12 : i5, i3
      %14 = comb.shru %9, %13 : i8
      %15 = comb.extract %14 from 0 : (i8) -> i1
      %true_0 = hw.constant true
      %false = hw.constant false
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %16 = comb.or %arg4, %arg17 : i1
      %17 = comb.and %arg5, %16 : i1
      %18 = comb.or %nack_transaction_q, %arg17 : i1
      %19 = comb.concat %18, %c-2_i2, %input_byte : i1, i2, i8
      %20 = comb.xor %17, %true : i1
      %21 = comb.and %arg5, %arg3, %20 : i1
      %22 = comb.xor %21, %true : i1
      %23 = comb.and %17, %xact_for_us_q : i1
      %24 = comb.mux %17, %19, %c0_i11 : i11
      %25 = comb.or %17, %21, %arg16 : i1
      %26 = comb.and %25, %xfer_for_us_q : i1
      %27 = comb.and %20, %22, %arg16 : i1
      %28 = comb.or %27, %nack_transaction_q : i1
      %29 = comb.and %20, %22, %arg16, %rw_bit_q : i1
      %30 = comb.and %17, %arg17, %rw_bit_q : i1
      %31 = comb.icmp ult %0, %c3_i7 : i7
      %false_5 = hw.constant false
      %32 = ltl.past %true_1, 1 : i1
      %33 = comb.xor %32, %true : i1
      %34 = ltl.delay %true_1, 1, 0 : i1
      %35 = ltl.implication %33, %34 : i1, !ltl.sequence
      verif.assert %35 : !ltl.property
      %36 = comb.icmp eq %arg8, %c1_i7 : i7
      %37 = comb.extract %arg9 from 0 : (i11) -> i1
      %38 = comb.and %36, %37 : i1
      %39 = comb.icmp eq %arg8, %c0_i7 : i7
      %40 = comb.or %39, %38 : i1
      verif.assert %40 : i1
      %41 = comb.and %11, %28 : i1
      fsm.output %true_1, %15, %true_0, %false_2, %23, %24, %31, %false, %auto_ack_cnt_q, %false_3, %input_byte, %41, %26, %false_5, %10, %29, %30, %false_4 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %c0_i7 = hw.constant 0 : i7
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.icmp eq %arg8, %c1_i7 : i7
        %4 = comb.extract %arg9 from 0 : (i11) -> i1
        %5 = comb.and %3, %4 : i1
        %6 = comb.icmp eq %arg8, %c0_i7 : i7
        %7 = comb.or %6, %5 : i1
        verif.assert %7 : i1
        %true_0 = hw.constant true
        %8 = comb.and %2, %arg5, %0 : i1
        %true_1 = hw.constant true
        %9 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %10 = comb.xor %8, %true_2 : i1
        %true_3 = hw.constant true
        %11 = comb.xor %1, %true_3 : i1
        %12 = comb.and %arg5, %11, %10, %9, %arg1 : i1
        %13 = ltl.past %true_0, 1 : i1
        %14 = comb.xor %13, %true : i1
        %15 = ltl.delay %true_0, 1, 0 : i1
        %16 = ltl.implication %14, %15 : i1, !ltl.sequence
        verif.assert %16 : !ltl.property
        fsm.return %12
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.extract %arg7 from 0 : (i8) -> i1
        %30 = comb.extract %arg7 from 1 : (i8) -> i1
        %31 = comb.extract %arg7 from 2 : (i8) -> i1
        %32 = comb.extract %arg7 from 3 : (i8) -> i1
        %33 = comb.extract %arg7 from 4 : (i8) -> i1
        %34 = comb.extract %arg7 from 5 : (i8) -> i1
        %35 = comb.extract %arg7 from 6 : (i8) -> i1
        %36 = comb.extract %arg7 from 7 : (i8) -> i1
        %37 = comb.concat %29, %30, %31, %32, %33, %34, %35, %36 : i1, i1, i1, i1, i1, i1, i1, i1
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %true_0 = hw.constant true
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_1 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_1 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = ltl.past %true_0, 1 : i1
        %53 = comb.xor %52, %true : i1
        %54 = ltl.delay %true_0, 1, 0 : i1
        %55 = ltl.implication %53, %54 : i1, !ltl.sequence
        verif.assert %55 : !ltl.property
        %56 = comb.icmp eq %arg8, %c1_i7 : i7
        %57 = comb.extract %arg9 from 0 : (i11) -> i1
        %58 = comb.and %56, %57 : i1
        %59 = comb.icmp eq %arg8, %c0_i7 : i7
        %60 = comb.or %59, %58 : i1
        verif.assert %60 : i1
        fsm.update %sda_q, %41 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        fsm.update %nack_transaction_q, %51 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %c0_i7 = hw.constant 0 : i7
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.icmp eq %arg8, %c1_i7 : i7
        %4 = comb.extract %arg9 from 0 : (i11) -> i1
        %5 = comb.and %3, %4 : i1
        %6 = comb.icmp eq %arg8, %c0_i7 : i7
        %7 = comb.or %6, %5 : i1
        verif.assert %7 : i1
        %true_0 = hw.constant true
        %8 = comb.and %2, %arg5, %0 : i1
        %true_1 = hw.constant true
        %9 = comb.xor %arg1, %true_1 : i1
        %true_2 = hw.constant true
        %10 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %11 = comb.xor %8, %true_3 : i1
        %true_4 = hw.constant true
        %12 = comb.xor %1, %true_4 : i1
        %13 = comb.and %arg5, %12, %11, %10, %9 : i1
        %14 = ltl.past %true_0, 1 : i1
        %15 = comb.xor %14, %true : i1
        %16 = ltl.delay %true_0, 1, 0 : i1
        %17 = ltl.implication %15, %16 : i1, !ltl.sequence
        verif.assert %17 : !ltl.property
        fsm.return %13
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i7 = hw.constant 1 : i7
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.extract %arg7 from 0 : (i8) -> i1
        %30 = comb.extract %arg7 from 1 : (i8) -> i1
        %31 = comb.extract %arg7 from 2 : (i8) -> i1
        %32 = comb.extract %arg7 from 3 : (i8) -> i1
        %33 = comb.extract %arg7 from 4 : (i8) -> i1
        %34 = comb.extract %arg7 from 5 : (i8) -> i1
        %35 = comb.extract %arg7 from 6 : (i8) -> i1
        %36 = comb.extract %arg7 from 7 : (i8) -> i1
        %37 = comb.concat %29, %30, %31, %32, %33, %34, %35, %36 : i1, i1, i1, i1, i1, i1, i1, i1
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %true_0 = hw.constant true
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_1 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_1 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = ltl.past %true_0, 1 : i1
        %53 = comb.xor %52, %true : i1
        %54 = ltl.delay %true_0, 1, 0 : i1
        %55 = ltl.implication %53, %54 : i1, !ltl.sequence
        verif.assert %55 : !ltl.property
        %56 = comb.icmp eq %arg8, %c1_i7 : i7
        %57 = comb.extract %arg9 from 0 : (i11) -> i1
        %58 = comb.and %56, %57 : i1
        %59 = comb.icmp eq %arg8, %c0_i7 : i7
        %60 = comb.or %59, %58 : i1
        verif.assert %60 : i1
        fsm.update %sda_q, %41 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        fsm.update %nack_transaction_q, %51 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_22 output {
      %true = hw.constant true
      %c0_i6 = hw.constant 0 : i6
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %16 = comb.and %4, %arg17, %rw_bit_q : i1
      %17 = comb.icmp ult %0, %c3_i7 : i7
      %18 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
      %19 = comb.and %arg14, %18 : i1
      %20 = comb.xor %arg6, %true : i1
      %21 = comb.extract %arg8 from 1 : (i7) -> i6
      %22 = comb.icmp ne %21, %c0_i6 : i6
      %23 = comb.or %20, %arg18, %22 : i1
      %24 = ltl.boolean_constant true
      verif.assert %24 : !ltl.property
      %true_6 = hw.constant true
      verif.assert %true_6 : i1
      %25 = comb.xor %19, %true : i1
      %26 = comb.or %14, %19, %nack_transaction_q : i1
      %27 = comb.mux %25, %23, %19 : i1
      %28 = comb.and %2, %26 : i1
      fsm.output %false_1, %true_0, %false_2, %false_3, %10, %11, %17, %false, %auto_ack_cnt_q, %false_4, %input_byte, %28, %13, %27, %1, %15, %16, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_25 guard {
        %true = hw.constant true
        verif.assert %true : i1
        %false = hw.constant false
        %0 = ltl.boolean_constant true
        verif.assert %0 : !ltl.property
        fsm.return %false
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_1 : i1
        %44 = comb.or %43, %restart_det_q : i1
        %45 = comb.and %39, %41, %arg16 : i1
        %46 = comb.icmp ult %35, %c3_i7 : i7
        %47 = comb.or %46, %36 : i1
        %48 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %49 = comb.and %arg14, %48 : i1
        %50 = comb.xor %arg6, %true : i1
        %51 = comb.extract %arg8 from 1 : (i7) -> i6
        %52 = comb.icmp ne %51, %c0_i6 : i6
        %53 = comb.or %50, %arg18, %52 : i1
        %54 = ltl.boolean_constant true
        verif.assert %54 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %44 : i1
        %55 = comb.xor %49, %true : i1
        %56 = comb.or %45, %49, %nack_transaction_q : i1
        %57 = comb.mux %55, %53, %47 : i1
        %58 = comb.xor %57, %true : i1
        %59 = comb.and %55, %58 : i1
        %60 = comb.or %49, %57 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %61 = comb.xor %60, %true_3 : i1
        %62 = comb.xor %59, %true : i1
        %63 = comb.or %59, %arg5 : i1
        %64 = comb.mux %63, %c1_i16, %tcount_q : i16
        %65 = comb.and %61, %59 : i1
        %66 = comb.mux %65, %2, %64 : i16
        %67 = comb.and %arg5, %62 : i1
        %68 = comb.mux %67, %3, %66 : i16
        %69 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %69 : i31
        fsm.update %tcount_q, %68 : i16
      }
      fsm.transition @state_23 guard {
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.sub %c-64_i7, %arg8 : i7
        %4 = comb.xor %2, %true : i1
        %5 = comb.or %arg4, %arg17 : i1
        %6 = comb.icmp ult %3, %c3_i7 : i7
        %7 = comb.or %6, %4 : i1
        %8 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %9 = comb.and %arg14, %8 : i1
        %10 = comb.xor %arg6, %true : i1
        %11 = comb.extract %arg8 from 1 : (i7) -> i6
        %12 = comb.icmp ne %11, %c0_i6 : i6
        %13 = comb.or %10, %arg18, %12 : i1
        %14 = comb.and %arg5, %arg3 : i1
        %15 = comb.xor %14, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %16 = comb.xor %9, %true : i1
        %17 = comb.mux %16, %13, %7 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.and %15, %arg5, %5 : i1
        %true_1 = hw.constant true
        %20 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %21 = comb.xor %19, %true_2 : i1
        %true_3 = hw.constant true
        %22 = comb.xor %14, %true_3 : i1
        %23 = comb.and %arg5, %22, %21, %20, %16, %18 : i1
        %24 = ltl.boolean_constant true
        verif.assert %24 : !ltl.property
        fsm.return %23
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_1 : i1
        %44 = comb.or %43, %restart_det_q : i1
        %45 = comb.and %39, %41, %arg16 : i1
        %46 = comb.icmp ult %35, %c3_i7 : i7
        %47 = comb.or %46, %36 : i1
        %48 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %49 = comb.and %arg14, %48 : i1
        %50 = comb.xor %arg6, %true : i1
        %51 = comb.extract %arg8 from 1 : (i7) -> i6
        %52 = comb.icmp ne %51, %c0_i6 : i6
        %53 = comb.or %50, %arg18, %52 : i1
        %54 = ltl.boolean_constant true
        verif.assert %54 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %44 : i1
        %55 = comb.xor %49, %true : i1
        %56 = comb.or %45, %49, %nack_transaction_q : i1
        %57 = comb.mux %55, %53, %47 : i1
        %58 = comb.xor %57, %true : i1
        %59 = comb.and %55, %58 : i1
        %60 = comb.or %49, %57 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %61 = comb.xor %60, %true_3 : i1
        %62 = comb.xor %59, %true : i1
        %63 = comb.or %59, %arg5 : i1
        %64 = comb.mux %63, %c1_i16, %tcount_q : i16
        %65 = comb.and %61, %59 : i1
        %66 = comb.mux %65, %2, %64 : i16
        %67 = comb.and %arg5, %62 : i1
        %68 = comb.mux %67, %3, %66 : i16
        %69 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %69 : i31
        fsm.update %tcount_q, %68 : i16
      }
      fsm.transition @state_22 guard {
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.sub %c-64_i7, %arg8 : i7
        %4 = comb.xor %2, %true : i1
        %5 = comb.or %arg4, %arg17 : i1
        %6 = comb.icmp ult %3, %c3_i7 : i7
        %7 = comb.or %6, %4 : i1
        %8 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %9 = comb.and %arg14, %8 : i1
        %10 = comb.xor %arg6, %true : i1
        %11 = comb.extract %arg8 from 1 : (i7) -> i6
        %12 = comb.icmp ne %11, %c0_i6 : i6
        %13 = comb.or %10, %arg18, %12 : i1
        %14 = comb.and %arg5, %arg3 : i1
        %15 = comb.xor %14, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %16 = comb.xor %9, %true : i1
        %17 = comb.mux %9, %7, %13 : i1
        %18 = comb.and %15, %arg5, %5 : i1
        %true_1 = hw.constant true
        %19 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %20 = comb.xor %18, %true_2 : i1
        %true_3 = hw.constant true
        %21 = comb.xor %14, %true_3 : i1
        %22 = comb.and %arg5, %21, %20, %19, %16, %17 : i1
        %23 = ltl.boolean_constant true
        verif.assert %23 : !ltl.property
        fsm.return %22
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_1 : i1
        %44 = comb.or %43, %restart_det_q : i1
        %45 = comb.and %39, %41, %arg16 : i1
        %46 = comb.icmp ult %35, %c3_i7 : i7
        %47 = comb.or %46, %36 : i1
        %48 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %49 = comb.and %arg14, %48 : i1
        %50 = comb.xor %arg6, %true : i1
        %51 = comb.extract %arg8 from 1 : (i7) -> i6
        %52 = comb.icmp ne %51, %c0_i6 : i6
        %53 = comb.or %50, %arg18, %52 : i1
        %54 = ltl.boolean_constant true
        verif.assert %54 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %44 : i1
        %55 = comb.xor %49, %true : i1
        %56 = comb.or %45, %49, %nack_transaction_q : i1
        %57 = comb.mux %55, %53, %47 : i1
        %58 = comb.xor %57, %true : i1
        %59 = comb.and %55, %58 : i1
        %60 = comb.or %49, %57 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %61 = comb.xor %60, %true_3 : i1
        %62 = comb.xor %59, %true : i1
        %63 = comb.or %59, %arg5 : i1
        %64 = comb.mux %63, %c1_i16, %tcount_q : i16
        %65 = comb.and %61, %59 : i1
        %66 = comb.mux %65, %2, %64 : i16
        %67 = comb.and %arg5, %62 : i1
        %68 = comb.mux %67, %3, %66 : i16
        %69 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %69 : i31
        fsm.update %tcount_q, %68 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %5 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %6 = comb.and %4, %arg5, %0 : i1
        %7 = comb.extract %5 from 2 : (i4) -> i2
        %8 = comb.extract %5 from 0 : (i4) -> i1
        %9 = comb.concat %7, %8 : i2, i1
        %c-1_i3 = hw.constant -1 : i3
        %10 = comb.icmp eq %9, %c-1_i3 : i3
        %11 = comb.and %2, %10 : i1
        %12 = comb.or %arg16, %11 : i1
        %true_1 = hw.constant true
        %13 = comb.xor %6, %true_1 : i1
        %true_2 = hw.constant true
        %14 = comb.xor %3, %true_2 : i1
        %15 = comb.and %arg5, %14, %13, %12 : i1
        %16 = ltl.boolean_constant true
        verif.assert %16 : !ltl.property
        fsm.return %15
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_1 : i1
        %44 = comb.or %43, %restart_det_q : i1
        %45 = comb.and %39, %41, %arg16 : i1
        %46 = comb.icmp ult %35, %c3_i7 : i7
        %47 = comb.or %46, %36 : i1
        %48 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %49 = comb.and %arg14, %48 : i1
        %50 = comb.xor %arg6, %true : i1
        %51 = comb.extract %arg8 from 1 : (i7) -> i6
        %52 = comb.icmp ne %51, %c0_i6 : i6
        %53 = comb.or %50, %arg18, %52 : i1
        %54 = ltl.boolean_constant true
        verif.assert %54 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %44 : i1
        %55 = comb.xor %49, %true : i1
        %56 = comb.or %45, %49, %nack_transaction_q : i1
        %57 = comb.mux %55, %53, %47 : i1
        %58 = comb.xor %57, %true : i1
        %59 = comb.and %55, %58 : i1
        %60 = comb.or %49, %57 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %61 = comb.xor %60, %true_3 : i1
        %62 = comb.xor %59, %true : i1
        %63 = comb.or %59, %arg5 : i1
        %64 = comb.mux %63, %c1_i16, %tcount_q : i16
        %65 = comb.and %61, %59 : i1
        %66 = comb.mux %65, %2, %64 : i16
        %67 = comb.and %arg5, %62 : i1
        %68 = comb.mux %67, %3, %66 : i16
        %69 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %69 : i31
        fsm.update %tcount_q, %68 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %5 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %6 = comb.and %4, %arg5, %0 : i1
        %7 = comb.extract %5 from 2 : (i4) -> i2
        %8 = comb.extract %5 from 0 : (i4) -> i1
        %9 = comb.concat %7, %8 : i2, i1
        %c1_i3 = hw.constant 1 : i3
        %10 = comb.icmp eq %9, %c1_i3 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %12 = comb.xor %6, %true_2 : i1
        %13 = comb.and %12, %11, %2, %10 : i1
        %14 = comb.or %3, %13 : i1
        %15 = comb.and %arg5, %14 : i1
        %16 = ltl.boolean_constant true
        verif.assert %16 : !ltl.property
        fsm.return %15
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_1 : i1
        %44 = comb.or %43, %restart_det_q : i1
        %45 = comb.and %39, %41, %arg16 : i1
        %46 = comb.icmp ult %35, %c3_i7 : i7
        %47 = comb.or %46, %36 : i1
        %48 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %49 = comb.and %arg14, %48 : i1
        %50 = comb.xor %arg6, %true : i1
        %51 = comb.extract %arg8 from 1 : (i7) -> i6
        %52 = comb.icmp ne %51, %c0_i6 : i6
        %53 = comb.or %50, %arg18, %52 : i1
        %54 = ltl.boolean_constant true
        verif.assert %54 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %44 : i1
        %55 = comb.xor %49, %true : i1
        %56 = comb.or %45, %49, %nack_transaction_q : i1
        %57 = comb.mux %55, %53, %47 : i1
        %58 = comb.xor %57, %true : i1
        %59 = comb.and %55, %58 : i1
        %60 = comb.or %49, %57 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %61 = comb.xor %60, %true_3 : i1
        %62 = comb.xor %59, %true : i1
        %63 = comb.or %59, %arg5 : i1
        %64 = comb.mux %63, %c1_i16, %tcount_q : i16
        %65 = comb.and %61, %59 : i1
        %66 = comb.mux %65, %2, %64 : i16
        %67 = comb.and %arg5, %62 : i1
        %68 = comb.mux %67, %3, %66 : i16
        %69 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %69 : i31
        fsm.update %tcount_q, %68 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.xor %arg5, %true : i1
        %4 = comb.and %arg5, %arg3 : i1
        %5 = comb.xor %4, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %6 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %7 = comb.and %5, %arg5, %0 : i1
        %8 = comb.extract %6 from 2 : (i4) -> i2
        %9 = comb.extract %6 from 0 : (i4) -> i1
        %10 = comb.concat %8, %9 : i2, i1
        %c0_i3 = hw.constant 0 : i3
        %11 = comb.icmp eq %10, %c0_i3 : i3
        %true_1 = hw.constant true
        %12 = comb.xor %arg16, %true_1 : i1
        %13 = comb.and %12, %2, %11 : i1
        %14 = comb.or %7, %13 : i1
        %true_2 = hw.constant true
        %15 = comb.xor %4, %true_2 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.or %3, %16 : i1
        %18 = ltl.boolean_constant true
        verif.assert %18 : !ltl.property
        fsm.return %17
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_1 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_1 : i1
        %44 = comb.or %43, %restart_det_q : i1
        %45 = comb.and %39, %41, %arg16 : i1
        %46 = comb.icmp ult %35, %c3_i7 : i7
        %47 = comb.or %46, %36 : i1
        %48 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %49 = comb.and %arg14, %48 : i1
        %50 = comb.xor %arg6, %true : i1
        %51 = comb.extract %arg8 from 1 : (i7) -> i6
        %52 = comb.icmp ne %51, %c0_i6 : i6
        %53 = comb.or %50, %arg18, %52 : i1
        %54 = ltl.boolean_constant true
        verif.assert %54 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %44 : i1
        %55 = comb.xor %49, %true : i1
        %56 = comb.or %45, %49, %nack_transaction_q : i1
        %57 = comb.mux %55, %53, %47 : i1
        %58 = comb.xor %57, %true : i1
        %59 = comb.and %55, %58 : i1
        %60 = comb.or %49, %57 : i1
        fsm.update %nack_transaction_q, %56 : i1
        %true_3 = hw.constant true
        %61 = comb.xor %60, %true_3 : i1
        %62 = comb.xor %59, %true : i1
        %63 = comb.or %59, %arg5 : i1
        %64 = comb.mux %63, %c1_i16, %tcount_q : i16
        %65 = comb.and %61, %59 : i1
        %66 = comb.mux %65, %2, %64 : i16
        %67 = comb.and %arg5, %62 : i1
        %68 = comb.mux %67, %3, %66 : i16
        %69 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %69 : i31
        fsm.update %tcount_q, %68 : i16
      }
    }
    fsm.state @state_15 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %arg1, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %true_0, %false_2, %false_3, %10, %11, %18, %false, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_24 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.sub %c-64_i7, %arg8 : i7
        %5 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %6 = comb.xor %2, %true : i1
        %7 = comb.xor %5, %true : i1
        %8 = comb.or %arg4, %arg17 : i1
        %9 = comb.icmp ult %4, %c3_i7 : i7
        %10 = comb.or %9, %6 : i1
        %11 = comb.and %arg5, %arg3 : i1
        %12 = comb.xor %11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_2 = hw.constant true
        %19 = comb.xor %17, %true_2 : i1
        %true_3 = hw.constant true
        %20 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %18, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %11, %true_5 : i1
        %23 = comb.and %arg5, %22, %21, %20, %19, %16, %15, %13 : i1
        %24 = ltl.past %true_1, 1 : i1
        %25 = comb.xor %24, %true : i1
        %26 = ltl.delay %true_1, 1, 0 : i1
        %27 = ltl.implication %25, %26 : i1, !ltl.sequence
        verif.assert %27 : !ltl.property
        fsm.return %23
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_21 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %8 = comb.and %0, %2 : i1
        %9 = comb.mux %8, %nack_transaction_q, %5 : i1
        %10 = comb.and %2, %0 : i1
        %11 = comb.xor %9, %true : i1
        %12 = comb.and %11, %10 : i1
        %13 = comb.and %0, %3 : i1
        %14 = comb.and %7, %arg5, %4 : i1
        %true_2 = hw.constant true
        %15 = comb.xor %8, %true_2 : i1
        %true_3 = hw.constant true
        %16 = comb.xor %12, %true_3 : i1
        %true_4 = hw.constant true
        %17 = comb.xor %13, %true_4 : i1
        %true_5 = hw.constant true
        %18 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %19 = comb.xor %14, %true_6 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %6, %true_7 : i1
        %21 = comb.and %arg5, %20, %19, %18, %17, %16, %10, %9, %15 : i1
        %22 = ltl.past %true_1, 1 : i1
        %23 = comb.xor %22, %true : i1
        %24 = ltl.delay %true_1, 1, 0 : i1
        %25 = ltl.implication %23, %24 : i1, !ltl.sequence
        verif.assert %25 : !ltl.property
        fsm.return %21
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_16 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.sub %c-64_i7, %arg8 : i7
        %5 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %6 = comb.xor %2, %true : i1
        %7 = comb.xor %5, %true : i1
        %8 = comb.or %arg4, %arg17 : i1
        %9 = comb.icmp ult %4, %c3_i7 : i7
        %10 = comb.or %9, %6 : i1
        %11 = comb.and %arg5, %arg3 : i1
        %12 = comb.xor %11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_2 = hw.constant true
        %19 = comb.xor %15, %true_2 : i1
        %true_3 = hw.constant true
        %20 = comb.xor %17, %true_3 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %18, %true_5 : i1
        %true_6 = hw.constant true
        %23 = comb.xor %11, %true_6 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20, %16, %19, %13 : i1
        %25 = ltl.past %true_1, 1 : i1
        %26 = comb.xor %25, %true : i1
        %27 = ltl.delay %true_1, 1, 0 : i1
        %28 = ltl.implication %26, %27 : i1, !ltl.sequence
        verif.assert %28 : !ltl.property
        fsm.return %24
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_15 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %2 = comb.or %arg4, %arg17 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %5 = comb.and %4, %arg5, %2 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %5, %true_3 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %3, %true_4 : i1
        %9 = comb.and %arg5, %8, %7, %6, %0, %1 : i1
        %10 = ltl.past %true_1, 1 : i1
        %11 = comb.xor %10, %true : i1
        %12 = ltl.delay %true_1, 1, 0 : i1
        %13 = ltl.implication %11, %12 : i1, !ltl.sequence
        verif.assert %13 : !ltl.property
        fsm.return %9
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.sub %c-64_i7, %arg8 : i7
        %5 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %6 = comb.xor %2, %true : i1
        %7 = comb.xor %5, %true : i1
        %8 = comb.or %arg4, %arg17 : i1
        %9 = comb.icmp ult %4, %c3_i7 : i7
        %10 = comb.or %9, %6 : i1
        %11 = comb.and %arg5, %arg3 : i1
        %12 = comb.xor %11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_2 = hw.constant true
        %19 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %20 = comb.xor %15, %true_3 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %17, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %23 = comb.xor %18, %true_6 : i1
        %true_7 = hw.constant true
        %24 = comb.xor %11, %true_7 : i1
        %25 = comb.and %arg5, %24, %23, %22, %21, %16, %5, %3, %20, %19 : i1
        %26 = ltl.past %true_1, 1 : i1
        %27 = comb.xor %26, %true : i1
        %28 = ltl.delay %true_1, 1, 0 : i1
        %29 = ltl.implication %27, %28 : i1, !ltl.sequence
        verif.assert %29 : !ltl.property
        fsm.return %25
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %8 = comb.and %0, %2 : i1
        %9 = comb.mux %8, %nack_transaction_q, %5 : i1
        %10 = comb.and %2, %0 : i1
        %11 = comb.and %10, %9 : i1
        %12 = comb.xor %9, %true : i1
        %13 = comb.and %12, %10 : i1
        %14 = comb.and %0, %3 : i1
        %15 = comb.and %7, %arg5, %4 : i1
        %16 = comb.mux %11, %8, %arg1 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %18 = comb.xor %14, %true_3 : i1
        %19 = comb.and %18, %17, %16 : i1
        %20 = comb.or %arg16, %19 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %15, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %6, %true_5 : i1
        %23 = comb.and %arg5, %22, %21, %20 : i1
        %24 = ltl.past %true_1, 1 : i1
        %25 = comb.xor %24, %true : i1
        %26 = ltl.delay %true_1, 1, 0 : i1
        %27 = ltl.implication %25, %26 : i1, !ltl.sequence
        verif.assert %27 : !ltl.property
        fsm.return %23
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.sub %c-64_i7, %arg8 : i7
        %5 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %6 = comb.xor %2, %true : i1
        %7 = comb.xor %5, %true : i1
        %8 = comb.or %arg4, %arg17 : i1
        %9 = comb.icmp ult %4, %c3_i7 : i7
        %10 = comb.or %9, %6 : i1
        %11 = comb.and %arg5, %arg3 : i1
        %12 = comb.xor %11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_2 = hw.constant true
        %19 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %20 = comb.xor %17, %true_3 : i1
        %true_4 = hw.constant true
        %21 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %18, %true_5 : i1
        %true_6 = hw.constant true
        %23 = comb.xor %11, %true_6 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20, %16, %5, %3, %15, %19 : i1
        %25 = ltl.past %true_1, 1 : i1
        %26 = comb.xor %25, %true : i1
        %27 = ltl.delay %true_1, 1, 0 : i1
        %28 = ltl.implication %26, %27 : i1, !ltl.sequence
        verif.assert %28 : !ltl.property
        fsm.return %24
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.sub %c-64_i7, %arg8 : i7
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %1, %c3_i7 : i7
        %6 = comb.xor %arg5, %true : i1
        %7 = comb.and %arg5, %arg3 : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %9 = comb.and %0, %2 : i1
        %10 = comb.mux %9, %nack_transaction_q, %5 : i1
        %11 = comb.and %2, %0 : i1
        %12 = comb.and %11, %10 : i1
        %13 = comb.xor %10, %true : i1
        %14 = comb.and %13, %11 : i1
        %15 = comb.and %0, %3 : i1
        %16 = comb.and %8, %arg5, %4 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %arg1, %true_2 : i1
        %true_3 = hw.constant true
        %18 = comb.xor %12, %true_3 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %14, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %15, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %arg16, %true_6 : i1
        %22 = comb.and %21, %20, %19, %18, %17 : i1
        %23 = comb.or %16, %22 : i1
        %true_7 = hw.constant true
        %24 = comb.xor %7, %true_7 : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.or %6, %25 : i1
        %27 = ltl.past %true_1, 1 : i1
        %28 = comb.xor %27, %true : i1
        %29 = ltl.delay %true_1, 1, 0 : i1
        %30 = ltl.implication %28, %29 : i1, !ltl.sequence
        verif.assert %30 : !ltl.property
        fsm.return %26
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_20 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.boolean_constant true
      verif.assert %19 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %20 = comb.and %2, %15 : i1
      fsm.output %false_2, %false, %true_0, %false_3, %10, %11, %18, %false_1, %auto_ack_cnt_q, %false_4, %input_byte, %20, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_20 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_1 = hw.constant true
        %5 = comb.xor %0, %true_1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %2, %true_4 : i1
        %9 = comb.and %arg5, %8, %7, %6, %5 : i1
        %10 = ltl.boolean_constant true
        verif.assert %10 : !ltl.property
        fsm.return %9
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_0 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_0 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.boolean_constant true
        verif.assert %39 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_1 = hw.constant true
        %5 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %4, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %2, %true_3 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %9 = ltl.boolean_constant true
        verif.assert %9 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_0 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_0 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.boolean_constant true
        verif.assert %39 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_25 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.boolean_constant true
      verif.assert %19 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %20 = comb.and %2, %15 : i1
      fsm.output %false_2, %false, %true_0, %false_3, %10, %11, %18, %false_1, %auto_ack_cnt_q, %false_4, %input_byte, %20, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_25 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_1 = hw.constant true
        %5 = comb.xor %0, %true_1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %2, %true_4 : i1
        %9 = comb.and %arg5, %8, %7, %6, %5 : i1
        %10 = ltl.boolean_constant true
        verif.assert %10 : !ltl.property
        fsm.return %9
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_0 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_0 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.boolean_constant true
        verif.assert %39 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_16 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_1 = hw.constant true
        %5 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %4, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %2, %true_3 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %9 = ltl.boolean_constant true
        verif.assert %9 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_0 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_0 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.boolean_constant true
        verif.assert %39 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %1, %true_2 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.boolean_constant true
        verif.assert %7 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_0 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_0 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.boolean_constant true
        verif.assert %39 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        %1 = ltl.boolean_constant true
        verif.assert %1 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_0 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_0 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.boolean_constant true
        verif.assert %39 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %2, %true_1 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.boolean_constant true
        verif.assert %7 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_0 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_0 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.boolean_constant true
        verif.assert %39 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_6 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %false = hw.constant false
      %c1_i16 = hw.constant 1 : i16
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %3 = comb.icmp eq %tcount_q, %c1_i16 : i16
      %4 = comb.and %2, %3 : i1
      %5 = comb.and %nack_transaction_q, %3 : i1
      %6 = comb.or %4, %5 : i1
      %7 = comb.xor %6, %true : i1
      %8 = comb.concat %false, %restart_det_q, %true, %input_byte : i1, i1, i1, i8
      %9 = comb.xor %3, %true : i1
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %10 = comb.and %2, %3 : i1
      %11 = comb.and %nack_transaction_q, %3 : i1
      %12 = comb.or %10, %11 : i1
      %13 = comb.xor %12, %true : i1
      %14 = comb.xor %12, %true_0 : i1
      %15 = comb.or %14, %7 : i1
      %16 = comb.xor %12, %true_1 : i1
      %17 = comb.and %12, %6 : i1
      %18 = comb.and %3, %15 : i1
      %19 = comb.or %9, %17 : i1
      %20 = comb.and %3, %13 : i1
      %21 = comb.or %9, %16, %6 : i1
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %22 = comb.and %3, %12 : i1
      %23 = comb.mux %22, %8, %c0_i11 : i11
      %24 = comb.or %9, %12 : i1
      %25 = comb.and %24, %nack_transaction_q : i1
      %26 = comb.or %arg4, %arg17 : i1
      %27 = comb.and %arg5, %26 : i1
      %28 = comb.or %nack_transaction_q, %arg17 : i1
      %29 = comb.concat %28, %c-2_i2, %input_byte : i1, i2, i8
      %30 = comb.xor %27, %true : i1
      %31 = comb.and %arg5, %arg3, %30 : i1
      %32 = comb.xor %31, %true : i1
      %33 = comb.mux %27, %29, %23 : i11
      %34 = comb.or %27, %31, %arg16 : i1
      %35 = comb.and %34, %xfer_for_us_q : i1
      %36 = comb.and %30, %32, %arg16 : i1
      %37 = comb.or %36, %25 : i1
      %38 = comb.and %30, %32, %arg16, %rw_bit_q : i1
      %39 = comb.and %27, %arg17, %rw_bit_q : i1
      %40 = comb.icmp ult %0, %c3_i7 : i7
      %false_4 = hw.constant false
      %41 = ltl.past %21, 1 : i1
      %42 = comb.xor %41, %true : i1
      %43 = comb.and bin %21, %42 : i1
      %44 = ltl.delay %21, 1, 0 : i1
      %45 = ltl.implication %43, %44 : i1, !ltl.sequence
      verif.assert %45 : !ltl.property
      %true_5 = hw.constant true
      verif.assert %true_5 : i1
      %46 = comb.and %2, %37 : i1
      %47 = comb.xor %40, %true : i1
      %48 = comb.and %2, %47 : i1
      %49 = comb.or %7, %48 : i1
      %50 = comb.and %3, %12, %6, %2, %47, %rw_bit_q : i1
      %51 = comb.and %3, %12, %49 : i1
      %52 = comb.mux %27, %xact_for_us_q, %51 : i1
      fsm.output %21, %18, %19, %false_2, %52, %33, %40, %20, %auto_ack_cnt_q, %false_3, %input_byte, %46, %35, %false_4, %1, %38, %39, %50 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_21 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.xor %nack_transaction_q, %true : i1
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %0, %c3_i7 : i7
        %6 = comb.xor %arg5, %true : i1
        %7 = comb.and %arg5, %arg3 : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %9 = comb.and %1, %2 : i1
        %10 = comb.and %nack_transaction_q, %2 : i1
        %true_1 = hw.constant true
        %11 = comb.and %1, %2 : i1
        %12 = comb.and %nack_transaction_q, %2 : i1
        %13 = comb.or %11, %12 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %2, %14 : i1
        %17 = comb.or %3, %15, %9, %10 : i1
        %18 = comb.xor %16, %true : i1
        %19 = comb.xor %5, %true : i1
        %20 = comb.and %19, %11 : i1
        %21 = comb.and %18, %6 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.and %8, %22, %4 : i1
        %24 = comb.and %22, %7 : i1
        %true_2 = hw.constant true
        %25 = comb.xor %20, %true_2 : i1
        %true_3 = hw.constant true
        %26 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %27 = comb.xor %23, %true_4 : i1
        %true_5 = hw.constant true
        %28 = comb.xor %24, %true_5 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %21, %true_6 : i1
        %30 = comb.and %29, %28, %27, %26, %25, %11, %5 : i1
        %31 = ltl.past %17, 1 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and bin %17, %32 : i1
        %34 = ltl.delay %17, 1, 0 : i1
        %35 = ltl.implication %33, %34 : i1, !ltl.sequence
        verif.assert %35 : !ltl.property
        fsm.return %30
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %30 = comb.sub %c-64_i7, %arg8 : i7
        %31 = comb.xor %nack_transaction_q, %true : i1
        %32 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %33 = comb.and %31, %32 : i1
        %34 = comb.and %nack_transaction_q, %32 : i1
        %35 = comb.or %33, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.xor %32, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_0 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_1 : i1
        %45 = comb.and %32, %43 : i1
        %46 = comb.and %32, %41 : i1
        %47 = comb.or %37, %44, %35 : i1
        %48 = comb.or %37, %40 : i1
        %49 = comb.and %48, %xact_for_us_q : i1
        %50 = comb.or %37, %40 : i1
        %51 = comb.mux %50, %auto_ack_cnt_q, %c0_i9 : i9
        %52 = comb.or %37, %40 : i1
        %53 = comb.and %52, %restart_det_q : i1
        %54 = comb.or %37, %40 : i1
        %55 = comb.and %54, %nack_transaction_q : i1
        %56 = comb.or %arg4, %arg17 : i1
        %57 = comb.and %arg5, %56 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.xor %57, %true : i1
        %60 = comb.and %arg5, %arg3, %59 : i1
        %61 = comb.xor %60, %true : i1
        %62 = comb.or %57, %61 : i1
        %63 = comb.mux %62, %53, %58 : i1
        %64 = comb.and %59, %61, %arg16 : i1
        %65 = comb.or %64, %55 : i1
        %66 = comb.icmp ult %30, %c3_i7 : i7
        %67 = ltl.past %47, 1 : i1
        %68 = comb.xor %67, %true : i1
        %69 = comb.and bin %47, %68 : i1
        %70 = ltl.delay %47, 1, 0 : i1
        %71 = ltl.implication %69, %70 : i1, !ltl.sequence
        verif.assert %71 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %49 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %65 : i1
        fsm.update %auto_ack_cnt_q, %51 : i9
        fsm.update %tcount_q, %1 : i16
        %72 = comb.and %arg3, %46 : i1
        %73 = comb.mux %72, %c0_i31, %stretch_active_cnt : i31
        %74 = comb.and %32, %40, %36, %66 : i1
        %75 = comb.mux %74, %2, %73 : i31
        %76 = comb.or %74, %72 : i1
        %77 = comb.mux bin %76, %75, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %77 : i31
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.xor %nack_transaction_q, %true : i1
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.and %1, %2 : i1
        %9 = comb.and %nack_transaction_q, %2 : i1
        %true_1 = hw.constant true
        %10 = comb.and %1, %2 : i1
        %11 = comb.and %nack_transaction_q, %2 : i1
        %12 = comb.or %10, %11 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %12, %true_1 : i1
        %15 = comb.and %2, %13 : i1
        %16 = comb.or %3, %14, %8, %9 : i1
        %17 = comb.xor %15, %true : i1
        %c2_i7 = hw.constant 2 : i7
        %18 = comb.icmp ugt %0, %c2_i7 : i7
        %19 = comb.and %17, %5 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %7, %20, %4 : i1
        %22 = comb.and %20, %6 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %rw_bit_q, %true_2 : i1
        %true_3 = hw.constant true
        %24 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %21, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %22, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %19, %true_6 : i1
        %28 = comb.and %27, %26, %25, %24, %18, %10, %23 : i1
        %29 = ltl.past %16, 1 : i1
        %30 = comb.xor %29, %true : i1
        %31 = comb.and bin %16, %30 : i1
        %32 = ltl.delay %16, 1, 0 : i1
        %33 = ltl.implication %31, %32 : i1, !ltl.sequence
        verif.assert %33 : !ltl.property
        fsm.return %28
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %30 = comb.sub %c-64_i7, %arg8 : i7
        %31 = comb.xor %nack_transaction_q, %true : i1
        %32 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %33 = comb.and %31, %32 : i1
        %34 = comb.and %nack_transaction_q, %32 : i1
        %35 = comb.or %33, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.xor %32, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_0 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_1 : i1
        %45 = comb.and %32, %43 : i1
        %46 = comb.and %32, %41 : i1
        %47 = comb.or %37, %44, %35 : i1
        %48 = comb.or %37, %40 : i1
        %49 = comb.and %48, %xact_for_us_q : i1
        %50 = comb.or %37, %40 : i1
        %51 = comb.mux %50, %auto_ack_cnt_q, %c0_i9 : i9
        %52 = comb.or %37, %40 : i1
        %53 = comb.and %52, %restart_det_q : i1
        %54 = comb.or %37, %40 : i1
        %55 = comb.and %54, %nack_transaction_q : i1
        %56 = comb.or %arg4, %arg17 : i1
        %57 = comb.and %arg5, %56 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.xor %57, %true : i1
        %60 = comb.and %arg5, %arg3, %59 : i1
        %61 = comb.xor %60, %true : i1
        %62 = comb.or %57, %61 : i1
        %63 = comb.mux %62, %53, %58 : i1
        %64 = comb.and %59, %61, %arg16 : i1
        %65 = comb.or %64, %55 : i1
        %66 = comb.icmp ult %30, %c3_i7 : i7
        %67 = ltl.past %47, 1 : i1
        %68 = comb.xor %67, %true : i1
        %69 = comb.and bin %47, %68 : i1
        %70 = ltl.delay %47, 1, 0 : i1
        %71 = ltl.implication %69, %70 : i1, !ltl.sequence
        verif.assert %71 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %49 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %65 : i1
        fsm.update %auto_ack_cnt_q, %51 : i9
        fsm.update %tcount_q, %1 : i16
        %72 = comb.and %arg3, %46 : i1
        %73 = comb.mux %72, %c0_i31, %stretch_active_cnt : i31
        %74 = comb.and %32, %40, %36, %66 : i1
        %75 = comb.mux %74, %2, %73 : i31
        %76 = comb.or %74, %72 : i1
        %77 = comb.mux bin %76, %75, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %77 : i31
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.xor %nack_transaction_q, %true : i1
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %0, %c3_i7 : i7
        %6 = comb.xor %arg5, %true : i1
        %7 = comb.and %arg5, %arg3 : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %9 = comb.and %1, %2 : i1
        %10 = comb.and %nack_transaction_q, %2 : i1
        %true_1 = hw.constant true
        %11 = comb.and %1, %2 : i1
        %12 = comb.and %nack_transaction_q, %2 : i1
        %13 = comb.or %11, %12 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %2, %14 : i1
        %17 = comb.or %3, %15, %9, %10 : i1
        %18 = comb.xor %16, %true : i1
        %19 = comb.and %11, %5 : i1
        %20 = comb.xor %5, %true : i1
        %21 = comb.and %20, %11 : i1
        %22 = comb.and %18, %6 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %8, %23, %4 : i1
        %25 = comb.and %23, %7 : i1
        %true_2 = hw.constant true
        %26 = comb.xor %19, %true_2 : i1
        %true_3 = hw.constant true
        %27 = comb.xor %21, %true_3 : i1
        %28 = comb.and %27, %26, %12 : i1
        %29 = comb.or %arg16, %28 : i1
        %true_4 = hw.constant true
        %30 = comb.xor %24, %true_4 : i1
        %true_5 = hw.constant true
        %31 = comb.xor %25, %true_5 : i1
        %true_6 = hw.constant true
        %32 = comb.xor %22, %true_6 : i1
        %33 = comb.and %32, %31, %30, %29 : i1
        %34 = ltl.past %17, 1 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.and bin %17, %35 : i1
        %37 = ltl.delay %17, 1, 0 : i1
        %38 = ltl.implication %36, %37 : i1, !ltl.sequence
        verif.assert %38 : !ltl.property
        fsm.return %33
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %30 = comb.sub %c-64_i7, %arg8 : i7
        %31 = comb.xor %nack_transaction_q, %true : i1
        %32 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %33 = comb.and %31, %32 : i1
        %34 = comb.and %nack_transaction_q, %32 : i1
        %35 = comb.or %33, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.xor %32, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_0 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_1 : i1
        %45 = comb.and %32, %43 : i1
        %46 = comb.and %32, %41 : i1
        %47 = comb.or %37, %44, %35 : i1
        %48 = comb.or %37, %40 : i1
        %49 = comb.and %48, %xact_for_us_q : i1
        %50 = comb.or %37, %40 : i1
        %51 = comb.mux %50, %auto_ack_cnt_q, %c0_i9 : i9
        %52 = comb.or %37, %40 : i1
        %53 = comb.and %52, %restart_det_q : i1
        %54 = comb.or %37, %40 : i1
        %55 = comb.and %54, %nack_transaction_q : i1
        %56 = comb.or %arg4, %arg17 : i1
        %57 = comb.and %arg5, %56 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.xor %57, %true : i1
        %60 = comb.and %arg5, %arg3, %59 : i1
        %61 = comb.xor %60, %true : i1
        %62 = comb.or %57, %61 : i1
        %63 = comb.mux %62, %53, %58 : i1
        %64 = comb.and %59, %61, %arg16 : i1
        %65 = comb.or %64, %55 : i1
        %66 = comb.icmp ult %30, %c3_i7 : i7
        %67 = ltl.past %47, 1 : i1
        %68 = comb.xor %67, %true : i1
        %69 = comb.and bin %47, %68 : i1
        %70 = ltl.delay %47, 1, 0 : i1
        %71 = ltl.implication %69, %70 : i1, !ltl.sequence
        verif.assert %71 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %49 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %65 : i1
        fsm.update %auto_ack_cnt_q, %51 : i9
        fsm.update %tcount_q, %1 : i16
        %72 = comb.and %arg3, %46 : i1
        %73 = comb.mux %72, %c0_i31, %stretch_active_cnt : i31
        %74 = comb.and %32, %40, %36, %66 : i1
        %75 = comb.mux %74, %2, %73 : i31
        %76 = comb.or %74, %72 : i1
        %77 = comb.mux bin %76, %75, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %77 : i31
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.xor %nack_transaction_q, %true : i1
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.xor %arg5, %true : i1
        %6 = comb.and %arg5, %arg3 : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %8 = comb.and %1, %2 : i1
        %9 = comb.and %nack_transaction_q, %2 : i1
        %true_1 = hw.constant true
        %10 = comb.and %1, %2 : i1
        %11 = comb.and %nack_transaction_q, %2 : i1
        %12 = comb.or %10, %11 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %12, %true_1 : i1
        %15 = comb.and %2, %13 : i1
        %16 = comb.or %3, %14, %8, %9 : i1
        %17 = comb.xor %15, %true : i1
        %c2_i7 = hw.constant 2 : i7
        %18 = comb.icmp ugt %0, %c2_i7 : i7
        %19 = comb.and %17, %5 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %7, %20, %4 : i1
        %22 = comb.and %20, %6 : i1
        %true_2 = hw.constant true
        %23 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %24 = comb.xor %21, %true_3 : i1
        %true_4 = hw.constant true
        %25 = comb.xor %22, %true_4 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %19, %true_5 : i1
        %27 = comb.and %26, %25, %24, %23, %18, %10, %rw_bit_q : i1
        %28 = ltl.past %16, 1 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.and bin %16, %29 : i1
        %31 = ltl.delay %16, 1, 0 : i1
        %32 = ltl.implication %30, %31 : i1, !ltl.sequence
        verif.assert %32 : !ltl.property
        fsm.return %27
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %30 = comb.sub %c-64_i7, %arg8 : i7
        %31 = comb.xor %nack_transaction_q, %true : i1
        %32 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %33 = comb.and %31, %32 : i1
        %34 = comb.and %nack_transaction_q, %32 : i1
        %35 = comb.or %33, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.xor %32, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_0 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_1 : i1
        %45 = comb.and %32, %43 : i1
        %46 = comb.and %32, %41 : i1
        %47 = comb.or %37, %44, %35 : i1
        %48 = comb.or %37, %40 : i1
        %49 = comb.and %48, %xact_for_us_q : i1
        %50 = comb.or %37, %40 : i1
        %51 = comb.mux %50, %auto_ack_cnt_q, %c0_i9 : i9
        %52 = comb.or %37, %40 : i1
        %53 = comb.and %52, %restart_det_q : i1
        %54 = comb.or %37, %40 : i1
        %55 = comb.and %54, %nack_transaction_q : i1
        %56 = comb.or %arg4, %arg17 : i1
        %57 = comb.and %arg5, %56 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.xor %57, %true : i1
        %60 = comb.and %arg5, %arg3, %59 : i1
        %61 = comb.xor %60, %true : i1
        %62 = comb.or %57, %61 : i1
        %63 = comb.mux %62, %53, %58 : i1
        %64 = comb.and %59, %61, %arg16 : i1
        %65 = comb.or %64, %55 : i1
        %66 = comb.icmp ult %30, %c3_i7 : i7
        %67 = ltl.past %47, 1 : i1
        %68 = comb.xor %67, %true : i1
        %69 = comb.and bin %47, %68 : i1
        %70 = ltl.delay %47, 1, 0 : i1
        %71 = ltl.implication %69, %70 : i1, !ltl.sequence
        verif.assert %71 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %49 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %65 : i1
        fsm.update %auto_ack_cnt_q, %51 : i9
        fsm.update %tcount_q, %1 : i16
        %72 = comb.and %arg3, %46 : i1
        %73 = comb.mux %72, %c0_i31, %stretch_active_cnt : i31
        %74 = comb.and %32, %40, %36, %66 : i1
        %75 = comb.mux %74, %2, %73 : i31
        %76 = comb.or %74, %72 : i1
        %77 = comb.mux bin %76, %75, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %77 : i31
      }
      fsm.transition @state_6 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %nack_transaction_q, %true : i1
        %1 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %2 = comb.xor %1, %true : i1
        %3 = comb.or %arg4, %arg17 : i1
        %4 = comb.xor %arg5, %true : i1
        %5 = comb.and %arg5, %arg3 : i1
        %6 = comb.xor %5, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %7 = comb.and %0, %1 : i1
        %8 = comb.and %nack_transaction_q, %1 : i1
        %true_1 = hw.constant true
        %9 = comb.and %0, %1 : i1
        %10 = comb.and %nack_transaction_q, %1 : i1
        %11 = comb.or %9, %10 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.xor %11, %true_1 : i1
        %14 = comb.and %1, %12 : i1
        %15 = comb.or %2, %13, %7, %8 : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %16, %4 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.and %6, %18, %3 : i1
        %20 = comb.and %18, %5 : i1
        %true_2 = hw.constant true
        %21 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %22 = comb.xor %19, %true_3 : i1
        %true_4 = hw.constant true
        %23 = comb.xor %20, %true_4 : i1
        %true_5 = hw.constant true
        %24 = comb.xor %17, %true_5 : i1
        %25 = comb.and %24, %23, %22, %21, %2 : i1
        %26 = ltl.past %15, 1 : i1
        %27 = comb.xor %26, %true : i1
        %28 = comb.and bin %15, %27 : i1
        %29 = ltl.delay %15, 1, 0 : i1
        %30 = ltl.implication %28, %29 : i1, !ltl.sequence
        verif.assert %30 : !ltl.property
        fsm.return %25
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %30 = comb.sub %c-64_i7, %arg8 : i7
        %31 = comb.xor %nack_transaction_q, %true : i1
        %32 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %33 = comb.and %31, %32 : i1
        %34 = comb.and %nack_transaction_q, %32 : i1
        %35 = comb.or %33, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.xor %32, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_0 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_1 : i1
        %45 = comb.and %32, %43 : i1
        %46 = comb.and %32, %41 : i1
        %47 = comb.or %37, %44, %35 : i1
        %48 = comb.or %37, %40 : i1
        %49 = comb.and %48, %xact_for_us_q : i1
        %50 = comb.or %37, %40 : i1
        %51 = comb.mux %50, %auto_ack_cnt_q, %c0_i9 : i9
        %52 = comb.or %37, %40 : i1
        %53 = comb.and %52, %restart_det_q : i1
        %54 = comb.or %37, %40 : i1
        %55 = comb.and %54, %nack_transaction_q : i1
        %56 = comb.or %arg4, %arg17 : i1
        %57 = comb.and %arg5, %56 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.xor %57, %true : i1
        %60 = comb.and %arg5, %arg3, %59 : i1
        %61 = comb.xor %60, %true : i1
        %62 = comb.or %57, %61 : i1
        %63 = comb.mux %62, %53, %58 : i1
        %64 = comb.and %59, %61, %arg16 : i1
        %65 = comb.or %64, %55 : i1
        %66 = comb.icmp ult %30, %c3_i7 : i7
        %67 = ltl.past %47, 1 : i1
        %68 = comb.xor %67, %true : i1
        %69 = comb.and bin %47, %68 : i1
        %70 = ltl.delay %47, 1, 0 : i1
        %71 = ltl.implication %69, %70 : i1, !ltl.sequence
        verif.assert %71 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %49 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %65 : i1
        fsm.update %auto_ack_cnt_q, %51 : i9
        fsm.update %tcount_q, %1 : i16
        %72 = comb.and %arg3, %46 : i1
        %73 = comb.mux %72, %c0_i31, %stretch_active_cnt : i31
        %74 = comb.and %32, %40, %36, %66 : i1
        %75 = comb.mux %74, %2, %73 : i31
        %76 = comb.or %74, %72 : i1
        %77 = comb.mux bin %76, %75, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %77 : i31
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %nack_transaction_q, %true : i1
        %1 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %arg5, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %4 = comb.and %0, %1 : i1
        %5 = comb.and %nack_transaction_q, %1 : i1
        %true_1 = hw.constant true
        %6 = comb.and %0, %1 : i1
        %7 = comb.and %nack_transaction_q, %1 : i1
        %8 = comb.or %6, %7 : i1
        %9 = comb.xor %8, %true : i1
        %10 = comb.xor %8, %true_1 : i1
        %11 = comb.and %1, %9 : i1
        %12 = comb.or %2, %10, %4, %5 : i1
        %13 = comb.xor %11, %true : i1
        %14 = comb.and %13, %3 : i1
        %15 = comb.xor %14, %true : i1
        %true_2 = hw.constant true
        %16 = comb.xor %14, %true_2 : i1
        %17 = comb.and %16, %15, %arg5, %arg3 : i1
        %18 = ltl.past %12, 1 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.and bin %12, %19 : i1
        %21 = ltl.delay %12, 1, 0 : i1
        %22 = ltl.implication %20, %21 : i1, !ltl.sequence
        verif.assert %22 : !ltl.property
        fsm.return %17
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %30 = comb.sub %c-64_i7, %arg8 : i7
        %31 = comb.xor %nack_transaction_q, %true : i1
        %32 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %33 = comb.and %31, %32 : i1
        %34 = comb.and %nack_transaction_q, %32 : i1
        %35 = comb.or %33, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.xor %32, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_0 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_1 : i1
        %45 = comb.and %32, %43 : i1
        %46 = comb.and %32, %41 : i1
        %47 = comb.or %37, %44, %35 : i1
        %48 = comb.or %37, %40 : i1
        %49 = comb.and %48, %xact_for_us_q : i1
        %50 = comb.or %37, %40 : i1
        %51 = comb.mux %50, %auto_ack_cnt_q, %c0_i9 : i9
        %52 = comb.or %37, %40 : i1
        %53 = comb.and %52, %restart_det_q : i1
        %54 = comb.or %37, %40 : i1
        %55 = comb.and %54, %nack_transaction_q : i1
        %56 = comb.or %arg4, %arg17 : i1
        %57 = comb.and %arg5, %56 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.xor %57, %true : i1
        %60 = comb.and %arg5, %arg3, %59 : i1
        %61 = comb.xor %60, %true : i1
        %62 = comb.or %57, %61 : i1
        %63 = comb.mux %62, %53, %58 : i1
        %64 = comb.and %59, %61, %arg16 : i1
        %65 = comb.or %64, %55 : i1
        %66 = comb.icmp ult %30, %c3_i7 : i7
        %67 = ltl.past %47, 1 : i1
        %68 = comb.xor %67, %true : i1
        %69 = comb.and bin %47, %68 : i1
        %70 = ltl.delay %47, 1, 0 : i1
        %71 = ltl.implication %69, %70 : i1, !ltl.sequence
        verif.assert %71 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %49 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %65 : i1
        fsm.update %auto_ack_cnt_q, %51 : i9
        fsm.update %tcount_q, %1 : i16
        %72 = comb.and %arg3, %46 : i1
        %73 = comb.mux %72, %c0_i31, %stretch_active_cnt : i31
        %74 = comb.and %32, %40, %36, %66 : i1
        %75 = comb.mux %74, %2, %73 : i31
        %76 = comb.or %74, %72 : i1
        %77 = comb.mux bin %76, %75, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %77 : i31
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.sub %c-64_i7, %arg8 : i7
        %1 = comb.xor %nack_transaction_q, %true : i1
        %2 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %3 = comb.xor %2, %true : i1
        %4 = comb.or %arg4, %arg17 : i1
        %5 = comb.icmp ult %0, %c3_i7 : i7
        %6 = comb.xor %arg5, %true : i1
        %7 = comb.and %arg5, %arg3 : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %9 = comb.and %1, %2 : i1
        %10 = comb.and %nack_transaction_q, %2 : i1
        %true_1 = hw.constant true
        %11 = comb.and %1, %2 : i1
        %12 = comb.and %nack_transaction_q, %2 : i1
        %13 = comb.or %11, %12 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %13, %true_1 : i1
        %16 = comb.and %2, %14 : i1
        %17 = comb.or %3, %15, %9, %10 : i1
        %18 = comb.xor %16, %true : i1
        %19 = comb.and %11, %5 : i1
        %20 = comb.xor %5, %true : i1
        %21 = comb.and %20, %11 : i1
        %22 = comb.and %18, %6 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %8, %23, %4 : i1
        %25 = comb.and %23, %7 : i1
        %true_2 = hw.constant true
        %26 = comb.xor %12, %true_2 : i1
        %true_3 = hw.constant true
        %27 = comb.xor %19, %true_3 : i1
        %true_4 = hw.constant true
        %28 = comb.xor %21, %true_4 : i1
        %true_5 = hw.constant true
        %29 = comb.xor %arg16, %true_5 : i1
        %30 = comb.and %29, %2, %28, %27, %26 : i1
        %31 = comb.or %24, %30 : i1
        %true_6 = hw.constant true
        %32 = comb.xor %25, %true_6 : i1
        %33 = comb.and %32, %31 : i1
        %34 = comb.or %22, %33 : i1
        %35 = ltl.past %17, 1 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.and bin %17, %36 : i1
        %38 = ltl.delay %17, 1, 0 : i1
        %39 = ltl.implication %37, %38 : i1, !ltl.sequence
        verif.assert %39 : !ltl.property
        fsm.return %34
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %3 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %4 = comb.xor %arg1, %true : i1
        %5 = comb.and %scl_i_q, %4 : i1
        %6 = comb.add %bit_idx, %c1_i4 : i4
        %7 = comb.xor %arg3, %true : i1
        %8 = comb.or %arg3, %5 : i1
        %9 = comb.mux %8, %c0_i4, %bit_idx : i4
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %10, %5, %7 : i1
        %12 = comb.mux %11, %6, %9 : i4
        %13 = comb.xor %scl_i_q, %true : i1
        %14 = comb.and %13, %arg1 : i1
        %15 = comb.xor %3, %true : i1
        %16 = comb.extract %input_byte from 0 : (i8) -> i7
        %17 = comb.concat %16, %arg2 : i7, i1
        %18 = comb.and %15, %14 : i1
        %19 = comb.mux %18, %17, %c0_i8 : i8
        %20 = comb.and %14, %3 : i1
        %21 = comb.xor %14, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.mux bin %22, %input_byte, %19 : i8
        %24 = comb.xor %arg2, %true : i1
        %25 = comb.and %14, %15 : i1
        %26 = comb.xor %25, %true : i1
        %27 = comb.and %14, %26, %24 : i1
        %28 = comb.and %14, %26 : i1
        %29 = comb.mux bin %28, %27, %host_ack : i1
        %30 = comb.sub %c-64_i7, %arg8 : i7
        %31 = comb.xor %nack_transaction_q, %true : i1
        %32 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %33 = comb.and %31, %32 : i1
        %34 = comb.and %nack_transaction_q, %32 : i1
        %35 = comb.or %33, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.xor %32, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_0 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_1 : i1
        %45 = comb.and %32, %43 : i1
        %46 = comb.and %32, %41 : i1
        %47 = comb.or %37, %44, %35 : i1
        %48 = comb.or %37, %40 : i1
        %49 = comb.and %48, %xact_for_us_q : i1
        %50 = comb.or %37, %40 : i1
        %51 = comb.mux %50, %auto_ack_cnt_q, %c0_i9 : i9
        %52 = comb.or %37, %40 : i1
        %53 = comb.and %52, %restart_det_q : i1
        %54 = comb.or %37, %40 : i1
        %55 = comb.and %54, %nack_transaction_q : i1
        %56 = comb.or %arg4, %arg17 : i1
        %57 = comb.and %arg5, %56 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.xor %57, %true : i1
        %60 = comb.and %arg5, %arg3, %59 : i1
        %61 = comb.xor %60, %true : i1
        %62 = comb.or %57, %61 : i1
        %63 = comb.mux %62, %53, %58 : i1
        %64 = comb.and %59, %61, %arg16 : i1
        %65 = comb.or %64, %55 : i1
        %66 = comb.icmp ult %30, %c3_i7 : i7
        %67 = ltl.past %47, 1 : i1
        %68 = comb.xor %67, %true : i1
        %69 = comb.and bin %47, %68 : i1
        %70 = ltl.delay %47, 1, 0 : i1
        %71 = ltl.implication %69, %70 : i1, !ltl.sequence
        verif.assert %71 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %49 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %65 : i1
        fsm.update %auto_ack_cnt_q, %51 : i9
        fsm.update %tcount_q, %1 : i16
        %72 = comb.and %arg3, %46 : i1
        %73 = comb.mux %72, %c0_i31, %stretch_active_cnt : i31
        %74 = comb.and %32, %40, %36, %66 : i1
        %75 = comb.mux %74, %2, %73 : i31
        %76 = comb.or %74, %72 : i1
        %77 = comb.mux bin %76, %75, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %77 : i31
      }
    }
    fsm.state @state_9 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %true_0 = hw.constant true
      %false = hw.constant false
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_5 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_6 = hw.constant true
      verif.assert %true_6 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %sda_q, %true_0, %false_2, %10, %11, %18, %false, %auto_ack_cnt_q, %false_3, %input_byte, %23, %13, %false_5, %1, %16, %17, %false_4 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg1, %true_3 : i1
        %45 = comb.or %39, %arg5 : i1
        %46 = comb.mux %45, %c1_i16, %tcount_q : i16
        %47 = comb.and %44, %39 : i1
        %48 = comb.mux %47, %0, %46 : i16
        %49 = comb.and %arg5, %arg1 : i1
        %50 = comb.mux %49, %1, %48 : i16
        fsm.update %tcount_q, %50 : i16
      }
      fsm.transition @state_10 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %1, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %1, %true_4 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
    }
    fsm.state @state_23 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i5 = hw.constant 0 : i5
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.extract %arg7 from 0 : (i8) -> i1
      %2 = comb.extract %arg7 from 1 : (i8) -> i1
      %3 = comb.extract %arg7 from 2 : (i8) -> i1
      %4 = comb.extract %arg7 from 3 : (i8) -> i1
      %5 = comb.extract %arg7 from 4 : (i8) -> i1
      %6 = comb.extract %arg7 from 5 : (i8) -> i1
      %7 = comb.extract %arg7 from 6 : (i8) -> i1
      %8 = comb.extract %arg7 from 7 : (i8) -> i1
      %9 = comb.concat %1, %2, %3, %4, %5, %6, %7, %8 : i1, i1, i1, i1, i1, i1, i1, i1
      %10 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %11 = comb.xor %nack_transaction_q, %true : i1
      %12 = comb.extract %bit_idx from 0 : (i4) -> i3
      %13 = comb.concat %c0_i5, %12 : i5, i3
      %14 = comb.shru %9, %13 : i8
      %15 = comb.extract %14 from 0 : (i8) -> i1
      %true_0 = hw.constant true
      %false = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %16 = comb.or %arg4, %arg17 : i1
      %17 = comb.and %arg5, %16 : i1
      %18 = comb.or %nack_transaction_q, %arg17 : i1
      %19 = comb.concat %18, %c-2_i2, %input_byte : i1, i2, i8
      %20 = comb.xor %17, %true : i1
      %21 = comb.and %arg5, %arg3, %20 : i1
      %22 = comb.xor %21, %true : i1
      %23 = comb.and %17, %xact_for_us_q : i1
      %24 = comb.mux %17, %19, %c0_i11 : i11
      %25 = comb.or %17, %21, %arg16 : i1
      %26 = comb.and %25, %xfer_for_us_q : i1
      %27 = comb.and %20, %22, %arg16 : i1
      %28 = comb.or %27, %nack_transaction_q : i1
      %29 = comb.and %20, %22, %arg16, %rw_bit_q : i1
      %30 = comb.and %17, %arg17, %rw_bit_q : i1
      %31 = comb.icmp ult %0, %c3_i7 : i7
      %false_5 = hw.constant false
      %32 = ltl.boolean_constant true
      verif.assert %32 : !ltl.property
      %true_6 = hw.constant true
      verif.assert %true_6 : i1
      %33 = comb.and %11, %28 : i1
      fsm.output %false_1, %15, %true_0, %false_2, %23, %24, %31, %false, %auto_ack_cnt_q, %false_3, %input_byte, %33, %26, %false_5, %10, %29, %30, %false_4 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_1 = hw.constant true
        %5 = comb.xor %0, %true_1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %2, %true_4 : i1
        %9 = comb.and %arg5, %8, %7, %6, %5 : i1
        %10 = ltl.boolean_constant true
        verif.assert %10 : !ltl.property
        fsm.return %9
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.extract %arg7 from 0 : (i8) -> i1
        %30 = comb.extract %arg7 from 1 : (i8) -> i1
        %31 = comb.extract %arg7 from 2 : (i8) -> i1
        %32 = comb.extract %arg7 from 3 : (i8) -> i1
        %33 = comb.extract %arg7 from 4 : (i8) -> i1
        %34 = comb.extract %arg7 from 5 : (i8) -> i1
        %35 = comb.extract %arg7 from 6 : (i8) -> i1
        %36 = comb.extract %arg7 from 7 : (i8) -> i1
        %37 = comb.concat %29, %30, %31, %32, %33, %34, %35, %36 : i1, i1, i1, i1, i1, i1, i1, i1
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_0 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_0 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = ltl.boolean_constant true
        verif.assert %52 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %41 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        fsm.update %nack_transaction_q, %51 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %1, %true_2 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.boolean_constant true
        verif.assert %7 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.extract %arg7 from 0 : (i8) -> i1
        %30 = comb.extract %arg7 from 1 : (i8) -> i1
        %31 = comb.extract %arg7 from 2 : (i8) -> i1
        %32 = comb.extract %arg7 from 3 : (i8) -> i1
        %33 = comb.extract %arg7 from 4 : (i8) -> i1
        %34 = comb.extract %arg7 from 5 : (i8) -> i1
        %35 = comb.extract %arg7 from 6 : (i8) -> i1
        %36 = comb.extract %arg7 from 7 : (i8) -> i1
        %37 = comb.concat %29, %30, %31, %32, %33, %34, %35, %36 : i1, i1, i1, i1, i1, i1, i1, i1
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_0 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_0 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = ltl.boolean_constant true
        verif.assert %52 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %41 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        fsm.update %nack_transaction_q, %51 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_1 = hw.constant true
        %5 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %4, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %2, %true_3 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %9 = ltl.boolean_constant true
        verif.assert %9 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.extract %arg7 from 0 : (i8) -> i1
        %30 = comb.extract %arg7 from 1 : (i8) -> i1
        %31 = comb.extract %arg7 from 2 : (i8) -> i1
        %32 = comb.extract %arg7 from 3 : (i8) -> i1
        %33 = comb.extract %arg7 from 4 : (i8) -> i1
        %34 = comb.extract %arg7 from 5 : (i8) -> i1
        %35 = comb.extract %arg7 from 6 : (i8) -> i1
        %36 = comb.extract %arg7 from 7 : (i8) -> i1
        %37 = comb.concat %29, %30, %31, %32, %33, %34, %35, %36 : i1, i1, i1, i1, i1, i1, i1, i1
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_0 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_0 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = ltl.boolean_constant true
        verif.assert %52 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %41 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        fsm.update %nack_transaction_q, %51 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        %1 = ltl.boolean_constant true
        verif.assert %1 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.extract %arg7 from 0 : (i8) -> i1
        %30 = comb.extract %arg7 from 1 : (i8) -> i1
        %31 = comb.extract %arg7 from 2 : (i8) -> i1
        %32 = comb.extract %arg7 from 3 : (i8) -> i1
        %33 = comb.extract %arg7 from 4 : (i8) -> i1
        %34 = comb.extract %arg7 from 5 : (i8) -> i1
        %35 = comb.extract %arg7 from 6 : (i8) -> i1
        %36 = comb.extract %arg7 from 7 : (i8) -> i1
        %37 = comb.concat %29, %30, %31, %32, %33, %34, %35, %36 : i1, i1, i1, i1, i1, i1, i1, i1
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_0 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_0 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = ltl.boolean_constant true
        verif.assert %52 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %41 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        fsm.update %nack_transaction_q, %51 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %2, %true_1 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.boolean_constant true
        verif.assert %7 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.extract %arg7 from 0 : (i8) -> i1
        %30 = comb.extract %arg7 from 1 : (i8) -> i1
        %31 = comb.extract %arg7 from 2 : (i8) -> i1
        %32 = comb.extract %arg7 from 3 : (i8) -> i1
        %33 = comb.extract %arg7 from 4 : (i8) -> i1
        %34 = comb.extract %arg7 from 5 : (i8) -> i1
        %35 = comb.extract %arg7 from 6 : (i8) -> i1
        %36 = comb.extract %arg7 from 7 : (i8) -> i1
        %37 = comb.concat %29, %30, %31, %32, %33, %34, %35, %36 : i1, i1, i1, i1, i1, i1, i1, i1
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_0 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_0 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = ltl.boolean_constant true
        verif.assert %52 : !ltl.property
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %41 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        fsm.update %nack_transaction_q, %51 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_16 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_2, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_2, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_2, %false, %true_0, %false_3, %10, %11, %18, %false_1, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_17 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %1, %true_4 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_0, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_0, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_16 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg1, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %7 = comb.xor %1, %true_5 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_0, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_0, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_24 output {
      %true = hw.constant true
      %c0_i6 = hw.constant 0 : i6
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c0_i9 = hw.constant 0 : i9
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.xor %arg19, %true : i1
      %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
      %2 = comb.or %0, %1 : i1
      %3 = comb.sub %c-64_i7, %arg8 : i7
      %4 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %5 = comb.xor %nack_transaction_q, %true : i1
      %6 = comb.xor %2, %true : i1
      %7 = comb.and %arg22, %6 : i1
      %c-4_i3 = hw.constant -4 : i3
      %8 = comb.extract %3 from 1 : (i7) -> i6
      %9 = comb.icmp ne %8, %c0_i6 : i6
      %10 = comb.concat %c-4_i3, %input_byte : i3, i8
      %true_0 = hw.constant true
      %false = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %11 = comb.or %arg4, %arg17 : i1
      %12 = comb.and %arg5, %11 : i1
      %13 = comb.or %nack_transaction_q, %arg17 : i1
      %14 = comb.concat %13, %c-2_i2, %input_byte : i1, i2, i8
      %15 = comb.xor %12, %true : i1
      %16 = comb.and %arg5, %arg3, %15 : i1
      %17 = comb.xor %16, %true : i1
      %18 = comb.or %12, %16, %arg16 : i1
      %19 = comb.and %18, %xfer_for_us_q : i1
      %20 = comb.and %15, %17, %arg16 : i1
      %21 = comb.and %15, %17, %arg16, %rw_bit_q : i1
      %22 = comb.and %12, %arg17, %rw_bit_q : i1
      %23 = comb.icmp ult %3, %c3_i7 : i7
      %24 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
      %25 = comb.and %arg14, %24 : i1
      %false_3 = hw.constant false
      %true_4 = hw.constant true
      verif.assert %true_4 : i1
      %26 = comb.or %25, %7 : i1
      %27 = comb.xor %26, %true : i1
      %28 = comb.and %27, %nack_transaction_q : i1
      %29 = comb.xor %26, %true : i1
      %false_5 = hw.constant false
      %30 = comb.mux %29, %c0_i11, %10 : i11
      %false_6 = hw.constant false
      %31 = comb.and %26, %9 : i1
      %32 = comb.mux %12, %xact_for_us_q, %31 : i1
      %33 = comb.mux %12, %14, %30 : i11
      %34 = comb.or %20, %26, %28 : i1
      %35 = ltl.boolean_constant true
      verif.assert %35 : !ltl.property
      %36 = comb.and %5, %34 : i1
      fsm.output %false_5, %true_0, %false, %false_1, %32, %33, %23, %false_6, %auto_ack_cnt_q, %6, %input_byte, %36, %19, %false_3, %4, %21, %22, %false_2 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_25 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.sub %c-64_i7, %arg8 : i7
        %4 = comb.xor %2, %true : i1
        %5 = comb.and %arg22, %4 : i1
        %6 = comb.or %arg4, %arg17 : i1
        %7 = comb.icmp ult %3, %c3_i7 : i7
        %8 = comb.or %7, %4 : i1
        %9 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %10 = comb.and %arg14, %9 : i1
        %11 = comb.xor %arg5, %true : i1
        %12 = comb.and %arg5, %arg3 : i1
        %13 = comb.xor %12, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %14 = comb.or %10, %5 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %16, %14 : i1
        %18 = comb.and %16, %14 : i1
        %19 = comb.xor %18, %true : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.and %19, %11 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.and %13, %22, %6 : i1
        %24 = comb.and %22, %12 : i1
        %true_1 = hw.constant true
        %25 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %26 = comb.xor %23, %true_2 : i1
        %true_3 = hw.constant true
        %27 = comb.xor %24, %true_3 : i1
        %true_4 = hw.constant true
        %28 = comb.xor %21, %true_4 : i1
        %29 = comb.and %28, %27, %26, %25, %15, %20 : i1
        %30 = ltl.past %17, 1 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and bin %17, %31 : i1
        %33 = ltl.delay %17, 1, 0 : i1
        %34 = ltl.implication %32, %33 : i1, !ltl.sequence
        verif.assert %34 : !ltl.property
        fsm.return %29
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %37 = comb.and %arg22, %36 : i1
        %true_0 = hw.constant true
        %38 = comb.or %arg4, %arg17 : i1
        %39 = comb.and %arg5, %38 : i1
        %40 = comb.xor %39, %true : i1
        %41 = comb.and %arg5, %arg3, %40 : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %39, %42 : i1
        %44 = comb.and %40, %42, %arg16 : i1
        %45 = comb.icmp ult %35, %c3_i7 : i7
        %46 = comb.or %45, %36 : i1
        %47 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %48 = comb.and %arg14, %47 : i1
        %49 = comb.xor %46, %true : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %50 = comb.or %48, %37 : i1
        %51 = comb.or %36, %45 : i1
        %52 = comb.xor %50, %true : i1
        %53 = comb.and %52, %46 : i1
        %54 = comb.and %52, %nack_transaction_q : i1
        %55 = comb.xor %50, %true : i1
        %56 = comb.mux %50, %51, %53 : i1
        %57 = comb.and %55, %50 : i1
        %58 = comb.and %55, %50 : i1
        %59 = comb.xor %58, %true : i1
        %60 = comb.mux %43, %restart_det_q, %59 : i1
        %61 = comb.or %44, %50, %54 : i1
        %62 = comb.and %52, %49 : i1
        %63 = comb.or %50, %46 : i1
        %64 = ltl.past %57, 1 : i1
        %65 = comb.xor %64, %true : i1
        %66 = comb.and bin %57, %65 : i1
        %67 = ltl.delay %57, 1, 0 : i1
        %68 = ltl.implication %66, %67 : i1, !ltl.sequence
        verif.assert %68 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %60 : i1
        fsm.update %nack_transaction_q, %61 : i1
        %true_2 = hw.constant true
        %69 = comb.xor %63, %true_2 : i1
        %70 = comb.xor %62, %true : i1
        %71 = comb.or %62, %arg5 : i1
        %72 = comb.mux %71, %c1_i16, %tcount_q : i16
        %73 = comb.and %69, %62 : i1
        %74 = comb.mux %73, %2, %72 : i16
        %75 = comb.and %arg5, %70 : i1
        %76 = comb.mux %75, %3, %74 : i16
        %77 = comb.and %arg3, %58 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %56, %4, %78 : i31
        %80 = comb.or %56, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
        %82 = comb.and %arg20, %36 : i1
        %83 = comb.mux %82, %arg21, %auto_ack_cnt_q : i9
        fsm.update %auto_ack_cnt_q, %83 : i9
        fsm.update %stretch_active_cnt, %81 : i31
        fsm.update %tcount_q, %76 : i16
      }
      fsm.transition @state_24 guard {
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i9 = hw.constant 0 : i9
        %0 = comb.xor %arg19, %true : i1
        %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %2 = comb.or %0, %1 : i1
        %3 = comb.sub %c-64_i7, %arg8 : i7
        %4 = comb.xor %2, %true : i1
        %5 = comb.and %arg22, %4 : i1
        %6 = comb.or %arg4, %arg17 : i1
        %7 = comb.icmp ult %3, %c3_i7 : i7
        %8 = comb.or %7, %4 : i1
        %9 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %10 = comb.and %arg14, %9 : i1
        %11 = comb.and %arg5, %arg3 : i1
        %12 = comb.xor %11, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %13 = comb.or %10, %5 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.and %12, %arg5, %6 : i1
        %true_1 = hw.constant true
        %16 = comb.xor %arg16, %true_1 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %15, %true_2 : i1
        %true_3 = hw.constant true
        %18 = comb.xor %11, %true_3 : i1
        %19 = comb.and %arg5, %18, %17, %16, %14, %8 : i1
        %20 = ltl.boolean_constant true
        verif.assert %20 : !ltl.property
        fsm.return %19
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.xor %arg19, %true : i1
        %6 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %7 = comb.or %5, %6 : i1
        %8 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %9 = comb.xor %arg1, %true : i1
        %10 = comb.and %scl_i_q, %9 : i1
        %11 = comb.add %bit_idx, %c1_i4 : i4
        %12 = comb.xor %arg3, %true : i1
        %13 = comb.or %arg3, %10 : i1
        %14 = comb.mux %13, %c0_i4, %bit_idx : i4
        %15 = comb.xor %8, %true : i1
        %16 = comb.and %15, %10, %12 : i1
        %17 = comb.mux %16, %11, %14 : i4
        %18 = comb.xor %scl_i_q, %true : i1
        %19 = comb.and %18, %arg1 : i1
        %20 = comb.xor %8, %true : i1
        %21 = comb.extract %input_byte from 0 : (i8) -> i7
        %22 = comb.concat %21, %arg2 : i7, i1
        %23 = comb.and %20, %19 : i1
        %24 = comb.mux %23, %22, %c0_i8 : i8
        %25 = comb.and %19, %8 : i1
        %26 = comb.xor %19, %true : i1
        %27 = comb.or %26, %25 : i1
        %28 = comb.mux bin %27, %input_byte, %24 : i8
        %29 = comb.xor %arg2, %true : i1
        %30 = comb.and %19, %20 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %19, %31, %29 : i1
        %33 = comb.and %19, %31 : i1
        %34 = comb.mux bin %33, %32, %host_ack : i1
        %35 = comb.sub %c-64_i7, %arg8 : i7
        %36 = comb.xor %7, %true : i1
        %37 = comb.and %arg22, %36 : i1
        %true_0 = hw.constant true
        %38 = comb.or %arg4, %arg17 : i1
        %39 = comb.and %arg5, %38 : i1
        %40 = comb.xor %39, %true : i1
        %41 = comb.and %arg5, %arg3, %40 : i1
        %42 = comb.xor %41, %true : i1
        %43 = comb.or %39, %42 : i1
        %44 = comb.and %40, %42, %arg16 : i1
        %45 = comb.icmp ult %35, %c3_i7 : i7
        %46 = comb.or %45, %36 : i1
        %47 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %48 = comb.and %arg14, %47 : i1
        %49 = comb.xor %46, %true : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %50 = comb.or %48, %37 : i1
        %51 = comb.or %36, %45 : i1
        %52 = comb.xor %50, %true : i1
        %53 = comb.and %52, %46 : i1
        %54 = comb.and %52, %nack_transaction_q : i1
        %55 = comb.mux %50, %51, %53 : i1
        %true_2 = hw.constant true
        %56 = comb.xor %43, %true_2 : i1
        %57 = comb.or %56, %restart_det_q : i1
        %58 = comb.or %44, %50, %54 : i1
        %59 = comb.and %52, %49 : i1
        %60 = comb.or %50, %46 : i1
        %61 = ltl.boolean_constant true
        verif.assert %61 : !ltl.property
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %57 : i1
        fsm.update %nack_transaction_q, %58 : i1
        %true_3 = hw.constant true
        %62 = comb.xor %60, %true_3 : i1
        %63 = comb.xor %59, %true : i1
        %64 = comb.or %59, %arg5 : i1
        %65 = comb.mux %64, %c1_i16, %tcount_q : i16
        %66 = comb.and %62, %59 : i1
        %67 = comb.mux %66, %2, %65 : i16
        %68 = comb.and %arg5, %63 : i1
        %69 = comb.mux %68, %3, %67 : i16
        %70 = comb.mux bin %55, %4, %stretch_active_cnt : i31
        %71 = comb.and %arg20, %36 : i1
        %72 = comb.mux %71, %arg21, %auto_ack_cnt_q : i9
        fsm.update %auto_ack_cnt_q, %72 : i9
        fsm.update %stretch_active_cnt, %70 : i31
        fsm.update %tcount_q, %69 : i16
      }
    }
    fsm.state @state_10 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %true_0 = hw.constant true
      %false = hw.constant false
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_5 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_6 = hw.constant true
      verif.assert %true_6 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %sda_q, %true_0, %false_2, %10, %11, %18, %false, %auto_ack_cnt_q, %false_3, %input_byte, %23, %13, %false_5, %1, %16, %17, %false_4 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %false = hw.constant false
        %0 = ltl.past %true_1, 1 : i1
        %1 = comb.xor %0, %true : i1
        %2 = ltl.delay %true_1, 1, 0 : i1
        %3 = ltl.implication %1, %2 : i1, !ltl.sequence
        verif.assert %3 : !ltl.property
        fsm.return %false
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
      fsm.transition @state_11 guard {
        %true = hw.constant true
        %c-8_i4 = hw.constant -8 : i4
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %1 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %2 = comb.or %arg4, %arg17 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %5 = comb.mux %1, %0, %rw_bit_q : i1
        %6 = comb.and %4, %arg5, %2 : i1
        %true_2 = hw.constant true
        %7 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %8 = comb.xor %6, %true_3 : i1
        %true_4 = hw.constant true
        %9 = comb.xor %3, %true_4 : i1
        %10 = comb.and %arg5, %9, %8, %7, %1, %5 : i1
        %11 = ltl.past %true_1, 1 : i1
        %12 = comb.xor %11, %true : i1
        %13 = ltl.delay %true_1, 1, 0 : i1
        %14 = ltl.implication %12, %13 : i1, !ltl.sequence
        verif.assert %14 : !ltl.property
        fsm.return %10
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
      fsm.transition @state_10 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.and %3, %arg5, %1 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %2, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %c-8_i4 = hw.constant -8 : i4
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %1 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %2 = comb.or %arg4, %arg17 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %5 = comb.mux %1, %0, %rw_bit_q : i1
        %6 = comb.and %4, %arg5, %2 : i1
        %true_2 = hw.constant true
        %7 = comb.xor %5, %true_2 : i1
        %true_3 = hw.constant true
        %8 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %9 = comb.xor %6, %true_4 : i1
        %true_5 = hw.constant true
        %10 = comb.xor %3, %true_5 : i1
        %11 = comb.and %arg5, %10, %9, %8, %1, %7 : i1
        %12 = ltl.past %true_1, 1 : i1
        %13 = comb.xor %12, %true : i1
        %14 = ltl.delay %true_1, 1, 0 : i1
        %15 = ltl.implication %13, %14 : i1, !ltl.sequence
        verif.assert %15 : !ltl.property
        fsm.return %11
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %false = hw.constant false
        %0 = ltl.past %true_1, 1 : i1
        %1 = comb.xor %0, %true : i1
        %2 = ltl.delay %true_1, 1, 0 : i1
        %3 = ltl.implication %1, %2 : i1, !ltl.sequence
        verif.assert %3 : !ltl.property
        fsm.return %false
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %true_0 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_1 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_1 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %true_2 = hw.constant true
        %41 = comb.xor %40, %true_2 : i1
        %42 = comb.and %41, %29 : i1
        %43 = ltl.past %true_0, 1 : i1
        %44 = comb.xor %43, %true : i1
        %45 = ltl.delay %true_0, 1, 0 : i1
        %46 = ltl.implication %44, %45 : i1, !ltl.sequence
        verif.assert %46 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %sda_q : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %true_4 = hw.constant true
        %47 = comb.xor %40, %true_4 : i1
        %48 = comb.xor %42, %true : i1
        %49 = comb.or %42, %arg5 : i1
        %50 = comb.mux %49, %c1_i16, %tcount_q : i16
        %51 = comb.and %47, %42 : i1
        %52 = comb.mux %51, %0, %50 : i16
        %53 = comb.and %arg5, %48 : i1
        %54 = comb.mux %53, %1, %52 : i16
        fsm.update %tcount_q, %54 : i16
      }
    }
    fsm.state @state_17 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_2, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_2, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_2, %false, %true_0, %false_3, %10, %11, %18, %false_1, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_18 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %1, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %true_3 = hw.constant true
        %44 = comb.xor %arg1, %true_3 : i1
        %45 = comb.or %39, %arg5 : i1
        %46 = comb.mux %45, %c1_i16, %tcount_q : i16
        %47 = comb.and %44, %39 : i1
        %48 = comb.mux %47, %0, %46 : i16
        %49 = comb.and %arg5, %arg1 : i1
        %50 = comb.mux %49, %1, %48 : i16
        fsm.update %tcount_q, %50 : i16
      }
      fsm.transition @state_17 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %1, %true_4 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_1 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_1 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %arg1, %true : i1
        %40 = ltl.past %true_0, 1 : i1
        %41 = comb.xor %40, %true : i1
        %42 = ltl.delay %true_0, 1, 0 : i1
        %43 = ltl.implication %41, %42 : i1, !ltl.sequence
        verif.assert %43 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        %44 = comb.or %39, %arg5 : i1
        %45 = comb.mux %44, %c1_i16, %tcount_q : i16
        %46 = comb.mux %arg1, %45, %0 : i16
        %47 = comb.and %arg5, %arg1 : i1
        %48 = comb.mux %47, %1, %46 : i16
        fsm.update %tcount_q, %48 : i16
      }
    }
    fsm.state @state_11 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %3 = comb.or %arg4, %arg17 : i1
      %4 = comb.and %arg5, %3 : i1
      %5 = comb.or %nack_transaction_q, %arg17 : i1
      %6 = comb.concat %5, %c-2_i2, %input_byte : i1, i2, i8
      %7 = comb.xor %4, %true : i1
      %8 = comb.and %arg5, %arg3, %7 : i1
      %9 = comb.xor %8, %true : i1
      %10 = comb.and %4, %xact_for_us_q : i1
      %11 = comb.mux %4, %6, %c0_i11 : i11
      %12 = comb.or %4, %8, %arg16 : i1
      %13 = comb.and %12, %xfer_for_us_q : i1
      %14 = comb.and %7, %9, %arg16 : i1
      %15 = comb.or %14, %nack_transaction_q : i1
      %16 = comb.and %7, %9, %arg16, %rw_bit_q : i1
      %17 = comb.and %4, %arg17, %rw_bit_q : i1
      %18 = comb.icmp ult %0, %c3_i7 : i7
      %false_6 = hw.constant false
      %19 = ltl.past %true_1, 1 : i1
      %20 = comb.xor %19, %true : i1
      %21 = ltl.delay %true_1, 1, 0 : i1
      %22 = ltl.implication %20, %21 : i1, !ltl.sequence
      verif.assert %22 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %23 = comb.and %2, %15 : i1
      fsm.output %true_1, %true_0, %false_2, %false_3, %10, %11, %18, %false, %auto_ack_cnt_q, %false_4, %input_byte, %23, %13, %false_6, %1, %16, %17, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %1, %true_4 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_11 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg1, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %7 = comb.xor %1, %true_5 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_18 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i3 = hw.constant 0 : i3
      %c0_i11 = hw.constant 0 : i11
      %c0_i9 = hw.constant 0 : i9
      %c1_i16 = hw.constant 1 : i16
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.xor %arg19, %true : i1
      %1 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
      %2 = comb.or %0, %1 : i1
      %3 = comb.sub %c-64_i7, %arg8 : i7
      %4 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %5 = comb.xor %nack_transaction_q, %true : i1
      %6 = comb.icmp eq %tcount_q, %c1_i16 : i16
      %7 = comb.concat %c0_i3, %input_byte : i3, i8
      %8 = comb.xor %2, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %9 = comb.mux %6, %7, %c0_i11 : i11
      %false_1 = hw.constant false
      %true_2 = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %10 = comb.or %arg4, %arg17 : i1
      %11 = comb.and %arg5, %10 : i1
      %12 = comb.or %nack_transaction_q, %arg17 : i1
      %13 = comb.concat %12, %c-2_i2, %input_byte : i1, i2, i8
      %14 = comb.xor %11, %true : i1
      %15 = comb.and %arg5, %arg3, %14 : i1
      %16 = comb.xor %15, %true : i1
      %17 = comb.mux %11, %13, %9 : i11
      %18 = comb.or %11, %15, %arg16 : i1
      %19 = comb.and %18, %xfer_for_us_q : i1
      %20 = comb.and %14, %16, %arg16 : i1
      %21 = comb.or %20, %nack_transaction_q : i1
      %22 = comb.and %14, %16, %arg16, %rw_bit_q : i1
      %23 = comb.and %11, %arg17, %rw_bit_q : i1
      %24 = comb.icmp ult %3, %c3_i7 : i7
      %25 = comb.or %24, %8 : i1
      %false_6 = hw.constant false
      %26 = ltl.past %true_2, 1 : i1
      %27 = comb.xor %26, %true : i1
      %28 = ltl.delay %true_2, 1, 0 : i1
      %29 = ltl.implication %27, %28 : i1, !ltl.sequence
      verif.assert %29 : !ltl.property
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %30 = comb.and %5, %21 : i1
      %31 = comb.xor %25, %true : i1
      %32 = comb.and %6, %31 : i1
      %33 = comb.mux %11, %xact_for_us_q, %32 : i1
      fsm.output %true_2, %false, %true_0, %false_3, %33, %17, %24, %false_1, %auto_ack_cnt_q, %false_4, %input_byte, %30, %19, %false_6, %4, %22, %23, %false_5 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_18 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.and %3, %arg5, %1 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %0, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %4, %true_4 : i1
        %true_5 = hw.constant true
        %8 = comb.xor %2, %true_5 : i1
        %9 = comb.and %arg5, %8, %7, %6, %5 : i1
        %10 = ltl.past %true_1, 1 : i1
        %11 = comb.xor %10, %true : i1
        %12 = ltl.delay %true_1, 1, 0 : i1
        %13 = ltl.implication %11, %12 : i1, !ltl.sequence
        verif.assert %13 : !ltl.property
        fsm.return %9
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c-1_i9 = hw.constant -1 : i9
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %30 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %31 = comb.mux %29, %30, %c0_i9 : i9
        %32 = comb.xor %29, %true : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %33 = comb.mux %32, %auto_ack_cnt_q, %31 : i9
        %34 = comb.or %arg4, %arg17 : i1
        %35 = comb.and %arg5, %34 : i1
        %true_1 = hw.constant true
        %36 = comb.xor %35, %true : i1
        %37 = comb.and %arg5, %arg3, %36 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %35, %38 : i1
        %40 = comb.xor %39, %true_1 : i1
        %41 = comb.or %40, %restart_det_q : i1
        %42 = comb.and %36, %38, %arg16 : i1
        %43 = comb.or %42, %nack_transaction_q : i1
        %44 = ltl.past %true_0, 1 : i1
        %45 = comb.xor %44, %true : i1
        %46 = ltl.delay %true_0, 1, 0 : i1
        %47 = ltl.implication %45, %46 : i1, !ltl.sequence
        verif.assert %47 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %41 : i1
        fsm.update %nack_transaction_q, %43 : i1
        fsm.update %auto_ack_cnt_q, %33 : i9
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.and %3, %arg5, %1 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %6 = comb.xor %4, %true_3 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %2, %true_4 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %9 = ltl.past %true_1, 1 : i1
        %10 = comb.xor %9, %true : i1
        %11 = ltl.delay %true_1, 1, 0 : i1
        %12 = ltl.implication %10, %11 : i1, !ltl.sequence
        verif.assert %12 : !ltl.property
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c-1_i9 = hw.constant -1 : i9
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %30 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %31 = comb.mux %29, %30, %c0_i9 : i9
        %32 = comb.xor %29, %true : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %33 = comb.mux %32, %auto_ack_cnt_q, %31 : i9
        %34 = comb.or %arg4, %arg17 : i1
        %35 = comb.and %arg5, %34 : i1
        %true_1 = hw.constant true
        %36 = comb.xor %35, %true : i1
        %37 = comb.and %arg5, %arg3, %36 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %35, %38 : i1
        %40 = comb.xor %39, %true_1 : i1
        %41 = comb.or %40, %restart_det_q : i1
        %42 = comb.and %36, %38, %arg16 : i1
        %43 = comb.or %42, %nack_transaction_q : i1
        %44 = ltl.past %true_0, 1 : i1
        %45 = comb.xor %44, %true : i1
        %46 = ltl.delay %true_0, 1, 0 : i1
        %47 = ltl.implication %45, %46 : i1, !ltl.sequence
        verif.assert %47 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %41 : i1
        fsm.update %nack_transaction_q, %43 : i1
        fsm.update %auto_ack_cnt_q, %33 : i9
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %1, %true_3 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c-1_i9 = hw.constant -1 : i9
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %30 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %31 = comb.mux %29, %30, %c0_i9 : i9
        %32 = comb.xor %29, %true : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %33 = comb.mux %32, %auto_ack_cnt_q, %31 : i9
        %34 = comb.or %arg4, %arg17 : i1
        %35 = comb.and %arg5, %34 : i1
        %true_1 = hw.constant true
        %36 = comb.xor %35, %true : i1
        %37 = comb.and %arg5, %arg3, %36 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %35, %38 : i1
        %40 = comb.xor %39, %true_1 : i1
        %41 = comb.or %40, %restart_det_q : i1
        %42 = comb.and %36, %38, %arg16 : i1
        %43 = comb.or %42, %nack_transaction_q : i1
        %44 = ltl.past %true_0, 1 : i1
        %45 = comb.xor %44, %true : i1
        %46 = ltl.delay %true_0, 1, 0 : i1
        %47 = ltl.implication %45, %46 : i1, !ltl.sequence
        verif.assert %47 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %41 : i1
        fsm.update %nack_transaction_q, %43 : i1
        fsm.update %auto_ack_cnt_q, %33 : i9
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c-1_i9 = hw.constant -1 : i9
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %30 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %31 = comb.mux %29, %30, %c0_i9 : i9
        %32 = comb.xor %29, %true : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %33 = comb.mux %32, %auto_ack_cnt_q, %31 : i9
        %34 = comb.or %arg4, %arg17 : i1
        %35 = comb.and %arg5, %34 : i1
        %true_1 = hw.constant true
        %36 = comb.xor %35, %true : i1
        %37 = comb.and %arg5, %arg3, %36 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %35, %38 : i1
        %40 = comb.xor %39, %true_1 : i1
        %41 = comb.or %40, %restart_det_q : i1
        %42 = comb.and %36, %38, %arg16 : i1
        %43 = comb.or %42, %nack_transaction_q : i1
        %44 = ltl.past %true_0, 1 : i1
        %45 = comb.xor %44, %true : i1
        %46 = ltl.delay %true_0, 1, 0 : i1
        %47 = ltl.implication %45, %46 : i1, !ltl.sequence
        verif.assert %47 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %41 : i1
        fsm.update %nack_transaction_q, %43 : i1
        fsm.update %auto_ack_cnt_q, %33 : i9
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c-1_i9 = hw.constant -1 : i9
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %29 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %30 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %31 = comb.mux %29, %30, %c0_i9 : i9
        %32 = comb.xor %29, %true : i1
        %false = hw.constant false
        %true_0 = hw.constant true
        %33 = comb.mux %32, %auto_ack_cnt_q, %31 : i9
        %34 = comb.or %arg4, %arg17 : i1
        %35 = comb.and %arg5, %34 : i1
        %true_1 = hw.constant true
        %36 = comb.xor %35, %true : i1
        %37 = comb.and %arg5, %arg3, %36 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %35, %38 : i1
        %40 = comb.xor %39, %true_1 : i1
        %41 = comb.or %40, %restart_det_q : i1
        %42 = comb.and %36, %38, %arg16 : i1
        %43 = comb.or %42, %nack_transaction_q : i1
        %44 = ltl.past %true_0, 1 : i1
        %45 = comb.xor %44, %true : i1
        %46 = ltl.delay %true_0, 1, 0 : i1
        %47 = ltl.implication %45, %46 : i1, !ltl.sequence
        verif.assert %47 : !ltl.property
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %sda_q, %false : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %41 : i1
        fsm.update %nack_transaction_q, %43 : i1
        fsm.update %auto_ack_cnt_q, %33 : i9
        fsm.update %tcount_q, %1 : i16
      }
    }
    fsm.state @state_12 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.xor %arg1, %true : i1
      %1 = comb.sub %c-64_i7, %arg8 : i7
      %2 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %3 = comb.xor %nack_transaction_q, %true : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %true_1 = hw.constant true
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %4 = comb.or %arg4, %arg17 : i1
      %5 = comb.and %arg5, %4 : i1
      %6 = comb.or %nack_transaction_q, %arg17 : i1
      %7 = comb.concat %6, %c-2_i2, %input_byte : i1, i2, i8
      %8 = comb.xor %5, %true : i1
      %9 = comb.and %arg5, %arg3, %8 : i1
      %10 = comb.xor %9, %true : i1
      %11 = comb.and %5, %xact_for_us_q : i1
      %12 = comb.mux %5, %7, %c0_i11 : i11
      %13 = comb.or %5, %9, %arg16 : i1
      %14 = comb.and %13, %xfer_for_us_q : i1
      %15 = comb.and %8, %10, %arg16 : i1
      %16 = comb.or %15, %nack_transaction_q : i1
      %17 = comb.and %8, %10, %arg16, %rw_bit_q : i1
      %18 = comb.and %5, %arg17, %rw_bit_q : i1
      %19 = comb.icmp ult %1, %c3_i7 : i7
      %false_5 = hw.constant false
      %20 = ltl.past %true_1, 1 : i1
      %21 = comb.xor %20, %true : i1
      %22 = ltl.delay %true_1, 1, 0 : i1
      %23 = ltl.implication %21, %22 : i1, !ltl.sequence
      verif.assert %23 : !ltl.property
      %true_6 = hw.constant true
      verif.assert %true_6 : i1
      %24 = comb.and %3, %16 : i1
      fsm.output %true_1, %true_0, %false_2, %0, %11, %12, %19, %false, %auto_ack_cnt_q, %false_3, %input_byte, %24, %14, %false_5, %2, %17, %18, %false_4 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %false = hw.constant false
        %0 = ltl.past %true_1, 1 : i1
        %1 = comb.xor %0, %true : i1
        %2 = ltl.delay %true_1, 1, 0 : i1
        %3 = ltl.implication %1, %2 : i1, !ltl.sequence
        verif.assert %3 : !ltl.property
        fsm.return %false
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.mux %0, %host_ack, %rw_bit_q : i1
        %5 = comb.and %3, %arg5, %1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %4, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %arg1, %true_3 : i1
        %8 = comb.and %7, %0, %6 : i1
        %9 = comb.or %arg16, %8 : i1
        %true_4 = hw.constant true
        %10 = comb.xor %5, %true_4 : i1
        %true_5 = hw.constant true
        %11 = comb.xor %2, %true_5 : i1
        %12 = comb.and %arg5, %11, %10, %9 : i1
        %13 = ltl.past %true_1, 1 : i1
        %14 = comb.xor %13, %true : i1
        %15 = ltl.delay %true_1, 1, 0 : i1
        %16 = ltl.implication %14, %15 : i1, !ltl.sequence
        verif.assert %16 : !ltl.property
        fsm.return %12
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %3 = comb.and %2, %arg5, %0 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %arg16, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %3, %true_3 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %1, %true_4 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %8 = ltl.past %true_1, 1 : i1
        %9 = comb.xor %8, %true : i1
        %10 = ltl.delay %true_1, 1, 0 : i1
        %11 = ltl.implication %9, %10 : i1, !ltl.sequence
        verif.assert %11 : !ltl.property
        fsm.return %7
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %4 = comb.mux %0, %host_ack, %rw_bit_q : i1
        %5 = comb.and %3, %arg5, %1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %arg1, %true_2 : i1
        %true_3 = hw.constant true
        %7 = comb.xor %arg16, %true_3 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %5, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %2, %true_5 : i1
        %10 = comb.and %arg5, %9, %8, %7, %6, %0, %4 : i1
        %11 = ltl.past %true_1, 1 : i1
        %12 = comb.xor %11, %true : i1
        %13 = ltl.delay %true_1, 1, 0 : i1
        %14 = ltl.implication %12, %13 : i1, !ltl.sequence
        verif.assert %14 : !ltl.property
        fsm.return %10
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %1 = ltl.past %true_1, 1 : i1
        %2 = comb.xor %1, %true : i1
        %3 = ltl.delay %true_1, 1, 0 : i1
        %4 = ltl.implication %2, %3 : i1, !ltl.sequence
        verif.assert %4 : !ltl.property
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = ltl.past %true_1, 1 : i1
        %8 = comb.xor %7, %true : i1
        %9 = ltl.delay %true_1, 1, 0 : i1
        %10 = ltl.implication %8, %9 : i1, !ltl.sequence
        verif.assert %10 : !ltl.property
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_2 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_2 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = ltl.past %true_1, 1 : i1
        %40 = comb.xor %39, %true : i1
        %41 = ltl.delay %true_1, 1, 0 : i1
        %42 = ltl.implication %40, %41 : i1, !ltl.sequence
        verif.assert %42 : !ltl.property
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %sda_q, %true_0 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
  }
}

