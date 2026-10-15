# 02 - Physical Design

## Overview
This section documents the Physical Design and Static Timing Analysis (STA) work completed as part of the VLSI-SoC RTL-to-GDSII Implementation Course.

## Static Timing Analysis (STA)

Static Timing Analysis is used to verify whether a digital design meets its timing constraints without requiring simulation of every possible input pattern.

### Objectives
- Analyze timing paths in the design.
- Evaluate setup and hold timing requirements.
- Check timing slack and identify potential timing violations.
- Understand the relationship between clock constraints and circuit performance.

### Files Included
- `STA/sta.tcl` — Tcl script used to configure and execute timing analysis.
- `STA/sta.log` — Log containing the recorded output of the STA run.

### Tools
- OpenSTA
- Tcl scripting
- Timing constraints defined using SDC

### Results and Observations
The STA log is included for reference. Actual timing results, including setup slack, hold slack, and critical-path delay, should be reported based on the values recorded in the log.

### Conclusion
This work documents the STA flow and its associated script and log files. The results can be used to understand timing behavior and evaluate whether the design meets its specified timing constraints.
