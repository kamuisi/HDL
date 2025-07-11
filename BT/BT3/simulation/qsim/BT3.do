onerror {quit -f}
vlib work
vlog -work work BT3.vo
vlog -work work BT3.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.BT3_vlg_vec_tst
vcd file -direction BT3.msim.vcd
vcd add -internal BT3_vlg_vec_tst/*
vcd add -internal BT3_vlg_vec_tst/i1/*
add wave /*
run -all
