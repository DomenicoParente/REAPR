# -*- coding: utf-8 -*-

import sys
import math

common_repo_path = sys.argv[1]
report_count = int(sys.argv[2])
ddr_banks    = int(sys.argv[3])
io_test      = int(sys.argv[4])
reapr_path = sys.argv[5]
 
if ((report_count%512)!=0):
    #if report_count is not evenly divided by 512, find the exponent of next higher power of 2 and calculate the next power of 2 
    #factorb = (int(math.pow(2, math.ceil(math.log(report_count%512, 2)))))/8
    tmpnum = int(math.pow(2, math.ceil(math.log(report_count%512, 2))))
    if (tmpnum < 8):
        factorb = 8/8
    else:
        factorb = tmpnum/8
    numb    = 1
else:
    #set to 0, otherwise
    factorb = 0
    numb    = 0

if ((report_count/512)!=0):
    #if report_count >= 512
    factora = 512/8
    numa    = report_count/512
else:
    #if report_count < 512
    factora = 0
    numa    = 0

output_file=open('./rtl_prj/Makefile','w')

code_string="""
#
# Copyright 2019-2020 Xilinx, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# makefile-generator v1.0.3
#

############################## Help Section ##############################
.PHONY: help

help::
	$(ECHO) "Makefile Usage:"
	$(ECHO) "  make all TARGET=<sw_emu/hw_emu/hw> DEVICE=<FPGA platform>"
	$(ECHO) "      Command to generate the design for specified Target and Device."
	$(ECHO) ""
	$(ECHO) "  make clean "
	$(ECHO) "      Command to remove the generated non-hardware files."
	$(ECHO) ""
	$(ECHO) "  make cleanall"
	$(ECHO) "      Command to remove all the generated files."
	$(ECHO) ""
	$(ECHO) "  make check TARGET=<sw_emu/hw_emu/hw> DEVICE=<FPGA platform>"
	$(ECHO) "      Command to run application in emulation."
	$(ECHO) ""
	$(ECHO) "  make build TARGET=<sw_emu/hw_emu/hw> DEVICE=<FPGA platform>"
	$(ECHO) "      Command to build xclbin application."
	$(ECHO) ""
	$(ECHO) "  make run_nimbix DEVICE=<FPGA platform>"
	$(ECHO) "      Command to run application on Nimbix Cloud."
	$(ECHO) ""
	$(ECHO) "  make aws_build DEVICE=<FPGA platform>"
	$(ECHO) "      Command to build AWS xclbin application on AWS Cloud."
	$(ECHO) ""

TARGET := hw
ifeq ($(TARGET), hw_emu)
TARGET := hw_emu
endif

ifeq ($(TARGET),hw_emu)
XCL_EMULATION_MODE=hw_emu;
endif

HOST_ARCH := x86

#Checks for XILINX_XRT
ifndef XILINX_VITIS
$(error XILINX_VITIS is not set. Please source the Vitis settings64.{csh,sh} first)
endif

ifndef XILINX_XRT
$(error XILINX_XRT is not set. Please source the XRT /opt/xilinx/xrt/setup.sh first)
endif

check-devices:
ifndef DEVICE
	$(error DEVICE not set. Please set the DEVICE properly and rerun. Run "make help" for more details.)
endif

#   device2xsa - create a filesystem friendly name from device name
#   $(1) - full name of device
device2xsa = $(strip $(patsubst %.xpfm, % , $(shell basename $(DEVICE))))

# Points to Utility Directory
XF_PROJ_ROOT ="""+reapr_path+'\n\n'"""
COMMON_REPO:="""+common_repo_path+'\n\n'"""

XSA := 
ifneq ($(DEVICE), )
XSA := $(call device2xsa, $(DEVICE))
endif


TEMP_DIR := ./x.$(TARGET).$(XSA)
BUILD_DIR := ./build_dir.$(TARGET).$(XSA)

VPP := v++
CMD_ARGS = $(BUILD_DIR)/bandwidth.xclbin

include config.mk

CXXFLAGS += -I${XILINX_XRT}/include/  -I$XILINX_VIVADO/include -Wall -O0 -g -std=c++11
LDFLAGS += -L$XILINX_XRT/lib/ -lOpenCL -lpthread

############################## Setting up Host Variables ##############################
#Include Required Host Source Files
HOST_SRCS +=../io_global_bandwidth_real.cpp
# Host compiler global settings
CXXFLAGS += -fmessage-length=0
LDFLAGS += -lrt -lstdc++ 

############################## Setting up Kernel Variables ##############################
# Kernel compiler global settings
VPP_FLAGS += -t $(TARGET) --platform $(DEVICE) --save-temps 
ifneq ($(TARGET), hw)
	VPP_FLAGS += -g
endif


EXECUTABLE = ./bandwidth

############################## Declaring Binary Containers ##############################
BINARY_CONTAINERS += $(BUILD_DIR)/bandwidth.xclbin
BINARY_CONTAINER_bandwidth_OBJS += $(TEMP_DIR)/bandwidth.xo

############################## Setting Targets ##############################
CP = cp -rf

.PHONY: all clean cleanall emconfig
all: check-devices $(EXECUTABLE) $(BINARY_CONTAINERS) emconfig

.PHONY: host
host: $(EXECUTABLE)

.PHONY: build
build: check-vitis $(BINARY_CONTAINERS)

.PHONY: xclbin
xclbin: build

# Building kernel
$(BUILD_DIR)/bandwidth.xclbin: $(BINARY_CONTAINER_bandwidth_OBJS)
	mkdir -p $(BUILD_DIR)
	$(VPP) $(VPP_FLAGS) -l --temp_dir $(TEMP_DIR) -o'$(BUILD_DIR)/bandwidth.xclbin' $(+)

############################## Setting Rules for Host (Building Host Executable) ##############################
$(EXECUTABLE): $(HOST_SRCS)
		$(CXX) -o $@ $^ $(CXXFLAGS) $(LDFLAGS)

emconfig:$
	emconfigutil --platform $(DEVICE) --od $(COMMON_REPO)

############################## Setting Essential Checks and Running Rules ##############################
run: all
	$(EXECUTABLE) $(CMD_ARGS)

ifneq ($(TARGET),$(findstring $(TARGET), hw hw_emu))
$(error Application supports only hw hw_emu TARGET. Please use the target for running the application)
endif

############################## Cleaning Rules ##############################
RM = rm -f
RMDIR = rm -rf

# Cleaning stuff
clean:
	-$(RMDIR) $(EXECUTABLE) $(XCLBIN)/{*sw_emu*,*hw_emu*} 
	-$(RMDIR) profile_* TempConfig system_estimate.xtxt *.rpt *.csv 
	-$(RMDIR) *.ll *v++* .Xil emconfig.json dltmp* xmltmp* *.log *.jou *.wcfg *.wdb

cleanall: clean
	-$(RMDIR) build_dir*
	-$(RMDIR) package.*
	-$(RMDIR) _x* *xclbin.run_summary qemu-memory-_* emulation _vimage pl* start_simulation.sh *.xclbin
	-$(RMDIR) ./tmp_kernel_pack* ./packaged_kernel* 
"""

output_file.write(code_string)
output_file.close()
