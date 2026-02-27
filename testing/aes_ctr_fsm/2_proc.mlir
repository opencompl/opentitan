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
    %5 = comb.icmp eq %u_state_regs2Fu_state_flop2Fq_o, %c14_i5 : i5
    %6 = comb.icmp eq %u_state_regs2Fu_state_flop2Fq_o, %c-8_i5 : i5
    %7 = comb.add %ctr_slice_idx_q, %c1_i3 : i3
    %8 = comb.extract %2 from 16 : (i17) -> i1
    %9 = comb.icmp ult %ctr_slice_idx_q, %4 : i3
    %10 = comb.and %9, %8 : i1
    %11 = comb.icmp eq %ctr_slice_idx_q, %c-1_i3 : i3
    %12 = comb.icmp eq %u_state_regs2Fu_state_flop2Fq_o, %c1_i5 : i5
    %13 = comb.mux %12, %u_state_regs2Fu_state_flop2Fq_o, %c1_i5 : i5
    %14 = comb.mux %11, %c14_i5, %u_state_regs2Fu_state_flop2Fq_o : i5
    %15 = comb.xor %5, %true : i1
    %16 = comb.and %6, %15 : i1
    %17 = comb.xor %16, %true : i1
    %18 = comb.mux %16, %7, %ctr_slice_idx_q : i3
    %19 = comb.mux %16, %10, %ctr_carry_q : i1
    %20 = comb.mux %16, %14, %13 : i5
    %21 = comb.mux %incr_i, %c0_i3, %ctr_slice_idx_q : i3
    %22 = comb.or %incr_i, %ctr_carry_q : i1
    %23 = comb.mux %incr_i, %c-8_i5, %u_state_regs2Fu_state_flop2Fq_o : i5
    %24 = comb.and %15, %17 : i1
    %25 = comb.mux %5, %21, %18 : i3
    %26 = comb.mux %5, %22, %19 : i1
    %27 = comb.mux %5, %23, %20 : i5
    %28 = comb.or %sp_enc_err_i, %mr_err_i : i1
    %29 = comb.mux %28, %c1_i5, %27 : i5
    %30 = seq.to_clock %clk_i
    %31 = comb.xor %rst_ni, %true : i1
    %ctr_slice_idx_q = seq.compreg %25, %30 reset %31, %c0_i3 : i3  
    %ctr_carry_q = seq.compreg %26, %30 reset %31, %false : i1  
    %32 = seq.to_clock %clk_i
    %33 = comb.xor %rst_ni, %true : i1
    %u_state_regs2Fu_state_flop2Fq_o = seq.compreg name "u_state_regs/u_state_flop/q_o" %29, %32 reset %33, %c14_i5 : i5  
    %34 = comb.xor %24, %true : i1
    %35 = comb.icmp eq %u_state_regs2Fu_state_flop2Fq_o, %c14_i5 : i5
    %36 = comb.icmp eq %u_state_regs2Fu_state_flop2Fq_o, %c-8_i5 : i5
    %37 = comb.or %35, %36 : i1
    %true_0 = hw.constant true
    %38 = comb.or %24, %37 : i1
    %39 = builtin.unrealized_conversion_cast %38 : i1 to !ltl.property
    verif.assert %38 : i1
    hw.output %5, %24, %ctr_slice_idx_q, %3, %16 : i1, i1, i3, i16, i1
  }
}

