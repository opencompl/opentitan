module {
  %false = hw.constant false
  %false_0 = hw.constant false
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
    %isFirstCycle = fsm.variable "isFirstCycle" {initValue = true} : i1
    %false_1 = hw.constant false
    %_sh1 = fsm.variable "_sh1" {initValue = false} : i1
    %false_2 = hw.constant false
    %_sh1_3 = fsm.variable "_sh1" {initValue = false} : i1
    fsm.state @state_0 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %true_4 = hw.constant true
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %17 = comb.and %2, %7, %9, %arg16 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %10, %11, %16, %true_4, %auto_ack_cnt_q, %false_9, %input_byte, %17, %13, %false_11, %1, %14, %15, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
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
        %false_4 = hw.constant false
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %false_8 = hw.constant false
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %false_9 = hw.constant false
        %35 = comb.and %32, %34 : i1
        %true_10 = hw.constant true
        %36 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %36 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %false_5 : i1
        fsm.update %xact_for_us_q, %false_8 : i1
        fsm.update %restart_det_q, %false_9 : i1
        fsm.update %nack_transaction_q, %35 : i1
        fsm.update %stretch_active_cnt, %2 : i31
        fsm.update %tcount_q, %1 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %false_8 = hw.constant false
        %false_9 = hw.constant false
        %false_10 = hw.constant false
        %true_11 = hw.constant true
        %19 = comb.xor %_sh1, %true_11 : i1
        %true_12 = hw.constant true
        verif.assert %true_12 : i1
        fsm.update %_sh1_3, %19 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %xfer_for_us_q, %false_5 : i1
        fsm.update %xact_for_us_q, %false_8 : i1
        fsm.update %restart_det_q, %false_9 : i1
        fsm.update %nack_transaction_q, %false_10 : i1
        fsm.update %stretch_active_cnt, %c0_i31 : i31
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %5 = comb.or %3, %4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %1, %true_5 : i1
        %7 = comb.and %6, %5 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
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
        %false_4 = hw.constant false
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %false_8 = hw.constant false
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %false_9 = hw.constant false
        %35 = comb.and %32, %34, %arg16 : i1
        %true_10 = hw.constant true
        %36 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %36 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %xfer_for_us_q, %false_5 : i1
        fsm.update %xact_for_us_q, %false_8 : i1
        fsm.update %restart_det_q, %false_9 : i1
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %10, %11, %18, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
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
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %scl_i_q, %true : i1
        %9 = comb.and %8, %arg1 : i1
        %10 = comb.xor %1, %true : i1
        %11 = comb.extract %input_byte from 0 : (i8) -> i7
        %12 = comb.concat %11, %arg2 : i7, i1
        %13 = comb.and %10, %9 : i1
        %14 = comb.mux %13, %12, %c0_i8 : i8
        %15 = comb.and %9, %1 : i1
        %16 = comb.xor %9, %true : i1
        %17 = comb.and %arg1, %16 : i1
        %18 = comb.or %17, %15 : i1
        %19 = comb.mux bin %18, %input_byte, %14 : i8
        %20 = comb.xor %arg2, %true : i1
        %21 = comb.and %9, %10 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.and %9, %22, %20 : i1
        %24 = comb.and %9, %22 : i1
        %25 = comb.mux bin %24, %23, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %26 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %27 = comb.xor %26, %true : i1
        %28 = comb.and %arg3, %27 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.or %26, %29 : i1
        %31 = comb.xor %30, %true_8 : i1
        %32 = comb.or %31, %restart_det_q : i1
        %33 = comb.and %27, %29 : i1
        %34 = comb.or %33, %nack_transaction_q : i1
        %35 = comb.xor %arg1, %true : i1
        %true_9 = hw.constant true
        %36 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %36 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %25 : i1
        fsm.update %input_byte, %19 : i8
        fsm.update %xfer_for_us_q, %false_5 : i1
        fsm.update %restart_det_q, %32 : i1
        fsm.update %nack_transaction_q, %34 : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %0 : i16
        %37 = comb.or %35, %1 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.and %38, %3, %5 : i1
        %40 = comb.mux %39, %4, %7 : i4
        fsm.update %bit_idx, %40 : i4
      }
      fsm.transition @state_2 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %1, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %false_5 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.or %arg3, %scl_i_q : i1
        %2 = comb.mux %1, %c0_i4, %bit_idx : i4
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %true_8 = hw.constant true
        %3 = comb.or %arg4, %arg17 : i1
        %true_9 = hw.constant true
        %4 = comb.xor %3, %true : i1
        %5 = comb.and %arg3, %4 : i1
        %6 = comb.xor %5, %true : i1
        %7 = comb.or %3, %6 : i1
        %8 = comb.xor %7, %true_9 : i1
        %9 = comb.or %8, %restart_det_q : i1
        %true_10 = hw.constant true
        %10 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %10 : i1
        fsm.update %_sh1, %true_8 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_7 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %c0_i8 : i8
        fsm.update %xfer_for_us_q, %false_6 : i1
        fsm.update %restart_det_q, %9 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %0 : i16
        fsm.update %bit_idx, %2 : i4
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %6 = comb.and %5, %4, %arg1 : i1
        %7 = comb.or %1, %6 : i1
        %8 = comb.and %arg5, %7 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
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
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %scl_i_q, %true : i1
        %9 = comb.and %8, %arg1 : i1
        %10 = comb.xor %1, %true : i1
        %11 = comb.extract %input_byte from 0 : (i8) -> i7
        %12 = comb.concat %11, %arg2 : i7, i1
        %13 = comb.and %10, %9 : i1
        %14 = comb.mux %13, %12, %c0_i8 : i8
        %15 = comb.and %9, %1 : i1
        %16 = comb.xor %9, %true : i1
        %17 = comb.and %arg1, %16 : i1
        %18 = comb.or %17, %15 : i1
        %19 = comb.mux bin %18, %input_byte, %14 : i8
        %20 = comb.xor %arg2, %true : i1
        %21 = comb.and %9, %10 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.and %9, %22, %20 : i1
        %24 = comb.and %9, %22 : i1
        %25 = comb.mux bin %24, %23, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %26 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %27 = comb.xor %26, %true : i1
        %28 = comb.and %arg3, %27 : i1
        %29 = comb.xor %28, %true : i1
        %30 = comb.or %26, %29 : i1
        %31 = comb.xor %30, %true_8 : i1
        %32 = comb.or %31, %restart_det_q : i1
        %33 = comb.and %27, %29, %arg16 : i1
        %34 = comb.or %33, %nack_transaction_q : i1
        %35 = comb.xor %arg1, %true : i1
        %true_9 = hw.constant true
        %36 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %36 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %25 : i1
        fsm.update %input_byte, %19 : i8
        fsm.update %xfer_for_us_q, %false_5 : i1
        fsm.update %restart_det_q, %32 : i1
        fsm.update %nack_transaction_q, %34 : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %0 : i16
        %37 = comb.or %35, %1 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.and %38, %3, %5 : i1
        %40 = comb.mux %39, %4, %7 : i4
        fsm.update %bit_idx, %40 : i4
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
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
        %false_4 = hw.constant false
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
        %14 = comb.and %11, %10 : i1
        %15 = comb.mux %14, %13, %c0_i8 : i8
        %16 = comb.and %10, %2 : i1
        %17 = comb.xor %10, %true : i1
        %18 = comb.and %arg1, %17 : i1
        %19 = comb.or %18, %16 : i1
        %20 = comb.mux bin %19, %input_byte, %15 : i8
        %21 = comb.xor %arg2, %true : i1
        %22 = comb.and %10, %11 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %10, %23, %21 : i1
        %25 = comb.and %10, %23 : i1
        %26 = comb.mux bin %25, %24, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %27 = comb.or %arg4, %arg17 : i1
        %28 = comb.and %arg5, %27 : i1
        %true_8 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg5, %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_8 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31, %arg16 : i1
        %36 = comb.or %35, %nack_transaction_q : i1
        %37 = comb.xor %arg1, %true : i1
        %true_9 = hw.constant true
        %38 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %38 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %26 : i1
        fsm.update %input_byte, %20 : i8
        fsm.update %xfer_for_us_q, %false_5 : i1
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %auto_ack_cnt_q, %c0_i9 : i9
        fsm.update %tcount_q, %1 : i16
        %39 = comb.or %37, %2 : i1
        %40 = comb.xor %39, %true : i1
        %41 = comb.and %40, %4, %6 : i1
        %42 = comb.mux %41, %5, %8 : i4
        fsm.update %bit_idx, %42 : i4
      }
    }
    fsm.state @state_13 output {
      %true = hw.constant true
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %false_4 = hw.constant false
      %1 = comb.xor %nack_transaction_q, %true : i1
      %false_5 = hw.constant false
      %true_6 = hw.constant true
      %true_7 = hw.constant true
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
      %false_11 = hw.constant false
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
      %false_12 = hw.constant false
      %true_13 = hw.constant true
      verif.assert %true_13 : i1
      %18 = comb.and %1, %14 : i1
      fsm.output %true_7, %true_6, %false_8, %false_9, %9, %10, %17, %false_5, %auto_ack_cnt_q, %false_10, %input_byte, %18, %12, %false_12, %false_4, %15, %16, %false_11 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31, %arg16 : i1
        %36 = comb.or %35, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %37 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %19 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %19, %true_7 : i1
        %21 = comb.or %20, %restart_det_q : i1
        %true_8 = hw.constant true
        %22 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %22 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %21 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %39 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %39 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %33 = comb.mux %0, %10, %32 : i1
      %34 = comb.and %33, %15 : i1
      %35 = comb.or %34, %nack_transaction_q : i1
      %36 = comb.and %0, %35 : i1
      %37 = comb.mux %11, %nack_transaction_q, %36 : i1
      %38 = comb.or %27, %37 : i1
      %39 = comb.and %14, %38 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %23, %24, %30, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %39, %26, %false_11, %13, %28, %29, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_14 guard {
        %false_4 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %false_4
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %39 = comb.and %2, %21 : i1
        %40 = comb.extract %input_byte from 0 : (i8) -> i1
        %41 = comb.xor %2, %true : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_7 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_7 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %52 = comb.and %arg14, %51 : i1
        %53 = comb.mux %2, %21, %rw_bit_q : i1
        %54 = comb.and %2, %53 : i1
        %true_8 = hw.constant true
        %55 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %55 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %38 : i1
        fsm.update %input_byte, %32 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        %56 = comb.xor %54, %true : i1
        %57 = comb.or %54, %arg5 : i1
        %58 = comb.mux %57, %c1_i16, %tcount_q : i16
        %59 = comb.mux %54, %0, %58 : i16
        %60 = comb.and %arg5, %56 : i1
        %61 = comb.mux %60, %1, %59 : i16
        %62 = comb.mux bin %39, %40, %rw_bit_q : i1
        %63 = comb.mux %2, %21, %52 : i1
        %64 = comb.and %63, %2 : i1
        %65 = comb.or %64, %xact_for_us_q : i1
        %66 = comb.and %63, %41 : i1
        %67 = comb.or %66, %nack_transaction_q : i1
        %68 = comb.and %2, %65 : i1
        %69 = comb.and %2, %67 : i1
        %70 = comb.mux %24, %xact_for_us_q, %68 : i1
        %71 = comb.and %2, %63 : i1
        %72 = comb.or %71, %xfer_for_us_q : i1
        %73 = comb.mux %24, %nack_transaction_q, %69 : i1
        %74 = comb.or %50, %73 : i1
        fsm.update %rw_bit_q, %62 : i1
        fsm.update %xfer_for_us_q, %72 : i1
        fsm.update %xact_for_us_q, %70 : i1
        fsm.update %nack_transaction_q, %74 : i1
        fsm.update %tcount_q, %61 : i16
      }
      fsm.transition @state_7 guard {
        %false_4 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %false_4
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %39 = comb.and %2, %21 : i1
        %40 = comb.extract %input_byte from 0 : (i8) -> i1
        %41 = comb.xor %2, %true : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_7 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_7 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %52 = comb.and %arg14, %51 : i1
        %53 = comb.mux %2, %21, %rw_bit_q : i1
        %54 = comb.and %2, %53 : i1
        %true_8 = hw.constant true
        %55 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %55 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %38 : i1
        fsm.update %input_byte, %32 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        %56 = comb.xor %54, %true : i1
        %57 = comb.or %54, %arg5 : i1
        %58 = comb.mux %57, %c1_i16, %tcount_q : i16
        %59 = comb.mux %54, %0, %58 : i16
        %60 = comb.and %arg5, %56 : i1
        %61 = comb.mux %60, %1, %59 : i16
        %62 = comb.mux bin %39, %40, %rw_bit_q : i1
        %63 = comb.mux %2, %21, %52 : i1
        %64 = comb.and %63, %2 : i1
        %65 = comb.or %64, %xact_for_us_q : i1
        %66 = comb.and %63, %41 : i1
        %67 = comb.or %66, %nack_transaction_q : i1
        %68 = comb.and %2, %65 : i1
        %69 = comb.and %2, %67 : i1
        %70 = comb.mux %24, %xact_for_us_q, %68 : i1
        %71 = comb.and %2, %63 : i1
        %72 = comb.or %71, %xfer_for_us_q : i1
        %73 = comb.mux %24, %nack_transaction_q, %69 : i1
        %74 = comb.or %50, %73 : i1
        fsm.update %rw_bit_q, %62 : i1
        fsm.update %xfer_for_us_q, %72 : i1
        fsm.update %xact_for_us_q, %70 : i1
        fsm.update %nack_transaction_q, %74 : i1
        fsm.update %tcount_q, %61 : i16
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
        %14 = comb.mux %0, %10, %rw_bit_q : i1
        %15 = comb.and %13, %arg5, %11 : i1
        %true_4 = hw.constant true
        %16 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %17 = comb.xor %15, %true_5 : i1
        %true_6 = hw.constant true
        %18 = comb.xor %12, %true_6 : i1
        %19 = comb.and %arg5, %18, %17, %16, %0, %14 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %19
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i7 = hw.constant 0 : i7
        %c0_i4 = hw.constant 0 : i4
        %false_4 = hw.constant false
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.xor %arg1, %true : i1
        %2 = comb.and %scl_i_q, %1 : i1
        %3 = comb.or %arg3, %2 : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.extract %input_byte from 1 : (i8) -> i7
        %6 = comb.and %5, %arg24 : i7
        %7 = comb.icmp eq %6, %arg23 : i7
        %8 = comb.icmp ne %arg24, %c0_i7 : i7
        %9 = comb.and %7, %8 : i1
        %10 = comb.and %5, %arg26 : i7
        %11 = comb.icmp eq %10, %arg25 : i7
        %12 = comb.icmp ne %arg26, %c0_i7 : i7
        %13 = comb.and %11, %12 : i1
        %14 = comb.or %9, %13 : i1
        %15 = comb.xor %scl_i_q, %true : i1
        %16 = comb.and %15, %arg1 : i1
        %17 = comb.xor %arg2, %true : i1
        %18 = comb.mux bin %16, %17, %host_ack : i1
        %19 = comb.extract %input_byte from 0 : (i8) -> i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %20 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %arg3, %21 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.or %20, %23 : i1
        %25 = comb.xor %24, %true_7 : i1
        %26 = comb.or %25, %restart_det_q : i1
        %true_8 = hw.constant true
        %27 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %27 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %4 : i4
        fsm.update %restart_det_q, %26 : i1
        %28 = comb.mux bin %14, %19, %rw_bit_q : i1
        %29 = comb.or %14, %xact_for_us_q : i1
        %30 = comb.or %14, %xfer_for_us_q : i1
        fsm.update %rw_bit_q, %28 : i1
        fsm.update %xfer_for_us_q, %30 : i1
        fsm.update %xact_for_us_q, %29 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i7 = hw.constant 0 : i7
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %39 = comb.and %2, %21 : i1
        %40 = comb.extract %input_byte from 0 : (i8) -> i1
        %41 = comb.xor %2, %true : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_7 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_7 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %52 = comb.and %arg14, %51 : i1
        %53 = comb.mux %2, %21, %rw_bit_q : i1
        %54 = comb.and %2, %53 : i1
        %true_8 = hw.constant true
        %55 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %55 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %38 : i1
        fsm.update %input_byte, %32 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %49 : i1
        %56 = comb.xor %54, %true : i1
        %57 = comb.or %54, %arg5 : i1
        %58 = comb.mux %57, %c1_i16, %tcount_q : i16
        %59 = comb.mux %54, %0, %58 : i16
        %60 = comb.and %arg5, %56 : i1
        %61 = comb.mux %60, %1, %59 : i16
        %62 = comb.mux bin %39, %40, %rw_bit_q : i1
        %63 = comb.mux %2, %21, %52 : i1
        %64 = comb.and %63, %2 : i1
        %65 = comb.or %64, %xact_for_us_q : i1
        %66 = comb.and %63, %41 : i1
        %67 = comb.or %66, %nack_transaction_q : i1
        %68 = comb.and %2, %65 : i1
        %69 = comb.and %2, %67 : i1
        %70 = comb.mux %24, %xact_for_us_q, %68 : i1
        %71 = comb.and %2, %63 : i1
        %72 = comb.or %71, %xfer_for_us_q : i1
        %73 = comb.mux %24, %nack_transaction_q, %69 : i1
        %74 = comb.or %50, %73 : i1
        fsm.update %rw_bit_q, %62 : i1
        fsm.update %xfer_for_us_q, %72 : i1
        fsm.update %xact_for_us_q, %70 : i1
        fsm.update %nack_transaction_q, %74 : i1
        fsm.update %tcount_q, %61 : i16
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %10, %11, %18, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
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
        %9 = comb.and %2, %0, %arg15 : i1
        %10 = comb.mux %9, %nack_transaction_q, %5 : i1
        %11 = comb.and %2, %0 : i1
        %12 = comb.and %arg15, %11 : i1
        %13 = comb.and %11, %6 : i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.and %14, %12 : i1
        %16 = comb.and %0, %3 : i1
        %17 = comb.and %8, %arg5, %4 : i1
        %true_4 = hw.constant true
        %18 = comb.xor %9, %true_4 : i1
        %true_5 = hw.constant true
        %19 = comb.xor %13, %true_5 : i1
        %true_6 = hw.constant true
        %20 = comb.xor %arg1, %true_6 : i1
        %true_7 = hw.constant true
        %21 = comb.xor %15, %true_7 : i1
        %true_8 = hw.constant true
        %22 = comb.xor %16, %true_8 : i1
        %true_9 = hw.constant true
        %23 = comb.xor %arg16, %true_9 : i1
        %true_10 = hw.constant true
        %24 = comb.xor %17, %true_10 : i1
        %true_11 = hw.constant true
        %25 = comb.xor %7, %true_11 : i1
        %26 = comb.and %arg5, %25, %24, %23, %22, %21, %20, %19, %12, %10, %18 : i1
        %true_12 = hw.constant true
        verif.assert %true_12 : i1
        fsm.return %26
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %true_4 = hw.constant true
        %19 = comb.xor %13, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %14, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %6, %true_7 : i1
        %23 = comb.and %arg5, %22, %21, %20, %19, %12, %arg15, %2, %0, %9, %18 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %23
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %true_4 = hw.constant true
        %19 = comb.xor %9, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %13, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %arg16, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %14, %true_7 : i1
        %true_8 = hw.constant true
        %23 = comb.xor %6, %true_8 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20, %12, %arg15, %2, %0, %19, %18 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.return %24
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %9 = comb.and %2, %0, %arg15 : i1
        %10 = comb.mux %9, %nack_transaction_q, %5 : i1
        %11 = comb.and %2, %0 : i1
        %12 = comb.and %arg15, %11 : i1
        %13 = comb.and %11, %6 : i1
        %14 = comb.xor %10, %true : i1
        %15 = comb.and %14, %12 : i1
        %16 = comb.and %0, %3 : i1
        %17 = comb.and %8, %arg5, %4 : i1
        %true_4 = hw.constant true
        %18 = comb.xor %13, %true_4 : i1
        %19 = comb.and %18, %12, %10, %9 : i1
        %20 = comb.or %arg1, %19 : i1
        %true_5 = hw.constant true
        %21 = comb.xor %15, %true_5 : i1
        %true_6 = hw.constant true
        %22 = comb.xor %16, %true_6 : i1
        %23 = comb.and %22, %21, %20 : i1
        %24 = comb.or %arg16, %23 : i1
        %true_7 = hw.constant true
        %25 = comb.xor %17, %true_7 : i1
        %true_8 = hw.constant true
        %26 = comb.xor %7, %true_8 : i1
        %27 = comb.and %arg5, %26, %25, %24 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.return %27
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31, %arg16 : i1
        %36 = comb.or %35, %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %37 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %tcount_q, %0 : i16
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
        %true_4 = hw.constant true
        %19 = comb.xor %13, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %14, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %6, %true_7 : i1
        %23 = comb.and %arg5, %22, %21, %20, %19, %12, %arg15, %2, %0, %9, %18 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %23
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %true_4 = hw.constant true
        %22 = comb.xor %10, %true_4 : i1
        %23 = comb.and %22, %21 : i1
        %true_5 = hw.constant true
        %24 = comb.xor %arg1, %true_5 : i1
        %25 = comb.and %24, %13, %6 : i1
        %26 = comb.mux %15, %23, %25 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %16, %true_6 : i1
        %true_7 = hw.constant true
        %28 = comb.xor %arg16, %true_7 : i1
        %true_8 = hw.constant true
        %29 = comb.xor %17, %true_8 : i1
        %true_9 = hw.constant true
        %30 = comb.xor %7, %true_9 : i1
        %31 = comb.and %arg5, %30, %29, %28, %27, %26 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.return %31
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.or %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %36 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %36 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %35 : i1
        fsm.update %tcount_q, %0 : i16
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
        %true_4 = hw.constant true
        %21 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %22 = comb.xor %14, %true_5 : i1
        %true_6 = hw.constant true
        %23 = comb.xor %6, %true_6 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %24
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.or %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %36 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %36 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %35 : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %19 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %19, %true_7 : i1
        %21 = comb.or %20, %restart_det_q : i1
        %22 = comb.or %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %23 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %23 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %21 : i1
        fsm.update %nack_transaction_q, %22 : i1
        fsm.update %tcount_q, %0 : i16
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
        %true_4 = hw.constant true
        %20 = comb.xor %14, %true_4 : i1
        %true_5 = hw.constant true
        %21 = comb.xor %15, %true_5 : i1
        %true_6 = hw.constant true
        %22 = comb.xor %arg1, %true_6 : i1
        %true_7 = hw.constant true
        %23 = comb.xor %17, %true_7 : i1
        %true_8 = hw.constant true
        %24 = comb.xor %18, %true_8 : i1
        %true_9 = hw.constant true
        %25 = comb.xor %arg16, %true_9 : i1
        %26 = comb.and %25, %24, %23, %22, %21, %20 : i1
        %27 = comb.or %19, %26 : i1
        %true_10 = hw.constant true
        %28 = comb.xor %8, %true_10 : i1
        %29 = comb.and %28, %27 : i1
        %30 = comb.or %7, %29 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.return %30
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %39 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %39 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %10, %11, %18, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
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
        %7 = comb.and %6, %arg5, %0 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %7, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %5, %true_6 : i1
        %11 = comb.and %arg5, %10, %9, %8, %4 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %11
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %true_8 = hw.constant true
        %35 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %35 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31 : i1
        %36 = comb.or %35, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %37 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %tcount_q, %0 : i16
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
        %7 = comb.and %6, %arg5, %0 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %4, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %7, %true_6 : i1
        %true_7 = hw.constant true
        %11 = comb.xor %5, %true_7 : i1
        %12 = comb.and %arg5, %11, %10, %9, %8 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %12
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %true_8 = hw.constant true
        %35 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %35 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %19 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %19, %true_7 : i1
        %21 = comb.or %20, %restart_det_q : i1
        %true_8 = hw.constant true
        %22 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %22 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %21 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %39 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %39 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %10, %11, %18, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_15 guard {
        %true = hw.constant true
        %c-8_i4 = hw.constant -8 : i4
        %0 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %2, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i4 = hw.constant 0 : i4
        %false_4 = hw.constant false
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.xor %arg1, %true : i1
        %2 = comb.and %scl_i_q, %1 : i1
        %3 = comb.or %arg3, %2 : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.xor %scl_i_q, %true : i1
        %6 = comb.and %5, %arg1 : i1
        %7 = comb.xor %arg2, %true : i1
        %8 = comb.mux bin %6, %7, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %9 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %10 = comb.xor %9, %true : i1
        %11 = comb.and %arg3, %10 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.or %9, %12 : i1
        %14 = comb.xor %13, %true_7 : i1
        %15 = comb.or %14, %restart_det_q : i1
        %true_8 = hw.constant true
        %16 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %16 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %8 : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %4 : i4
        fsm.update %restart_det_q, %15 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c-8_i4 = hw.constant -8 : i4
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %4 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %1, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.xor %arg1, %true : i1
        %2 = comb.and %scl_i_q, %1 : i1
        %3 = comb.add %bit_idx, %c1_i4 : i4
        %4 = comb.xor %arg3, %true : i1
        %5 = comb.or %arg3, %2 : i1
        %6 = comb.mux %5, %c0_i4, %bit_idx : i4
        %7 = comb.and %2, %4 : i1
        %8 = comb.mux %7, %3, %6 : i4
        %9 = comb.xor %scl_i_q, %true : i1
        %10 = comb.and %9, %arg1 : i1
        %11 = comb.extract %input_byte from 0 : (i8) -> i7
        %12 = comb.concat %11, %arg2 : i7, i1
        %13 = comb.mux bin %10, %12, %input_byte : i8
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %14 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %arg3, %15 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.or %14, %17 : i1
        %19 = comb.xor %18, %true_7 : i1
        %20 = comb.or %19, %restart_det_q : i1
        %true_8 = hw.constant true
        %21 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %21 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %13 : i8
        fsm.update %bit_idx, %8 : i4
        fsm.update %restart_det_q, %20 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %true_7 = hw.constant true
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_7, %false_4, %true_5, %false_8, %10, %11, %18, %false_6, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %18 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %19 = comb.xor %18, %true_4 : i1
        %20 = comb.and %arg3, %19 : i1
        %21 = comb.xor %20, %true_4 : i1
        %22 = comb.or %18, %21 : i1
        %23 = comb.xor %22, %true_8 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %true_9 = hw.constant true
        %25 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %25 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %3, %true_6 : i1
        %true_7 = hw.constant true
        %7 = comb.xor %1, %true_7 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
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
      %false_8 = hw.constant false
      %20 = comb.xor %isFirstCycle, %true : i1
      %21 = comb.and %20, %_sh1_3 : i1
      %22 = comb.xor %21, %true : i1
      %c-3_i3 = hw.constant -3 : i3
      %23 = comb.concat %c-3_i3, %input_byte : i3, i8
      %24 = comb.xor %19, %true : i1
      %false_9 = hw.constant false
      %25 = comb.mux %19, %23, %c0_i11 : i11
      %false_10 = hw.constant false
      %false_11 = hw.constant false
      %26 = comb.and %19, %4 : i1
      %27 = comb.mux %24, %nack_transaction_q, %19 : i1
      %28 = comb.mux %6, %xact_for_us_q, %26 : i1
      %29 = comb.mux %6, %8, %25 : i11
      %30 = comb.or %14, %27 : i1
      verif.assert %22 : i1
      %31 = comb.and %2, %30 : i1
      fsm.output %false_9, %true_4, %false_5, %false_6, %28, %29, %17, %false_10, %auto_ack_cnt_q, %false_11, %input_byte, %31, %13, %false_8, %1, %15, %16, %false_7 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_25 guard {
        %true = hw.constant true
        %0 = comb.xor %isFirstCycle, %true : i1
        %1 = comb.and %0, %_sh1_3 : i1
        %2 = comb.xor %1, %true : i1
        %false_4 = hw.constant false
        verif.assert %2 : i1
        fsm.return %false_4
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %true_6 = hw.constant true
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
        %47 = comb.and %46, %36 : i1
        %48 = comb.or %47, %44 : i1
        %49 = comb.xor %48, %true : i1
        %50 = comb.or %46, %48 : i1
        %51 = comb.xor %isFirstCycle, %true : i1
        %52 = comb.and %51, %_sh1_3 : i1
        %53 = comb.xor %52, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %54 = comb.xor %50, %true_5 : i1
        %55 = comb.xor %46, %true : i1
        %56 = comb.and %55, %36 : i1
        %57 = comb.or %56, %44 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.and %46, %57 : i1
        %false_7 = hw.constant false
        %60 = comb.mux %58, %44, %59 : i1
        %61 = comb.mux %58, %nack_transaction_q, %46 : i1
        %true_8 = hw.constant true
        %62 = comb.xor %42, %true_8 : i1
        %63 = comb.or %62, %restart_det_q : i1
        %64 = comb.or %43, %61 : i1
        %65 = comb.and %58, %49 : i1
        %false_9 = hw.constant false
        verif.assert %53 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_7 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %64 : i1
        %66 = comb.xor %65, %true : i1
        %67 = comb.or %65, %arg5 : i1
        %68 = comb.mux %67, %c1_i16, %tcount_q : i16
        %69 = comb.and %54, %65 : i1
        %70 = comb.mux %69, %2, %68 : i16
        %71 = comb.and %arg5, %66 : i1
        %72 = comb.mux %71, %3, %70 : i16
        %73 = comb.mux bin %60, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %73 : i31
        fsm.update %tcount_q, %72 : i16
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
        %11 = comb.xor %isFirstCycle, %true : i1
        %12 = comb.and %11, %_sh1_3 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %8, %true : i1
        %15 = comb.and %8, %4 : i1
        %16 = comb.or %15, %6 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %10, %arg5, %5 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %18, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %9, %true_6 : i1
        %22 = comb.and %arg5, %21, %20, %19, %14, %17 : i1
        verif.assert %13 : i1
        fsm.return %22
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c1_i31 = hw.constant 1 : i31
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %4 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %5 = comb.xor %arg1, %true : i1
        %6 = comb.and %scl_i_q, %5 : i1
        %7 = comb.add %bit_idx, %c1_i4 : i4
        %8 = comb.xor %arg3, %true : i1
        %9 = comb.or %arg3, %6 : i1
        %10 = comb.mux %9, %c0_i4, %bit_idx : i4
        %11 = comb.xor %4, %true : i1
        %12 = comb.and %11, %6, %8 : i1
        %13 = comb.mux %12, %7, %10 : i4
        %14 = comb.xor %scl_i_q, %true : i1
        %15 = comb.and %14, %arg1 : i1
        %16 = comb.xor %4, %true : i1
        %17 = comb.extract %input_byte from 0 : (i8) -> i7
        %18 = comb.concat %17, %arg2 : i7, i1
        %19 = comb.and %16, %15 : i1
        %20 = comb.mux %19, %18, %c0_i8 : i8
        %21 = comb.and %15, %4 : i1
        %22 = comb.xor %15, %true : i1
        %23 = comb.or %22, %21 : i1
        %24 = comb.mux bin %23, %input_byte, %20 : i8
        %25 = comb.xor %arg2, %true : i1
        %26 = comb.and %15, %16 : i1
        %27 = comb.xor %26, %true : i1
        %28 = comb.and %15, %27, %25 : i1
        %29 = comb.and %15, %27 : i1
        %30 = comb.mux bin %29, %28, %host_ack : i1
        %31 = comb.sub %c-64_i7, %arg8 : i7
        %true_5 = hw.constant true
        %32 = comb.or %arg4, %arg17 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.and %arg3, %33 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.or %32, %35 : i1
        %37 = comb.icmp ult %31, %c3_i7 : i7
        %38 = comb.xor %isFirstCycle, %true : i1
        %39 = comb.and %38, %_sh1_3 : i1
        %40 = comb.xor %39, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %30 : i1
        fsm.update %input_byte, %24 : i8
        fsm.update %bit_idx, %13 : i4
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %41 = comb.xor %36, %true_7 : i1
        %42 = comb.or %41, %restart_det_q : i1
        %false_8 = hw.constant false
        verif.assert %40 : i1
        fsm.update %_sh1_3, %false_8 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %restart_det_q, %42 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        %43 = comb.mux bin %37, %3, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %43 : i31
        fsm.update %tcount_q, %2 : i16
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
        %11 = comb.xor %isFirstCycle, %true : i1
        %12 = comb.and %11, %_sh1_3 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.xor %8, %true : i1
        %15 = comb.and %8, %4 : i1
        %16 = comb.or %15, %6 : i1
        %17 = comb.and %10, %arg5, %5 : i1
        %true_4 = hw.constant true
        %18 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %19 = comb.xor %17, %true_5 : i1
        %true_6 = hw.constant true
        %20 = comb.xor %9, %true_6 : i1
        %21 = comb.and %arg5, %20, %19, %18, %14, %16 : i1
        verif.assert %13 : i1
        fsm.return %21
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %stretch_active_cnt, %c1_i31 : i31
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
        %29 = comb.sub %c-64_i7, %arg8 : i7
        %true_5 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.icmp ult %29, %c3_i7 : i7
        %36 = comb.xor %isFirstCycle, %true : i1
        %37 = comb.and %36, %_sh1_3 : i1
        %38 = comb.xor %37, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %39 = comb.xor %34, %true_7 : i1
        %40 = comb.or %39, %restart_det_q : i1
        %false_8 = hw.constant false
        verif.assert %38 : i1
        fsm.update %_sh1_3, %false_8 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %restart_det_q, %40 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        %41 = comb.mux bin %35, %1, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %41 : i31
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1_3 : i1
        %7 = comb.xor %6, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %8 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %9 = comb.and %4, %arg5, %0 : i1
        %10 = comb.extract %8 from 2 : (i4) -> i2
        %11 = comb.extract %8 from 0 : (i4) -> i1
        %12 = comb.concat %10, %11 : i2, i1
        %c-1_i3 = hw.constant -1 : i3
        %13 = comb.icmp eq %12, %c-1_i3 : i3
        %14 = comb.and %2, %13 : i1
        %15 = comb.or %arg16, %14 : i1
        %true_4 = hw.constant true
        %16 = comb.xor %9, %true_4 : i1
        %true_5 = hw.constant true
        %17 = comb.xor %3, %true_5 : i1
        %18 = comb.and %arg5, %17, %16, %15 : i1
        verif.assert %7 : i1
        fsm.return %18
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %true_6 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.and %arg3, %38 : i1
        %40 = comb.xor %39, %true : i1
        %41 = comb.or %37, %40 : i1
        %42 = comb.and %38, %40, %arg16 : i1
        %43 = comb.icmp ult %35, %c3_i7 : i7
        %44 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %45 = comb.and %arg14, %44 : i1
        %46 = comb.and %45, %36 : i1
        %47 = comb.or %46, %43 : i1
        %48 = comb.xor %47, %true : i1
        %49 = comb.or %45, %47 : i1
        %50 = comb.xor %isFirstCycle, %true : i1
        %51 = comb.and %50, %_sh1_3 : i1
        %52 = comb.xor %51, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %53 = comb.xor %49, %true_5 : i1
        %54 = comb.xor %45, %true : i1
        %55 = comb.and %54, %36 : i1
        %56 = comb.or %55, %43 : i1
        %57 = comb.xor %45, %true : i1
        %58 = comb.and %45, %56 : i1
        %false_7 = hw.constant false
        %59 = comb.mux %57, %43, %58 : i1
        %60 = comb.mux %57, %nack_transaction_q, %45 : i1
        %true_8 = hw.constant true
        %61 = comb.xor %41, %true_8 : i1
        %62 = comb.or %61, %restart_det_q : i1
        %63 = comb.or %42, %60 : i1
        %64 = comb.and %57, %48 : i1
        %false_9 = hw.constant false
        verif.assert %52 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_7 : i1
        fsm.update %restart_det_q, %62 : i1
        fsm.update %nack_transaction_q, %63 : i1
        %65 = comb.xor %64, %true : i1
        %66 = comb.and %53, %64 : i1
        %67 = comb.mux %66, %2, %c1_i16 : i16
        %68 = comb.mux %65, %3, %67 : i16
        %69 = comb.mux bin %59, %4, %stretch_active_cnt : i31
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
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1_3 : i1
        %7 = comb.xor %6, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %8 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %9 = comb.and %4, %arg5, %0 : i1
        %10 = comb.extract %8 from 2 : (i4) -> i2
        %11 = comb.extract %8 from 0 : (i4) -> i1
        %12 = comb.concat %10, %11 : i2, i1
        %c1_i3 = hw.constant 1 : i3
        %13 = comb.icmp eq %12, %c1_i3 : i3
        %true_4 = hw.constant true
        %14 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %15 = comb.xor %9, %true_5 : i1
        %16 = comb.and %15, %14, %2, %13 : i1
        %17 = comb.or %3, %16 : i1
        %18 = comb.and %arg5, %17 : i1
        verif.assert %7 : i1
        fsm.return %18
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %true_6 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.and %arg3, %38 : i1
        %40 = comb.xor %39, %true : i1
        %41 = comb.or %37, %40 : i1
        %42 = comb.and %38, %40, %arg16 : i1
        %43 = comb.icmp ult %35, %c3_i7 : i7
        %44 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %45 = comb.and %arg14, %44 : i1
        %46 = comb.and %45, %36 : i1
        %47 = comb.or %46, %43 : i1
        %48 = comb.xor %47, %true : i1
        %49 = comb.or %45, %47 : i1
        %50 = comb.xor %isFirstCycle, %true : i1
        %51 = comb.and %50, %_sh1_3 : i1
        %52 = comb.xor %51, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %53 = comb.xor %49, %true_5 : i1
        %54 = comb.xor %45, %true : i1
        %55 = comb.and %54, %36 : i1
        %56 = comb.or %55, %43 : i1
        %57 = comb.xor %45, %true : i1
        %58 = comb.and %45, %56 : i1
        %false_7 = hw.constant false
        %59 = comb.mux %57, %43, %58 : i1
        %60 = comb.mux %57, %nack_transaction_q, %45 : i1
        %true_8 = hw.constant true
        %61 = comb.xor %41, %true_8 : i1
        %62 = comb.or %61, %restart_det_q : i1
        %63 = comb.or %42, %60 : i1
        %64 = comb.and %57, %48 : i1
        %false_9 = hw.constant false
        verif.assert %52 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_7 : i1
        fsm.update %restart_det_q, %62 : i1
        fsm.update %nack_transaction_q, %63 : i1
        %65 = comb.xor %64, %true : i1
        %66 = comb.and %53, %64 : i1
        %67 = comb.mux %66, %2, %c1_i16 : i16
        %68 = comb.mux %65, %3, %67 : i16
        %69 = comb.mux bin %59, %4, %stretch_active_cnt : i31
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
        %6 = comb.xor %isFirstCycle, %true : i1
        %7 = comb.and %6, %_sh1_3 : i1
        %8 = comb.xor %7, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %9 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %10 = comb.and %5, %arg5, %0 : i1
        %11 = comb.extract %9 from 2 : (i4) -> i2
        %12 = comb.extract %9 from 0 : (i4) -> i1
        %13 = comb.concat %11, %12 : i2, i1
        %c0_i3 = hw.constant 0 : i3
        %14 = comb.icmp eq %13, %c0_i3 : i3
        %true_4 = hw.constant true
        %15 = comb.xor %arg16, %true_4 : i1
        %16 = comb.and %15, %2, %14 : i1
        %17 = comb.or %10, %16 : i1
        %true_5 = hw.constant true
        %18 = comb.xor %4, %true_5 : i1
        %19 = comb.and %18, %17 : i1
        %20 = comb.or %3, %19 : i1
        verif.assert %8 : i1
        fsm.return %20
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %true_6 = hw.constant true
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
        %47 = comb.and %46, %36 : i1
        %48 = comb.or %47, %44 : i1
        %49 = comb.xor %48, %true : i1
        %50 = comb.or %46, %48 : i1
        %51 = comb.xor %isFirstCycle, %true : i1
        %52 = comb.and %51, %_sh1_3 : i1
        %53 = comb.xor %52, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        %54 = comb.xor %50, %true_5 : i1
        %55 = comb.xor %46, %true : i1
        %56 = comb.and %55, %36 : i1
        %57 = comb.or %56, %44 : i1
        %58 = comb.xor %46, %true : i1
        %59 = comb.and %46, %57 : i1
        %false_7 = hw.constant false
        %60 = comb.mux %58, %44, %59 : i1
        %61 = comb.mux %58, %nack_transaction_q, %46 : i1
        %true_8 = hw.constant true
        %62 = comb.xor %42, %true_8 : i1
        %63 = comb.or %62, %restart_det_q : i1
        %64 = comb.or %43, %61 : i1
        %65 = comb.and %58, %49 : i1
        %false_9 = hw.constant false
        verif.assert %53 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_7 : i1
        fsm.update %restart_det_q, %63 : i1
        fsm.update %nack_transaction_q, %64 : i1
        %66 = comb.xor %65, %true : i1
        %67 = comb.or %65, %arg5 : i1
        %68 = comb.mux %67, %c1_i16, %tcount_q : i16
        %69 = comb.and %54, %65 : i1
        %70 = comb.mux %69, %2, %68 : i16
        %71 = comb.and %arg5, %66 : i1
        %72 = comb.mux %71, %3, %70 : i16
        %73 = comb.mux bin %60, %4, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %73 : i31
        fsm.update %tcount_q, %72 : i16
      }
    }
    fsm.state @state_21 output {
      %true = hw.constant true
      %c0_i6 = hw.constant 0 : i6
      %c3_i7 = hw.constant 3 : i7
      %c-64_i7 = hw.constant -64 : i7
      %c0_i11 = hw.constant 0 : i11
      %false_4 = hw.constant false
      %c-2_i2 = hw.constant -2 : i2
      %0 = comb.sub %c-64_i7, %arg8 : i7
      %1 = comb.and %arg5, %xfer_for_us_q, %rw_bit_q, %arg4 : i1
      %2 = comb.xor %nack_transaction_q, %true : i1
      %3 = comb.concat %false_4, %restart_det_q, %true, %input_byte : i1, i1, i1, i8
      %4 = comb.extract %0 from 1 : (i7) -> i6
      %5 = comb.icmp ne %4, %c0_i6 : i6
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
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
      %false_9 = hw.constant false
      %21 = comb.xor %isFirstCycle, %true : i1
      %22 = comb.and %21, %_sh1_3 : i1
      %23 = comb.xor %22, %true : i1
      %24 = comb.xor %18, %true : i1
      %25 = comb.concat %c-2_i2, %20, %input_byte : i2, i1, i8
      %26 = comb.xor %20, %true : i1
      %27 = comb.and %26, %18 : i1
      %28 = comb.xor %27, %true : i1
      %29 = comb.and %27, %nack_transaction_q : i1
      %30 = comb.xor %20, %true : i1
      %31 = comb.or %20, %29 : i1
      %32 = comb.mux %30, %c0_i11, %25 : i11
      %33 = comb.and %20, %5 : i1
      %34 = comb.and %24, %26 : i1
      %35 = comb.xor %34, %true : i1
      %true_10 = hw.constant true
      %36 = comb.xor %34, %true_10 : i1
      %37 = comb.and %36, %30, %28 : i1
      %38 = comb.or %34, %33 : i1
      %39 = comb.mux %34, %3, %32 : i11
      %40 = comb.and %35, %30, %28 : i1
      %false_11 = hw.constant false
      %41 = comb.mux %34, %nack_transaction_q, %31 : i1
      %42 = comb.mux %7, %xact_for_us_q, %38 : i1
      %43 = comb.mux %7, %9, %39 : i11
      %44 = comb.or %15, %41 : i1
      %45 = comb.or %23, %37 : i1
      verif.assert %45 : i1
      %46 = comb.and %2, %44 : i1
      fsm.output %37, %true_5, %false_6, %false_7, %42, %43, %18, %40, %auto_ack_cnt_q, %false_11, %input_byte, %46, %14, %false_9, %1, %16, %17, %false_8 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %12, %2 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %4, %true : i1
        %16 = comb.and %11, %12 : i1
        %17 = comb.xor %16, %true : i1
        %true_4 = hw.constant true
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %18, %15, %14 : i1
        %20 = comb.and %17, %15, %14 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %21, %5 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %7, %23, %1 : i1
        %25 = comb.and %23, %6 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %13, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %arg16, %true_6 : i1
        %true_7 = hw.constant true
        %28 = comb.xor %24, %true_7 : i1
        %true_8 = hw.constant true
        %29 = comb.xor %25, %true_8 : i1
        %true_9 = hw.constant true
        %30 = comb.xor %22, %true_9 : i1
        %31 = comb.and %30, %29, %28, %27, %26, %16, %rw_bit_q : i1
        %32 = comb.or %10, %19 : i1
        verif.assert %32 : i1
        fsm.return %31
      } action {
        %true = hw.constant true
        fsm.update %true, %true : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true_4 : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true_4 : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true_4 : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true_4 : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true_4 : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true_4 : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true_4 : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true_4 : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %31 = comb.xor %30, %true_4 : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true_4 : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %isFirstCycle, %true_4 : i1
        %36 = comb.and %35, %_sh1_3 : i1
        %37 = comb.xor %36, %true_4 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %tcount_q, %1 : i16
        %false_7 = hw.constant false
        %true_8 = hw.constant true
        %38 = comb.xor %34, %true_8 : i1
        %39 = comb.or %38, %restart_det_q : i1
        %false_9 = hw.constant false
        verif.assert %37 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_7 : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %39 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %12, %2 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %4, %true : i1
        %16 = comb.and %11, %12 : i1
        %17 = comb.xor %16, %true : i1
        %true_4 = hw.constant true
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %18, %15, %14 : i1
        %20 = comb.and %17, %15, %14 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %21, %5 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %7, %23, %1 : i1
        %25 = comb.and %23, %6 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %24, %true_6 : i1
        %true_7 = hw.constant true
        %28 = comb.xor %25, %true_7 : i1
        %true_8 = hw.constant true
        %29 = comb.xor %22, %true_8 : i1
        %30 = comb.and %29, %28, %27, %26, %13 : i1
        %31 = comb.or %10, %19 : i1
        verif.assert %31 : i1
        fsm.return %30
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
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
        %true_5 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %isFirstCycle, %true : i1
        %37 = comb.and %36, %_sh1_3 : i1
        %38 = comb.xor %37, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %tcount_q, %1 : i16
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %39 = comb.xor %35, %true_7 : i1
        %40 = comb.or %39, %restart_det_q : i1
        %false_8 = hw.constant false
        verif.assert %38 : i1
        fsm.update %_sh1_3, %false_8 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %40 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %2 : i31
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %12, %2 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %4, %true : i1
        %16 = comb.and %11, %12 : i1
        %17 = comb.xor %16, %true : i1
        %true_4 = hw.constant true
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %18, %15, %14 : i1
        %20 = comb.and %17, %15, %14 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %21, %5 : i1
        %23 = comb.xor %22, %true : i1
        %24 = comb.and %7, %23, %1 : i1
        %25 = comb.and %23, %6 : i1
        %true_5 = hw.constant true
        %26 = comb.xor %rw_bit_q, %true_5 : i1
        %true_6 = hw.constant true
        %27 = comb.xor %13, %true_6 : i1
        %true_7 = hw.constant true
        %28 = comb.xor %arg16, %true_7 : i1
        %true_8 = hw.constant true
        %29 = comb.xor %24, %true_8 : i1
        %true_9 = hw.constant true
        %30 = comb.xor %25, %true_9 : i1
        %true_10 = hw.constant true
        %31 = comb.xor %22, %true_10 : i1
        %32 = comb.and %31, %30, %29, %28, %27, %16, %26 : i1
        %33 = comb.or %10, %19 : i1
        verif.assert %33 : i1
        fsm.return %32
      } action {
        %false_4 = hw.constant false
        fsm.update %false_4, %false_4 : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
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
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %isFirstCycle, %true : i1
        %36 = comb.and %35, %_sh1_3 : i1
        %37 = comb.xor %36, %true : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %tcount_q, %1 : i16
        %false_7 = hw.constant false
        %true_8 = hw.constant true
        %38 = comb.xor %34, %true_8 : i1
        %39 = comb.or %38, %restart_det_q : i1
        %false_9 = hw.constant false
        verif.assert %37 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_7 : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %39 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %12, %2 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %4, %true : i1
        %16 = comb.and %11, %12 : i1
        %17 = comb.xor %16, %true : i1
        %true_4 = hw.constant true
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %18, %15, %14 : i1
        %20 = comb.and %17, %15, %14 : i1
        %21 = comb.xor %20, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %22 = comb.mux %4, %c-3_i4, %c0_i4 : i4
        %23 = comb.and %21, %5 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %7, %24, %1 : i1
        %26 = comb.and %24, %6 : i1
        %27 = comb.extract %22 from 2 : (i4) -> i2
        %28 = comb.extract %22 from 0 : (i4) -> i1
        %29 = comb.concat %27, %28 : i2, i1
        %c-1_i3 = hw.constant -1 : i3
        %30 = comb.icmp eq %29, %c-1_i3 : i3
        %true_5 = hw.constant true
        %31 = comb.xor %16, %true_5 : i1
        %true_6 = hw.constant true
        %32 = comb.xor %13, %true_6 : i1
        %33 = comb.and %32, %31, %30 : i1
        %34 = comb.or %arg16, %33 : i1
        %true_7 = hw.constant true
        %35 = comb.xor %25, %true_7 : i1
        %true_8 = hw.constant true
        %36 = comb.xor %26, %true_8 : i1
        %true_9 = hw.constant true
        %37 = comb.xor %23, %true_9 : i1
        %38 = comb.and %37, %36, %35, %34 : i1
        %39 = comb.or %10, %19 : i1
        verif.assert %39 : i1
        fsm.return %38
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
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
        %45 = comb.xor %isFirstCycle, %true : i1
        %46 = comb.and %45, %_sh1_3 : i1
        %47 = comb.xor %46, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %48 = comb.xor %42, %true : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %34 : i1
        %51 = comb.or %50, %42 : i1
        %52 = comb.xor %44, %true : i1
        %53 = comb.and %52, %42 : i1
        %54 = comb.xor %53, %true : i1
        %55 = comb.and %53, %nack_transaction_q : i1
        %56 = comb.xor %44, %true : i1
        %57 = comb.mux %44, %51, %53 : i1
        %58 = comb.or %44, %55 : i1
        %59 = comb.and %48, %52 : i1
        %60 = comb.xor %59, %true : i1
        %61 = comb.xor %59, %true_5 : i1
        %62 = comb.and %61, %56, %54 : i1
        %63 = comb.mux %59, %42, %57 : i1
        %64 = comb.and %60, %56, %54 : i1
        %65 = comb.or %59, %44, %53 : i1
        %66 = comb.and %65, %xact_for_us_q : i1
        %67 = comb.or %59, %44, %53 : i1
        %68 = comb.mux %67, %auto_ack_cnt_q, %c0_i9 : i9
        %69 = comb.or %59, %44, %53 : i1
        %70 = comb.and %69, %restart_det_q : i1
        %71 = comb.mux %59, %nack_transaction_q, %58 : i1
        %72 = comb.xor %64, %true : i1
        %73 = comb.mux %40, %70, %72 : i1
        %74 = comb.or %41, %71 : i1
        %75 = comb.icmp ult %_sh1, %62 : i1
        %76 = comb.or %47, %62 : i1
        verif.assert %76 : i1
        fsm.update %_sh1_3, %75 : i1
        fsm.update %_sh1, %62 : i1
        fsm.update %xact_for_us_q, %66 : i1
        fsm.update %restart_det_q, %73 : i1
        fsm.update %nack_transaction_q, %74 : i1
        fsm.update %auto_ack_cnt_q, %68 : i9
        %77 = comb.and %arg3, %64 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %63, %2, %78 : i31
        %80 = comb.or %63, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %12, %2 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %4, %true : i1
        %16 = comb.and %11, %12 : i1
        %17 = comb.xor %16, %true : i1
        %true_4 = hw.constant true
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %18, %15, %14 : i1
        %20 = comb.and %17, %15, %14 : i1
        %21 = comb.xor %20, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %22 = comb.mux %4, %c-3_i4, %c0_i4 : i4
        %23 = comb.and %21, %5 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %7, %24, %1 : i1
        %26 = comb.and %24, %6 : i1
        %27 = comb.extract %22 from 2 : (i4) -> i2
        %28 = comb.extract %22 from 0 : (i4) -> i1
        %29 = comb.concat %27, %28 : i2, i1
        %c1_i3 = hw.constant 1 : i3
        %30 = comb.icmp eq %29, %c1_i3 : i3
        %true_5 = hw.constant true
        %31 = comb.xor %16, %true_5 : i1
        %true_6 = hw.constant true
        %32 = comb.xor %13, %true_6 : i1
        %true_7 = hw.constant true
        %33 = comb.xor %arg16, %true_7 : i1
        %true_8 = hw.constant true
        %34 = comb.xor %25, %true_8 : i1
        %35 = comb.and %34, %33, %32, %31, %30 : i1
        %36 = comb.or %26, %35 : i1
        %true_9 = hw.constant true
        %37 = comb.xor %23, %true_9 : i1
        %38 = comb.and %37, %36 : i1
        %39 = comb.or %10, %19 : i1
        verif.assert %39 : i1
        fsm.return %38
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
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
        %45 = comb.xor %isFirstCycle, %true : i1
        %46 = comb.and %45, %_sh1_3 : i1
        %47 = comb.xor %46, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %48 = comb.xor %42, %true : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %34 : i1
        %51 = comb.or %50, %42 : i1
        %52 = comb.xor %44, %true : i1
        %53 = comb.and %52, %42 : i1
        %54 = comb.xor %53, %true : i1
        %55 = comb.and %53, %nack_transaction_q : i1
        %56 = comb.xor %44, %true : i1
        %57 = comb.mux %44, %51, %53 : i1
        %58 = comb.or %44, %55 : i1
        %59 = comb.and %48, %52 : i1
        %60 = comb.xor %59, %true : i1
        %61 = comb.xor %59, %true_5 : i1
        %62 = comb.and %61, %56, %54 : i1
        %63 = comb.mux %59, %42, %57 : i1
        %64 = comb.and %60, %56, %54 : i1
        %65 = comb.or %59, %44, %53 : i1
        %66 = comb.and %65, %xact_for_us_q : i1
        %67 = comb.or %59, %44, %53 : i1
        %68 = comb.mux %67, %auto_ack_cnt_q, %c0_i9 : i9
        %69 = comb.or %59, %44, %53 : i1
        %70 = comb.and %69, %restart_det_q : i1
        %71 = comb.mux %59, %nack_transaction_q, %58 : i1
        %72 = comb.xor %64, %true : i1
        %73 = comb.mux %40, %70, %72 : i1
        %74 = comb.or %41, %71 : i1
        %75 = comb.icmp ult %_sh1, %62 : i1
        %76 = comb.or %47, %62 : i1
        verif.assert %76 : i1
        fsm.update %_sh1_3, %75 : i1
        fsm.update %_sh1, %62 : i1
        fsm.update %xact_for_us_q, %66 : i1
        fsm.update %restart_det_q, %73 : i1
        fsm.update %nack_transaction_q, %74 : i1
        fsm.update %auto_ack_cnt_q, %68 : i9
        %77 = comb.and %arg3, %64 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %63, %2, %78 : i31
        %80 = comb.or %63, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.xor %2, %true : i1
        %12 = comb.xor %4, %true : i1
        %13 = comb.and %12, %2 : i1
        %14 = comb.xor %13, %true : i1
        %15 = comb.xor %4, %true : i1
        %16 = comb.and %11, %12 : i1
        %17 = comb.xor %16, %true : i1
        %true_4 = hw.constant true
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %18, %15, %14 : i1
        %20 = comb.and %17, %15, %14 : i1
        %21 = comb.xor %20, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %22 = comb.mux %4, %c-3_i4, %c0_i4 : i4
        %23 = comb.and %21, %5 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %7, %24, %1 : i1
        %26 = comb.and %24, %6 : i1
        %27 = comb.extract %22 from 2 : (i4) -> i2
        %28 = comb.extract %22 from 0 : (i4) -> i1
        %29 = comb.concat %27, %28 : i2, i1
        %c0_i3 = hw.constant 0 : i3
        %30 = comb.icmp eq %29, %c0_i3 : i3
        %true_5 = hw.constant true
        %31 = comb.xor %16, %true_5 : i1
        %true_6 = hw.constant true
        %32 = comb.xor %13, %true_6 : i1
        %true_7 = hw.constant true
        %33 = comb.xor %arg16, %true_7 : i1
        %34 = comb.and %33, %32, %31, %30 : i1
        %35 = comb.or %25, %34 : i1
        %true_8 = hw.constant true
        %36 = comb.xor %26, %true_8 : i1
        %37 = comb.and %36, %35 : i1
        %38 = comb.or %23, %37 : i1
        %39 = comb.or %10, %19 : i1
        verif.assert %39 : i1
        fsm.return %38
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
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
        %45 = comb.xor %isFirstCycle, %true : i1
        %46 = comb.and %45, %_sh1_3 : i1
        %47 = comb.xor %46, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        fsm.update %tcount_q, %1 : i16
        %48 = comb.xor %42, %true : i1
        %49 = comb.xor %44, %true : i1
        %50 = comb.and %49, %34 : i1
        %51 = comb.or %50, %42 : i1
        %52 = comb.xor %44, %true : i1
        %53 = comb.and %52, %42 : i1
        %54 = comb.xor %53, %true : i1
        %55 = comb.and %53, %nack_transaction_q : i1
        %56 = comb.xor %44, %true : i1
        %57 = comb.mux %44, %51, %53 : i1
        %58 = comb.or %44, %55 : i1
        %59 = comb.and %48, %52 : i1
        %60 = comb.xor %59, %true : i1
        %61 = comb.xor %59, %true_5 : i1
        %62 = comb.and %61, %56, %54 : i1
        %63 = comb.mux %59, %42, %57 : i1
        %64 = comb.and %60, %56, %54 : i1
        %65 = comb.or %59, %44, %53 : i1
        %66 = comb.and %65, %xact_for_us_q : i1
        %67 = comb.or %59, %44, %53 : i1
        %68 = comb.mux %67, %auto_ack_cnt_q, %c0_i9 : i9
        %69 = comb.or %59, %44, %53 : i1
        %70 = comb.and %69, %restart_det_q : i1
        %71 = comb.mux %59, %nack_transaction_q, %58 : i1
        %72 = comb.xor %64, %true : i1
        %73 = comb.mux %40, %70, %72 : i1
        %74 = comb.or %41, %71 : i1
        %75 = comb.icmp ult %_sh1, %62 : i1
        %76 = comb.or %47, %62 : i1
        verif.assert %76 : i1
        fsm.update %_sh1_3, %75 : i1
        fsm.update %_sh1, %62 : i1
        fsm.update %xact_for_us_q, %66 : i1
        fsm.update %restart_det_q, %73 : i1
        fsm.update %nack_transaction_q, %74 : i1
        fsm.update %auto_ack_cnt_q, %68 : i9
        %77 = comb.and %arg3, %64 : i1
        %78 = comb.mux %77, %c0_i31, %stretch_active_cnt : i31
        %79 = comb.mux %63, %2, %78 : i31
        %80 = comb.or %63, %77 : i1
        %81 = comb.mux bin %80, %79, %stretch_active_cnt : i31
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %true_7 = hw.constant true
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_7, %false_4, %true_5, %false_8, %10, %11, %18, %false_6, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %30 = comb.xor %29, %true : i1
        %31 = comb.and %arg3, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.or %29, %32 : i1
        %34 = comb.xor %33, %true_7 : i1
        %35 = comb.or %34, %restart_det_q : i1
        %36 = comb.and %30, %32 : i1
        %37 = comb.or %36, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %38 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %38 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %35 : i1
        fsm.update %nack_transaction_q, %37 : i1
        %39 = comb.mux %arg1, %1, %0 : i16
        fsm.update %tcount_q, %39 : i16
      }
      fsm.transition @state_6 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %1, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %18 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %19 = comb.xor %18, %true_4 : i1
        %20 = comb.and %arg3, %19 : i1
        %21 = comb.xor %20, %true_4 : i1
        %22 = comb.or %18, %21 : i1
        %23 = comb.xor %22, %true_8 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %true_9 = hw.constant true
        %25 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %25 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %scl_i_q, %true : i1
        %4 = comb.and %3, %arg1 : i1
        %5 = comb.xor %2, %true : i1
        %6 = comb.extract %input_byte from 0 : (i8) -> i7
        %7 = comb.concat %6, %arg2 : i7, i1
        %8 = comb.and %5, %4 : i1
        %9 = comb.mux %8, %7, %c0_i8 : i8
        %10 = comb.and %4, %2 : i1
        %11 = comb.xor %4, %true : i1
        %12 = comb.or %11, %10 : i1
        %13 = comb.mux bin %12, %input_byte, %9 : i8
        %14 = comb.xor %arg2, %true : i1
        %15 = comb.and %4, %5 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.and %4, %16, %14 : i1
        %18 = comb.and %4, %16 : i1
        %19 = comb.mux bin %18, %17, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %20 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %21 = comb.xor %20, %true_7 : i1
        %22 = comb.or %21, %restart_det_q : i1
        %true_8 = hw.constant true
        %23 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %23 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %19 : i1
        fsm.update %input_byte, %13 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %22 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        %24 = comb.mux %arg1, %1, %0 : i16
        fsm.update %tcount_q, %24 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.and %arg5, %arg1 : i1
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_7 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_7 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.xor %arg1, %true : i1
        %true_8 = hw.constant true
        %41 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %41 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %42 = comb.or %40, %arg5 : i1
        %43 = comb.mux %42, %c1_i16, %tcount_q : i16
        %44 = comb.mux %arg1, %43, %0 : i16
        %45 = comb.mux %2, %1, %44 : i16
        fsm.update %tcount_q, %45 : i16
      }
    }
    fsm.state @state_8 output {
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
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
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
      %false_10 = hw.constant false
      %true_11 = hw.constant true
      verif.assert %true_11 : i1
      %32 = comb.and %11, %28 : i1
      fsm.output %true_6, %15, %true_4, %false_7, %23, %24, %31, %false_5, %auto_ack_cnt_q, %false_8, %input_byte, %32, %26, %false_10, %10, %29, %30, %false_9 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i5 = hw.constant 0 : i5
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %18 = comb.extract %arg7 from 0 : (i8) -> i1
        %19 = comb.extract %arg7 from 1 : (i8) -> i1
        %20 = comb.extract %arg7 from 2 : (i8) -> i1
        %21 = comb.extract %arg7 from 3 : (i8) -> i1
        %22 = comb.extract %arg7 from 4 : (i8) -> i1
        %23 = comb.extract %arg7 from 5 : (i8) -> i1
        %24 = comb.extract %arg7 from 6 : (i8) -> i1
        %25 = comb.extract %arg7 from 7 : (i8) -> i1
        %26 = comb.concat %18, %19, %20, %21, %22, %23, %24, %25 : i1, i1, i1, i1, i1, i1, i1, i1
        %27 = comb.extract %bit_idx from 0 : (i4) -> i3
        %28 = comb.concat %c0_i5, %27 : i5, i3
        %29 = comb.shru %26, %28 : i8
        %30 = comb.extract %29 from 0 : (i8) -> i1
        %true_6 = hw.constant true
        %31 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %32 = comb.xor %31, %true_4 : i1
        %33 = comb.and %arg3, %32 : i1
        %34 = comb.xor %33, %true_4 : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_7 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %true_8 = hw.constant true
        %38 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %38 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %30 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %3, %true_6 : i1
        %true_7 = hw.constant true
        %7 = comb.xor %1, %true_7 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i5 = hw.constant 0 : i5
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %8 = comb.extract %arg7 from 0 : (i8) -> i1
        %9 = comb.extract %arg7 from 1 : (i8) -> i1
        %10 = comb.extract %arg7 from 2 : (i8) -> i1
        %11 = comb.extract %arg7 from 3 : (i8) -> i1
        %12 = comb.extract %arg7 from 4 : (i8) -> i1
        %13 = comb.extract %arg7 from 5 : (i8) -> i1
        %14 = comb.extract %arg7 from 6 : (i8) -> i1
        %15 = comb.extract %arg7 from 7 : (i8) -> i1
        %16 = comb.concat %8, %9, %10, %11, %12, %13, %14, %15 : i1, i1, i1, i1, i1, i1, i1, i1
        %17 = comb.extract %bit_idx from 0 : (i4) -> i3
        %18 = comb.concat %c0_i5, %17 : i5, i3
        %19 = comb.shru %16, %18 : i8
        %20 = comb.extract %19 from 0 : (i8) -> i1
        %true_6 = hw.constant true
        %21 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %21, %true : i1
        %23 = comb.and %arg3, %22 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.or %21, %24 : i1
        %26 = comb.xor %25, %true_7 : i1
        %27 = comb.or %26, %restart_det_q : i1
        %true_8 = hw.constant true
        %28 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %28 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %20 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %27 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %24 = comb.xor %isFirstCycle, %true : i1
      %25 = comb.and %24, %_sh1_3 : i1
      %26 = comb.xor %25, %true : i1
      verif.assert %26 : i1
      %27 = comb.xor %19, %true : i1
      %28 = comb.or %14, %19, %nack_transaction_q : i1
      %29 = comb.mux %27, %23, %19 : i1
      %30 = comb.and %2, %28 : i1
      fsm.output %false_6, %true_5, %false_7, %false_8, %10, %11, %17, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %30, %13, %29, %1, %15, %16, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_25 guard {
        %true = hw.constant true
        %0 = comb.xor %isFirstCycle, %true : i1
        %1 = comb.and %0, %_sh1_3 : i1
        %2 = comb.xor %1, %true : i1
        %false_4 = hw.constant false
        verif.assert %2 : i1
        fsm.return %false_4
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %false_6 = hw.constant false
        %36 = comb.xor %7, %true : i1
        %true_7 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_8 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_8 : i1
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
        %54 = comb.mux %49, %47, %53 : i1
        %55 = comb.xor %54, %true : i1
        %56 = comb.or %49, %54 : i1
        %57 = comb.xor %isFirstCycle, %true : i1
        %false_9 = hw.constant false
        %58 = comb.and %57, %_sh1_3 : i1
        %59 = comb.xor %58, %true : i1
        verif.assert %59 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_7 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %restart_det_q, %44 : i1
        %60 = comb.xor %56, %true_5 : i1
        %61 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        %62 = comb.xor %49, %true : i1
        %63 = comb.or %45, %49, %nack_transaction_q : i1
        %64 = comb.and %62, %55 : i1
        fsm.update %nack_transaction_q, %63 : i1
        fsm.update %stretch_active_cnt, %61 : i31
        %65 = comb.xor %64, %true : i1
        %66 = comb.or %64, %arg5 : i1
        %67 = comb.mux %66, %c1_i16, %tcount_q : i16
        %68 = comb.and %60, %64 : i1
        %69 = comb.mux %68, %2, %67 : i16
        %70 = comb.and %arg5, %65 : i1
        %71 = comb.mux %70, %3, %69 : i16
        fsm.update %tcount_q, %71 : i16
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
        %16 = comb.xor %isFirstCycle, %true : i1
        %17 = comb.and %16, %_sh1_3 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.xor %9, %true : i1
        %20 = comb.mux %19, %13, %7 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.and %15, %arg5, %5 : i1
        %true_4 = hw.constant true
        %23 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %24 = comb.xor %22, %true_5 : i1
        %true_6 = hw.constant true
        %25 = comb.xor %14, %true_6 : i1
        %26 = comb.and %arg5, %25, %24, %23, %19, %21 : i1
        verif.assert %18 : i1
        fsm.return %26
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
        %3 = comb.add %tcount_q, %c-1_i16 : i16
        %4 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %5 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %6 = comb.xor %arg1, %true : i1
        %7 = comb.and %scl_i_q, %6 : i1
        %8 = comb.add %bit_idx, %c1_i4 : i4
        %9 = comb.xor %arg3, %true : i1
        %10 = comb.or %arg3, %7 : i1
        %11 = comb.mux %10, %c0_i4, %bit_idx : i4
        %12 = comb.xor %5, %true : i1
        %13 = comb.and %12, %7, %9 : i1
        %14 = comb.mux %13, %8, %11 : i4
        %15 = comb.xor %scl_i_q, %true : i1
        %16 = comb.and %15, %arg1 : i1
        %17 = comb.xor %5, %true : i1
        %18 = comb.extract %input_byte from 0 : (i8) -> i7
        %19 = comb.concat %18, %arg2 : i7, i1
        %20 = comb.and %17, %16 : i1
        %21 = comb.mux %20, %19, %c0_i8 : i8
        %22 = comb.and %16, %5 : i1
        %23 = comb.xor %16, %true : i1
        %24 = comb.or %23, %22 : i1
        %25 = comb.mux bin %24, %input_byte, %21 : i8
        %26 = comb.xor %arg2, %true : i1
        %27 = comb.and %16, %17 : i1
        %28 = comb.xor %27, %true : i1
        %29 = comb.and %16, %28, %26 : i1
        %30 = comb.and %16, %28 : i1
        %31 = comb.mux bin %30, %29, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %32 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %33 = comb.xor %32, %true : i1
        %34 = comb.and %arg3, %33 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.or %32, %35 : i1
        %37 = comb.xor %36, %true_7 : i1
        %38 = comb.or %37, %restart_det_q : i1
        %39 = comb.xor %arg6, %true : i1
        %40 = comb.extract %arg8 from 1 : (i7) -> i6
        %41 = comb.icmp ne %40, %c0_i6 : i6
        %42 = comb.or %39, %arg18, %41 : i1
        %43 = comb.xor %isFirstCycle, %true : i1
        %false_8 = hw.constant false
        %44 = comb.and %43, %_sh1_3 : i1
        %45 = comb.xor %44, %true : i1
        verif.assert %45 : i1
        fsm.update %_sh1_3, %false_8 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %31 : i1
        fsm.update %input_byte, %25 : i8
        fsm.update %bit_idx, %14 : i4
        fsm.update %restart_det_q, %38 : i1
        %46 = comb.mux bin %42, %4, %stretch_active_cnt : i31
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %stretch_active_cnt, %46 : i31
        %47 = comb.mux %42, %3, %2 : i16
        fsm.update %tcount_q, %47 : i16
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
        %16 = comb.xor %isFirstCycle, %true : i1
        %17 = comb.and %16, %_sh1_3 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.xor %9, %true : i1
        %20 = comb.mux %9, %7, %13 : i1
        %21 = comb.and %15, %arg5, %5 : i1
        %true_4 = hw.constant true
        %22 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %23 = comb.xor %21, %true_5 : i1
        %true_6 = hw.constant true
        %24 = comb.xor %14, %true_6 : i1
        %25 = comb.and %arg5, %24, %23, %22, %19, %20 : i1
        verif.assert %18 : i1
        fsm.return %25
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        %true = hw.constant true
        %c0_i6 = hw.constant 0 : i6
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %stretch_active_cnt, %c1_i31 : i31
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %30 = comb.xor %29, %true : i1
        %31 = comb.and %arg3, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.or %29, %32 : i1
        %34 = comb.xor %33, %true_7 : i1
        %35 = comb.or %34, %restart_det_q : i1
        %36 = comb.xor %arg6, %true : i1
        %37 = comb.extract %arg8 from 1 : (i7) -> i6
        %38 = comb.icmp ne %37, %c0_i6 : i6
        %39 = comb.or %36, %arg18, %38 : i1
        %40 = comb.xor %isFirstCycle, %true : i1
        %false_8 = hw.constant false
        %41 = comb.and %40, %_sh1_3 : i1
        %42 = comb.xor %41, %true : i1
        verif.assert %42 : i1
        fsm.update %_sh1_3, %false_8 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %35 : i1
        %43 = comb.mux bin %39, %1, %stretch_active_cnt : i31
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %stretch_active_cnt, %43 : i31
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1_3 : i1
        %7 = comb.xor %6, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %8 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %9 = comb.and %4, %arg5, %0 : i1
        %10 = comb.extract %8 from 2 : (i4) -> i2
        %11 = comb.extract %8 from 0 : (i4) -> i1
        %12 = comb.concat %10, %11 : i2, i1
        %c-1_i3 = hw.constant -1 : i3
        %13 = comb.icmp eq %12, %c-1_i3 : i3
        %14 = comb.and %2, %13 : i1
        %15 = comb.or %arg16, %14 : i1
        %true_4 = hw.constant true
        %16 = comb.xor %9, %true_4 : i1
        %true_5 = hw.constant true
        %17 = comb.xor %3, %true_5 : i1
        %18 = comb.and %arg5, %17, %16, %15 : i1
        verif.assert %7 : i1
        fsm.return %18
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %false_6 = hw.constant false
        %36 = comb.xor %7, %true : i1
        %true_7 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %38 = comb.xor %37, %true : i1
        %39 = comb.and %arg3, %38 : i1
        %40 = comb.xor %39, %true : i1
        %41 = comb.or %37, %40 : i1
        %42 = comb.xor %41, %true_8 : i1
        %43 = comb.or %42, %restart_det_q : i1
        %44 = comb.and %38, %40, %arg16 : i1
        %45 = comb.icmp ult %35, %c3_i7 : i7
        %46 = comb.or %45, %36 : i1
        %47 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %48 = comb.and %arg14, %47 : i1
        %49 = comb.xor %arg6, %true : i1
        %50 = comb.extract %arg8 from 1 : (i7) -> i6
        %51 = comb.icmp ne %50, %c0_i6 : i6
        %52 = comb.or %49, %arg18, %51 : i1
        %53 = comb.mux %48, %46, %52 : i1
        %54 = comb.xor %53, %true : i1
        %55 = comb.or %48, %53 : i1
        %56 = comb.xor %isFirstCycle, %true : i1
        %false_9 = hw.constant false
        %57 = comb.and %56, %_sh1_3 : i1
        %58 = comb.xor %57, %true : i1
        verif.assert %58 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_7 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %restart_det_q, %43 : i1
        %59 = comb.xor %55, %true_5 : i1
        %60 = comb.mux bin %52, %4, %stretch_active_cnt : i31
        %61 = comb.xor %48, %true : i1
        %62 = comb.or %44, %48, %nack_transaction_q : i1
        %63 = comb.and %61, %54 : i1
        fsm.update %nack_transaction_q, %62 : i1
        fsm.update %stretch_active_cnt, %60 : i31
        %64 = comb.xor %63, %true : i1
        %65 = comb.and %59, %63 : i1
        %66 = comb.mux %65, %2, %c1_i16 : i16
        %67 = comb.mux %64, %3, %66 : i16
        fsm.update %tcount_q, %67 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.xor %isFirstCycle, %true : i1
        %6 = comb.and %5, %_sh1_3 : i1
        %7 = comb.xor %6, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %8 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %9 = comb.and %4, %arg5, %0 : i1
        %10 = comb.extract %8 from 2 : (i4) -> i2
        %11 = comb.extract %8 from 0 : (i4) -> i1
        %12 = comb.concat %10, %11 : i2, i1
        %c1_i3 = hw.constant 1 : i3
        %13 = comb.icmp eq %12, %c1_i3 : i3
        %true_4 = hw.constant true
        %14 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %15 = comb.xor %9, %true_5 : i1
        %16 = comb.and %15, %14, %2, %13 : i1
        %17 = comb.or %3, %16 : i1
        %18 = comb.and %arg5, %17 : i1
        verif.assert %7 : i1
        fsm.return %18
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %false_6 = hw.constant false
        %36 = comb.xor %7, %true : i1
        %true_7 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %38 = comb.xor %37, %true : i1
        %39 = comb.and %arg3, %38 : i1
        %40 = comb.xor %39, %true : i1
        %41 = comb.or %37, %40 : i1
        %42 = comb.xor %41, %true_8 : i1
        %43 = comb.or %42, %restart_det_q : i1
        %44 = comb.and %38, %40, %arg16 : i1
        %45 = comb.icmp ult %35, %c3_i7 : i7
        %46 = comb.or %45, %36 : i1
        %47 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %48 = comb.and %arg14, %47 : i1
        %49 = comb.xor %arg6, %true : i1
        %50 = comb.extract %arg8 from 1 : (i7) -> i6
        %51 = comb.icmp ne %50, %c0_i6 : i6
        %52 = comb.or %49, %arg18, %51 : i1
        %53 = comb.mux %48, %46, %52 : i1
        %54 = comb.xor %53, %true : i1
        %55 = comb.or %48, %53 : i1
        %56 = comb.xor %isFirstCycle, %true : i1
        %false_9 = hw.constant false
        %57 = comb.and %56, %_sh1_3 : i1
        %58 = comb.xor %57, %true : i1
        verif.assert %58 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_7 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %restart_det_q, %43 : i1
        %59 = comb.xor %55, %true_5 : i1
        %60 = comb.mux bin %52, %4, %stretch_active_cnt : i31
        %61 = comb.xor %48, %true : i1
        %62 = comb.or %44, %48, %nack_transaction_q : i1
        %63 = comb.and %61, %54 : i1
        fsm.update %nack_transaction_q, %62 : i1
        fsm.update %stretch_active_cnt, %60 : i31
        %64 = comb.xor %63, %true : i1
        %65 = comb.and %59, %63 : i1
        %66 = comb.mux %65, %2, %c1_i16 : i16
        %67 = comb.mux %64, %3, %66 : i16
        fsm.update %tcount_q, %67 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.icmp uge %stretch_active_cnt, %arg13 : i31
        %2 = comb.and %arg14, %1 : i1
        %3 = comb.xor %arg5, %true : i1
        %4 = comb.and %arg5, %arg3 : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.xor %isFirstCycle, %true : i1
        %7 = comb.and %6, %_sh1_3 : i1
        %8 = comb.xor %7, %true : i1
        %c-3_i4 = hw.constant -3 : i4
        %c0_i4 = hw.constant 0 : i4
        %9 = comb.mux %2, %c-3_i4, %c0_i4 : i4
        %10 = comb.and %5, %arg5, %0 : i1
        %11 = comb.extract %9 from 2 : (i4) -> i2
        %12 = comb.extract %9 from 0 : (i4) -> i1
        %13 = comb.concat %11, %12 : i2, i1
        %c0_i3 = hw.constant 0 : i3
        %14 = comb.icmp eq %13, %c0_i3 : i3
        %true_4 = hw.constant true
        %15 = comb.xor %arg16, %true_4 : i1
        %16 = comb.and %15, %2, %14 : i1
        %17 = comb.or %10, %16 : i1
        %true_5 = hw.constant true
        %18 = comb.xor %4, %true_5 : i1
        %19 = comb.and %18, %17 : i1
        %20 = comb.or %3, %19 : i1
        verif.assert %8 : i1
        fsm.return %20
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %false_6 = hw.constant false
        %36 = comb.xor %7, %true : i1
        %true_7 = hw.constant true
        %37 = comb.or %arg4, %arg17 : i1
        %38 = comb.and %arg5, %37 : i1
        %true_8 = hw.constant true
        %39 = comb.xor %38, %true : i1
        %40 = comb.and %arg5, %arg3, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.or %38, %41 : i1
        %43 = comb.xor %42, %true_8 : i1
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
        %54 = comb.mux %49, %47, %53 : i1
        %55 = comb.xor %54, %true : i1
        %56 = comb.or %49, %54 : i1
        %57 = comb.xor %isFirstCycle, %true : i1
        %false_9 = hw.constant false
        %58 = comb.and %57, %_sh1_3 : i1
        %59 = comb.xor %58, %true : i1
        verif.assert %59 : i1
        fsm.update %_sh1_3, %false_9 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_7 : i1
        fsm.update %host_ack, %34 : i1
        fsm.update %input_byte, %28 : i8
        fsm.update %bit_idx, %17 : i4
        fsm.update %restart_det_q, %44 : i1
        %60 = comb.xor %56, %true_5 : i1
        %61 = comb.mux bin %53, %4, %stretch_active_cnt : i31
        %62 = comb.xor %49, %true : i1
        %63 = comb.or %45, %49, %nack_transaction_q : i1
        %64 = comb.and %62, %55 : i1
        fsm.update %nack_transaction_q, %63 : i1
        fsm.update %stretch_active_cnt, %61 : i31
        %65 = comb.xor %64, %true : i1
        %66 = comb.or %64, %arg5 : i1
        %67 = comb.mux %66, %c1_i16, %tcount_q : i16
        %68 = comb.and %60, %64 : i1
        %69 = comb.mux %68, %2, %67 : i16
        %70 = comb.and %arg5, %65 : i1
        %71 = comb.mux %70, %3, %69 : i16
        fsm.update %tcount_q, %71 : i16
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %10, %11, %18, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
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
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %17, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %18, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %11, %true_7 : i1
        %23 = comb.and %arg5, %22, %21, %20, %19, %16, %15, %13 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %23
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %8 = comb.and %0, %2 : i1
        %9 = comb.mux %8, %nack_transaction_q, %5 : i1
        %10 = comb.and %2, %0 : i1
        %11 = comb.xor %9, %true : i1
        %12 = comb.and %11, %10 : i1
        %13 = comb.and %0, %3 : i1
        %14 = comb.and %7, %arg5, %4 : i1
        %true_4 = hw.constant true
        %15 = comb.xor %8, %true_4 : i1
        %true_5 = hw.constant true
        %16 = comb.xor %12, %true_5 : i1
        %true_6 = hw.constant true
        %17 = comb.xor %13, %true_6 : i1
        %true_7 = hw.constant true
        %18 = comb.xor %arg16, %true_7 : i1
        %true_8 = hw.constant true
        %19 = comb.xor %14, %true_8 : i1
        %true_9 = hw.constant true
        %20 = comb.xor %6, %true_9 : i1
        %21 = comb.and %arg5, %20, %19, %18, %17, %16, %10, %9, %15 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.return %21
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %15, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %17, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %arg16, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %18, %true_7 : i1
        %true_8 = hw.constant true
        %23 = comb.xor %11, %true_8 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20, %16, %19, %13 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.return %24
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_15 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %2 = comb.or %arg4, %arg17 : i1
        %3 = comb.and %arg5, %arg3 : i1
        %4 = comb.xor %3, %true : i1
        %5 = comb.and %4, %arg5, %2 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %7 = comb.xor %5, %true_5 : i1
        %true_6 = hw.constant true
        %8 = comb.xor %3, %true_6 : i1
        %9 = comb.and %arg5, %8, %7, %6, %0, %1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %9
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %13, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %15, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %17, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %arg16, %true_7 : i1
        %true_8 = hw.constant true
        %23 = comb.xor %18, %true_8 : i1
        %true_9 = hw.constant true
        %24 = comb.xor %11, %true_9 : i1
        %25 = comb.and %arg5, %24, %23, %22, %21, %16, %5, %3, %20, %19 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.return %25
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %8 = comb.and %0, %2 : i1
        %9 = comb.mux %8, %nack_transaction_q, %5 : i1
        %10 = comb.and %2, %0 : i1
        %11 = comb.and %10, %9 : i1
        %12 = comb.xor %9, %true : i1
        %13 = comb.and %12, %10 : i1
        %14 = comb.and %0, %3 : i1
        %15 = comb.and %7, %arg5, %4 : i1
        %16 = comb.mux %11, %8, %arg1 : i1
        %true_4 = hw.constant true
        %17 = comb.xor %13, %true_4 : i1
        %true_5 = hw.constant true
        %18 = comb.xor %14, %true_5 : i1
        %19 = comb.and %18, %17, %16 : i1
        %20 = comb.or %arg16, %19 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %15, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %6, %true_7 : i1
        %23 = comb.and %arg5, %22, %21, %20 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %23
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31, %arg16 : i1
        %36 = comb.or %35, %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %37 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %tcount_q, %0 : i16
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
        %13 = comb.and %3, %5 : i1
        %14 = comb.mux %13, %nack_transaction_q, %9 : i1
        %15 = comb.mux %13, %10, %rw_bit_q : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.and %3, %7 : i1
        %18 = comb.and %12, %arg5, %8 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %13, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %17, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %arg16, %true_6 : i1
        %true_7 = hw.constant true
        %22 = comb.xor %18, %true_7 : i1
        %true_8 = hw.constant true
        %23 = comb.xor %11, %true_8 : i1
        %24 = comb.and %arg5, %23, %22, %21, %20, %16, %5, %3, %15, %19 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.return %24
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %19 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %19, %true_7 : i1
        %21 = comb.or %20, %restart_det_q : i1
        %22 = comb.or %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %23 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %23 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %21 : i1
        fsm.update %nack_transaction_q, %22 : i1
        fsm.update %tcount_q, %0 : i16
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
        %9 = comb.and %0, %2 : i1
        %10 = comb.mux %9, %nack_transaction_q, %5 : i1
        %11 = comb.and %2, %0 : i1
        %12 = comb.and %11, %10 : i1
        %13 = comb.xor %10, %true : i1
        %14 = comb.and %13, %11 : i1
        %15 = comb.and %0, %3 : i1
        %16 = comb.and %8, %arg5, %4 : i1
        %true_4 = hw.constant true
        %17 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %18 = comb.xor %12, %true_5 : i1
        %true_6 = hw.constant true
        %19 = comb.xor %14, %true_6 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %15, %true_7 : i1
        %true_8 = hw.constant true
        %21 = comb.xor %arg16, %true_8 : i1
        %22 = comb.and %21, %20, %19, %18, %17 : i1
        %23 = comb.or %16, %22 : i1
        %true_9 = hw.constant true
        %24 = comb.xor %7, %true_9 : i1
        %25 = comb.and %24, %23 : i1
        %26 = comb.or %6, %25 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.return %26
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %arg1, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %39 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %39 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %19 = comb.xor %isFirstCycle, %true : i1
      %20 = comb.and %19, %_sh1_3 : i1
      %21 = comb.xor %20, %true : i1
      verif.assert %21 : i1
      %22 = comb.and %2, %15 : i1
      fsm.output %false_7, %false_4, %true_5, %false_8, %10, %11, %18, %false_6, %auto_ack_cnt_q, %false_9, %input_byte, %22, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_20 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %isFirstCycle, %true : i1
        %4 = comb.and %3, %_sh1_3 : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %2, %arg5, %0 : i1
        %7 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %true_4 = hw.constant true
        %8 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %6, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %1, %true_6 : i1
        %11 = comb.and %arg5, %10, %9, %8, %7 : i1
        verif.assert %5 : i1
        fsm.return %11
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %false_5 = hw.constant false
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %36 = comb.and %35, %_sh1_3 : i1
        %37 = comb.xor %36, %true : i1
        verif.assert %37 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.xor %isFirstCycle, %true : i1
        %5 = comb.and %4, %_sh1_3 : i1
        %6 = comb.xor %5, %true : i1
        %7 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %7, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %2, %true_6 : i1
        %11 = comb.and %arg5, %10, %9, %8, %0 : i1
        verif.assert %6 : i1
        fsm.return %11
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %false_5 = hw.constant false
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %36 = comb.and %35, %_sh1_3 : i1
        %37 = comb.xor %36, %true : i1
        verif.assert %37 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %19 = comb.xor %isFirstCycle, %true : i1
      %20 = comb.and %19, %_sh1_3 : i1
      %21 = comb.xor %20, %true : i1
      verif.assert %21 : i1
      %22 = comb.and %2, %15 : i1
      fsm.output %false_7, %false_4, %true_5, %false_8, %10, %11, %18, %false_6, %auto_ack_cnt_q, %false_9, %input_byte, %22, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_25 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %isFirstCycle, %true : i1
        %4 = comb.and %3, %_sh1_3 : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %2, %arg5, %0 : i1
        %7 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %true_4 = hw.constant true
        %8 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %6, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %1, %true_6 : i1
        %11 = comb.and %arg5, %10, %9, %8, %7 : i1
        verif.assert %5 : i1
        fsm.return %11
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %false_5 = hw.constant false
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %36 = comb.and %35, %_sh1_3 : i1
        %37 = comb.xor %36, %true : i1
        verif.assert %37 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_16 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.xor %isFirstCycle, %true : i1
        %5 = comb.and %4, %_sh1_3 : i1
        %6 = comb.xor %5, %true : i1
        %7 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %7, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %2, %true_6 : i1
        %11 = comb.and %arg5, %10, %9, %8, %0 : i1
        verif.assert %6 : i1
        fsm.return %11
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %false_5 = hw.constant false
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %36 = comb.and %35, %_sh1_3 : i1
        %37 = comb.xor %36, %true : i1
        verif.assert %37 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %isFirstCycle, %true : i1
        %4 = comb.and %3, %_sh1_3 : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %6, %true_4 : i1
        %true_5 = hw.constant true
        %8 = comb.xor %1, %true_5 : i1
        %9 = comb.and %arg5, %8, %7, %arg16 : i1
        verif.assert %5 : i1
        fsm.return %9
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %false_5 = hw.constant false
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31 : i1
        %36 = comb.or %35, %nack_transaction_q : i1
        %37 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %38 = comb.and %37, %_sh1_3 : i1
        %39 = comb.xor %38, %true : i1
        verif.assert %39 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %1 = comb.xor %isFirstCycle, %true : i1
        %2 = comb.and %1, %_sh1_3 : i1
        %3 = comb.xor %2, %true : i1
        verif.assert %3 : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %false_5 = hw.constant false
        %19 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %20 = comb.xor %19, %true_6 : i1
        %21 = comb.or %20, %restart_det_q : i1
        %22 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %23 = comb.and %22, %_sh1_3 : i1
        %24 = comb.xor %23, %true : i1
        verif.assert %24 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %21 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.xor %isFirstCycle, %true : i1
        %5 = comb.and %4, %_sh1_3 : i1
        %6 = comb.xor %5, %true : i1
        %true_4 = hw.constant true
        %7 = comb.xor %2, %true_4 : i1
        %8 = comb.and %7, %3, %arg5, %0 : i1
        %9 = comb.or %1, %8 : i1
        verif.assert %6 : i1
        fsm.return %9
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %false_5 = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_6 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_6 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %39 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %40 = comb.and %39, %_sh1_3 : i1
        %41 = comb.xor %40, %true : i1
        verif.assert %41 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
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
      %false_4 = hw.constant false
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
      %8 = comb.concat %false_4, %restart_det_q, %true, %input_byte : i1, i1, i1, i8
      %9 = comb.xor %3, %true : i1
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %10 = comb.and %2, %3 : i1
      %11 = comb.and %nack_transaction_q, %3 : i1
      %12 = comb.or %10, %11 : i1
      %13 = comb.xor %12, %true : i1
      %14 = comb.xor %12, %true_5 : i1
      %15 = comb.or %14, %7 : i1
      %16 = comb.xor %12, %true_6 : i1
      %17 = comb.and %12, %6 : i1
      %18 = comb.and %3, %15 : i1
      %19 = comb.or %9, %17 : i1
      %20 = comb.and %3, %13 : i1
      %21 = comb.or %9, %16, %6 : i1
      %false_7 = hw.constant false
      %false_8 = hw.constant false
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
      %false_9 = hw.constant false
      %41 = comb.xor %isFirstCycle, %true : i1
      %42 = comb.and %41, %_sh1_3 : i1
      %43 = comb.xor %42, %true : i1
      %44 = comb.or %43, %21 : i1
      verif.assert %44 : i1
      %45 = comb.and %2, %37 : i1
      %46 = comb.xor %40, %true : i1
      %47 = comb.and %2, %46 : i1
      %48 = comb.or %7, %47 : i1
      %49 = comb.and %3, %12, %6, %2, %46, %rw_bit_q : i1
      %50 = comb.and %3, %12, %48 : i1
      %51 = comb.mux %27, %xact_for_us_q, %50 : i1
      fsm.output %21, %18, %19, %false_7, %51, %33, %40, %20, %auto_ack_cnt_q, %false_8, %input_byte, %45, %35, %false_9, %1, %38, %39, %49 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
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
        %9 = comb.xor %isFirstCycle, %true : i1
        %10 = comb.and %9, %_sh1_3 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.and %1, %2 : i1
        %13 = comb.and %nack_transaction_q, %2 : i1
        %true_4 = hw.constant true
        %14 = comb.and %1, %2 : i1
        %15 = comb.and %nack_transaction_q, %2 : i1
        %16 = comb.or %14, %15 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %2, %17 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.xor %5, %true : i1
        %22 = comb.and %21, %14 : i1
        %23 = comb.and %20, %6 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %8, %24, %4 : i1
        %26 = comb.and %24, %7 : i1
        %true_5 = hw.constant true
        %27 = comb.xor %22, %true_5 : i1
        %true_6 = hw.constant true
        %28 = comb.xor %arg16, %true_6 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %25, %true_7 : i1
        %true_8 = hw.constant true
        %30 = comb.xor %26, %true_8 : i1
        %true_9 = hw.constant true
        %31 = comb.xor %23, %true_9 : i1
        %32 = comb.and %31, %30, %29, %28, %27, %14, %5 : i1
        %33 = comb.or %11, %3, %18, %12, %13 : i1
        verif.assert %33 : i1
        fsm.return %32
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
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
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %false_8 = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_9 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_9 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %true_10 = hw.constant true
        %37 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %false_4, %false_8 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %tcount_q, %1 : i16
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.and %1, %2 : i1
        %12 = comb.and %nack_transaction_q, %2 : i1
        %true_4 = hw.constant true
        %13 = comb.and %1, %2 : i1
        %14 = comb.and %nack_transaction_q, %2 : i1
        %15 = comb.or %13, %14 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.xor %15, %true_4 : i1
        %18 = comb.and %2, %16 : i1
        %19 = comb.xor %18, %true : i1
        %c2_i7 = hw.constant 2 : i7
        %20 = comb.icmp ugt %0, %c2_i7 : i7
        %21 = comb.and %19, %5 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.and %7, %22, %4 : i1
        %24 = comb.and %22, %6 : i1
        %true_5 = hw.constant true
        %25 = comb.xor %rw_bit_q, %true_5 : i1
        %true_6 = hw.constant true
        %26 = comb.xor %arg16, %true_6 : i1
        %true_7 = hw.constant true
        %27 = comb.xor %23, %true_7 : i1
        %true_8 = hw.constant true
        %28 = comb.xor %24, %true_8 : i1
        %true_9 = hw.constant true
        %29 = comb.xor %21, %true_9 : i1
        %30 = comb.and %29, %28, %27, %26, %20, %13, %25 : i1
        %31 = comb.or %10, %3, %17, %11, %12 : i1
        verif.assert %31 : i1
        fsm.return %30
      } action {
        %false_4 = hw.constant false
        %false_5 = hw.constant false
        fsm.update %false_5, %false_5 : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_6 = hw.constant false
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
        %false_7 = hw.constant false
        %true_8 = hw.constant true
        %false_9 = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_10 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_10 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %true_11 = hw.constant true
        %37 = comb.xor %_sh1, %true_11 : i1
        %true_12 = hw.constant true
        verif.assert %true_12 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_8 : i1
        fsm.update %isFirstCycle, %false_6 : i1
        fsm.update %sda_q, %false_7 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %false_4, %false_9 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %tcount_q, %1 : i16
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
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
        %9 = comb.xor %isFirstCycle, %true : i1
        %10 = comb.and %9, %_sh1_3 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.and %1, %2 : i1
        %13 = comb.and %nack_transaction_q, %2 : i1
        %true_4 = hw.constant true
        %14 = comb.and %1, %2 : i1
        %15 = comb.and %nack_transaction_q, %2 : i1
        %16 = comb.or %14, %15 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %2, %17 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %14, %5 : i1
        %22 = comb.xor %5, %true : i1
        %23 = comb.and %22, %14 : i1
        %24 = comb.and %20, %6 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %8, %25, %4 : i1
        %27 = comb.and %25, %7 : i1
        %true_5 = hw.constant true
        %28 = comb.xor %21, %true_5 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %23, %true_6 : i1
        %30 = comb.and %29, %28, %15 : i1
        %31 = comb.or %arg16, %30 : i1
        %true_7 = hw.constant true
        %32 = comb.xor %26, %true_7 : i1
        %true_8 = hw.constant true
        %33 = comb.xor %27, %true_8 : i1
        %true_9 = hw.constant true
        %34 = comb.xor %24, %true_9 : i1
        %35 = comb.and %34, %33, %32, %31 : i1
        %36 = comb.or %11, %3, %18, %12, %13 : i1
        verif.assert %36 : i1
        fsm.return %35
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %37 = comb.xor %32, %true : i1
        %true_6 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_5 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_6 : i1
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
        %67 = comb.xor %isFirstCycle, %true : i1
        %68 = comb.icmp ult %_sh1, %47 : i1
        %69 = comb.and %67, %_sh1_3 : i1
        %70 = comb.xor %69, %true : i1
        %71 = comb.or %70, %47 : i1
        verif.assert %71 : i1
        fsm.update %_sh1_3, %68 : i1
        fsm.update %_sh1, %47 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
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
        %8 = comb.xor %isFirstCycle, %true : i1
        %9 = comb.and %8, %_sh1_3 : i1
        %10 = comb.xor %9, %true : i1
        %11 = comb.and %1, %2 : i1
        %12 = comb.and %nack_transaction_q, %2 : i1
        %true_4 = hw.constant true
        %13 = comb.and %1, %2 : i1
        %14 = comb.and %nack_transaction_q, %2 : i1
        %15 = comb.or %13, %14 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.xor %15, %true_4 : i1
        %18 = comb.and %2, %16 : i1
        %19 = comb.xor %18, %true : i1
        %c2_i7 = hw.constant 2 : i7
        %20 = comb.icmp ugt %0, %c2_i7 : i7
        %21 = comb.and %19, %5 : i1
        %22 = comb.xor %21, %true : i1
        %23 = comb.and %7, %22, %4 : i1
        %24 = comb.and %22, %6 : i1
        %true_5 = hw.constant true
        %25 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %26 = comb.xor %23, %true_6 : i1
        %true_7 = hw.constant true
        %27 = comb.xor %24, %true_7 : i1
        %true_8 = hw.constant true
        %28 = comb.xor %21, %true_8 : i1
        %29 = comb.and %28, %27, %26, %25, %20, %13, %rw_bit_q : i1
        %30 = comb.or %10, %3, %17, %11, %12 : i1
        verif.assert %30 : i1
        fsm.return %29
      } action {
        %false_4 = hw.constant false
        %true = hw.constant true
        fsm.update %true, %true : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true_5 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_6 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.mux %arg5, %0, %tcount_q : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %arg1, %true_5 : i1
        %4 = comb.and %scl_i_q, %3 : i1
        %5 = comb.add %bit_idx, %c1_i4 : i4
        %6 = comb.xor %arg3, %true_5 : i1
        %7 = comb.or %arg3, %4 : i1
        %8 = comb.mux %7, %c0_i4, %bit_idx : i4
        %9 = comb.xor %2, %true_5 : i1
        %10 = comb.and %9, %4, %6 : i1
        %11 = comb.mux %10, %5, %8 : i4
        %12 = comb.xor %scl_i_q, %true_5 : i1
        %13 = comb.and %12, %arg1 : i1
        %14 = comb.xor %2, %true_5 : i1
        %15 = comb.extract %input_byte from 0 : (i8) -> i7
        %16 = comb.concat %15, %arg2 : i7, i1
        %17 = comb.and %14, %13 : i1
        %18 = comb.mux %17, %16, %c0_i8 : i8
        %19 = comb.and %13, %2 : i1
        %20 = comb.xor %13, %true_5 : i1
        %21 = comb.or %20, %19 : i1
        %22 = comb.mux bin %21, %input_byte, %18 : i8
        %23 = comb.xor %arg2, %true_5 : i1
        %24 = comb.and %13, %14 : i1
        %25 = comb.xor %24, %true_5 : i1
        %26 = comb.and %13, %25, %23 : i1
        %27 = comb.and %13, %25 : i1
        %28 = comb.mux bin %27, %26, %host_ack : i1
        %false_7 = hw.constant false
        %true_8 = hw.constant true
        %false_9 = hw.constant false
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_10 = hw.constant true
        %31 = comb.xor %30, %true_5 : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true_5 : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_10 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %true_11 = hw.constant true
        %37 = comb.xor %_sh1, %true_11 : i1
        %true_12 = hw.constant true
        verif.assert %true_12 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_8 : i1
        fsm.update %isFirstCycle, %false_6 : i1
        fsm.update %sda_q, %false_7 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %false_4, %false_9 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %tcount_q, %1 : i16
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
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
        %7 = comb.xor %isFirstCycle, %true : i1
        %8 = comb.and %7, %_sh1_3 : i1
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %0, %1 : i1
        %11 = comb.and %nack_transaction_q, %1 : i1
        %true_4 = hw.constant true
        %12 = comb.and %0, %1 : i1
        %13 = comb.and %nack_transaction_q, %1 : i1
        %14 = comb.or %12, %13 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.xor %14, %true_4 : i1
        %17 = comb.and %1, %15 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.and %18, %4 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %6, %20, %3 : i1
        %22 = comb.and %20, %5 : i1
        %true_5 = hw.constant true
        %23 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %24 = comb.xor %21, %true_6 : i1
        %true_7 = hw.constant true
        %25 = comb.xor %22, %true_7 : i1
        %true_8 = hw.constant true
        %26 = comb.xor %19, %true_8 : i1
        %27 = comb.and %26, %25, %24, %23, %2 : i1
        %28 = comb.or %9, %2, %16, %10, %11 : i1
        verif.assert %28 : i1
        fsm.return %27
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %true_8 = hw.constant true
        %37 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %tcount_q, %1 : i16
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.xor %nack_transaction_q, %true : i1
        %1 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %arg5, %true : i1
        %4 = comb.xor %isFirstCycle, %true : i1
        %5 = comb.and %4, %_sh1_3 : i1
        %6 = comb.xor %5, %true : i1
        %7 = comb.and %0, %1 : i1
        %8 = comb.and %nack_transaction_q, %1 : i1
        %true_4 = hw.constant true
        %9 = comb.and %0, %1 : i1
        %10 = comb.and %nack_transaction_q, %1 : i1
        %11 = comb.or %9, %10 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.xor %11, %true_4 : i1
        %14 = comb.and %1, %12 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %15, %3 : i1
        %17 = comb.xor %16, %true : i1
        %true_5 = hw.constant true
        %18 = comb.xor %16, %true_5 : i1
        %19 = comb.and %18, %17, %arg5, %arg3 : i1
        %20 = comb.or %6, %2, %13, %7, %8 : i1
        verif.assert %20 : i1
        fsm.return %19
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c0_i31 = hw.constant 0 : i31
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %scl_i_q, %true : i1
        %4 = comb.and %3, %arg1 : i1
        %5 = comb.xor %2, %true : i1
        %6 = comb.extract %input_byte from 0 : (i8) -> i7
        %7 = comb.concat %6, %arg2 : i7, i1
        %8 = comb.and %5, %4 : i1
        %9 = comb.mux %8, %7, %c0_i8 : i8
        %10 = comb.and %4, %2 : i1
        %11 = comb.xor %4, %true : i1
        %12 = comb.or %11, %10 : i1
        %13 = comb.mux bin %12, %input_byte, %9 : i8
        %14 = comb.xor %arg2, %true : i1
        %15 = comb.and %4, %5 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.and %4, %16, %14 : i1
        %18 = comb.and %4, %16 : i1
        %19 = comb.mux bin %18, %17, %host_ack : i1
        %20 = comb.sub %c-64_i7, %arg8 : i7
        %21 = comb.xor %nack_transaction_q, %true : i1
        %22 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %23 = comb.and %21, %22 : i1
        %24 = comb.and %nack_transaction_q, %22 : i1
        %25 = comb.or %23, %24 : i1
        %26 = comb.xor %25, %true : i1
        %true_5 = hw.constant true
        %27 = comb.xor %22, %true : i1
        %true_6 = hw.constant true
        %28 = comb.and %21, %22 : i1
        %29 = comb.and %nack_transaction_q, %22 : i1
        %30 = comb.or %28, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.xor %30, %true_5 : i1
        %33 = comb.or %32, %26 : i1
        %34 = comb.xor %30, %true_6 : i1
        %35 = comb.and %22, %33 : i1
        %36 = comb.and %22, %31 : i1
        %37 = comb.or %27, %34, %25 : i1
        %38 = comb.or %27, %30 : i1
        %39 = comb.and %38, %xact_for_us_q : i1
        %40 = comb.or %27, %30 : i1
        %41 = comb.mux %40, %auto_ack_cnt_q, %c0_i9 : i9
        %42 = comb.or %27, %30 : i1
        %43 = comb.and %42, %restart_det_q : i1
        %44 = comb.or %27, %30 : i1
        %45 = comb.and %44, %nack_transaction_q : i1
        %46 = comb.or %arg4, %arg17 : i1
        %47 = comb.xor %36, %true : i1
        %48 = comb.mux %46, %43, %47 : i1
        %49 = comb.icmp ult %20, %c3_i7 : i7
        %50 = comb.xor %isFirstCycle, %true : i1
        %51 = comb.icmp ult %_sh1, %37 : i1
        %52 = comb.and %50, %_sh1_3 : i1
        %53 = comb.xor %52, %true : i1
        %54 = comb.or %53, %37 : i1
        verif.assert %54 : i1
        fsm.update %_sh1_3, %51 : i1
        fsm.update %_sh1, %37 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %35 : i1
        fsm.update %host_ack, %19 : i1
        fsm.update %input_byte, %13 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %xact_for_us_q, %39 : i1
        fsm.update %restart_det_q, %48 : i1
        fsm.update %nack_transaction_q, %45 : i1
        fsm.update %auto_ack_cnt_q, %41 : i9
        fsm.update %tcount_q, %0 : i16
        %55 = comb.mux %36, %c0_i31, %stretch_active_cnt : i31
        %56 = comb.and %22, %30, %26, %49 : i1
        %57 = comb.mux %56, %1, %55 : i31
        %58 = comb.or %56, %36 : i1
        %59 = comb.mux bin %58, %57, %stretch_active_cnt : i31
        fsm.update %stretch_active_cnt, %59 : i31
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
        %9 = comb.xor %isFirstCycle, %true : i1
        %10 = comb.and %9, %_sh1_3 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.and %1, %2 : i1
        %13 = comb.and %nack_transaction_q, %2 : i1
        %true_4 = hw.constant true
        %14 = comb.and %1, %2 : i1
        %15 = comb.and %nack_transaction_q, %2 : i1
        %16 = comb.or %14, %15 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.xor %16, %true_4 : i1
        %19 = comb.and %2, %17 : i1
        %20 = comb.xor %19, %true : i1
        %21 = comb.and %14, %5 : i1
        %22 = comb.xor %5, %true : i1
        %23 = comb.and %22, %14 : i1
        %24 = comb.and %20, %6 : i1
        %25 = comb.xor %24, %true : i1
        %26 = comb.and %8, %25, %4 : i1
        %27 = comb.and %25, %7 : i1
        %true_5 = hw.constant true
        %28 = comb.xor %15, %true_5 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %21, %true_6 : i1
        %true_7 = hw.constant true
        %30 = comb.xor %23, %true_7 : i1
        %true_8 = hw.constant true
        %31 = comb.xor %arg16, %true_8 : i1
        %32 = comb.and %31, %2, %30, %29, %28 : i1
        %33 = comb.or %26, %32 : i1
        %true_9 = hw.constant true
        %34 = comb.xor %27, %true_9 : i1
        %35 = comb.and %34, %33 : i1
        %36 = comb.or %24, %35 : i1
        %37 = comb.or %11, %3, %18, %12, %13 : i1
        verif.assert %37 : i1
        fsm.return %36
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c3_i7 = hw.constant 3 : i7
        %c-64_i7 = hw.constant -64 : i7
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %37 = comb.xor %32, %true : i1
        %true_6 = hw.constant true
        %38 = comb.and %31, %32 : i1
        %39 = comb.and %nack_transaction_q, %32 : i1
        %40 = comb.or %38, %39 : i1
        %41 = comb.xor %40, %true : i1
        %42 = comb.xor %40, %true_5 : i1
        %43 = comb.or %42, %36 : i1
        %44 = comb.xor %40, %true_6 : i1
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
        %67 = comb.xor %isFirstCycle, %true : i1
        %68 = comb.icmp ult %_sh1, %47 : i1
        %69 = comb.and %67, %_sh1_3 : i1
        %70 = comb.xor %69, %true : i1
        %71 = comb.or %70, %47 : i1
        verif.assert %71 : i1
        fsm.update %_sh1_3, %68 : i1
        fsm.update %_sh1, %47 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %45 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
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
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
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
      %false_10 = hw.constant false
      %true_11 = hw.constant true
      verif.assert %true_11 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %sda_q, %true_4, %false_7, %10, %11, %18, %false_5, %auto_ack_cnt_q, %false_8, %input_byte, %19, %13, %false_10, %1, %16, %17, %false_9 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
        fsm.return %6
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
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
        %true_5 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %30 = comb.xor %29, %true : i1
        %31 = comb.and %arg3, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.or %29, %32 : i1
        %34 = comb.xor %33, %true_6 : i1
        %35 = comb.or %34, %restart_det_q : i1
        %36 = comb.and %30, %32 : i1
        %37 = comb.or %36, %nack_transaction_q : i1
        %true_7 = hw.constant true
        %38 = comb.xor %_sh1, %true_7 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.update %_sh1_3, %38 : i1
        fsm.update %_sh1, %true_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %35 : i1
        fsm.update %nack_transaction_q, %37 : i1
        %39 = comb.mux %arg1, %1, %0 : i16
        fsm.update %tcount_q, %39 : i16
      }
      fsm.transition @state_10 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %1, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_7 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_8 = hw.constant true
        %15 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %true_6 = hw.constant true
        %18 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %19 = comb.xor %18, %true_4 : i1
        %20 = comb.and %arg3, %19 : i1
        %21 = comb.xor %20, %true_4 : i1
        %22 = comb.or %18, %21 : i1
        %23 = comb.xor %22, %true_7 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %true_8 = hw.constant true
        %25 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %25 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %scl_i_q, %true : i1
        %4 = comb.and %3, %arg1 : i1
        %5 = comb.xor %2, %true : i1
        %6 = comb.extract %input_byte from 0 : (i8) -> i7
        %7 = comb.concat %6, %arg2 : i7, i1
        %8 = comb.and %5, %4 : i1
        %9 = comb.mux %8, %7, %c0_i8 : i8
        %10 = comb.and %4, %2 : i1
        %11 = comb.xor %4, %true : i1
        %12 = comb.or %11, %10 : i1
        %13 = comb.mux bin %12, %input_byte, %9 : i8
        %14 = comb.xor %arg2, %true : i1
        %15 = comb.and %4, %5 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.and %4, %16, %14 : i1
        %18 = comb.and %4, %16 : i1
        %19 = comb.mux bin %18, %17, %host_ack : i1
        %true_5 = hw.constant true
        %20 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %20, %true_6 : i1
        %22 = comb.or %21, %restart_det_q : i1
        %true_7 = hw.constant true
        %23 = comb.xor %_sh1, %true_7 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.update %_sh1_3, %23 : i1
        fsm.update %_sh1, %true_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %19 : i1
        fsm.update %input_byte, %13 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %22 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        %24 = comb.mux %arg1, %1, %0 : i16
        fsm.update %tcount_q, %24 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.and %arg5, %arg1 : i1
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
        %true_5 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_6 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_6 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.xor %arg1, %true : i1
        %true_7 = hw.constant true
        %41 = comb.xor %_sh1, %true_7 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.update %_sh1_3, %41 : i1
        fsm.update %_sh1, %true_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %42 = comb.or %40, %arg5 : i1
        %43 = comb.mux %42, %c1_i16, %tcount_q : i16
        %44 = comb.mux %arg1, %43, %0 : i16
        %45 = comb.mux %2, %1, %44 : i16
        fsm.update %tcount_q, %45 : i16
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
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
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
      %false_10 = hw.constant false
      %32 = comb.xor %isFirstCycle, %true : i1
      %33 = comb.and %32, %_sh1_3 : i1
      %34 = comb.xor %33, %true : i1
      verif.assert %34 : i1
      %35 = comb.and %11, %28 : i1
      fsm.output %false_6, %15, %true_4, %false_7, %23, %24, %31, %false_5, %auto_ack_cnt_q, %false_8, %input_byte, %35, %26, %false_10, %10, %29, %30, %false_9 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %isFirstCycle, %true : i1
        %4 = comb.and %3, %_sh1_3 : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %2, %arg5, %0 : i1
        %7 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %true_4 = hw.constant true
        %8 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %6, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %1, %true_6 : i1
        %11 = comb.and %arg5, %10, %9, %8, %7 : i1
        verif.assert %5 : i1
        fsm.return %11
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %28 = comb.extract %arg7 from 0 : (i8) -> i1
        %29 = comb.extract %arg7 from 1 : (i8) -> i1
        %30 = comb.extract %arg7 from 2 : (i8) -> i1
        %31 = comb.extract %arg7 from 3 : (i8) -> i1
        %32 = comb.extract %arg7 from 4 : (i8) -> i1
        %33 = comb.extract %arg7 from 5 : (i8) -> i1
        %34 = comb.extract %arg7 from 6 : (i8) -> i1
        %35 = comb.extract %arg7 from 7 : (i8) -> i1
        %36 = comb.concat %28, %29, %30, %31, %32, %33, %34, %35 : i1, i1, i1, i1, i1, i1, i1, i1
        %false_5 = hw.constant false
        %37 = comb.extract %bit_idx from 0 : (i4) -> i3
        %38 = comb.concat %c0_i5, %37 : i5, i3
        %39 = comb.shru %36, %38 : i8
        %40 = comb.extract %39 from 0 : (i8) -> i1
        %41 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %42 = comb.xor %41, %true : i1
        %43 = comb.and %arg3, %42 : i1
        %44 = comb.xor %43, %true : i1
        %45 = comb.or %41, %44 : i1
        %46 = comb.xor %45, %true_6 : i1
        %47 = comb.or %46, %restart_det_q : i1
        %48 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %49 = comb.and %48, %_sh1_3 : i1
        %50 = comb.xor %49, %true : i1
        verif.assert %50 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %40 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %47 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %isFirstCycle, %true : i1
        %4 = comb.and %3, %_sh1_3 : i1
        %5 = comb.xor %4, %true : i1
        %6 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %6, %true_4 : i1
        %true_5 = hw.constant true
        %8 = comb.xor %1, %true_5 : i1
        %9 = comb.and %arg5, %8, %7, %arg16 : i1
        verif.assert %5 : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %28 = comb.extract %arg7 from 0 : (i8) -> i1
        %29 = comb.extract %arg7 from 1 : (i8) -> i1
        %30 = comb.extract %arg7 from 2 : (i8) -> i1
        %31 = comb.extract %arg7 from 3 : (i8) -> i1
        %32 = comb.extract %arg7 from 4 : (i8) -> i1
        %33 = comb.extract %arg7 from 5 : (i8) -> i1
        %34 = comb.extract %arg7 from 6 : (i8) -> i1
        %35 = comb.extract %arg7 from 7 : (i8) -> i1
        %36 = comb.concat %28, %29, %30, %31, %32, %33, %34, %35 : i1, i1, i1, i1, i1, i1, i1, i1
        %false_5 = hw.constant false
        %37 = comb.extract %bit_idx from 0 : (i4) -> i3
        %38 = comb.concat %c0_i5, %37 : i5, i3
        %39 = comb.shru %36, %38 : i8
        %40 = comb.extract %39 from 0 : (i8) -> i1
        %41 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %42 = comb.xor %41, %true : i1
        %43 = comb.and %arg3, %42 : i1
        %44 = comb.xor %43, %true : i1
        %45 = comb.or %41, %44 : i1
        %46 = comb.xor %45, %true_6 : i1
        %47 = comb.or %46, %restart_det_q : i1
        %48 = comb.and %42, %44 : i1
        %49 = comb.or %48, %nack_transaction_q : i1
        %50 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %51 = comb.and %50, %_sh1_3 : i1
        %52 = comb.xor %51, %true : i1
        verif.assert %52 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %40 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %47 : i1
        fsm.update %nack_transaction_q, %49 : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_8 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.xor %isFirstCycle, %true : i1
        %5 = comb.and %4, %_sh1_3 : i1
        %6 = comb.xor %5, %true : i1
        %7 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %8 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %9 = comb.xor %7, %true_5 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %2, %true_6 : i1
        %11 = comb.and %arg5, %10, %9, %8, %0 : i1
        verif.assert %6 : i1
        fsm.return %11
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %28 = comb.extract %arg7 from 0 : (i8) -> i1
        %29 = comb.extract %arg7 from 1 : (i8) -> i1
        %30 = comb.extract %arg7 from 2 : (i8) -> i1
        %31 = comb.extract %arg7 from 3 : (i8) -> i1
        %32 = comb.extract %arg7 from 4 : (i8) -> i1
        %33 = comb.extract %arg7 from 5 : (i8) -> i1
        %34 = comb.extract %arg7 from 6 : (i8) -> i1
        %35 = comb.extract %arg7 from 7 : (i8) -> i1
        %36 = comb.concat %28, %29, %30, %31, %32, %33, %34, %35 : i1, i1, i1, i1, i1, i1, i1, i1
        %false_5 = hw.constant false
        %37 = comb.extract %bit_idx from 0 : (i4) -> i3
        %38 = comb.concat %c0_i5, %37 : i5, i3
        %39 = comb.shru %36, %38 : i8
        %40 = comb.extract %39 from 0 : (i8) -> i1
        %41 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %42 = comb.xor %41, %true : i1
        %43 = comb.and %arg3, %42 : i1
        %44 = comb.xor %43, %true : i1
        %45 = comb.or %41, %44 : i1
        %46 = comb.xor %45, %true_6 : i1
        %47 = comb.or %46, %restart_det_q : i1
        %48 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %49 = comb.and %48, %_sh1_3 : i1
        %50 = comb.xor %49, %true : i1
        verif.assert %50 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %40 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %47 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.and %arg5, %arg3 : i1
        %1 = comb.xor %isFirstCycle, %true : i1
        %2 = comb.and %1, %_sh1_3 : i1
        %3 = comb.xor %2, %true : i1
        verif.assert %3 : i1
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
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %19 = comb.extract %arg7 from 0 : (i8) -> i1
        %20 = comb.extract %arg7 from 1 : (i8) -> i1
        %21 = comb.extract %arg7 from 2 : (i8) -> i1
        %22 = comb.extract %arg7 from 3 : (i8) -> i1
        %23 = comb.extract %arg7 from 4 : (i8) -> i1
        %24 = comb.extract %arg7 from 5 : (i8) -> i1
        %25 = comb.extract %arg7 from 6 : (i8) -> i1
        %26 = comb.extract %arg7 from 7 : (i8) -> i1
        %27 = comb.concat %19, %20, %21, %22, %23, %24, %25, %26 : i1, i1, i1, i1, i1, i1, i1, i1
        %false_5 = hw.constant false
        %28 = comb.extract %bit_idx from 0 : (i4) -> i3
        %29 = comb.concat %c0_i5, %28 : i5, i3
        %30 = comb.shru %27, %29 : i8
        %31 = comb.extract %30 from 0 : (i8) -> i1
        %32 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %36 = comb.and %35, %_sh1_3 : i1
        %37 = comb.xor %36, %true : i1
        verif.assert %37 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %31 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.xor %isFirstCycle, %true : i1
        %5 = comb.and %4, %_sh1_3 : i1
        %6 = comb.xor %5, %true : i1
        %true_4 = hw.constant true
        %7 = comb.xor %2, %true_4 : i1
        %8 = comb.and %7, %3, %arg5, %0 : i1
        %9 = comb.or %1, %8 : i1
        verif.assert %6 : i1
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
        %false_4 = hw.constant false
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
        %false_5 = hw.constant false
        %38 = comb.extract %bit_idx from 0 : (i4) -> i3
        %39 = comb.concat %c0_i5, %38 : i5, i3
        %40 = comb.shru %37, %39 : i8
        %41 = comb.extract %40 from 0 : (i8) -> i1
        %42 = comb.or %arg4, %arg17 : i1
        %43 = comb.and %arg5, %42 : i1
        %true_6 = hw.constant true
        %44 = comb.xor %43, %true : i1
        %45 = comb.and %arg5, %arg3, %44 : i1
        %46 = comb.xor %45, %true : i1
        %47 = comb.or %43, %46 : i1
        %48 = comb.xor %47, %true_6 : i1
        %49 = comb.or %48, %restart_det_q : i1
        %50 = comb.and %44, %46, %arg16 : i1
        %51 = comb.or %50, %nack_transaction_q : i1
        %52 = comb.xor %isFirstCycle, %true : i1
        %false_7 = hw.constant false
        %53 = comb.and %52, %_sh1_3 : i1
        %54 = comb.xor %53, %true : i1
        verif.assert %54 : i1
        fsm.update %_sh1_3, %false_7 : i1
        fsm.update %_sh1, %false_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %true_7 = hw.constant true
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_7, %false_4, %true_5, %false_8, %10, %11, %18, %false_6, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_17 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %18 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %19 = comb.xor %18, %true_4 : i1
        %20 = comb.and %arg3, %19 : i1
        %21 = comb.xor %20, %true_4 : i1
        %22 = comb.or %18, %21 : i1
        %23 = comb.xor %22, %true_8 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %true_9 = hw.constant true
        %25 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %25 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_16 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %3, %true_6 : i1
        %true_7 = hw.constant true
        %7 = comb.xor %1, %true_7 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
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
      %false_8 = hw.constant false
      %26 = comb.xor %isFirstCycle, %true : i1
      %27 = comb.and %26, %_sh1_3 : i1
      %28 = comb.xor %27, %true : i1
      %29 = comb.or %25, %7 : i1
      %30 = comb.xor %29, %true : i1
      %31 = comb.and %30, %nack_transaction_q : i1
      %32 = comb.xor %29, %true : i1
      %false_9 = hw.constant false
      %33 = comb.mux %32, %c0_i11, %10 : i11
      %false_10 = hw.constant false
      %34 = comb.and %29, %9 : i1
      %35 = comb.mux %12, %xact_for_us_q, %34 : i1
      %36 = comb.mux %12, %14, %33 : i11
      %37 = comb.or %20, %29, %31 : i1
      verif.assert %28 : i1
      %38 = comb.and %5, %37 : i1
      fsm.output %false_9, %true_4, %false_5, %false_6, %35, %36, %23, %false_10, %auto_ack_cnt_q, %6, %input_byte, %38, %19, %false_8, %4, %21, %22, %false_7 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
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
        %11 = comb.and %arg5, %arg3 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.xor %isFirstCycle, %true : i1
        %14 = comb.and %13, %_sh1_3 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.or %10, %5 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.xor %8, %true : i1
        %19 = comb.and %12, %arg5, %6 : i1
        %true_4 = hw.constant true
        %20 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %21 = comb.xor %19, %true_5 : i1
        %true_6 = hw.constant true
        %22 = comb.xor %11, %true_6 : i1
        %23 = comb.and %arg5, %22, %21, %20, %17, %18 : i1
        verif.assert %15 : i1
        fsm.return %23
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %0 = comb.concat %c0_i3, %arg10 : i3, i13
        %1 = comb.concat %c0_i3, %arg11 : i3, i13
        %2 = comb.add %0, %1 : i16
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
        %33 = comb.xor %5, %true : i1
        %true_5 = hw.constant true
        %34 = comb.or %arg4, %arg17 : i1
        %35 = comb.and %arg5, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.and %arg5, %arg3, %36 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %35, %38 : i1
        %40 = comb.xor %isFirstCycle, %true : i1
        %41 = comb.and %40, %_sh1_3 : i1
        %42 = comb.xor %41, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %32 : i1
        fsm.update %input_byte, %26 : i8
        fsm.update %bit_idx, %15 : i4
        %43 = comb.and %arg20, %33 : i1
        %44 = comb.mux %43, %arg21, %auto_ack_cnt_q : i9
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %45 = comb.xor %39, %true_7 : i1
        %46 = comb.or %45, %restart_det_q : i1
        %false_8 = hw.constant false
        verif.assert %42 : i1
        fsm.update %_sh1_3, %false_8 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %restart_det_q, %46 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %44 : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        fsm.update %tcount_q, %2 : i16
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
        %13 = comb.xor %isFirstCycle, %true : i1
        %14 = comb.and %13, %_sh1_3 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.or %10, %5 : i1
        %17 = comb.xor %16, %true : i1
        %18 = comb.and %12, %arg5, %6 : i1
        %true_4 = hw.constant true
        %19 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %20 = comb.xor %18, %true_5 : i1
        %true_6 = hw.constant true
        %21 = comb.xor %11, %true_6 : i1
        %22 = comb.and %arg5, %21, %20, %19, %17, %8 : i1
        verif.assert %15 : i1
        fsm.return %22
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c1_i31 = hw.constant 1 : i31
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %stretch_active_cnt, %c1_i31 : i31
        %2 = comb.xor %arg19, %true : i1
        %3 = comb.icmp ne %auto_ack_cnt_q, %c0_i9 : i9
        %4 = comb.or %2, %3 : i1
        %5 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %6 = comb.xor %arg1, %true : i1
        %7 = comb.and %scl_i_q, %6 : i1
        %8 = comb.add %bit_idx, %c1_i4 : i4
        %9 = comb.xor %arg3, %true : i1
        %10 = comb.or %arg3, %7 : i1
        %11 = comb.mux %10, %c0_i4, %bit_idx : i4
        %12 = comb.xor %5, %true : i1
        %13 = comb.and %12, %7, %9 : i1
        %14 = comb.mux %13, %8, %11 : i4
        %15 = comb.xor %scl_i_q, %true : i1
        %16 = comb.and %15, %arg1 : i1
        %17 = comb.xor %5, %true : i1
        %18 = comb.extract %input_byte from 0 : (i8) -> i7
        %19 = comb.concat %18, %arg2 : i7, i1
        %20 = comb.and %17, %16 : i1
        %21 = comb.mux %20, %19, %c0_i8 : i8
        %22 = comb.and %16, %5 : i1
        %23 = comb.xor %16, %true : i1
        %24 = comb.or %23, %22 : i1
        %25 = comb.mux bin %24, %input_byte, %21 : i8
        %26 = comb.xor %arg2, %true : i1
        %27 = comb.and %16, %17 : i1
        %28 = comb.xor %27, %true : i1
        %29 = comb.and %16, %28, %26 : i1
        %30 = comb.and %16, %28 : i1
        %31 = comb.mux bin %30, %29, %host_ack : i1
        %32 = comb.xor %4, %true : i1
        %true_5 = hw.constant true
        %33 = comb.or %arg4, %arg17 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %arg3, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.or %33, %36 : i1
        %38 = comb.xor %isFirstCycle, %true : i1
        %39 = comb.and %38, %_sh1_3 : i1
        %40 = comb.xor %39, %true : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %31 : i1
        fsm.update %input_byte, %25 : i8
        fsm.update %bit_idx, %14 : i4
        %41 = comb.and %arg20, %32 : i1
        %42 = comb.mux %41, %arg21, %auto_ack_cnt_q : i9
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %43 = comb.xor %37, %true_7 : i1
        %44 = comb.or %43, %restart_det_q : i1
        %false_8 = hw.constant false
        verif.assert %40 : i1
        fsm.update %_sh1_3, %false_8 : i1
        fsm.update %_sh1, %false_6 : i1
        fsm.update %restart_det_q, %44 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %42 : i9
        fsm.update %stretch_active_cnt, %1 : i31
        fsm.update %tcount_q, %0 : i16
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
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
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
      %false_10 = hw.constant false
      %true_11 = hw.constant true
      verif.assert %true_11 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %sda_q, %true_4, %false_7, %10, %11, %18, %false_5, %auto_ack_cnt_q, %false_8, %input_byte, %19, %13, %false_10, %1, %16, %17, %false_9 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_14 guard {
        %false_4 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %false_4
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %30 = comb.xor %29, %true : i1
        %true_6 = hw.constant true
        %31 = comb.or %arg4, %arg17 : i1
        %32 = comb.and %arg5, %31 : i1
        %true_7 = hw.constant true
        %33 = comb.xor %32, %true : i1
        %34 = comb.and %arg5, %arg3, %33 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.or %32, %35 : i1
        %37 = comb.xor %36, %true_7 : i1
        %38 = comb.or %37, %restart_det_q : i1
        %39 = comb.and %33, %35, %arg16 : i1
        %40 = comb.or %39, %nack_transaction_q : i1
        %41 = comb.mux %29, %2, %rw_bit_q : i1
        %42 = comb.xor %29, %true : i1
        %true_8 = hw.constant true
        %43 = comb.xor %41, %true_8 : i1
        %true_9 = hw.constant true
        %44 = comb.xor %29, %true_9 : i1
        %45 = comb.and %29, %43 : i1
        %46 = comb.or %30, %44, %41, %42 : i1
        %true_10 = hw.constant true
        %47 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %47 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %38 : i1
        fsm.update %nack_transaction_q, %40 : i1
        %48 = comb.xor %46, %true_5 : i1
        %49 = comb.xor %45, %true : i1
        %50 = comb.or %45, %arg5 : i1
        %51 = comb.mux %50, %c1_i16, %tcount_q : i16
        %52 = comb.and %48, %45 : i1
        %53 = comb.mux %52, %0, %51 : i16
        %54 = comb.and %arg5, %49 : i1
        %55 = comb.mux %54, %1, %53 : i16
        fsm.update %tcount_q, %55 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
        fsm.return %6
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %30 = comb.xor %29, %true : i1
        %true_6 = hw.constant true
        %31 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_7 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.mux %29, %2, %rw_bit_q : i1
        %41 = comb.xor %29, %true : i1
        %true_8 = hw.constant true
        %42 = comb.xor %40, %true_8 : i1
        %true_9 = hw.constant true
        %43 = comb.xor %29, %true_9 : i1
        %44 = comb.and %29, %42 : i1
        %45 = comb.or %30, %43, %40, %41 : i1
        %true_10 = hw.constant true
        %46 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %46 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %47 = comb.xor %45, %true_5 : i1
        %48 = comb.xor %44, %true : i1
        %49 = comb.and %47, %44 : i1
        %50 = comb.mux %49, %0, %c1_i16 : i16
        %51 = comb.mux %48, %1, %50 : i16
        fsm.update %tcount_q, %51 : i16
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
        %5 = comb.mux %1, %0, %rw_bit_q : i1
        %6 = comb.and %4, %arg5, %2 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %8 = comb.xor %6, %true_5 : i1
        %true_6 = hw.constant true
        %9 = comb.xor %3, %true_6 : i1
        %10 = comb.and %arg5, %9, %8, %7, %1, %5 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %10
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %true_7 = hw.constant true
        %35 = comb.xor %_sh1, %true_7 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.update %_sh1_3, %35 : i1
        fsm.update %_sh1, %true_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_10 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %2, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %true_7 = hw.constant true
        %35 = comb.xor %_sh1, %true_7 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.update %_sh1_3, %35 : i1
        fsm.update %_sh1, %true_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
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
        %5 = comb.mux %1, %0, %rw_bit_q : i1
        %6 = comb.and %4, %arg5, %2 : i1
        %true_4 = hw.constant true
        %7 = comb.xor %5, %true_4 : i1
        %true_5 = hw.constant true
        %8 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %9 = comb.xor %6, %true_6 : i1
        %true_7 = hw.constant true
        %10 = comb.xor %3, %true_7 : i1
        %11 = comb.and %arg5, %10, %9, %8, %1, %7 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %11
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_6 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_6 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %true_7 = hw.constant true
        %35 = comb.xor %_sh1, %true_7 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.update %_sh1_3, %35 : i1
        fsm.update %_sh1, %true_5 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_7 guard {
        %false_4 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %false_4
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %30 = comb.xor %29, %true : i1
        %true_6 = hw.constant true
        %31 = comb.or %arg4, %arg17 : i1
        %32 = comb.and %arg5, %31 : i1
        %true_7 = hw.constant true
        %33 = comb.xor %32, %true : i1
        %34 = comb.and %arg5, %arg3, %33 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.or %32, %35 : i1
        %37 = comb.xor %36, %true_7 : i1
        %38 = comb.or %37, %restart_det_q : i1
        %39 = comb.and %33, %35, %arg16 : i1
        %40 = comb.or %39, %nack_transaction_q : i1
        %41 = comb.mux %29, %2, %rw_bit_q : i1
        %42 = comb.xor %29, %true : i1
        %true_8 = hw.constant true
        %43 = comb.xor %41, %true_8 : i1
        %true_9 = hw.constant true
        %44 = comb.xor %29, %true_9 : i1
        %45 = comb.and %29, %43 : i1
        %46 = comb.or %30, %44, %41, %42 : i1
        %true_10 = hw.constant true
        %47 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %47 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %38 : i1
        fsm.update %nack_transaction_q, %40 : i1
        %48 = comb.xor %46, %true_5 : i1
        %49 = comb.xor %45, %true : i1
        %50 = comb.or %45, %arg5 : i1
        %51 = comb.mux %50, %c1_i16, %tcount_q : i16
        %52 = comb.and %48, %45 : i1
        %53 = comb.mux %52, %0, %51 : i16
        %54 = comb.and %arg5, %49 : i1
        %55 = comb.mux %54, %1, %53 : i16
        fsm.update %tcount_q, %55 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %scl_i_q, %true : i1
        %4 = comb.and %3, %arg1 : i1
        %5 = comb.xor %2, %true : i1
        %6 = comb.extract %input_byte from 0 : (i8) -> i7
        %7 = comb.concat %6, %arg2 : i7, i1
        %8 = comb.and %5, %4 : i1
        %9 = comb.mux %8, %7, %c0_i8 : i8
        %10 = comb.and %4, %2 : i1
        %11 = comb.xor %4, %true : i1
        %12 = comb.or %11, %10 : i1
        %13 = comb.mux bin %12, %input_byte, %9 : i8
        %14 = comb.xor %arg2, %true : i1
        %15 = comb.and %4, %5 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.and %4, %16, %14 : i1
        %18 = comb.and %4, %16 : i1
        %19 = comb.mux bin %18, %17, %host_ack : i1
        %20 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %21 = comb.xor %20, %true : i1
        %true_6 = hw.constant true
        %22 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %23 = comb.xor %22, %true_7 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %25 = comb.mux %20, %2, %rw_bit_q : i1
        %26 = comb.xor %20, %true : i1
        %true_8 = hw.constant true
        %27 = comb.xor %25, %true_8 : i1
        %true_9 = hw.constant true
        %28 = comb.xor %20, %true_9 : i1
        %29 = comb.and %20, %27 : i1
        %30 = comb.or %21, %28, %25, %26 : i1
        %true_10 = hw.constant true
        %31 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %31 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %19 : i1
        fsm.update %input_byte, %13 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        %32 = comb.xor %30, %true_5 : i1
        %33 = comb.xor %29, %true : i1
        %34 = comb.and %32, %29 : i1
        %35 = comb.mux %34, %0, %c1_i16 : i16
        %36 = comb.mux %33, %1, %35 : i16
        fsm.update %tcount_q, %36 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %sda_q, %sda_q : i1
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %true_5 = hw.constant true
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
        %30 = comb.xor %29, %true : i1
        %true_6 = hw.constant true
        %31 = comb.or %arg4, %arg17 : i1
        %32 = comb.and %arg5, %31 : i1
        %true_7 = hw.constant true
        %33 = comb.xor %32, %true : i1
        %34 = comb.and %arg5, %arg3, %33 : i1
        %35 = comb.xor %34, %true : i1
        %36 = comb.or %32, %35 : i1
        %37 = comb.xor %36, %true_7 : i1
        %38 = comb.or %37, %restart_det_q : i1
        %39 = comb.and %33, %35, %arg16 : i1
        %40 = comb.or %39, %nack_transaction_q : i1
        %41 = comb.mux %29, %2, %rw_bit_q : i1
        %42 = comb.xor %29, %true : i1
        %true_8 = hw.constant true
        %43 = comb.xor %41, %true_8 : i1
        %true_9 = hw.constant true
        %44 = comb.xor %29, %true_9 : i1
        %45 = comb.and %29, %43 : i1
        %46 = comb.or %30, %44, %41, %42 : i1
        %true_10 = hw.constant true
        %47 = comb.xor %_sh1, %true_10 : i1
        %true_11 = hw.constant true
        verif.assert %true_11 : i1
        fsm.update %_sh1_3, %47 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %38 : i1
        fsm.update %nack_transaction_q, %40 : i1
        %48 = comb.xor %46, %true_5 : i1
        %49 = comb.xor %45, %true : i1
        %50 = comb.or %45, %arg5 : i1
        %51 = comb.mux %50, %c1_i16, %tcount_q : i16
        %52 = comb.and %48, %45 : i1
        %53 = comb.mux %52, %0, %51 : i16
        %54 = comb.and %arg5, %49 : i1
        %55 = comb.mux %54, %1, %53 : i16
        fsm.update %tcount_q, %55 : i16
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %false_6 = hw.constant false
      %true_7 = hw.constant true
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_7, %false_4, %true_5, %false_8, %10, %11, %18, %false_6, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_18 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.xor %arg1, %true : i1
        %4 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %1, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %3 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_17 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %false_6 = hw.constant false
        %true_7 = hw.constant true
        %18 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %19 = comb.xor %18, %true_4 : i1
        %20 = comb.and %arg3, %19 : i1
        %21 = comb.xor %20, %true_4 : i1
        %22 = comb.or %18, %21 : i1
        %23 = comb.xor %22, %true_8 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %true_9 = hw.constant true
        %25 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %25 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %false_6 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %30 = comb.xor %29, %true : i1
        %31 = comb.and %arg3, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.or %29, %32 : i1
        %34 = comb.xor %33, %true_7 : i1
        %35 = comb.or %34, %restart_det_q : i1
        %36 = comb.and %30, %32 : i1
        %37 = comb.or %36, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %38 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %38 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %35 : i1
        fsm.update %nack_transaction_q, %37 : i1
        %39 = comb.mux %arg1, %1, %0 : i16
        fsm.update %tcount_q, %39 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %3 = comb.xor %scl_i_q, %true : i1
        %4 = comb.and %3, %arg1 : i1
        %5 = comb.xor %2, %true : i1
        %6 = comb.extract %input_byte from 0 : (i8) -> i7
        %7 = comb.concat %6, %arg2 : i7, i1
        %8 = comb.and %5, %4 : i1
        %9 = comb.mux %8, %7, %c0_i8 : i8
        %10 = comb.and %4, %2 : i1
        %11 = comb.xor %4, %true : i1
        %12 = comb.or %11, %10 : i1
        %13 = comb.mux bin %12, %input_byte, %9 : i8
        %14 = comb.xor %arg2, %true : i1
        %15 = comb.and %4, %5 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.and %4, %16, %14 : i1
        %18 = comb.and %4, %16 : i1
        %19 = comb.mux bin %18, %17, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %20 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %21 = comb.xor %20, %true_7 : i1
        %22 = comb.or %21, %restart_det_q : i1
        %true_8 = hw.constant true
        %23 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %23 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %19 : i1
        fsm.update %input_byte, %13 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %22 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        %24 = comb.mux %arg1, %1, %0 : i16
        fsm.update %tcount_q, %24 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.concat %c0_i3, %arg12 : i3, i13
        %1 = comb.add %tcount_q, %c-1_i16 : i16
        %2 = comb.and %arg5, %arg1 : i1
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %30 = comb.or %arg4, %arg17 : i1
        %31 = comb.and %arg5, %30 : i1
        %true_7 = hw.constant true
        %32 = comb.xor %31, %true : i1
        %33 = comb.and %arg5, %arg3, %32 : i1
        %34 = comb.xor %33, %true : i1
        %35 = comb.or %31, %34 : i1
        %36 = comb.xor %35, %true_7 : i1
        %37 = comb.or %36, %restart_det_q : i1
        %38 = comb.and %32, %34, %arg16 : i1
        %39 = comb.or %38, %nack_transaction_q : i1
        %40 = comb.xor %arg1, %true : i1
        %true_8 = hw.constant true
        %41 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %41 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %29 : i1
        fsm.update %input_byte, %23 : i8
        fsm.update %bit_idx, %12 : i4
        fsm.update %restart_det_q, %37 : i1
        fsm.update %nack_transaction_q, %39 : i1
        %42 = comb.or %40, %arg5 : i1
        %43 = comb.mux %42, %c1_i16, %tcount_q : i16
        %44 = comb.mux %arg1, %43, %0 : i16
        %45 = comb.mux %2, %1, %44 : i16
        fsm.update %tcount_q, %45 : i16
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %19 = comb.and %2, %15 : i1
      fsm.output %true_6, %true_5, %false_7, %false_8, %10, %11, %18, %false_4, %auto_ack_cnt_q, %false_9, %input_byte, %19, %13, %false_11, %1, %16, %17, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31 : i1
        %36 = comb.or %35, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %37 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %18 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %19 = comb.xor %18, %true_4 : i1
        %20 = comb.and %arg3, %19 : i1
        %21 = comb.xor %20, %true_4 : i1
        %22 = comb.or %18, %21 : i1
        %23 = comb.xor %22, %true_8 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %true_9 = hw.constant true
        %25 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %25 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_11 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %3, %true_6 : i1
        %true_7 = hw.constant true
        %7 = comb.xor %1, %true_7 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %8
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %19 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %19, %true_7 : i1
        %21 = comb.or %20, %restart_det_q : i1
        %true_8 = hw.constant true
        %22 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %22 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %21 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %39 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %39 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %9 = comb.mux %6, %7, %c0_i11 : i11
      %false_6 = hw.constant false
      %true_7 = hw.constant true
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
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
      %false_11 = hw.constant false
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      %26 = comb.and %5, %21 : i1
      %27 = comb.xor %25, %true : i1
      %28 = comb.and %6, %27 : i1
      %29 = comb.mux %11, %xact_for_us_q, %28 : i1
      fsm.output %true_7, %false_4, %true_5, %false_8, %29, %17, %24, %false_6, %auto_ack_cnt_q, %false_9, %input_byte, %26, %19, %false_11, %4, %22, %23, %false_10 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_18 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %4 = comb.icmp ne %tcount_q, %c1_i16 : i16
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %1, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %4 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %8
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %true_8 = hw.constant true
        %35 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %35 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_14 guard {
        %true = hw.constant true
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %5 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %6 = comb.xor %4, %true_5 : i1
        %true_6 = hw.constant true
        %7 = comb.xor %2, %true_6 : i1
        %8 = comb.and %arg5, %7, %6, %5, %0 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
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
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %28 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %30 = comb.xor %29, %true : i1
        %31 = comb.and %arg3, %30 : i1
        %32 = comb.xor %31, %true : i1
        %33 = comb.or %29, %32 : i1
        %34 = comb.xor %33, %true_7 : i1
        %35 = comb.or %34, %restart_det_q : i1
        %true_8 = hw.constant true
        %36 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %36 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %35 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %28 : i9
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_13 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %3, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %1, %true_5 : i1
        %6 = comb.and %arg5, %5, %4, %arg16 : i1
        %true_6 = hw.constant true
        verif.assert %true_6 : i1
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
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %28 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %29 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %30 = comb.mux %28, %29, %c0_i9 : i9
        %31 = comb.xor %28, %true : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %32 = comb.mux %31, %auto_ack_cnt_q, %30 : i9
        %33 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %34 = comb.xor %33, %true : i1
        %35 = comb.and %arg3, %34 : i1
        %36 = comb.xor %35, %true : i1
        %37 = comb.or %33, %36 : i1
        %38 = comb.xor %37, %true_7 : i1
        %39 = comb.or %38, %restart_det_q : i1
        %40 = comb.and %34, %36 : i1
        %41 = comb.or %40, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %42 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %42 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %39 : i1
        fsm.update %nack_transaction_q, %41 : i1
        fsm.update %auto_ack_cnt_q, %32 : i9
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
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
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c0_i9 = hw.constant 0 : i9
        %c-1_i16 = hw.constant -1 : i16
        %c1_i16 = hw.constant 1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %19 = comb.icmp eq %tcount_q, %c1_i16 : i16
        %20 = comb.add %auto_ack_cnt_q, %c-1_i9 : i9
        %21 = comb.mux %19, %20, %c0_i9 : i9
        %22 = comb.xor %19, %true : i1
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %23 = comb.mux %22, %auto_ack_cnt_q, %21 : i9
        %24 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %25 = comb.xor %24, %true_7 : i1
        %26 = comb.or %25, %restart_det_q : i1
        %true_8 = hw.constant true
        %27 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %27 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %26 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %auto_ack_cnt_q, %23 : i9
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
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
        %false_4 = hw.constant false
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
        %false_5 = hw.constant false
        %true_6 = hw.constant true
        %33 = comb.mux %32, %auto_ack_cnt_q, %31 : i9
        %34 = comb.or %arg4, %arg17 : i1
        %35 = comb.and %arg5, %34 : i1
        %true_7 = hw.constant true
        %36 = comb.xor %35, %true : i1
        %37 = comb.and %arg5, %arg3, %36 : i1
        %38 = comb.xor %37, %true : i1
        %39 = comb.or %35, %38 : i1
        %40 = comb.xor %39, %true_7 : i1
        %41 = comb.or %40, %restart_det_q : i1
        %42 = comb.and %36, %38, %arg16 : i1
        %43 = comb.or %42, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %44 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %44 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %false_5 : i1
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
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %true_6 = hw.constant true
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
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
      %false_10 = hw.constant false
      %true_11 = hw.constant true
      verif.assert %true_11 : i1
      %20 = comb.and %3, %16 : i1
      fsm.output %true_6, %true_5, %false_7, %0, %11, %12, %19, %false_4, %auto_ack_cnt_q, %false_8, %input_byte, %20, %14, %false_10, %2, %17, %18, %false_9 : i1, i1, i1, i1, i1, i11, i1, i1, i9, i1, i8, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_14 guard {
        %false_4 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %false_4
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %39 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %39 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
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
        %4 = comb.mux %0, %host_ack, %rw_bit_q : i1
        %5 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %4, %true_4 : i1
        %true_5 = hw.constant true
        %7 = comb.xor %arg1, %true_5 : i1
        %8 = comb.and %7, %0, %6 : i1
        %9 = comb.or %arg16, %8 : i1
        %true_6 = hw.constant true
        %10 = comb.xor %5, %true_6 : i1
        %true_7 = hw.constant true
        %11 = comb.xor %2, %true_7 : i1
        %12 = comb.and %arg5, %11, %10, %9 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %12
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %arg1, %true : i1
        %3 = comb.and %scl_i_q, %2 : i1
        %4 = comb.add %bit_idx, %c1_i4 : i4
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %arg3, %3 : i1
        %7 = comb.mux %6, %c0_i4, %bit_idx : i4
        %8 = comb.xor %1, %true : i1
        %9 = comb.and %8, %3, %5 : i1
        %10 = comb.mux %9, %4, %7 : i4
        %11 = comb.xor %scl_i_q, %true : i1
        %12 = comb.and %11, %arg1 : i1
        %13 = comb.xor %1, %true : i1
        %14 = comb.extract %input_byte from 0 : (i8) -> i7
        %15 = comb.concat %14, %arg2 : i7, i1
        %16 = comb.and %13, %12 : i1
        %17 = comb.mux %16, %15, %c0_i8 : i8
        %18 = comb.and %12, %1 : i1
        %19 = comb.xor %12, %true : i1
        %20 = comb.or %19, %18 : i1
        %21 = comb.mux bin %20, %input_byte, %17 : i8
        %22 = comb.xor %arg2, %true : i1
        %23 = comb.and %12, %13 : i1
        %24 = comb.xor %23, %true : i1
        %25 = comb.and %12, %24, %22 : i1
        %26 = comb.and %12, %24 : i1
        %27 = comb.mux bin %26, %25, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %28 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %29 = comb.xor %28, %true : i1
        %30 = comb.and %arg3, %29 : i1
        %31 = comb.xor %30, %true : i1
        %32 = comb.or %28, %31 : i1
        %33 = comb.xor %32, %true_7 : i1
        %34 = comb.or %33, %restart_det_q : i1
        %35 = comb.and %29, %31, %arg16 : i1
        %36 = comb.or %35, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %37 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %37 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %27 : i1
        fsm.update %input_byte, %21 : i8
        fsm.update %bit_idx, %10 : i4
        fsm.update %restart_det_q, %34 : i1
        fsm.update %nack_transaction_q, %36 : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_12 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.and %arg5, %arg3 : i1
        %2 = comb.xor %1, %true : i1
        %3 = comb.and %2, %arg5, %0 : i1
        %true_4 = hw.constant true
        %4 = comb.xor %arg16, %true_4 : i1
        %true_5 = hw.constant true
        %5 = comb.xor %3, %true_5 : i1
        %true_6 = hw.constant true
        %6 = comb.xor %1, %true_6 : i1
        %7 = comb.and %arg5, %6, %5, %4, %arg1 : i1
        %true_7 = hw.constant true
        verif.assert %true_7 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %true : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true_4 = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.mux %arg3, %c0_i4, %bit_idx : i4
        %3 = comb.xor %scl_i_q, %true_4 : i1
        %4 = comb.xor %1, %true_4 : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.or %1, %scl_i_q : i1
        %8 = comb.mux %7, %c0_i8, %6 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.or %scl_i_q, %9 : i1
        %11 = comb.mux bin %10, %input_byte, %8 : i8
        %12 = comb.xor %arg2, %true_4 : i1
        %13 = comb.and %3, %4 : i1
        %14 = comb.xor %13, %true_4 : i1
        %15 = comb.and %3, %14, %12 : i1
        %16 = comb.or %scl_i_q, %13 : i1
        %17 = comb.mux bin %16, %host_ack, %15 : i1
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %18 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %19 = comb.xor %18, %true_4 : i1
        %20 = comb.and %arg3, %19 : i1
        %21 = comb.xor %20, %true_4 : i1
        %22 = comb.or %18, %21 : i1
        %23 = comb.xor %22, %true_8 : i1
        %24 = comb.or %23, %restart_det_q : i1
        %true_9 = hw.constant true
        %25 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %25 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %17 : i1
        fsm.update %input_byte, %11 : i8
        fsm.update %bit_idx, %2 : i4
        fsm.update %restart_det_q, %24 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_7 guard {
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.or %arg4, %arg17 : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.mux %0, %host_ack, %rw_bit_q : i1
        %5 = comb.and %3, %arg5, %1 : i1
        %true_4 = hw.constant true
        %6 = comb.xor %arg1, %true_4 : i1
        %true_5 = hw.constant true
        %7 = comb.xor %arg16, %true_5 : i1
        %true_6 = hw.constant true
        %8 = comb.xor %5, %true_6 : i1
        %true_7 = hw.constant true
        %9 = comb.xor %2, %true_7 : i1
        %10 = comb.and %arg5, %9, %8, %7, %6, %0, %4 : i1
        %true_8 = hw.constant true
        verif.assert %true_8 : i1
        fsm.return %10
      } action {
        %false_4 = hw.constant false
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %false_4 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_5 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.add %bit_idx, %c1_i4 : i4
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %arg3, %scl_i_q : i1
        %4 = comb.mux %3, %c0_i4, %bit_idx : i4
        %5 = comb.icmp ne %bit_idx, %c-8_i4 : i4
        %6 = comb.and %5, %scl_i_q, %2 : i1
        %7 = comb.mux %6, %1, %4 : i4
        %true_6 = hw.constant true
        %true_7 = hw.constant true
        %8 = comb.or %arg4, %arg17 : i1
        %true_8 = hw.constant true
        %9 = comb.xor %8, %true : i1
        %10 = comb.and %arg3, %9 : i1
        %11 = comb.xor %10, %true : i1
        %12 = comb.or %8, %11 : i1
        %13 = comb.xor %12, %true_8 : i1
        %14 = comb.or %13, %restart_det_q : i1
        %true_9 = hw.constant true
        %15 = comb.xor %_sh1, %true_9 : i1
        %true_10 = hw.constant true
        verif.assert %true_10 : i1
        fsm.update %_sh1_3, %15 : i1
        fsm.update %_sh1, %true_7 : i1
        fsm.update %isFirstCycle, %false_5 : i1
        fsm.update %sda_q, %true_6 : i1
        fsm.update %host_ack, %host_ack : i1
        fsm.update %input_byte, %input_byte : i8
        fsm.update %bit_idx, %7 : i4
        fsm.update %restart_det_q, %14 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_1 guard {
        %0 = comb.and %arg5, %arg3 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
        %c-1_i16 = hw.constant -1 : i16
        %0 = comb.add %tcount_q, %c-1_i16 : i16
        %1 = comb.icmp eq %bit_idx, %c-8_i4 : i4
        %2 = comb.xor %scl_i_q, %true : i1
        %3 = comb.and %2, %arg1 : i1
        %4 = comb.xor %1, %true : i1
        %5 = comb.extract %input_byte from 0 : (i8) -> i7
        %6 = comb.concat %5, %arg2 : i7, i1
        %7 = comb.and %4, %3 : i1
        %8 = comb.mux %7, %6, %c0_i8 : i8
        %9 = comb.and %3, %1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.mux bin %11, %input_byte, %8 : i8
        %13 = comb.xor %arg2, %true : i1
        %14 = comb.and %3, %4 : i1
        %15 = comb.xor %14, %true : i1
        %16 = comb.and %3, %15, %13 : i1
        %17 = comb.and %3, %15 : i1
        %18 = comb.mux bin %17, %16, %host_ack : i1
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %19 = comb.or %arg4, %arg17 : i1
        %true_7 = hw.constant true
        %20 = comb.xor %19, %true_7 : i1
        %21 = comb.or %20, %restart_det_q : i1
        %true_8 = hw.constant true
        %22 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %22 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %18 : i1
        fsm.update %input_byte, %12 : i8
        fsm.update %bit_idx, %c0_i4 : i4
        fsm.update %restart_det_q, %21 : i1
        fsm.update %nack_transaction_q, %nack_transaction_q : i1
        fsm.update %tcount_q, %0 : i16
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.or %arg4, %arg17 : i1
        %1 = comb.xor %arg5, %true : i1
        %2 = comb.and %arg5, %arg3 : i1
        %3 = comb.xor %2, %true : i1
        %true_4 = hw.constant true
        %4 = comb.xor %2, %true_4 : i1
        %5 = comb.and %4, %3, %arg5, %0 : i1
        %6 = comb.or %1, %5 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %6
      } action {
        fsm.update %rw_bit_q, %rw_bit_q : i1
        fsm.update %xfer_for_us_q, %xfer_for_us_q : i1
        fsm.update %xact_for_us_q, %xact_for_us_q : i1
        fsm.update %scl_i_q, %arg1 : i1
        fsm.update %auto_ack_cnt_q, %auto_ack_cnt_q : i9
        fsm.update %stretch_active_cnt, %stretch_active_cnt : i31
        %true = hw.constant true
        %c0_i8 = hw.constant 0 : i8
        %c1_i4 = hw.constant 1 : i4
        %c0_i4 = hw.constant 0 : i4
        %c-8_i4 = hw.constant -8 : i4
        %false_4 = hw.constant false
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
        %true_5 = hw.constant true
        %true_6 = hw.constant true
        %29 = comb.or %arg4, %arg17 : i1
        %30 = comb.and %arg5, %29 : i1
        %true_7 = hw.constant true
        %31 = comb.xor %30, %true : i1
        %32 = comb.and %arg5, %arg3, %31 : i1
        %33 = comb.xor %32, %true : i1
        %34 = comb.or %30, %33 : i1
        %35 = comb.xor %34, %true_7 : i1
        %36 = comb.or %35, %restart_det_q : i1
        %37 = comb.and %31, %33, %arg16 : i1
        %38 = comb.or %37, %nack_transaction_q : i1
        %true_8 = hw.constant true
        %39 = comb.xor %_sh1, %true_8 : i1
        %true_9 = hw.constant true
        verif.assert %true_9 : i1
        fsm.update %_sh1_3, %39 : i1
        fsm.update %_sh1, %true_6 : i1
        fsm.update %isFirstCycle, %false_4 : i1
        fsm.update %sda_q, %true_5 : i1
        fsm.update %host_ack, %28 : i1
        fsm.update %input_byte, %22 : i8
        fsm.update %bit_idx, %11 : i4
        fsm.update %restart_det_q, %36 : i1
        fsm.update %nack_transaction_q, %38 : i1
        fsm.update %tcount_q, %1 : i16
      }
    }
  }
}

