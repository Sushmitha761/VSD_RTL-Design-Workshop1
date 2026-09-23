# Pre-Layout Timing Analysis and Importance of a Good Clock Tree

Pre-layout timing analysis is performed before the actual clock tree and routing are implemented. It is used to check whether the synthesized design can meet the required timing constraints. A good clock tree is important because the clock must reach all sequential elements with controlled latency, skew, transition, and load. Poor clock distribution can cause setup and hold timing violations.

## Timing Modeling Using Delay Tables

Standard-cell timing is represented using delay tables, where cell delay depends mainly on the input transition and output load. These tables are stored in the timing library and are used by timing tools to calculate the propagation delay of cells under different operating conditions.

## Converting Gate Information to Track Information

After synthesis, the design contains gate-level connectivity. For physical implementation, this logical information must be mapped to physical routing resources such as cell pins, routing layers, metal directions, and routing tracks. This information is required for the placement and routing stages.
<img width="1917" height="1078" alt="Screenshot 2026-09-20 184956" src="https://github.com/user-attachments/assets/99f28e70-2f58-49cd-997b-ababe2c40f51" />
<img width="1917" height="1075" alt="Screenshot 2026-09-23 204835" src="https://github.com/user-attachments/assets/3573c313-40c8-475b-9a01-c5c1f3a174b9" />


## Converting Magic Layout to Standard Cell LEF

A standard-cell layout created using Magic contains detailed geometric information. Physical-design tools use LEF (Library Exchange Format) as the physical abstract of the cell. The cell dimensions, pin locations, routing layers, and obstructions are extracted from the layout and represented in the LEF file. This LEF is then used during placement and routing.
<img width="1916" height="1078" alt="Screenshot 2026-09-23 204844" src="https://github.com/user-attachments/assets/e93bd32c-2894-4d85-887f-dfd9cc25bae3" />
<img width="558" height="482" alt="Screenshot 2026-09-23 230825" src="https://github.com/user-attachm
<img width="1917" height="1072" alt="Screenshot 2026-09-20 190253" src="https://github.com/user-attachments/assets/d6f9be97-f6dd-4eb9-96a3-5e35894321b9" />

## Introduction to Liberty Files

A Liberty (`.lib`) file contains the timing and electrical characteristics of a standard cell. It includes information such as cell function, input and output pins, capacitance, timing arcs, propagation delay, output transition, setup time, hold time, and power information. LEF mainly represents the physical information of a cell, whereas Liberty represents its timing and electrical behaviour.
<img width="1917" height="1076" alt="Screenshot 2026-09-20 191112" src="https://github.com/user-attachments/assets/0681180f-ce72-4bf5-9d81-2003edff0835" />
<img width="930" height="235" alt="Screenshot 2026-09-20 193013" src="https://github.com/user-attachments/assets/affaf63a-770a-4aa0-9d30-5a0c87bf9a07" />
<img width="1917" height="1077" alt="Screenshot 2026-09-20 193947" src="https://github.com/user-attachments/assets/411a4436-2964-4e2b-8539-caf213f8ea38" />

# OpenLane

<img width="1917" height="1073" alt="Screenshot 2026-09-20 201700" src="https://github.com/user-attachments/assets/9cb9fcc6-9c89-4608-ab8c-30423621ab0b" />
<img width="1798" height="892" alt="Screenshot 2026-09-20 201851" src="https://github.com/user-attachments/assets/ef36a4d3-a8ae-4911-ae63-9d937d7db7e1" /> ## Statistics
 <img width="861" height="688" alt="Screenshot 2026-09-20 201759" src="https://github.com/user-attachments/assets/0b6f3647-bfce-4d3a-be70-deaa969d4681" />
<img width="1907" height="1055" alt="Screenshot 2026-09-20 201823" src="https://github.com/user-attachments/assets/eab310a7-b090-45d8-a79c-2713b5375cc1" />
<img width="725" height="462" alt="Screenshot 2026-09-20 205214" src="https://github.com/user-attachments/assets/a8467427-2f78-4fe7-9e60-968500460173" />
<img width="827" height="557" alt="Screenshot 2026-09-23 233247" src="https://github.com/user-attachments/assets/7cba8827-a626-49f2-bfa7-969f6333ae49" />

## Including a New Cell in Synthesis

