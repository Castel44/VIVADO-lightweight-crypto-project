# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.cache/wt} [current_project]
set_property parent.project_path {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
set_property ip_output_repo {f:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/AES_128_parallel.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/AddRoundKey.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/MixColumns.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/Shiftrows.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/cnt.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/key_schedule.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/mixcolumn.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/mux.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/reg.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/sbox.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/subBytes.vhd}
  {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/sources_1/imports/src/Testing_IP.vhd}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/constrs_1/imports/Desktop/ZYBO_Master.xdc}}
set_property used_in_implementation false [get_files {{F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/Xilinx_contest/AES/AES.srcs/constrs_1/imports/Desktop/ZYBO_Master.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Testing_IP -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Testing_IP.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Testing_IP_utilization_synth.rpt -pb Testing_IP_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]