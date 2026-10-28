vlib work
vcom -93 -work work ../../src/top.vhd
vcom -93 -work work ../../src/seven_seg.vhd
vcom -93 -work work ../../src/add_sub.vhd
vcom -93 -work work ../../src/button.vhd
vcom -93 -work work ../../src/synchronizer_3bit.vhd
vcom -93 -work work ../../src/rising_edge_synchronizer.vhd
vcom -93 -work work ../src/top_tb.vhd
vsim -voptargs=+acc top_tb
do wave.do
run 500 ns