To include a new standard cell in synthesis, its physical and timing information must be prepared. The general flow is to create the cell layout, generate its LEF, characterize the cell, prepare the Liberty information, add the cell to the synthesis library, and configure the synthesis tool. After synthesis, the generated netlist and timing reports are checked to verify the integration.

## Introduction to Delay Tables

Delay tables describe the behaviour of a standard cell for different input slew and output load conditions. As the input transition becomes slower or the output load increases, the cell delay can change. The timing engine uses the appropriate delay-table values to calculate accurate cell delays.
<img width="1725" height="718" alt="Screenshot 2026-09-23 231711" src="https://github.com/user-attachments/assets/4148ab95-55a1-4eb6-b737-76e13a2cff38" />

## Delay Tables – Part 1

The first part focuses on understanding the relationship between input slew, output capacitance, cell delay, and output transition. Delay tables contain multiple values for different combinations of input transition and output load, allowing the timing tool to model cell behaviour more accurately.
<img width="1736" height="710" alt="Screenshot 2026-09-23 231839" src="https://github.com/user-attachments/assets/cb38dbbb-a646-47a6-a4f6-76a2e535beb2" />

## Delay Tables – Part 2

The second part explains how delay-table information is used during Static Timing Analysis. The timing engine uses the cell delay and transition information to calculate arrival time, required time, and slack. This helps identify critical paths and timing violations in the design.
<img width="1738" height="712" alt="Screenshot 2026-09-23 231927" src="https://github.com/user-attachments/assets/dadc3a56-dc5f-4111-92ca-26f6a1d1a082" />

## Configuring Synthesis to Fix Slack

Slack represents the timing margin available in a path. Positive slack indicates that the timing requirement is satisfied, while negative slack indicates a timing violation. Synthesis can be optimized by using higher-drive cells, reducing load, improving logic paths, and selecting faster cells. The design is synthesized again and the timing is checked using OpenSTA.
<img width="1037" height="602" alt="Screenshot 2026-09-23 232427" src="https://github.com/user-attachments/assets/db16c93a-b4a8-4942-b932-c58497f73bb5" />
<img width="1067" height="602" alt="Screenshot 2026-09-23 232503" src="https://github.com/user-attachments/assets/d30f3ea4-afe5-4911-a22e-475961bfbe80" />
<img width="1080" height="592" alt="Screenshot 2026-09-23 233056" src="https://github.com/user-attachments/assets/c6c28c6b-79ba-4068-9724-c1158d9cd1de" />
<img width="1907" height="1055" alt="Screenshot 2026-09-20 223713" src="https://github.com/user-attachments/assets/f71ca0f2-1021-411d-a611-890be2e5a93d" />
<img width="1905" height="1078" alt="Screenshot 2026-09-20 224103" src="https://github.com/user-attachments/assets/16c96f3f-9707-4640-9559-63a255d98c5e" />
<img width="1880" height="1078" alt="Screenshot 2026-09-20 224540" src="https://github.com/user-attachments/assets/72d0f2af-26cd-4841-80f0-87cf5d3b2fc5" />

<img width="1917" height="1078" alt="Screenshot 2026-09-20 221900" src="https://github.com/user-attachments/assets/26b10120-afc8-4bea-85d7-3f8b5a471503" />

# Timing Analysis with Ideal Clock Using OpenSTA

OpenSTA is used for Static Timing Analysis of the synthesized design. During ideal-clock analysis, the clock network is assumed to be ideal because the physical clock tree has not yet been implemented. The synthesized netlist, Liberty timing library, and SDC constraints are provided to OpenSTA to analyse the timing behaviour of the design.
<img width="1682" height="672" alt="Screenshot 2026-09-23 232030" src="https://github.com/user-attachments/assets/a1d60f3f-da7a-4b71-a9bb-6b82cd7d9580" />



## Setup Timing Analysis and Flip-Flop Setup Time

Setup time is the minimum time for which data must remain stable before the active clock edge. If the data arrives too late at the destination flip-flop, a setup violation occurs. Setup analysis is used to verify whether the data path can complete within the available clock period.
<img width="1782" height="672" alt="Screenshot 2026-09-23 232118" src="https://github.com/user-attachments/assets/4af85253-8dd6-4c31-bc2c-11c6216df9cf" />

## Clock Jitter and Uncertainty

