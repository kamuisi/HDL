onerror {quit -f}
vlib work
vlog -work work bai1.vo
vlog -work work bai1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CLA_3b_vlg_vec_tst
vcd file -direction bai1.msim.vcd
vcd add -internal CLA_3b_vlg_vec_tst/*
vcd add -internal CLA_3b_vlg_vec_tst/i1/*
add wave /*
run -all
