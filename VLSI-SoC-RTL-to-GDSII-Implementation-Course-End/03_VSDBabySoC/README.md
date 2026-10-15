# VSDBabySoC Physical Design Implementation

## 1. Introduction

VSDBabySoC is a small mixed-signal System-on-Chip (SoC) design that integrates a RISC-V processor, a Phase-Locked Loop (PLL), and a Digital-to-Analog Converter (DAC).

This project focuses on understanding the RTL-to-GDSII physical design flow using the SKY130HD technology platform and OpenROAD-based tools.

## 2. Objectives

- Understand the RTL-to-GDSII implementation flow.
- Configure the VSDBabySoC design for the SKY130HD platform.
- Perform synthesis and analyze the generated netlist.
- Study floorplanning, placement, and Clock Tree Synthesis (CTS).
- Analyze routing congestion and timing reports.
- Debug configuration, file-path, and flow-execution errors.
- Document the implementation results and limitations.

## 3. Design Overview

| Parameter | Details |
|---|---|
| Design | VSDBabySoC |
| Design Type | Mixed-signal SoC |
| Processor | RVMYTH RISC-V |
| Technology | SKY130HD |
| Physical Design Flow | OpenROAD |
| Synthesis Tool | Yosys |
| Timing Analysis | OpenSTA |
| Main Objective | RTL-to-GDSII implementation and timing analysis |

## 4. Design Architecture

### 4.1 RVMYTH Processor

The RVMYTH processor forms the processing unit of the SoC and executes the supported RISC-V instructions.

### 4.2 Phase-Locked Loop (PLL)

The PLL provides clock-generation functionality for the SoC. Its implementation depends on the supplied PLL model and integration configuration.

### 4.3 Digital-to-Analog Converter (DAC)

The DAC converts digital input values into an analog representation. It is integrated as a separate block in the mixed-signal design.

## 5. Tools and Technologies

- Linux
- Git and GitHub
- Yosys
- OpenROAD
- OpenSTA
- SKY130HD PDK
- Verilog and SystemVerilog
- Tcl and SDC constraints

## 6. RTL-to-GDSII Flow

The physical design flow consists of the following stages:

1. RTL source and configuration-file verification
2. Logic synthesis
3. Floorplanning
4. Standard-cell placement
5. Clock Tree Synthesis (CTS)
6. Global routing and detailed routing
7. Static Timing Analysis (STA)
8. Final report review









  
The completion status of each stage must be determined from the corresponding tool logs and generated reports.

## 7. Design Configuration

The VSDBabySoC design files were integrated into the OpenROAD flow directory for the SKY130HD platform.

The design configuration includes:

- `config.mk` — design and platform configuration
- `config.tcl` — Tcl-based flow settings
- `vsdbabysoc_synthesis.sdc` — timing constraints
- `src/` — RTL and supporting source files
- `lef/` — physical library and macro abstracts
- `lib/` — timing library files
- `gds/` — supplied layout data, where applicable
- `macro.cfg` and `macro.tcl` — macro-related configuration, where required by the flow

The source-file paths, platform settings, timing constraints, and required library files must be consistent with the selected flow configuration.

Non-negative hold slack indicates that the reported check meets its hold requirement.

Negative hold slack indicates a hold timing violation.

Worst Negative Slack (WNS)

WNS represents the worst slack among the relevant analyzed timing paths. Its interpretation depends on the timing check and path group being reported.

Total Negative Slack (TNS)

TNS represents the accumulated negative slack for the relevant timing paths. A zero TNS generally indicates that no negative slack was accumulated for the reported path group and timing check.

7.3 PVT Corners

PVT stands for Process, Voltage, and Temperature.

Different process models, supply voltages, and temperatures affect cell and interconnect delays. Multi-corner timing analysis helps identify the conditions under which setup or hold timing becomes critical.

7.4 STA Procedure

Identify the implementation stage being analyzed.

Load the matching technology and applicable macro timing libraries.

Read the corresponding netlist or physical-design database.

Apply the correct SDC timing constraints.

Load suitable parasitic information when available.

Verify clock definitions and timing constraints.

Run setup and hold timing analysis.

Review WNS, TNS, critical paths, and electrical violations.

Save the reports and record the implementation stage.

7.5 Illustrative OpenROAD Tcl Commands

The following commands show the general analysis pattern. Paths must match the actual run directory and implementation stage.

read_db ./results/sky130hd/vsdbabysoc/base/5_route.odb
read_sdc ./results/sky130hd/vsdbabysoc/base/5_route.sdc
source ./platforms/sky130hd/setRC.tcl

report_checks -path_delay max
report_checks -path_delay min

These commands alone do not guarantee complete multi-corner analysis. The appropriate timing libraries, parasitics, and corner-specific settings must also be loaded. Use the actual run configuration when reproducing the results.

8. Multi-Corner Timing Results

The following values are transcribed from the supplied timing evidence. Slack values are in nanoseconds (ns).

Assessment details

Item

Details

Assessment Date

10/10/2026

Design

VSDBabySoC

Top Module

vsdbabysoc

