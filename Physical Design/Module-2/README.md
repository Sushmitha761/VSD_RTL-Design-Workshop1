# Module-2
# Table Of Contents
- [SKY130_D2_SK1 – Chip Floor Planning Considerations](#sky130_d2_sk1---chip-floor-planning-considerations)
- [SKY130_D2_SK2 – Library Binding and Placement](#sky130_d2_sk2---library-binding-and-placement)
- [SKY130_D2_SK3 – Cell Design and Characterization](#sky130_d2_sk3---cell-design-and-characterization)
- [SKY130_D2_SK4 – General Timing Characterization Parameters](#sky130_d2_sk4---general-timing-characterization-parameters)



# SKY130_D2 - Good Floorplan vs Bad Floorplan and Introduction to Library Cells

## SKY130_D2_SK1 - Chip Floor Planning Considerations

### 1. Utilization Factor and Aspect Ratio

The utilization factor represents the percentage of the core area occupied by standard cells, while the aspect ratio defines the shape of the core. Choosing suitable values is important because they directly affect placement quality, routing congestion, and chip area. A balanced utilization factor ensures enough routing space without wasting silicon area.

**Observation:** The selected utilization factor and aspect ratio resulted in an efficient floorplan with balanced routing resources.
<img width="1258" height="717" alt="Screenshot 2026-09-05 205751" src="https://github.com/user-attachments/assets/9bb6d36d-7151-4f24-8365-087164905ceb" />


---

### 2. Concept of Pre-Placed Cells

Pre-placed cells are fixed macros such as SRAMs, analog IPs, and PLLs that are positioned before standard cell placement. Since these cells cannot be moved later, their placement plays a significant role in routing quality and timing performance.

**Observation:** Proper placement of macros reduced routing congestion and improved overall floorplan efficiency.

<img width="950" height="730" alt="Screenshot 2026-09-05 210002" src="https://github.com/user-attachments/assets/6b5b0d1c-3530-4aaa-928e-b574d13df7ff" />

---

### 3. De-Coupling Capacitors

Decoupling capacitors are placed near switching circuits to reduce voltage fluctuations caused by sudden current demand. They provide temporary charge storage and improve the stability of the power supply.

**Observation:** The use of decoupling capacitors reduced IR drop and improved power integrity.


### 4. Power Planning

Power planning creates a reliable Power Distribution Network (PDN) by distributing VDD and GND throughout the chip using power rings and straps. A strong PDN minimizes voltage drop and ensures reliable circuit operation.

**Observation:** Proper power planning provided stable power delivery across the design.
<img width="1167" height="711" alt="Screenshot 2026-09-05 210100" src="https://github.com/user-attachments/assets/da7078c0-69f0-44b4-a508-8d164b469e7e" />


---

### 5. Pin Placement and Logical Cell Placement Blockage

Input and output pins are placed around the chip boundary for easier routing. Placement blockages reserve specific regions around macros to avoid congestion and provide routing channels for signal connections.

**Observation:** Efficient pin placement and placement blockages improved routing quality and minimized congestion.

<img width="1157" height="703" alt="Screenshot 2026-09-05 210231" src="https://github.com/user-attachments/assets/508ec9c7-af05-4e4e-9731-69b5e5ea0339" />
<img width="1332" height="535" alt="Screenshot 2026-09-05 212210" src="https://github.com/user-attachments/assets/851decd5-d2b0-46fa-a48b-743aad69744e" />

---

### 6. Steps to Run Floorplan Using OpenLANE

After synthesis, the floorplanning stage is executed using OpenLANE. This stage generates the chip core, inserts tap and decap cells, creates the power network, and places IO pins.

**Commands Used**

```tcl
prep -design picorv32a
run_floorplan
```

**Observation:** Floorplanning completed successfully and generated all required layout files and reports.
<img width="950" height="863" alt="WhatsApp Image 2026-09-05 at 9 05 28 PM" src="https://github.com/user-attachments/assets/b23f3712-6097-4c31-b767-3f5b7319b08b" />
<img width="906" height="893" alt="WhatsApp Image 2026-09-05 at 9 05 28 PM (1)" src="https://github.com/user-attachments/assets/9f51abd5-7fca-4dbf-9070-59aec3390b30" />
<img width="900" height="908" alt="WhatsApp Image 2026-09-05 at 9 05 44 PM" src="https://github.com/user-attachments/assets/66d4e762-ac47-46b2-976c-8f7be4d00cf5" />

---

### 7. Review Floorplan Files After Generation

The floorplanning process generates several files including DEF, LEF, reports, logs, and configuration files. These outputs provide information about chip dimensions, utilization, macro locations, and pin placement.

**Observation:** The generated reports confirmed successful execution of the floorplanning stage.
<img width="958" height="930" alt="WhatsApp Image 2026-09-05 at 9 13 23 PM" src="https://github.com/user-attachments/assets/ca206d37-1749-4026-b831-34e41dbc1379" />

---

### 8. Review Floorplan Layout Using Magic

The generated DEF file is opened in the Magic VLSI layout tool to visualize the floorplan. The layout shows the core boundary, IO pins, placement rows, and macro locations.

**Observation:** The Magic layout verified that the generated floorplan is correct and ready for placement.

<img width="958" height="930" alt="WhatsApp Image 2026-09-05 at 9 13 47 PM" src="https://github.com/user-attachments/assets/e3dc1ac7-5685-4d5b-931b-832c866b9ef3" />
<img width="971" height="1050" alt="Screenshot 2026-09-05 030459" src="https://github.com/user-attachments/assets/0d4f78e6-c2c4-4da9-b9d3-3a9788e22a33" />

---

# SKY130_D2_SK2 - Library Binding and Placement

### 9. Netlist Binding and Initial Placement

During this stage, the synthesized netlist is mapped to the corresponding standard cells available in the Sky130 standard cell library. Initial placement arranges these cells inside the core while maintaining legal placement rules.

**Observation:** Library binding successfully converted logical gates into physical standard cells.

---

### 10. Optimize Placement Using Estimated Wire-Length

Placement optimization estimates wire length and rearranges standard cells to minimize routing distance, reduce congestion, and improve timing performance.

**Observation:** Optimized placement reduced estimated wire length and improved design quality.
<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/af074638-0ff7-436b-a1b0-203358556f11" />
<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/f1b5c4e9-bbbe-4112-91ed-a9bf5dc76014" />

---

### 11. Final Placement Optimization

The placement engine performs detailed optimization to eliminate overlaps, satisfy design rules, and improve timing. Cells are adjusted until a legal and optimized placement is achieved.

**Observation:** Final placement produced an optimized layout suitable for the routing stage.
<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/11646c50-03fe-4573-9522-33d9e6293a70" />

<img width="1376" height="710" alt="Screenshot 2026-09-05 212348" src="https://github.com/user-attachments/assets/35d9045a-372c-401c-b11a-7d69d6648be5" />

---

### 12. Need for Libraries and Characterization

Standard cell libraries contain timing, power, functional, and physical information required during synthesis, placement, routing, and timing analysis. Characterization generates Liberty (.lib) files that describe the behavior of each standard cell.

**Observation:** Accurate library characterization improves synthesis accuracy and timing analysis.

<img width="1177" height="680" alt="Screenshot 2026-09-05 212459" src="https://github.com/user-attachments/assets/45efff72-0974-4e56-a626-8b089ee1f93b" />
<img width="1152" height="563" alt="Screenshot 2026-09-05 212628" src="https://github.com/user-attachments/assets/a03897fe-051c-4178-8d25-1ba26bac1ded" />

---

### 13. Congestion Aware Placement

Congestion-aware placement predicts routing congestion before routing begins and distributes cells accordingly. This helps reduce routing overflow and improves the overall quality of the layout.

**Observation:** Congestion-aware placement minimized routing congestion and improved routing efficiency.
<img width="676" height="526" alt="Screenshot 2026-09-05 212738" src="https://github.com/user-attachments/assets/4e306ac7-be54-4b41-9ca0-4c1f8c706cad" />
<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/00d82d18-885e-4429-93bc-2dd6b49294fa" />

---

# SKY130_D2_SK3 - Cell Design and Characterization

### 14. Inputs for Cell Design Flow

Cell design requires transistor models, design rules, technology files, layout guidelines, and circuit specifications. These inputs are used to design, verify, and characterize standard cells before they are included in the ASIC design flow.

**Observation:** Proper design inputs ensured accurate standard cell implementation and successful characterization.
<img width="1242" height="700" alt="Screenshot 2026-09-05 212859" src="https://github.com/user-attachments/assets/e811f795-1b01-4f8f-bb5d-101f30580908" />


# SKY130_D2_SK4 - General Timing Characterization Parameters

General timing characterization is used to determine the timing behavior of standard cells under different operating conditions. During characterization, important timing parameters such as propagation delay, transition time, setup time, hold time, rise time, and fall time are measured. These values are stored in Liberty (.lib) files, which are later used by synthesis and Static Timing Analysis (STA) tools to verify the timing performance of the design.

---

## 1. Timing Threshold Definitions

Timing thresholds define the voltage levels at which signal transitions are measured. Commonly, rise and fall times are measured between 20% and 80% of the supply voltage, while propagation delay is calculated between the 50% transition points of the input and output signals. Standardized threshold definitions ensure consistent timing measurements.

**Observation:** Standard timing thresholds provide accurate and consistent delay measurements for all standard cells.

---

## 2. Propagation Delay and Transition Time

Propagation delay is the time taken for a change at the input of a logic gate to appear at its output. Transition time (slew) represents the duration required for a signal to change from logic low to logic high or vice versa. These parameters are critical for evaluating the speed and performance of digital circuits.

**Observation:** Lower propagation delay and faster transition time improve the overall timing performance of the design.

---

## 3. Cell Delay and Slew Calculations

Cell delay depends on input transition time, output load capacitance, and transistor characteristics. During characterization, delay and slew values are calculated for different combinations of input slew and output load. These values are stored as lookup tables in the Liberty (.lib) file for accurate timing analysis.

**Observation:** Accurate delay and slew calculations enable reliable synthesis, timing optimization, and Static Timing Analysis (STA).

---


## Conclusion

In this session, I learned the importance of floorplanning in ASIC physical design. I understood how utilization factor, aspect ratio, macro placement, decoupling capacitors, power planning, and pin placement affect the quality of the final layout. Using OpenLANE and Magic, I successfully generated and verified the floorplan, establishing a strong foundation for the placement stage in the ASIC implementation flow.





# Commands and Tools:

## Tools Used

- **Ubuntu 20.04 LTS** – Linux operating system used for the workshop.
- **Docker** – Container platform used to run the OpenLANE environment.
- **OpenLANE** – Open-source RTL-to-GDSII ASIC implementation flow.
- **Sky130 PDK** – Process Design Kit used for ASIC design.
- **Yosys** – Logic synthesis tool.
- **Magic VLSI** – Layout viewer, DRC, and extraction tool.
- **OpenROAD** – Physical design tool for floorplanning, placement, CTS, and routing.
- **OpenSTA** – Static Timing Analysis (STA) tool.
- **Netgen** – Layout Versus Schematic (LVS) verification.
- **Git & GitHub** – Version control and documentation.
- **VS Code / Terminal** – Used for editing files and executing commands.

---

## Important Commands Used

### Launch Docker
docker


### Navigate to OpenLANE Directory

cd Desktop/work/tools/openlane_working_dir/openlane


### Start Interactive OpenLANE

./flow.tcl -interactive


### Load OpenLANE Package

tcl
package require openlane 0.9


### Prepare Design
prep -design picorv32a


### Run Synthesis
run_synthesis


### Run Floorplan
run_floorplan

### Run Placement
run_placement


### View Floorplan in Magic


magic -T ~/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech \
drc read results/floorplan/picorv32a.floorplan.def &

### View Placement Layout

`
magic -T ~/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech \
drc read results/placement/picorv32a.placement.def &

### View Generated Reports


cd runs/<run_name>/reports


### View Floorplan Results

cd runs/<run_name>/results/floorplan


### View Placement Results

cd runs/<run_name>/results/placement


## Files Generated

- Synthesized Netlist (.v)
- DEF Files
- LEF Files
- Liberty (.lib) Files
- Floorplan Reports
- Placement Reports
- Log Files
- Magic Layout Files

---

## Skills Gained

- ASIC Design Flow
- RTL to GDSII Implementation
- Logic Synthesis
- Floorplanning
- Standard Cell Placement
- Library Characterization
- Static Timing Analysis (STA)
- Physical Verification
- Layout Visualization using Magic
  
- <img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/29832c87-bbb5-4171-805b-fae8e6d06c31" />

  


# Workshop Highlights

Throughout this workshop, I gained hands-on experience with the complete OpenLANE RTL-to-GDSII ASIC design flow using the Sky130 PDK. I learned how open-source EDA tools work together to convert an RTL design into a manufacturable chip layout.

I successfully installed and configured the required design environment, built Docker images, and executed OpenLANE and OpenSTA commands inside Docker containers. This workshop provided practical exposure to ASIC physical design concepts such as floorplanning, placement, clock tree synthesis (CTS), routing, timing analysis, and physical verification.

## Docker Environment Setup

The OpenSTA repository was cloned from GitHub and Docker was used to build the required environment. After verifying the Docker installation, the OpenSTA Docker image was successfully created and executed.

### Commands Used

```bash
git clone https://github.com/parallaxsw/OpenSTA.git

docker --version

docker build --file Dockerfile.ubuntu22.04 --tag opensta .

sudo docker run -it -v $HOME:/data opensta
```

### Observation

- Successfully cloned the OpenSTA repository.
- Verified Docker installation.
- Built the OpenSTA Docker image.
- Started the Docker container successfully.
- Prepared the timing analysis environment.

### Screenshot

![Docker Build](images/day2/docker_build.png)
<img width="1200" height="1600" alt="WhatsApp Image 2026-09-05 at 10 37 06 PM" src="https://github.com/user-attachments/assets/7f8272a3-bba8-4f63-97ca-81a755287b4a" />


---

## Static Timing Analysis using OpenSTA

OpenSTA was used to perform timing analysis on a sample Verilog design. The standard cell library was loaded, the design was linked, clock constraints were created, and timing reports were generated to verify setup timing.

### Commands Used

read_liberty /OpenSTA/examples/nangate45_slow.lib.gz

read_verilog /OpenSTA/examples/example1.v

link_design top

create_clock -name clk -period 10 {clk}

set_input_delay -clock clk 0 {in1 in2}

report_checks

### Observation

- Loaded the Liberty timing library successfully.
- Imported the Verilog netlist.
- Linked the top-level design.
- Created the design clock.
- Applied input delay constraints.
- Generated setup timing reports.
- Verified data arrival time, required time, and timing slack.

### Screenshot

![OpenSTA Timing Report](images/day2/opensta_report.png)

---

## Skills Acquired

- Linux command-line operations
- Docker container management
- OpenSTA timing analysis
- Liberty library loading
- Verilog design linking
- Clock constraint creation
- Timing report analysis
- Understanding setup timing and slack
- Open-source ASIC design flow
- Practical exposure to RTL-to-GDSII implementation


## Author

**Sushmitha Konda**

GitHub: https://github.com/Sushmitha761
