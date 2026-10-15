# Physical Design

## 1. Objectives

- Understand the ASIC Physical Design flow.
- Study logic synthesis and technology mapping.
- Understand floorplanning, placement, Clock Tree Synthesis (CTS), and routing.
- Perform Static Timing Analysis (STA) using OpenSTA.
- Analyze setup/hold timing, slack, and Total Negative Slack (TNS).
- Document tools, commands, and implementation results.

## 2. Design Overview

- **Design Name:** Sequence Detector
- **Top Module:** `sequence_detector`
- **Technology:** SKY130
- **Standard-Cell Library:** `sky130_fd_sc_hd`
- **Netlist:** `sequence_detector_sky130.v`
- **Timing Constraints:** `constraints.sdc`

## 3. Tools and Technologies

| Tool | Purpose |
|---|---|
| Icarus Verilog | RTL simulation |
| GTKWave | Waveform analysis |
| Yosys | Logic synthesis |
| OpenLane | ASIC implementation flow |
| OpenROAD | Physical design operations |
| OpenSTA | Static Timing Analysis |
| SKY130 PDK | Technology files and standard-cell library |
| Magic | Layout viewing |

## 4. ASIC Physical Design Flow

1. RTL Design and Verification
2. Logic Synthesis and Technology Mapping
3. Floorplanning
4. Power Planning
5. Placement
6. Clock Tree Synthesis (CTS)
7. Routing
8. Static Timing Analysis
9. Parasitic Extraction
10. Post-Route Timing Verification

## 5. Static Timing Analysis Results

The following values are the currently reported results. Verify them against the archived STA log before final submission.

| Parameter | Reported Result |
|---|---:|
| `din` to `detected` maximum-path slack | +7.69 ns |
| Maximum-path data arrival time | 1.11 ns |
| Maximum-path required time | 8.80 ns |
| Example reset recovery slack | +8.99 ns |
| Example reset removal slack | +0.52 ns |
| Example register-to-register minimum-path slack | +0.27 ns |
| Total Negative Slack (TNS) | 0.00 ns |

## 6. Observations

- The reported maximum-delay input-to-output path has positive slack of 7.69 ns.
- The reported TNS is 0.00 ns for the analyzed maximum-delay report.
- The example minimum-delay path has positive slack of 0.27 ns.
- Results depend on the netlist, SDC constraints, library corner, and analysis settings.
- These results alone do not confirm post-route timing closure.

## 7. Timing Concepts

- **Setup Time:** Minimum time data must remain stable before the active clock edge.
- **Hold Time:** Minimum time data must remain stable after the active clock edge.
- **Slack:** Timing margin for a particular timing check.
- **TNS:** Total accumulated negative slack in the reported analysis.
- **Recovery and Removal:** Timing checks associated with asynchronous control signals.

## 8. Tools and Commands

### Check installed tools

```bash
iverilog -V
yosys -V
openroad -version
sta -version
magic --version
```

### Navigate to the Sequence Detector directory

```bash
cd ~/Desktop/sequence_detector_101011
pwd
ls -la
find . -maxdepth 3 -type f | sort
```

### Start OpenLane interactively

```bash
cd ~/Desktop/work/tools/openlane_working_dir/openlane
./flow.tcl -interactive
```

After checking the design configuration, source files, PDK, and constraints, the applicable interactive stages include:

```text
run_synthesis
run_floorplan
run_placement
run_cts
run_routing
```

### OpenSTA timing analysis

Run this only after confirming that the script references the correct netlist, libraries, and constraints.

```bash
cd ~/Desktop/sequence_detector_101011
mkdir -p reports
sta -exit sta.tcl 2>&1 | tee reports/sta.log
```

### Inspect timing reports

```bash
grep -Ei "slack|tns|arrival time|required time" reports/sta.log
```

### Find physical-design artifacts

```bash
find . -type f \( -name "*.spef" -o -name "*.sdf" -o -name "*.def" -o -name "*.gds" \)
```

### Launch Magic

```bash
magic -T ~/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech
```

Verify the technology-file path in your local installation before running the command.

## 9. STA Artifacts

The `STA/` directory contains:

- `sta.tcl` — Tcl script used for timing analysis.
- `sta.log` — Saved output from an STA run.

Keep the script and log together. Where available, also preserve the exact netlist, SDC constraints, libraries, and corner details so the analysis can be reproduced.

## 10. Conclusion and Future Work

This documentation records the ASIC Physical Design methodology and the available STA results for the Sequence Detector using the SKY130HD standard-cell library and OpenSTA.

