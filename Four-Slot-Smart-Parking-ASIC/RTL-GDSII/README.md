# Four-Slot Smart Parking Occupancy and Gate Controller ASIC

## 1. Introduction

The Four-Slot Smart Parking Occupancy and Gate Controller ASIC is a digital hardware design developed to manage vehicle parking occupancy in a small parking area with a maximum capacity of four vehicles. The project uses Verilog HDL to implement a controller that tracks occupied parking slots, processes vehicle entry and exit requests, and generates parking status and gate-control signals.

The design demonstrates how a real-world parking management function can be implemented at the Register Transfer Level (RTL) and taken through an Application-Specific Integrated Circuit (ASIC) design flow. The design is simulated and synthesized, followed by physical-design implementation and timing analysis using the SKY130 standard-cell platform and open-source VLSI tools.

This project provides practical experience in digital logic design, RTL coding, functional verification, logic synthesis, physical design, and static timing analysis.

## 2. Project Description

The proposed system is designed to manage a parking area containing four parking slots. It maintains a digital count of occupied slots and updates this count based on vehicle entry and exit requests.

When a valid vehicle entry request is received, the controller updates the occupancy count if parking capacity is available. When a valid exit request is received, the count decreases if at least one vehicle is parked. The controller also generates status signals to indicate whether the parking area is full or empty and provides a gate-control output according to the implemented control logic.

The design is written in Verilog HDL and verified using a testbench that applies different input sequences, including reset, entry, and exit operations. After functional verification, the RTL can be synthesized into a standard-cell netlist and processed through the ASIC physical-design flow.

The project uses the SKY130 HD standard-cell library and tools such as Icarus Verilog, GTKWave, Yosys, OpenLane, OpenROAD, and OpenSTA for simulation, waveform inspection, synthesis, physical design, and timing analysis.

### 2.1 Main Features

- Four-slot parking occupancy tracking.
- Vehicle entry and exit request processing.
- Full and empty parking status generation.
- Gate-control signal generation.
- Verilog RTL implementation and testbench verification.
- ASIC synthesis and physical-design implementation.
- Static timing analysis across selected process, voltage, and temperature (PVT) corners.

### 2.2 Project Scope

This project implements the **digital parking controller**, not a complete physical parking installation. Real vehicle sensors, a gate motor, and an external display or monitoring system would require additional hardware and interface integration.

## 3. Real-World Applications

### 3.1 Small Residential Parking Areas

The controller can be adapted for small apartment parking areas with a limited number of parking spaces. It tracks occupied slots and indicates when the configured parking capacity is reached.

### 3.2 Office and Campus Parking

Small offices, laboratories, and campus parking areas can use similar occupancy-control logic to monitor the number of vehicles inside a designated parking zone.

### 3.3 Parking Gate Automation

The `gate_open` output can act as a digital command signal for an external gate-control interface. A suitable motor driver, safety sensors, and gate mechanism would be required for physical gate operation.

### 3.4 Parking Occupancy Indicators

The `full`, `empty`, and `warning` outputs can be connected to external indicator circuits or a monitoring controller to display parking availability.

### 3.5 Embedded Systems and IoT Integration

The controller can be integrated with a microcontroller or communication interface to share occupancy information with a monitoring system. Communication and networking functionality are not implemented in the current RTL.

### 3.6 ASIC and VLSI Design Education

The project demonstrates practical digital-design concepts, including counters, registers, comparators, combinational control logic, and sequential circuits. It also provides experience with simulation, synthesis, physical design, and static timing analysis.

### 3.7 Scalable Parking Management Systems

The four-slot controller can serve as a reference architecture for designing larger-capacity systems. Increasing the capacity would require appropriate counter sizing, updated status comparisons, and additional verification.

## 4. Benefits

- Tracks parking occupancy digitally.
- Prevents the occupancy count from exceeding the configured capacity.
- Generates full, empty, and early-warning status signals.
- Provides a gate-control output for external hardware integration.
- Demonstrates an end-to-end ASIC design workflow.
- Offers a foundation for future expansion and system integration.

##  4.Digital Logical Circuits Used



The **Four-Slot Smart Parking Occupancy and Gate Controller ASIC** uses sequential and combinational digital logic to track parking occupancy, process vehicle entry and exit requests, and generate parking status and gate-control signals.

## 1. Overall Digital Controller Architecture

The following diagram illustrates the main inputs, controller logic, and outputs.

