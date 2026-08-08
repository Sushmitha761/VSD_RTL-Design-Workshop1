# Module-2: Timing Libraries, Synthesis Approaches, and Efficient Flip-Flop Coding

## Objectives

The objective of Day 2 is to understand timing libraries, the SKY130 PDK, synthesis approaches, flip-flop coding styles, and the RTL simulation and synthesis flow using Icarus Verilog, GTKWave, and Yosys.

# 1. Timing Libraries

## 1.1 SKY130 PDK

The SKY130 PDK provides technology information and standard-cell libraries required for designing and synthesizing circuits using 130 nm CMOS technology.

The timing library used in this workshop was:

```text
sky130_fd_sc_hd__tt_025C_1v80.lib
```

## 1.2 Understanding `tt_025C_1v80`

The name of the library gives information about its operating conditions:

- `tt` – Typical process corner
- `025C` – Temperature of 25°C
- `1v80` – Supply voltage of 1.8 V

## 1.3 Exploring the `.lib` File
<img width="905" height="930" alt="image" src="https://github.com/user-attachments/assets/d2c23027-a636-4889-be1f-f40682e3b6e1" />



### Commands

```bash
sudo apt install gedit
```

```bash
gedit sky130_fd_sc_hd__tt_025C_1v80.lib
```

<img width="952" height="1144" alt="image" src="https://github.com/user-attachments/assets/079dd3a6-0401-4a4a-a3ed-0e5a75905ff1" />

**Figure 1: SKY130 timing library file.**

### Result

The SKY130 `.lib` file was successfully opened and its library and operating-condition information was examined.

---

# 2. Hierarchical and Flattened Synthesis

## 2.1 Hierarchical Synthesis

<img width="1920" height="940" alt="image" src="https://github.com/user-attachments/assets/3cd1a458-0349-418c-a81f-62eaa8fd3f01" />


**Figure 2: Hierarchical synthesized design.**

### Result

The synthesized multiple-module design retained its module structure and connections.

## 2.2 Flattened Synthesis

Flattened synthesis combines the modules into a single design structure. It allows optimization across module boundaries.

The Yosys command used for flattening is:

```text
flatten
```
## Example:
<img width="1920" height="940" alt="image" src="https://github.com/user-attachments/assets/e871ebf7-df81-4cc5-8a70-8ab30b743fd7" />


## 2.3 Comparison

| Feature | Hierarchical | Flattened |
|---|---|---|
| Module structure | Preserved | Removed |
| Optimization | Limited across modules | Across complete design |
| Debugging | Easier | More difficult |
| Structure | Modular | Single structure |

### Result

The differences between hierarchical and flattened synthesis were studied, particularly their module structure, optimization, and debugging characteristics.

---

# 3. Flip-Flop Coding Styles

Flip-flops are sequential circuits used to store binary data. Three D flip-flop coding styles were studied.

## 3.1 Asynchronous Reset D Flip-Flop

An asynchronous reset forces the output to `0` when the reset signal becomes active.

### Verilog Code

```verilog
module dff_asyncres (input clk, input async_reset, input d, output reg q);
  always @ (posedge clk, posedge async_reset)
    if (async_reset)
      q <= 1'b0;
    else
      q <= d;
endmodule
```

### Result

The D flip-flop was implemented with an asynchronous reset and its behavior was verified through simulation.

## 3.2 Asynchronous Set D Flip-Flop

An asynchronous set forces the output to `1` when the set signal becomes active.

### Verilog Code

```verilog
module dff_async_set (input clk, input async_set, input d, output reg q);
  always @ (posedge clk, posedge async_set)
    if (async_set)
      q <= 1'b1;
    else
      q <= d;
endmodule
```

### Result

The D flip-flop was implemented with an asynchronous set operation.

## 3.3 Synchronous Reset D Flip-Flop

A synchronous reset affects the output only at the active clock edge.

### Verilog Code

```verilog
module dff_syncres (input clk, input async_reset, input sync_reset, input d, output reg q);
  always @ (posedge clk)
    if (sync_reset)
      q <= 1'b0;
    else
      q <= d;
endmodule
```

### Result

The D flip-flop was implemented with a synchronous reset and its operation was studied.

---

# 4. Simulation and Synthesis Workflow

The RTL design was simulated using Icarus Verilog and GTKWave and synthesized using Yosys.

## 4.1 Icarus Verilog Simulation

### Compile

```bash
iverilog dff_asyncres.v tb_dff_asyncres.v
```

### Run

```bash
./a.out
```

### View Waveform

<img width="1920" height="940" alt="image" src="https://github.com/user-attachments/assets/5248402a-1979-4f13-841b-ada51cfececd" />


<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/db8f2d80-1ed7-4673-aa5b-c5a2a87f0651" />


**Figure 3: D flip-flop simulation waveform in GTKWave.**

### Result

The simulation was successfully performed, and the waveform verified the relationship between `clk`, `async_reset`, `d`, and `q`.

---

## 4.2 Synthesis Using Yosys

Yosys was used to synthesize the RTL design and map it to the SKY130 standard-cell library.

### Start Yosys

```bash
yosys
```

### Read Liberty Library

```bash
read_liberty -lib /address/to/your/sky130/file/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Read Verilog Code

```bash
read_verilog /path/to/dff_asyncres.v
```

### Synthesize

```bash
synth -top dff_asyncres
```

### Map Flip-Flops

```bash
dfflibmap -liberty /address/to/your/sky130/file/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### Technology Mapping

```bash
abc -liberty /address/to/your/sky130/file/sky130_fd_sc_hd__tt_025C_1v80.lib
```

### View Netlist

```bash
show
```

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/1985d3c9-9700-4d73-b43b-d77bba4cd549" />


**Figure 4: Synthesized gate-level representation.**

### Result

The RTL design was successfully synthesized and mapped to cells from the SKY130 standard-cell library. The resulting gate-level representation was viewed using Yosys.

---

# 5. Overall Result

The SKY130 timing library was explored, hierarchical and flattened synthesis approaches were studied, and different D flip-flop coding styles were implemented. The RTL design was successfully simulated using Icarus Verilog and GTKWave and synthesized using Yosys with the SKY130 standard-cell library.

# 6. Conclusion

Day 2 provided practical understanding of timing libraries, synthesis approaches, flip-flop coding, RTL simulation, waveform analysis, and technology mapping in the RTL-to-gate-level design flow.
