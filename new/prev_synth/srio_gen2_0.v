//
// (c) Copyright 2010 - 2014 Xilinx, Inc. All rights reserved.
//
//                                                                 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// 	PART OF THIS FILE AT ALL TIMES.                                
`timescale 1ps/1ps
(* DowngradeIPIdentifiedWarnings = "yes" *)
(* X_CORE_INFO = "srio_gen2_v4_1_5,Vivado 2015.1.0" *)
//------------------------------------------------------------------------------

// port/parameter declarations in block wrapper ----------------

//------------------------------------------------------------------------------

module srio_gen2_0
  #(
   // {{{ Parameter declarations -----------
    parameter TCQ                     = 100, // in pS
    parameter LINK_WIDTH              = 1,
    parameter C_LINK_WIDTH            = 1
   )
   (

    // all clocks as output
    input            log_clk_in   ,        // LOG interface clock
    input            phy_clk_in   ,        // PHY interface clock
    input            gt_clk_in    ,
    input            gt_pcs_clk_in,        // GT fabric interface clock
    input            drpclk_in    ,
    input            refclk_in    ,

    input            clk_lock_in  ,
    // all resets as output
    input            cfg_rst_in   ,
    input            log_rst_in   ,                // Reset for LOG clock Domain
    input            buf_rst_in   ,
    input            phy_rst_in   ,                // Reset for PHY clock Domain
    input            gt_pcs_rst_in,

    // QPLL outputs

    input            gt0_qpll_clk_in       ,
    input            gt0_qpll_out_refclk_in,






//---------------------------------------------
    // Serial IO Interface
    input             srio_rxn0,               // Serial Receive Data
    input             srio_rxp0,               // Serial Receive Data

    output            srio_txn0,               // Serial Transmit Data
    output            srio_txp0,               // Serial Transmit Data

    // LOG User I/O Interface


    input             s_axis_ireq_tvalid,             // Indicates Valid Input on the Request Channel
    output            s_axis_ireq_tready,             // Beat has been accepted
    input             s_axis_ireq_tlast,              // Indicates last beat
    input  [63:0]     s_axis_ireq_tdata,              // Req Data Bus
    input  [7:0]      s_axis_ireq_tkeep,              // Req Keep Bus
    input  [31:0]     s_axis_ireq_tuser,              // Req User Bus

    output            m_axis_iresp_tvalid,            // Indicates Valid Output on the Response Channel
    input             m_axis_iresp_tready,            // Beat has been accepted
    output            m_axis_iresp_tlast,             // Indicates last beat
    output  [63:0]    m_axis_iresp_tdata,             // Resp Data Bus
    output  [7:0]     m_axis_iresp_tkeep,             // Resp Keep Bus
    output  [31:0]    m_axis_iresp_tuser,             // Resp User Bus

    output            m_axis_treq_tvalid,             // Indicates Valid Output on the Response Channel
    input             m_axis_treq_tready,             // Beat has been accepted
    output            m_axis_treq_tlast,              // Indicates last beat
    output  [63:0]    m_axis_treq_tdata,              // Resp Data Bus
    output  [7:0]     m_axis_treq_tkeep,              // Resp Keep Bus
    output  [31:0]    m_axis_treq_tuser,              // Resp User Bus

    input             s_axis_tresp_tvalid,            // Indicates Valid Input on the Request Channel
    output            s_axis_tresp_tready,            // Beat has been accepted
    input             s_axis_tresp_tlast,             // Indicates last beat
    input  [63:0]     s_axis_tresp_tdata,             // Req Data Bus
    input  [7:0]      s_axis_tresp_tkeep,             // Req Keep Bus
    input  [31:0]     s_axis_tresp_tuser,             // Req User Bus

      input             s_axi_maintr_rst,        // Reset for maintr interface, on LOG clk domain

    // Maintenance Port Interface
    input             s_axi_maintr_awvalid,          // Write Command Valid
    output            s_axi_maintr_awready,          // Write Port Ready
    input  [31:0]     s_axi_maintr_awaddr,           // Write Address
    input             s_axi_maintr_wvalid,           // Write Data Valid
    output            s_axi_maintr_wready,           // Write Port Ready
    input  [31:0]     s_axi_maintr_wdata,            // Write Data
    output            s_axi_maintr_bvalid,           // Write Response Valid
    input             s_axi_maintr_bready,           // Write Response Fabric Ready
    output [1:0]      s_axi_maintr_bresp,            // Write Response

    input             s_axi_maintr_arvalid,          // Read Command Valid
    output            s_axi_maintr_arready,          // Read Port Ready
    input  [31:0]     s_axi_maintr_araddr,           // Read Address
    output            s_axi_maintr_rvalid,           // Read Response Valid
    input             s_axi_maintr_rready,           // Read Response Fabric Ready
    output [31:0]     s_axi_maintr_rdata,            // Read Data
    output [1:0]      s_axi_maintr_rresp,            // Read Response


    // PHY control signals
    input             sim_train_en,            // Reduce timers for inialization for simulation
    input             force_reinit,            // Force reinitialization
    input             phy_mce,                 // Send MCE control symbol
    input             phy_link_reset,          // Send link reset control symbols

    // core debug signals
    output                      phy_rcvd_mce       ,            // MCE control symbol received
    output                      phy_rcvd_link_reset,     // Received 4 consecutive reset symbols
    output    [223:0]           phy_debug          ,               // Useful debug signals
    output                      gtrx_disperr_or    ,         // GT disparity error (reduce ORed)
    output                      gtrx_notintable_or ,      // GT not in table error (reduce ORed)

   // side band signals
    output            port_error,              // In Port Error State
    output     [23:0] port_timeout,            // Timeout value from Port Response Timeout CSR
    output            srio_host,               // Endpoint is the system host

    // LOG Informational signals
    output            port_decode_error,       // Received transaction did not match a valid port
    output     [15:0] deviceid         ,       // Device ID

    output            idle2_selected,          // The PHY is operating in IDLE2 mode
    output            phy_lcl_master_enable_out    ,
    output            buf_lcl_response_only_out    ,
    output            buf_lcl_tx_flow_control_out  ,
    output      [5:0] buf_lcl_phy_buf_stat_out     ,
    output      [5:0] phy_lcl_phy_next_fm_out      ,
    output      [5:0] phy_lcl_phy_last_ack_out     ,
    output            phy_lcl_phy_rewind_out       ,
    output      [5:0] phy_lcl_phy_rcvd_buf_stat_out,
    output            phy_lcl_maint_only_out       ,





    // PHY Informational signals
    output            port_initialized,        // Port is intialized
    output            link_initialized,        // Ready to transmit data
    output            idle_selected,           // The IDLE sequence has been selected
    output            mode_1x                  // Link is trained down to 1x mode
   );
//------------------------------------------------------------------------------
//----

//------------------------------------------------------------------------------
    wire [C_LINK_WIDTH-1:0]     gt_txpmaresetdone_out;
  // SRIO_WRAPPER instantation ----------------
  srio_gen2_0_block
inst (


      .log_clk_in            (log_clk_in          ),
      .phy_clk_in            (phy_clk_in          ),
      //.log_lcl_cfg_clk       (log_clk_in          ),
      .gt_clk_in                (gt_clk_in           ),
      .gt_pcs_clk_in            (gt_pcs_clk_in       ),
      .drpclk_in                (drpclk_in           ),
      .refclk_in                (refclk_in           ),
      .clk_lock              (clk_lock_in         ),

      .log_lcl_cfg_rst       (cfg_rst_in          ),
      .log_rst               (log_rst_in          ),
      .buf_rst               (buf_rst_in          ),
      .phy_rst               (phy_rst_in          ),
      .gt_pcs_rst            (gt_pcs_rst_in       ),


    .gt0_qpll_clk              (gt0_qpll_clk_in        ),
    .gt0_qpll_out_refclk       (gt0_qpll_out_refclk_in ),




      .s_axi_maintr_rst        (s_axi_maintr_rst),


      .srio_rxn0               (srio_rxn0),
      .srio_rxp0               (srio_rxp0),

      .srio_txn0               (srio_txn0),
      .srio_txp0               (srio_txp0),
      .s_axis_ireq_tvalid      (s_axis_ireq_tvalid),
      .s_axis_ireq_tready      (s_axis_ireq_tready),
      .s_axis_ireq_tlast       (s_axis_ireq_tlast),
      .s_axis_ireq_tdata       (s_axis_ireq_tdata),
      .s_axis_ireq_tkeep       (s_axis_ireq_tkeep),
      .s_axis_ireq_tuser       (s_axis_ireq_tuser),

      .m_axis_iresp_tvalid     (m_axis_iresp_tvalid),
      .m_axis_iresp_tready     (m_axis_iresp_tready),
      .m_axis_iresp_tlast      (m_axis_iresp_tlast),
      .m_axis_iresp_tdata      (m_axis_iresp_tdata),
      .m_axis_iresp_tkeep      (m_axis_iresp_tkeep),
      .m_axis_iresp_tuser      (m_axis_iresp_tuser),

      .s_axis_tresp_tvalid     (s_axis_tresp_tvalid),
      .s_axis_tresp_tready     (s_axis_tresp_tready),
      .s_axis_tresp_tlast      (s_axis_tresp_tlast),
      .s_axis_tresp_tdata      (s_axis_tresp_tdata),
      .s_axis_tresp_tkeep      (s_axis_tresp_tkeep),
      .s_axis_tresp_tuser      (s_axis_tresp_tuser),

      .m_axis_treq_tvalid      (m_axis_treq_tvalid),
      .m_axis_treq_tready      (m_axis_treq_tready),
      .m_axis_treq_tlast       (m_axis_treq_tlast),
      .m_axis_treq_tdata       (m_axis_treq_tdata),
      .m_axis_treq_tkeep       (m_axis_treq_tkeep),
      .m_axis_treq_tuser       (m_axis_treq_tuser),

      .s_axi_maintr_awvalid     (s_axi_maintr_awvalid),
      .s_axi_maintr_awready     (s_axi_maintr_awready),
      .s_axi_maintr_awaddr      (s_axi_maintr_awaddr),
      .s_axi_maintr_wvalid      (s_axi_maintr_wvalid),
      .s_axi_maintr_wready      (s_axi_maintr_wready),
      .s_axi_maintr_wdata       (s_axi_maintr_wdata),
      .s_axi_maintr_bvalid      (s_axi_maintr_bvalid),
      .s_axi_maintr_bready      (s_axi_maintr_bready),
      .s_axi_maintr_bresp       (s_axi_maintr_bresp),

      .s_axi_maintr_arvalid     (s_axi_maintr_arvalid),
      .s_axi_maintr_arready     (s_axi_maintr_arready),
      .s_axi_maintr_araddr      (s_axi_maintr_araddr),
      .s_axi_maintr_rvalid      (s_axi_maintr_rvalid),
      .s_axi_maintr_rready      (s_axi_maintr_rready),
      .s_axi_maintr_rdata       (s_axi_maintr_rdata),
      .s_axi_maintr_rresp       (s_axi_maintr_rresp),

      .sim_train_en                    (sim_train_en       ),
      .force_reinit                    (force_reinit       ),
      .phy_mce                         (phy_mce            ),
      .phy_link_reset                  (phy_link_reset     ),

      .phy_rcvd_mce                    (phy_rcvd_mce       ),
      .phy_rcvd_link_reset             (phy_rcvd_link_reset),
      .phy_debug                       (phy_debug          ),
      .gtrx_disperr_or                 (gtrx_disperr_or    ),
      .gtrx_notintable_or              (gtrx_notintable_or ),


      .port_error                      (port_error       ),
      .port_timeout                    (port_timeout     ),
      .srio_host                       (srio_host        ),
      .port_decode_error               (port_decode_error),
      .deviceid                        (deviceid         ),
      .idle2_selected                  (idle2_selected   ),
      .phy_lcl_master_enable_out       (phy_lcl_master_enable_out    ),
      .buf_lcl_response_only_out       (buf_lcl_response_only_out    ),
      .buf_lcl_tx_flow_control_out     (buf_lcl_tx_flow_control_out  ),
      .buf_lcl_phy_buf_stat_out        (buf_lcl_phy_buf_stat_out     ),
      .phy_lcl_phy_next_fm_out         (phy_lcl_phy_next_fm_out      ),
      .phy_lcl_phy_last_ack_out        (phy_lcl_phy_last_ack_out     ),
      .phy_lcl_phy_rewind_out          (phy_lcl_phy_rewind_out       ),
      .phy_lcl_phy_rcvd_buf_stat_out   (phy_lcl_phy_rcvd_buf_stat_out),
      .phy_lcl_maint_only_out          (phy_lcl_maint_only_out       ),





    .port_initialized               (port_initialized	),
    .link_initialized               (link_initialized	),
    .idle_selected                  (idle_selected		),
    .mode_1x                        (mode_1x		    )

     );
  // End of SRIO_WRAPPER instantiation --------
//------------------------------------------------------------------------------

//----
endmodule
