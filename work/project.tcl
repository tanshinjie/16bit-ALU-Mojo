set projDir "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/planAhead"
set projName "16-bit ALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/mojo_top_0.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/reset_conditioner_1.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/button_conditioner_2.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/button_conditioner_2.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/button_conditioner_2.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/multi_seven_seg_5.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/alu16_6.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/pipeline_7.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/pipeline_7.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/pipeline_7.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/counter_10.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/seven_seg_11.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/decoder_12.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/adder16_13.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/compare16_14.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/shift16_15.v" "C:/Users/shinj/Desktop/SUTD/Term 4/50.002 Computation Structure/1D/mojo/16-bit ALU 1.0/work/verilog/bool16_16.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
