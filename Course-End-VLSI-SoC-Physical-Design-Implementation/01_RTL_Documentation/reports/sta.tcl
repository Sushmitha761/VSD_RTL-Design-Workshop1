read_liberty /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog synthesis/sequence_detector_sky130.v
link_design sequence_detector

read_sdc constraints.sdc

report_checks -path_delay max
report_checks -path_delay min
report_worst_slack -max
report_tns
