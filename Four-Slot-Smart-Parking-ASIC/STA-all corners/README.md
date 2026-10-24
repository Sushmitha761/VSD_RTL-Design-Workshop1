# Four-Slot Smart Parking ASIC
## Static Timing Analysis — Commands Reference

Technology: SKY130 HD  
Design: parking_controller  
Clock period: 10 ns  
Target clock frequency: 100 MHz  
STA tool: OpenSTA  
Implementation flow: OpenLane

### 1. Navigate to the project

```bash
cd ~/Desktop/work/tools/openlane_working_dir/openlane
```

### 2. List available OpenLane runs

```bash
ls -lt designs/smart_parking/runs/
```

Select the correct run directory before collecting final results.

### 3. Find timing reports

```bash
find designs/smart_parking/runs/ -type f \
  \( -iname '*sta*.rpt' -o -iname '*wns*.rpt' \
  -o -iname '*tns*.rpt' -o -iname '*timing*.rpt' \)
```

### 4. Find extracted parasitic and timing files

```bash
find designs/smart_parking/runs/ -type f \
  \( -iname '*.spef' -o -iname '*.sdc' \
  -o -iname '*.lib' -o -iname '*.v' \)
```

### 5. Search reports for slack and timing violations

```bash
grep -RniE 'slack|wns|tns|setup|hold|violation' \
  designs/smart_parking/runs/ 2>/dev/null | head -100
```

### 6. Identify the PVT libraries

Typical SKY130 HD libraries used in this project:

- TT: sky130_fd_sc_hd__tt_025C_1v80
- SS: sky130_fd_sc_hd__ss_100C_1v60
- FF: sky130_fd_sc_hd__ff_n40C_1v95

Confirm the exact filenames in the installed PDK before running analysis.

### 7. Timing analysis requirements

For each corner, collect:

- Worst setup slack
- Worst hold slack
- Setup WNS
- Setup TNS
- Hold WNS and TNS, if reported
- Worst setup path
- Worst hold path
- Maximum and minimum path delay, where applicable

### 8. Important verification rule

Use the final RTL, final SDC, matching standard-cell timing library, and matching implementation data.

For post-route analysis, use the extracted parasitics from the same physical-design run.

Do not combine timing results from different runs without clearly identifying the run and its configuration.

Do not label historical results as final signoff results until they have been verified.







# FOUR-SLOT SMART PARKING OCCUPANCY AND GATE CONTROLLER ASIC
## Static Timing Analysis (STA) Report

**Technology:** SKY130 HD  
**Design Module:** `parking_controller`  
**STA Tool:** OpenSTA  
**Physical Design Flow:** OpenLane  
**Clock Period:** 10 ns  
**Target Clock Frequency:** 100 MHz  
**Analysis Type:** Setup, Hold and Multi-Corner Timing Analysis

**Report Status:** Draft — Final timing verification pending

---

## 1. Abstract

This report presents the Static Timing Analysis (STA) methodology and previously recorded timing results for the Four-Slot Smart Parking Occupancy and Gate Controller ASIC.

The design monitors parking occupancy for a facility containing four parking slots. It updates the occupancy count using vehicle entry and exit signals and generates status outputs indicating whether the parking area is empty, approaching full capacity, or full.

Static Timing Analysis is used to evaluate the timing behavior of the digital circuit under specified clock and input/output constraints. The report documents setup slack, hold slack, Worst Negative Slack (WNS), Total Negative Slack (TNS), and multi-corner timing analysis.

The timing values included in this draft are historical results. They must be verified against the final RTL, timing constraints, and physical-design run before final signoff.

## 2. Project Overview

### 2.1 Objective

The objective is to design and verify a digital parking occupancy controller that maintains the number of occupied parking slots and generates appropriate status and gate-control signals.

### 2.2 RTL Inputs

| Signal | Description |
|---|---|
| `clk` | Clock input |
| `reset` | Reset input |
| `entry` | Vehicle entry request |
| `exit` | Vehicle exit request |

### 2.3 RTL Outputs

| Signal | Description |
|---|---|
| `slot_count[2:0]` | Number of occupied parking slots |
| `warning` | Indicates occupancy of three or more slots |
| `full` | Indicates that all four slots are occupied |
| `empty` | Indicates that no slots are occupied |
| `gate_open` | Gate-control output |

## 3. Tools and Technology

