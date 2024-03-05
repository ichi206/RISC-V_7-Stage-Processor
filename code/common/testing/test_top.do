# Create work library
vlib work

# Compile Verilog
vlog ../../stage1/instruction_memory.sv
vlog ../../stage2/decoder.sv
vlog ../../stage3/alu.sv
vlog ../../stage4/data_memory.sv
vlog ../../stage4/data_memory_write_interface.sv
vlog ../../stage4/data_memory_top.sv
vlog ../../stage5/program_counter.sv
vlog ../../stage5/registers.sv
vlog ../../stage5/data_memory_read_interface.sv
vlog ../../stage5/stage5_top.sv
vlog ../control.sv
vlog ../top.sv
vlog test_top.sv

# Call vsim to invoke simulator
vsim -voptargs="+acc" -t 1ps -lib work test_top

# Source the wave do file
do test_top_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all
