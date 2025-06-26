transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/register_file.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/mips.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/bus_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/bus_decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/bus.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/gpio.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/register_we.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/pwm.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/register_we_0.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/IO_Mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/SOC.v}
vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/rom.v}

vlog -vlog01compat -work work +incdir+C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7 {C:/Users/SUS/Desktop/HDL/TH/Bai5_6_7/soc_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  soc_tb

add wave *
view structure
view signals
run -all
