onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /d_ff_test/SET
add wave -noupdate /d_ff_test/CLR
add wave -noupdate /d_ff_test/CLK
add wave -noupdate /d_ff_test/D
add wave -noupdate /d_ff_test/Q
add wave -noupdate /d_ff_test/NQ
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {415 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {893 ns}
