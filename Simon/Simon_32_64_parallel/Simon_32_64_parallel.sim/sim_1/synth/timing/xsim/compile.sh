#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.1 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
# Generated by Vivado on Sat Jun 23 18:01:14 CEST 2018
# SW Build 2188600 on Wed Apr  4 18:39:19 MDT 2018
#
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
#
# usage: compile.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
echo "xvlog --incr --relax -prj Testing_IP_TB_vlog.prj"
ExecStep xvlog --incr --relax -prj Testing_IP_TB_vlog.prj 2>&1 | tee compile.log
echo "xvhdl --incr --relax -prj Testing_IP_TB_vhdl.prj"
ExecStep xvhdl --incr --relax -prj Testing_IP_TB_vhdl.prj 2>&1 | tee -a compile.log
