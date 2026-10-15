# RTL Design and Verification — Course Learning Documentation

## 1. Introduction

This document presents the concepts, tools, commands, practical exercises, and debugging methods learned during RTL design and verification in the VLSI SoC design flow.

The sequence detector is used as an example to understand RTL coding, simulation, synthesis, and gate-level simulation. It demonstrates the workflow rather than representing the entire scope of RTL design.

## 2. Introduction to RTL Design

### What is RTL?

RTL stands for Register Transfer Level. It describes how data moves between registers and how combinational logic processes data in a digital circuit.

RTL is commonly written using hardware description languages such as Verilog and SystemVerilog.

### Important RTL concepts

- **Module:** Defines a hardware block and its ports.
- **Input and output ports:** Connect the module to other blocks or a testbench.
- **Combinational logic:** Produces results based on current inputs and/or current state.
- **Sequential logic:** Stores data or state, commonly using clock-triggered registers.
- **Clock:** Provides the timing reference for synchronous state transitions.
- **Reset:** Initializes the design to a known state.
- **Finite-State Machine (FSM):** Represents a design using states and transition rules.
- **Testbench:** Applies inputs and checks design behavior during simulation.

## 3. Example RTL Design — Sequence Detector

A sequence detector examines a serial stream of input bits and generates an output when a specified pattern is detected.

In this exercise, a sequence detector is used as a practical example of FSM-based RTL design.

### Inputs and output

| Signal | Description |
|---|---|
| `clk` | Clock input |
| `reset` | Initializes the FSM |
| `din` | Serial data input |
| `detected` | Indicates detection according to the implemented logic |

The design contains state variables, state-transition logic, and detection-output logic. Detection timing depends on the implemented FSM and the testbench's input-sampling convention.

### Source file

`src/sequence_detector.v`

This file contains the Verilog RTL implementation.

### Testbench file

`tb/tb_sequence_detector.v`

The testbench generates the clock, applies reset, supplies input bits, and records simulation waveforms.

## 4. RTL Simulation Using Icarus Verilog

RTL simulation checks the behavior of the Verilog design before synthesis.

### Step 1: Navigate to the project directory

```bash
cd ~/Desktop/sequence_detector_101011
```

**Purpose:** Opens the project directory.

### Step 2: Check the RTL and testbench files

```bash
ls src tb
```

**Purpose:** Lists the source-code and testbench files.

### Step 3: Compile the RTL and testbench

```bash
iverilog -o sim src/sequence_detector.v tb/tb_sequence_detector.v
```

**Command explanation:**

- `iverilog` invokes the Icarus Verilog compiler.
- `-o sim` specifies the compiled executable's name.
- `src/sequence_detector.v` is the RTL source.
- `tb/tb_sequence_detector.v` is the testbench.

**Expected result:** If compilation succeeds, the `sim` executable is created.

### Step 4: Run the simulation

```bash
vvp sim
```

**Purpose:** Executes the compiled simulation and displays the testbench's output.

### Step 5: Check the generated waveform

```bash
ls -lh sequence.vcd
```

**Purpose:** Checks whether the RTL waveform file exists.

The testbench uses `$dumpfile` and `$dumpvars` to record signal activity in VCD format.

### Step 6: View the waveform

```bash
gtkwave sequence.vcd
```

**Purpose:** Opens the waveform in GTKWave, if installed, to inspect signal transitions.

## 5. Logic Synthesis Using Yosys

### What is synthesis?

Logic synthesis converts an RTL description into a gate-level representation. The resulting circuit can subsequently be mapped to cells in a target standard-cell library.

### Step 1: Run generic synthesis

```bash
yosys -p "read_verilog src/sequence_detector.v; synth -top sequence_detector; stat"
```

**Command explanation:**

- `yosys` starts the Yosys synthesis tool.
- `-p` executes the supplied sequence of Yosys commands.
- `read_verilog` reads the RTL source.
- `synth -top sequence_detector` synthesizes the selected top module.
- `stat` displays synthesis statistics, including cell counts.

### Step 2: Generate the generic synthesized netlist

```bash
yosys -p "read_verilog src/sequence_detector.v; synth -top sequence_detector; write_verilog synthesis/sequence_detector_netlist.v"
```

**Purpose:** Synthesizes the RTL and writes the resulting generic netlist.

Output file:

`synthesis/sequence_detector_netlist.v`