Clock jitter represents variations in the timing of clock edges, while clock uncertainty provides a timing margin for clock variations and other uncertainties. Including uncertainty makes the timing analysis more conservative and helps account for non-ideal clock behaviour.
<img width="1685" height="675" alt="Screenshot 2026-09-23 232208" src="https://github.com/user-attachments/assets/4631b1a2-c95d-4108-9dab-43136c9e3420" />

## Configuring OpenSTA for Post-Synthesis Timing Analysis

For post-synthesis timing analysis, OpenSTA is configured using the synthesized Verilog netlist, appropriate Liberty timing libraries, and SDC constraints. The clock is defined and timing reports are generated to analyse setup and hold slack, arrival time, required time, and critical paths.
<img width="1917" height="1077" alt="Screenshot 2026-09-20 232019" src="https://github.com/user-attachments/assets/03ea1174-608f-4a5c-9171-d8832a3f31e5" />
<img width="960" height="1043" alt="Screenshot 2026-09-20 231835" src="https://github.com/user-attachments/assets/97c6e1fc-939f-4a2b-9335-794383f86dfd" />
<img width="957" height="1070" alt="Screenshot 2026-09-20 210838" src="https://github.com/user-attachments/assets/ac1dc6ae-397e-40f1-a601-c6534325b004" />
<img width="1917" height="1075" alt="Screenshot 2026-09-20 192346" src="https://github.com/user-attachments/assets/49b5c1eb-433a-4032-97af-4b15ccc49642" />
<img width="955" height="1073" alt="Screenshot 2026-09-20 192309" src="https://github.com/user-attachments/assets/7cf3b1c0-7870-4fdf-b996-afff2f4fc145" />

## Optimizing Synthesis to Reduce Setup Violations

Setup violations occur when data arrives later than the required time. They can be reduced by increasing cell drive strength, selecting faster cells, reducing capacitive load, and optimizing critical logic paths. The design can be repeatedly synthesized and analysed using OpenSTA until the required timing is achieved.
<img width="1917" height="1078" alt="Screenshot 2026-09-20 210418" src="https://github.com/user-attachments/assets/f375416d-1232-4f25-ad6f-cdaa967f347a" />
<img width="427" height="612" alt="image" src="https://github.com/user-attachments/assets/a809812a-7312-4029-aad3-8c2a32e5ff0e" />
<img width="1018" height="561" alt="Screenshot 2026-09-21 003116" src="https://github.com/user-attachments/assets/12e0e5f9-4baf-4e51-839d-49c74d0ed370" />

## Basic Timing ECO

A Timing ECO (Engineering Change Order) is used to make small modifications to an existing synthesized design for timing optimization. Common ECO techniques include cell resizing, cell replacement, buffer insertion, and buffer removal. After the ECO, OpenSTA is used to verify whether the timing violation has been reduced.
<img width="895" height="250" alt="image" src="https://github.com/user-attachments/assets/463425a2-6549-4c2f-97a4-69ab6969748c" />

# Clock Tree Synthesis – TritonCTS and Signal Integrity

Clock Tree Synthesis is performed after placement to build the physical clock distribution network. TritonCTS creates the clock tree by inserting buffers and balancing the paths between the clock source and sequential elements. The main objectives are to control clock skew, latency, transition, and load.
<img width="1725" height="686" alt="Screenshot 2026-09-23 232641" src="https://github.com/user-attachments/assets/cc447885-eca8-436a-b5cc-a90ff20282e8" />
<img width="1051" height="592" alt="Screenshot 2026-09-21 003256" src="https://github.com/user-attachments/assets/21fa4b6e-87ee-4c48-b0d0-f633b4b5f25d" />



## Crosstalk and Clock Net Shielding

Crosstalk occurs when neighbouring wires interact through electrical coupling. Since the clock network drives many sequential elements, unwanted coupling can affect clock delay, transition, and skew. Proper spacing and shielding techniques are used to reduce interference between clock nets and neighbouring signal wires.
<img width="1783" height="677" alt="Screenshot 2026-09-23 232800" src="https://github.com/user-attachments/assets/c1a25227-c102-43c5-8a35-b1c3a866ca28" />

## Running CTS Using TritonCTS

The CTS process identifies the clock source and clock sinks, builds the clock tree, inserts clock buffers, balances the clock paths, and generates the required CTS information. After CTS, clock latency, skew, transition, setup timing, and hold timing are verified.
<img width="1061" height="568" alt="Screenshot 2026-09-23 233132" src="https://github.com/user-attachments/assets/ec123aa4-7d95-43ae-89be-5d0f8cdf79f4" />

