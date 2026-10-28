# Dr. Kaputa
# Quartus II compile script for DE1-SoC board

# 1] name your project here
set project_name "add_sub"

file delete -force project
file delete -force output_files
file mkdir project
cd project
load_package flow
project_new $project_name
set_global_assignment -name FAMILY Cyclone
set_global_assignment -name DEVICE 5CSEMA5F31C6 
set_global_assignment -name TOP_LEVEL_ENTITY top
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY ../output_files

# 2] include your relative path files here
set_global_assignment -name VHDL_FILE ../../src/rising_edge_synchronizer.vhd
set_global_assignment -name VHDL_FILE ../../src/seven_seg.vhd
set_global_assignment -name VHDL_FILE ../../src/add_sub.vhd
set_global_assignment -name VHDL_FILE ../../src/synchronizer_3bit.vhd
set_global_assignment -name VHDL_FILE ../../src/add_sub.vhd
set_global_assignment -name VHDL_FILE ../../src/button.vhd
set_global_assignment -name VHDL_FILE ../../src/top.vhd

set_location_assignment PIN_AB12 -to reset
set_location_assignment PIN_AF14 -to clk
set_location_assignment PIN_AC9  -to a[0]
set_location_assignment PIN_AD10 -to a[1]
set_location_assignment PIN_AE12 -to a[2]
set_location_assignment PIN_AD11 -to b[0]
set_location_assignment PIN_AD12 -to b[1]
set_location_assignment PIN_AE11 -to b[2]

set_location_assignment PIN_AA24 -to seven_seg1[0]
set_location_assignment PIN_Y23  -to seven_seg1[1]
set_location_assignment PIN_Y24  -to seven_seg1[2]
set_location_assignment PIN_W22  -to seven_seg1[3]
set_location_assignment PIN_W24  -to seven_seg1[4]
set_location_assignment PIN_V23  -to seven_seg1[5]
set_location_assignment PIN_W25  -to seven_seg1[6]

set_location_assignment PIN_AB23 -to seven_seg2[0]
set_location_assignment PIN_AE29 -to seven_seg2[1]
set_location_assignment PIN_AD29 -to seven_seg2[2]
set_location_assignment PIN_AC28 -to seven_seg2[3]
set_location_assignment PIN_AD30 -to seven_seg2[4]
set_location_assignment PIN_AC29 -to seven_seg2[5]
set_location_assignment PIN_AC30 -to seven_seg2[6]

set_location_assignment PIN_AE26 -to seven_seg3[0]
set_location_assignment PIN_AE27 -to seven_seg3[1]
set_location_assignment PIN_AE28 -to seven_seg3[2]
set_location_assignment PIN_AG27 -to seven_seg3[3]
set_location_assignment PIN_AF28 -to seven_seg3[4]
set_location_assignment PIN_AG28 -to seven_seg3[5]
set_location_assignment PIN_AH28 -to seven_seg3[6]

set_location_assignment PIN_AA15 -to add
set_location_assignment PIN_AA14 -to sub

execute_flow -compile
project_close