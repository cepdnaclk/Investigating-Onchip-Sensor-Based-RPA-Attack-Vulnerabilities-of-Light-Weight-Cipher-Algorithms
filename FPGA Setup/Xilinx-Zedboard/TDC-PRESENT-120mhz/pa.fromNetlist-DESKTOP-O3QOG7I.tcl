
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name test -dir "D:/Onedrive/OneDrive - UNSW/My Onedrive/PhD/Src/New-Delay-Sensor/TDC-10clk-BrianAES/ZEDBOARD-OrigTDCSensor-LUT-TDC-V0/ZEDBOARD-OrigTDCSensor-8del-new/planAhead_run_2" -part xc7z020clg484-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Onedrive/OneDrive - UNSW/My Onedrive/PhD/Src/New-Delay-Sensor/TDC-10clk-BrianAES/ZEDBOARD-OrigTDCSensor-LUT-TDC-V0/ZEDBOARD-OrigTDCSensor-8del-new/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Onedrive/OneDrive - UNSW/My Onedrive/PhD/Src/New-Delay-Sensor/TDC-10clk-BrianAES/ZEDBOARD-OrigTDCSensor-LUT-TDC-V0/ZEDBOARD-OrigTDCSensor-8del-new} {ipcore_dir} }
add_files [list {ipcore_dir/AddSub.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/chipscope_icon.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/chipscope_ila.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/multiplier.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "Zturn.ucf" [current_fileset -constrset]
add_files [list {Zturn.ucf}] -fileset [get_property constrset [current_run]]
link_design
