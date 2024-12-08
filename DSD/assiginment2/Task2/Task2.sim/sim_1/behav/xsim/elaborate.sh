#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Thu Dec 05 04:41:20 PST 2024
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 72b753a0421742a49472bbc56b7bef51 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Task2_top_sim_behav xil_defaultlib.Task2_top_sim xil_defaultlib.glbl -log elaborate.log"
xelab -wto 72b753a0421742a49472bbc56b7bef51 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Task2_top_sim_behav xil_defaultlib.Task2_top_sim xil_defaultlib.glbl -log elaborate.log

