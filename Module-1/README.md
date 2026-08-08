# Module-1 – Verilog RTL Design Through Simulation

##  Experiment Objective

The objective of this experiment is to understand the fundamentals of Register Transfer Level (RTL) design using Verilog HDL. The experiment focuses on learning how to compile and simulate Verilog designs using Icarus Verilog (iverilog) and verify the output through waveform analysis using GTKWave. A 2:1 Multiplexer is implemented to understand the complete simulation flow.

---

##  Contents

- Digital Design Verification
- Simulation Workflow with Icarus Verilog
- Practical Exercise – Simulating a 2:1 Multiplexer
- Multiplexer Design Explanation
- Conclusion

---

# 1️ Digital Design Verification

## Simulator

A simulator is a software tool that executes Verilog designs in a virtual environment. It helps designers verify circuit functionality before hardware implementation.

## Design

A design is the Verilog module that describes the logic and behavior of a digital circuit.

## Testbench

A testbench is a verification module that applies different input combinations to the design and checks whether the output is correct.

<img width="1256" height="602" alt="Screenshot 2026-08-07 094739" src="https://github.com/user-attachments/assets/81273a48-22c7-4ebe-a665-abd79845b6e8" />

---

# 2️ Simulation Workflow with Icarus Verilog

Icarus Verilog (iverilog) is an open-source Verilog compiler and simulator. It compiles the design and testbench, executes the simulation, and generates a Value Change Dump (.vcd) file which can be viewed using GTKWave.

## Simulation Flow

```
Design File
      │
      ▼
Testbench
      │
      ▼
Icarus Verilog (iverilog)
      │
      ▼
Generate .vcd File
      │
      ▼
GTKWave
```
## Simulation Flow Diagram
<img width="1362" height="700" alt="Screenshot 2026-08-07 094821" src="https://github.com/user-attachments/assets/345854c0-c1b8-4504-b105-b84016da8469" />

---

# 3️ Practical Exercise – Simulating a 2:1 Multiplexer

## Step 1 – Install Required Tools

```bash
sudo apt install iverilog
sudo apt install gtkwave
```

Install the Verilog compiler and waveform viewer.

---

## Step 2 – Compile the Design

```bash
iverilog good_mux.v tb_good_mux.v
```

This command compiles the design file and the testbench.

---

## Step 3 – Execute the Simulation

```bash
./a.out
```

Running this command executes the simulation and generates the waveform (.vcd) file.

---

## Step 4 – Open the Waveform

```bash
gtkwave tb_good_mux.vcd
```

The generated waveform is opened using GTKWave for verification.

---
## GTKWave Output

<img width="1913" height="1193" alt="Screenshot 2026-08-06 203754" src="https://github.com/user-attachments/assets/3bc7bf8b-a318-479c-8340-4fa626f98754" />


# 4️ Multiplexer Design Explanation

## Verilog Design

```verilog
module good_mux (
    input i0,
    input i1,
    input sel,
    output reg y
);

always @(*)
begin
    if (sel)
        y <= i1;
    else
        y <= i0;
end

endmodule
```

## Working Principle

### Inputs

- **i0** – First input
- **i1** – Second input
- **sel** – Selection signal

### Output

- **y** – Multiplexer output

### Operation

- When **sel = 0**, the output follows **i0**.
- When **sel = 1**, the output follows **i1**.

---
## Verilog Code Screenshot

<img width="1913" height="1195" alt="Screenshot 2026-08-06 214101" src="https://github.com/user-attachments/assets/e1de5ced-1ded-4dc0-b03e-c067a1f5e98a" />

# 5 Introduction to Yosys & Gate Libraries

### Theory

Yosys is an open-source synthesis tool used to convert Verilog HDL code into a gate-level netlist. It optimizes the design and maps it to the standard cells available in a technology library.

A Liberty (`.lib`) file contains information about standard cells such as AND, OR, and NOT gates, including their timing, power, area, and drive strength. During synthesis, Yosys selects the most suitable gate for the given design.

In this experiment, the `good_mux` Verilog design was synthesized using the Sky130 standard cell library. The design was optimized, technology mapped, and the gate-level schematic was generated using Yosys.

## Synthesis Lab with Yosys

### Step 1: Start Yosys

```bash
yosys
```

### Step 2: Read the Liberty Library

```bash
read_liberty -lib /home/vsduser/VLSI/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Step 3: Read the Verilog File

```bash
read_verilog /home/vsduser/VLSI/sky130RTLDesignAndSynthesisWorkshop/verilog_files/good_mux.v
```

### Step 4: Synthesize the Design

```bash
synth -top good_mux
```

### Step 5: Perform Technology Mapping

```bash
abc -liberty /home/vsduser/VLSI/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Step 6: View the Gate-Level Netlist

```bash
show
```
<img width="1917" height="1192" alt="Screenshot 2026-08-06 225340" src="https://github.com/user-attachments/assets/0070e49a-f6a6-413d-bf24-58669fb34532" />

## Result

* Successfully compiled the Verilog design using Icarus Verilog.
* Executed the simulation without errors.
* Generated the waveform (`.vcd`) file.
* Verified the waveform using GTKWave.
* Successfully loaded the Sky130 Liberty library in Yosys.
* Synthesized the `good_mux` Verilog design without errors.
* Performed technology mapping using the Sky130 standard cell library.
* Generated and viewed the gate-level netlist successfully.

---

## Conclusion

This experiment provided practical experience in both Verilog RTL simulation and synthesis. It covered the complete design flow, including writing the design module and testbench, compiling and simulating the design using Icarus Verilog, verifying the output with GTKWave, and synthesizing the design using Yosys with the Sky130 standard cell library. The successful implementation and synthesis of the 2:1 Multiplexer strengthened my understanding of digital design concepts, RTL simulation, technology mapping, and gate-level netlist generation in the VLSI design flow.