## Verifying CTS Timing

After CTS, the clock is no longer ideal because the physical clock network has been created. Timing analysis is therefore performed using the actual clock paths. Clock latency, clock skew, setup slack, hold slack, and critical timing paths are checked to verify the quality of the generated clock tree.
<img width="1083" height="582" alt="Screenshot 2026-09-23 233840" src="https://github.com/user-attachments/assets/5eabe9c2-7cb0-4658-a2b7-2652447f3585" />
<img width="1076" height="596" alt="Screenshot 2026-09-23 234115" src="https://github.com/user-attachments/assets/e2edb4b7-2ffe-4529-bedd-4897f08d3c94" />

# Timing Analysis with Real Clocks Using OpenSTA

After CTS, OpenSTA is used for timing analysis with real clock paths. Unlike ideal-clock analysis, real-clock analysis considers the actual clock latency and skew introduced by the clock tree. This provides a more realistic view of the timing behaviour of the physical design.
<img width="1391" height="716" alt="Screenshot 2026-09-23 233622" src="https://github.com/user-attachments/assets/3cd78233-6b9d-43e1-aa52-b22310516858" />

## Setup Timing Analysis Using Real Clocks

Real-clock setup analysis checks whether data reaches the destination flip-flop within the available timing window while considering the actual launch and capture clock arrival times. Clock latency, skew, data-path delay, setup time, and slack are considered during this analysis.

## Hold Timing Analysis Using Real Clocks

Hold analysis checks whether data remains stable for the required time after the active clock edge. After CTS, actual clock skew can affect hold timing, so hold violations must be analysed using the propagated clock network.
<img width="1391" height="716" alt="Screenshot 2026-09-23 233622" src="https://github.com/user-attachments/assets/7cadd0ef-5237-4262-840e-4b095adf507d" />

## Analysing Real Clocks Using OpenSTA

The post-CTS design, timing libraries, SDC constraints, and propagated clock information are provided to OpenSTA. Timing reports are generated to analyse setup and hold violations, clock latency, clock skew, critical paths, and worst slack. This stage provides a realistic timing view of the implemented clock network.
<img width="1076" height="596" alt="Screenshot 2026-09-23 234115" src="https://github.com/user-attachments/assets/b6b91f23-cbf5-4356-8b9c-08018827cdc9" />

## Correct Timing Libraries and CTS Configuration

Accurate post-CTS timing analysis requires the correct Liberty timing libraries corresponding to the required operating conditions. The CTS configuration and timing libraries should be consistent with the intended analysis corner. Correct library selection ensures that the reported setup and hold timing results are meaningful.

## Impact of Bigger CTS Buffer on Setup and Hold Timing

The size of CTS buffers affects the drive strength and behaviour of the clock network. A larger buffer can drive a higher clock load, but changing the buffer size can also affect clock latency, skew, and transition. Therefore, the effect of different CTS buffer sizes is checked using OpenSTA by comparing setup and hold timing results.
<img width="512" height="383" alt="Screenshot 2026-09-24 011104" src="https://github.com/user-attachments/assets/ac1dd4d3-5f58-4fbb-b907-bb7a3bccec56" />

# Overall Timing Flow

```text
Standard Cell Layout
        ↓
LEF Generation
        ↓
Liberty / Timing Information
        ↓
Synthesis
        ↓
Pre-Layout Timing Analysis
        ↓
Ideal Clock Analysis – OpenSTA
        ↓
Timing Optimization / ECO
        ↓
Placement
        ↓
Clock Tree Synthesis – TritonCTS
        ↓
CTS Timing Verification
        ↓
Real Clock Analysis – OpenSTA
        ↓
Setup and Hold Analysis
        ↓
Final Timing Verification
```

# Key Learning Outcomes

This module provided practical understanding of LEF, Liberty files, delay tables, synthesis timing optimization, setup and hold analysis, clock jitter and uncertainty, OpenSTA, timing ECO, Clock Tree Synthesis using TritonCTS, H-tree clock distribution, clock buffering, crosstalk, clock shielding, clock skew, clock latency, and real-clock timing analysis. It also demonstrated how logical design information, standard-cell physical information, timing libraries, synthesis, CTS, and Static Timing Analysis are connected in a complete ASIC physical-design flow.
![Uploading image.png…]()