## Physical Design / Timing Tool

OpenROAD GUI / OpenROAD-flow-scripts

Technology

SkyWater SKY130 HD

PVT Timing Corners

16

8.1 Setup and Hold Slack

PVT Corner

Setup Slack (ns)

Hold Slack (ns)

ff_100C_1v65

8.15

0.25

ff_100C_1v95

9.03

0.20

ff_n40C_1v56

6.91

0.29

ff_n40C_1v65

7.62

0.25

ff_n40C_1v76

8.24

0.23

ff_n40C_1v95

8.94

0.19

ss_100C_1v40

-2.72

0.89

ss_100C_1v60

2.10

0.63

ss_n40C_1v28

-29.05

1.68

ss_n40C_1v35

-15.57

1.25

ss_n40C_1v40

-9.98

1.05

ss_n40C_1v44

-6.71

0.94

ss_n40C_1v60

0.43

0.63

ss_n40C_1v76

3.73

0.48

tt_025C_1v80

7.13

0.31

tt_100C_1v80

7.26

0.31

## 8.2 Setup Timing Observations

Five corners show negative setup slack.

PVT Corner

Setup Slack (ns)

ss_n40C_1v28

-29.05

ss_n40C_1v35

-15.57

ss_n40C_1v40

-9.98

ss_n40C_1v44

-6.71

ss_100C_1v40

-2.72

The most severe reported setup result is -29.05 ns at ss_n40C_1v28. This corner should be investigated first by inspecting its critical timing paths.

## 8.3 Hold Timing Observations

All 16 listed hold-slack values are positive.

Minimum hold slack: 0.19 ns at ff_n40C_1v95.

Maximum hold slack: 1.68 ns at ss_n40C_1v28.

These values indicate that the reported worst hold checks meet their timing requirements, subject to verification of the corresponding constraints and analysis setup.

## 8.4 Overall Interpretation

The supplied results indicate that setup timing is the primary concern in the five failing corners. Positive hold slack does not, by itself, establish that the entire design meets all timing and electrical requirements.

## 8.5 Timing Graphs and Evidence

The supplied graphs compare setup and hold slack across the 16 PVT corners.

Figure 1: Hold slack versus PVT corners.

Figure 2: Worst setup slack versus PVT corners.

Figure 3: Terminal output showing setup and hold slack values for the supplied corner reports.

Figure 4: OpenROAD GUI showing the routed VSDBabySoC layout and timing-report interface.

Include the corresponding graphs and screenshots in the repository if they are available. Do not label a layout as post-route unless routing completion is confirmed by the run evidence.

## 9. Problems and Debugging

## 9.1 Negative Setup Slack

Observed issue: Five PVT corners report negative setup slack, with the worst value at ss_n40C_1v28.

Debugging procedure:

Select the corner with the most negative setup slack.

Generate a detailed maximum-delay timing report.

Identify the path startpoint and endpoint.

Examine cell delay, net delay, clock arrival time, and required arrival time.

Verify that the corner uses the correct timing libraries and constraints.

Consider optimization only after identifying the actual cause of the violation.

Observation: The measured slack values identify the failing corners, but do not independently establish the root cause of each violation.

## 9.2 Multi-Corner Result Verification

Potential issue: Timing values can be misleading if the wrong Liberty files, SDC constraints, or parasitic data are used.

Debugging procedure:

Verify the corner-specific timing libraries.

Confirm voltage and temperature settings.

Check the clock period and I/O constraints.

Verify that the database and parasitic data correspond to the intended stage.

Compare the extracted values with the original timing reports.

## 9.3 Routing Congestion During Physical Design

Observed issue: Earlier flow logs reported routing overflow and repeated routability iterations without sufficient improvement.

Debugging procedure:

Inspect the global-routing log.

Review overflowed tiles and congestion metrics.

Examine placement density and routability optimization results.

Verify the final routing-stage status before treating the design as successfully routed.

Confirm that the timing database and parasitic information used for STA correspond to the implementation stage being documented.

## 9.4 Configuration or File-Path Errors

Potential issue: The flow may stop when a required file is missing, a path is incorrect, or a configuration variable is not set.

Debugging procedure:

Verify the current working directory.

Check the existence of the required RTL, SDC, Liberty, LEF, and configuration files.

Inspect the flow configuration and referenced paths.

Read the first meaningful error in the tool log.

Correct the identified configuration issue and rerun the affected stage.

Confirm completion using the generated logs and output files.

## conclusion

The VSDBabySoC project demonstrates the major stages of RTL-to-GDSII physical design and the role of Static Timing Analysis in evaluating timing behaviour across multiple PVT corners.

Of the 16 listed PVT corners, five show negative setup slack. The worst reported setup slack is -29.05 ns at ss_n40C_1v28. All listed hold-slack values are positive, ranging from 0.19 ns to 1.68 ns.

The next debugging priority is to inspect the failing setup paths, verify corner-specific constraints and parasitics, and repeat timing analysis after any corrective changes. Final timing closure should be claimed only after the relevant violations are corrected and the resulting reports confirm that the required checks pass.