```mermaid
flowchart TD
    A["Clock and Reset"] --> D["Sequential Controller"]
    B["Entry Request"] --> D
    C["Exit Request"] --> D
    D --> E["3-Bit Occupancy Register"]
    E --> F["Comparator Logic"]
    E --> G["Increment / Decrement Logic"]
    G --> D
    F --> H["Warning Signal"]
    F --> I["Full / Empty Signals"]
    D --> J["Gate Control Output"]
```

## 2. 3-Bit Occupancy Counter

The `slot_count` register stores the number of occupied slots from zero to four.

```verilog
output reg [2:0] slot_count;
```

### Binary Representation

| Occupied Slots | Binary Value |
|---:|:---:|
| 0 | `000` |
| 1 | `001` |
| 2 | `010` |
| 3 | `011` |
| 4 | `100` |

```mermaid
flowchart LR
    A["000<br/>0 vehicles"] -->|Entry| B["001<br/>1 vehicle"]
    B -->|Entry| C["010<br/>2 vehicles"]
    C -->|Entry| D["011<br/>3 vehicles"]
    D -->|Entry| E["100<br/>4 vehicles"]
    E -->|Exit| D
    D -->|Exit| C
    C -->|Exit| B
    B -->|Exit| A
```

The counter increases on a valid entry and decreases on a valid exit. Entry is blocked when occupancy is four, and exit is blocked when occupancy is zero.

## 3. Registers and Flip-Flops

The controller uses clocked sequential logic to store the occupancy count and gate-control output.

```verilog
always @(posedge clk or posedge reset)
```

```mermaid
flowchart TD
    A["Clock"] --> B["Register / Flip-Flops"]
    C["Reset"] --> B
    D["Next Occupancy Value"] --> B
    B --> E["Stored slot_count"]
    B --> F["Stored gate_open"]
```

- `posedge clk` updates registers at the rising clock edge.
- `posedge reset` resets the stored values asynchronously.
- The occupancy count and gate output are reset to zero.

## 4. Comparator Logic

The controller compares the occupancy count with specific values to generate status outputs.

```verilog
assign warning = (slot_count >= 3);
assign full    = (slot_count == 4);
assign empty   = (slot_count == 0);
```

```mermaid
flowchart TD
    A["slot_count"] --> B{"Occupancy >= 3?"}
    B -->|Yes| C["warning = 1"]
    B -->|No| D["warning = 0"]
    A --> E{"Occupancy == 4?"}
    E -->|Yes| F["full = 1"]
    E -->|No| G["full = 0"]
    A --> H{"Occupancy == 0?"}
    H -->|Yes| I["empty = 1"]
    H -->|No| J["empty = 0"]
```

| Condition | Output |
|---|---|
| Occupancy is 3 or more | `warning = 1` |
| Occupancy equals 4 | `full = 1` |
| Occupancy equals 0 | `empty = 1` |

## 5. Incrementer and Decrementer

The arithmetic logic updates the occupancy counter.

```verilog
slot_count <= slot_count + 1;
slot_count <= slot_count - 1;
```

```mermaid
flowchart LR
    A["Current Occupancy"] --> B["Incrementer: +1"]
    A --> C["Decrementer: -1"]
    B --> D["Next Occupancy"]
    C --> D
    D --> E["Occupancy Register"]
```

- **Incrementer:** increases the count for a valid entry.
- **Decrementer:** decreases the count for a valid exit.

## 6. Combinational Control Logic

The following conditions determine whether an entry or exit request is accepted.

```verilog
if (entry && !exit && (slot_count < 4))
```

```verilog
else if (exit && !entry && (slot_count > 0))
```

```mermaid
flowchart TD
    A["Entry and Exit Inputs"] --> B{"Entry only and count < 4?"}
    B -->|Yes| C["Increment Count"]
    B -->|No| D{"Exit only and count > 0?"}
    D -->|Yes| E["Decrement Count"]
    D -->|No| F["Keep Count Unchanged"]
```

Simultaneous entry and exit requests do not update the occupancy count in this implementation.

## 7. Gate-Control Logic

The `gate_open` output is set high for an accepted entry or exit request and cleared during normal operation otherwise.

```mermaid
flowchart TD
    A["Reset Active?"] -->|Yes| B["gate_open = 0"]
    A -->|No| C{"Valid Entry or Exit?"}
    C -->|Yes| D["gate_open = 1"]
    C -->|No| E["gate_open = 0"]
```

This output is a digital control signal. A physical gate motor would require additional driver and interface hardware.

 Instead, it uses a counter-based sequential controller with conditional control logic.

