## Clock: 100 MHz system oscillator (Bank 35 MRCC)
set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5} [get_ports clk]

## Reset on center pushbutton BTNC (active-high in your RTL)
## If you later decide reset should be active-low, invert in RTL.
set_property -dict { PACKAGE_PIN N17  IOSTANDARD LVCMOS33 PULLUP true } [get_ports { reset }]

## Map up_cnt[3:0] to four LEDs
set_property -dict { PACKAGE_PIN H17  IOSTANDARD LVCMOS33 } [get_ports { up_cnt[0] }]
set_property -dict { PACKAGE_PIN K15  IOSTANDARD LVCMOS33 } [get_ports { up_cnt[1] }]
set_property -dict { PACKAGE_PIN J13  IOSTANDARD LVCMOS33 } [get_ports { up_cnt[2] }]
set_property -dict { PACKAGE_PIN N14  IOSTANDARD LVCMOS33 } [get_ports { up_cnt[3] }]

## Map down_cnt[3:0] to four more LEDs
set_property -dict { PACKAGE_PIN R18  IOSTANDARD LVCMOS33 } [get_ports { down_cnt[0] }]
set_property -dict { PACKAGE_PIN V17  IOSTANDARD LVCMOS33 } [get_ports { down_cnt[1] }]
set_property -dict { PACKAGE_PIN U17  IOSTANDARD LVCMOS33 } [get_ports { down_cnt[2] }]
set_property -dict { PACKAGE_PIN U16  IOSTANDARD LVCMOS33 } [get_ports { down_cnt[3] }]
