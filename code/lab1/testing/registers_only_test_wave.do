onerror {resume}
quietly virtual function -install /registers_only_test -env /registers_only_test/#INITIAL#42 { &{/registers_only_test/instruction[28], /registers_only_test/instruction[27], /registers_only_test/instruction[26], /registers_only_test/instruction[25], /registers_only_test/instruction[24] }} instruction1
quietly virtual function -install /registers_only_test -env /registers_only_test/#INITIAL#42 { &{/registers_only_test/instruction[20], /registers_only_test/instruction[19], /registers_only_test/instruction[18], /registers_only_test/instruction[17], /registers_only_test/instruction[16] }} instruction2
quietly virtual function -install /registers_only_test -env /registers_only_test/#INITIAL#42 { &{/registers_only_test/instruction[12], /registers_only_test/instruction[11], /registers_only_test/instruction[10], /registers_only_test/instruction[9], /registers_only_test/instruction[8] }} instruction3
quietly WaveActivateNextPane {} 0
add wave -noupdate /registers_only_test/clock
add wave -noupdate /registers_only_test/reset
add wave -noupdate /registers_only_test/add
add wave -noupdate -radix unsigned /registers_only_test/rs1
add wave -noupdate -radix unsigned /registers_only_test/rs2
add wave -noupdate -radix unsigned /registers_only_test/rd
add wave -noupdate -radix unsigned /registers_only_test/rs1_read
add wave -noupdate -radix unsigned /registers_only_test/rs2_read
add wave -noupdate -radix unsigned /registers_only_test/rd_value
add wave -noupdate -radix unsigned /registers_only_test/instruction1
add wave -noupdate -radix unsigned /registers_only_test/instruction2
add wave -noupdate -radix unsigned /registers_only_test/instruction3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {146814 ps} 0}
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
