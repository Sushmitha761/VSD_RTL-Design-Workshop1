# Module-1

# Table of Content

## Module 1 – Inception of Open-Source EDA, OpenLANE and Sky130 PDK


- [SKY130_D1_SK3 – Get Familiar to Open-Source EDA Tools](#sky130_d1_sk3---get-familiar-to-open-source-eda-tools)




# SKY130_D1_SK3 - Get Familiar with Open-Source EDA Tools

In this session, I explored the OpenLANE environment and understood how the project is organized. OpenLANE follows a structured directory hierarchy where each folder is dedicated to a specific stage of the ASIC physical design flow. Understanding this directory structure is important because it allows designers to locate generated reports, logs, configuration files, and design outputs efficiently.

The **designs** directory contains the RTL source files, configuration files, and constraints required for each design. The **pdks** directory stores the Sky130 Process Design Kit, which provides technology-specific information such as standard cell libraries, LEF files, SPICE models, technology files, and design rules. The **scripts** directory contains automation scripts used throughout the OpenLANE flow, while the **runs** directory is automatically generated during execution to store the outputs of each design run.

###  OpenLANE Directory Structure

![OpenLANE Directory](images/day1/openlane_directory.png)
file:///home/vsduser/Pictures/Screenshot%20from%202026-09-04%2023-41-31.png<img width="1920" height="940" alt="image" src="https://github.com/user-attachments/assets/e09939b9-91f8-4b2e-ad50-4cb44c49225a" />
<img width="866" height="197" alt="Screenshot 2026-09-04 230533" src="https://github.com/user-attachments/assets/038b47b5-318c-417d-85fc-3d0224593564" />
<img width="1081" height="710" alt="Screenshot 2026-09-05 013015" src="https://github.com/user-attachments/assets/4ad1dc93-c405-4015-9e74-c4f4d19b92f6" />



---

The next step in the OpenLANE flow is **Design Preparation**. This stage initializes the design environment by loading the selected Process Design Kit (PDK), reading the configuration files, merging LEF files, and creating a dedicated run directory for the design. The preparation stage ensures that all required technology and design information is available before starting synthesis.

The design preparation was performed using the following commands:

```tcl
./flow.tcl -interactive
package require openlane 0.9
prep -design picorv32a
```

After successful execution, OpenLANE creates a new run directory where all intermediate files, reports, logs, and results are stored.

### Design Preparation

![Design Preparation](images/day1/design_preparation.png)

file:///home/vsduser/Pictures/Screenshot%20from%202026-09-05%2010-52-45.png<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/4da17259-a3d9-42b1-af3b-5bd62cab9d46" />


---

After the design preparation step, the synthesis stage was executed using the **run_synthesis** command. During synthesis, the RTL design is converted into a gate-level netlist using the standard cell library available in the Sky130 PDK. Logic optimization is also performed to improve area, timing, and overall design quality.

Once synthesis is completed, OpenLANE automatically generates several files and directories. The **logs** directory contains runtime information, the **reports** directory stores timing, area, and utilization reports, while the **results** directory contains the synthesized Verilog netlist and other intermediate design files. These files help designers verify whether synthesis has completed successfully.

###  Review Files After Design Preparation and Synthesis

![Review Files](images/day1/review_files.png)
1.file:///home/vsduser/Pictures/Screenshot%20from%202026-09-05%2011-20-56.png<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/ef508de1-5115-475a-82a4-fddad55fdb8d" />
2.<img width="935" height="908" alt="Screenshot 2026-09-05 111618" src="https://github.com/user-attachments/assets/ae11c158-90af-4d8d-94f6-dde36c9fedf0" />
3.file:///home/vsduser/Pictures/Screenshot%20from%202026-09-05%2011-12-15.png<img width="958" height="930" alt="image" src="https://github.com/user-attachments/assets/977dfd81-632b-4cf4-a259-3ce0ffcd0726" />



---

The OpenLANE project is completely open source and is available on GitHub. The official repository contains installation instructions, documentation, reference designs, automation scripts, and complete source code. During this workshop, the **picorv32a** reference design provided in the OpenLANE repository was used to understand the complete RTL-to-GDSII implementation flow.

The GitHub repository also provides examples for running synthesis, floorplanning, placement, routing, timing analysis, and physical verification.

###  OpenLANE GitHub Repository

![OpenLANE GitHub](images/day1/openlane_github.png)
https://github.com/Openlane effables
---

Finally, the synthesis results were analyzed by reviewing the generated reports. Important parameters such as **cell count**, **chip area**, **logic utilization**, **timing information**, and **optimization statistics** were examined. These reports confirm that the RTL design has been successfully synthesized into a gate-level netlist and is ready for the next stage of the physical design flow, which is floorplanning.

Analyzing synthesis reports is an important step because it provides an early indication of the design quality before proceeding with placement and routing.

###  Synthesis Results

![Synthesis Results](images/day1/synthesis_results.png)<img width="1916" height="981" alt="Screenshot 2026-09-05 014417" src="https://github.com/user-attachments/assets/93bdefa2-2798-41d2-b87b-266053cee086" />



---

## Conclusion

This session provided a practical understanding of the OpenLANE working environment. I learned about the directory structure, design preparation process, synthesis flow, generated reports, and how to analyze synthesis results. These steps form the foundation for the subsequent stages of ASIC physical design, including floorplanning, placement, clock tree synthesis, routing, and physical verification.
