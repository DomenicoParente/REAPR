// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
// Date        : Sun May 23 16:16:57 2021
// Host        : gozzo.local.necst.it running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_ebbe_lut_buffer_0_sim_netlist.v
// Design      : bd_ebbe_lut_buffer_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_ebbe_lut_buffer_0,lut_buffer_v2_0_0_lut_buffer,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "lut_buffer_v2_0_0_lut_buffer,Vivado 2020.2.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (tdi_i,
    tms_i,
    tck_i,
    drck_i,
    sel_i,
    shift_i,
    update_i,
    capture_i,
    runtest_i,
    reset_i,
    bscanid_en_i,
    tdo_o,
    tdi_o,
    tms_o,
    tck_o,
    drck_o,
    sel_o,
    shift_o,
    update_o,
    capture_o,
    runtest_o,
    reset_o,
    bscanid_en_o,
    tdo_i);
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDI" *) input tdi_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TMS" *) input tms_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TCK" *) input tck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan DRCK" *) input drck_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SEL" *) input sel_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan SHIFT" *) input shift_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan UPDATE" *) input update_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan CAPTURE" *) input capture_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RUNTEST" *) input runtest_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan RESET" *) input reset_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan BSCANID_EN" *) input bscanid_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 s_bscan TDO" *) output tdo_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDI" *) output tdi_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TMS" *) output tms_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TCK" *) output tck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan DRCK" *) output drck_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SEL" *) output sel_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan SHIFT" *) output shift_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan UPDATE" *) output update_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan CAPTURE" *) output capture_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RUNTEST" *) output runtest_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan RESET" *) output reset_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan BSCANID_EN" *) output bscanid_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bscan:1.0 m_bscan TDO" *) input tdo_i;

  wire bscanid_en_i;
  wire bscanid_en_o;
  wire capture_i;
  wire capture_o;
  wire drck_i;
  wire drck_o;
  wire reset_i;
  wire reset_o;
  wire runtest_i;
  wire runtest_o;
  wire sel_i;
  wire sel_o;
  wire shift_i;
  wire shift_o;
  wire tck_i;
  wire tck_o;
  wire tdi_i;
  wire tdi_o;
  wire tdo_i;
  wire tdo_o;
  wire tms_i;
  wire tms_o;
  wire update_i;
  wire update_o;
  wire [31:0]NLW_inst_bscanid_o_UNCONNECTED;

  (* C_EN_BSCANID_VEC = "0" *) 
  (* DONT_TOUCH *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lut_buffer_v2_0_0_lut_buffer inst
       (.bscanid_en_i(bscanid_en_i),
        .bscanid_en_o(bscanid_en_o),
        .bscanid_i({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .bscanid_o(NLW_inst_bscanid_o_UNCONNECTED[31:0]),
        .capture_i(capture_i),
        .capture_o(capture_o),
        .drck_i(drck_i),
        .drck_o(drck_o),
        .reset_i(reset_i),
        .reset_o(reset_o),
        .runtest_i(runtest_i),
        .runtest_o(runtest_o),
        .sel_i(sel_i),
        .sel_o(sel_o),
        .shift_i(shift_i),
        .shift_o(shift_o),
        .tck_i(tck_i),
        .tck_o(tck_o),
        .tdi_i(tdi_i),
        .tdi_o(tdi_o),
        .tdo_i(tdo_i),
        .tdo_o(tdo_o),
        .tms_i(tms_i),
        .tms_o(tms_o),
        .update_i(update_i),
        .update_o(update_o));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
iBeW7PM0CRC32/PyaKTBD9Nb0GPn2dO8QQ+68whDedex6Tkqy1bXAtryMKhWbVZUWGI5eWkyDD8M
bfQtTjrBEA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
A9KVnSCrCvLRLr0Se2FJtfQX5CPCiLNIQnQhCE6S1QrzrlPjPv5f1wSDeP+EiZhguCzjDjecKLGv
KkWdDTZhvh9sL7nh1zgFQuAbTsIaJ7ERumn720pG3jniQD1YFs1ecmX/oPD6hKD/9hL2/7Dd7Tz/
pePYpUwQoVKSeofL/cM=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xyBmV0GBf2ASdUV/+GxfzBpk2JvBHVowerB1n3ZQ6fpMzPszvUCBejxmazFb4QCqaUjmf7WQl8PT
bbYPknTErkwfjphY04MVSBEQOAUponVa3PO18PMDk2zLpf9rfagSmjVxEHJ4FXWjtbrDVJXZj7Dw
lcos3ClgivkmtVV3H3XAod5/GuJzgbc8NGBfM0L7+ow22NkhO6YshPIHKb1K1o6FYFuK3ukxv+Wc
OexbPjFhvmGY7GwvxGukApLDBLz6JI33/mIN4aDypVmOINDVrYagQaIoQYVdHx6+RMP6teI9XxvC
mz4MFe1hOjOAw856/fXlj1dlj2Bae/XskEjDOQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E+GxFs1kbdksQPNIji9YEf35HGIY1GCV5VtnaOccppvHj4qb9Dr1ylQTBxXyRWgbykeyjlzr4IVl
WR6jM7NAXUvK9jUli4xhNjhj12RdUYiSH6ff1gmvROIj9KugfWIF+a5tnTPj3AQ28r9VW8ybBg4S
GLXYi7D2Z1Y7zqr1nq/ldIbYVz9ePfv9wk5cntfUNXM35aWKVmEebPypflL+UyLuzw6tGhLLXiSz
sHSc9fSZeopeFDekPkzAwQ4d95d9RjJ+aJhIXlUAdGUyvc4RU2QC3BzFdjTIC2S4pDus19bqnzJl
/A72P25hKzTRhfcNxKRVvPGwRdhZvslLa/SS7w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ls1ZkRyWGc+Pzhpg0KfvsabLXepB6qnXmCSudjWzd/oapNCHimurUyk/zABbzkaCOBQsXtXV3H9M
qPCPlG18VWTK0U+2jkek/O2Fn1+l3dpb19Rl7WXU7T309TdbtVsKuYg1vS0d5ujlvjHeNikK4gLK
gqVu3jEi6c11KaB/pUg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CODAimzI5Z988nDD3GlIWLB4ndv3+NxL+fDUFT3MDQAaSzhhz+YTR06tkl5xLF+kVvKcIXFi/UP4
JnMNUC/gjJ6kS4Ox8F+O/4vcNQpNcMYo3kWPxRcryG56ZEEvuhMZFB7n5LPbULlyIu252UyCmcee
Pbb8ywBqg+O+No1bwl3Yp+KFv16n05uCWFUHVLaddgXmBkp0k8H+Gh8z5hOJpsb7MSkP9PU6+xdj
vAe3wL8CLqUOb+hMZtENCO0PxycsYyLhVzxNB6Bh9cofoBJHYWK06MwQ6+1meobnPSSvjhfPknrN
hYBBsdQ+gzN1I42eOrTsxxDBRf451CrS8CFIEg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A3jEr8N50Kl51Yn2AFlFvEoPY4veINfpmQ35aaFx4swYec4XLYgaQntG3teMCUKZDULdNmSy3oEf
p/IQYgnPXo73KjuVqqyxK9Zh7dRwYlWhoQHoPkBd1VY1FBBXlY5jHpOFpx7JHpF/cwQ0vyDeHcOS
rQYpYeupk1HQwDSfbtsfkGXy/PBLZs8jRQzm0l9bodncAQio6WX3jDu/V5JsDB2OrHTZtv9RqYCT
Aou/2x78p19vkpT45ppoFeenjREGtevtYfX1Gqd6EUwfYYx3hybJ55rWsQSrQR1aIMmag+jXjb68
JHuzfRPa0gKKuAMK9PO0VUr5a72EivIkM30elA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TWebfsxvxY0p0s2EfSaBLU/jTcaHWH1r3gWDB/9bXtjErwzHe8HkJBHlLptM7l7Glx6qRmbjaD9b
vPQvYw14hiLzsZ500IMzZdN/wL56CI/z1Y654YPSZD79bTcMjxI6XfN/fUeO78MDtGpZEzDcYyxJ
+gD3qanEUCLVY7Y6ZooZVxCzGX1tYWYdzUkqRBI4H+lNW7P0142nZp2cpO7jzb8YsN50Ik4kkWYS
4eYNDyDSj1gH3/YYdM3G8MIertW85AHPvgBL1KSGBhTC0eTintuPynDIx5f70+K6JObdWA9bbLjq
Fv9hUkvsW48S9rD3gJcpW6F0cKUiwbVaqgzprA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T5KR4C+HnneOJroYzBjywZaqWPZZDtvy0gEi4l0xhrOC4NByRF1DuMA8c2PCrZLIUd6VBxp0f3Az
hWhNvXhHBpsdXXxmNHvs5GpBEWT+N7XTkpQRNtsZsQg4vs+vm6D0BIF8/NTZZShVLlm5uvlkHmTg
YZBvKlWYMo9I/cRSUEi2LRKEXoLZmb0tT3q3oNu3x2VDOpSxsaKIwpbWb2MmzPp55hrPhcr+5jpQ
dMOrwpe1zbtxDsYpDTliXXjpLadKTCzWysmvYGn9E7Xuu+UpXv/efUna8VEnGXktJIJPG5UuDFX5
9txZSbUPkE9ArhCeBkyu/TcTAM3VeC7zXSo1Qg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2960)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
