onerror {quit -f}
vlib work
vlog -work work bai3.vo
vlog -work work bai3.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mealy_vlg_vec_tst
vcd file -direction bai3.msim.vcd
vcd add -internal mealy_vlg_vec_tst/*
vcd add -internal mealy_vlg_vec_tst/i1/*
add wave /*
run -all
