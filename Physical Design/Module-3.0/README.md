## Physical Design – Magic Layout, Ngspice and Sky130

This module focuses on the practical implementation of CMOS standard cells using **Magic, Ngspice, and the Sky130 PDK**. The experiments cover circuit simulation, CMOS fabrication concepts, physical layout creation, SPICE extraction, characterization, technology files, and DRC verification.

---

## 1. Design Library Cell Using Magic Layout & Ngspice Characterization

A standard cell is a pre-designed and characterized circuit that can be reused during digital ASIC implementation. In this lab, the **CMOS inverter** was used as the basic standard cell and its electrical and physical characteristics were studied.

### CMOS Inverter Ngspice Simulation

The CMOS inverter was simulated using **Ngspice** to understand its electrical behaviour. Different input voltage conditions were applied and the corresponding output response was observed. This helped in understanding how PMOS and NMOS transistors work together to perform logic inversion.

### IO Placer Revision

IO placement determines where the input and output pins of a cell or design are physically positioned. The placement of the pins was studied to understand how proper pin positioning helps in routing and standard-cell integration during physical design.

1. file:///home/vsduser/Pictures/Screenshot%20from%202026-09-08%2021-04-26.png

### SPICE Deck Creation for CMOS Inverter

A SPICE deck contains the circuit description, transistor models, input signals, simulation commands, and required parameters. A SPICE deck was created for the CMOS inverter so that its electrical behaviour could be simulated using Ngspice.

### Spice Simulation Lab for CMOS Inverter

The inverter was simulated using the created SPICE deck. The input and output waveforms were analysed to verify the expected inverter operation and switching behaviour.

### Switching Threshold – Vm

The switching threshold voltage, represented as **Vm**, is the input voltage at which the inverter changes between its logic states. The voltage transfer characteristics were studied to understand the switching point and noise behaviour of the CMOS inverter.

### Static and Dynamic Simulation

Static simulation was used to study the DC voltage transfer characteristics of the inverter, while dynamic simulation was used to observe the response of the inverter when the input changes with time. These simulations provide information about the logic behaviour and switching performance of the cell.

### Cloned VSD Cell Design

The steps required to create a custom or cloned VSD standard cell were studied. This includes creating the layout, extracting the circuit, verifying the layout, and preparing the cell for use in a digital physical-design environment.

---

## 2. Inception of Layout – CMOS Fabrication Process

Physical layout represents the actual geometrical structures that are fabricated on silicon. Therefore, understanding the CMOS fabrication process is important before creating a layout.

### Active Region Formation

The active region defines the portion of silicon where transistor source and drain regions are formed. It provides the basic region required for creating the MOS transistor.

### N-Well and P-Well Formation

N-well and P-well regions are created to provide the required body regions for PMOS and NMOS transistors. Proper well formation is important for correct transistor operation and isolation.

### Gate Terminal Formation

The gate is formed using the gate material over the active region. The intersection of the gate and active region determines the transistor channel.

### Lightly Doped Drain – LDD Formation

LDD formation introduces lightly doped regions near the source and drain. This helps reduce the electric field near the drain and improves transistor reliability.

### Source and Drain Formation

Source and drain regions are heavily doped to create the terminals through which current flows in the MOS transistor.

### Local Interconnect Formation

Local interconnects provide short electrical connections between transistor terminals and other circuit structures. They help establish connectivity before higher-level metal routing.

### Metal Layer Formation

Metal layers are used to create longer electrical connections between devices and circuit blocks. Multiple metal layers allow complex circuits to be connected efficiently.

---

## 3. Sky130 Basic Layers and LEF Using Inverter

The **Sky130 PDK** provides the technology information required to design circuits using the SkyWater 130 nm process. Different physical layers are used to represent wells, active regions, poly, contacts, and metal connections.

### Sky130 Basic Layout Layers

The basic Sky130 layers were studied to understand how each layer represents a physical structure in the CMOS process. The relationship between the fabrication process and the corresponding layout layers was also analysed.

### CMOS Inverter Layout Using Sky130

A CMOS inverter was physically implemented using the Sky130 layers in Magic. PMOS and NMOS devices were created and connected using poly, diffusion, contacts, and metal layers.

### Standard Cell Layout Creation

The inverter layout was arranged as a standard cell with proper dimensions, input/output pins, and power connections. The layout structure was designed so that it can be used as a reusable cell in a digital design.

### SPICE Netlist Extraction

After completing the layout, the circuit was extracted to generate a SPICE netlist. This extracted netlist represents the electrical connectivity of the physical layout.

