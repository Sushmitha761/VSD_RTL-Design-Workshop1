# Module-3: Various Flip-Flop Coding Styles and Interesting Optimization – Part 1

## Objectives

The objective of this experiment is to study different flip-flop coding styles, understand their synthesis and optimization, and observe how Yosys optimizes RTL designs and generates the corresponding hardware representation.

---

# 1. Various Flip-Flop Coding Styles and Optimization

Flip-flops are sequential circuits used to store binary information. Different coding styles can be used depending on the reset or set behavior required in the design.

The coding styles studied in this experiment include asynchronous reset, asynchronous set, and synchronous reset.

---

## 1.1 Asynchronous Reset D Flip-Flop

An asynchronous reset changes the output immediately when the reset signal becomes active, without waiting for the clock.

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

### Working

When `async_reset` is active, the output `q` is immediately set to `0`. When the reset is inactive, the input `d` is transferred to `q` at the rising edge of the clock.

### Simulation Commands

```bash
iverilog dff_asyncres.v tb_dff_asyncres.v
```

```bash
./a.out
```

```bash
gtkwave tb_dff_asyncres.vcd
```

### Result

The asynchronous-reset D flip-flop was successfully simulated. The waveform shows the behavior of the clock, reset, input data, and output.

### Screenshot

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/e4204ec1-91ac-4ad1-a0e6-c4cc7929d055" />

**Figure 1: Simulation waveform of the asynchronous-reset D flip-flop.**

---

## 1.2 Asynchronous Set D Flip-Flop

An asynchronous set forces the output to logic `1` when the set signal becomes active, without waiting for a clock edge.

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

### Working

When `async_set` is active, `q` becomes `1`. When the set signal is inactive, the input `d` is captured at the rising edge of the clock.

### Result

The asynchronous-set D flip-flop coding style was studied and its operation was understood.

### Screenshot

<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/23870b33-a8ce-44a7-9b99-7da4ab27a9a6" />

**Figure 2: Simulation waveform of the asynchronous-set D flip-flop.**

## 1.3 Synchronous Reset D Flip-Flop

A synchronous reset affects the output only at the active edge of the clock.

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

### Working

When `sync_reset` is active at the rising edge of the clock, the output `q` becomes `0`. Otherwise, the input `d` is transferred to the output.

### Result

The synchronous-reset D flip-flop was successfully simulated and its waveform behavior was observed.

### Screenshot

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/ad136a51-5a1c-450b-94f0-895d95771adc" />

**Figure 3: Simulation waveform of the synchronous-reset D flip-flop.**

---

## 1.4 Flip-Flop Synthesis

After simulation, the RTL design was synthesized using Yosys. The SKY130 standard-cell library was used during the technology-mapping process.

### Yosys Commands

```bash
yosys
```

```bash
read_liberty -lib /address/to/your/sky130/file/sky130_fd_sc_hd__tt_025C_1v80.lib
```

```bash
read_verilog /path/to/dff_asyncres.v
```

```bash
synth -top dff_asyncres
```

```bash
dfflibmap -liberty /address/to/your/sky130/file/sky130_fd_sc_hd__tt_025C_1v80.lib
```

```bash
abc -liberty /address/to/your/sky130/file/sky130_fd_sc_hd__tt_025C_1v80.lib
```

```bash
show
```

### Result

The flip-flop RTL design was successfully synthesized and mapped to cells from the SKY130 standard-cell library. The synthesized gate-level representation was viewed using Yosys.

### Screenshot
1.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/c7dd00e7-431a-4e01-9c0a-02c694824c63" />

2.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/3a9381f5-aa1c-4690-9588-d593cbf90254" />

**Figure 4: Synthesized gate-level representation of the flip-flop design.**

---

# 2. Interesting Optimization – Part 1

RTL synthesis tools optimize the hardware representation of a design while preserving its required functionality. Yosys can simplify arithmetic operations and generate an optimized synthesized representation.

This section demonstrates optimization using multiplication operations.

---

## 2.1 `mul2` Optimization

The following RTL performs multiplication of the input by a constant value.

### Verilog Code

```verilog
module mul2 (input [2:0] a, output [3:0] y);
    assign y = a * 2;
endmodule
```

The input `a` is multiplied by `2`, and the result is assigned to `y`.

### Yosys Commands

```bash
yosys
```

```bash
read_verilog mul2.v
```

```bash
prep -top mul2
```

```bash
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

```bash
show
```

```bash
write_verilog -noattr mul2_net.v
```

```bash
gvim mul2_net.v
```

### Result

The `mul2` design was synthesized successfully. Yosys optimized the multiplication operation and generated the synthesized Verilog netlist.

### Screenshot

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/f4868a05-ee64-4828-ab42-1584cc58abea" />

**Figure 5: Yosys synthesis and optimization result for `mul2`.**

---

## 2.2 `mult8` Optimization

Another multiplication example was used to observe the optimization performed during synthesis.

### Verilog Code

```verilog
module mult8 (input [2:0] a, output [5:0] y);
    assign y = a * 9;
endmodule
```

The input is multiplied by the specified constant and the result is assigned to the output.

### Yosys Commands

```bash
yosys
```

```bash
read_verilog mult8.v
```

```bash
prep -top mult8
```

```bash
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

```bash
show
```

```bash
write_verilog -noattr mult8_net.v
```

```bash
gvim mult8_net.v
```

### Result

The `mult8` design was synthesized and optimized successfully. The generated netlist represents the optimized hardware obtained from the RTL description.

### Screenshot

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/d5b8b94c-9b93-42b3-ade8-2733a6dd7111" />

**Figure 6: Yosys synthesis and optimization result for `mult8`.**

---

## 2.3 Generated Netlist

After synthesis, Yosys can generate a Verilog file containing the synthesized representation.

For `mul2`:

```bash
write_verilog -noattr mul2_net.v
```

For `mult8`:

```bash
write_verilog -noattr mult8_net.v
```

The generated files can be opened using:

```bash
gvim mul2_net.v
```

```bash
gvim mult8_net.v
```

### Result

The synthesized Verilog netlists were generated successfully and examined to understand the optimized hardware representation.

### Screenshot

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/52c4a78e-8dfe-4c3d-9887-6b1c65cb39eb" />

**Figure 7: Generated synthesized Verilog netlist.**

---

# 3. Overall Results

The following results were obtained from the experiment:

- Different D flip-flop coding styles were studied.
- Asynchronous reset and synchronous reset behavior were verified using simulation.
- The flip-flop designs were synthesized using Yosys.
- The synthesized designs were mapped using the SKY130 standard-cell library.
- Multiplication operations were synthesized and optimized.
- Yosys generated optimized hardware representations from the RTL.
- Synthesized Verilog netlists were generated and examined.

---

# 4. Conclusion

The experiment provided practical understanding of flip-flop coding styles, synthesis, and RTL optimization. The flip-flop designs were simulated and synthesized, while arithmetic operations were optimized using Yosys. The resulting waveforms, synthesized circuits, and netlists helped in understanding the conversion of RTL code into hardware.
