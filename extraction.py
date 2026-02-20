import os
import sys

FSM_TEST_CASES = [
    {
        "name": "adc_ctrl_fsm",
        "sv_path": "hw/ip/adc_ctrl/rtl/adc_ctrl_fsm.sv",
        "verilog_flags": [
            "hw/ip/prim/rtl/prim_assert.sv",
            # "--ignore-unknown-modules",
            # "-DYOSYS", "-DSYNTHESIS",
            "-yhw/ip/prim_generic/rtl", "-yhw/ip/prim/rtl",
            "-yhw/ip/adc_ctrl/rtl", "-Ihw/ip/prim/rtl"

        ]
    },
    {
        "name": "aes_cipher_control_fsm",
        "sv_path": "hw/ip/aes/rtl/aes_cipher_control_fsm.sv",
        "verilog_flags": [

            "hw/ip/prim/rtl/prim_assert.sv",
            # "-DYOSYS", "-DSYNTHESIS",
            "-DINC_ASSERT",
            "-I", "hw/ip/prim/rtl",
            "-y", "hw/ip/aes/rtl", "-y", "hw/ip/prim_generic/rtl",
            "-y", "hw/ip/prim/rtl"
        ]
    },
    {
        "name": "aes_ctr_fsm",
        "sv_path": "hw/ip/aes/rtl/aes_ctr_fsm.sv",
        "verilog_flags": [
            "-I", "hw/ip/prim/rtl", "-y", "hw/ip/prim_generic/rtl",
            "-y", "hw/ip/prim_generic/rtl", "-y", "hw/ip/aes/rtl",
            "-y", "hw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
            # "-D", "YOSYS", "-D", "SYNTHESIS"
        ]
    },
    {
        "name": "i2c_controller_fsm",
        "sv_path": "hw/ip/i2c/rtl/i2c_controller_fsm.sv",
        "verilog_flags": [
            "hw/ip/prim/rtl/prim_assert.sv",
            # "-DYOSYS", "-DSYNTHESIS",
            "-I", "hw/ip/prim/rtl",
            "-y", "hw/ip/aes/rtl", "-y", "hw/ip/i2c/rtl",
            "-y", "hw/ip/prim_generic/rtl", "-y", "hw/ip/prim/rtl"
        ]
    },
    {
        "name": "i2c_target_fsm",
        "sv_path": "hw/ip/i2c/rtl/i2c_target_fsm.sv",
        "verilog_flags": [
            "hw/ip/prim/rtl/prim_assert.sv",
            # "-DYOSYS", "-DSYNTHESIS",
            "-I", "hw/ip/prim/rtl",
            "-y", "hw/ip/aes/rtl", "-y", "hw/ip/i2c/rtl",
            "-y", "hw/ip/prim_generic/rtl", "-y", "hw/ip/prim/rtl"
        ]
    },
    {
        "name": "mbx_fsm",
        "sv_path": "hw/ip/mbx/rtl/mbx_fsm.sv",
        "verilog_flags": ["-I", "hw/ip/prim/rtl", "-y", "hw/ip/prim_generic/rtl",  "-DYOSYS", "-DSYNTHESIS", ]
    },
    {
        "sv_path": "hw/top_darjeeling/ip_autogen/pwrmgr/rtl/pwrmgr_slow_fsm.sv",
        "name": "darjeeling_pwrmgr_slow_fsm",
        "verilog_flags" : [
            "-yhw/ip/prim_generic/rtl",
            "-yhw/ip/prim/rtl",
            "-yhw/top_darjeeling/ip_autogen/pwrmgr/rtl",
            "-yhw/ip/lc_ctrl/rtl",
            "-yhw/ip/rom_ctrl/rtl",
            "-Ihw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
 # "-DYOSYS", "-DSYNTHESIS",
            ]
        },{
            "sv_path": "hw/ip/rom_ctrl/rtl/rom_ctrl_fsm.sv",
            "name" : "rom_ctrl_fsm",
            "verilog_flags":[
                "-yhw/ip/prim_generic/rtl", "-yhw/ip/prim/rtl",  "-yhw/ip/lc_ctrl/rtl", "-yhw/ip/rom_ctrl/rtl",
                "-Ihw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
                 # "-DYOSYS", "-DSYNTHESIS",
                 "-DFPV_ON",
                ]
            },{
                "sv_path": "hw/top_earlgrey/ip_autogen/pwrmgr/rtl/pwrmgr_slow_fsm.sv",
                "name": "earlgrey_pwrmgr_slow_fsm",
                "verilog_flags":[
                    "-yhw/ip/prim_generic/rtl", "-yhw/ip/prim/rtl", "-yhw/top_earlgrey/ip_autogen/pwrmgr/rtl",
                    "-yhw/ip/lc_ctrl/rtl", "-yhw/ip/rom_ctrl/rtl", "-Ihw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
                     # "-DYOSYS", "-DSYNTHESIS",
                    ]
            },{
                "sv_path": "hw/top_englishbreakfast/ip_autogen/pwrmgr/rtl/pwrmgr_slow_fsm.sv",
                "name": "englishbreakfast_pwrmgr_slow_fsm",
                "verilog_flags":[
                    "-yhw/ip/prim_generic/rtl",
                    "-yhw/ip/prim/rtl",
                    "-yhw/top_englishbreakfast/ip_autogen/pwrmgr/rtl",
                    "-yhw/ip/lc_ctrl/rtl",
                    "-yhw/ip/rom_ctrl/rtl",
                    "-Ihw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
                     # "-DYOSYS", "-DSYNTHESIS",
                    ]
                },

{
        "sv_path":"hw/top_englishbreakfast/ip_autogen/pwrmgr/rtl/pwrmgr_fsm.sv",
        "name": "englishbreakfast_pwrmgr_fsm",
        "verilog_flags":[
            "-yhw/ip/prim_generic/rtl",
        "-yhw/ip/prim/rtl",
        "-yhw/top_englishbreakfast/ip_autogen/pwrmgr/rtl",
            "-yhw/ip/lc_ctrl/rtl",
            "-yhw/ip/rom_ctrl/rtl",
            "-UINC_ASSERT",
            "-Ihw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
            # "-DYOSYS", "-DSYNTHESIS",
        ]
    },
    {

        "sv_path":"hw/top_earlgrey/ip_autogen/pwrmgr/rtl/pwrmgr_fsm.sv",
        "name": "earlgrey_pwrmgr_fsm",
        "verilog_flags":[
            "-yhw/ip/prim_generic/rtl",
        "-yhw/ip/prim/rtl",
        "-yhw/top_earlgrey/ip_autogen/pwrmgr/rtl",
            "-yhw/ip/lc_ctrl/rtl",
            "-yhw/ip/rom_ctrl/rtl",
            "-UINC_ASSERT",
            "-Ihw/ip/prim/rtl",
            "-yhw/ip/prim/rtl",
            "-yhw/ip/prim_generic/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
            # "-DYOSYS", "-DSYNTHESIS",
        ]
    },
{
        "sv_path":"hw/top_darjeeling/ip_autogen/pwrmgr/rtl/pwrmgr_fsm.sv",
        "name": "darjeeling_pwrmgr_fsm",
        "verilog_flags":[
            "-yhw/ip/prim_generic/rtl",
        "-yhw/ip/prim/rtl",
        "-yhw/top_darjeeling/ip_autogen/pwrmgr/rtl",
            "-yhw/ip/lc_ctrl/rtl",
            "-yhw/ip/rom_ctrl/rtl",
            "-UINC_ASSERT",
            "-Ihw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
            # "-DYOSYS", "-DSYNTHESIS",
        ]
    },
    {

#  -yhw/ip/prim_generic/rtl -yhw/ip/prim/rtl -yhw/ip/spi_host/rtl -yhw/ip/lc_ctrl/rtl -yhw/ip/rom_ctrl/rtl hw/ip/spi_host/rtl/spi_host_fsm.sv -Ihw/ip/prim/rtl
        "sv_path":"hw/ip/spi_host/rtl/spi_host_fsm.sv",
        "name": "spi_host_fsm",
        "verilog_flags":[
            "-yhw/ip/prim_generic/rtl",
        "-yhw/ip/prim/rtl",
            "-yhw/ip/spi_host/rtl", "-yhw/ip/lc_ctrl/rtl", "-yhw/ip/rom_ctrl/rtl",
            "-Ihw/ip/prim/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
        # "-DYOSYS", "-DSYNTHESIS",
        ]
    },
    {

#  -Ihw/ip/prim/rtl -yhw/ip/aes/rtl -yhw/ip/prim_generic/rtl -yhw/ip/prim/rtl -yhw/ip/lc_ctrl/rtl -yhw/ip/rom_ctrl/rtl -yhw/ip/adc_ctrl/rtl hw/ip/lc_ctrl/rtl/lc_ctrl_fsm.sv
            "sv_path":"hw/ip/lc_ctrl/rtl/lc_ctrl_fsm.sv",
        "name": "lc_ctrl_fsm",
        "verilog_flags":[
            "-yhw/ip/prim_generic/rtl",
        "-yhw/ip/prim/rtl",
            "-yhw/ip/lc_ctrl/rtl",
            "-yhw/ip/rom_ctrl/rtl",
            "-Ihw/ip/prim/rtl",
            "-yhw/ip/prim_generic/rtl",
            "hw/ip/prim/rtl/prim_assert.sv",
            "hw/top_earlgrey/rtl/autogen/testing/lc_ctrl_token_pkg.sv"
            # "-DYOSYS", "-DSYNTHESIS",
        ]
    }


]

