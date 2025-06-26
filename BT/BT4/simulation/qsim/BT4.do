onerror {quit -f}
vlib work
vlog -work work BT4.vo
vlog -work work BT4.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.full_adder_4bit_2_vlg_vec_tst
vcd file -direction BT4.msim.vcd
vcd add -internal full_adder_4bit_2_vlg_vec_tst/*
vcd add -internal full_adder_4bit_2_vlg_vec_tst/i1/*
add wave /*
run -all
