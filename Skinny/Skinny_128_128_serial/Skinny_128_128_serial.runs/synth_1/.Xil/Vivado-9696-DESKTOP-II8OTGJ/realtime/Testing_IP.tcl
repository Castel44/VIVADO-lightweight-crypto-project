# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    rt::set_parameter enableParallelHelperSpawn true
    set ::env(RT_TMP) "F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.runs/synth_1/.Xil/Vivado-9696-DESKTOP-II8OTGJ/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7z010clg400-1

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    # Skipping read_* RTL commands because this is post-elab optimize flow
    set rt::useElabCache true
    if {$rt::useElabCache == false} {
      rt::read_vhdl -lib xil_defaultlib {
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/AddConstant.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/AddRoundTweakey.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/Element_Cnt.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/IS_Shift_Reg.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/MixColumn.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/NEWSKINNY.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/SubCells_4bit.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/TW_shift_reg.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/cnt.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/is_shift_reg_NEW.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/lfsr.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/rnd_key_update.vhd}
      {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.srcs/sources_1/imports/new/Testing_IP.vhd}
    }
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification true
    set rt::SDCFileList {{F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.runs/synth_1/.Xil/Vivado-9696-DESKTOP-II8OTGJ/realtime/Testing_IP_synth.xdc}}
    rt::sdcChecksum
    set rt::top Testing_IP
    rt::set_parameter enableIncremental true
    set rt::reportTiming false
    rt::set_parameter elaborateOnly false
    rt::set_parameter elaborateRtl false
    rt::set_parameter eliminateRedundantBitOperator true
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter ramStyle auto
    rt::set_parameter merge_flipflops true
# MODE: 
    rt::set_parameter webTalkPath {F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.cache/wt}
    rt::set_parameter enableSplitFlowPath "F:/Documenti 2/University/Magistrale/Progettazione di Sistemi Integrati/VHDL projects/VIVADO-lightweight-crypto-project/Skinny/Skinny_128_128_serial/Skinny_128_128_serial.runs/synth_1/.Xil/Vivado-9696-DESKTOP-II8OTGJ/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
        set oldMIITMVal [rt::get_parameter maxInputIncreaseToMerge]; rt::set_parameter maxInputIncreaseToMerge 1000
        set oldCDPCRL [rt::get_parameter createDfgPartConstrRecurLimit]; rt::set_parameter createDfgPartConstrRecurLimit 1
        $rt::db readXRFFile
      rt::run_synthesis -module $rt::top
        rt::set_parameter maxInputIncreaseToMerge $oldMIITMVal
        rt::set_parameter createDfgPartConstrRecurLimit $oldCDPCRL
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    rt::HARTNDb_reportJobStats "Synthesis Optimization Runtime"
    rt::HARTNDb_stopSystemStats
    if { $rt::flowresult == 1 } { return -code error }


  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  rt::set_parameter helper_shm_key "" 
    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }

    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  set hsKey [rt::get_parameter helper_shm_key] 
  if { $hsKey != "" && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] } { 
     $rt::db killSynthHelper $hsKey
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}