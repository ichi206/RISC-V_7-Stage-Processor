onerror {resume}
quietly virtual function -install /registers_only_test -env /registers_only_test { &{/registers_only_test/content[28], /registers_only_test/content[27], /registers_only_test/content[26], /registers_only_test/content[25], /registers_only_test/content[24] }} content1
quietly virtual function -install /registers_only_test -env /registers_only_test { &{/registers_only_test/content[20], /registers_only_test/content[19], /registers_only_test/content[18], /registers_only_test/content[17], /registers_only_test/content[16] }} content2
quietly virtual function -install /registers_only_test -env /registers_only_test { &{/registers_only_test/content[12], /registers_only_test/content[11], /registers_only_test/content[10], /registers_only_test/content[9], /registers_only_test/content[8] }} content3
quietly WaveActivateNextPane {} 0
add wave -noupdate /registers_only_test/clock
add wave -noupdate /registers_only_test/reset
add wave -noupdate /registers_only_test/write_to_rd
add wave -noupdate /registers_only_test/add
add wave -noupdate -radix unsigned /registers_only_test/next_instruction
add wave -noupdate -radix unsigned /registers_only_test/rd
add wave -noupdate -radix unsigned /registers_only_test/rs1
add wave -noupdate -radix unsigned /registers_only_test/rs2
add wave -noupdate -radix unsigned /registers_only_test/rd_value
add wave -noupdate -radix unsigned /registers_only_test/rs1_value
add wave -noupdate -radix unsigned /registers_only_test/rs2_value
add wave -noupdate -radix unsigned /registers_only_test/content1
add wave -noupdate -radix unsigned /registers_only_test/content2
add wave -noupdate -radix unsigned /registers_only_test/content3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {756634 ps} 0}
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
WaveRestoreZoom {0 ps} {2123017 ps}
