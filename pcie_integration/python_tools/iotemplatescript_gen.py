# -*- coding: utf-8 -*-
"""
@author: VinhDang
"""

import sys
import math

dev_name = sys.argv[1]
clk_freq = sys.argv[2]

output_file=open('./vhls_prj/test_io/solution1/iotemplate_script.tcl','w')
code_string="""############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
############################################################
set xocc_optimize_level 0
open_project test_io 
set_top bandwidth
add_files ../copy_kernel.c
add_files ../copy_kernel.h
open_solution "solution1" -flow_target vitis\n"""

code_string=code_string+'set_part '+dev_name+'\n'
code_string=code_string+'create_clock -period '+clk_freq+'MHz -name default\n'
code_string=code_string+"""set_clock_uncertainty 0.900000
config_rtl -register_reset_num 0
config_interface -m_axi_addr64
config_schedule -relax_ii_for_timing
config_compile -pipeline_loops 64
config_compile -name_max_length 256
csynth_design
export_design -format ip_catalog
close_project
puts "Vitis HLS completed successfully"
exit"""

output_file.write(code_string)
output_file.close()