The extracted circuit can then be simulated using Ngspice to verify whether the layout behaves like the intended CMOS inverter.

---

## 4. Sky130 Technology File Labs

Technology files contain the information required by layout and verification tools to understand a particular fabrication technology.

### Final SPICE Deck Using Sky130 Technology

The final SPICE deck was prepared using the Sky130 technology information and transistor models. This allows the inverter to be simulated using technology-specific device characteristics.

### Inverter Characterization Using Sky130 Model File

The CMOS inverter was characterized using the Sky130 model files. The characterization helps understand parameters such as switching behaviour, voltage transfer characteristics, and response of the inverter under the selected technology conditions.

### Magic Tool and Sky130 Tech Rules

Magic was configured with the required Sky130 technology rules. These rules allow the tool to interpret the layout layers correctly and perform technology-specific checks.

---

## 5. Magic Tool and DRC Rules

**Magic** is a VLSI layout tool used to create, inspect, extract, and verify physical layouts. In this lab, Magic was used to create the CMOS inverter layout and perform DRC verification.

### Introduction to Magic and DRC

Design Rule Checking verifies whether the physical layout follows the manufacturing rules of the selected technology. These rules define requirements such as minimum width, spacing, enclosure, and overlap.

### Loading Sky130 Technology Rules

The Sky130 technology rules were loaded into Magic so that the layout could be checked according to the actual technology requirements.

### Understanding DRC Errors

When a layout violates a design rule, Magic reports a DRC error. Each error was studied by examining the affected geometrical structures in the layout.

### DRC Error as a Geometrical Construct

Instead of treating a DRC message as only an error number, the violation was analysed based on the actual geometry of the layout. This helps identify whether the problem is related to width, spacing, overlap, enclosure, or another physical constraint.

---

## 6. Poly Error and Sky130 Technology Debugging

Poly-related design rules are important because the poly layer forms the gate of the MOS transistor. Incorrect poly geometry can result in DRC violations or incorrect transistor structures.

### Fixing Poly-Related Errors

Poly-related errors in the Sky130 technology setup were investigated and corrected by checking the geometry and the applicable technology rules.

### Poly Resistor Implementation

The concept of implementing a resistor using the poly layer was studied. The electrical behaviour of a poly resistor depends on its physical dimensions and technology-specific properties.

### DRC Challenge – Geometrical Analysis

DRC challenges were used to understand how a reported violation corresponds to a specific geometrical condition in the layout. This approach helps in debugging layout problems systematically.

### Missing or Incorrect DRC Rules

The DRC rule set was analysed to identify missing or incorrect rules. Understanding these rules is important because an incorrect rule definition can lead to false errors or missed violations during physical verification.

---

## 7. Complete Standard Cell Development Flow

The complete process studied in these labs can be represented as:

```text
CMOS Circuit
     ↓
Ngspice Simulation
     ↓
CMOS Fabrication Study
     ↓
Sky130 Layer Understanding
     ↓
Magic Layout Creation
     ↓
SPICE Extraction
     ↓
Inverter Characterization
     ↓
DRC Verification
     ↓
LEF Preparation
     ↓
Standard Cell Integration
```

This flow shows how a circuit designed at the electrical level is converted into a physical layout and verified before being used in a digital ASIC physical-design flow.

---

## 8. Tools Used

| Tool / Technology | Purpose                                               |
| ----------------- | ----------------------------------------------------- |
| **Magic**         | Physical layout creation, extraction and DRC          |
| **Ngspice**       | Circuit simulation and characterization               |
| **Sky130 PDK**    | Technology layers, device models and design rules     |
| **SPICE**         | Circuit and extracted-layout simulation               |
| **LEF**           | Physical abstract representation of the standard cell |

---

## 9. Learning Outcome

Through these experiments, the complete relationship between **CMOS circuit design, fabrication, physical layout, simulation, extraction, characterization, and verification** was studied.

The practical work provided hands-on experience in:

* CMOS inverter simulation
* SPICE deck creation
* Switching threshold analysis
* Static and dynamic characterization
* CMOS fabrication concepts
* Sky130 layout layers
* Magic layout creation
* SPICE extraction
* Standard-cell development
* LEF preparation
* DRC verification
* DRC error debugging
* Poly-related layout analysis
* Technology-rule debugging

The final outcome is a clear understanding of how a **CMOS circuit is transformed into a verified physical standard cell and prepared for integration into an ASIC physical-design flow**.
