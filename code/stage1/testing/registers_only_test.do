# Create work library
vlib work

# Compile Verilog
vlog ../../stage5/registers.sv
vlog ../../stage5/program_counter.sv
vlog ../instruction_memory.sv
vlog registers_only_test.sv

# Call vsim to invoke simulator
vsim -voptargs="+acc" -t 1ps -lib work registers_only_test

# Source the wave do file
do registers_only_test_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all
