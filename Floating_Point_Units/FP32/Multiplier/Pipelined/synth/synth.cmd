analyze -format verilog {
../FpMult_reduced.v
../FpMult_a.v
../FpMult_b.v
../FpMult_c.v
}
elaborate FPMult_reduced -architecture verilog -library DEFAULT
link
#set_implementation pparch u_add
#set_implementation pparch u_mult
set_dp_smartgen_options -all_options auto -hierarchy -smart_compare true -optimize_for speed -sop2pos_transformation false
create_clock -name "clk" -period 2 -waveform { 0 1 }  { clk  }
set_operating_conditions -library gscl45nm typical
remove_wire_load_model
compile -exact_map
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } >> Report.timing.max.txt
uplevel #0 { report_timing -path_type end -from [all_inputs] } >> Report.timing.all.txt
uplevel #0 { report_timing -path_type end } >> Report.timing.all.txt
uplevel #0 { report_timing -path_type end -to [all_outputs] } >> Report.timing.all.txt
uplevel #0 { report_area } >> Report.area.txt
uplevel #0 { report_power -analysis_effort low } >> Report.power.txt
uplevel #0 { report_design -nosplit } >> Report.design.txt
exit
