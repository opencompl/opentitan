module {
  fsm.machine @pwrmgr_slow_fsm(%arg0: i1, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i1, %arg9: i1, %arg10: i1, %arg11: i1, %arg12: i1, %arg13: i1) -> (i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1) attributes {initialState = "state_34"} {
    %cause_q = fsm.variable "cause_q" {initValue = 0 : i2} : i2
    %cause_toggle_q = fsm.variable "cause_toggle_q" {initValue = false} : i1
    %pd_nq = fsm.variable "pd_nq" {initValue = true} : i1
    %pwr_clamp_q = fsm.variable "pwr_clamp_q" {initValue = true} : i1
    %pwr_clamp_env_q = fsm.variable "pwr_clamp_env_q" {initValue = true} : i1
    %main_clk_en_q = fsm.variable "main_clk_en_q" {initValue = false} : i1
    %io_clk_en_q = fsm.variable "io_clk_en_q" {initValue = false} : i1
    %req_pwrup_q = fsm.variable "req_pwrup_q" {initValue = false} : i1
    %ack_pwrdn_q = fsm.variable "ack_pwrdn_q" {initValue = false} : i1
    %fsm_invalid_q = fsm.variable "fsm_invalid_q" {initValue = false} : i1
    %async_main_pok_st = fsm.variable "async_main_pok_st" {initValue = false} : i1
    %u_main_pok_sync2Fu_sync_12Fq_o = fsm.variable "u_main_pok_sync/u_sync_1/q_o" {initValue = false} : i1
    %u_main_pok_sync2Fu_sync_22Fq_o = fsm.variable "u_main_pok_sync/u_sync_2/q_o" {initValue = false} : i1
    %mon_main_pok = fsm.variable "mon_main_pok" {initValue = false} : i1
    %rst_req_o = fsm.variable "rst_req_o" {initValue = false} : i1
    fsm.state @state_34 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_431 guard {
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
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        %c0_i2 = hw.constant 0 : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %5 = comb.xor %pd_nq, %true : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        %8 = comb.xor %6, %true_0 : i1
        %9 = comb.or %8, %7 : i1
        %10 = comb.and %9, %mon_main_pok : i1
        %11 = comb.and %mon_main_pok, %4 : i1
        %12 = comb.or %rst_req_o, %11 : i1
        %13 = comb.xor %arg6, %true : i1
        %14 = comb.and %13, %12 : i1
        %15 = comb.xor %11, %true : i1
        verif.assert %15 : i1
        fsm.update %rst_req_o, %14 : i1
        fsm.update %mon_main_pok, %10 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %cause_q, %c0_i2 : i2
      }
    }
    fsm.state @state_431 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_431 guard {
        %true = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.and %mon_main_pok, %0 : i1
        %2 = comb.xor %1, %true : i1
        verif.assert %2 : i1
        %true_0 = hw.constant true
        %3 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true_0 : i1
        fsm.return %3
      } action {
        %false = hw.constant false
        fsm.update %false, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %true_0 = hw.constant true
        %4 = comb.or %rst_req_o, %mon_main_pok : i1
        %5 = comb.xor %arg6, %true : i1
        %6 = comb.and %5, %4 : i1
        %7 = comb.xor %mon_main_pok, %true : i1
        verif.assert %7 : i1
        fsm.update %rst_req_o, %6 : i1
        fsm.update %mon_main_pok, %mon_main_pok : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pd_nq, %true_0 : i1
      }
      fsm.transition @state_401 guard {
        %true = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.and %mon_main_pok, %0 : i1
        %2 = comb.xor %1, %true : i1
        verif.assert %2 : i1
        fsm.return %u_main_pok_sync2Fu_sync_22Fq_o
      } action {
        %true = hw.constant true
        fsm.update %true, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true_0 = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %true_1 = hw.constant true
        %false = hw.constant false
        %true_2 = hw.constant true
        %4 = comb.xor %arg6, %true_0 : i1
        %5 = comb.and %4, %rst_req_o : i1
        %true_3 = hw.constant true
        verif.assert %true_3 : i1
        fsm.update %rst_req_o, %5 : i1
        fsm.update %mon_main_pok, %true_2 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %pwr_clamp_env_q, %false : i1
        fsm.update %pd_nq, %true_1 : i1
      }
    }
    fsm.state @state_401 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_700 guard {
        %true = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.and %mon_main_pok, %0 : i1
        %2 = comb.xor %1, %true : i1
        verif.assert %2 : i1
        %true_0 = hw.constant true
        fsm.return %true_0
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %false = hw.constant false
        %5 = comb.xor %pd_nq, %true : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        %8 = comb.xor %6, %true_0 : i1
        %9 = comb.or %8, %7 : i1
        %10 = comb.and %9, %mon_main_pok : i1
        %11 = comb.and %mon_main_pok, %4 : i1
        %12 = comb.or %rst_req_o, %11 : i1
        %13 = comb.xor %arg6, %true : i1
        %14 = comb.and %13, %12 : i1
        %15 = comb.xor %11, %true : i1
        verif.assert %15 : i1
        fsm.update %rst_req_o, %14 : i1
        fsm.update %mon_main_pok, %10 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %pwr_clamp_q, %false : i1
      }
    }
    fsm.state @state_700 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_700 guard {
        %true = hw.constant true
        %0 = comb.and %arg11, %arg12 : i1
        %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %c109_i9 = hw.constant 109 : i9
        %c-162_i9 = hw.constant -162 : i9
        %2 = comb.mux %0, %c109_i9, %c-162_i9 : i9
        %3 = comb.and %mon_main_pok, %1 : i1
        %4 = comb.xor %3, %true : i1
        verif.assert %4 : i1
        %5 = comb.extract %2 from 4 : (i9) -> i2
        %6 = comb.extract %2 from 8 : (i9) -> i1
        %7 = comb.extract %2 from 0 : (i9) -> i2
        %8 = comb.concat %6, %5, %7 : i1, i2, i2
        %c-10_i5 = hw.constant -10 : i5
        %9 = comb.icmp eq %8, %c-10_i5 : i5
        fsm.return %9
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.xor %pd_nq, %true : i1
        %2 = comb.and %1, %mon_main_pok : i1
        %3 = comb.xor %2, %true : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.or %4, %3 : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.and %mon_main_pok, %0 : i1
        %8 = comb.or %rst_req_o, %7 : i1
        %9 = comb.xor %arg6, %true : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.xor %7, %true : i1
        verif.assert %11 : i1
        fsm.update %rst_req_o, %10 : i1
        fsm.update %mon_main_pok, %6 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
      fsm.transition @state_218 guard {
        %true = hw.constant true
        %0 = comb.and %arg11, %arg12 : i1
        %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %c109_i9 = hw.constant 109 : i9
        %c-162_i9 = hw.constant -162 : i9
        %2 = comb.mux %0, %c109_i9, %c-162_i9 : i9
        %3 = comb.and %mon_main_pok, %1 : i1
        %4 = comb.xor %3, %true : i1
        verif.assert %4 : i1
        %5 = comb.extract %2 from 4 : (i9) -> i2
        %6 = comb.extract %2 from 8 : (i9) -> i1
        %7 = comb.extract %2 from 0 : (i9) -> i2
        %8 = comb.concat %6, %5, %7 : i1, i2, i2
        %c9_i5 = hw.constant 9 : i5
        %9 = comb.icmp eq %8, %c9_i5 : i5
        fsm.return %9
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.xor %pd_nq, %true : i1
        %2 = comb.and %1, %mon_main_pok : i1
        %3 = comb.xor %2, %true : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.or %4, %3 : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.and %mon_main_pok, %0 : i1
        %8 = comb.or %rst_req_o, %7 : i1
        %9 = comb.xor %arg6, %true : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.xor %7, %true : i1
        verif.assert %11 : i1
        fsm.update %rst_req_o, %10 : i1
        fsm.update %mon_main_pok, %6 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
    }
    fsm.state @state_218 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_992 guard {
        %true = hw.constant true
        %0 = comb.xor %arg5, %true : i1
        %1 = comb.and %arg4, %0 : i1
        %2 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %c-16_i9 = hw.constant -16 : i9
        %c109_i9 = hw.constant 109 : i9
        %3 = comb.mux %1, %c-16_i9, %c109_i9 : i9
        %4 = comb.and %mon_main_pok, %2 : i1
        %5 = comb.xor %4, %true : i1
        verif.assert %5 : i1
        %6 = comb.extract %3 from 7 : (i9) -> i2
        %7 = comb.extract %3 from 2 : (i9) -> i3
        %8 = comb.extract %3 from 0 : (i9) -> i1
        %9 = comb.concat %6, %7, %8 : i2, i3, i1
        %c-8_i6 = hw.constant -8 : i6
        %10 = comb.icmp eq %9, %c-8_i6 : i6
        fsm.return %10
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %arg5, %true : i1
        %1 = comb.and %arg4, %0 : i1
        %2 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %true_2 = hw.constant true
        %3 = comb.xor %1, %true_2 : i1
        %4 = comb.xor %pd_nq, %true : i1
        %5 = comb.and %4, %mon_main_pok : i1
        %6 = comb.xor %5, %true : i1
        %true_3 = hw.constant true
        %7 = comb.xor %5, %true_3 : i1
        %8 = comb.or %7, %6 : i1
        %9 = comb.and %8, %mon_main_pok : i1
        %10 = comb.and %mon_main_pok, %2 : i1
        %11 = comb.or %rst_req_o, %10 : i1
        %12 = comb.xor %arg6, %true : i1
        %13 = comb.and %12, %11 : i1
        %14 = comb.xor %10, %true : i1
        verif.assert %14 : i1
        fsm.update %rst_req_o, %13 : i1
        fsm.update %mon_main_pok, %9 : i1
        fsm.update %req_pwrup_q, %3 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
      fsm.transition @state_218 guard {
        %true = hw.constant true
        %0 = comb.xor %arg5, %true : i1
        %1 = comb.and %arg4, %0 : i1
        %2 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %c-16_i9 = hw.constant -16 : i9
        %c109_i9 = hw.constant 109 : i9
        %3 = comb.mux %1, %c-16_i9, %c109_i9 : i9
        %4 = comb.and %mon_main_pok, %2 : i1
        %5 = comb.xor %4, %true : i1
        verif.assert %5 : i1
        %6 = comb.extract %3 from 7 : (i9) -> i2
        %7 = comb.extract %3 from 2 : (i9) -> i3
        %8 = comb.extract %3 from 0 : (i9) -> i1
        %9 = comb.concat %6, %7, %8 : i2, i3, i1
        %c7_i6 = hw.constant 7 : i6
        %10 = comb.icmp eq %9, %c7_i6 : i6
        fsm.return %10
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %arg5, %true : i1
        %1 = comb.and %arg4, %0 : i1
        %2 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %true_2 = hw.constant true
        %3 = comb.xor %1, %true_2 : i1
        %4 = comb.xor %pd_nq, %true : i1
        %5 = comb.and %4, %mon_main_pok : i1
        %6 = comb.xor %5, %true : i1
        %true_3 = hw.constant true
        %7 = comb.xor %5, %true_3 : i1
        %8 = comb.or %7, %6 : i1
        %9 = comb.and %8, %mon_main_pok : i1
        %10 = comb.and %mon_main_pok, %2 : i1
        %11 = comb.or %rst_req_o, %10 : i1
        %12 = comb.xor %arg6, %true : i1
        %13 = comb.and %12, %11 : i1
        %14 = comb.xor %10, %true : i1
        verif.assert %14 : i1
        fsm.update %rst_req_o, %13 : i1
        fsm.update %mon_main_pok, %9 : i1
        fsm.update %req_pwrup_q, %3 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
    }
    fsm.state @state_992 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_992 guard {
        %c117_i10 = hw.constant 117 : i10
        %true = hw.constant true
        %c-32_i10 = hw.constant -32 : i10
        %0 = comb.xor %arg4, %true : i1
        %1 = comb.and %arg5, %0 : i1
        %2 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %3 = comb.mux %1, %c117_i10, %c-32_i10 : i10
        %4 = comb.and %mon_main_pok, %2 : i1
        %5 = comb.xor %4, %true : i1
        verif.assert %5 : i1
        %6 = comb.extract %3 from 7 : (i10) -> i3
        %7 = comb.extract %3 from 4 : (i10) -> i1
        %8 = comb.extract %3 from 2 : (i10) -> i1
        %9 = comb.extract %3 from 0 : (i10) -> i1
        %10 = comb.concat %6, %7, %8, %9 : i3, i1, i1, i1
        %c-8_i6 = hw.constant -8 : i6
        %11 = comb.icmp eq %10, %c-8_i6 : i6
        fsm.return %11
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.xor %pd_nq, %true : i1
        %2 = comb.and %1, %mon_main_pok : i1
        %3 = comb.xor %2, %true : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.or %4, %3 : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.and %mon_main_pok, %0 : i1
        %8 = comb.or %rst_req_o, %7 : i1
        %9 = comb.xor %arg6, %true : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.xor %7, %true : i1
        verif.assert %11 : i1
        fsm.update %rst_req_o, %10 : i1
        fsm.update %mon_main_pok, %6 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
      fsm.transition @state_117 guard {
        %c117_i10 = hw.constant 117 : i10
        %true = hw.constant true
        %c-32_i10 = hw.constant -32 : i10
        %0 = comb.xor %arg4, %true : i1
        %1 = comb.and %arg5, %0 : i1
        %2 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %3 = comb.mux %1, %c117_i10, %c-32_i10 : i10
        %4 = comb.and %mon_main_pok, %2 : i1
        %5 = comb.xor %4, %true : i1
        verif.assert %5 : i1
        %6 = comb.extract %3 from 7 : (i10) -> i3
        %7 = comb.extract %3 from 4 : (i10) -> i1
        %8 = comb.extract %3 from 2 : (i10) -> i1
        %9 = comb.extract %3 from 0 : (i10) -> i1
        %10 = comb.concat %6, %7, %8, %9 : i3, i1, i1, i1
        %c7_i6 = hw.constant 7 : i6
        %11 = comb.icmp eq %10, %c7_i6 : i6
        fsm.return %11
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.xor %pd_nq, %true : i1
        %2 = comb.and %1, %mon_main_pok : i1
        %3 = comb.xor %2, %true : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.or %4, %3 : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.and %mon_main_pok, %0 : i1
        %8 = comb.or %rst_req_o, %7 : i1
        %9 = comb.xor %arg6, %true : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.xor %7, %true : i1
        verif.assert %11 : i1
        fsm.update %rst_req_o, %10 : i1
        fsm.update %mon_main_pok, %6 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
    }
    fsm.state @state_117 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_891 guard {
        %true = hw.constant true
        %0 = comb.xor %arg5, %true : i1
        %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %c-67_i9 = hw.constant -67 : i9
        %c58_i9 = hw.constant 58 : i9
        %2 = comb.mux %0, %c-67_i9, %c58_i9 : i9
        %3 = comb.and %mon_main_pok, %1 : i1
        %4 = comb.xor %3, %true : i1
        verif.assert %4 : i1
        %5 = comb.extract %2 from 7 : (i9) -> i2
        %6 = comb.extract %2 from 0 : (i9) -> i3
        %7 = comb.concat %5, %6 : i2, i3
        %c-3_i5 = hw.constant -3 : i5
        %8 = comb.icmp eq %7, %c-3_i5 : i5
        fsm.return %8
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %arg5 : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.xor %pd_nq, %true : i1
        %2 = comb.and %1, %mon_main_pok : i1
        %3 = comb.xor %2, %true : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.or %4, %3 : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.and %mon_main_pok, %0 : i1
        %8 = comb.or %rst_req_o, %7 : i1
        %9 = comb.xor %arg6, %true : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.xor %7, %true : i1
        verif.assert %11 : i1
        fsm.update %rst_req_o, %10 : i1
        fsm.update %mon_main_pok, %6 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
      fsm.transition @state_117 guard {
        %true = hw.constant true
        %0 = comb.xor %arg5, %true : i1
        %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %c-67_i9 = hw.constant -67 : i9
        %c58_i9 = hw.constant 58 : i9
        %2 = comb.mux %0, %c-67_i9, %c58_i9 : i9
        %3 = comb.and %mon_main_pok, %1 : i1
        %4 = comb.xor %3, %true : i1
        verif.assert %4 : i1
        %5 = comb.extract %2 from 7 : (i9) -> i2
        %6 = comb.extract %2 from 0 : (i9) -> i3
        %7 = comb.concat %5, %6 : i2, i3
        %c2_i5 = hw.constant 2 : i5
        %8 = comb.icmp eq %7, %c2_i5 : i5
        fsm.return %8
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %arg5 : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %true_0 = hw.constant true
        %true_1 = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.xor %pd_nq, %true : i1
        %2 = comb.and %1, %mon_main_pok : i1
        %3 = comb.xor %2, %true : i1
        %true_2 = hw.constant true
        %4 = comb.xor %2, %true_2 : i1
        %5 = comb.or %4, %3 : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.and %mon_main_pok, %0 : i1
        %8 = comb.or %rst_req_o, %7 : i1
        %9 = comb.xor %arg6, %true : i1
        %10 = comb.and %9, %8 : i1
        %11 = comb.xor %7, %true : i1
        verif.assert %11 : i1
        fsm.update %rst_req_o, %10 : i1
        fsm.update %mon_main_pok, %6 : i1
        fsm.update %io_clk_en_q, %true_1 : i1
        fsm.update %main_clk_en_q, %true_0 : i1
      }
    }
    fsm.state @state_891 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_891 guard {
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.xor %arg11, %true : i1
        %3 = comb.or %0, %2 : i1
        %4 = comb.xor %arg12, %true : i1
        %5 = comb.or %1, %4 : i1
        %6 = comb.and %3, %5 : i1
        %7 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %8 = comb.or %7, %arg7 : i1
        %9 = comb.xor %8, %true : i1
        %c-34_i7 = hw.constant -34 : i7
        %c49_i7 = hw.constant 49 : i7
        %10 = comb.mux %9, %c-34_i7, %c49_i7 : i7
        %11 = comb.xor %6, %true : i1
        %12 = comb.and %mon_main_pok, %7 : i1
        %13 = comb.xor %12, %true : i1
        verif.assert %13 : i1
        %14 = comb.extract %10 from 5 : (i7) -> i2
        %15 = comb.extract %10 from 0 : (i7) -> i4
        %16 = comb.concat %14, %15 : i2, i4
        %c-18_i6 = hw.constant -18 : i6
        %17 = comb.icmp eq %16, %c-18_i6 : i6
        %true_0 = hw.constant true
        %18 = comb.xor %6, %true_0 : i1
        %19 = comb.and %18, %17 : i1
        %20 = comb.or %11, %19 : i1
        fsm.return %20
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.xor %arg11, %true : i1
        %3 = comb.or %0, %2 : i1
        %4 = comb.xor %arg12, %true : i1
        %5 = comb.or %1, %4 : i1
        %6 = comb.and %3, %5 : i1
        %7 = comb.or %fsm_invalid_q, %0 : i1
        %8 = comb.or %fsm_invalid_q, %1 : i1
        %9 = comb.xor %arg7, %true : i1
        %10 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %11 = comb.mux %6, %9, %pwr_clamp_env_q : i1
        %12 = comb.xor %pd_nq, %true : i1
        %13 = comb.and %12, %mon_main_pok : i1
        %14 = comb.xor %13, %true : i1
        %true_0 = hw.constant true
        %15 = comb.xor %13, %true_0 : i1
        %16 = comb.or %15, %14 : i1
        %17 = comb.and %16, %mon_main_pok : i1
        %18 = comb.and %mon_main_pok, %10 : i1
        %19 = comb.or %rst_req_o, %18 : i1
        %20 = comb.xor %arg6, %true : i1
        %21 = comb.and %20, %19 : i1
        %22 = comb.xor %18, %true : i1
        verif.assert %22 : i1
        fsm.update %rst_req_o, %21 : i1
        fsm.update %mon_main_pok, %17 : i1
        fsm.update %io_clk_en_q, %8 : i1
        fsm.update %main_clk_en_q, %7 : i1
        fsm.update %pwr_clamp_env_q, %11 : i1
      }
      fsm.transition @state_711 guard {
        %true = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.and %mon_main_pok, %0 : i1
        %2 = comb.xor %1, %true : i1
        verif.assert %2 : i1
        %false = hw.constant false
        fsm.return %false
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.xor %arg11, %true : i1
        %3 = comb.or %0, %2 : i1
        %4 = comb.xor %arg12, %true : i1
        %5 = comb.or %1, %4 : i1
        %6 = comb.and %3, %5 : i1
        %7 = comb.or %fsm_invalid_q, %0 : i1
        %8 = comb.or %fsm_invalid_q, %1 : i1
        %9 = comb.xor %arg7, %true : i1
        %10 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %11 = comb.mux %6, %9, %pwr_clamp_env_q : i1
        %12 = comb.xor %pd_nq, %true : i1
        %13 = comb.and %12, %mon_main_pok : i1
        %14 = comb.xor %13, %true : i1
        %true_0 = hw.constant true
        %15 = comb.xor %13, %true_0 : i1
        %16 = comb.or %15, %14 : i1
        %17 = comb.and %16, %mon_main_pok : i1
        %18 = comb.and %mon_main_pok, %10 : i1
        %19 = comb.or %rst_req_o, %18 : i1
        %20 = comb.xor %arg6, %true : i1
        %21 = comb.and %20, %19 : i1
        %22 = comb.xor %18, %true : i1
        verif.assert %22 : i1
        fsm.update %rst_req_o, %21 : i1
        fsm.update %mon_main_pok, %17 : i1
        fsm.update %io_clk_en_q, %8 : i1
        fsm.update %main_clk_en_q, %7 : i1
        fsm.update %pwr_clamp_env_q, %11 : i1
      }
      fsm.transition @state_332 guard {
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.xor %arg11, %true : i1
        %3 = comb.or %0, %2 : i1
        %4 = comb.xor %arg12, %true : i1
        %5 = comb.or %1, %4 : i1
        %6 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %7 = comb.and %mon_main_pok, %6 : i1
        %8 = comb.xor %7, %true : i1
        verif.assert %8 : i1
        %9 = comb.and %3, %5 : i1
        fsm.return %9
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %arg7, %true : i1
        %5 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %6 = comb.xor %pd_nq, %true : i1
        %7 = comb.and %6, %mon_main_pok : i1
        %8 = comb.xor %7, %true : i1
        %true_0 = hw.constant true
        %9 = comb.xor %7, %true_0 : i1
        %10 = comb.or %9, %8 : i1
        %11 = comb.and %10, %mon_main_pok : i1
        %12 = comb.and %mon_main_pok, %5 : i1
        %13 = comb.or %rst_req_o, %12 : i1
        %14 = comb.xor %arg6, %true : i1
        %15 = comb.and %14, %13 : i1
        %16 = comb.xor %12, %true : i1
        verif.assert %16 : i1
        fsm.update %rst_req_o, %15 : i1
        fsm.update %mon_main_pok, %11 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %pwr_clamp_env_q, %4 : i1
      }
    }
    fsm.state @state_332 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_521 guard {
        %true = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.and %mon_main_pok, %0 : i1
        %2 = comb.xor %1, %true : i1
        verif.assert %2 : i1
        %true_0 = hw.constant true
        fsm.return %true_0
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_env_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %5 = comb.xor %pd_nq, %true : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        %8 = comb.xor %6, %true_0 : i1
        %9 = comb.or %8, %7 : i1
        %10 = comb.and %9, %mon_main_pok : i1
        %11 = comb.and %mon_main_pok, %4 : i1
        %12 = comb.or %rst_req_o, %11 : i1
        %13 = comb.xor %arg6, %true : i1
        %14 = comb.and %13, %12 : i1
        %15 = comb.xor %11, %true : i1
        verif.assert %15 : i1
        fsm.update %rst_req_o, %14 : i1
        fsm.update %mon_main_pok, %10 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
      }
    }
    fsm.state @state_711 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_711 guard {
        %true = hw.constant true
        %0 = comb.or %arg2, %arg3 : i1
        %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %2 = comb.xor %0, %true : i1
        %3 = comb.and %mon_main_pok, %1 : i1
        %4 = comb.xor %3, %true : i1
        verif.assert %4 : i1
        %true_0 = hw.constant true
        %5 = comb.xor %0, %true_0 : i1
        %6 = comb.or %2, %5 : i1
        fsm.return %6
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.or %arg2, %arg3 : i1
        %5 = comb.mux %arg3, %c-2_i2, %c1_i2 : i2
        %6 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %7 = comb.mux %4, %5, %cause_q : i2
        %8 = comb.xor %4, %cause_toggle_q : i1
        %9 = comb.xor %pd_nq, %true : i1
        %10 = comb.and %9, %mon_main_pok : i1
        %11 = comb.xor %10, %true : i1
        %true_0 = hw.constant true
        %12 = comb.xor %10, %true_0 : i1
        %13 = comb.or %12, %11 : i1
        %14 = comb.and %13, %mon_main_pok : i1
        %15 = comb.and %mon_main_pok, %6 : i1
        %16 = comb.or %rst_req_o, %15 : i1
        %17 = comb.xor %arg6, %true : i1
        %18 = comb.and %17, %16 : i1
        %19 = comb.xor %15, %true : i1
        verif.assert %19 : i1
        fsm.update %rst_req_o, %18 : i1
        fsm.update %mon_main_pok, %14 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %cause_toggle_q, %8 : i1
        fsm.update %cause_q, %7 : i2
      }
      fsm.transition @state_431 guard {
        %true = hw.constant true
        %0 = comb.or %arg2, %arg3 : i1
        %1 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %2 = comb.and %mon_main_pok, %1 : i1
        %3 = comb.xor %2, %true : i1
        verif.assert %3 : i1
        fsm.return %0
      } action {
        %true = hw.constant true
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %pd_nq : i1
        %c-2_i2 = hw.constant -2 : i2
        %c1_i2 = hw.constant 1 : i2
        %true_0 = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.mux %arg3, %c-2_i2, %c1_i2 : i2
        %5 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true_0 : i1
        %6 = comb.xor %cause_toggle_q, %true : i1
        %7 = comb.xor %pd_nq, %true_0 : i1
        %8 = comb.and %7, %mon_main_pok : i1
        %9 = comb.xor %8, %true_0 : i1
        %true_1 = hw.constant true
        %10 = comb.xor %8, %true_1 : i1
        %11 = comb.or %10, %9 : i1
        %12 = comb.and %11, %mon_main_pok : i1
        %13 = comb.and %mon_main_pok, %5 : i1
        %14 = comb.or %rst_req_o, %13 : i1
        %15 = comb.xor %arg6, %true_0 : i1
        %16 = comb.and %15, %14 : i1
        %17 = comb.xor %13, %true_0 : i1
        verif.assert %17 : i1
        fsm.update %rst_req_o, %16 : i1
        fsm.update %mon_main_pok, %12 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
        fsm.update %cause_toggle_q, %6 : i1
        fsm.update %cause_q, %4 : i2
      }
    }
    fsm.state @state_521 output {
      %true = hw.constant true
      %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
      %1 = comb.and %mon_main_pok, %0 : i1
      %2 = comb.xor %1, %true : i1
      verif.assert %2 : i1
      fsm.output %req_pwrup_q, %cause_toggle_q, %cause_q, %ack_pwrdn_q, %rst_req_o, %fsm_invalid_q, %pd_nq, %pwr_clamp_env_q, %pwr_clamp_q, %true, %main_clk_en_q, %io_clk_en_q : i1, i1, i2, i1, i1, i1, i1, i1, i1, i1, i1, i1
    } transitions {
      fsm.transition @state_711 guard {
        %true = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.or %0, %arg7 : i1
        %2 = comb.xor %1, %true : i1
        %c4_i7 = hw.constant 4 : i7
        %c-29_i7 = hw.constant -29 : i7
        %3 = comb.mux %2, %c4_i7, %c-29_i7 : i7
        %4 = comb.and %mon_main_pok, %0 : i1
        %5 = comb.xor %4, %true : i1
        verif.assert %5 : i1
        %6 = comb.extract %3 from 5 : (i7) -> i2
        %7 = comb.extract %3 from 0 : (i7) -> i3
        %8 = comb.concat %6, %7 : i2, i3
        %c-5_i5 = hw.constant -5 : i5
        %9 = comb.icmp eq %8, %c-5_i5 : i5
        fsm.return %9
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %arg7 : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %5 = comb.xor %arg7, %true : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        %8 = comb.xor %6, %true_0 : i1
        %9 = comb.or %8, %7 : i1
        %10 = comb.and %9, %mon_main_pok : i1
        %11 = comb.and %mon_main_pok, %4 : i1
        %12 = comb.or %rst_req_o, %11 : i1
        %13 = comb.xor %arg6, %true : i1
        %14 = comb.and %13, %12 : i1
        %15 = comb.xor %11, %true : i1
        verif.assert %15 : i1
        fsm.update %rst_req_o, %14 : i1
        fsm.update %mon_main_pok, %10 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
      }
      fsm.transition @state_521 guard {
        %true = hw.constant true
        %0 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %1 = comb.or %0, %arg7 : i1
        %2 = comb.xor %1, %true : i1
        %c4_i7 = hw.constant 4 : i7
        %c-29_i7 = hw.constant -29 : i7
        %3 = comb.mux %2, %c4_i7, %c-29_i7 : i7
        %4 = comb.and %mon_main_pok, %0 : i1
        %5 = comb.xor %4, %true : i1
        verif.assert %5 : i1
        %6 = comb.extract %3 from 5 : (i7) -> i2
        %7 = comb.extract %3 from 0 : (i7) -> i3
        %8 = comb.concat %6, %7 : i2, i3
        %c4_i5 = hw.constant 4 : i5
        %9 = comb.icmp eq %8, %c4_i5 : i5
        fsm.return %9
      } action {
        fsm.update %u_main_pok_sync2Fu_sync_22Fq_o, %u_main_pok_sync2Fu_sync_12Fq_o : i1
        fsm.update %u_main_pok_sync2Fu_sync_12Fq_o, %async_main_pok_st : i1
        fsm.update %async_main_pok_st, %arg13 : i1
        fsm.update %fsm_invalid_q, %fsm_invalid_q : i1
        fsm.update %ack_pwrdn_q, %ack_pwrdn_q : i1
        fsm.update %req_pwrup_q, %req_pwrup_q : i1
        fsm.update %pwr_clamp_env_q, %pwr_clamp_env_q : i1
        fsm.update %pwr_clamp_q, %pwr_clamp_q : i1
        fsm.update %pd_nq, %arg7 : i1
        fsm.update %cause_toggle_q, %cause_toggle_q : i1
        fsm.update %cause_q, %cause_q : i2
        %true = hw.constant true
        %0 = comb.and %arg7, %arg8 : i1
        %1 = comb.and %arg7, %arg9 : i1
        %2 = comb.or %fsm_invalid_q, %0 : i1
        %3 = comb.or %fsm_invalid_q, %1 : i1
        %4 = comb.xor %u_main_pok_sync2Fu_sync_22Fq_o, %true : i1
        %5 = comb.xor %arg7, %true : i1
        %6 = comb.and %5, %mon_main_pok : i1
        %7 = comb.xor %6, %true : i1
        %true_0 = hw.constant true
        %8 = comb.xor %6, %true_0 : i1
        %9 = comb.or %8, %7 : i1
        %10 = comb.and %9, %mon_main_pok : i1
        %11 = comb.and %mon_main_pok, %4 : i1
        %12 = comb.or %rst_req_o, %11 : i1
        %13 = comb.xor %arg6, %true : i1
        %14 = comb.and %13, %12 : i1
        %15 = comb.xor %11, %true : i1
        verif.assert %15 : i1
        fsm.update %rst_req_o, %14 : i1
        fsm.update %mon_main_pok, %10 : i1
        fsm.update %io_clk_en_q, %3 : i1
        fsm.update %main_clk_en_q, %2 : i1
      }
    }
  }
}