| Tool or component | Purpose |
|---|---|
| Verilog | RTL description |
| Icarus Verilog | Functional simulation |
| Yosys | Logic synthesis |
| OpenLane | ASIC implementation flow |
| OpenSTA | Static Timing Analysis |
| SKY130 HD | Standard-cell technology |
| Liberty (`.lib`) | Cell timing models |
| SDC (`.sdc`) | Timing constraints |
| SPEF (`.spef`) | Extracted parasitic data for post-route timing analysis |

## 4. Timing Constraints

The previously documented timing constraints are:

| Parameter | Value |
|---|---:|
| Clock period | 10.0 ns |
| Target clock frequency | 100 MHz |
| Clock uncertainty | 0.2 ns |
| Input delay | 1.0 ns |
| Output delay | 1.0 ns |

The clock frequency corresponding to a 10 ns clock period is 100 MHz.

The input and output delays define timing budgets at the design boundaries. Clock uncertainty accounts for the margin specified in the timing constraints.

The final report must be checked against the actual SDC file used in the selected implementation run.

## 5. Static Timing Analysis Methodology

Static Timing Analysis evaluates timing paths without requiring simulation of every possible input sequence.

The analysis includes the following checks:

1. Setup timing analysis.
2. Hold timing analysis.
3. Worst setup and hold slack.
4. WNS and TNS.
5. Multi-corner analysis under different process, voltage, and temperature conditions.
6. Post-route analysis using extracted parasitic data, where available.

### 5.1 Setup Timing

Setup analysis checks whether data reaches the destination register early enough to satisfy the required setup time.

Positive setup slack indicates that the analyzed path meets its setup requirement under the reported conditions.

### 5.2 Hold Timing

Hold analysis checks whether data remains stable for the required time after the active clock edge.

Positive hold slack indicates that the analyzed path meets its hold requirement under the reported conditions.

### 5.3 WNS and TNS

**Worst Negative Slack (WNS)** represents the worst timing slack reported for a set of paths. Negative slack indicates a timing violation.

**Total Negative Slack (TNS)** represents the accumulated negative slack across violating paths. A TNS of zero indicates that no negative slack is accumulated for the reported analysis group.

The exact WNS and TNS values must be taken from the final STA reports rather than inferred from a separate slack summary.

## 6. Multi-Corner Timing Results

The following table contains previously recorded results. These values are included for documentation purposes and have not yet been verified against the final RTL and implementation run.

| PVT corner | Temperature | Voltage | Setup slack (ns) | Hold slack (ns) | Recorded TNS (ns) |
|---|---:|---:|---:|---:|---:|
| TT | 25°C | 1.80 V | +7.619 | +0.374 | 0.00 |
| SS | 100°C | 1.60 V | +6.247 | +0.407 | 0.00 |
| FF | −40°C | 1.95 V | +8.084 | +0.150 | 0.00 |

**Data status:** Historical results — final verification required.

### 6.1 TT Corner

The TT corner represents typical process conditions at 25°C and 1.80 V.

Previously recorded setup slack was +7.619 ns, and hold slack was +0.374 ns. The recorded TNS was 0.00 ns.

### 6.2 SS Corner

The SS corner represents slow process conditions at 100°C and 1.60 V.

Previously recorded setup slack was +6.247 ns, and hold slack was +0.407 ns. The recorded TNS was 0.00 ns.

Among the three listed corners, SS had the lowest recorded setup slack.

### 6.3 FF Corner

The FF corner represents fast process conditions at −40°C and 1.95 V.

Previously recorded setup slack was +8.084 ns, and hold slack was +0.150 ns. The recorded TNS was 0.00 ns.

Among the three listed corners, FF had the lowest recorded hold slack.

## 7. WNS and TNS Summary

The previous records include positive setup and hold slack at all three listed corners.

However, the exact WNS and TNS reporting conventions must be confirmed from the original OpenSTA output. A positive worst slack is not itself a negative WNS; some reports display worst slack, while others explicitly report WNS.

| Corner | Previously recorded setup slack | Previously recorded hold slack | Final WNS/TNS verification |
|---|---:|---:|---|
| TT | +7.619 ns | +0.374 ns | Pending |
| SS | +6.247 ns | +0.407 ns | Pending |
| FF | +8.084 ns | +0.150 ns | Pending |

Separate setup and hold WNS/TNS values should be included when the final reports provide them.

## 8. Timing Graphs

The final report should include graphs generated from the verified timing data:

