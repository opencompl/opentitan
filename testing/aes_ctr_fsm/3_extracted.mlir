module {
  fsm.machine @aes_ctr_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i16) -> (i1, i1, i3, i16, i1) attributes {initialState = "state_14"} {
    %ctr_slice_idx_q = fsm.variable "ctr_slice_idx_q" {initValue = 0 : i3} : i3
    %ctr_carry_q = fsm.variable "ctr_carry_q" {initValue = false} : i1
    fsm.state @state_14 output {
      %c0_i15 = hw.constant 0 : i15
      %0 = comb.concat %c0_i15, %ctr_carry_q : i15, i1
      %1 = comb.add %arg5, %0 : i16
      %true = hw.constant true
      %false = hw.constant false
      %false_0 = hw.constant false
      %true_1 = hw.constant true
      verif.assert %true_1 : i1
      fsm.output %true, %false, %ctr_slice_idx_q, %1, %false_0 : i1, i1, i3, i16, i1
    } transitions {
      fsm.transition @state_24 guard {
        %0 = comb.or %arg3, %arg4 : i1
        %true = hw.constant true
        %c-4_i4 = hw.constant -4 : i4
        %c7_i4 = hw.constant 7 : i4
        %1 = comb.mux %arg2, %c-4_i4, %c7_i4 : i4
        %2 = comb.extract %1 from 3 : (i4) -> i1
        %3 = comb.extract %1 from 0 : (i4) -> i2
        %4 = comb.concat %2, %3 : i1, i2
        %c-4_i3 = hw.constant -4 : i3
        %5 = comb.icmp eq %4, %c-4_i3 : i3
        %true_0 = hw.constant true
        %6 = comb.xor %0, %true_0 : i1
        %7 = comb.and %6, %5 : i1
        verif.assert %true : i1
        fsm.return %7
      } action {
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.mux %arg2, %c0_i3, %ctr_slice_idx_q : i3
        %1 = comb.or %arg2, %ctr_carry_q : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %ctr_carry_q, %1 : i1
        fsm.update %ctr_slice_idx_q, %0 : i3
      }
      fsm.transition @state_14 guard {
        %0 = comb.or %arg3, %arg4 : i1
        %true = hw.constant true
        %c-4_i4 = hw.constant -4 : i4
        %c7_i4 = hw.constant 7 : i4
        %1 = comb.mux %arg2, %c-4_i4, %c7_i4 : i4
        %2 = comb.extract %1 from 3 : (i4) -> i1
        %3 = comb.extract %1 from 0 : (i4) -> i2
        %4 = comb.concat %2, %3 : i1, i2
        %c3_i3 = hw.constant 3 : i3
        %5 = comb.icmp eq %4, %c3_i3 : i3
        %true_0 = hw.constant true
        %6 = comb.xor %0, %true_0 : i1
        %7 = comb.and %6, %5 : i1
        verif.assert %true : i1
        fsm.return %7
      } action {
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.mux %arg2, %c0_i3, %ctr_slice_idx_q : i3
        %1 = comb.or %arg2, %ctr_carry_q : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %ctr_carry_q, %1 : i1
        fsm.update %ctr_slice_idx_q, %0 : i3
      }
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %0 = comb.or %arg3, %arg4 : i1
        verif.assert %true : i1
        fsm.return %0
      } action {
        %c0_i3 = hw.constant 0 : i3
        %0 = comb.mux %arg2, %c0_i3, %ctr_slice_idx_q : i3
        %1 = comb.or %arg2, %ctr_carry_q : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %ctr_carry_q, %1 : i1
        fsm.update %ctr_slice_idx_q, %0 : i3
      }
    }
    fsm.state @state_1 output {
      %c0_i15 = hw.constant 0 : i15
      %0 = comb.concat %c0_i15, %ctr_carry_q : i15, i1
      %1 = comb.add %arg5, %0 : i16
      %false = hw.constant false
      %true = hw.constant true
      %false_0 = hw.constant false
      verif.assert %true : i1
      fsm.output %false, %true, %ctr_slice_idx_q, %1, %false_0 : i1, i1, i3, i16, i1
    } transitions {
      fsm.transition @state_1 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %true
      } action {
        fsm.update %ctr_carry_q, %ctr_carry_q : i1
        fsm.update %ctr_slice_idx_q, %ctr_slice_idx_q : i3
        %true = hw.constant true
        verif.assert %true : i1
      }
    }
    fsm.state @state_24 output {
      %c0_i15 = hw.constant 0 : i15
      %0 = comb.concat %c0_i15, %ctr_carry_q : i15, i1
      %1 = comb.add %arg5, %0 : i16
      %false = hw.constant false
      %true = hw.constant true
      %false_0 = hw.constant false
      %true_1 = hw.constant true
      verif.assert %true_1 : i1
      fsm.output %false, %false_0, %ctr_slice_idx_q, %1, %true : i1, i1, i3, i16, i1
    } transitions {
      fsm.transition @state_24 guard {
        %c-1_i3 = hw.constant -1 : i3
        %0 = comb.icmp eq %ctr_slice_idx_q, %c-1_i3 : i3
        %1 = comb.or %arg3, %arg4 : i1
        %c7_i4 = hw.constant 7 : i4
        %c-4_i4 = hw.constant -4 : i4
        %2 = comb.mux %0, %c7_i4, %c-4_i4 : i4
        %3 = comb.extract %2 from 3 : (i4) -> i1
        %4 = comb.extract %2 from 0 : (i4) -> i2
        %5 = comb.concat %3, %4 : i1, i2
        %c-4_i3 = hw.constant -4 : i3
        %6 = comb.icmp eq %5, %c-4_i3 : i3
        %true = hw.constant true
        %7 = comb.xor %1, %true : i1
        %8 = comb.and %7, %6 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %8
      } action {
        %c-1_i3 = hw.constant -1 : i3
        %c0_i16 = hw.constant 0 : i16
        %false = hw.constant false
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.concat %false, %arg5 : i1, i16
        %1 = comb.concat %c0_i16, %ctr_carry_q : i16, i1
        %2 = comb.add %0, %1 : i17
        %3 = comb.mux %arg1, %c1_i3, %c-1_i3 : i3
        %4 = comb.add %ctr_slice_idx_q, %c1_i3 : i3
        %5 = comb.extract %2 from 16 : (i17) -> i1
        %6 = comb.icmp ult %ctr_slice_idx_q, %3 : i3
        %7 = comb.and %6, %5 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %ctr_carry_q, %7 : i1
        fsm.update %ctr_slice_idx_q, %4 : i3
      }
      fsm.transition @state_14 guard {
        %c-1_i3 = hw.constant -1 : i3
        %0 = comb.icmp eq %ctr_slice_idx_q, %c-1_i3 : i3
        %1 = comb.or %arg3, %arg4 : i1
        %c7_i4 = hw.constant 7 : i4
        %c-4_i4 = hw.constant -4 : i4
        %2 = comb.mux %0, %c7_i4, %c-4_i4 : i4
        %3 = comb.extract %2 from 3 : (i4) -> i1
        %4 = comb.extract %2 from 0 : (i4) -> i2
        %5 = comb.concat %3, %4 : i1, i2
        %c3_i3 = hw.constant 3 : i3
        %6 = comb.icmp eq %5, %c3_i3 : i3
        %true = hw.constant true
        %7 = comb.xor %1, %true : i1
        %8 = comb.and %7, %6 : i1
        %true_0 = hw.constant true
        verif.assert %true_0 : i1
        fsm.return %8
      } action {
        %c-1_i3 = hw.constant -1 : i3
        %c0_i16 = hw.constant 0 : i16
        %false = hw.constant false
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.concat %false, %arg5 : i1, i16
        %1 = comb.concat %c0_i16, %ctr_carry_q : i16, i1
        %2 = comb.add %0, %1 : i17
        %3 = comb.mux %arg1, %c1_i3, %c-1_i3 : i3
        %4 = comb.add %ctr_slice_idx_q, %c1_i3 : i3
        %5 = comb.extract %2 from 16 : (i17) -> i1
        %6 = comb.icmp ult %ctr_slice_idx_q, %3 : i3
        %7 = comb.and %6, %5 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %ctr_carry_q, %7 : i1
        fsm.update %ctr_slice_idx_q, %4 : i3
      }
      fsm.transition @state_1 guard {
        %0 = comb.or %arg3, %arg4 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.return %0
      } action {
        %c-1_i3 = hw.constant -1 : i3
        %c0_i16 = hw.constant 0 : i16
        %false = hw.constant false
        %c1_i3 = hw.constant 1 : i3
        %0 = comb.concat %false, %arg5 : i1, i16
        %1 = comb.concat %c0_i16, %ctr_carry_q : i16, i1
        %2 = comb.add %0, %1 : i17
        %3 = comb.mux %arg1, %c1_i3, %c-1_i3 : i3
        %4 = comb.add %ctr_slice_idx_q, %c1_i3 : i3
        %5 = comb.extract %2 from 16 : (i17) -> i1
        %6 = comb.icmp ult %ctr_slice_idx_q, %3 : i3
        %7 = comb.and %6, %5 : i1
        %true = hw.constant true
        verif.assert %true : i1
        fsm.update %ctr_carry_q, %7 : i1
        fsm.update %ctr_slice_idx_q, %4 : i3
      }
    }
  }
}

