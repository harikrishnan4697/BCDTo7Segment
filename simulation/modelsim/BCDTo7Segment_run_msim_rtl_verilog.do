transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/harik/Workspace/BCDTo7Segment {C:/Users/harik/Workspace/BCDTo7Segment/BCDTo7Segment.v}

vlog -vlog01compat -work work +incdir+C:/Users/harik/Workspace/BCDTo7Segment {C:/Users/harik/Workspace/BCDTo7Segment/BCDTo7Segment_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  BCDTo7Segment_tb

do C:/Users/harik/Workspace/BCDTo7Segment/../ELEC5566M-Resources/simulation/load_sim.tcl
