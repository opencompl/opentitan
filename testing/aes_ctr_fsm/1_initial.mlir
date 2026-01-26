module {
  hw.module @aes_ctr_fsm(in %clk_i : i1, in %rst_ni : i1, in %inc32_i : i1, in %incr_i : i1, out ready_o : i1, in %sp_enc_err_i : i1, in %mr_err_i : i1, out alert_o : i1, out ctr_slice_idx_o : i3, in %ctr_slice_i : i16, out ctr_slice_o : i16, out ctr_we_o : i1) {
    %c-1_i3 = hw.constant -1 : i3
    %c0_i16 = hw.constant 0 : i16
    %c1_i5 = hw.constant 1 : i5
    %c-8_i5 = hw.constant -8 : i5
    %c0_i3 = hw.constant 0 : i3
    %true = hw.constant true
    %c14_i5 = hw.constant 14 : i5
    %false = hw.constant false
    %c1_i3 = hw.constant 1 : i3
    %0 = comb.concat %false, %ctr_slice_i : i1, i16
    %1 = comb.concat %c0_i16, %ctr_carry_q : i16, i1
    %2 = comb.add %0, %1 : i17
    %3 = comb.extract %2 from 0 : (i17) -> i16
    %4 = comb.mux %inc32_i, %c1_i3, %c-1_i3 : i3
    %5 = comb.icmp ceq %u_state_regs.state_o, %c14_i5 : i5
    %6 = comb.icmp ceq %u_state_regs.state_o, %c-8_i5 : i5
    %7 = comb.add %ctr_slice_idx_q, %c1_i3 : i3
    %8 = comb.extract %2 from 16 : (i17) -> i1
    %9 = comb.icmp ult %ctr_slice_idx_q, %4 : i3
    %10 = comb.and %9, %8 : i1
    %11 = comb.icmp eq %ctr_slice_idx_q, %c-1_i3 : i3
    %12 = comb.icmp ceq %u_state_regs.state_o, %c1_i5 : i5
    %13 = comb.mux %12, %u_state_regs.state_o, %c1_i5 : i5
    %14 = comb.mux %11, %c14_i5, %u_state_regs.state_o : i5
    %15 = comb.xor %5, %true : i1
    %16 = comb.and %6, %15 : i1
    %17 = comb.xor %16, %true : i1
    %18 = comb.mux %16, %7, %ctr_slice_idx_q : i3
    %19 = comb.mux %16, %10, %ctr_carry_q : i1
    %20 = comb.mux %16, %14, %13 : i5
    %21 = comb.mux %incr_i, %c0_i3, %ctr_slice_idx_q : i3
    %22 = comb.or %incr_i, %ctr_carry_q : i1
    %23 = comb.mux %incr_i, %c-8_i5, %u_state_regs.state_o : i5
    %24 = comb.and %15, %17 : i1
    %25 = comb.mux %5, %21, %18 : i3
    %26 = comb.mux %5, %22, %19 : i1
    %27 = comb.mux %5, %23, %20 : i5
    %28 = comb.or %sp_enc_err_i, %mr_err_i : i1
    %29 = comb.mux %28, %c1_i5, %27 : i5
    %30 = seq.to_clock %clk_i
    %31 = comb.xor %rst_ni, %true : i1
    %ctr_slice_idx_q = seq.firreg %25 clock %30 reset async %31, %c0_i3 : i3
    %ctr_carry_q = seq.firreg %26 clock %30 reset async %31, %false : i1
    %u_state_regs.state_o = hw.instance "u_state_regs" @prim_sparse_fsm_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, state_i: %29: i5) -> (state_o: i5)
    %32 = comb.xor %24, %true : i1
    %33 = comb.icmp weq %u_state_regs.state_o, %c14_i5 : i5
    %34 = comb.icmp weq %u_state_regs.state_o, %c-8_i5 : i5
    %35 = comb.or %33, %34 : i1
    %36 = ltl.implication %32, %35 : i1, i1
    verif.clocked_assert %36, posedge %clk_i : !ltl.property
    hw.output %5, %24, %ctr_slice_idx_q, %3, %16 : i1, i1, i3, i16, i1
  }
  hw.module private @prim_sparse_fsm_flop(in %clk_i : i1, in %rst_ni : i1, in %state_i : i5, out state_o : i5) {
    %u_state_flop.q_o = hw.instance "u_state_flop" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %state_i: i5) -> (q_o: i5) {sv.namehint = "state_raw"}
    hw.output %u_state_flop.q_o : i5
  }
  hw.module private @prim_flop(in %clk_i : i1, in %rst_ni : i1, in %d_i : i5, out q_o : i5) {
    %true = hw.constant true
    %c14_i5 = hw.constant 14 : i5
    %0 = seq.to_clock %clk_i
    %1 = comb.xor %rst_ni, %true : i1
    %q_o = seq.firreg %d_i clock %0 reset async %1, %c14_i5 : i5
    hw.output %q_o : i5
  }
}
