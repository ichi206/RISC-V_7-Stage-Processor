onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /data_memory_test/clock
add wave -noupdate /data_memory_test/read
add wave -noupdate /data_memory_test/write
add wave -noupdate /data_memory_test/sign_extend
add wave -noupdate -radix unsigned /data_memory_test/long_addr
add wave -noupdate -radix unsigned /data_memory_test/how_much
add wave -noupdate -radix hexadecimal /data_memory_test/write_value
add wave -noupdate -radix hexadecimal /data_memory_test/dmt/dmwi/true_write_value
add wave -noupdate -radix hexadecimal /data_memory_test/read_value
add wave -noupdate -radix hexadecimal /data_memory_test/b
add wave -noupdate -radix hexadecimal /data_memory_test/h
add wave -noupdate -radix hexadecimal /data_memory_test/dmt/dm/read_value
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {199027 ps} 0}
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
WaveRestoreZoom {103235 ps} {1205735 ps}
