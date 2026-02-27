module {
  fsm.machine @pwrmgr_slow_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i1, %arg9: i1, %arg10: i1, %arg11: i1, %arg12: i1, %arg13: i1) -> (i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "state_0"} {
    %pd_nq = fsm.variable "pd_nq" {initValue = true} : i1
    %pwr_clamp_q = fsm.variable "pwr_clamp_q" {initValue = true} : i1
    %main_clk_en_q = fsm.variable "main_clk_en_q" {initValue = false} : i1
    %io_clk_en_q = fsm.variable "io_clk_en_q" {initValue = false} : i1
    %fsm_invalid_q = fsm.variable "fsm_invalid_q" {initValue = false} : i1
    %async_main_pok_st = fsm.variable "async_main_pok_st" {initValue = false} : i1
    %u_main_pok_sync2Fu_sync_12Fq_o = fsm.variable "u_main_pok_sync/u_sync_1/q_o" {initValue = false} : i1
    %u_main_pok_sync2Fu_sync_22Fq_o = fsm.variable "u_main_pok_sync/u_sync_2/q_o" {initValue = false} : i1
    %mon_main_pok = fsm.variable "mon_main_pok" {initValue = false} : i1
    %rst_req_o = fsm.variable "rst_req_o" {initValue = false} : i1
    fsm.state @state_0 output {
      %c0_i2 = hw.constant 0 : i2
      %false = hw.constant false
      %true = hw.constant true
      %0 = hw.struct_create (%pd_nq, %true, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q) : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1>
      %main_pd_n, %pwr_clamp_env, %pwr_clamp, %slow_clk_en, %core_clk_en, %io_clk_en = hw.struct_explode %0 : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1>
      %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %2 = comb.and %mon_main_pok, %1 : i1
      %3 = comb.xor %2, %true : i1
      verif.assert %3 : i1
      fsm.output %false, %false, %c0_i2, %false, %rst_req_o, %fsm_invalid_q, %main_pd_n, %pwr_clamp_env, %pwr_clamp, %slow_clk_en, %core_clk_en, %io_clk_en : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_34 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.and %mon_main_pok, %0 : i1
        %2 = comb.xor %1, %true : i1
        verif.assert %2 : i1
        fsm.return %true_0
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        %false = hw.constant false
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %5 = comb.and %mon_main_pok, %4 : i1
        %6 = comb.or %rst_req_o, %5 : i1
        %7 = comb.xor %arg6, %true : i1
        %8 = comb.and %7, %6 : i1
        %9 = comb.xor %5, %true : i1
        verif.assert %9 : i1
        fsm.update %rst_req_o, %8 : i1
        fsm.update %mon_main_pok, %false : i1
        fsm.update %fsm_invalid_q, %true : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %pwr_clamp_q, %true : i1
        fsm.update %pd_nq, %false : i1
      }
    }
    fsm.state @state_34 output {
      %c0_i2 = hw.constant 0 : i2
      %false = hw.constant false
      %true = hw.constant true
      %0 = hw.struct_create (%pd_nq, %true, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q) : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1>
      %main_pd_n, %pwr_clamp_env, %pwr_clamp, %slow_clk_en, %core_clk_en, %io_clk_en = hw.struct_explode %0 : !hw.struct<main_pd_n: i1, pwr_clamp_env: i1, pwr_clamp: i1, slow_clk_en: i1, core_clk_en: i1, io_clk_en: i1>
      %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %2 = comb.and %mon_main_pok, %1 : i1
      %3 = comb.xor %2, %true : i1
      verif.assert %3 : i1
      fsm.output %false, %false, %c0_i2, %false, %rst_req_o, %fsm_invalid_q, %main_pd_n, %pwr_clamp_env, %pwr_clamp, %slow_clk_en, %core_clk_en, %io_clk_en : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_34 guard {
        %true = hw.constant true
        %true_0 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.and %mon_main_pok, %0 : i1
        %2 = comb.xor %1, %true : i1
        verif.assert %2 : i1
        fsm.return %true_0
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        %false = hw.constant false
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %5 = comb.and %mon_main_pok, %4 : i1
        %6 = comb.or %rst_req_o, %5 : i1
        %7 = comb.xor %arg6, %true : i1
        %8 = comb.and %7, %6 : i1
        %9 = comb.xor %5, %true : i1
        verif.assert %9 : i1
        fsm.update %rst_req_o, %8 : i1
        fsm.update %mon_main_pok, %false : i1
        fsm.update %fsm_invalid_q, %true : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %pwr_clamp_q, %true : i1
        fsm.update %pd_nq, %false : i1
      }
    }
  }
}

