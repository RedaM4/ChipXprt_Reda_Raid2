#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Thu Dec 05 04:41:21 PST 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim Task2_top_sim_behav -key {Behavioral:sim_1:Functional:Task2_top_sim} -tclbatch Task2_top_sim.tcl -view /home/cenema/Desktop/Xilinx_Projects/Chipxprt_Reda_Raid/DSD/assignment2/Task2/Task2_fsm_sim_behav.wcfg -log simulate.log"
xsim Task2_top_sim_behav -key {Behavioral:sim_1:Functional:Task2_top_sim} -tclbatch Task2_top_sim.tcl -view /home/cenema/Desktop/Xilinx_Projects/Chipxprt_Reda_Raid/DSD/assignment2/Task2/Task2_fsm_sim_behav.wcfg -log simulate.log

