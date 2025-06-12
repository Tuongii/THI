quit -sim
vlib work 

vcom adder_sub.vhd
vcom adder_sub_test.vhd
vsim -novopt adder_sub_test
add wave sim:/adder_sub_test/*
run 600ns

