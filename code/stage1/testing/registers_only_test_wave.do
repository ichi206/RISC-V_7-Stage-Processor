onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /registers_only_test/clock
add wave -noupdate /registers_only_test/reset
add wave -noupdate /registers_only_test/add
add wave -noupdate -radix binary /registers_only_test/is_writeback_stage
add wave -noupdate -radix hexadecimal /registers_only_test/long_instruction_addr
add wave -noupdate -radix hexadecimal /registers_only_test/instruction
add wave -noupdate -radix unsigned /registers_only_test/rd
add wave -noupdate -radix unsigned /registers_only_test/rs1
add wave -noupdate -radix unsigned /registers_only_test/rs2
add wave -noupdate -radix unsigned /registers_only_test/rd_logic
add wave -noupdate -radix unsigned /registers_only_test/rd_value
add wave -noupdate -radix unsigned /registers_only_test/rs1_read
add wave -noupdate -radix unsigned /registers_only_test/rs2_read
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1334336 ps} 0}
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
WaveRestoreZoom {0 ps} {2310 ns}