### 8.1 Setup Slack by Corner
A comparison of setup slack across TT, SS, and FF corners.

### 8.2 Hold Slack by Corner
A comparison of hold slack across TT, SS, and FF corners.

### 8.3 WNS by Corner
A graph showing the actual reported WNS for each analyzed corner.

### 8.4 TNS by Corner
A graph showing the actual reported TNS for each analyzed corner.

**Note:** Graphs must be generated from verified timing reports. No new graph data is claimed in this draft.

## 9. Physical Design and Post-Route STA

The OpenLane flow can include synthesis, floorplanning, placement, clock-tree synthesis, routing, parasitic extraction, and timing analysis.

For final post-route STA, the timing analysis should use the implementation data, timing constraints, standard-cell libraries, and extracted parasitics belonging to the same run.

The following results should be recorded from the final implementation:

| Verification item | Final result |
|---|---|
| Synthesis | Verify final run |
| Placement | Verify final run |
| Clock-tree synthesis | Verify final run |
| Routing | Verify final run |
| Parasitic extraction | Verify final run |
| Post-route STA | Verify final run |
| DRC | Verify final run |
| LVS | Verify final run |
| Antenna checks | Verify final run |

Previously reported DRC and LVS results belong to an earlier run and should not be treated as signoff for a later modified design without verification.

## 10. Discussion

The previously recorded data shows positive setup and hold slack across TT, SS, and FF corners, with TNS recorded as zero.

The SS corner had the lowest setup slack, while the FF corner had the lowest hold slack in the historical results.

These observations describe the recorded run only. A reliable final conclusion requires confirmation that the RTL, constraints, timing libraries, and implementation data match the final design.

## 11. Conclusion

This report documents the STA methodology for the Four-Slot Smart Parking Occupancy and Gate Controller ASIC.

The historical results provide a reference for setup timing, hold timing, and multi-corner analysis. Final timing closure cannot be claimed until the results have been regenerated or verified against the final RTL and physical-design run.
The completed report should include the final OpenSTA reports, verified WNS/TNS values, worst setup and hold paths, timing graphs, and relevant physical-design verification results.
<img width="1855" height="650" alt="Screenshot 2026-10-21 171513" src="https://github.com/user-attachments/assets/944033b3-103f-4499-9077-93fd769ec6b5" />

<img width="1917" height="1078" alt="Screenshot 2026-10-21 200910" src="https://github.com/user-attachments/assets/70940658-b119-4f59-8f32-b9d2606fbe10" />


<img width="956" height="991" alt="Screenshot 2026-10-21 194012" src="https://github.com/user-attachments/assets/72482865-8827-43c9-aad3-e187ffdb620b" />


<img width="1917" height="1078" alt="Screenshot 2026-10-21 202532" src="https://github.com/user-attachments/assets/a5077e61-cb70-4d79-a01c-15cea4bd23a2" />



<img width="1917" height="1078" alt="Screenshot 2026-10-21 202545" src="https://github.com/user-attachments/assets/0eb59b62-481f-45a6-a170-e7cc1c9bf317" />



<img width="1867" height="992" alt="Screenshot 2026-10-21 202633" src="https://github.com/user-attachments/assets/57fd4e50-2844-4fdd-bfdc-e4acf1bf30f7" />




<img width="1856" height="830" alt="Screenshot 2026-10-21 202644" src="https://github.com/user-attachments/assets/2060a4ae-2610-4bb1-9346-be9f1e36c908" />



<img width="1862" height="691" alt="Screenshot 2026-10-21 202659" src="https://github.com/user-attachments/assets/8e603dc0-91ce-4b29-87dd-0d4d885f6694" />



<img width="1857" height="572" alt="Screenshot 2026-10-21 202713" src="https://github.com/user-attachments/assets/e5febb6d-9589-4e8c-8d3d-a15fd541667e" />




<img width="1831" height="582" alt="Screenshot 2026-10-21 202726" src="https://github.com/user-attachments/assets/4b5e2afd-c51f-4956-a0c7-6b752545cfa4" />



<img width="1852" height="597" alt="Screenshot 2026-10-21 202744" src="https://github.com/user-attachments/assets/d578e282-f39f-4077-84bd-df3223a5ca2b" />


<img width="1847" height="817" alt="Screenshot 2026-10-21 202800" src="https://github.com/user-attachments/assets/5be36149-2503-48c4-8953-1c777f1478c0" />




