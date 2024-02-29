onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /decoder_test/clock
add wave -noupdate /decoder_test/reset
add wave -noupdate -radix hexadecimal /decoder_test/long_instruction_addr
add wave -noupdate -radix hexadecimal /decoder_test/instruction
add wave -noupdate -radix unsigned /decoder_test/rs1_async
add wave -noupdate -radix unsigned /decoder_test/rs2_async
add wave -noupdate -radix unsigned /decoder_test/rd_async
add wave -noupdate -radix binary /decoder_test/do_reg
add wave -noupdate -radix binary /decoder_test/do_imm
add wave -noupdate -radix binary /decoder_test/add_or_sub
add wave -noupdate -radix binary /decoder_test/do_jal
add wave -noupdate -radix binary /decoder_test/do_branch
add wave -noupdate -radix binary /decoder_test/do_load
add wave -noupdate -radix binary /decoder_test/do_store
add wave -noupdate -radix binary /decoder_test/eq
add wave -noupdate -radix binary /decoder_test/ne
add wave -noupdate -radix binary /decoder_test/lt
add wave -noupdate -radix binary /decoder_test/ge
add wave -noupdate -radix binary /decoder_test/BYTE
add wave -noupdate -radix binary /decoder_test/HWORD
add wave -noupdate -radix binary /decoder_test/WORD
add wave -noupdate -radix unsigned /decoder_test/imm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1282 ps} 0}
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
WaveRestoreZoom {550 ps} {1550 ps}
