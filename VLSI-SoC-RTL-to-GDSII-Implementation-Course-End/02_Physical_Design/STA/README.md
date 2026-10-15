# Static Timing Analysis (STA)

## Overview

Static Timing Analysis verifies the timing performance of the Sequence Detector design using OpenSTA.

## Files

- `sta.tcl` — Tcl script used to run timing analysis.
- `sta.log` — Log containing the STA output and timing results.

## Key Results

- Maximum-path slack: +7.69 ns
- Reset recovery slack: +8.99 ns
- Reset removal slack: +0.52 ns
- Register-to-register minimum-path slack: +0.27 ns
- Total Negative Slack (TNS): 0.00 ns

*These values should be verified against the submitted STA log and the exact analysis stage.*

## Conclusion

The STA results indicate positive reported slack for the analyzed paths. Final timing closure should be confirmed using the complete timing reports and implementation stage.
