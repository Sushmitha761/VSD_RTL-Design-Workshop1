# VSDBabySoC Multi-Corner Static Timing Analysis

## Overview

This project presents the Static Timing Analysis (STA) of the **VSDBabySoC** design using **OpenSTA** and **SKY130 HD standard-cell timing libraries**.

The analysis is performed across multiple **Process, Voltage and Temperature (PVT) timing corners** to study the setup and hold timing behavior of the synthesized VSDBabySoC design.

## Project Details

| Parameter      | Details                |
| -------------- | ---------------------- |
| Design         | VSDBabySoC             |
| Top Module     | `vsdbabysoc`           |
| STA Tool       | OpenSTA                |
| Technology     | SKY130 HD              |
| Analysis       | Static Timing Analysis |
| Timing Corners | 18                     |
| Analysis Type  | Multi-Corner PVT STA   |

## Objectives

The main objectives of this project are:

* Perform Static Timing Analysis on the synthesized VSDBabySoC design.
* Analyze timing behavior across multiple PVT corners.
* Check setup timing and hold timing.
* Extract minimum and maximum slack values.
* Identify timing-critical operating conditions.
* Generate timing reports and graphs for analysis.

## Files Used

The STA flow uses the following design files:

* Synthesized VSDBabySoC netlist
* SDC timing constraint file
* AVSD PLL Liberty library
* AVSD DAC Liberty library
* SKY130 HD standard-cell timing libraries

## Timing Corners

The analysis was performed using 18 SKY130 HD timing libraries covering Fast-Fast, Slow-Slow and Typical-Typical process conditions.

### Fast-Fast Corners

* `ff_100C_1v65`
* `ff_100C_1v95`
* `ff_n40C_1v56`
* `ff_n40C_1v65`
* `ff_n40C_1v76`
* `ff_n40C_1v95`
* `ff_n40C_1v95_ccsnoise`

### Slow-Slow Corners

* `ss_100C_1v40`
* `ss_100C_1v60`
* `ss_n40C_1v28`
* `ss_n40C_1v35`
* `ss_n40C_1v40`
* `ss_n40C_1v44`
* `ss_n40C_1v60`
* `ss_n40C_1v60_ccsnoise`
* `ss_n40C_1v76`

### Typical-Typical Corners

* `tt_025C_1v80`
* `tt_100C_1v80`

## STA Methodology

The STA flow follows these major steps:

1. Load the required Liberty timing libraries.
2. Read the synthesized VSDBabySoC netlist.
3. Link the design with the required libraries.
4. Read the SDC timing constraints.
5. Create and apply the required clock constraints.
6. Perform minimum-delay analysis for hold timing.
7. Perform maximum-delay analysis for setup timing.
8. Generate timing reports for each configured corner.
9. Extract slack values and timing metrics.
10. Compare timing behavior across all 18 corners.

## Timing Results

The generated reports show positive hold slack across all analyzed corners.

Setup timing is met for the reported FF and TT corners, while several SS corners show negative maximum slack, indicating setup timing violations under those operating conditions.

| Timing Corner         | Min Slack (ns) | Max Slack (ns) | Hold | Setup    |
| --------------------- | -------------: | -------------: | ---- | -------- |
| ff_100C_1v65          |           0.25 |           4.05 | MET  | MET      |
| ff_100C_1v95          |           0.20 |           5.57 | MET  | MET      |
| ff_n40C_1v56          |           0.29 |           2.28 | MET  | MET      |
| ff_n40C_1v65          |           0.26 |           3.41 | MET  | MET      |
| ff_n40C_1v76          |           0.22 |           4.43 | MET  | MET      |
| ff_n40C_1v95          |           0.19 |           5.59 | MET  | MET      |
| ff_n40C_1v95_ccsnoise |           0.19 |           5.59 | MET  | MET      |
| ss_100C_1v40          |           0.91 |         -17.12 | MET  | VIOLATED |
| ss_100C_1v60          |           0.64 |          -7.87 | MET  | VIOLATED |
| ss_n40C_1v28          |           1.83 |         -62.56 | MET  | VIOLATED |
| ss_n40C_1v35          |           1.35 |         -39.70 | MET  | VIOLATED |
| ss_n40C_1v40          |           1.12 |         -29.69 | MET  | VIOLATED |
| ss_n40C_1v44          |           0.99 |         -23.91 | MET  | VIOLATED |
| ss_n40C_1v60          |           0.66 |         -10.61 | MET  | VIOLATED |
| ss_n40C_1v60_ccsnoise |           0.66 |         -10.61 | MET  | VIOLATED |
| ss_n40C_1v76          |           0.50 |          -4.38 | MET  | VIOLATED |
| tt_025C_1v80          |           0.31 |           1.94 | MET  | MET      |
| tt_100C_1v80          |           0.31 |           2.09 | MET  | MET      |

## Key Observations

* Hold timing shows positive slack across all listed timing corners.
* FF corners show positive setup slack.
* TT corners show positive setup slack.
* Several SS corners show negative setup slack.
* The most negative displayed setup slack is approximately **-62.56 ns** at the `ss_n40C_1v28` corner.
* The timing results demonstrate the effect of process, voltage and temperature variations on the design.

## WNS and TNS Analysis

WNS (Worst Negative Slack) and TNS (Total Negative Slack) values were extracted across the 18 timing corners.

The supplied analysis shows the most severe displayed setup condition at the **SS -40°C, 1.28 V** corner.

The reported worst setup slack is approximately:

**WNS = -62.56 ns**

The reported maximum Total Negative Slack is approximately:

**TNS = -13,555.8 ns**

## Reports and Graphs

The project includes timing reports and graphical analysis for:

* Hold timing analysis
* Setup timing analysis
* Slack extraction
* WNS extraction
* TNS extraction
* Multi-corner comparison
* Worst setup slack
* Minimum hold slack
* Timing quality analysis

## Tools and Technologies

* **OpenSTA**
* **SKY130 HD PDK**
* **Liberty Timing Libraries**
* **TCL**
* **Static Timing Analysis**
* **VSDBabySoC**

## Conclusion

Static Timing Analysis of the VSDBabySoC synthesized design was performed using OpenSTA and SKY130 HD timing libraries across multiple PVT corners.

The analysis provides visibility into setup and hold timing behavior under different operating conditions. The generated reports and graphs can be used to identify timing-critical corners and paths for further timing optimization.

<img width="1312" height="1199" alt="image" src="https://github.com/user-attachments/assets/63794d63-7723-4be9-a2c9-a9eb9737be5e" />
