module {
  fsm.machine @aes_cipher_control_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i2, %arg5: i3, %arg6: i1, %arg7: i1, %arg8: i1, %arg9: i1, %arg10: i1, %arg11: i1, %arg12: i1, %arg13: i1, %arg14: i1, %arg15: i1, %arg16: i1, %arg17: i1, %arg18: i1, %arg19: i1, %arg20: i1, %arg21: i1, %arg22: i1, %arg23: i1) -> (i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1) attributes {initialState = "state_9"} {
    %prng_reseed_done_q = fsm.variable "prng_reseed_done_q" {initValue = false} : i1
    %rnd_ctr_q = fsm.variable "rnd_ctr_q" {initValue = 0 : i4} : i4
    %num_rounds_q = fsm.variable "num_rounds_q" {initValue = 0 : i4} : i4
    %cyc_ctr_q = fsm.variable "cyc_ctr_q" {initValue = 0 : i3} : i3
    fsm.state @state_9 output {
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c14_i5 = hw.constant 14 : i5
      %true = hw.constant true
      %c1_i3 = hw.constant 1 : i3
      %c-9_i5 = hw.constant -9 : i5
      %c3_i3 = hw.constant 3 : i3
      %c1_i5 = hw.constant 1 : i5
      %c-8_i5 = hw.constant -8 : i5
      %0 = comb.or %arg9, %arg10 : i1
      %1 = comb.or %arg7, %arg6 : i1
      %2 = comb.xor %arg7, %true : i1
      %3 = comb.and %2, %arg6 : i1
      %4 = comb.mux %arg7, %c1_i5, %c14_i5 : i5
      %5 = comb.icmp eq %arg4, %c1_i2 : i2
      %6 = comb.icmp ne %arg4, %c-2_i2 : i2
      %7 = comb.or %arg7, %5, %6 : i1
      %8 = comb.mux %7, %c14_i5, %c-8_i5 : i5
      %9 = comb.xor %0, %true : i1
      %10 = comb.and %9, %arg1 : i1
      %11 = comb.xor %1, %true : i1
      %12 = comb.and %10, %11 : i1
      %13 = comb.xor %12, %true : i1
      %14 = comb.and %1, %10 : i1
      %15 = comb.xor %14, %true : i1
      %16 = comb.and %0, %arg1 : i1
      %17 = comb.xor %16, %true : i1
      %18 = comb.xor %arg1, %true : i1
      %19 = comb.or %18, %16, %14, %12 : i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %20 = comb.or %18, %16 : i1
      %true_2 = hw.constant true
      %21 = comb.xor %14, %true_2 : i1
      %22 = comb.or %20, %21 : i1
      %23 = comb.mux %22, %c-8_i5, %4 : i5
      %24 = comb.and %17, %14 : i1
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %true_5 = hw.constant true
      %25 = comb.xor %14, %true_5 : i1
      %26 = comb.or %20, %25 : i1
      %27 = comb.mux %26, %c1_i5, %8 : i5
      %28 = comb.and %17, %14 : i1
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %29 = comb.and %17, %14 : i1
      %true_9 = hw.constant true
      %30 = comb.xor %14, %true_9 : i1
      %31 = comb.or %20, %30 : i1
      %32 = comb.mux %31, %arg19, %3 : i1
      %true_10 = hw.constant true
      %33 = comb.xor %14, %true_10 : i1
      %34 = comb.or %20, %33 : i1
      %35 = comb.mux %34, %arg20, %arg7 : i1
      %36 = comb.or %20, %15 : i1
      %37 = comb.and %36, %arg21 : i1
      %38 = comb.mux %16, %arg9, %arg22 : i1
      %39 = comb.mux %16, %arg10, %arg23 : i1
      %40 = comb.and %arg1, %17, %15, %13 : i1
      %41 = comb.icmp eq %arg4, %c1_i2 : i2
      %42 = comb.icmp eq %arg4, %c-2_i2 : i2
      %true_11 = hw.constant true
      %43 = comb.xor %arg3, %true_11 : i1
      %44 = comb.or %43, %41, %42 : i1
      verif.assert %44 : i1
      %45 = comb.icmp eq %arg5, %c1_i3 : i3
      %46 = comb.icmp eq %arg5, %c2_i3 : i3
      %47 = comb.icmp eq %arg5, %c-4_i3 : i3
      %true_12 = hw.constant true
      %48 = comb.xor %arg3, %true_12 : i1
      %49 = comb.or %48, %45, %46, %47 : i1
      verif.assert %49 : i1
      %true_13 = hw.constant true
      verif.assert %true_13 : i1
      fsm.output %19, %false, %40, %false_0, %false_1, %23, %24, %false_3, %false_4, %c-8_i5, %27, %28, %c3_i3, %false_6, %false_7, %false_8, %29, %rnd_ctr_q, %c-9_i5, %c3_i3, %32, %35, %37, %38, %39 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_58 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg9, %arg10 : i1
        %c-2_i4 = hw.constant -2 : i4
        %c3_i4 = hw.constant 3 : i4
        %1 = comb.mux %arg10, %c-2_i4, %c3_i4 : i4
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.icmp eq %arg4, %c1_i2 : i2
        %4 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %5, %3, %4 : i1
        verif.assert %6 : i1
        %7 = comb.icmp eq %arg5, %c1_i3 : i3
        %8 = comb.icmp eq %arg5, %c2_i3 : i3
        %9 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %10 = comb.xor %arg3, %true_0 : i1
        %11 = comb.or %10, %7, %8, %9 : i1
        verif.assert %11 : i1
        %12 = comb.and %0, %arg1 : i1
        %13 = comb.extract %1 from 2 : (i4) -> i2
        %14 = comb.extract %1 from 0 : (i4) -> i1
        %15 = comb.concat %13, %14 : i2, i1
        %c-2_i3 = hw.constant -2 : i3
        %16 = comb.icmp eq %15, %c-2_i3 : i3
        %true_1 = hw.constant true
        %17 = comb.xor %2, %true_1 : i1
        %18 = comb.and %17, %12, %16 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %18
      } action {
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %c-4_i3 = hw.constant -4 : i3
        %c0_i4 = hw.constant 0 : i4
        %c2_i3 = hw.constant 2 : i3
        %c-6_i4 = hw.constant -6 : i4
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg9, %arg10 : i1
        %3 = comb.or %arg7, %arg6 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp ne %arg5, %c2_i3 : i3
        %6 = comb.concat %c-1_i2, %5, %false : i2, i1, i1
        %7 = comb.mux %4, %c-6_i4, %6 : i4
        %8 = comb.xor %2, %true : i1
        %9 = comb.and %8, %arg1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %9, %10 : i1
        %12 = comb.and %3, %9 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.and %2, %arg1 : i1
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.or %15, %14, %13 : i1
        %17 = comb.mux %16, %num_rounds_q, %7 : i4
        %true_0 = hw.constant true
        %18 = comb.xor %12, %true_0 : i1
        %19 = comb.or %15, %14, %18 : i1
        %20 = comb.mux %19, %rnd_ctr_q, %c0_i4 : i4
        %21 = comb.or %15, %14, %12, %11 : i1
        %22 = comb.mux %21, %c0_i3, %1 : i3
        %23 = comb.icmp eq %arg4, %c1_i2 : i2
        %24 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_1 = hw.constant true
        %25 = comb.xor %arg3, %true_1 : i1
        %26 = comb.or %25, %23, %24 : i1
        verif.assert %26 : i1
        %27 = comb.icmp eq %arg5, %c1_i3 : i3
        %28 = comb.icmp eq %arg5, %c2_i3 : i3
        %29 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_2 = hw.constant true
        %30 = comb.xor %arg3, %true_2 : i1
        %31 = comb.or %30, %27, %28, %29 : i1
        verif.assert %31 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %cyc_ctr_q, %22 : i3
        fsm.update %num_rounds_q, %17 : i4
        fsm.update %rnd_ctr_q, %20 : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_35 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg9, %arg10 : i1
        %1 = comb.or %arg7, %arg6 : i1
        %2 = comb.xor %0, %true : i1
        %3 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %4 = comb.icmp eq %arg4, %c1_i2 : i2
        %5 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %6 = comb.xor %arg3, %true_0 : i1
        %7 = comb.or %6, %4, %5 : i1
        verif.assert %7 : i1
        %8 = comb.icmp eq %arg5, %c1_i3 : i3
        %9 = comb.icmp eq %arg5, %c2_i3 : i3
        %10 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg3, %true_1 : i1
        %12 = comb.or %11, %8, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.and %0, %arg1 : i1
        %true_2 = hw.constant true
        %14 = comb.xor %13, %true_2 : i1
        %true_3 = hw.constant true
        %15 = comb.xor %3, %true_3 : i1
        %16 = comb.and %15, %14, %1, %2, %arg1 : i1
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.return %16
      } action {
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %c-4_i3 = hw.constant -4 : i3
        %c0_i4 = hw.constant 0 : i4
        %c2_i3 = hw.constant 2 : i3
        %c-6_i4 = hw.constant -6 : i4
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg9, %arg10 : i1
        %3 = comb.or %arg7, %arg6 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp ne %arg5, %c2_i3 : i3
        %6 = comb.concat %c-1_i2, %5, %false : i2, i1, i1
        %7 = comb.mux %4, %c-6_i4, %6 : i4
        %8 = comb.xor %2, %true : i1
        %9 = comb.and %8, %arg1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %9, %10 : i1
        %12 = comb.and %3, %9 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.and %2, %arg1 : i1
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.or %15, %14, %13 : i1
        %17 = comb.mux %16, %num_rounds_q, %7 : i4
        %true_0 = hw.constant true
        %18 = comb.xor %12, %true_0 : i1
        %19 = comb.or %15, %14, %18 : i1
        %20 = comb.mux %19, %rnd_ctr_q, %c0_i4 : i4
        %21 = comb.or %15, %14, %12, %11 : i1
        %22 = comb.mux %21, %c0_i3, %1 : i3
        %23 = comb.icmp eq %arg4, %c1_i2 : i2
        %24 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_1 = hw.constant true
        %25 = comb.xor %arg3, %true_1 : i1
        %26 = comb.or %25, %23, %24 : i1
        verif.assert %26 : i1
        %27 = comb.icmp eq %arg5, %c1_i3 : i3
        %28 = comb.icmp eq %arg5, %c2_i3 : i3
        %29 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_2 = hw.constant true
        %30 = comb.xor %arg3, %true_2 : i1
        %31 = comb.or %30, %27, %28, %29 : i1
        verif.assert %31 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %cyc_ctr_q, %22 : i3
        fsm.update %num_rounds_q, %17 : i4
        fsm.update %rnd_ctr_q, %20 : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_23 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg9, %arg10 : i1
        %1 = comb.or %arg7, %arg6 : i1
        %2 = comb.xor %0, %true : i1
        %3 = comb.icmp eq %arg4, %c1_i2 : i2
        %4 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %5 = comb.xor %arg3, %true_0 : i1
        %6 = comb.or %5, %3, %4 : i1
        verif.assert %6 : i1
        %7 = comb.icmp eq %arg5, %c1_i3 : i3
        %8 = comb.icmp eq %arg5, %c2_i3 : i3
        %9 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %10 = comb.xor %arg3, %true_1 : i1
        %11 = comb.or %10, %7, %8, %9 : i1
        verif.assert %11 : i1
        %12 = comb.and %1, %2, %arg1 : i1
        %13 = comb.and %0, %arg1 : i1
        %true_2 = hw.constant true
        %14 = comb.xor %12, %true_2 : i1
        %true_3 = hw.constant true
        %15 = comb.xor %13, %true_3 : i1
        %16 = comb.and %arg1, %15, %14 : i1
        %17 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15, %16 : i1
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.return %17
      } action {
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %c-4_i3 = hw.constant -4 : i3
        %c0_i4 = hw.constant 0 : i4
        %c2_i3 = hw.constant 2 : i3
        %c-6_i4 = hw.constant -6 : i4
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg9, %arg10 : i1
        %3 = comb.or %arg7, %arg6 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp ne %arg5, %c2_i3 : i3
        %6 = comb.concat %c-1_i2, %5, %false : i2, i1, i1
        %7 = comb.mux %4, %c-6_i4, %6 : i4
        %8 = comb.xor %2, %true : i1
        %9 = comb.and %8, %arg1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %9, %10 : i1
        %12 = comb.and %3, %9 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.and %2, %arg1 : i1
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.or %15, %14, %13 : i1
        %17 = comb.mux %16, %num_rounds_q, %7 : i4
        %true_0 = hw.constant true
        %18 = comb.xor %12, %true_0 : i1
        %19 = comb.or %15, %14, %18 : i1
        %20 = comb.mux %19, %rnd_ctr_q, %c0_i4 : i4
        %21 = comb.or %15, %14, %12, %11 : i1
        %22 = comb.mux %21, %c0_i3, %1 : i3
        %23 = comb.icmp eq %arg4, %c1_i2 : i2
        %24 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_1 = hw.constant true
        %25 = comb.xor %arg3, %true_1 : i1
        %26 = comb.or %25, %23, %24 : i1
        verif.assert %26 : i1
        %27 = comb.icmp eq %arg5, %c1_i3 : i3
        %28 = comb.icmp eq %arg5, %c2_i3 : i3
        %29 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_2 = hw.constant true
        %30 = comb.xor %arg3, %true_2 : i1
        %31 = comb.or %30, %27, %28, %29 : i1
        verif.assert %31 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %cyc_ctr_q, %22 : i3
        fsm.update %num_rounds_q, %17 : i4
        fsm.update %rnd_ctr_q, %20 : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_14 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg9, %arg10 : i1
        %c-2_i4 = hw.constant -2 : i4
        %c3_i4 = hw.constant 3 : i4
        %1 = comb.mux %arg10, %c-2_i4, %c3_i4 : i4
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.icmp eq %arg4, %c1_i2 : i2
        %4 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %5 = comb.xor %arg3, %true : i1
        %6 = comb.or %5, %3, %4 : i1
        verif.assert %6 : i1
        %7 = comb.icmp eq %arg5, %c1_i3 : i3
        %8 = comb.icmp eq %arg5, %c2_i3 : i3
        %9 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %10 = comb.xor %arg3, %true_0 : i1
        %11 = comb.or %10, %7, %8, %9 : i1
        verif.assert %11 : i1
        %12 = comb.extract %1 from 2 : (i4) -> i2
        %13 = comb.extract %1 from 0 : (i4) -> i1
        %14 = comb.concat %12, %13 : i2, i1
        %c1_i3_1 = hw.constant 1 : i3
        %15 = comb.icmp eq %14, %c1_i3_1 : i3
        %true_2 = hw.constant true
        %16 = comb.xor %2, %true_2 : i1
        %17 = comb.and %16, %0, %arg1, %15 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %17
      } action {
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %c-4_i3 = hw.constant -4 : i3
        %c0_i4 = hw.constant 0 : i4
        %c2_i3 = hw.constant 2 : i3
        %c-6_i4 = hw.constant -6 : i4
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg9, %arg10 : i1
        %3 = comb.or %arg7, %arg6 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp ne %arg5, %c2_i3 : i3
        %6 = comb.concat %c-1_i2, %5, %false : i2, i1, i1
        %7 = comb.mux %4, %c-6_i4, %6 : i4
        %8 = comb.xor %2, %true : i1
        %9 = comb.and %8, %arg1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %9, %10 : i1
        %12 = comb.and %3, %9 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.and %2, %arg1 : i1
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.or %15, %14, %13 : i1
        %17 = comb.mux %16, %num_rounds_q, %7 : i4
        %true_0 = hw.constant true
        %18 = comb.xor %12, %true_0 : i1
        %19 = comb.or %15, %14, %18 : i1
        %20 = comb.mux %19, %rnd_ctr_q, %c0_i4 : i4
        %21 = comb.or %15, %14, %12, %11 : i1
        %22 = comb.mux %21, %c0_i3, %1 : i3
        %23 = comb.icmp eq %arg4, %c1_i2 : i2
        %24 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_1 = hw.constant true
        %25 = comb.xor %arg3, %true_1 : i1
        %26 = comb.or %25, %23, %24 : i1
        verif.assert %26 : i1
        %27 = comb.icmp eq %arg5, %c1_i3 : i3
        %28 = comb.icmp eq %arg5, %c2_i3 : i3
        %29 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_2 = hw.constant true
        %30 = comb.xor %arg3, %true_2 : i1
        %31 = comb.or %30, %27, %28, %29 : i1
        verif.assert %31 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %cyc_ctr_q, %22 : i3
        fsm.update %num_rounds_q, %17 : i4
        fsm.update %rnd_ctr_q, %20 : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_9 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %2 = comb.icmp eq %arg4, %c1_i2 : i2
        %3 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %4 = comb.xor %arg3, %true_0 : i1
        %5 = comb.or %4, %2, %3 : i1
        verif.assert %5 : i1
        %6 = comb.icmp eq %arg5, %c1_i3 : i3
        %7 = comb.icmp eq %arg5, %c2_i3 : i3
        %8 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %9 = comb.xor %arg3, %true_1 : i1
        %10 = comb.or %9, %6, %7, %8 : i1
        verif.assert %10 : i1
        %true_2 = hw.constant true
        %11 = comb.xor %1, %true_2 : i1
        %12 = comb.and %11, %0 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %12
      } action {
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %c-4_i3 = hw.constant -4 : i3
        %c0_i4 = hw.constant 0 : i4
        %c2_i3 = hw.constant 2 : i3
        %c-6_i4 = hw.constant -6 : i4
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg9, %arg10 : i1
        %3 = comb.or %arg7, %arg6 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp ne %arg5, %c2_i3 : i3
        %6 = comb.concat %c-1_i2, %5, %false : i2, i1, i1
        %7 = comb.mux %4, %c-6_i4, %6 : i4
        %8 = comb.xor %2, %true : i1
        %9 = comb.and %8, %arg1 : i1
        %10 = comb.xor %3, %true : i1
        %11 = comb.and %9, %10 : i1
        %12 = comb.and %3, %9 : i1
        %13 = comb.xor %12, %true : i1
        %14 = comb.and %2, %arg1 : i1
        %15 = comb.xor %arg1, %true : i1
        %16 = comb.or %15, %14, %13 : i1
        %17 = comb.mux %16, %num_rounds_q, %7 : i4
        %true_0 = hw.constant true
        %18 = comb.xor %12, %true_0 : i1
        %19 = comb.or %15, %14, %18 : i1
        %20 = comb.mux %19, %rnd_ctr_q, %c0_i4 : i4
        %21 = comb.or %15, %14, %12, %11 : i1
        %22 = comb.mux %21, %c0_i3, %1 : i3
        %23 = comb.icmp eq %arg4, %c1_i2 : i2
        %24 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_1 = hw.constant true
        %25 = comb.xor %arg3, %true_1 : i1
        %26 = comb.or %25, %23, %24 : i1
        verif.assert %26 : i1
        %27 = comb.icmp eq %arg5, %c1_i3 : i3
        %28 = comb.icmp eq %arg5, %c2_i3 : i3
        %29 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_2 = hw.constant true
        %30 = comb.xor %arg3, %true_2 : i1
        %31 = comb.or %30, %27, %28, %29 : i1
        verif.assert %31 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %cyc_ctr_q, %22 : i3
        fsm.update %num_rounds_q, %17 : i4
        fsm.update %rnd_ctr_q, %20 : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
    }
    fsm.state @state_14 output {
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c14_i5 = hw.constant 14 : i5
      %true = hw.constant true
      %c1_i3 = hw.constant 1 : i3
      %c-9_i5 = hw.constant -9 : i5
      %c3_i3 = hw.constant 3 : i3
      %c1_i5 = hw.constant 1 : i5
      %c-8_i5 = hw.constant -8 : i5
      %0 = comb.xor %arg2, %true : i1
      %1 = comb.xor %arg23, %true : i1
      %2 = comb.mux %1, %c-8_i5, %c14_i5 : i5
      %3 = comb.xor %arg22, %true : i1
      %4 = comb.mux %3, %c1_i5, %c-9_i5 : i5
      %5 = comb.and %0, %arg22 : i1
      %6 = comb.and %0, %arg23 : i1
      %false = hw.constant false
      %true_0 = hw.constant true
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %7 = comb.mux %3, %c3_i3, %c-4_i3 : i3
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %8 = comb.icmp eq %arg4, %c1_i2 : i2
      %9 = comb.icmp eq %arg4, %c-2_i2 : i2
      %true_10 = hw.constant true
      %10 = comb.xor %arg3, %true_10 : i1
      %11 = comb.or %10, %8, %9 : i1
      verif.assert %11 : i1
      %12 = comb.icmp eq %arg5, %c1_i3 : i3
      %13 = comb.icmp eq %arg5, %c2_i3 : i3
      %14 = comb.icmp eq %arg5, %c-4_i3 : i3
      %true_11 = hw.constant true
      %15 = comb.xor %arg3, %true_11 : i1
      %16 = comb.or %15, %12, %13, %14 : i1
      verif.assert %16 : i1
      %true_12 = hw.constant true
      verif.assert %true_12 : i1
      fsm.output %false, %true_0, %false_9, %false_1, %false_2, %c-8_i5, %false_3, %false_4, %false_5, %2, %4, %arg22, %7, %arg22, %false_6, %false_7, %false_8, %rnd_ctr_q, %c-9_i5, %c3_i3, %arg19, %arg20, %arg21, %5, %6 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.icmp eq %arg4, %c1_i2 : i2
        %1 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %2, %0, %1 : i1
        verif.assert %3 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp eq %arg5, %c2_i3 : i3
        %6 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %4, %5, %6 : i1
        verif.assert %8 : i1
        %9 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %9
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp eq %arg4, %c1_i2 : i2
        %3 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %4 = comb.xor %arg3, %true : i1
        %5 = comb.or %4, %2, %3 : i1
        verif.assert %5 : i1
        %6 = comb.icmp eq %arg5, %c1_i3 : i3
        %7 = comb.icmp eq %arg5, %c2_i3 : i3
        %8 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %9 = comb.xor %arg3, %true_0 : i1
        %10 = comb.or %9, %6, %7, %8 : i1
        verif.assert %10 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_14 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %1 = comb.icmp eq %arg4, %c1_i2 : i2
        %2 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %3 = comb.xor %arg3, %true : i1
        %4 = comb.or %3, %1, %2 : i1
        verif.assert %4 : i1
        %5 = comb.icmp eq %arg5, %c1_i3 : i3
        %6 = comb.icmp eq %arg5, %c2_i3 : i3
        %7 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %8 = comb.xor %arg3, %true_0 : i1
        %9 = comb.or %8, %5, %6, %7 : i1
        verif.assert %9 : i1
        %true_1 = hw.constant true
        %10 = comb.xor %arg2, %true_1 : i1
        %true_2 = hw.constant true
        %11 = comb.xor %0, %true_2 : i1
        %12 = comb.and %11, %10 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %12
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp eq %arg4, %c1_i2 : i2
        %3 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %4 = comb.xor %arg3, %true : i1
        %5 = comb.or %4, %2, %3 : i1
        verif.assert %5 : i1
        %6 = comb.icmp eq %arg5, %c1_i3 : i3
        %7 = comb.icmp eq %arg5, %c2_i3 : i3
        %8 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %9 = comb.xor %arg3, %true_0 : i1
        %10 = comb.or %9, %6, %7, %8 : i1
        verif.assert %10 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_9 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %1 = comb.icmp eq %arg4, %c1_i2 : i2
        %2 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %3 = comb.xor %arg3, %true : i1
        %4 = comb.or %3, %1, %2 : i1
        verif.assert %4 : i1
        %5 = comb.icmp eq %arg5, %c1_i3 : i3
        %6 = comb.icmp eq %arg5, %c2_i3 : i3
        %7 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %8 = comb.xor %arg3, %true_0 : i1
        %9 = comb.or %8, %5, %6, %7 : i1
        verif.assert %9 : i1
        %true_1 = hw.constant true
        %10 = comb.xor %0, %true_1 : i1
        %11 = comb.and %10, %arg2 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %11
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp eq %arg4, %c1_i2 : i2
        %3 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %4 = comb.xor %arg3, %true : i1
        %5 = comb.or %4, %2, %3 : i1
        verif.assert %5 : i1
        %6 = comb.icmp eq %arg5, %c1_i3 : i3
        %7 = comb.icmp eq %arg5, %c2_i3 : i3
        %8 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %9 = comb.xor %arg3, %true_0 : i1
        %10 = comb.or %9, %6, %7, %8 : i1
        verif.assert %10 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
    }
    fsm.state @state_23 output {
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c1_i3 = hw.constant 1 : i3
      %c-9_i5 = hw.constant -9 : i5
      %c3_i3 = hw.constant 3 : i3
      %c1_i5 = hw.constant 1 : i5
      %c-8_i5 = hw.constant -8 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
      %true = hw.constant true
      %0 = comb.icmp eq %arg4, %c1_i2 : i2
      %1 = comb.icmp eq %arg4, %c-2_i2 : i2
      %true_11 = hw.constant true
      %2 = comb.xor %arg3, %true_11 : i1
      %3 = comb.or %2, %0, %1 : i1
      verif.assert %3 : i1
      %4 = comb.icmp eq %arg5, %c1_i3 : i3
      %5 = comb.icmp eq %arg5, %c2_i3 : i3
      %6 = comb.icmp eq %arg5, %c-4_i3 : i3
      %true_12 = hw.constant true
      %7 = comb.xor %arg3, %true_12 : i1
      %8 = comb.or %7, %4, %5, %6 : i1
      verif.assert %8 : i1
      verif.assert %true : i1
      fsm.output %false, %false_0, %true, %false_1, %false_2, %c-8_i5, %false_3, %false_4, %false_5, %c-8_i5, %c1_i5, %false_6, %c3_i3, %false_7, %false_8, %false_9, %false_10, %rnd_ctr_q, %c-9_i5, %c3_i3, %arg19, %arg20, %arg21, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.icmp eq %arg4, %c1_i2 : i2
        %1 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %2, %0, %1 : i1
        verif.assert %3 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp eq %arg5, %c2_i3 : i3
        %6 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %4, %5, %6 : i1
        verif.assert %8 : i1
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %true_1
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
        %2 = comb.icmp eq %arg4, %c1_i2 : i2
        %3 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %4 = comb.xor %arg3, %true_0 : i1
        %5 = comb.or %4, %2, %3 : i1
        verif.assert %5 : i1
        %6 = comb.icmp eq %arg5, %c1_i3 : i3
        %7 = comb.icmp eq %arg5, %c2_i3 : i3
        %8 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %9 = comb.xor %arg3, %true_1 : i1
        %10 = comb.or %9, %6, %7, %8 : i1
        verif.assert %10 : i1
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
    }
    fsm.state @state_35 output {
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c14_i5 = hw.constant 14 : i5
      %true = hw.constant true
      %c1_i3 = hw.constant 1 : i3
      %c-9_i5 = hw.constant -9 : i5
      %c3_i3 = hw.constant 3 : i3
      %c1_i5 = hw.constant 1 : i5
      %c-8_i5 = hw.constant -8 : i5
      %0 = comb.icmp eq %arg4, %c1_i2 : i2
      %1 = comb.icmp eq %arg5, %c1_i3 : i3
      %2 = comb.icmp eq %arg5, %c2_i3 : i3
      %3 = comb.and %2, %0 : i1
      %4 = comb.icmp eq %arg4, %c-2_i2 : i2
      %5 = comb.and %2, %4 : i1
      %6 = comb.icmp eq %arg5, %c-4_i3 : i3
      %7 = comb.and %6, %0 : i1
      %8 = comb.and %6, %4 : i1
      %9 = comb.mux %8, %c1_i5, %c-9_i5 : i5
      %10 = comb.mux %7, %c14_i5, %9 : i5
      %11 = comb.mux %5, %c-8_i5, %10 : i5
      %12 = comb.or %1, %3 : i1
      %13 = comb.mux %12, %c14_i5, %11 : i5
      %14 = comb.icmp ne %arg5, %c-4_i3 : i3
      %15 = comb.xor %arg20, %true : i1
      %16 = comb.xor %14, %true : i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %17 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
      %18 = comb.icmp eq %arg4, %c1_i2 : i2
      %19 = comb.icmp eq %arg4, %c-2_i2 : i2
      %true_7 = hw.constant true
      %20 = comb.xor %arg3, %true_7 : i1
      %21 = comb.or %20, %18, %19 : i1
      verif.assert %21 : i1
      %22 = comb.icmp eq %arg5, %c1_i3 : i3
      %23 = comb.icmp eq %arg5, %c2_i3 : i3
      %24 = comb.icmp eq %arg5, %c-4_i3 : i3
      %true_8 = hw.constant true
      %25 = comb.xor %arg3, %true_8 : i1
      %26 = comb.or %25, %22, %23, %24 : i1
      verif.assert %26 : i1
      %true_9 = hw.constant true
      verif.assert %true_9 : i1
      %27 = comb.and %arg18, %17 : i1
      %28 = comb.and %14, %27 : i1
      %29 = comb.and %27, %14 : i1
      %30 = comb.or %16, %29 : i1
      %31 = comb.xor %30, %true : i1
      %32 = comb.and %30, %28 : i1
      %33 = comb.xor %27, %true : i1
      %34 = comb.and %14, %33 : i1
      %35 = comb.xor %34, %true : i1
      %36 = comb.or %34, %30 : i1
      %37 = comb.mux %36, %c14_i5, %c-8_i5 : i5
      %38 = comb.or %34, %32 : i1
      %true_10 = hw.constant true
      %39 = comb.xor %36, %true_10 : i1
      %40 = comb.or %39, %arg20 : i1
      %41 = comb.mux %40, %c-9_i5, %13 : i5
      %42 = comb.and %35, %30, %15 : i1
      %43 = comb.and %35, %30, %28 : i1
      %44 = comb.and %35, %30, %28 : i1
      %45 = comb.and %35, %31 : i1
      fsm.output %false, %false_0, %45, %false_1, %false_2, %c-8_i5, %42, %false_3, %false_4, %37, %c1_i5, %43, %c3_i3, %false_5, %38, %44, %false_6, %rnd_ctr_q, %41, %c3_i3, %arg19, %arg20, %arg21, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_61 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.icmp ne %arg5, %c-4_i3 : i3
        %1 = comb.xor %0, %true : i1
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %4 = comb.icmp eq %arg4, %c1_i2 : i2
        %5 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %6 = comb.xor %arg3, %true_0 : i1
        %7 = comb.or %6, %4, %5 : i1
        verif.assert %7 : i1
        %8 = comb.icmp eq %arg5, %c1_i3 : i3
        %9 = comb.icmp eq %arg5, %c2_i3 : i3
        %10 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg3, %true_1 : i1
        %12 = comb.or %11, %8, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.and %arg18, %3 : i1
        %14 = comb.and %13, %0 : i1
        %15 = comb.or %1, %14 : i1
        %16 = comb.xor %13, %true : i1
        %17 = comb.and %0, %16 : i1
        %true_2 = hw.constant true
        %18 = comb.xor %17, %true_2 : i1
        %true_3 = hw.constant true
        %19 = comb.xor %2, %true_3 : i1
        %20 = comb.and %19, %18, %15 : i1
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.return %20
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp ne %arg5, %c-4_i3 : i3
        %3 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %4 = comb.xor %2, %true : i1
        %5 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %6 = comb.icmp eq %arg4, %c1_i2 : i2
        %7 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %8 = comb.xor %arg3, %true_0 : i1
        %9 = comb.or %8, %6, %7 : i1
        verif.assert %9 : i1
        %10 = comb.icmp eq %arg5, %c1_i3 : i3
        %11 = comb.icmp eq %arg5, %c2_i3 : i3
        %12 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %13 = comb.xor %arg3, %true_1 : i1
        %14 = comb.or %13, %10, %11, %12 : i1
        verif.assert %14 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        %15 = comb.and %arg18, %5 : i1
        %16 = comb.and %15, %2 : i1
        %17 = comb.or %4, %16 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.xor %15, %true : i1
        %20 = comb.and %2, %19 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.xor %17, %true : i1
        %23 = comb.or %20, %22 : i1
        %24 = comb.mux %23, %rnd_ctr_q, %3 : i4
        %true_3 = hw.constant true
        %25 = comb.xor %17, %true_3 : i1
        %26 = comb.or %20, %25 : i1
        %27 = comb.mux %26, %1, %c0_i3 : i3
        %28 = comb.and %21, %18, %0 : i1
        fsm.update %cyc_ctr_q, %27 : i3
        fsm.update %rnd_ctr_q, %24 : i4
        fsm.update %prng_reseed_done_q, %28 : i1
      }
      fsm.transition @state_35 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.icmp ne %arg5, %c-4_i3 : i3
        %1 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %2 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %3 = comb.icmp eq %arg4, %c1_i2 : i2
        %4 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %5 = comb.xor %arg3, %true_0 : i1
        %6 = comb.or %5, %3, %4 : i1
        verif.assert %6 : i1
        %7 = comb.icmp eq %arg5, %c1_i3 : i3
        %8 = comb.icmp eq %arg5, %c2_i3 : i3
        %9 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %10 = comb.xor %arg3, %true_1 : i1
        %11 = comb.or %10, %7, %8, %9 : i1
        verif.assert %11 : i1
        %12 = comb.and %arg18, %2 : i1
        %13 = comb.xor %12, %true : i1
        %true_2 = hw.constant true
        %14 = comb.xor %1, %true_2 : i1
        %15 = comb.and %14, %0, %13 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %15
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp ne %arg5, %c-4_i3 : i3
        %3 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %4 = comb.xor %2, %true : i1
        %5 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %6 = comb.icmp eq %arg4, %c1_i2 : i2
        %7 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %8 = comb.xor %arg3, %true_0 : i1
        %9 = comb.or %8, %6, %7 : i1
        verif.assert %9 : i1
        %10 = comb.icmp eq %arg5, %c1_i3 : i3
        %11 = comb.icmp eq %arg5, %c2_i3 : i3
        %12 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %13 = comb.xor %arg3, %true_1 : i1
        %14 = comb.or %13, %10, %11, %12 : i1
        verif.assert %14 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        %15 = comb.and %arg18, %5 : i1
        %16 = comb.and %15, %2 : i1
        %17 = comb.or %4, %16 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.xor %15, %true : i1
        %20 = comb.and %2, %19 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.xor %17, %true : i1
        %23 = comb.or %20, %22 : i1
        %24 = comb.mux %23, %rnd_ctr_q, %3 : i4
        %true_3 = hw.constant true
        %25 = comb.xor %17, %true_3 : i1
        %26 = comb.or %20, %25 : i1
        %27 = comb.mux %26, %1, %c0_i3 : i3
        %28 = comb.and %21, %18, %0 : i1
        fsm.update %cyc_ctr_q, %27 : i3
        fsm.update %rnd_ctr_q, %24 : i4
        fsm.update %prng_reseed_done_q, %28 : i1
      }
      fsm.transition @state_23 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.icmp ne %arg5, %c-4_i3 : i3
        %1 = comb.xor %0, %true : i1
        %2 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %3 = comb.icmp eq %arg4, %c1_i2 : i2
        %4 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %5 = comb.xor %arg3, %true_0 : i1
        %6 = comb.or %5, %3, %4 : i1
        verif.assert %6 : i1
        %7 = comb.icmp eq %arg5, %c1_i3 : i3
        %8 = comb.icmp eq %arg5, %c2_i3 : i3
        %9 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %10 = comb.xor %arg3, %true_1 : i1
        %11 = comb.or %10, %7, %8, %9 : i1
        verif.assert %11 : i1
        %12 = comb.and %arg18, %2 : i1
        %13 = comb.and %12, %0 : i1
        %14 = comb.or %1, %13 : i1
        %15 = comb.xor %12, %true : i1
        %16 = comb.and %0, %15 : i1
        %true_2 = hw.constant true
        %17 = comb.xor %14, %true_2 : i1
        %true_3 = hw.constant true
        %18 = comb.xor %16, %true_3 : i1
        %19 = comb.and %18, %17 : i1
        %20 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15, %19 : i1
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.return %20
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp ne %arg5, %c-4_i3 : i3
        %3 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %4 = comb.xor %2, %true : i1
        %5 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %6 = comb.icmp eq %arg4, %c1_i2 : i2
        %7 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %8 = comb.xor %arg3, %true_0 : i1
        %9 = comb.or %8, %6, %7 : i1
        verif.assert %9 : i1
        %10 = comb.icmp eq %arg5, %c1_i3 : i3
        %11 = comb.icmp eq %arg5, %c2_i3 : i3
        %12 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %13 = comb.xor %arg3, %true_1 : i1
        %14 = comb.or %13, %10, %11, %12 : i1
        verif.assert %14 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        %15 = comb.and %arg18, %5 : i1
        %16 = comb.and %15, %2 : i1
        %17 = comb.or %4, %16 : i1
        %18 = comb.xor %17, %true : i1
        %19 = comb.xor %15, %true : i1
        %20 = comb.and %2, %19 : i1
        %21 = comb.xor %20, %true : i1
        %22 = comb.xor %17, %true : i1
        %23 = comb.or %20, %22 : i1
        %24 = comb.mux %23, %rnd_ctr_q, %3 : i4
        %true_3 = hw.constant true
        %25 = comb.xor %17, %true_3 : i1
        %26 = comb.or %20, %25 : i1
        %27 = comb.mux %26, %1, %c0_i3 : i3
        %28 = comb.and %21, %18, %0 : i1
        fsm.update %cyc_ctr_q, %27 : i3
        fsm.update %rnd_ctr_q, %24 : i4
        fsm.update %prng_reseed_done_q, %28 : i1
      }
    }
    fsm.state @state_58 output {
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c1_i3 = hw.constant 1 : i3
      %c-9_i5 = hw.constant -9 : i5
      %c3_i3 = hw.constant 3 : i3
      %c1_i5 = hw.constant 1 : i5
      %c-8_i5 = hw.constant -8 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true = hw.constant true
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %false_7 = hw.constant false
      %false_8 = hw.constant false
      %false_9 = hw.constant false
      %false_10 = hw.constant false
      %0 = comb.icmp eq %arg4, %c1_i2 : i2
      %1 = comb.icmp eq %arg4, %c-2_i2 : i2
      %true_11 = hw.constant true
      %2 = comb.xor %arg3, %true_11 : i1
      %3 = comb.or %2, %0, %1 : i1
      verif.assert %3 : i1
      %4 = comb.icmp eq %arg5, %c1_i3 : i3
      %5 = comb.icmp eq %arg5, %c2_i3 : i3
      %6 = comb.icmp eq %arg5, %c-4_i3 : i3
      %true_12 = hw.constant true
      %7 = comb.xor %arg3, %true_12 : i1
      %8 = comb.or %7, %4, %5, %6 : i1
      verif.assert %8 : i1
      %true_13 = hw.constant true
      verif.assert %true_13 : i1
      fsm.output %false, %false_0, %false_10, %false_1, %false_2, %c1_i5, %true, %false_3, %false_4, %c-8_i5, %c1_i5, %false_5, %c3_i3, %false_6, %false_7, %false_8, %false_9, %rnd_ctr_q, %c-9_i5, %c3_i3, %arg19, %arg20, %arg21, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.icmp eq %arg4, %c1_i2 : i2
        %1 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %2, %0, %1 : i1
        verif.assert %3 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp eq %arg5, %c2_i3 : i3
        %6 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %4, %5, %6 : i1
        verif.assert %8 : i1
        %9 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %9
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp eq %arg4, %c1_i2 : i2
        %3 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %4 = comb.xor %arg3, %true : i1
        %5 = comb.or %4, %2, %3 : i1
        verif.assert %5 : i1
        %6 = comb.icmp eq %arg5, %c1_i3 : i3
        %7 = comb.icmp eq %arg5, %c2_i3 : i3
        %8 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %9 = comb.xor %arg3, %true_0 : i1
        %10 = comb.or %9, %6, %7, %8 : i1
        verif.assert %10 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_14 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %1 = comb.icmp eq %arg4, %c1_i2 : i2
        %2 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %3 = comb.xor %arg3, %true : i1
        %4 = comb.or %3, %1, %2 : i1
        verif.assert %4 : i1
        %5 = comb.icmp eq %arg5, %c1_i3 : i3
        %6 = comb.icmp eq %arg5, %c2_i3 : i3
        %7 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %8 = comb.xor %arg3, %true_0 : i1
        %9 = comb.or %8, %5, %6, %7 : i1
        verif.assert %9 : i1
        %true_1 = hw.constant true
        %10 = comb.xor %0, %true_1 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %10
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp eq %arg4, %c1_i2 : i2
        %3 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %4 = comb.xor %arg3, %true : i1
        %5 = comb.or %4, %2, %3 : i1
        verif.assert %5 : i1
        %6 = comb.icmp eq %arg5, %c1_i3 : i3
        %7 = comb.icmp eq %arg5, %c2_i3 : i3
        %8 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %9 = comb.xor %arg3, %true_0 : i1
        %10 = comb.or %9, %6, %7, %8 : i1
        verif.assert %10 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
    }
    fsm.state @state_61 output {
      %c-1_i4 = hw.constant -1 : i4
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c14_i5 = hw.constant 14 : i5
      %true = hw.constant true
      %c1_i3 = hw.constant 1 : i3
      %c-9_i5 = hw.constant -9 : i5
      %c3_i3 = hw.constant 3 : i3
      %c1_i5 = hw.constant 1 : i5
      %c-8_i5 = hw.constant -8 : i5
      %0 = comb.add %num_rounds_q, %c-1_i4 : i4
      %1 = comb.icmp eq %arg4, %c1_i2 : i2
      %2 = comb.icmp ne %arg4, %c-2_i2 : i2
      %3 = comb.icmp eq %arg5, %c1_i3 : i3
      %4 = comb.icmp eq %arg5, %c2_i3 : i3
      %5 = comb.and %4, %1 : i1
      %6 = comb.icmp eq %arg4, %c-2_i2 : i2
      %7 = comb.and %4, %6 : i1
      %8 = comb.icmp eq %arg5, %c-4_i3 : i3
      %9 = comb.and %8, %1 : i1
      %10 = comb.and %8, %6 : i1
      %11 = comb.xor %arg20, %true : i1
      %12 = comb.mux %10, %c14_i5, %c-9_i5 : i5
      %13 = comb.mux %9, %c1_i5, %12 : i5
      %14 = comb.mux %7, %c14_i5, %13 : i5
      %15 = comb.mux %5, %c-8_i5, %14 : i5
      %16 = comb.mux %3, %c14_i5, %15 : i5
      %17 = comb.or %arg20, %arg17 : i1
      %18 = comb.icmp uge %rnd_ctr_q, %0 : i4
      %19 = comb.xor %arg2, %true : i1
      %20 = comb.xor %18, %true : i1
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %21 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
      %22 = comb.icmp eq %arg4, %c1_i2 : i2
      %23 = comb.icmp eq %arg4, %c-2_i2 : i2
      %true_3 = hw.constant true
      %24 = comb.xor %arg3, %true_3 : i1
      %25 = comb.or %24, %22, %23 : i1
      verif.assert %25 : i1
      %26 = comb.icmp eq %arg5, %c1_i3 : i3
      %27 = comb.icmp eq %arg5, %c2_i3 : i3
      %28 = comb.icmp eq %arg5, %c-4_i3 : i3
      %true_4 = hw.constant true
      %29 = comb.xor %arg3, %true_4 : i1
      %30 = comb.or %29, %26, %27, %28 : i1
      verif.assert %30 : i1
      %true_5 = hw.constant true
      verif.assert %true_5 : i1
      %31 = comb.and %arg18, %21, %17 : i1
      %32 = comb.and %18, %31 : i1
      %33 = comb.and %arg20, %32 : i1
      %34 = comb.xor %33, %true : i1
      %35 = comb.and %32, %11 : i1
      %36 = comb.xor %35, %true : i1
      %37 = comb.and %31, %20 : i1
      %38 = comb.xor %37, %true : i1
      %39 = comb.or %37, %35, %33 : i1
      %40 = comb.or %37, %35, %33 : i1
      %41 = comb.or %37, %35, %33 : i1
      %42 = comb.or %37, %35, %33 : i1
      %43 = comb.xor %31, %true : i1
      %44 = comb.or %43, %37, %35, %33 : i1
      %45 = comb.or %43, %42 : i1
      %46 = comb.and %31, %38, %36, %34 : i1
      %47 = comb.or %46, %arg20 : i1
      %48 = comb.mux %47, %c-9_i5, %16 : i5
      %49 = comb.and %31, %38, %36, %34 : i1
      %50 = comb.or %43, %37, %35 : i1
      %true_6 = hw.constant true
      %51 = comb.xor %33, %true_6 : i1
      %52 = comb.or %50, %51 : i1
      %53 = comb.mux %52, %arg20, %19 : i1
      %true_7 = hw.constant true
      %54 = comb.xor %33, %true_7 : i1
      %55 = comb.or %50, %54, %19 : i1
      %56 = comb.and %55, %arg21 : i1
      %57 = comb.and %38, %36, %33 : i1
      %58 = comb.and %31, %39, %11 : i1
      %59 = comb.and %44, %11 : i1
      %60 = comb.and %31, %40, %11 : i1
      %61 = comb.and %31, %41 : i1
      %62 = comb.and %38, %36, %33 : i1
      %63 = comb.and %31, %42 : i1
      %64 = comb.or %49, %1, %2 : i1
      %65 = comb.mux %64, %c3_i3, %c-4_i3 : i3
      %66 = comb.and %31, %38, %36, %34 : i1
      fsm.output %false, %57, %66, %false_0, %false_1, %c-8_i5, %58, %59, %60, %c-8_i5, %c1_i5, %61, %c3_i3, %62, %45, %63, %false_2, %rnd_ctr_q, %48, %65, %arg19, %53, %56, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_61 guard {
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.or %arg20, %arg17 : i1
        %2 = comb.icmp ult %rnd_ctr_q, %0 : i4
        %3 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %5 = comb.icmp eq %arg4, %c1_i2 : i2
        %6 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %5, %6 : i1
        verif.assert %8 : i1
        %9 = comb.icmp eq %arg5, %c1_i3 : i3
        %10 = comb.icmp eq %arg5, %c2_i3 : i3
        %11 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %12 = comb.xor %arg3, %true_1 : i1
        %13 = comb.or %12, %9, %10, %11 : i1
        verif.assert %13 : i1
        %14 = comb.and %arg18, %4, %1 : i1
        %15 = comb.and %14, %2 : i1
        %16 = comb.xor %14, %true : i1
        %17 = comb.or %16, %15 : i1
        %true_2 = hw.constant true
        %18 = comb.xor %3, %true_2 : i1
        %19 = comb.and %18, %17 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %19
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.or %prng_reseed_done_q, %arg16 : i1
        %2 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %3 = comb.xor %arg20, %true : i1
        %4 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %5 = comb.or %arg20, %arg17 : i1
        %6 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %7 = comb.xor %6, %true : i1
        %8 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %9 = comb.icmp eq %arg4, %c1_i2 : i2
        %10 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %11 = comb.xor %arg3, %true_0 : i1
        %12 = comb.or %11, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.icmp eq %arg5, %c1_i3 : i3
        %14 = comb.icmp eq %arg5, %c2_i3 : i3
        %15 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %16 = comb.xor %arg3, %true_1 : i1
        %17 = comb.or %16, %13, %14, %15 : i1
        verif.assert %17 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %prng_reseed_done_q, %1 : i1
        %18 = comb.and %arg18, %8, %5 : i1
        %19 = comb.and %6, %18 : i1
        %20 = comb.and %arg20, %19 : i1
        %21 = comb.and %19, %3 : i1
        %22 = comb.and %18, %7 : i1
        %23 = comb.or %22, %21, %20 : i1
        %24 = comb.or %22, %21, %20 : i1
        %25 = comb.and %18, %24 : i1
        %26 = comb.mux %25, %c0_i3, %2 : i3
        %27 = comb.and %18, %23 : i1
        %28 = comb.mux %27, %4, %rnd_ctr_q : i4
        fsm.update %cyc_ctr_q, %26 : i3
        fsm.update %rnd_ctr_q, %28 : i4
      }
      fsm.transition @state_23 guard {
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.xor %arg20, %true : i1
        %2 = comb.or %arg20, %arg17 : i1
        %3 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %4 = comb.xor %3, %true : i1
        %5 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %6 = comb.icmp eq %arg4, %c1_i2 : i2
        %7 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %8 = comb.xor %arg3, %true_0 : i1
        %9 = comb.or %8, %6, %7 : i1
        verif.assert %9 : i1
        %10 = comb.icmp eq %arg5, %c1_i3 : i3
        %11 = comb.icmp eq %arg5, %c2_i3 : i3
        %12 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %13 = comb.xor %arg3, %true_1 : i1
        %14 = comb.or %13, %10, %11, %12 : i1
        verif.assert %14 : i1
        %15 = comb.and %arg18, %5, %2 : i1
        %16 = comb.and %3, %15 : i1
        %17 = comb.and %arg20, %16 : i1
        %18 = comb.and %16, %1 : i1
        %19 = comb.and %15, %4 : i1
        %20 = comb.xor %15, %true : i1
        %21 = comb.or %20, %19 : i1
        %true_2 = hw.constant true
        %22 = comb.xor %17, %true_2 : i1
        %true_3 = hw.constant true
        %23 = comb.xor %18, %true_3 : i1
        %true_4 = hw.constant true
        %24 = comb.xor %21, %true_4 : i1
        %25 = comb.and %24, %23, %22 : i1
        %26 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15, %25 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %26
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.or %prng_reseed_done_q, %arg16 : i1
        %2 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %3 = comb.xor %arg20, %true : i1
        %4 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %5 = comb.or %arg20, %arg17 : i1
        %6 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %7 = comb.xor %6, %true : i1
        %8 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %9 = comb.icmp eq %arg4, %c1_i2 : i2
        %10 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %11 = comb.xor %arg3, %true_0 : i1
        %12 = comb.or %11, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.icmp eq %arg5, %c1_i3 : i3
        %14 = comb.icmp eq %arg5, %c2_i3 : i3
        %15 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %16 = comb.xor %arg3, %true_1 : i1
        %17 = comb.or %16, %13, %14, %15 : i1
        verif.assert %17 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %prng_reseed_done_q, %1 : i1
        %18 = comb.and %arg18, %8, %5 : i1
        %19 = comb.and %6, %18 : i1
        %20 = comb.and %arg20, %19 : i1
        %21 = comb.and %19, %3 : i1
        %22 = comb.and %18, %7 : i1
        %23 = comb.or %22, %21, %20 : i1
        %24 = comb.or %22, %21, %20 : i1
        %25 = comb.and %18, %24 : i1
        %26 = comb.mux %25, %c0_i3, %2 : i3
        %27 = comb.and %18, %23 : i1
        %28 = comb.mux %27, %4, %rnd_ctr_q : i4
        fsm.update %cyc_ctr_q, %26 : i3
        fsm.update %rnd_ctr_q, %28 : i4
      }
      fsm.transition @state_16 guard {
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.xor %arg20, %true : i1
        %2 = comb.or %arg20, %arg17 : i1
        %3 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %c9_i5 = hw.constant 9 : i5
        %c-16_i5 = hw.constant -16 : i5
        %4 = comb.mux %arg2, %c9_i5, %c-16_i5 : i5
        %5 = comb.xor %3, %true : i1
        %6 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %7 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %8 = comb.icmp eq %arg4, %c1_i2 : i2
        %9 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %10 = comb.xor %arg3, %true_0 : i1
        %11 = comb.or %10, %8, %9 : i1
        verif.assert %11 : i1
        %12 = comb.icmp eq %arg5, %c1_i3 : i3
        %13 = comb.icmp eq %arg5, %c2_i3 : i3
        %14 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %15 = comb.xor %arg3, %true_1 : i1
        %16 = comb.or %15, %12, %13, %14 : i1
        verif.assert %16 : i1
        %17 = comb.and %arg18, %7, %2 : i1
        %18 = comb.and %3, %17 : i1
        %19 = comb.and %18, %1 : i1
        %20 = comb.and %17, %5 : i1
        %21 = comb.xor %17, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.extract %4 from 3 : (i5) -> i2
        %24 = comb.extract %4 from 0 : (i5) -> i1
        %25 = comb.concat %23, %24 : i2, i1
        %c-4_i3_2 = hw.constant -4 : i3
        %26 = comb.icmp eq %25, %c-4_i3_2 : i3
        %27 = comb.and %arg20, %18, %26 : i1
        %28 = comb.or %19, %27 : i1
        %true_3 = hw.constant true
        %29 = comb.xor %22, %true_3 : i1
        %true_4 = hw.constant true
        %30 = comb.xor %6, %true_4 : i1
        %31 = comb.and %30, %29, %28 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %31
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.or %prng_reseed_done_q, %arg16 : i1
        %2 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %3 = comb.xor %arg20, %true : i1
        %4 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %5 = comb.or %arg20, %arg17 : i1
        %6 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %7 = comb.xor %6, %true : i1
        %8 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %9 = comb.icmp eq %arg4, %c1_i2 : i2
        %10 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %11 = comb.xor %arg3, %true_0 : i1
        %12 = comb.or %11, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.icmp eq %arg5, %c1_i3 : i3
        %14 = comb.icmp eq %arg5, %c2_i3 : i3
        %15 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %16 = comb.xor %arg3, %true_1 : i1
        %17 = comb.or %16, %13, %14, %15 : i1
        verif.assert %17 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %prng_reseed_done_q, %1 : i1
        %18 = comb.and %arg18, %8, %5 : i1
        %19 = comb.and %6, %18 : i1
        %20 = comb.and %arg20, %19 : i1
        %21 = comb.and %19, %3 : i1
        %22 = comb.and %18, %7 : i1
        %23 = comb.or %22, %21, %20 : i1
        %24 = comb.or %22, %21, %20 : i1
        %25 = comb.and %18, %24 : i1
        %26 = comb.mux %25, %c0_i3, %2 : i3
        %27 = comb.and %18, %23 : i1
        %28 = comb.mux %27, %4, %rnd_ctr_q : i4
        fsm.update %cyc_ctr_q, %26 : i3
        fsm.update %rnd_ctr_q, %28 : i4
      }
      fsm.transition @state_9 guard {
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.xor %arg20, %true : i1
        %2 = comb.or %arg20, %arg17 : i1
        %3 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %c9_i5 = hw.constant 9 : i5
        %c-16_i5 = hw.constant -16 : i5
        %4 = comb.mux %arg2, %c9_i5, %c-16_i5 : i5
        %5 = comb.xor %3, %true : i1
        %6 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %7 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %8 = comb.icmp eq %arg4, %c1_i2 : i2
        %9 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %10 = comb.xor %arg3, %true_0 : i1
        %11 = comb.or %10, %8, %9 : i1
        verif.assert %11 : i1
        %12 = comb.icmp eq %arg5, %c1_i3 : i3
        %13 = comb.icmp eq %arg5, %c2_i3 : i3
        %14 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %15 = comb.xor %arg3, %true_1 : i1
        %16 = comb.or %15, %12, %13, %14 : i1
        verif.assert %16 : i1
        %17 = comb.and %arg18, %7, %2 : i1
        %18 = comb.and %3, %17 : i1
        %19 = comb.and %18, %1 : i1
        %20 = comb.and %17, %5 : i1
        %21 = comb.xor %17, %true : i1
        %22 = comb.or %21, %20 : i1
        %23 = comb.extract %4 from 3 : (i5) -> i2
        %24 = comb.extract %4 from 0 : (i5) -> i1
        %25 = comb.concat %23, %24 : i2, i1
        %c3_i3 = hw.constant 3 : i3
        %26 = comb.icmp eq %25, %c3_i3 : i3
        %true_2 = hw.constant true
        %27 = comb.xor %19, %true_2 : i1
        %true_3 = hw.constant true
        %28 = comb.xor %22, %true_3 : i1
        %true_4 = hw.constant true
        %29 = comb.xor %6, %true_4 : i1
        %30 = comb.and %29, %28, %27, %arg20, %18, %26 : i1
        %true_5 = hw.constant true
        verif.assert %true_5 : i1
        fsm.return %30
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-1_i4 = hw.constant -1 : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.or %prng_reseed_done_q, %arg16 : i1
        %2 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %3 = comb.xor %arg20, %true : i1
        %4 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %5 = comb.or %arg20, %arg17 : i1
        %6 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %7 = comb.xor %6, %true : i1
        %8 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %9 = comb.icmp eq %arg4, %c1_i2 : i2
        %10 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %11 = comb.xor %arg3, %true_0 : i1
        %12 = comb.or %11, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.icmp eq %arg5, %c1_i3 : i3
        %14 = comb.icmp eq %arg5, %c2_i3 : i3
        %15 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %16 = comb.xor %arg3, %true_1 : i1
        %17 = comb.or %16, %13, %14, %15 : i1
        verif.assert %17 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %prng_reseed_done_q, %1 : i1
        %18 = comb.and %arg18, %8, %5 : i1
        %19 = comb.and %6, %18 : i1
        %20 = comb.and %arg20, %19 : i1
        %21 = comb.and %19, %3 : i1
        %22 = comb.and %18, %7 : i1
        %23 = comb.or %22, %21, %20 : i1
        %24 = comb.or %22, %21, %20 : i1
        %25 = comb.and %18, %24 : i1
        %26 = comb.mux %25, %c0_i3, %2 : i3
        %27 = comb.and %18, %23 : i1
        %28 = comb.mux %27, %4, %rnd_ctr_q : i4
        fsm.update %cyc_ctr_q, %26 : i3
        fsm.update %rnd_ctr_q, %28 : i4
      }
    }
    fsm.state @state_16 output {
      %c-4_i3 = hw.constant -4 : i3
      %c2_i3 = hw.constant 2 : i3
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c14_i5 = hw.constant 14 : i5
      %true = hw.constant true
      %c1_i3 = hw.constant 1 : i3
      %c-9_i5 = hw.constant -9 : i5
      %c3_i3 = hw.constant 3 : i3
      %c1_i5 = hw.constant 1 : i5
      %c-8_i5 = hw.constant -8 : i5
      %0 = comb.icmp eq %arg4, %c1_i2 : i2
      %1 = comb.icmp eq %arg5, %c1_i3 : i3
      %2 = comb.icmp eq %arg5, %c2_i3 : i3
      %3 = comb.and %2, %0 : i1
      %4 = comb.icmp eq %arg4, %c-2_i2 : i2
      %5 = comb.and %2, %4 : i1
      %6 = comb.icmp eq %arg5, %c-4_i3 : i3
      %7 = comb.and %6, %0 : i1
      %8 = comb.and %6, %4 : i1
      %9 = comb.xor %arg20, %true : i1
      %10 = comb.mux %8, %c14_i5, %c-9_i5 : i5
      %11 = comb.mux %7, %c1_i5, %10 : i5
      %12 = comb.mux %5, %c14_i5, %11 : i5
      %13 = comb.mux %3, %c-8_i5, %12 : i5
      %14 = comb.mux %1, %c14_i5, %13 : i5
      %15 = comb.or %arg11, %arg12, %arg14 : i1
      %16 = comb.xor %15, %true : i1
      %17 = comb.mux %arg20, %c-9_i5, %14 : i5
      %false = hw.constant false
      %false_0 = hw.constant false
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %false_6 = hw.constant false
      %18 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
      %19 = comb.icmp eq %arg4, %c1_i2 : i2
      %20 = comb.icmp eq %arg4, %c-2_i2 : i2
      %true_7 = hw.constant true
      %21 = comb.xor %arg3, %true_7 : i1
      %22 = comb.or %21, %19, %20 : i1
      verif.assert %22 : i1
      %23 = comb.icmp eq %arg5, %c1_i3 : i3
      %24 = comb.icmp eq %arg5, %c2_i3 : i3
      %25 = comb.icmp eq %arg5, %c-4_i3 : i3
      %true_8 = hw.constant true
      %26 = comb.xor %arg3, %true_8 : i1
      %27 = comb.or %26, %23, %24, %25 : i1
      verif.assert %27 : i1
      %true_9 = hw.constant true
      verif.assert %true_9 : i1
      %28 = comb.and %arg17, %18 : i1
      %29 = comb.or %28, %arg20 : i1
      %30 = comb.and %16, %29 : i1
      %31 = comb.xor %29, %true : i1
      %32 = comb.and %30, %arg2 : i1
      %33 = comb.or %31, %32 : i1
      %34 = comb.xor %32, %true : i1
      %35 = comb.and %34, %arg21 : i1
      %36 = comb.and %34, %arg20 : i1
      %37 = comb.and %34, %arg19 : i1
      %38 = comb.and %32, %9 : i1
      fsm.output %false, %30, %false_6, %33, %false_0, %c1_i5, %32, %9, %38, %c1_i5, %c1_i5, %false_1, %c3_i3, %false_2, %false_3, %false_4, %false_5, %rnd_ctr_q, %17, %c3_i3, %37, %36, %35, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.icmp eq %arg4, %c1_i2 : i2
        %1 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true = hw.constant true
        %2 = comb.xor %arg3, %true : i1
        %3 = comb.or %2, %0, %1 : i1
        verif.assert %3 : i1
        %4 = comb.icmp eq %arg5, %c1_i3 : i3
        %5 = comb.icmp eq %arg5, %c2_i3 : i3
        %6 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %4, %5, %6 : i1
        verif.assert %8 : i1
        %9 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %9
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg11, %arg12, %arg14 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %5 = comb.icmp eq %arg4, %c1_i2 : i2
        %6 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %5, %6 : i1
        verif.assert %8 : i1
        %9 = comb.icmp eq %arg5, %c1_i3 : i3
        %10 = comb.icmp eq %arg5, %c2_i3 : i3
        %11 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %12 = comb.xor %arg3, %true_1 : i1
        %13 = comb.or %12, %9, %10, %11 : i1
        verif.assert %13 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %prng_reseed_done_q, %0 : i1
        %14 = comb.and %arg17, %4 : i1
        %15 = comb.or %14, %arg20 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.mux %16, %1, %cyc_ctr_q : i3
        %18 = comb.and %3, %15, %arg2 : i1
        %19 = comb.mux %18, %c0_i3, %17 : i3
        fsm.update %cyc_ctr_q, %19 : i3
      }
      fsm.transition @state_16 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg11, %arg12, %arg14 : i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %4 = comb.icmp eq %arg4, %c1_i2 : i2
        %5 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %6 = comb.xor %arg3, %true_0 : i1
        %7 = comb.or %6, %4, %5 : i1
        verif.assert %7 : i1
        %8 = comb.icmp eq %arg5, %c1_i3 : i3
        %9 = comb.icmp eq %arg5, %c2_i3 : i3
        %10 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg3, %true_1 : i1
        %12 = comb.or %11, %8, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.and %arg17, %3 : i1
        %14 = comb.or %13, %arg20 : i1
        %15 = comb.and %1, %14, %arg2 : i1
        %c9_i5 = hw.constant 9 : i5
        %c-16_i5 = hw.constant -16 : i5
        %16 = comb.mux %15, %c9_i5, %c-16_i5 : i5
        %17 = comb.extract %16 from 3 : (i5) -> i2
        %18 = comb.extract %16 from 0 : (i5) -> i1
        %19 = comb.concat %17, %18 : i2, i1
        %c-4_i3_2 = hw.constant -4 : i3
        %20 = comb.icmp eq %19, %c-4_i3_2 : i3
        %true_3 = hw.constant true
        %21 = comb.xor %2, %true_3 : i1
        %22 = comb.and %21, %20 : i1
        %true_4 = hw.constant true
        verif.assert %true_4 : i1
        fsm.return %22
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg11, %arg12, %arg14 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %5 = comb.icmp eq %arg4, %c1_i2 : i2
        %6 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %5, %6 : i1
        verif.assert %8 : i1
        %9 = comb.icmp eq %arg5, %c1_i3 : i3
        %10 = comb.icmp eq %arg5, %c2_i3 : i3
        %11 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %12 = comb.xor %arg3, %true_1 : i1
        %13 = comb.or %12, %9, %10, %11 : i1
        verif.assert %13 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %prng_reseed_done_q, %0 : i1
        %14 = comb.and %arg17, %4 : i1
        %15 = comb.or %14, %arg20 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.mux %16, %1, %cyc_ctr_q : i3
        %18 = comb.and %3, %15, %arg2 : i1
        %19 = comb.mux %18, %c0_i3, %17 : i3
        fsm.update %cyc_ctr_q, %19 : i3
      }
      fsm.transition @state_9 guard {
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %arg11, %arg12, %arg14 : i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %4 = comb.icmp eq %arg4, %c1_i2 : i2
        %5 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %6 = comb.xor %arg3, %true_0 : i1
        %7 = comb.or %6, %4, %5 : i1
        verif.assert %7 : i1
        %8 = comb.icmp eq %arg5, %c1_i3 : i3
        %9 = comb.icmp eq %arg5, %c2_i3 : i3
        %10 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %11 = comb.xor %arg3, %true_1 : i1
        %12 = comb.or %11, %8, %9, %10 : i1
        verif.assert %12 : i1
        %13 = comb.and %arg17, %3 : i1
        %14 = comb.or %13, %arg20 : i1
        %15 = comb.and %1, %14, %arg2 : i1
        %c9_i5 = hw.constant 9 : i5
        %c-16_i5 = hw.constant -16 : i5
        %16 = comb.mux %15, %c9_i5, %c-16_i5 : i5
        %17 = comb.extract %16 from 3 : (i5) -> i2
        %18 = comb.extract %16 from 0 : (i5) -> i1
        %19 = comb.concat %17, %18 : i2, i1
        %c3_i3 = hw.constant 3 : i3
        %20 = comb.icmp eq %19, %c3_i3 : i3
        %true_2 = hw.constant true
        %21 = comb.xor %2, %true_2 : i1
        %22 = comb.and %21, %20 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %22
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %c2_i3 = hw.constant 2 : i3
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg11, %arg12, %arg14 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %5 = comb.icmp eq %arg4, %c1_i2 : i2
        %6 = comb.icmp eq %arg4, %c-2_i2 : i2
        %true_0 = hw.constant true
        %7 = comb.xor %arg3, %true_0 : i1
        %8 = comb.or %7, %5, %6 : i1
        verif.assert %8 : i1
        %9 = comb.icmp eq %arg5, %c1_i3 : i3
        %10 = comb.icmp eq %arg5, %c2_i3 : i3
        %11 = comb.icmp eq %arg5, %c-4_i3 : i3
        %true_1 = hw.constant true
        %12 = comb.xor %arg3, %true_1 : i1
        %13 = comb.or %12, %9, %10, %11 : i1
        verif.assert %13 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.update %prng_reseed_done_q, %0 : i1
        %14 = comb.and %arg17, %4 : i1
        %15 = comb.or %14, %arg20 : i1
        %16 = comb.xor %15, %true : i1
        %17 = comb.mux %16, %1, %cyc_ctr_q : i3
        %18 = comb.and %3, %15, %arg2 : i1
        %19 = comb.mux %18, %c0_i3, %17 : i3
        fsm.update %cyc_ctr_q, %19 : i3
      }
    }
  }
}

