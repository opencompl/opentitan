module {
  %false = hw.constant false
  fsm.machine @mbx_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "state_0"} {
    %false_0 = hw.constant false
    %_sh1 = fsm.variable "_sh1" {initValue = false} : i1
    fsm.state @state_0 output {
      %true = hw.constant true
      %c-3_i3 = hw.constant -3 : i3
      %c0_i3 = hw.constant 0 : i3
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %0 = comb.and %arg1, %arg6 : i1
      %1 = comb.or %arg3, %arg4, %arg2 : i1
      %2 = comb.or %0, %1 : i1
      %3 = comb.xor %1, %true : i1
      %4 = comb.and %arg1, %arg6 : i1
      %5 = comb.xor %arg3, %true : i1
      %6 = comb.mux %5, %arg4, %arg5 : i1
      %7 = comb.mux %5, %c-3_i3, %c0_i3 : i3
      %8 = comb.xor %4, %true : i1
      %9 = comb.or %arg3, %8 : i1
      %10 = comb.xor %arg2, %true : i1
      %11 = comb.and %5, %10 : i1
      %12 = comb.xor %11, %true : i1
      %13 = comb.and %10, %arg3 : i1
      %14 = comb.xor %13, %true : i1
      %15 = comb.and %10, %14, %12 : i1
      %true_4 = hw.constant true
      verif.assert %true_4 : i1
      %16 = comb.extract %7 from 2 : (i3) -> i1
      %17 = comb.extract %7 from 0 : (i3) -> i1
      %18 = comb.concat %16, %17 : i1, i1
      %c-1_i2 = hw.constant -1 : i2
      %19 = comb.icmp eq %18, %c-1_i2 : i2
      %true_5 = hw.constant true
      %20 = comb.xor %13, %true_5 : i1
      %true_6 = hw.constant true
      %21 = comb.xor %arg2, %true_6 : i1
      %22 = comb.and %21, %20, %11, %6, %19 : i1
      %true_7 = hw.constant true
      %23 = comb.xor %9, %true_7 : i1
      %true_8 = hw.constant true
      %24 = comb.xor %6, %true_8 : i1
      %true_9 = hw.constant true
      %25 = comb.xor %13, %true_9 : i1
      %true_10 = hw.constant true
      %26 = comb.xor %arg2, %true_10 : i1
      %27 = comb.and %26, %25, %11, %24, %23 : i1
      fsm.output %arg1, %false_1, %false_2, %false_3, %2, %3, %27, %22, %15 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.mux %0, %arg4, %arg5 : i1
        %2 = comb.xor %arg2, %true : i1
        %3 = comb.and %2, %arg3 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        %true_2 = hw.constant true
        %4 = comb.xor %3, %true_2 : i1
        %true_3 = hw.constant true
        %5 = comb.xor %arg2, %true_3 : i1
        %6 = comb.and %5, %4, %2, %1, %0 : i1
        fsm.return %6
      } action {
        %false_1 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        %true_2 = hw.constant true
        %1 = comb.xor %arg2, %true_2 : i1
        %2 = comb.and %1, %0, %arg3 : i1
        fsm.return %2
      } action {
        %false_1 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_3 guard {
        %true = hw.constant true
        %0 = comb.and %arg1, %arg6 : i1
        %1 = comb.xor %arg3, %true : i1
        %2 = comb.mux %1, %arg4, %arg5 : i1
        %3 = comb.xor %0, %true : i1
        %4 = comb.or %arg3, %3 : i1
        %5 = comb.xor %arg2, %true : i1
        %6 = comb.and %5, %arg3 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        %true_2 = hw.constant true
        %7 = comb.xor %4, %true_2 : i1
        %true_3 = hw.constant true
        %8 = comb.xor %2, %true_3 : i1
        %true_4 = hw.constant true
        %9 = comb.xor %6, %true_4 : i1
        %true_5 = hw.constant true
        %10 = comb.xor %arg2, %true_5 : i1
        %11 = comb.and %10, %9, %1, %5, %8, %7 : i1
        fsm.return %11
      } action {
        %false_1 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.and %arg1, %arg6 : i1
        %1 = comb.xor %arg3, %true : i1
        %2 = comb.mux %1, %arg4, %arg5 : i1
        %3 = comb.xor %0, %true : i1
        %4 = comb.xor %arg2, %true : i1
        %5 = comb.and %1, %4 : i1
        %6 = comb.and %4, %arg3 : i1
        %true_1 = hw.constant true
        verif.assert %true_1 : i1
        %true_2 = hw.constant true
        %7 = comb.xor %2, %true_2 : i1
        %8 = comb.and %7, %3 : i1
        %true_3 = hw.constant true
        %9 = comb.xor %5, %true_3 : i1
        %10 = comb.or %9, %8, %arg3 : i1
        %true_4 = hw.constant true
        %11 = comb.xor %6, %true_4 : i1
        %12 = comb.and %11, %10 : i1
        %13 = comb.or %arg2, %12 : i1
        fsm.return %13
      } action {
        %false_1 = hw.constant false
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %_sh1, %false_1 : i1
      }
    }
    fsm.state @state_3 output {
      %c-4_i3 = hw.constant -4 : i3
      %true = hw.constant true
      %c-3_i3 = hw.constant -3 : i3
      %c0_i3 = hw.constant 0 : i3
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %true_3 = hw.constant true
      %false_4 = hw.constant false
      %false_5 = hw.constant false
      %0 = comb.or %arg3, %arg4, %arg2, %arg5 : i1
      %1 = comb.xor %0, %true : i1
      %2 = comb.xor %arg3, %true : i1
      %3 = comb.xor %arg2, %true : i1
      %4 = comb.and %2, %3 : i1
      %5 = comb.and %4, %arg4 : i1
      %6 = comb.mux %5, %c-3_i3, %c0_i3 : i3
      %7 = comb.xor %5, %true : i1
      %8 = comb.and %3, %arg3 : i1
      %9 = comb.mux %8, %c-4_i3, %6 : i3
      %10 = comb.xor %8, %true : i1
      %11 = comb.xor %arg4, %true : i1
      %12 = comb.and %11, %4 : i1
      %13 = comb.xor %12, %true : i1
      %14 = comb.and %3, %13, %10, %7 : i1
      %15 = comb.xor %_sh1, %true : i1
      verif.assert %15 : i1
      %16 = comb.extract %9 from 2 : (i3) -> i1
      %17 = comb.extract %9 from 0 : (i3) -> i1
      %18 = comb.concat %16, %17 : i1, i1
      %c-1_i2 = hw.constant -1 : i2
      %19 = comb.icmp eq %18, %c-1_i2 : i2
      %true_6 = hw.constant true
      %20 = comb.xor %12, %true_6 : i1
      %true_7 = hw.constant true
      %21 = comb.xor %arg2, %true_7 : i1
      %22 = comb.and %21, %20, %19 : i1
      fsm.output %false_1, %false_2, %true_3, %false_4, %0, %1, %false_5, %22, %14 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.and %0, %1 : i1
        %3 = comb.and %1, %arg3 : i1
        %4 = comb.xor %arg4, %true : i1
        %5 = comb.and %4, %2 : i1
        %6 = comb.xor %_sh1, %true : i1
        verif.assert %6 : i1
        %true_1 = hw.constant true
        %7 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %8 = comb.xor %5, %true_2 : i1
        %true_3 = hw.constant true
        %9 = comb.xor %arg2, %true_3 : i1
        %10 = comb.and %9, %8, %7, %2, %arg4 : i1
        fsm.return %10
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.xor %arg4, %true : i1
        %3 = comb.and %2, %0, %1 : i1
        %4 = comb.xor %_sh1, %true : i1
        verif.assert %4 : i1
        %true_1 = hw.constant true
        %5 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %6 = comb.xor %arg2, %true_2 : i1
        %7 = comb.and %6, %5, %1, %arg3 : i1
        fsm.return %7
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_3 guard {
        %true = hw.constant true
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.xor %arg4, %true : i1
        %3 = comb.xor %_sh1, %true : i1
        verif.assert %3 : i1
        %true_1 = hw.constant true
        %4 = comb.xor %arg5, %true_1 : i1
        %true_2 = hw.constant true
        %5 = comb.xor %arg2, %true_2 : i1
        %6 = comb.and %5, %2, %0, %1, %4 : i1
        fsm.return %6
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg2, %true : i1
        %2 = comb.and %0, %1 : i1
        %3 = comb.and %2, %arg4 : i1
        %4 = comb.and %1, %arg3 : i1
        %5 = comb.xor %arg4, %true : i1
        %6 = comb.and %5, %2 : i1
        %7 = comb.xor %_sh1, %true : i1
        verif.assert %7 : i1
        %true_1 = hw.constant true
        %8 = comb.xor %3, %true_1 : i1
        %true_2 = hw.constant true
        %9 = comb.xor %4, %true_2 : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.mux %6, %arg5, %10 : i1
        %12 = comb.or %arg2, %11 : i1
        fsm.return %12
      } action {
        %true = hw.constant true
        %0 = comb.xor %arg3, %true : i1
        %1 = comb.xor %arg4, %true : i1
        %2 = comb.and %0, %1, %arg5 : i1
        %3 = comb.xor %_sh1, %true : i1
        verif.assert %3 : i1
        fsm.update %_sh1, %2 : i1
      }
    }
    fsm.state @state_4 output {
      %true = hw.constant true
      %c0_i3 = hw.constant 0 : i3
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %false_4 = hw.constant false
      %0 = comb.or %arg3, %arg4, %arg2 : i1
      %1 = comb.xor %0, %true : i1
      %c-2_i2 = hw.constant -2 : i2
      %2 = comb.concat %c-2_i2, %arg4 : i2, i1
      %3 = comb.mux %arg2, %c0_i3, %2 : i3
      %false_5 = hw.constant false
      %4 = comb.xor %_sh1, %true : i1
      verif.assert %4 : i1
      %5 = comb.extract %3 from 2 : (i3) -> i1
      %6 = comb.extract %3 from 0 : (i3) -> i1
      %7 = comb.concat %5, %6 : i1, i1
      %c-1_i2 = hw.constant -1 : i2
      %8 = comb.icmp eq %7, %c-1_i2 : i2
      %false_6 = hw.constant false
      fsm.output %false_1, %false_2, %false_3, %false_4, %0, %1, %false_6, %8, %false_5 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.xor %_sh1, %true : i1
        verif.assert %1 : i1
        %true_1 = hw.constant true
        %2 = comb.xor %arg2, %true_1 : i1
        %3 = comb.and %2, %0, %arg4 : i1
        fsm.return %3
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_4 guard {
        %true = hw.constant true
        %0 = comb.xor %arg2, %true : i1
        %1 = comb.xor %_sh1, %true : i1
        verif.assert %1 : i1
        %true_1 = hw.constant true
        %2 = comb.xor %arg4, %true_1 : i1
        %true_2 = hw.constant true
        %3 = comb.xor %arg2, %true_2 : i1
        %4 = comb.and %3, %0, %2 : i1
        fsm.return %4
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.return %arg2
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
    }
    fsm.state @state_5 output {
      %true = hw.constant true
      %false_1 = hw.constant false
      %false_2 = hw.constant false
      %false_3 = hw.constant false
      %true_4 = hw.constant true
      %false_5 = hw.constant false
      %0 = comb.or %arg3, %arg4, %arg2 : i1
      %1 = comb.xor %0, %true : i1
      %false_6 = hw.constant false
      %2 = comb.xor %_sh1, %true : i1
      verif.assert %2 : i1
      %false_7 = hw.constant false
      fsm.output %false_1, %false_2, %false_3, %true_4, %0, %1, %false_7, %false_5, %false_6 : i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_5 guard {
        %true = hw.constant true
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        %true_1 = hw.constant true
        %1 = comb.xor %arg2, %true_1 : i1
        fsm.return %1
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
      fsm.transition @state_0 guard {
        %true = hw.constant true
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.return %arg2
      } action {
        %true = hw.constant true
        %false_1 = hw.constant false
        %0 = comb.xor %_sh1, %true : i1
        verif.assert %0 : i1
        fsm.update %_sh1, %false_1 : i1
      }
    }
  }
}

