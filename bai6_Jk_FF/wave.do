onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /jk_flipflop_test/CLK
add wave -noupdate /jk_flipflop_test/J
add wave -noupdate /jk_flipflop_test/K
add wave -noupdate /jk_flipflop_test/SET
add wave -noupdate /jk_flipflop_test/CLR
add wave -noupdate /jk_flipflop_test/Q
add wave -noupdate /jk_flipflop_test/NQ
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {87 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {16 ns} {237 ns}