## 6. Gate-Level Simulation (GLS)

### What is GLS?

Gate-Level Simulation verifies the synthesized netlist by applying test inputs through a testbench. Comparing RTL simulation and GLS helps check whether synthesis preserves the design's intended behavior.

### Step 1: Check the synthesized netlist

```bash
ls -l synthesis/sequence_detector_netlist.v
```

**Purpose:** Confirms that the generic synthesized netlist exists.

### Step 2: Compile the netlist and GLS testbench

```bash
iverilog -o gls_sim synthesis/sequence_detector_netlist.v tb/tb_sequence_detector_gls.v
```

**Command explanation:**

- `iverilog` invokes the compiler.
- `-o gls_sim` names the compiled executable.
- `synthesis/sequence_detector_netlist.v` supplies the synthesized netlist.
- `tb/tb_sequence_detector_gls.v` supplies the GLS testbench.

**Expected result:** If compilation succeeds, the `gls_sim` executable is created.

### Step 3: Run GLS

```bash
vvp gls_sim
```

**Purpose:** Executes the compiled gate-level simulation.

### Step 4: Check the GLS waveform

```bash
ls -lh sequence_gls.vcd
```

**Purpose:** Checks whether the GLS waveform was generated.

The GLS testbench must use `$dumpfile("sequence_gls.vcd")` and `$dumpvars` with the correct testbench hierarchy.

### Step 5: View the GLS waveform

```bash
gtkwave sequence_gls.vcd
```

**Purpose:** Opens the GLS waveform in GTKWave, if installed.

### Step 6: Run RTL simulation separately for comparison

Compile RTL:

```bash
iverilog -o sim src/sequence_detector.v tb/tb_sequence_detector.v
```

Run RTL simulation:

```bash
vvp sim
```

Open the RTL waveform:

```bash
gtkwave sequence.vcd
```

Compare the RTL and GLS waveforms using equivalent inputs and reset timing. Check the detection output cycle by cycle before concluding that the implementations are functionally equivalent.

## 7. SKY130 Standard-Cell Mapping

### What is technology mapping?

Technology mapping translates generic logic into cells available in a selected standard-cell library.

The SKY130 HD library provides standard cells such as logic gates, buffers, and flip-flops.

### Relevant files

- `synthesis/sequence_detector_sky130.v` — Technology-mapped netlist.
- `reports/sky130_mapping.log` — Mapping and synthesis log.

### Mapping command

```bash
yosys -p "read_verilog src/sequence_detector.v; synth -top sequence_detector -flatten -noabc; dfflibmap -liberty ~/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; abc -liberty ~/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; clean; stat -liberty ~/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib; write_verilog -noattr synthesis/sequence_detector_sky130.v"
```

**Command explanation:**

- `synth`: Performs synthesis.
- `-flatten`: Flattens the design hierarchy.
- `-noabc`: Defers combinational mapping to the explicit ABC command.
- `dfflibmap`: Maps flip-flops to compatible library cells.
- `abc`: Maps combinational logic using the specified Liberty library.
- `clean`: Removes unnecessary intermediate logic.
- `stat -liberty`: Reports statistics using the selected library.
- `write_verilog`: Writes the mapped netlist.

The Liberty file path must match the local PDK installation.

## 8. Problems Faced During RTL Design and Their Solutions

The following examples describe common problems encountered during RTL development and verification. Include an issue as an actual course experience only if it matches an error you observed.

### Problem 1: Verilog Compilation Error

**Issue:** Compilation fails with a syntax error or a file-not-found message.

**Possible causes:**
- Incorrect file path.
- Missing semicolon.
- Mismatched `begin` and `end`.
- Incorrect module or port declaration.

**Solution — Step 1: Check the files**

```bash
ls src tb
```

**Solution — Step 2: Compile using the correct paths**

```bash
iverilog -o sim src/sequence_detector.v tb/tb_sequence_detector.v
```

If compilation fails, read the error message and inspect the reported source line.

**Learning:** Correct syntax and file paths are essential for successful compilation.

### Problem 2: Simulation Executable Not Found

**Issue:** The simulator cannot find the `sim` executable.

**Possible cause:** Compilation failed, so the executable was not generated.

**Solution — Step 1: Compile the design**

```bash
iverilog -o sim src/sequence_detector.v tb/tb_sequence_detector.v
```

**Solution — Step 2: Run the simulation**