## 9. Digital Logic Summary

| Circuit / Concept | Purpose |
|---|---|
| 3-bit counter/register | Tracks occupied parking slots |
| Flip-flops | Store clocked values |
| Asynchronous reset | Initializes the controller |
| Comparators | Generate full, empty, and warning signals |
| Incrementer / decrementer | Update occupancy |
| Boolean control logic | Validate entry and exit requests |
| Gate-control register | Generates the gate command |

## 10. ASIC Implementation

The RTL is synthesized using Yosys and mapped to the SKY130 HD standard-cell library. The ASIC flow then uses OpenLane and OpenROAD for physical-design stages, with OpenSTA used for static timing analysis.

## 5.Tools, Languages and Linux Commands Used

## 1. Programming Languages

Language

Purpose

Verilog HDL

RTL design of the parking controller

Verilog Testbench

Functional verification of the RTL

Tcl

Automation and configuration of synthesis, physical design, and timing analysis

Linux Shell / Bash

Executing commands and managing project files

## 2. Tools Used in the Project

Tool

Purpose

Icarus Verilog

RTL and testbench simulation

GTKWave

Viewing simulation waveforms

Yosys

RTL synthesis and logic optimization

OpenLane

ASIC implementation flow

OpenROAD

Floorplanning, placement, clock-tree synthesis, and routing

OpenSTA

Static timing analysis

Magic

Layout inspection and physical-design visualization

SKY130 HD PDK

Standard-cell library and technology files

## 3. Linux Commands Used

The following commands help navigate directories, inspect RTL files, run simulations, execute synthesis tools, and organize project reports.

## 3.1 Directory Navigation

pwd
ls
ls -lh
cd ~/Desktop/four_slot_smart_parking

pwd — displays the current directory.

ls — lists files and directories.

ls -lh — displays file sizes in a readable format.

cd — changes the working directory.

## 3.2 Inspecting Project Files

find . -maxdepth 3 -type f
cat rtl/parking_controller.v
cat constraints/parking_controller.sdc

find — locates project files.

cat — displays RTL source and timing constraints.

constraints/parking_controller.sdc contains design timing constraints.

## 3.3 Creating and Organizing Directories

mkdir -p reports
mkdir -p synthesis
mkdir -p physical_design/images
mkdir -p sta

mkdir -p — creates directories, including parent directories when necessary.

These commands organize reports, synthesis outputs, physical-design images, and timing-analysis files.

## 3.4 RTL Simulation Using Icarus Verilog

From the project directory, compile the RTL and testbench:

iverilog -g2012 -o simulation.vvp \
  rtl/parking_controller.v \
  tb/tb_parking_controller.v

Run the simulation:

vvp simulation.vvp

View the waveform if the testbench generates a VCD file:

gtkwave parking_controller.vcd

The exact waveform filename depends on the $dumpfile statement in the testbench.

## 3.5 RTL Synthesis Using Yosys

A basic synthesis example is:

yosys

Inside the Yosys prompt:

read_verilog rtl/parking_controller.v
hierarchy -check -top parking_controller
proc
opt
check
stat

read_verilog — reads the RTL source.

hierarchy — checks the top-level design hierarchy.

proc — converts procedural RTL into internal logic.

opt — performs logic optimization.

check — checks for structural problems.

stat — displays synthesis statistics.

This is an illustrative RTL synthesis sequence. Technology mapping to SKY130 requires the appropriate library and synthesis configuration.

Exit Yosys:

exit

## 3.6 OpenLane Physical Design

# RTL Language: Verilog HDL
# Technology: SKY130 HD
# Physical Design Flow: OpenLane v0.21
# Physical Design Engine: OpenROAD

Navigate to the OpenLane installation:

cd ~/Desktop/work/tools/openlane_working_dir/openlane

Inspect the available design directories:

ls designs

A typical OpenLane flow invocation is:

./flow.tcl -design smart_parking

The design name must match the actual OpenLane configuration directory. Your earlier project run used smart_parking; the separate project workspace is four_slot_smart_parking.


OpenLane automates multiple ASIC implementation stages, including synthesis, floorplanning, placement, clock-tree synthesis, routing, and design checks, depending on the configuration and flow version.

## Physical Design Stages and Commands

OpenLane supports interactive execution of individual stages. These Tcl commands are entered inside the OpenLane interactive shell, not directly at the normal Linux terminal. See the OpenLane interactive-mode documentation.

## Start Interactive Mode

