# Module-3 – Combinational and Sequential Logic Optimization



This document covers the optimization techniques applied during logic synthesis — for both combinational and sequential circuits — along with the corresponding lab exercises performed in Yosys.

## Table of Contents
1. [Introduction](#introduction)
2. [Combinational Logic Optimization](#combinational-logic-optimization)
3. [Sequential Logic Optimization](#sequential-logic-optimization)
4. [Constant Propagation](#constant-propagation)
5. [Unused Output Optimization](#unused-output-optimization)
6. [State Optimization](#state-optimization)
7. [Logic Cloning](#logic-cloning)
8. [Retiming](#retiming)
9. [Optimization Passes Performed in Yosys](#optimization-passes-performed-in-yosys)
10. [Laboratory Exercises](#laboratory-exercises)
11. [Key Learning Outcomes](#key-learning-outcomes)

## Introduction


Digital circuit optimization is an important stage of the synthesis process. After converting RTL into logic gates, the synthesis tool analyzes the circuit to remove unnecessary logic, simplify Boolean expressions, and generate an implementation that consumes less area while preserving the required functionality. This session explored the optimization techniques Yosys applies to both combinational and sequential circuits.


<img width="765" height="1280" alt="WhatsApp Image 2026-08-21 at 7 56 17 PM" src="https://github.com/user-attachments/assets/28444317-c329-4051-a3bb-ae408cb923ae" />


## Combinational Logic Optimization



Combinational optimization reduces unnecessary logic **without changing circuit functionality**. The synthesis tool analyzes Boolean expressions and removes redundant hardware, producing a smaller, more efficient gate-level implementation.

**Objectives:**

* Reduce the number of logic gates.
* Simplify Boolean expressions.
* Minimize chip area.
* Improve circuit speed.
* Reduce power consumption.

---

## Sequential Logic Optimization



Sequential optimization applies to circuits containing memory elements such as flip-flops. Unlike combinational optimization, the synthesis tool must **preserve the behavior of sequential elements** while removing unnecessary registers and simplifying the logic connected to them.

**Typical goals:**

* Removing redundant flip-flops.
* Propagating constant values through sequential logic.
* Eliminating unreachable logic.
* Improving timing while maintaining functional equivalence.


<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 35 19 PM" src="https://github.com/user-attachments/assets/172c1ac6-d1a6-40d0-ad0b-fba0ee65031a" />


## The synthesized circuit removes unnecessary sequential logic while preserving the behavior of the original design.


## Constant Propagation


Constant propagation replaces signals that always carry a fixed logic value **directly with that constant** during synthesis. Instead of implementing logic to compute an already-known value, the synthesis tool substitutes the constant and removes redundant gates.

**Advantages:**

* Reduces logic complexity.
* Decreases hardware utilization.
* Improves timing.
* Lowers power consumption.
* 
Constant Propagation :

<img width="958" height="930" alt="WhatsApp Image 2026-08-19 at 10 58 36 PM" src="https://github.com/user-attachments/assets/77683c62-e04e-458f-8c54-2708b4b0f71c" />



The synthesized netlist shows that constant-valued signals are propagated through the logic, allowing unnecessary gates to be removed during optimization.



## Unused Output Optimization


If a signal or output is never used by the remaining circuit, the synthesis tool recognizes it has no effect on final functionality and **automatically removes it** during optimization — reducing total gate count and preventing unnecessary hardware from being implemented.

This demonstrates that synthesis tools generate hardware only for logic that actually contributes to the final outputs.

Logic Simplification after Optimization**

<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 11 01 43 PM" src="https://github.com/user-attachments/assets/88ba4878-3a2b-430a-b592-00f6c10cb36e" />


The optimized netlist contains fewer logic gates while maintaining the same functionality as the original RTL design.



## State Optimization


Finite State Machines (FSMs) can contain equivalent or unnecessary states. During optimization, these states may be **merged or removed**, reducing required hardware while preserving original behavior.

**State optimization generally includes:**

* Eliminating equivalent states.
* Efficient state encoding.
* Simplifying next-state logic.
* Reducing overall hardware complexity.



## Logic Cloning


Logic cloning is a performance optimization where selected logic cells are **duplicated** to reduce fan-out and improve timing. Instead of one gate driving many loads, additional copies are created so each copy drives fewer destinations — reducing delay on critical timing paths.



## Retiming


Retiming is a sequential optimization technique where flip-flops are **repositioned across combinational logic** without changing circuit functionality. Its purpose is to balance propagation delays between pipeline stages and improve maximum operating frequency.

Unlike other optimizations, retiming modifies only **register placement** while preserving the logical behavior of the design.


## Optimization Passes Performed in Yosys


During synthesis, Yosys automatically performs several optimization passes to simplify the generated hardware:

| **Optimization Pass**     | **Purpose**                              |
| ------------------------- | ---------------------------------------- |
| Constant propagation      | Replace known-constant signals directly  |
| Dead logic elimination    | Remove logic with no effect on outputs   |
| Boolean simplification    | Reduce Boolean expressions               |
| Removal of unused wires   | Strip unreferenced signals               |
| Removal of unused cells   | Strip unreferenced gates/cells           |
| Expression simplification | Simplify equivalent expressions          |
| Resource sharing          | Reuse hardware across similar operations |

These optimizations collectively produce an efficient gate-level netlist.


## Laboratory Exercises


### Lab 1 – Constant Propagation


A simple combinational circuit was synthesized to observe how Yosys replaces constant values directly within the logic network. After optimization, unnecessary gates were removed, producing a simpler implementation.

### Lab 2 – Logic Simplification


A multiplexer-based design was synthesized to demonstrate how Boolean expressions simplify when one input remains constant. The synthesized circuit contained fewer logic gates while maintaining identical functionality.

### Lab 3 – Expression Optimization


Additional combinational logic examples were analyzed to observe how the synthesis tool recognizes equivalent expressions and minimizes redundant hardware.

### Lab 4 – Boolean Reduction


Nested conditional expressions were synthesized and optimized. Yosys simplified the resulting Boolean equation, removing unnecessary logic while preserving the expected output.

### Lab 5 – Sequential Optimization (D Flip-Flop)


A D flip-flop with an asynchronous reset and constant assignment was synthesized. Since the output eventually settled to a constant value, the synthesis tool simplified portions of the sequential logic.

### Lab 6 – Constant Register Optimization


A flip-flop whose output always remained at logic `1` was synthesized. Since the register never changed state, Yosys optimized the circuit by removing unnecessary sequential elements and replacing them with constant logic wherever applicable.

**Figure 4: Constant Register Optimization**
<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 34 05 PM" src="https://github.com/user-attachments/assets/b224cd42-59c0-4a0f-ad34-f737bca1ce6b" />
<img width="367" height="225" alt="Screenshot 2026-08-17 185602" src="https://github.com/user-attachments/assets/61bc3dc4-5d79-481b-88d2-472bf0d3d6c6" />
<img width="1876" height="1048" alt="Screenshot 2026-08-17 173149" src="https://github.com/user-attachments/assets/88d75e37-1a80-4e91-9264-954b11077289" />


Since the register output always remains at logic '1', Yosys replaces the flip-flop with constant logic, reducing hardware complexity.

**Figure 5: Waveform Verification**
<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 49 17 PM" src="https://github.com/user-attachments/assets/b1d30ce5-4fb4-4a39-8b24-e87bb74afc00" />


The waveform confirms that the optimized circuit produces the expected output behavior after synthesis.

**Figure 6: Final Optimized Netlist**
<img width="958" height="930" alt="WhatsApp Image 2026-08-19 at 10 35 54 PM" src="https://github.com/user-attachments/assets/f63c3218-6ede-4728-ad55-395061554640" />


The final synthesized netlist reflects the cumulative effect of multiple optimization passes performed by Yosys.

## Verification of Optimization Results


**Figure 7: Optimization Check 1**
<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 31 15 PM" src="https://github.com/user-attachments/assets/487feb3c-9077-4c42-9544-6f8daa880b99" />


The generated netlist confirms that unnecessary logic has been removed.


**Figure 8: Optimization Check 2**
<img width="1600" height="783" alt="WhatsApp Image 2026-08-19 at 10 32 19 PM" src="https://github.com/user-attachments/assets/7286e498-33e1-4092-b715-1cfdeccfc372" />


The optimized circuit preserves the original functionality while reducing hardware.



**Figure 9: Optimization Check 3**

<img width="958" height="930" alt="WhatsApp Image 2026-08-19 at 10 45 33 PM" src="https://github.com/user-attachments/assets/aff13f42-666c-427f-88b3-d90bd7843371" />

This netlist demonstrates additional logic simplifications performed by Yosys.




| **Lab** | **Focus**                      | **Key Result**                                            |
| ------- | ------------------------------ | --------------------------------------------------------- |
| 1       | Constant propagation           | Redundant gates removed via constant substitution         |
| 2       | Logic simplification           | MUX simplified when one input held constant               |
| 3       | Expression optimization        | Equivalent expressions merged/minimized                   |
| 4       | Boolean reduction              | Nested conditionals reduced to simpler Boolean logic      |
| 5       | Sequential optimization        | D-FF with async reset simplified to constant-driven logic |
| 6       | Constant register optimization | Always-`1` flip-flop replaced with constant logic         |

---

## Key Learning Outcomes



* Understood the difference between combinational and sequential optimization.
* Learned how constant propagation simplifies digital circuits.
* Observed removal of unused outputs and redundant logic during synthesis.
* Explored optimization techniques such as state optimization, cloning, and retiming.
* Analyzed how Yosys automatically performs multiple optimization passes to generate an efficient gate-level implementation.
* Verified optimization results using synthesized netlists and schematic visualization.

### Day 3 Checklist


* [ ] Check for constant-valued signals that synthesis can propagate and simplify.
* [ ] Confirm unused outputs/signals are eliminated from the final netlist.
* [ ] Review FSM designs for equivalent or unreachable states before synthesis.
* [ ] Identify high fan-out nets that may benefit from logic cloning.
* [ ] Consider retiming for pipeline stages with unbalanced propagation delays.
* [ ] Compare pre- and post-optimization netlists/schematics to confirm functional equivalence.

