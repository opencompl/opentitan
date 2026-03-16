module {
  fsm.machine @aes_cipher_control_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i2, %arg5: i3, %arg6: i1, %arg7: i1, %arg8: i1, %arg9: i1, %arg10: i1, %arg11: i1, %arg12: i1, %arg13: i1, %arg14: i1, %arg15: i1, %arg16: i1, %arg17: i1, %arg18: i1, %arg19: i1, %arg20: i1, %arg21: i1, %arg22: i1, %arg23: i1) -> (i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1) attributes {initialState = "state_9"} {
    %prng_reseed_done_q = fsm.variable "prng_reseed_done_q" {initValue = false} : i1
    %rnd_ctr_q = fsm.variable "rnd_ctr_q" {initValue = 0 : i4} : i4
    %num_rounds_q = fsm.variable "num_rounds_q" {initValue = 0 : i4} : i4
    %cyc_ctr_q = fsm.variable "cyc_ctr_q" {initValue = 0 : i3} : i3
    fsm.state @state_9 output {
      %c-2_i2 = hw.constant -2 : i2
      %c1_i2 = hw.constant 1 : i2
      %c14_i5 = hw.constant 14 : i5
      %true = hw.constant true
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
      %true_11 = hw.constant true
      verif.assert %true_11 : i1
      fsm.output %19, %false, %40, %false_0, %false_1, %23, %24, %false_3, %false_4, %c-8_i5, %27, %28, %c3_i3, %false_6, %false_7, %false_8, %29, %rnd_ctr_q, %c-9_i5, %c3_i3, %32, %35, %37, %38, %39 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_58 guard {
        %0 = comb.or %arg9, %arg10 : i1
        %c-2_i4 = hw.constant -2 : i4
        %c3_i4 = hw.constant 3 : i4
        %1 = comb.mux %arg10, %c-2_i4, %c3_i4 : i4
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %1 from 2 : (i4) -> i2
        %4 = comb.extract %1 from 0 : (i4) -> i1
        %5 = comb.concat %3, %4 : i2, i1
        %c-2_i3 = hw.constant -2 : i3
        %6 = comb.icmp eq %5, %c-2_i3 : i3
        %true = hw.constant true
        %7 = comb.xor %2, %true : i1
        %8 = comb.and %7, %0, %arg1, %6 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %8
      } action {
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %c0_i3 : i3
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_35 guard {
        %true = hw.constant true
        %0 = comb.or %arg9, %arg10 : i1
        %1 = comb.or %arg7, %arg6 : i1
        %2 = comb.xor %0, %true : i1
        %3 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %4 = comb.and %0, %arg1 : i1
        %true_0 = hw.constant true
        %5 = comb.xor %4, %true_0 : i1
        %true_1 = hw.constant true
        %6 = comb.xor %3, %true_1 : i1
        %7 = comb.and %6, %5, %1, %2, %arg1 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %7
      } action {
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c2_i3 = hw.constant 2 : i3
        %c-6_i4 = hw.constant -6 : i4
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.icmp eq %arg5, %c1_i3 : i3
        %2 = comb.icmp ne %arg5, %c2_i3 : i3
        %3 = comb.concat %c-1_i2, %2, %false : i2, i1, i1
        %4 = comb.mux %1, %c-6_i4, %3 : i4
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %c0_i3 : i3
        fsm.update %num_rounds_q, %4 : i4
        fsm.update %rnd_ctr_q, %c0_i4 : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_23 guard {
        %true = hw.constant true
        %0 = comb.or %arg9, %arg10 : i1
        %1 = comb.or %arg7, %arg6 : i1
        %2 = comb.xor %0, %true : i1
        %3 = comb.and %1, %2, %arg1 : i1
        %4 = comb.and %0, %arg1 : i1
        %true_0 = hw.constant true
        %5 = comb.xor %3, %true_0 : i1
        %true_1 = hw.constant true
        %6 = comb.xor %4, %true_1 : i1
        %7 = comb.and %arg1, %6, %5 : i1
        %8 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15, %7 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %8
      } action {
        %c-1_i2 = hw.constant -1 : i2
        %false = hw.constant false
        %c0_i4 = hw.constant 0 : i4
        %c2_i3 = hw.constant 2 : i3
        %c-6_i4 = hw.constant -6 : i4
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
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.update %cyc_ctr_q, %22 : i3
        fsm.update %num_rounds_q, %17 : i4
        fsm.update %rnd_ctr_q, %20 : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_14 guard {
        %0 = comb.or %arg9, %arg10 : i1
        %c-2_i4 = hw.constant -2 : i4
        %c3_i4 = hw.constant 3 : i4
        %1 = comb.mux %arg10, %c-2_i4, %c3_i4 : i4
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %1 from 2 : (i4) -> i2
        %4 = comb.extract %1 from 0 : (i4) -> i1
        %5 = comb.concat %3, %4 : i2, i1
        %c1_i3 = hw.constant 1 : i3
        %6 = comb.icmp eq %5, %c1_i3 : i3
        %true = hw.constant true
        %7 = comb.xor %2, %true : i1
        %8 = comb.and %7, %0, %arg1, %6 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %8
      } action {
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %c0_i3 : i3
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %0 = comb.xor %arg1, %true : i1
        %1 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true_0 = hw.constant true
        %2 = comb.xor %1, %true_0 : i1
        %3 = comb.and %2, %0 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %3
      } action {
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %c0_i3 : i3
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        fsm.update %prng_reseed_done_q, %0 : i1
      }
    }
    fsm.state @state_14 output {
      %c-4_i3 = hw.constant -4 : i3
      %c14_i5 = hw.constant 14 : i5
      %true = hw.constant true
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
      %true_10 = hw.constant true
      verif.assert %true_10 : i1
      fsm.output %false, %true_0, %false_9, %false_1, %false_2, %c-8_i5, %false_3, %false_4, %false_5, %2, %4, %arg22, %7, %arg22, %false_6, %false_7, %false_8, %rnd_ctr_q, %c-9_i5, %c3_i3, %arg19, %arg20, %arg21, %5, %6 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_14 guard {
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true = hw.constant true
        %1 = comb.xor %arg2, %true : i1
        %true_0 = hw.constant true
        %2 = comb.xor %0, %true_0 : i1
        %3 = comb.and %2, %1 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %3
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_9 guard {
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true = hw.constant true
        %1 = comb.xor %0, %true : i1
        %2 = comb.and %1, %arg2 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %2
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
    }
    fsm.state @state_23 output {
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
      %true_11 = hw.constant true
      verif.assert %true_11 : i1
      fsm.output %false, %false_0, %true, %false_1, %false_2, %c-8_i5, %false_3, %false_4, %false_5, %c-8_i5, %c1_i5, %false_6, %c3_i3, %false_7, %false_8, %false_9, %false_10, %rnd_ctr_q, %c-9_i5, %c3_i3, %arg19, %arg20, %arg21, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %true
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
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
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %18 = comb.and %arg18, %17 : i1
      %19 = comb.and %14, %18 : i1
      %20 = comb.and %18, %14 : i1
      %21 = comb.or %16, %20 : i1
      %22 = comb.xor %21, %true : i1
      %23 = comb.and %21, %19 : i1
      %24 = comb.xor %18, %true : i1
      %25 = comb.and %14, %24 : i1
      %26 = comb.xor %25, %true : i1
      %27 = comb.or %25, %21 : i1
      %28 = comb.mux %27, %c14_i5, %c-8_i5 : i5
      %29 = comb.or %25, %23 : i1
      %true_8 = hw.constant true
      %30 = comb.xor %27, %true_8 : i1
      %31 = comb.or %30, %arg20 : i1
      %32 = comb.mux %31, %c-9_i5, %13 : i5
      %33 = comb.and %26, %21, %15 : i1
      %34 = comb.and %26, %21, %19 : i1
      %35 = comb.and %26, %21, %19 : i1
      %36 = comb.and %26, %22 : i1
      fsm.output %false, %false_0, %36, %false_1, %false_2, %c-8_i5, %33, %false_3, %false_4, %28, %c1_i5, %34, %c3_i3, %false_5, %29, %35, %false_6, %rnd_ctr_q, %32, %c3_i3, %arg19, %arg20, %arg21, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_61 guard {
        %c-4_i3 = hw.constant -4 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg5, %c-4_i3 : i3
        %1 = comb.xor %0, %true : i1
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %4 = comb.and %arg18, %3 : i1
        %5 = comb.and %4, %0 : i1
        %6 = comb.or %1, %5 : i1
        %7 = comb.xor %4, %true : i1
        %8 = comb.and %0, %7 : i1
        %true_0 = hw.constant true
        %9 = comb.xor %8, %true_0 : i1
        %true_1 = hw.constant true
        %10 = comb.xor %2, %true_1 : i1
        %11 = comb.and %10, %9, %6 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %11
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c0_i3 = hw.constant 0 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %true = hw.constant true
        verif.assert %true : i1
        %false = hw.constant false
        fsm.update %cyc_ctr_q, %c0_i3 : i3
        fsm.update %rnd_ctr_q, %0 : i4
        fsm.update %prng_reseed_done_q, %false : i1
      }
      fsm.transition @state_35 guard {
        %c-4_i3 = hw.constant -4 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg5, %c-4_i3 : i3
        %1 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %2 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %3 = comb.and %arg18, %2 : i1
        %4 = comb.xor %3, %true : i1
        %true_0 = hw.constant true
        %5 = comb.xor %1, %true_0 : i1
        %6 = comb.and %5, %0, %4 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %6
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
        verif.assert %true : i1
        %false = hw.constant false
        fsm.update %cyc_ctr_q, %0 : i3
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        fsm.update %prng_reseed_done_q, %false : i1
      }
      fsm.transition @state_23 guard {
        %c-4_i3 = hw.constant -4 : i3
        %true = hw.constant true
        %0 = comb.icmp ne %arg5, %c-4_i3 : i3
        %1 = comb.xor %0, %true : i1
        %2 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %3 = comb.and %arg18, %2 : i1
        %4 = comb.and %3, %0 : i1
        %5 = comb.or %1, %4 : i1
        %6 = comb.xor %3, %true : i1
        %7 = comb.and %0, %6 : i1
        %true_0 = hw.constant true
        %8 = comb.xor %5, %true_0 : i1
        %true_1 = hw.constant true
        %9 = comb.xor %7, %true_1 : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15, %10 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %11
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-4_i3 = hw.constant -4 : i3
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.icmp ne %arg5, %c-4_i3 : i3
        %3 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %4 = comb.xor %2, %true : i1
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %5 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        %6 = comb.and %arg18, %5 : i1
        %7 = comb.and %6, %2 : i1
        %8 = comb.or %4, %7 : i1
        %9 = comb.xor %8, %true : i1
        %10 = comb.xor %6, %true : i1
        %11 = comb.and %2, %10 : i1
        %12 = comb.xor %11, %true : i1
        %13 = comb.xor %8, %true : i1
        %14 = comb.xor %8, %true_0 : i1
        %15 = comb.or %11, %14 : i1
        %16 = comb.or %11, %13 : i1
        %17 = comb.mux %16, %rnd_ctr_q, %3 : i4
        %18 = comb.and %12, %9, %0 : i1
        %19 = comb.xor %15, %true_1 : i1
        %20 = comb.mux %19, %c0_i3, %1 : i3
        fsm.update %cyc_ctr_q, %20 : i3
        fsm.update %rnd_ctr_q, %17 : i4
        fsm.update %prng_reseed_done_q, %18 : i1
      }
    }
    fsm.state @state_58 output {
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
      %true_11 = hw.constant true
      verif.assert %true_11 : i1
      fsm.output %false, %false_0, %false_10, %false_1, %false_2, %c1_i5, %true, %false_3, %false_4, %c-8_i5, %c1_i5, %false_5, %c3_i3, %false_6, %false_7, %false_8, %false_9, %rnd_ctr_q, %c-9_i5, %c3_i3, %arg19, %arg20, %arg21, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %cyc_ctr_q, %1 : i3
        fsm.update %prng_reseed_done_q, %0 : i1
      }
      fsm.transition @state_14 guard {
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true = hw.constant true
        %1 = comb.xor %0, %true : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %1
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %true = hw.constant true
        verif.assert %true : i1
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
      %true_3 = hw.constant true
      verif.assert %true_3 : i1
      %22 = comb.and %arg18, %21, %17 : i1
      %23 = comb.and %18, %22 : i1
      %24 = comb.and %arg20, %23 : i1
      %25 = comb.xor %24, %true : i1
      %26 = comb.and %23, %11 : i1
      %27 = comb.xor %26, %true : i1
      %28 = comb.and %22, %20 : i1
      %29 = comb.xor %28, %true : i1
      %30 = comb.or %28, %26, %24 : i1
      %31 = comb.or %28, %26, %24 : i1
      %32 = comb.or %28, %26, %24 : i1
      %33 = comb.or %28, %26, %24 : i1
      %34 = comb.xor %22, %true : i1
      %35 = comb.or %34, %28, %26, %24 : i1
      %36 = comb.or %34, %33 : i1
      %37 = comb.and %22, %29, %27, %25 : i1
      %38 = comb.or %37, %arg20 : i1
      %39 = comb.mux %38, %c-9_i5, %16 : i5
      %40 = comb.and %22, %29, %27, %25 : i1
      %41 = comb.or %34, %28, %26 : i1
      %true_4 = hw.constant true
      %42 = comb.xor %24, %true_4 : i1
      %43 = comb.or %41, %42 : i1
      %44 = comb.mux %43, %arg20, %19 : i1
      %true_5 = hw.constant true
      %45 = comb.xor %24, %true_5 : i1
      %46 = comb.or %41, %45, %19 : i1
      %47 = comb.and %46, %arg21 : i1
      %48 = comb.and %29, %27, %24 : i1
      %49 = comb.and %22, %30, %11 : i1
      %50 = comb.and %35, %11 : i1
      %51 = comb.and %22, %31, %11 : i1
      %52 = comb.and %22, %32 : i1
      %53 = comb.and %29, %27, %24 : i1
      %54 = comb.and %22, %33 : i1
      %55 = comb.or %40, %1, %2 : i1
      %56 = comb.mux %55, %c3_i3, %c-4_i3 : i3
      %57 = comb.and %22, %29, %27, %25 : i1
      fsm.output %false, %48, %57, %false_0, %false_1, %c-8_i5, %49, %50, %51, %c-8_i5, %c1_i5, %52, %c3_i3, %53, %36, %54, %false_2, %rnd_ctr_q, %39, %56, %arg19, %44, %47, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_61 guard {
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.or %arg20, %arg17 : i1
        %2 = comb.icmp ult %rnd_ctr_q, %0 : i4
        %3 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %5 = comb.and %arg18, %4, %1 : i1
        %6 = comb.and %5, %2 : i1
        %7 = comb.xor %5, %true : i1
        %8 = comb.or %7, %6 : i1
        %true_0 = hw.constant true
        %9 = comb.xor %3, %true_0 : i1
        %10 = comb.and %9, %8 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %10
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-1_i4 = hw.constant -1 : i4
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
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %8 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %prng_reseed_done_q, %1 : i1
        %9 = comb.and %arg18, %8, %5 : i1
        %10 = comb.and %6, %9 : i1
        %11 = comb.and %arg20, %10 : i1
        %12 = comb.and %10, %3 : i1
        %13 = comb.and %9, %7 : i1
        %14 = comb.or %13, %12, %11 : i1
        %15 = comb.or %13, %12, %11 : i1
        %16 = comb.xor %9, %true : i1
        %17 = comb.xor %15, %true_0 : i1
        %18 = comb.or %16, %17 : i1
        %19 = comb.and %9, %14 : i1
        %20 = comb.xor %19, %true_1 : i1
        %21 = comb.mux %20, %rnd_ctr_q, %4 : i4
        %22 = comb.xor %18, %true_2 : i1
        %23 = comb.mux %22, %c0_i3, %2 : i3
        fsm.update %cyc_ctr_q, %23 : i3
        fsm.update %rnd_ctr_q, %21 : i4
      }
      fsm.transition @state_23 guard {
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
        %0 = comb.add %num_rounds_q, %c-1_i4 : i4
        %1 = comb.xor %arg20, %true : i1
        %2 = comb.or %arg20, %arg17 : i1
        %3 = comb.icmp uge %rnd_ctr_q, %0 : i4
        %4 = comb.xor %3, %true : i1
        %5 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %6 = comb.and %arg18, %5, %2 : i1
        %7 = comb.and %3, %6 : i1
        %8 = comb.and %arg20, %7 : i1
        %9 = comb.and %7, %1 : i1
        %10 = comb.and %6, %4 : i1
        %11 = comb.xor %6, %true : i1
        %12 = comb.or %11, %10 : i1
        %true_0 = hw.constant true
        %13 = comb.xor %8, %true_0 : i1
        %true_1 = hw.constant true
        %14 = comb.xor %9, %true_1 : i1
        %true_2 = hw.constant true
        %15 = comb.xor %12, %true_2 : i1
        %16 = comb.and %15, %14, %13 : i1
        %17 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15, %16 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %17
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-1_i4 = hw.constant -1 : i4
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
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %8 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %prng_reseed_done_q, %1 : i1
        %9 = comb.and %arg18, %8, %5 : i1
        %10 = comb.and %6, %9 : i1
        %11 = comb.and %arg20, %10 : i1
        %12 = comb.and %10, %3 : i1
        %13 = comb.and %9, %7 : i1
        %14 = comb.or %13, %12, %11 : i1
        %15 = comb.or %13, %12, %11 : i1
        %16 = comb.xor %9, %true : i1
        %17 = comb.xor %15, %true_0 : i1
        %18 = comb.or %16, %17 : i1
        %19 = comb.and %9, %14 : i1
        %20 = comb.xor %19, %true_1 : i1
        %21 = comb.mux %20, %rnd_ctr_q, %4 : i4
        %22 = comb.xor %18, %true_2 : i1
        %23 = comb.mux %22, %c0_i3, %2 : i3
        fsm.update %cyc_ctr_q, %23 : i3
        fsm.update %rnd_ctr_q, %21 : i4
      }
      fsm.transition @state_16 guard {
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
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
        %8 = comb.and %arg18, %7, %2 : i1
        %9 = comb.and %3, %8 : i1
        %10 = comb.and %9, %1 : i1
        %11 = comb.and %8, %5 : i1
        %12 = comb.xor %8, %true : i1
        %13 = comb.or %12, %11 : i1
        %14 = comb.extract %4 from 3 : (i5) -> i2
        %15 = comb.extract %4 from 0 : (i5) -> i1
        %16 = comb.concat %14, %15 : i2, i1
        %c-4_i3 = hw.constant -4 : i3
        %17 = comb.icmp eq %16, %c-4_i3 : i3
        %18 = comb.and %arg20, %9, %17 : i1
        %19 = comb.or %10, %18 : i1
        %true_0 = hw.constant true
        %20 = comb.xor %13, %true_0 : i1
        %true_1 = hw.constant true
        %21 = comb.xor %6, %true_1 : i1
        %22 = comb.and %21, %20, %19 : i1
        %true_2 = hw.constant true
        verif.assert %true_2 : i1
        fsm.return %22
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c-1_i4 = hw.constant -1 : i4
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
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %true_2 = hw.constant true
        %8 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %prng_reseed_done_q, %1 : i1
        %9 = comb.and %arg18, %8, %5 : i1
        %10 = comb.and %6, %9 : i1
        %11 = comb.and %arg20, %10 : i1
        %12 = comb.and %10, %3 : i1
        %13 = comb.and %9, %7 : i1
        %14 = comb.or %13, %12, %11 : i1
        %15 = comb.or %13, %12, %11 : i1
        %16 = comb.xor %9, %true : i1
        %17 = comb.xor %15, %true_0 : i1
        %18 = comb.or %16, %17 : i1
        %19 = comb.and %9, %14 : i1
        %20 = comb.xor %19, %true_1 : i1
        %21 = comb.mux %20, %rnd_ctr_q, %4 : i4
        %22 = comb.xor %18, %true_2 : i1
        %23 = comb.mux %22, %c0_i3, %2 : i3
        fsm.update %cyc_ctr_q, %23 : i3
        fsm.update %rnd_ctr_q, %21 : i4
      }
      fsm.transition @state_9 guard {
        %c-1_i4 = hw.constant -1 : i4
        %true = hw.constant true
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
        %8 = comb.and %arg18, %7, %2 : i1
        %9 = comb.and %3, %8 : i1
        %10 = comb.and %9, %1 : i1
        %11 = comb.and %8, %5 : i1
        %12 = comb.xor %8, %true : i1
        %13 = comb.or %12, %11 : i1
        %14 = comb.extract %4 from 3 : (i5) -> i2
        %15 = comb.extract %4 from 0 : (i5) -> i1
        %16 = comb.concat %14, %15 : i2, i1
        %c3_i3 = hw.constant 3 : i3
        %17 = comb.icmp eq %16, %c3_i3 : i3
        %true_0 = hw.constant true
        %18 = comb.xor %10, %true_0 : i1
        %true_1 = hw.constant true
        %19 = comb.xor %13, %true_1 : i1
        %true_2 = hw.constant true
        %20 = comb.xor %6, %true_2 : i1
        %21 = comb.and %20, %19, %18, %arg20, %9, %17 : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.return %21
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        %c0_i3 = hw.constant 0 : i3
        %c1_i4 = hw.constant 1 : i4
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %rnd_ctr_q, %c1_i4 : i4
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %prng_reseed_done_q, %0 : i1
        fsm.update %cyc_ctr_q, %c0_i3 : i3
        fsm.update %rnd_ctr_q, %1 : i4
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
      %true_7 = hw.constant true
      verif.assert %true_7 : i1
      %19 = comb.and %arg17, %18 : i1
      %20 = comb.or %19, %arg20 : i1
      %21 = comb.and %16, %20 : i1
      %22 = comb.xor %20, %true : i1
      %23 = comb.and %21, %arg2 : i1
      %24 = comb.or %22, %23 : i1
      %25 = comb.xor %23, %true : i1
      %26 = comb.and %25, %arg21 : i1
      %27 = comb.and %25, %arg20 : i1
      %28 = comb.and %25, %arg19 : i1
      %29 = comb.and %23, %9 : i1
      fsm.output %false, %21, %false_6, %24, %false_0, %c1_i5, %23, %9, %29, %c1_i5, %c1_i5, %false_1, %c3_i3, %false_2, %false_3, %false_4, %false_5, %rnd_ctr_q, %17, %c3_i3, %28, %27, %26, %arg22, %arg23 : i1, i1, i1, i1, i1, i5, i1, i1, i1, i5, i5, i1, i3, i1, i1, i1, i1, i4, i5, i3, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_23 guard {
        %0 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg11, %arg12, %arg14 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %prng_reseed_done_q, %0 : i1
        %5 = comb.and %arg17, %4 : i1
        %6 = comb.or %5, %arg20 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.mux %7, %1, %cyc_ctr_q : i3
        %9 = comb.and %3, %6, %arg2 : i1
        %10 = comb.mux %9, %c0_i3, %8 : i3
        fsm.update %cyc_ctr_q, %10 : i3
      }
      fsm.transition @state_16 guard {
        %true = hw.constant true
        %0 = comb.or %arg11, %arg12, %arg14 : i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %4 = comb.and %arg17, %3 : i1
        %5 = comb.or %4, %arg20 : i1
        %6 = comb.and %1, %5, %arg2 : i1
        %c9_i5 = hw.constant 9 : i5
        %c-16_i5 = hw.constant -16 : i5
        %7 = comb.mux %6, %c9_i5, %c-16_i5 : i5
        %8 = comb.extract %7 from 3 : (i5) -> i2
        %9 = comb.extract %7 from 0 : (i5) -> i1
        %10 = comb.concat %8, %9 : i2, i1
        %c-4_i3 = hw.constant -4 : i3
        %11 = comb.icmp eq %10, %c-4_i3 : i3
        %true_0 = hw.constant true
        %12 = comb.xor %2, %true_0 : i1
        %13 = comb.and %12, %11 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %13
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg11, %arg12, %arg14 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %prng_reseed_done_q, %0 : i1
        %5 = comb.and %arg17, %4 : i1
        %6 = comb.or %5, %arg20 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.mux %7, %1, %cyc_ctr_q : i3
        %9 = comb.and %3, %6, %arg2 : i1
        %10 = comb.mux %9, %c0_i3, %8 : i3
        fsm.update %cyc_ctr_q, %10 : i3
      }
      fsm.transition @state_9 guard {
        %true = hw.constant true
        %0 = comb.or %arg11, %arg12, %arg14 : i1
        %1 = comb.xor %0, %true : i1
        %2 = comb.or %arg11, %arg12, %arg13, %arg14, %arg15 : i1
        %3 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %4 = comb.and %arg17, %3 : i1
        %5 = comb.or %4, %arg20 : i1
        %6 = comb.and %1, %5, %arg2 : i1
        %c9_i5 = hw.constant 9 : i5
        %c-16_i5 = hw.constant -16 : i5
        %7 = comb.mux %6, %c9_i5, %c-16_i5 : i5
        %8 = comb.extract %7 from 3 : (i5) -> i2
        %9 = comb.extract %7 from 0 : (i5) -> i1
        %10 = comb.concat %8, %9 : i2, i1
        %c3_i3 = hw.constant 3 : i3
        %11 = comb.icmp eq %10, %c3_i3 : i3
        %true_0 = hw.constant true
        %12 = comb.xor %2, %true_0 : i1
        %13 = comb.and %12, %11 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        fsm.return %13
      } action {
        fsm.update %num_rounds_q, %num_rounds_q : i4
        fsm.update %rnd_ctr_q, %rnd_ctr_q : i4
        %true = hw.constant true
        %c0_i3 = hw.constant 0 : i3
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.or %prng_reseed_done_q, %arg16 : i1
        %1 = comb.add %cyc_ctr_q, %c1_i3 : i3
        %2 = comb.or %arg11, %arg12, %arg14 : i1
        %3 = comb.xor %2, %true : i1
        %4 = comb.extract %cyc_ctr_q from 2 : (i3) -> i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.update %prng_reseed_done_q, %0 : i1
        %5 = comb.and %arg17, %4 : i1
        %6 = comb.or %5, %arg20 : i1
        %7 = comb.xor %6, %true : i1
        %8 = comb.mux %7, %1, %cyc_ctr_q : i3
        %9 = comb.and %3, %6, %arg2 : i1
        %10 = comb.mux %9, %c0_i3, %8 : i3
        fsm.update %cyc_ctr_q, %10 : i3
      }
    }
  }
}

