onerror {resume}
radix define States {
    "7'b1000000" "0" -color "red",
    "7'b1111001" "1" -color "red",
    "7'b0100100" "2" -color "red",
    "7'b0110000" "3" -color "red",
    "7'b0011001" "4" -color "red",
    "7'b0010010" "5" -color "red",
    "7'b0000010" "6" -color "red",
    "7'b1111000" "7" -color "red",
    "7'b0000000" "8" -color "red",
    "7'b0011000" "9" -color "red",
    -default default
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/uut/clk
add wave -noupdate /top_tb/uut/reset
add wave -noupdate /top_tb/uut/button
add wave -noupdate /top_tb/uut/button_s
add wave -noupdate /top_tb/uut/state
add wave -noupdate -radix unsigned /top_tb/uut/data
add wave -noupdate -radix unsigned /top_tb/uut/data_s
add wave -noupdate -radix unsigned /top_tb/uut/a
add wave -noupdate -radix unsigned /top_tb/uut/b
add wave -noupdate /top_tb/uut/LED
add wave -noupdate /top_tb/uut/seven_seg1
add wave -noupdate /top_tb/uut/seven_seg2
add wave -noupdate /top_tb/uut/seven_seg3
add wave -noupdate /top_tb/uut/nextState
add wave -noupdate /top_tb/uut/sum
add wave -noupdate /top_tb/uut/diff
add wave -noupdate /top_tb/uut/output
add wave -noupdate /top_tb/uut/output_pad
add wave -noupdate /top_tb/uut/out1s
add wave -noupdate /top_tb/uut/out10s
add wave -noupdate /top_tb/uut/out100s
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1793 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 40
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {2100 ns}
