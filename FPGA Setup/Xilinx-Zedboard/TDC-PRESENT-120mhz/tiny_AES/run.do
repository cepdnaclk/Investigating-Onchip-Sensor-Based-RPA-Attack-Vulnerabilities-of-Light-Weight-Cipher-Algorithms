quit -sim
vcom *.vhd
vlog *.v
vsim -novopt work.AES_TB
add wave -r sim:/AES_TB/aes_tiny/*

run -all