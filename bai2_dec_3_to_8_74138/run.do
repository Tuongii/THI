quit -sim
vlib work

vcom dec_3to8.vhd
vcom dec_3to8_test.vhd
vsim -novopt dec_3to8_test

add wave \*
run 800ns