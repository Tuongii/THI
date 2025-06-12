quit -sim 
vlib work

vcom sosanh7485.vhd
vcom sosanh_test.vhd
 vsim -novopt sosanh_test
 
 add wave sim:/sosanh_test/*
 