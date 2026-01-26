module {
  hw.module @pwrmgr_slow_fsm(in %clk_i : i1, in %rst_ni : i1, in %rst_main_ni : i1, in %wakeup_i : i1, in %reset_req_i : i1, out req_pwrup_o : i1, out pwrup_cause_toggle_o : i1, out pwrup_cause_o : i2, in %ack_pwrup_i : i1, in %req_pwrdn_i : i1, out ack_pwrdn_o : i1, out rst_req_o : i1, out fsm_invalid_o : i1, in %clr_req_i : i1, out usb_ip_clk_en_o : i1, in %usb_ip_clk_status_i : i1, in %main_pd_ni : i1, in %main_clk_en_i : i1, in %io_clk_en_i : i1, in %usb_clk_en_lp_i : i1, in %usb_clk_en_active_i : i1, in %ast_i : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, usb_clk_val: i1, main_pok: i1>, out ast_o : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>) {
    %true = hw.constant true
    %c-503_i10 = hw.constant -503 : i10
    %c332_i10 = hw.constant 332 : i10
    %c-133_i10 = hw.constant -133 : i10
    %c117_i10 = hw.constant 117 : i10
    %c-32_i10 = hw.constant -32 : i10
    %c218_i10 = hw.constant 218 : i10
    %c-324_i10 = hw.constant -324 : i10
    %c401_i10 = hw.constant 401 : i10
    %c1_i2 = hw.constant 1 : i2
    %c-2_i2 = hw.constant -2 : i2
    %c-313_i10 = hw.constant -313 : i10
    %c431_i10 = hw.constant 431 : i10
    %c34_i10 = hw.constant 34 : i10
    %false = hw.constant false
    %c0_i2 = hw.constant 0 : i2
    %0 = hw.struct_create (%pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q, %u_usb_clk_en.q_o) : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>
    %core_clk_val = hw.struct_extract %ast_i["core_clk_val"] : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, usb_clk_val: i1, main_pok: i1>
    %io_clk_val = hw.struct_extract %ast_i["io_clk_val"] : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, usb_clk_val: i1, main_pok: i1>
    %1 = comb.xor %usb_clk_en_active_i, %true : i1
    %usb_clk_val = hw.struct_extract %ast_i["usb_clk_val"] : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, usb_clk_val: i1, main_pok: i1>
    %2 = comb.or %1, %usb_clk_val : i1
    %3 = comb.and %core_clk_val, %io_clk_val, %2 : i1
    %4 = comb.and %main_pd_ni, %main_clk_en_i {sv.namehint = "main_clk_en"} : i1
    %5 = comb.and %main_pd_ni, %io_clk_en_i {sv.namehint = "io_clk_en"} : i1
    %6 = comb.and %main_pd_ni, %usb_clk_en_lp_i : i1
    %7 = comb.xor %core_clk_val, %true : i1
    %8 = comb.or %4, %7 : i1
    %9 = comb.xor %io_clk_val, %true : i1
    %10 = comb.or %5, %9 : i1
    %11 = comb.xor %usb_clk_val, %true : i1
    %12 = comb.or %6, %11 : i1
    %13 = comb.and %8, %10, %12 : i1
    %14 = comb.or %fsm_invalid_q, %144, %4 : i1
    %15 = comb.or %fsm_invalid_q, %144, %5 : i1
    %16 = comb.mux %144, %usb_clk_en_active_i, %6 : i1
    %17 = comb.or %fsm_invalid_q, %16 : i1
    %18 = seq.to_clock %clk_i
    %19 = comb.xor %rst_ni, %true : i1
    %cause_q = seq.firreg %127 clock %18 reset async %19, %c0_i2 : i2
    %cause_toggle_q = seq.firreg %132 clock %18 reset async %19, %false : i1
    %pd_nq = seq.firreg %129 clock %18 reset async %19, %true : i1
    %pwr_clamp_q = seq.firreg %134 clock %18 reset async %19, %true : i1
    %pwr_clamp_env_q = seq.firreg %136 clock %18 reset async %19, %true : i1
    %main_clk_en_q = seq.firreg %14 clock %18 reset async %19, %false : i1
    %io_clk_en_q = seq.firreg %15 clock %18 reset async %19, %false : i1
    %usb_clk_en_q = seq.firreg %17 clock %18 reset async %19, %false : i1
    %req_pwrup_q = seq.firreg %138 clock %18 reset async %19, %false : i1
    %ack_pwrdn_q = seq.firreg %140 clock %18 reset async %19, %false : i1
    %fsm_invalid_q = seq.firreg %142 clock %18 reset async %19, %false : i1
    %u_state_regs.state_o = hw.instance "u_state_regs" @prim_sparse_fsm_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, state_i: %126: i10) -> (state_o: i10)
    %20 = comb.icmp ceq %u_state_regs.state_o, %c34_i10 : i10
    %21 = comb.icmp ceq %u_state_regs.state_o, %c-313_i10 : i10
    %22 = comb.or %wakeup_i, %reset_req_i : i1
    %23 = comb.mux %reset_req_i, %c-2_i2, %c1_i2 : i2
    %24 = comb.icmp ceq %u_state_regs.state_o, %c431_i10 : i10
    %25 = comb.icmp ceq %u_state_regs.state_o, %c401_i10 : i10
    %26 = comb.icmp ceq %u_state_regs.state_o, %c-324_i10 : i10
    %27 = comb.mux %24, %u_main_pok_sync.q_o, %3 : i1
    %28 = comb.mux %24, %c401_i10, %c218_i10 : i10
    %29 = comb.or %24, %pd_nq : i1
    %30 = comb.xor %24, %true : i1
    %31 = comb.icmp ceq %u_state_regs.state_o, %c218_i10 : i10
    %32 = comb.icmp ceq %u_state_regs.state_o, %c-32_i10 : i10
    %33 = comb.mux %31, %req_pwrdn_i, %ack_pwrup_i : i1
    %34 = comb.mux %31, %ack_pwrup_i, %req_pwrdn_i : i1
    %35 = comb.mux %31, %c-32_i10, %c117_i10 : i10
    %36 = comb.xor %31, %true : i1
    %37 = comb.and %36, %req_pwrup_q : i1
    %38 = comb.or %31, %req_pwrup_q : i1
    %39 = comb.xor %33, %true : i1
    %40 = comb.and %34, %39 : i1
    %41 = comb.icmp ceq %u_state_regs.state_o, %c117_i10 : i10
    %42 = comb.xor %req_pwrdn_i, %true : i1
    %43 = comb.icmp ceq %u_state_regs.state_o, %c-133_i10 : i10
    %44 = comb.xor %main_pd_ni, %true : i1
    %45 = comb.icmp ceq %u_state_regs.state_o, %c332_i10 : i10
    %46 = comb.xor %u_main_pok_sync.q_o, %true : i1
    %47 = comb.or %46, %main_pd_ni : i1
    %48 = comb.xor %20, %true : i1
    %49 = comb.xor %21, %true : i1
    %50 = comb.and %49, %48 : i1
    %51 = comb.and %30, %50 : i1
    %52 = comb.xor %25, %true : i1
    %53 = comb.and %52, %51 : i1
    %54 = comb.xor %26, %true : i1
    %55 = comb.and %54, %53 : i1
    %56 = comb.and %36, %55 : i1
    %57 = comb.xor %32, %true : i1
    %58 = comb.and %57, %56 : i1
    %59 = comb.xor %41, %true : i1
    %60 = comb.and %59, %58 : i1
    %61 = comb.xor %43, %true : i1
    %62 = comb.and %61, %60 : i1
    %63 = comb.xor %45, %true : i1
    %64 = comb.icmp cne %u_state_regs.state_o, %c-503_i10 : i10
    %65 = comb.and %63, %62, %64 : i1
    %66 = comb.xor %47, %true : i1
    %67 = comb.or %65, %66 : i1
    %68 = comb.mux %67, %u_state_regs.state_o, %c-313_i10 : i10
    %69 = comb.xor %65, %true : i1
    %70 = comb.and %69, %main_pd_ni : i1
    %71 = comb.or %65, %pwr_clamp_q : i1
    %72 = comb.and %62, %45 : i1
    %73 = comb.mux %72, %c-503_i10, %68 : i10
    %74 = comb.mux %72, %pwr_clamp_env_q, %71 : i1
    %75 = comb.xor %72, %true : i1
    %76 = comb.mux %42, %c-133_i10, %u_state_regs.state_o : i10
    %77 = comb.and %41, %58 : i1
    %78 = comb.mux %77, %76, %73 : i10
    %79 = comb.xor %77, %true : i1
    %80 = comb.mux %40, %35, %u_state_regs.state_o : i10
    %81 = comb.mux %40, %37, %38 : i1
    %82 = comb.and %32, %56 : i1
    %83 = comb.and %31, %55 : i1
    %84 = comb.or %82, %83 : i1
    %85 = comb.mux %84, %80, %78 : i10
    %86 = comb.or %84, %77 : i1
    %87 = comb.mux %86, %pwr_clamp_q, %74 : i1
    %88 = comb.xor %84, %true : i1
    %89 = comb.and %51, %25 : i1
    %90 = comb.mux %89, %c-324_i10, %85 : i10
    %91 = comb.or %89, %84, %77, %72 : i1
    %92 = comb.mux %91, %pd_nq, %70 : i1
    %93 = comb.xor %89, %true : i1
    %94 = comb.and %93, %87 : i1
    %95 = comb.and %93, %86 : i1
    %96 = comb.mux %27, %28, %u_state_regs.state_o : i10
    %97 = comb.xor %27, %true : i1
    %98 = comb.and %26, %53 : i1
    %99 = comb.and %24, %50 : i1
    %100 = comb.or %98, %99 : i1
    %101 = comb.mux %100, %96, %90 : i10
    %102 = comb.mux %100, %29, %92 : i1
    %103 = comb.xor %100, %true : i1
    %104 = comb.mux %100, %30, %95 : i1
    %105 = comb.mux %20, %c431_i10, %101 : i10
    %106 = comb.or %20, %103, %97, %30 : i1
    %107 = comb.and %106, %pwr_clamp_env_q : i1
    %108 = comb.and %43, %60 : i1
    %109 = comb.and %13, %108 : i1
    %110 = comb.mux %109, %c332_i10, %105 : i10
    %111 = comb.mux %109, %44, %107 : i1
    %112 = comb.xor %109, %true : i1
    %113 = comb.xor %13, %true : i1
    %114 = comb.and %108, %113 : i1
    %115 = comb.mux %114, %u_state_regs.state_o, %110 : i10
    %116 = comb.or %114, %109, %48 : i1
    %117 = comb.mux %116, %cause_q, %c0_i2 : i2
    %118 = comb.xor %114, %true : i1
    %119 = comb.and %21, %48 : i1
    %120 = comb.and %22, %119 : i1
    %121 = comb.mux %120, %c431_i10, %115 : i10
    %122 = comb.mux %120, %23, %117 : i2
    %123 = comb.xor %120, %true : i1
    %124 = comb.xor %22, %true : i1
    %125 = comb.and %119, %124 : i1
    %126 = comb.mux %125, %u_state_regs.state_o, %121 : i10
    %127 = comb.mux %125, %cause_q, %122 : i2
    %128 = comb.or %125, %120, %114, %109, %20 : i1
    %129 = comb.mux %128, %pd_nq, %102 : i1
    %130 = comb.xor %125, %true : i1
    %131 = comb.and %130, %120 : i1
    %132 = comb.xor %131, %cause_toggle_q : i1
    %133 = comb.or %125, %120, %114, %109, %20, %100 : i1
    %134 = comb.mux %133, %pwr_clamp_q, %94 : i1
    %135 = comb.or %125, %120, %114 : i1
    %136 = comb.mux %135, %pwr_clamp_env_q, %111 : i1
    %137 = comb.or %125, %120, %114, %109, %20, %100, %89, %88 : i1
    %138 = comb.mux %137, %req_pwrup_q, %81 : i1
    %139 = comb.or %125, %120, %114, %109, %20, %100, %89, %84, %79 : i1
    %140 = comb.mux %139, %ack_pwrdn_q, %req_pwrdn_i : i1
    %141 = comb.and %130, %123, %118, %112, %48, %103, %93, %88, %79, %75, %65 : i1
    %142 = comb.or %141, %fsm_invalid_q : i1
    %143 = comb.and %130, %123, %118, %112, %48, %100, %27, %24 : i1
    %144 = comb.and %130, %123, %118, %112, %48, %104 : i1
    %main_pok = hw.struct_extract %ast_i["main_pok"] : !hw.struct<slow_clk_val: i1, core_clk_val: i1, io_clk_val: i1, usb_clk_val: i1, main_pok: i1>
    %145 = comb.xor %rst_main_ni, %true : i1
    %async_main_pok_st = seq.firreg %main_pok clock %18 reset async %145, %false : i1
    %u_main_pok_sync.q_o = hw.instance "u_main_pok_sync" @prim_flop_2sync(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %async_main_pok_st: i1) -> (q_o: i1)
    %146 = comb.xor %129, %true : i1
    %147 = comb.and %146, %mon_main_pok : i1
    %148 = comb.or %143, %mon_main_pok : i1
    %149 = comb.xor %147, %true : i1
    %150 = comb.and %149, %148 : i1
    %151 = comb.or %147, %143 : i1
    %152 = comb.mux bin %151, %150, %mon_main_pok : i1
    %mon_main_pok = seq.firreg %152 clock %18 reset async %19, %false : i1
    %153 = comb.and %mon_main_pok, %46 : i1
    %154 = comb.or %rst_req_o, %153 : i1
    %155 = comb.xor %clr_req_i, %true : i1
    %156 = comb.and %155, %154 : i1
    %rst_req_o = seq.firreg %156 clock %18 reset async %19, %false : i1
    %157 = comb.or %usb_clk_en_q, %usb_ip_clk_status_i : i1
    %u_usb_clk_en.q_o = hw.instance "u_usb_clk_en" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %157: i1) -> (q_o: i1)
    %158 = comb.xor %153, %true : i1
    verif.clocked_assert %158, posedge %clk_i : i1
    hw.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %usb_clk_en_q, %0 : i1, i1, i2, i1, i1, i1, i1, !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1, usb_clk_en: i1>
  }
  hw.module private @prim_sparse_fsm_flop(in %clk_i : i1, in %rst_ni : i1, in %state_i : i10, out state_o : i10) {
    %u_state_flop.q_o = hw.instance "u_state_flop" @prim_flop_0(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %state_i: i10) -> (q_o: i10) {sv.namehint = "state_raw"}
    hw.output %u_state_flop.q_o : i10
  }
  hw.module private @prim_flop_2sync(in %clk_i : i1, in %rst_ni : i1, in %d_i : i1, out q_o : i1) {
    %u_sync_1.q_o = hw.instance "u_sync_1" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %d_i: i1) -> (q_o: i1) {sv.namehint = "intq"}
    %u_sync_2.q_o = hw.instance "u_sync_2" @prim_flop(clk_i: %clk_i: i1, rst_ni: %rst_ni: i1, d_i: %u_sync_1.q_o: i1) -> (q_o: i1)
    hw.output %u_sync_2.q_o : i1
  }
  hw.module private @prim_flop(in %clk_i : i1, in %rst_ni : i1, in %d_i : i1, out q_o : i1) {
    %true = hw.constant true
    %false = hw.constant false
    %0 = seq.to_clock %clk_i
    %1 = comb.xor %rst_ni, %true : i1
    %q_o = seq.firreg %d_i clock %0 reset async %1, %false : i1
    hw.output %q_o : i1
  }
  hw.module private @prim_flop_0(in %clk_i : i1, in %rst_ni : i1, in %d_i : i10, out q_o : i10) {
    %true = hw.constant true
    %c34_i10 = hw.constant 34 : i10
    %0 = seq.to_clock %clk_i
    %1 = comb.xor %rst_ni, %true : i1
    %q_o = seq.firreg %d_i clock %0 reset async %1, %c34_i10 : i10
    hw.output %q_o : i10
  }
}
