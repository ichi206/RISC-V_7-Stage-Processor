# Compile Verilog
vlog ../../stage1/instruction_memory.sv
vlog ../decoder.sv
vlog ../../stage5/program_counter.sv
vlog decoder_test.sv

# Call vsim to invoke simulator
vsim -voptargs="+acc" -t 1ps -lib work decoder_test

# Source the wave do file
do decoder_test_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all
