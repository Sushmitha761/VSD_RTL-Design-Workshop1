# Final Steps for P&R Labs Using TritonRoute and OpenSTA

The final stage of the Physical Design flow mainly focuses on routing, Power Distribution Network generation, Design Rule Check, TritonRoute detailed routing, and post-route timing analysis using OpenSTA. At this stage, the placed design is converted into a completely connected physical layout. The final layout is then checked for physical design-rule violations and timing issues before generating the final GDSII file.

## Routing and Design Rule Check

Routing is the process of creating physical connections between the standard cells and other components of the design using different metal layers and vias. After placement, the nets of the design are routed through the available routing resources. Once routing is completed, Design Rule Check is performed to verify whether the layout follows the manufacturing rules of the selected technology. DRC mainly checks geometrical conditions such as metal width, metal spacing, via rules, layer restrictions, connectivity, and other fabrication-related constraints. A DRC-clean layout indicates that the physical layout satisfies the required design rules.

# Power Distribution Network

The Power Distribution Network, or PDN, is responsible for distributing power and ground throughout the chip. It provides VDD and VSS connections from the power source to the standard cells and other blocks in the design. The PDN is constructed using power rings, power straps, and standard-cell power rails. A properly designed power network provides reliable power delivery and helps reduce problems such as voltage drop and power integrity issues.

## Introduction to Maze Routing and P&R Algorithm

Maze routing is a path-finding technique used in Place and Route to find a suitable path between two points while avoiding obstacles. The routing area is divided into a grid, and the router searches through the available grid locations until it reaches the destination. Once the destination is reached, the path is traced back to obtain the routing connection. Maze routing is useful in congested areas where a direct path between two pins is not available.

## Lee's Algorithm

Lee's algorithm is a grid-based maze-routing algorithm used to find a valid routing path between a source and destination. The algorithm starts from the source and propagates through neighbouring grid locations until the destination is reached. After reaching the destination, the path is traced backwards to obtain the final route. This approach allows the routing tool to find a valid path while avoiding blocked regions and routing obstacles.

## Design Rule Check

Design Rule Check is an important physical verification step performed after routing. It verifies whether the final layout follows the manufacturing rules defined by the technology. The layout is checked for minimum metal width, minimum spacing, via dimensions, layer restrictions, connectivity, and other geometrical requirements. Any DRC violations must be identified and corrected before the final layout is accepted.

# Power Distribution Network and Routing

After floorplanning and placement, the power distribution network is created and the signal-routing process is started. The PDN provides power and ground connections, while the routing stage establishes the signal connections between different cells. The complete process includes power planning, standard-cell placement, global routing, detailed routing, and physical verification.

## Lab Steps to Build Power Distribution Network

The PDN generation process begins by creating power rings around the core area. Power straps are then created across the design and connected to the appropriate power rails of the standard cells. The VDD and VSS networks are connected throughout the core so that all required cells receive stable power and ground connections. After generation, the PDN is checked for proper connectivity and physical correctness.

## Lab Steps from Innovus Scripts to Standard Cell Placement

Physical-design scripts are used to define the floorplan, technology settings, placement constraints, power planning, and other implementation parameters. During standard-cell placement, the cells from the synthesized netlist are physically arranged inside the core area. The placement process considers factors such as design utilization, timing, congestion, cell connectivity, and routing requirements. Good placement is important because it directly affects the quality of routing and timing.

## Basics of Global and Detailed Routing

Routing is performed in two major stages: global routing and detailed routing. Global routing determines the approximate routing paths and the routing resources required for each net. It generates routing guides that specify the regions in which the nets should be routed. Detailed routing then converts these guides into actual metal and via geometries while following the technology design rules. Therefore, global routing provides the routing plan, while detailed routing creates the final physical connections.

# TritonRoute Features

TritonRoute is used for detailed routing in the physical-design flow. It takes the routing information generated during global routing and creates the actual physical connections between the pins of the design. TritonRoute considers routing guides, metal layers, vias, obstacles, pin access, connectivity, and design-rule constraints while generating the final routes.

## Handling Pre-Processed Routing Guides

TritonRoute uses the routing guides generated by the global-routing stage. These guides provide information about the regions through which different nets are expected to pass. During detailed routing, TritonRoute follows these routing guides while considering available routing resources, blockages, pin locations, and technology design rules.

## Intra-Guide Connectivity and Intra-Layer Routing

TritonRoute analyses the connectivity information within the routing guides and creates physical connections across the required routing regions. It determines how different pins and routing segments should be connected using appropriate metal layers and vias. This process ensures that the required connectivity is maintained while satisfying the physical constraints of the technology.

## TritonRoute Method to Handle Connectivity

The main purpose of TritonRoute is to create complete physical connectivity for the nets in the design. It connects source and destination pins, selects suitable routing layers, inserts vias where required, and avoids obstacles and design-rule violations. The routing process continues until the required connections are physically completed.

## Routing Topology Algorithm and Final GDS

Routing topology defines how the different sections of a net are connected in the physical layout. After detailed routing, the design contains the final metal and via geometries required for physical verification. Once routing and verification are completed, the physical database can be used to generate the final GDSII layout. The GDSII file represents the final physical layout that can be used in the ASIC fabrication flow.

# Post-Route

Post-route analysis is performed after detailed routing is completed. Unlike pre-route timing analysis, post-route analysis considers the actual routed wires and their parasitic effects. The resistance and capacitance introduced by the routed interconnects can affect signal delay, clock behaviour, setup timing, and hold timing.

Parasitic information from the routed design is used along with the Liberty timing library and SDC constraints for final Static Timing Analysis. OpenSTA can then be used to analyse the final setup and hold timing of the design. Critical paths, timing slack, clock latency, and clock skew are checked to determine whether the routed design satisfies the required timing constraints.

The post-route flow can be represented as:

```text
Detailed Routing
      ↓
Parasitic Extraction
      ↓
Post-Route Timing Information
      ↓
Liberty Timing Library
      ↓
SDC Constraints
      ↓
OpenSTA
      ↓
Setup and Hold Analysis
      ↓
Final Timing Verification
```

# Final P&R Flow

The complete Physical Design flow covered in these labs starts from synthesis and continues through floorplanning, power planning, standard-cell placement, global routing, detailed routing using TritonRoute, Design Rule Check, parasitic extraction, and post-route timing analysis using OpenSTA. After all physical and timing checks are completed successfully, the final GDSII file is generated.

```text
Synthesis
   ↓
Floorplan
   ↓
Power Distribution Network
   ↓
Standard Cell Placement
   ↓
Global Routing
   ↓
Detailed Routing – TritonRoute
   ↓
Design Rule Check
   ↓
Parasitic Extraction
   ↓
Post-Route Timing Analysis – OpenSTA
   ↓
Final Verification
   ↓
GDSII Generation
```

These labs provide practical understanding of how a synthesized digital design is converted into a complete physical layout. The process covers power distribution, routing algorithms, global and detailed routing, TritonRoute, DRC, post-route timing analysis, and final GDSII generation, completing the major stages of an ASIC Physical Design flow.
