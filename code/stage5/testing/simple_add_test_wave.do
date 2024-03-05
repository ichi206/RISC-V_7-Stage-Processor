onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /simple_add_test/clock
add wave -noupdate /simple_add_test/reset
add wave -noupdate -radix binary /simple_add_test/register_writeback
add wave -noupdate /simple_add_test/add
add wave -noupdate -radix unsigned /simple_add_test/rs1
add wave -noupdate -radix unsigned /simple_add_test/rs1_read
add wave -noupdate -radix unsigned /simple_add_test/rs2
add wave -noupdate -radix unsigned /simple_add_test/rs2_read
add wave -noupdate -radix unsigned /simple_add_test/rd
add wave -noupdate -radix unsigned /simple_add_test/rd_value
add wave -noupdate /simple_add_test/jump
add wave -noupdate -radix unsigned /simple_add_test/instruction_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {174859 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1890 ns}
