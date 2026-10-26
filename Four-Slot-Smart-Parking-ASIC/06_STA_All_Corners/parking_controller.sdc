create_clock -name clk -period 10.0 [get_ports clk]
set_clock_uncertainty 0.2 [get_clocks clk]

set_input_delay 1.0 -clock clk [get_ports {reset entry exit}]
set_output_delay 1.0 -clock clk [get_ports {slot_count[*] warning full empty gate_open}]
