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
   ## Figure 1:
<img width="1600" height="901" alt="WhatsApp Image 2026-10-12 at 12 15 15 AM" src="https://github.com/user-attachments/assets/46f6ab2f-546b-48af-adc7-1727b25b9d02" />
<img width="1600" height="899" alt="WhatsApp Image 2026-10-12 at 12 15 24 AM" src="https://github.com/user-attachments/assets/39b54387-e9d8-4ff8-b352-01369d3ba668" />
<img width="1600" height="899" alt="WhatsApp Image 2026-10-12 at 12 15 32 AM" src="https://github.com/user-attachments/assets/603655fe-250f-4594-a7d6-74bf30ec0b9a" />
<img width="1600" height="897" alt="WhatsApp Image 2026-10-12 at 12 15 43 AM" src="https://github.com/user-attachments/assets/bc947fa8-fb71-4885-87bf-473003502343" />
<img width="1600" height="900" alt="WhatsApp Image 2026-10-12 at 12 15 53 AM" src="https://github.com/user-attachments/assets/dbe2a8e8-313f-4181-b42c-86bea658aa3c" />
<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/1e7d4ce5-811d-4e9a-820d-c64892372742" />
<img width="1600" height="903" alt="image" src="https://github.com/user-attachments/assets/f5684d5a-46a0-4788-980e-5a39c453c7ec" />
<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/e43c83d2-ec57-480e-9044-87e62fb6e89f" />
<img width="1600" height="898" alt="image" src="https://github.com/user-attachments/assets/ff4c7717-d2c6-4d00-b7b8-82418396f2ff" />
<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/782bbccc-1765-4cb9-82cb-c94c301f4699" />


## Figure1: Synthesis

<img width="1600" height="899" alt="WhatsApp Image 2026-10-12 at 12 17 45 AM" src="https://github.com/user-attachments/assets/2f555ea5-a914-4b2c-84e2-b51e435727ba" />

# figure2: Floorplan

<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/ddc6d0a3-b255-4b18-9766-f04d1e06f4da" />
<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/e440d0c7-a59e-49ed-b577-af2a9184e67b" />
<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/daf63ecd-fd6c-4308-9fff-4076ba16adb3" />
<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/4fedb320-dcca-4729-bd90-ed13a31b72a2" />

<img width="1600" height="912" alt="image" src="https://github.com/user-attachments/assets/fb9c9aaa-fef4-4a3c-96cb-495c45b18f04" />

<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/092964d4-af6b-41bc-a0a8-9f51ef13d742" />

<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/f45fc6a4-0ce7-4220-bd29-0c19fd7478e7" />

## Cts(Clock tree Synthesis):

<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/3fb00cfc-a16c-434c-a0ac-bdb066768785" />

<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/5e2d4e6a-6241-40df-9086-8ab1a8c44afc" />

<img width="1600" height="898" alt="image" src="https://github.com/user-attachments/assets/27b48c46-6c9c-416e-81ce-012e5faf017b" />

<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/d1089f0d-37b7-4b40-8550-e11a3c345c36" />

## Routing:
<img width="923" height="636" alt="image" src="https://github.com/user-attachments/assets/3f8b73d8-0e90-46b6-9e73-4cce138bfe70" />

<img width="987" height="646" alt="image" src="https://github.com/user-attachments/assets/c8f51cd5-531c-4d14-b475-899b32e96673" />


  
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
 ## STA
The source-file paths, platform settings, timing constraints, and required library files must be consistent with the selected flow configuration.

Non-negative hold slack indicates that the reported check meets its hold requirement.

Negative hold slack indicates a hold timing violation.

Worst Negative Slack (WNS)

WNS represents the worst slack among the relevant analyzed timing paths. Its interpretation depends on the timing check and path group being reported.

Total Negative Slack (TNS)

TNS represents the accumulated negative slack for the relevant timing paths. A zero TNS generally indicates that no negative slack was accumulated for the reported path group and timing check.
## Figure:
<img width="1600" height="900" alt="WhatsApp Image 2026-10-10 at 11 29 45 PM" src="https://github.com/user-attachments/assets/d996748d-5fb4-481a-bc19-84c87c51d2d8" />





## PVT Corners

PVT stands for Process, Voltage, and Temperature.

Different process models, supply voltages, and temperatures affect cell and interconnect delays. Multi-corner timing analysis helps identify the conditions under which setup or hold timing becomes critical.

