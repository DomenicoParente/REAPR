VIVADO := $(XILINX_VIVADO)/bin/vivado
$(TEMP_DIR)/bandwidth.xo: ../vv_prj/kernel.xml ../vv_prj/package_kernel.tcl ../vv_prj/gen_xo.tcl ../vv_prj/hdl/*.vhd ../vv_prj/hdl/*.v
	mkdir -p $(TEMP_DIR)
	$(VIVADO) -mode batch -source ../vv_prj/gen_xo.tcl -tclargs $(TEMP_DIR)/bandwidth.xo bandwidth $(TARGET) $(DEVICE) 
