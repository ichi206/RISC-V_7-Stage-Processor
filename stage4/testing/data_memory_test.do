# Create work library
vlib work

# Compile Verilog
vlog ../data_memory.sv
vlog ../data_memory_write_interface.sv
vlog ../data_memory_top.sv
vlog data_memory_test.sv

# Call vsim to invoke simulator
vsim -voptargs="+acc" -t 1ps -lib work data_memory_test

# Source the wave do file
do data_memory_test_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all