## STA Procedure

Identify the implementation stage being analyzed.

Load the matching technology and applicable macro timing libraries.

Read the corresponding netlist or physical-design database.

Apply the correct SDC timing constraints.

Load suitable parasitic information when available.

Verify clock definitions and timing constraints.

Run setup and hold timing analysis.

Review WNS, TNS, critical paths, and electrical violations.

Save the reports and record the implementation stage.

## Illustrative OpenROAD Tcl Commands

The following commands show the general analysis pattern. Paths must match the actual run directory and implementation stage.

read_db ./results/sky130hd/vsdbabysoc/base/5_route.odb
read_sdc ./results/sky130hd/vsdbabysoc/base/5_route.sdc
source ./platforms/sky130hd/setRC.tcl

report_checks -path_delay max
report_checks -path_delay min

These commands alone do not guarantee complete multi-corner analysis. The appropriate timing libraries, parasitics, and corner-specific settings must also be loaded. Use the actual run configuration when reproducing the results.

## 8. Multi-Corner Timing Results
<img width="720" height="514" alt="WhatsApp Image 2026-10-10 at 11 42 29 PM (2)" src="https://github.com/user-attachments/assets/73710fa5-27bf-499e-ae2e-3f7c08b74e53" />


## STA results

<img width="720" height="436" alt="WhatsApp Image 2026-10-10 at 11 42 29 PM (1)" src="https://github.com/user-attachments/assets/b347d10e-2d7a-4ff5-a546-d888e1df962a" />



## 8.2 Setup Timing Observations

Five corners show negative setup slack.


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

## Figure 1:
<img width="1600" height="866" alt="WhatsApp Image 2026-10-10 at 11 28 05 PM" src="https://github.com/user-attachments/assets/5633cef3-5739-427d-952d-63d2d09d93cd" />


## Figure 2: 
<img width="1600" height="866" alt="WhatsApp Image 2026-10-10 at 11 28 27 PM" src="https://github.com/user-attachments/assets/34ed7d24-0955-4274-8179-087dd14c5899" />


## Figure 3: Terminal output showing setup and hold slack values for the supplied corner reports.

## Figure 4: OpenROAD GUI showing the routed VSDBabySoC layout and timing-report interface.

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

## figure: congestion error
<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/31914c45-f6b6-45ad-b316-0492f486fc6e" />

<img width="1600" height="899" alt="image" src="https://github.com/user-attachments/assets/447afb40-d9f5-4b47-8641-c7234cb9992d" />

<img width="940" height="977" alt="image" src="https://github.com/user-attachments/assets/cdbcd5b5-3c77-49e6-abbe-3342011d09ba" />

<img width="1600" height="460" alt="image" src="https://github.com/user-attachments/assets/5a0b6775-ca1c-4773-9dc9-0d8142b26cf2" />


## Finally I solved this through this for global routing before actual routing
<img width="1600" height="894" alt="image" src="https://github.com/user-attachments/assets/267b6b2b-947d-4cc2-8ef7-e93633851f54" />
and using this file also
<img width="1600" height="620" alt="image" src="https://github.com/user-attachments/assets/6d49a017-77ee-4951-90d3-ceec17a8b65a" />

<img width="1600" height="893" alt="image" src="https://github.com/user-attachments/assets/da2bd5cd-85ac-4b60-ada4-639a0de5eebb" />
## Finally: Routing 
<img width="987" height="646" alt="image" src="https://github.com/user-attachments/assets/b56a73e6-e15a-477e-8b67-0e95c2b719f3" />
# After that Sta:
<img width="720" height="436" alt="WhatsApp Image 2026-10-10 at 11 42 29 PM (1)" src="https://github.com/user-attachments/assets/a059e5c8-9c5c-4a7f-bd4c-ba7b921bce7c" />


## conclusion

The VSDBabySoC project demonstrates the major stages of RTL-to-GDSII physical design and the role of Static Timing Analysis in evaluating timing behaviour across multiple PVT corners.

Of the 16 listed PVT corners, five show negative setup slack. The worst reported setup slack is -29.05 ns at ss_n40C_1v28. All listed hold-slack values are positive, ranging from 0.19 ns to 1.68 ns.

The next debugging priority is to inspect the failing setup paths, verify corner-specific constraints and parasitics, and repeat timing analysis after any corrective changes. Final timing closure should be claimed only after the relevant violations are corrected and the resulting reports confirm that the required checks pass.
