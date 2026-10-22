# Four-Slot Smart Parking Occupancy and Gate Controller ASIC

## 1. Introduction

The Four-Slot Smart Parking Occupancy and Gate Controller ASIC is a digital hardware design developed to manage vehicle parking occupancy in a small parking area with a maximum capacity of four vehicles. The project uses Verilog HDL to implement a controller that tracks occupied parking slots, processes vehicle entry and exit requests, and generates parking status and gate-control signals.

The design demonstrates how a real-world parking management function can be implemented at the Register Transfer Level (RTL) and taken through an Application-Specific Integrated Circuit (ASIC) design flow. The design is simulated and synthesized, followed by physical-design implementation and timing analysis using the SKY130 standard-cell platform and open-source VLSI tools.

This project provides practical experience in digital logic design, RTL coding, functional verification, logic synthesis, physical design, and static timing analysis.

## 2. Project Description

The proposed system is designed to manage a parking area containing four parking slots. It maintains a digital count of occupied slots and updates this count based on vehicle entry and exit requests.

When a valid vehicle entry request is received, the controller updates the occupancy count if parking capacity is available. When a valid exit request is received, the count decreases if at least one vehicle is parked. The controller also generates status signals to indicate whether the parking area is full or empty and provides a gate-control output according to the implemented control logic.

The design is written in Verilog HDL and verified using a testbench that applies different input sequences, including reset, entry, and exit operations. After functional verification, the RTL can be synthesized into a standard-cell netlist and processed through the ASIC physical-design flow.

The project uses the SKY130 HD standard-cell library and tools such as Icarus Verilog, GTKWave, Yosys, OpenLane, OpenROAD, and OpenSTA for simulation, waveform inspection, synthesis, physical design, and timing analysis.

### 2.1 Main Features

- Four-slot parking occupancy tracking.
- Vehicle entry and exit request processing.
- Full and empty parking status generation.
- Gate-control signal generation.
- Verilog RTL implementation and testbench verification.
- ASIC synthesis and physical-design implementation.
- Static timing analysis across selected process, voltage, and temperature (PVT) corners.

### 2.2 Project Scope

This project implements the **digital parking controller**, not a complete physical parking installation. Real vehicle sensors, a gate motor, and an external display or monitoring system would require additional hardware and interface integration.

## 3. Real-World Applications

### 3.1 Small Residential Parking Areas

The controller can be adapted for small apartment parking areas with a limited number of parking spaces. It tracks occupied slots and indicates when the configured parking capacity is reached.

### 3.2 Office and Campus Parking

Small offices, laboratories, and campus parking areas can use similar occupancy-control logic to monitor the number of vehicles inside a designated parking zone.

### 3.3 Parking Gate Automation

The `gate_open` output can act as a digital command signal for an external gate-control interface. A suitable motor driver, safety sensors, and gate mechanism would be required for physical gate operation.

### 3.4 Parking Occupancy Indicators

The `full`, `empty`, and `warning` outputs can be connected to external indicator circuits or a monitoring controller to display parking availability.

### 3.5 Embedded Systems and IoT Integration

The controller can be integrated with a microcontroller or communication interface to share occupancy information with a monitoring system. Communication and networking functionality are not implemented in the current RTL.

### 3.6 ASIC and VLSI Design Education

The project demonstrates practical digital-design concepts, including counters, registers, comparators, combinational control logic, and sequential circuits. It also provides experience with simulation, synthesis, physical design, and static timing analysis.

### 3.7 Scalable Parking Management Systems

The four-slot controller can serve as a reference architecture for designing larger-capacity systems. Increasing the capacity would require appropriate counter sizing, updated status comparisons, and additional verification.

## 4. Benefits

- Tracks parking occupancy digitally.
- Prevents the occupancy count from exceeding the configured capacity.
- Generates full, empty, and early-warning status signals.
- Provides a gate-control output for external hardware integration.
- Demonstrates an end-to-end ASIC design workflow.
- Offers a foundation for future expansion and system integration.

## 5. Limitations

- The current design supports a maximum of four vehicles.
- Physical vehicle sensors and gate motors are not included in the RTL.
- Display, communication, and IoT functionality require additional integration.
- The controller depends on valid entry and exit requests to maintain an accurate occupancy count.

## 6. Future Enhancements

- Extend the design to support more parking slots.
- Add sensor-interface logic for automatic vehicle detection.
- Integrate a display for real-time parking availability.
- Add communication interfaces for remote occupancy monitoring.
- Introduce safety checks and additional gate-control conditions.
- Perform further verification and physical-design optimization.

## 7. Conclusion

The Four-Slot Smart Parking Occupancy and Gate Controller ASIC demonstrates the implementation of a practical parking-control function using Verilog HDL. It combines sequential logic, occupancy counting, status generation, and gate-control logic in a compact digital design.

The project also demonstrates an ASIC implementation workflow involving functional verification, synthesis, physical design, and static timing analysis using the SKY130 HD platform and open-source VLSI tools. It serves as a useful foundation for learning RTL-to-GDSII implementation and for developing more advanced parking-management controllers.