<img width="1441" height="1015" alt="Screenshot 2026-10-21 202813" src="https://github.com/user-attachments/assets/3ccbf941-d3c1-4059-9a96-09e6460311e6" />



<img width="956" height="991" alt="Screenshot 2026-10-21 194012" src="https://github.com/user-attachments/assets/8726f880-1b72-4a88-904d-0ba4e94d4426" />




<img width="1857" height="867" alt="Screenshot 2026-10-21 202831" src="https://github.com/user-attachments/assets/9b44c0d1-fa69-4a04-850c-65d562bb8c90" />

<img width="1853" height="863" alt="Screenshot 2026-10-21 202845" src="https://github.com/user-attachments/assets/24288894-7d54-4db0-8a95-db71dac658b3" />


<img width="1917" height="1075" alt="Screenshot 2026-10-21 222618" src="https://github.com/user-attachments/assets/ddef8443-b012-4c3a-af02-816f62535cc3" />



<img width="1917" height="1078" alt="Screenshot 2026-10-21 222627" src="https://github.com/user-attachments/assets/87b3e273-548c-4498-9c96-f5dc4c240d97" />



<img width="1917" height="1078" alt="Screenshot 2026-10-21 222653" src="https://github.com/user-attachments/assets/9fa31b04-380b-41e2-a337-70a0c4f397aa" />

<img width="1850" height="825" alt="Screenshot 2026-10-21 222707" src="https://github.com/user-attachments/assets/c98b528c-a9fd-4c1b-bd77-60040ca6bd1a" />


<img width="1917" height="1078" alt="Screenshot 2026-10-21 222938" src="https://github.com/user-attachments/assets/3dd02c23-639f-434f-90f6-66f25cbc9abd" />


### lib

<img width="1857" height="886" alt="Screenshot 2026-10-21 223145" src="https://github.com/user-attachments/assets/99f40443-1c98-4c4f-993b-8ddf25340590" />


<img width="1848" height="877" alt="Screenshot 2026-10-21 223254" src="https://github.com/user-attachments/assets/e4343fd7-1f51-4bae-bdc7-5dea5c0f493a" />


<img width="1848" height="717" alt="Screenshot 2026-10-21 224634" src="https://github.com/user-attachments/assets/79bab60b-578b-49e7-90d1-c21e96b841c1" />


###  multilpe Graphs

<img width="1917" height="1078" alt="Screenshot 2026-10-24 093312" src="https://github.com/user-attachments/assets/64b50f1a-716b-4500-b453-a14127e4518e" />
<img width="1273" height="813" alt="Screenshot 2026-10-24 093334" src="https://github.com/user-attachments/assets/7c3cc668-8e4c-4aa3-aea0-78997a06697f" />
<img width="940" height="607" alt="Screenshot 2026-10-24 093405" src="https://github.com/user-attachments/assets/fe9bbd38-1ff1-45c6-939f-17f722f94e7b" />
<img width="937" height="603" alt="Screenshot 2026-10-24 093428" src="https://github.com/user-attachments/assets/a8c27010-38c3-44e2-890d-65398980a04e" />
<img width="1362" height="873" alt="Screenshot 2026-10-24 093450" src="https://github.com/user-attachments/assets/ac213783-be06-4d9b-a716-6658a2ae7f9e" />
<img width="1292" height="816" alt="Screenshot 2026-10-24 093502" src="https://github.com/user-attachments/assets/016ee5dc-0a62-41b7-92d7-84ea4989b443" />
<img width="1296" height="811" alt="Screenshot 2026-10-24 093514" src="https://github.com/user-attachments/assets/b1344c27-2d5f-4cab-817b-494db4d23fdf" />

### single corner sta graphs
<img width="1348" height="910" alt="Screenshot 2026-10-24 093617" src="https://github.com/user-attachments/assets/9464fbe2-8dcb-4e80-a555-578ee5d0cacf" />
<img width="1352" height="913" alt="Screenshot 2026-10-24 093631" src="https://github.com/user-attachments/assets/fc0ce1e7-ab9e-47a4-bf69-e70311263a8a" />
<img width="1352" height="913" alt="Screenshot 2026-10-24 093642" src="https://github.com/user-attachments/assets/74ab2fdc-278c-41c1-8f02-23b521b59c6f" />
<img width="1357" height="903" alt="Screenshot 2026-10-24 093653" src="https://github.com/user-attachments/assets/1d180220-053b-4980-b78d-df13aafba215" />