OPENTITAN_ROOT = "./"
output_base_dir = OPENTITAN_ROOT+"testing"
CIRCT_VERILOG = "circt-verilog"
CIRCT_OPT = "circt-opt"
CIRCT_TRANSLATE = "circt-translate"
quietMode = "--quiet" in sys.argv
after = 0
for arg in sys.argv:
    if arg.startswith("--after="):
        after = int(arg.split("=")[1])    

FSM_CIRCT_OPT = "/local/scratch/tah56/paper-evals/fsm-mc-benchmarking/fsm-circt/build/bin/circt-opt"

if not os.path.isfile(FSM_CIRCT_OPT):
    print("Sorry Bea has hardcoded the location of this binary until the FSMToSMT pass is merged (isn't she awfully silly!?). You'll need to update the FSM_CIRCT_OPT variable locally.")
    sys.exit(0)


def run_command(cmd, cwd=None):
    if not quietMode:
        print(f"Running command: {' '.join(cmd)} in {cwd}")
    result = os.system(' '.join(cmd))
    if result != 0 and not quietMode:
        print(f"Command failed with exit code {result}")
    return result == 0

def main():
    if after == 0:
        run_command(["rm", "-rf", output_base_dir])

    if after <= 1:
        total_tests = 0
        passed_tests = 0
        for fsm_config in FSM_TEST_CASES:
            name = fsm_config["name"]
            sv_path = OPENTITAN_ROOT + fsm_config["sv_path"]
            verilog_flags = fsm_config["verilog_flags"]


            test_dir = output_base_dir + "/" + name + "/"
            os.makedirs(test_dir, exist_ok=True)
            if not quietMode:
                print(f"--- Running Test: {name} ---")


            # --- Step 1: Ingest SystemVerilog ---
            initial_mlir = test_dir + "1_initial.mlir"
            cmd = [str(CIRCT_VERILOG), str(sv_path), *verilog_flags, "-o", str(initial_mlir)]
            if not quietMode:
                print(*cmd)
            res = run_command(cmd, cwd=OPENTITAN_ROOT)
            total_tests += 1
            passed_tests += int(res)

        print(f"{passed_tests} out of {total_tests} designs produced MLIR from SV")

    # --- Step 2: Preprocesssing on emitted MLIR ---

    if after <= 2:
        total_tests = 0
        passed_tests = 0
        for fsm_config in FSM_TEST_CASES:
            name = fsm_config["name"]
            sv_path = OPENTITAN_ROOT + fsm_config["sv_path"]
            verilog_flags = fsm_config["verilog_flags"]


            test_dir = output_base_dir + "/" + name + "/"
            os.makedirs(test_dir, exist_ok=True)
            if not quietMode:
                print(f"--- Running Test: {name} ---")

            initial_mlir = test_dir + "1_initial.mlir"
            proc_mlir = test_dir + "2_proc.mlir"
            cmd = [str(CIRCT_OPT), "--hw-flatten-modules", "--comb-assume-two-valued", "--arc-strip-sv=async-resets-as-sync", "--hw-flatten-io", "--lower-ltl-to-core", str(initial_mlir), "-o",  str(proc_mlir)]
            res = run_command(cmd, cwd=OPENTITAN_ROOT)
            # Hack until FSMToSMT handles clocked asserts
            run_command(["sed", "-i", "-E", "-r", "\"s/clocked_assert (%[a-zA-Z0-9_]+), .* : (.*)/assert \\1 : \\2/g\"", str(proc_mlir)])
            total_tests += 1
            passed_tests += int(res)

        print(f"{passed_tests} out of {total_tests} designs preprocessed")


    # --- Step 3: Run passes to extract FSMs ---
    if after <= 3:
        total_tests = 0
        passed_tests = 0
        for fsm_config in FSM_TEST_CASES:
            name = fsm_config["name"]
            sv_path = OPENTITAN_ROOT + fsm_config["sv_path"]
            verilog_flags = fsm_config["verilog_flags"]


            test_dir = output_base_dir + "/" + name + "/"
            os.makedirs(test_dir, exist_ok=True)
            if not quietMode:
                print(f"--- Running Test: {name} ---")

            initial_mlir = test_dir + "2_proc.mlir"
            extracted_mlir = test_dir + "3_extracted.mlir"
            cmd = [str(CIRCT_OPT), "--convert-core-to-fsm", "--mlir-diagnostic-verbosity-level=errors", str(initial_mlir), "-o",  str(extracted_mlir)]
            res = run_command(cmd, cwd=OPENTITAN_ROOT)
            total_tests += 1
            passed_tests += int(res)

        print(f"{passed_tests} out of {total_tests} designs extracted FSMs")

    # --- Step 4: FSM To SMT ---
    if after <= 4:
        total_tests = 0
        passed_tests = 0
        for fsm_config in FSM_TEST_CASES:
            name = fsm_config["name"]
            sv_path = OPENTITAN_ROOT + fsm_config["sv_path"]
            verilog_flags = fsm_config["verilog_flags"]


            test_dir = output_base_dir + "/" + name + "/"
            os.makedirs(test_dir, exist_ok=True)
            if not quietMode:
                print(f"--- Running Test: {name} ---")

            extracted_mlir = test_dir + "3_extracted.mlir"
            smt_mlir = test_dir + "4_smt.mlir"
            cmd = [str(FSM_CIRCT_OPT), "--convert-fsm-to-smt", "--convert-comb-to-smt", "--convert-hw-to-smt", "--reconcile-unrealized-casts", "--mlir-diagnostic-verbosity-level=errors", str(extracted_mlir), "-o",  str(smt_mlir)]
            res = run_command(cmd, cwd=OPENTITAN_ROOT)
            total_tests += 1
            passed_tests += int(res)

        print(f"{passed_tests} out of {total_tests} designs produced SMT dialect MLIR")

    # --- Step 5: FSM To SMT ---
    if after <= 5:
        total_tests = 0
        passed_tests = 0
        for fsm_config in FSM_TEST_CASES:
            name = fsm_config["name"]
            sv_path = OPENTITAN_ROOT + fsm_config["sv_path"]
            verilog_flags = fsm_config["verilog_flags"]


            test_dir = output_base_dir + "/" + name + "/"
            os.makedirs(test_dir, exist_ok=True)
            if not quietMode:
                print(f"--- Running Test: {name} ---")

            smt_mlir = test_dir + "4_smt.mlir"
            smtlib_file = test_dir + "5_smtlib.smt2"
            cmd = [str(CIRCT_TRANSLATE), "--export-smtlib", str(smt_mlir), "-o",  str(smtlib_file)]
            res = run_command(cmd, cwd=OPENTITAN_ROOT)
            total_tests += 1
            passed_tests += int(res)

        print(f"{passed_tests} out of {total_tests} designs produced SMT-LIB files")


if __name__ == '__main__':
    main()
