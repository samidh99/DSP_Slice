analyze -format verilog {
../Slice_combined_4.v
../Multiplier_combined.v
../Pre_adder_combined.v
../FpAddSub_single.v
../FpAddSub_a.v
../FpAddSub_b.v
../FpAddSub_c.v
../FpAddSub_d.v
../FpMult_b.v
../FpMult_c.v
}
set link_library "/home/projects/ljohn/aarora1/cadence_gpdk/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_basicCells.modif.db dw_foundation.sldb"
set target_library /home/projects/ljohn/aarora1/cadence_gpdk/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_basicCells.modif.db
elaborate dsp_slice_combined -architecture verilog -library DEFAULT
link
uniquify
#set_implementation pparch u_add
#set_implementation pparch u_mult
set_dp_smartgen_options -all_options auto -hierarchy -smart_compare true -optimize_for speed -sop2pos_transformation false
create_clock -name "clk" -period 3 -waveform { 0 1.5 }  { clk  }
#set_operating_conditions -library fast_vdd1v0 typical
#remove_wire_load_model
#compile -exact_map
compile_ultra
link
ungroup -all -flatten 
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } >> Report.timing.max.txt
uplevel #0 { report_timing -path_type end -from [all_inputs] } >> Report.timing.all.txt
uplevel #0 { report_timing -path_type end } >> Report.timing.all.txt
uplevel #0 { report_timing -path_type end -to [all_outputs] } >> Report.timing.all.txt
uplevel #0 { report_area } >> Report.area.txt
uplevel #0 { report_power -analysis_effort low } >> Report.power.txt
uplevel #0 { report_design -nosplit } >> Report.design.txt
exit
