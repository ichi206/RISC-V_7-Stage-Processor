onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_top/clock
add wave -noupdate /test_top/reset
add wave -noupdate -radix hexadecimal /test_top/cpu/instrs/mem
add wave -noupdate -radix binary /test_top/cpu/c/stage
add wave -noupdate -radix hexadecimal /test_top/cpu/instrs/long_instruction_addr
add wave -noupdate /test_top/cpu/instr_type
add wave -noupdate -radix unsigned /test_top/cpu/rs1_async
add wave -noupdate -radix unsigned /test_top/cpu/rs2_async
add wave -noupdate -radix unsigned /test_top/cpu/rd
add wave -noupdate -radix unsigned /test_top/cpu/rs1_read
add wave -noupdate -radix unsigned /test_top/cpu/rs2_read
add wave -noupdate -radix decimal /test_top/cpu/eval
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {98 ps} 0}
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
WaveRestoreZoom {0 ps} {1884 ps}
