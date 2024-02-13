# Create work library
vlib work

# Compile Verilog
vlog ../../common/definitions.sv
vlog ../registers.sv
vlog ../program_counter.sv
vlog simple_add_test.sv

# Call vsim to invoke simulator
vsim -voptargs="+acc" -t 1ps -lib work simple_add_test

# Source the wave do file
do simple_add_test_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all
