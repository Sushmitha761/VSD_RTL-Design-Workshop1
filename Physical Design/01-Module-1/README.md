# Module-0
# Table Of Contents

- [SKY130_D1_SK1 – How to Talk to Computers](#sky130_d1_sk1---how-to-talk-to-computers)
- [SKY130_D1_SK2 – SoC Design and OpenLANE](#sky130_d1_sk2---soc-design-and-openlane)

#   Introduction to OpenLANE and ASIC Design Flow

## 1. Introduction to ASIC Design

An ASIC (Application Specific Integrated Circuit) is a chip designed to perform a specific application efficiently. The ASIC design flow converts an RTL (Register Transfer Level) design into a manufacturable GDSII layout using EDA tools and a Process Design Kit (PDK).


## 2. Software to Hardware Flow

The software written in high-level languages (C/C++) is converted into machine instructions through a compiler and assembler. These instructions are executed by hardware described using RTL, synthesized into a gate-level netlist, and finally implemented as a physical layout.


![Software to Hardware](images/day1/02_software_to_hardware.png)
<img width="1550" height="711" alt="Screenshot 2026-09-05 174255" src="https://github.com/user-attachments/assets/451fab1a-f865-4648-b152-67f86bcc20b0" />


## 3. Components of a System-on-Chip (SoC)

A modern SoC integrates multiple hardware blocks on a single chip, including:

- RISC-V Processor Core
- SRAM Memory
- GPIO Interface
- Analog IPs
- Foundry IPs
- Standard Cell Libraries
- Macros

### Screenshot
![SoC Components](images/day1/03_soc_components.png)
<img width="981" height="537" alt="Screenshot 2026-09-05 174535" src="https://github.com/user-attachments/assets/bbb5fe2b-1fa8-4e72-b122-772cf8362702" />

---

## 4. Open Source ASIC Design

Three essential components are required for ASIC implementation:

- RTL Design
- EDA Tools
- Process Design Kit (PDK)

These work together to convert an RTL design into a fabricated integrated circuit.


![Open Source ASIC](images/day1/04_open_source_asic.png)
<img width="1097" height="487" alt="Screenshot 2026-09-05 174613" src="https://github.com/user-attachments/assets/33515ccb-cf17-4376-b6e1-f15b8656b35e" />

---

## 5. Process Design Kit (PDK)

A Process Design Kit (PDK) contains technology-specific information required for chip design.

It includes:

- Design Rules (DRC)
- Device Models
- Standard Cell Libraries
- IO Libraries
- SPICE Models
- Technology Files


![PDK](images/day1/05_pdk.png)
<img width="1055" height="436" alt="Screenshot 2026-09-05 174713" src="https://github.com/user-attachments/assets/02ad16f9-7419-4031-a7c2-b249e87e6d79" />
<img width="1117" height="641" alt="Screenshot 2026-09-05 174642" src="https://github.com/user-attachments/assets/ed600695-0724-4d57-b43f-83be16319d3a" />

---

## 6. EDA Tools

Electronic Design Automation (EDA) tools automate various stages of ASIC implementation.

Major stages include:

- RTL Simulation
- Logic Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis (CTS)
- Routing
- Static Timing Analysis (STA)
- Physical Verification (DRC/LVS)

### Screenshot
![EDA Tools](images/day1/06_eda_tools.png)
<img width="1080" height="582" alt="Screenshot 2026-09-05 174756" src="https://github.com/user-attachments/assets/13d5df26-dd70-4c13-977f-a24b2c9fb415" />


---

## 7. RTL to GDSII Flow

The OpenLANE RTL-to-GDSII flow consists of the following stages:

1. Synthesis
2. Floorplanning
3. Power Planning
4. Placement
5. Clock Tree Synthesis (CTS)
6. Routing
7. Signoff
8. GDSII Generation


![RTL to GDSII Flow](images/day1/07_rtl_to_gdsii.png)
<img width="1213" height="562" alt="Screenshot 2026-09-05 174826" src="https://github.com/user-attachments/assets/1d68959a-b7d5-4364-a8e6-c7f66f200ccd" />



## 8. OpenLANE Flow

OpenLANE is an open-source automated RTL-to-GDSII flow built on OpenROAD and optimized for the Sky130 Open PDK.

### Features

- Automated physical design flow
- Supports Sky130 technology
- Open-source EDA toolchain
- Generates manufacturable GDSII layout


![OpenLANE](images/day1/08_openlane.png)
<img width="1157" height="632" alt="Screenshot 2026-09-05 175112" src="https://github.com/user-attachments/assets/f34b57ed-6d25-4e96-ad2a-d2e6089fd204" />




## 9. Static Timing Analysis (STA)

Static Timing Analysis verifies whether all timing paths satisfy setup and hold constraints.

OpenSTA is used to analyze:

- Setup Time
- Hold Time
- Arrival Time
- Required Time
- Slack



## 10. Physical Verification

Physical verification ensures the final layout is manufacturable.

The verification flow includes:

- Design Rule Check (DRC)
- Layout Versus Schematic (LVS)
- SPICE Extraction

**Tools Used**

- Magic
- Netgen
- 
![Physical Verification](images/day1/10_drc_lvs.png)

<img width="1157" height="632" alt="Screenshot 2026-09-05 175112" src="https://github.com/user-attachments/assets/b939f83b-d003-4e0a-a754-0125b31ce611" />
<img width="1122" height="542" alt="Screenshot 2026-09-05 175227" src="https://github.com/user-attachments/assets/5d2a0bb8-9848-4961-a216-542ac2d21894" />


---

## Day 1 Summary

During Day 1 of the VSD Physical Design Workshop, the following concepts were covered:

- ASIC Design Flow
- Software to Hardware Conversion
- System-on-Chip Architecture
- Open Source ASIC Design
- Process Design Kit (PDK)
- EDA Tool Flow
- RTL to GDSII Flow
- OpenLANE Architecture
- Static Timing Analysis (STA)
- Physical Verification using Magic and Netgen

