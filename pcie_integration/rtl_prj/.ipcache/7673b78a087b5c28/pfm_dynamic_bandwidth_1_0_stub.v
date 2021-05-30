// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
// Date        : Mon May 24 00:07:09 2021
// Host        : gozzo.local.necst.it running 64-bit Red Hat Enterprise Linux Server release 7.9 (Maipo)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ pfm_dynamic_bandwidth_1_0_stub.v
// Design      : pfm_dynamic_bandwidth_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu200-fsgd2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bandwidth,Vivado 2020.2.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, m_axi_gmem0_AWVALID, 
  m_axi_gmem0_AWREADY, m_axi_gmem0_AWADDR, m_axi_gmem0_AWID, m_axi_gmem0_AWLEN, 
  m_axi_gmem0_AWSIZE, m_axi_gmem0_AWBURST, m_axi_gmem0_AWLOCK, m_axi_gmem0_AWCACHE, 
  m_axi_gmem0_AWPROT, m_axi_gmem0_AWQOS, m_axi_gmem0_AWREGION, m_axi_gmem0_AWUSER, 
  m_axi_gmem0_WVALID, m_axi_gmem0_WREADY, m_axi_gmem0_WDATA, m_axi_gmem0_WSTRB, 
  m_axi_gmem0_WLAST, m_axi_gmem0_WID, m_axi_gmem0_WUSER, m_axi_gmem0_ARVALID, 
  m_axi_gmem0_ARREADY, m_axi_gmem0_ARADDR, m_axi_gmem0_ARID, m_axi_gmem0_ARLEN, 
  m_axi_gmem0_ARSIZE, m_axi_gmem0_ARBURST, m_axi_gmem0_ARLOCK, m_axi_gmem0_ARCACHE, 
  m_axi_gmem0_ARPROT, m_axi_gmem0_ARQOS, m_axi_gmem0_ARREGION, m_axi_gmem0_ARUSER, 
  m_axi_gmem0_RVALID, m_axi_gmem0_RREADY, m_axi_gmem0_RDATA, m_axi_gmem0_RLAST, 
  m_axi_gmem0_RID, m_axi_gmem0_RUSER, m_axi_gmem0_RRESP, m_axi_gmem0_BVALID, 
  m_axi_gmem0_BREADY, m_axi_gmem0_BRESP, m_axi_gmem0_BID, m_axi_gmem0_BUSER, 
  m_axi_gmem1_AWVALID, m_axi_gmem1_AWREADY, m_axi_gmem1_AWADDR, m_axi_gmem1_AWID, 
  m_axi_gmem1_AWLEN, m_axi_gmem1_AWSIZE, m_axi_gmem1_AWBURST, m_axi_gmem1_AWLOCK, 
  m_axi_gmem1_AWCACHE, m_axi_gmem1_AWPROT, m_axi_gmem1_AWQOS, m_axi_gmem1_AWREGION, 
  m_axi_gmem1_AWUSER, m_axi_gmem1_WVALID, m_axi_gmem1_WREADY, m_axi_gmem1_WDATA, 
  m_axi_gmem1_WSTRB, m_axi_gmem1_WLAST, m_axi_gmem1_WID, m_axi_gmem1_WUSER, 
  m_axi_gmem1_ARVALID, m_axi_gmem1_ARREADY, m_axi_gmem1_ARADDR, m_axi_gmem1_ARID, 
  m_axi_gmem1_ARLEN, m_axi_gmem1_ARSIZE, m_axi_gmem1_ARBURST, m_axi_gmem1_ARLOCK, 
  m_axi_gmem1_ARCACHE, m_axi_gmem1_ARPROT, m_axi_gmem1_ARQOS, m_axi_gmem1_ARREGION, 
  m_axi_gmem1_ARUSER, m_axi_gmem1_RVALID, m_axi_gmem1_RREADY, m_axi_gmem1_RDATA, 
  m_axi_gmem1_RLAST, m_axi_gmem1_RID, m_axi_gmem1_RUSER, m_axi_gmem1_RRESP, 
  m_axi_gmem1_BVALID, m_axi_gmem1_BREADY, m_axi_gmem1_BRESP, m_axi_gmem1_BID, 
  m_axi_gmem1_BUSER, s_axi_control_AWVALID, s_axi_control_AWREADY, s_axi_control_AWADDR, 
  s_axi_control_WVALID, s_axi_control_WREADY, s_axi_control_WDATA, s_axi_control_WSTRB, 
  s_axi_control_ARVALID, s_axi_control_ARREADY, s_axi_control_ARADDR, 
  s_axi_control_RVALID, s_axi_control_RREADY, s_axi_control_RDATA, s_axi_control_RRESP, 
  s_axi_control_BVALID, s_axi_control_BREADY, s_axi_control_BRESP, interrupt)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,m_axi_gmem0_AWVALID,m_axi_gmem0_AWREADY,m_axi_gmem0_AWADDR[63:0],m_axi_gmem0_AWID[0:0],m_axi_gmem0_AWLEN[7:0],m_axi_gmem0_AWSIZE[2:0],m_axi_gmem0_AWBURST[1:0],m_axi_gmem0_AWLOCK[1:0],m_axi_gmem0_AWCACHE[3:0],m_axi_gmem0_AWPROT[2:0],m_axi_gmem0_AWQOS[3:0],m_axi_gmem0_AWREGION[3:0],m_axi_gmem0_AWUSER[0:0],m_axi_gmem0_WVALID,m_axi_gmem0_WREADY,m_axi_gmem0_WDATA[511:0],m_axi_gmem0_WSTRB[63:0],m_axi_gmem0_WLAST,m_axi_gmem0_WID[0:0],m_axi_gmem0_WUSER[0:0],m_axi_gmem0_ARVALID,m_axi_gmem0_ARREADY,m_axi_gmem0_ARADDR[63:0],m_axi_gmem0_ARID[0:0],m_axi_gmem0_ARLEN[7:0],m_axi_gmem0_ARSIZE[2:0],m_axi_gmem0_ARBURST[1:0],m_axi_gmem0_ARLOCK[1:0],m_axi_gmem0_ARCACHE[3:0],m_axi_gmem0_ARPROT[2:0],m_axi_gmem0_ARQOS[3:0],m_axi_gmem0_ARREGION[3:0],m_axi_gmem0_ARUSER[0:0],m_axi_gmem0_RVALID,m_axi_gmem0_RREADY,m_axi_gmem0_RDATA[511:0],m_axi_gmem0_RLAST,m_axi_gmem0_RID[0:0],m_axi_gmem0_RUSER[0:0],m_axi_gmem0_RRESP[1:0],m_axi_gmem0_BVALID,m_axi_gmem0_BREADY,m_axi_gmem0_BRESP[1:0],m_axi_gmem0_BID[0:0],m_axi_gmem0_BUSER[0:0],m_axi_gmem1_AWVALID,m_axi_gmem1_AWREADY,m_axi_gmem1_AWADDR[63:0],m_axi_gmem1_AWID[0:0],m_axi_gmem1_AWLEN[7:0],m_axi_gmem1_AWSIZE[2:0],m_axi_gmem1_AWBURST[1:0],m_axi_gmem1_AWLOCK[1:0],m_axi_gmem1_AWCACHE[3:0],m_axi_gmem1_AWPROT[2:0],m_axi_gmem1_AWQOS[3:0],m_axi_gmem1_AWREGION[3:0],m_axi_gmem1_AWUSER[0:0],m_axi_gmem1_WVALID,m_axi_gmem1_WREADY,m_axi_gmem1_WDATA[511:0],m_axi_gmem1_WSTRB[63:0],m_axi_gmem1_WLAST,m_axi_gmem1_WID[0:0],m_axi_gmem1_WUSER[0:0],m_axi_gmem1_ARVALID,m_axi_gmem1_ARREADY,m_axi_gmem1_ARADDR[63:0],m_axi_gmem1_ARID[0:0],m_axi_gmem1_ARLEN[7:0],m_axi_gmem1_ARSIZE[2:0],m_axi_gmem1_ARBURST[1:0],m_axi_gmem1_ARLOCK[1:0],m_axi_gmem1_ARCACHE[3:0],m_axi_gmem1_ARPROT[2:0],m_axi_gmem1_ARQOS[3:0],m_axi_gmem1_ARREGION[3:0],m_axi_gmem1_ARUSER[0:0],m_axi_gmem1_RVALID,m_axi_gmem1_RREADY,m_axi_gmem1_RDATA[511:0],m_axi_gmem1_RLAST,m_axi_gmem1_RID[0:0],m_axi_gmem1_RUSER[0:0],m_axi_gmem1_RRESP[1:0],m_axi_gmem1_BVALID,m_axi_gmem1_BREADY,m_axi_gmem1_BRESP[1:0],m_axi_gmem1_BID[0:0],m_axi_gmem1_BUSER[0:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_AWADDR[5:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_ARADDR[5:0],s_axi_control_RVALID,s_axi_control_RREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_BRESP[1:0],interrupt" */;
  input ap_clk;
  input ap_rst_n;
  output m_axi_gmem0_AWVALID;
  input m_axi_gmem0_AWREADY;
  output [63:0]m_axi_gmem0_AWADDR;
  output [0:0]m_axi_gmem0_AWID;
  output [7:0]m_axi_gmem0_AWLEN;
  output [2:0]m_axi_gmem0_AWSIZE;
  output [1:0]m_axi_gmem0_AWBURST;
  output [1:0]m_axi_gmem0_AWLOCK;
  output [3:0]m_axi_gmem0_AWCACHE;
  output [2:0]m_axi_gmem0_AWPROT;
  output [3:0]m_axi_gmem0_AWQOS;
  output [3:0]m_axi_gmem0_AWREGION;
  output [0:0]m_axi_gmem0_AWUSER;
  output m_axi_gmem0_WVALID;
  input m_axi_gmem0_WREADY;
  output [511:0]m_axi_gmem0_WDATA;
  output [63:0]m_axi_gmem0_WSTRB;
  output m_axi_gmem0_WLAST;
  output [0:0]m_axi_gmem0_WID;
  output [0:0]m_axi_gmem0_WUSER;
  output m_axi_gmem0_ARVALID;
  input m_axi_gmem0_ARREADY;
  output [63:0]m_axi_gmem0_ARADDR;
  output [0:0]m_axi_gmem0_ARID;
  output [7:0]m_axi_gmem0_ARLEN;
  output [2:0]m_axi_gmem0_ARSIZE;
  output [1:0]m_axi_gmem0_ARBURST;
  output [1:0]m_axi_gmem0_ARLOCK;
  output [3:0]m_axi_gmem0_ARCACHE;
  output [2:0]m_axi_gmem0_ARPROT;
  output [3:0]m_axi_gmem0_ARQOS;
  output [3:0]m_axi_gmem0_ARREGION;
  output [0:0]m_axi_gmem0_ARUSER;
  input m_axi_gmem0_RVALID;
  output m_axi_gmem0_RREADY;
  input [511:0]m_axi_gmem0_RDATA;
  input m_axi_gmem0_RLAST;
  input [0:0]m_axi_gmem0_RID;
  input [0:0]m_axi_gmem0_RUSER;
  input [1:0]m_axi_gmem0_RRESP;
  input m_axi_gmem0_BVALID;
  output m_axi_gmem0_BREADY;
  input [1:0]m_axi_gmem0_BRESP;
  input [0:0]m_axi_gmem0_BID;
  input [0:0]m_axi_gmem0_BUSER;
  output m_axi_gmem1_AWVALID;
  input m_axi_gmem1_AWREADY;
  output [63:0]m_axi_gmem1_AWADDR;
  output [0:0]m_axi_gmem1_AWID;
  output [7:0]m_axi_gmem1_AWLEN;
  output [2:0]m_axi_gmem1_AWSIZE;
  output [1:0]m_axi_gmem1_AWBURST;
  output [1:0]m_axi_gmem1_AWLOCK;
  output [3:0]m_axi_gmem1_AWCACHE;
  output [2:0]m_axi_gmem1_AWPROT;
  output [3:0]m_axi_gmem1_AWQOS;
  output [3:0]m_axi_gmem1_AWREGION;
  output [0:0]m_axi_gmem1_AWUSER;
  output m_axi_gmem1_WVALID;
  input m_axi_gmem1_WREADY;
  output [511:0]m_axi_gmem1_WDATA;
  output [63:0]m_axi_gmem1_WSTRB;
  output m_axi_gmem1_WLAST;
  output [0:0]m_axi_gmem1_WID;
  output [0:0]m_axi_gmem1_WUSER;
  output m_axi_gmem1_ARVALID;
  input m_axi_gmem1_ARREADY;
  output [63:0]m_axi_gmem1_ARADDR;
  output [0:0]m_axi_gmem1_ARID;
  output [7:0]m_axi_gmem1_ARLEN;
  output [2:0]m_axi_gmem1_ARSIZE;
  output [1:0]m_axi_gmem1_ARBURST;
  output [1:0]m_axi_gmem1_ARLOCK;
  output [3:0]m_axi_gmem1_ARCACHE;
  output [2:0]m_axi_gmem1_ARPROT;
  output [3:0]m_axi_gmem1_ARQOS;
  output [3:0]m_axi_gmem1_ARREGION;
  output [0:0]m_axi_gmem1_ARUSER;
  input m_axi_gmem1_RVALID;
  output m_axi_gmem1_RREADY;
  input [511:0]m_axi_gmem1_RDATA;
  input m_axi_gmem1_RLAST;
  input [0:0]m_axi_gmem1_RID;
  input [0:0]m_axi_gmem1_RUSER;
  input [1:0]m_axi_gmem1_RRESP;
  input m_axi_gmem1_BVALID;
  output m_axi_gmem1_BREADY;
  input [1:0]m_axi_gmem1_BRESP;
  input [0:0]m_axi_gmem1_BID;
  input [0:0]m_axi_gmem1_BUSER;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [5:0]s_axi_control_AWADDR;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  input [5:0]s_axi_control_ARADDR;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  output [1:0]s_axi_control_BRESP;
  output interrupt;
endmodule
