set design_name top
#set device xc7a35tcpg236-1 REPLACED
set device xc7a100tcsg324-1
set_part $device
# Read in source files
source top_rtl_list.tcl
# Synthesize, Place and Route the design
read_xdc ./${design_name}_timing.xdc
synth_design -top $design_name -part $device
read_xdc ./${design_name}_physical.xdc
place_design
route_design
write_checkpoint -force routed_design
# Report
set rep_dir ./reports
file mkdir $rep_dir
check_timing -file $rep_dir/post_route_timing_check.rpt
report_timing_summary -file $rep_dir/post_route_timing_summary.rpt
report_clock_utilization -file $rep_dir/post_route_clock_util.rpt
report_utilization -file $rep_dir/post_route_util.rpt
report_io -file $rep_dir/post_route_io.rpt
# Make bitstream file
write_bitstream -force ${design_name}.bit
write_verilog -force ${design_name}_netlist.v
# After write_bitstream ...
open_hw_manager
connect_hw_server
open_hw_target
current_hw_device [lindex [get_hw_devices] 0]
set_property PROGRAM.FILE [format "%s.bit" $design_name] [current_hw_device]
program_hw_devices [current_hw_device]
close_hw_target
disconnect_hw_server
close_hw_manager