```bash
vvp sim
```

**Learning:** Compilation must succeed before the simulation executable can run.

### Problem 3: Waveform File Missing

**Issue:** The expected VCD file is missing.

**Possible causes:**
- Simulation was not run.
- The testbench does not contain the waveform-dump commands.
- The file was written under another name.

**Solution — Step 1: Check the waveform commands in the testbench**

```verilog
$dumpfile("sequence.vcd");
$dumpvars(0, tb_sequence_detector);
```

The testbench module name in `$dumpvars` must match the actual module name.

**Solution — Step 2: Run the simulation**

```bash
vvp sim
```

**Solution — Step 3: Check the waveform file**

```bash
ls -lh sequence.vcd
```

**Learning:** Waveform generation must be enabled in the testbench.

### Problem 4: RTL and GLS Waveforms Differ

**Issue:** The output differs between RTL and gate-level simulation.

**Possible causes:**
- Different reset or input timing.
- Incorrect testbench or netlist selection.
- Different waveform filenames.
- A functional issue in the RTL or synthesis setup.

**Solution — Step 1: Compile and run RTL**

```bash
iverilog -o sim src/sequence_detector.v tb/tb_sequence_detector.v
```

```bash
vvp sim
```

**Solution — Step 2: Compile and run GLS**

```bash
iverilog -o gls_sim synthesis/sequence_detector_netlist.v tb/tb_sequence_detector_gls.v
```

```bash
vvp gls_sim
```

**Solution — Step 3: Compare the waveforms**

Check that both testbenches apply equivalent inputs and reset timing. Compare the output cycle by cycle.

**Learning:** Successful compilation does not by itself prove functional correctness.

### Problem 5: Detection Output Appears at an Unexpected Time

**Issue:** The detection output becomes high earlier or later than expected.

**Possible cause:** The input changes, clock edges, FSM transitions, and output logic may not match the intended detection timing.

**Solution — Step 1: Open the waveform**

```bash
gtkwave sequence.vcd
```

**Solution — Step 2: Inspect the relevant signals**

Check `clk`, `reset`, `din`, and `detected`. If the internal state is exposed in the waveform, inspect it as well.

**Solution — Step 3: Verify the expected sampling cycle**

Check when `din` changes and when the FSM samples it. Determine whether `detected` is combinational or registered.

**Learning:** Clock-edge timing and FSM behavior must be understood when debugging sequential RTL.

### Problem 6: Synthesized Netlist Is Missing or Out of Date

**Issue:** GLS cannot find the netlist or uses an older version.

**Solution — Step 1: Regenerate the generic netlist**

```bash
yosys -p "read_verilog src/sequence_detector.v; synth -top sequence_detector; write_verilog synthesis/sequence_detector_netlist.v"
```

**Solution — Step 2: Check the generated file**

```bash
ls -lh synthesis/sequence_detector_netlist.v
```

**Solution — Step 3: Recompile GLS**

```bash
iverilog -o gls_sim synthesis/sequence_detector_netlist.v tb/tb_sequence_detector_gls.v
```

**Solution — Step 4: Run GLS**

```bash
vvp gls_sim
```

**Learning:** The synthesized netlist should be regenerated whenever relevant RTL changes are made.

### General Debugging Method

1. Read the complete error message.
2. Identify the file and line associated with the error.
3. Check the file path, source code, and tool command.
4. Correct the issue.
5. Rerun the affected step.
6. Verify the result through simulation output or waveforms.

## 9. Key Learning Outcomes

1. Understanding the purpose of RTL design in the digital IC flow.
2. Learning Verilog modules, sequential logic, combinational logic, and FSMs.
3. Compiling and running RTL simulations using Icarus Verilog.
4. Inspecting signal behavior through VCD waveforms.
5. Performing generic synthesis using Yosys.
6. Running gate-level simulation using a synthesized netlist.
7. Understanding standard-cell technology mapping with the SKY130 HD library.
8. Learning a systematic approach to debugging RTL and simulation problems.

## 10. Conclusion

RTL design and verification are fundamental stages of the VLSI implementation flow. The sequence detector serves as a practical example for learning Verilog coding, testbench development, RTL simulation, synthesis, gate-level simulation, and standard-cell mapping.

These concepts provide the foundation for further study of physical design, including floorplanning, placement, clock-tree synthesis, routing, and post-route analysis.