./flow.tcl -interactive

Inside the OpenLane Tcl shell:

package require openlane
prep -design smart_parking

Use the appropriate existing run tag or configuration if you need to resume or inspect a particular run.

## Synthesis

run_synthesis

Purpose: Converts RTL into a synthesized gate-level netlist and maps logic to the target standard-cell library.

## Floorplanning and Power Planning

run_floorplan

Purpose: Establishes the core area, placement rows, pin locations, and power-distribution setup according to the design configuration.

## Placement

run_placement

Purpose: Places standard cells within the floorplan and performs placement-related optimization.

## Clock Tree Synthesis (CTS)

run_cts

Purpose: Builds the clock distribution network for sequential cells.

## Routing

run_routing

Purpose: Connects the placed standard cells through the routing layers while observing design rules and routing constraints.

## Physical Verification and Layout Generation

Depending on the configuration, OpenLane provides commands such as:

run_magic
run_magic_drc
run_lvs
run_antenna_check

Purpose:

run_magic — performs Magic-related layout operations in the configured flow.

run_magic_drc — runs a design-rule check using Magic.

run_lvs — checks layout-versus-schematic consistency.

run_antenna_check — checks for antenna-rule violations.

The commands above are available in the documented OpenLane interactive flow, but configuration settings can disable particular stages.

## Physical Design Flow Summary

Stage

Command

Purpose

Synthesis

run_synthesis

Generate the mapped netlist

Floorplanning

run_floorplan

Define the physical floorplan

Placement

run_placement

Place standard cells

CTS

run_cts

Build the clock network

Routing

run_routing

Route signal connections

DRC

run_magic_drc

Check layout design rules

LVS

run_lvs

Compare layout and schematic connectivity.


# Static Timing Analysis (STA)

## 1. Introduction

Static Timing Analysis (STA) verifies whether the digital design satisfies its timing constraints without applying simulation input vectors. This project uses OpenSTA and the SKY130 HD standard-cell library to analyze setup timing, hold timing, slack, and timing violations.

## 2. Tools Used

- **OpenSTA** — static timing analysis.
- **SKY130 HD Liberty files** — standard-cell timing models.
- **Verilog netlist** — synthesized or physically implemented design.
- **SDC** — clock and input/output timing constraints.
- **SPEF** — extracted parasitic information for post-route timing analysis, when available.

## 3. Locate STA Reports

Navigate to the OpenLane directory:

```bash
cd ~/Desktop/work/tools/openlane_working_dir/openlane
```

Find timing reports:

```bash
find designs/smart_parking/runs -type f \
  \( -iname '*sta*' -o -iname '*slack*' -o -iname '*tns*' \)
```

Search for setup and hold timing results:

```bash
grep -R -n -E 'Startpoint:|Endpoint:|slack|wns|tns' \
  designs/smart_parking/runs/
```

## 4. Run OpenSTA

OpenSTA can be launched from the terminal using:

```bash
sta
```

Inside the OpenSTA prompt, load the timing library, mapped netlist, design constraints, and parasitics as applicable.

```tcl
read_liberty path/to/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog path/to/parking_controller_sky130.v
link_design parking_controller
read_sdc path/to/parking_controller.sdc
```

For post-route analysis, load the matching parasitic file after linking the design:

```tcl
read_spef path/to/parking_controller.spef
```

The paths and file names must match the actual project outputs. Use the correct Liberty corner and matching parasitics for the analysis being performed.

## 5. Timing Reports

```tcl
report_checks
report_worst_slack
report_tns
```

These reports help inspect timing paths, worst slack, and total negative slack. Command availability can vary with the installed OpenSTA version.

## 6. Timing Concepts

| Metric | Meaning |
|---|---|
| Setup slack | Measures whether data arrives before the required setup time |
| Hold slack | Measures whether data remains stable long enough after the clock edge |
| WNS | Worst negative slack, conventionally the most negative setup slack |
| TNS | Total negative slack across violating setup paths |
| PVT corners | Different process, voltage, and temperature conditions |

Positive slack generally indicates that a checked path meets its timing requirement. Negative slack indicates a timing violation.

## 7. Multi-Corner Timing Analysis

The project can be analyzed at different PVT corners using the corresponding SKY130 HD Liberty files, such as:

- **TT:** Typical process, typical operating conditions.
- **SS:** Slow process corner.
- **FF:** Fast process corner.

The exact voltage and temperature depend on the selected Liberty file. Each corner must use a compatible library and appropriate timing configuration.






