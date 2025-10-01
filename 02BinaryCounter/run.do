# run.do — robust ModelSim script

# run from the folder containing this script
cd [file dirname [info script]]

# recreate 'work' safely (Intel ModelSim-ASE friendly)
catch { vdel -lib work -all }
vlib work
vmap work work

# compile (use -sv even for .v; it's fine)
vlog -sv -work work ./src/my_74193.v
vlog -sv -work work ./src/core.v
vlog -sv -work work ./tb_core.sv   ;# or tb_core.v if you made a Verilog TB

# elaborate
vsim -voptargs=+acc work.tb_core

# waves + run
view wave
add wave -r /*
run 2 ms
