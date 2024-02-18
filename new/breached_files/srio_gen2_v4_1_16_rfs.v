module srio_gen2_v4_1_16_unifiedtop #(
   //  Parameter declarations -----------
    parameter TCQ                       = 100,

    parameter COMPONENT_NAME            = ("srio_gen2_0"),
    parameter C_DEVICEID_WIDTH          = ( 8) ,
    parameter C_DEVICEID                = (16'h00FF),
    parameter C_INIT_NREAD              = ( 1) ,
    parameter C_INIT_NWRITE             = ( 1) ,
    parameter C_INIT_NWRITE_R           = ( 1) ,
    parameter C_INIT_SWRITE             = ( 1) ,
    parameter C_INIT_DB                 = ( 1) ,
    parameter C_INIT_ATOMIC             = ( 1) ,
    parameter C_INIT_DS                 = ( 0) ,
    parameter C_TARGET_NREAD            = ( 1) ,
    parameter C_TARGET_NWRITE           = ( 1) ,
    parameter C_TARGET_NWRITE_R         = ( 1) ,
    parameter C_TARGET_SWRITE           = ( 1) ,
    parameter C_TARGET_DB               = ( 1) ,
    parameter C_TARGET_ATOMIC           = ( 1) ,
    parameter C_TARGET_DS               = ( 0) ,
    parameter C_MSG_INIT_SINGLE         = ( 1) ,
    parameter C_MSG_INIT_MULTI          = ( 1) ,
    parameter C_MSG_SINK_SINGLE         = ( 1) ,
    parameter C_MSG_SINK_MULTI          = ( 1) ,
    parameter C_CRF_SUPPORT             = ( 0) ,
    parameter C_SINGLE_SEG_MBOX         = ( 16) ,
    parameter C_MAINT_SOURCE            = ( 1) ,
    parameter C_MAINT_CFG               = ( 1) ,
    parameter C_DEVID_CAR               = ("00000000"),
    parameter C_DEVINFO_CAR             = ("00000000"),
    parameter C_DEV_CAR_OVRD            = ( 0) ,
    parameter C_LCSBA_SUPPORT           = ( 1) ,
    parameter C_LCSBA                   = ("3FF"),
    parameter C_HW_ARCH                 = ( 9) ,
    parameter C_ASSY_ID                 = ("0000"),
    parameter C_ASSY_VENDOR             = ("0000"),
    parameter C_ASSY_REV                = ("0000"),
    parameter C_PHY_EF_PTR              = ("0100"),
    parameter C_PE_BRIDGE               = ( 0) ,
    parameter C_PE_MEMORY               = ( 1) ,
    parameter C_PE_PROC                 = ( 0) ,
    parameter C_PE_SWITCH               = ( 0) ,
    parameter C_PORT_IO_HELLO           = ( 1) ,
    parameter C_PORT_MSG_HELLO          = ( 1) ,
    parameter C_PORT_MAINT_HELLO        = ( 1) ,
    parameter C_PORT_IO_STYLE           = ( 1) ,
    parameter C_PORT_MSG_STYLE          = ( 0) ,
    parameter C_PORT_MAINT_STYLE        = ( 1) ,
    parameter C_PORT_USERDEF_ENABLED    = ( 0) ,
    parameter C_PORT_ERR_RESP_ENABLED   = ( 0) ,
    parameter C_TX_ENABLE_FAIRNESS      = ( 0) ,
    parameter C_REQ_REORDER             = ( 1) ,
    parameter C_TX_DEPTH                = ( 32) ,
    parameter C_RX_DEPTH                = ( 32) ,
    parameter C_RX_FC_ONLY              = ( 0) ,
    parameter C_UNIFIED_CLK             = ( 0) ,
    parameter C_MODE_XG                 = ( 5) ,
    parameter C_WM0                     = ( 3) ,
    parameter C_WM1                     = ( 2) ,
    parameter C_WM2                     = ( 1) ,
    parameter C_IDLE2                   = ( 0) ,
    parameter C_LINK_WIDTH              = ( 1) ,
    parameter C_SIM_TRAIN               = ( 0) ,
    parameter C_IDLE1                   = ( 1) ,
    parameter C_SCRAM                   = ( 0) ,
    parameter C_RETRY                   = ( 1) ,
    parameter C_LINK_REQUESTS           = ( 3) ,
    parameter C_LANE_EF_PTR             = ("0400"),
    parameter C_VC_EF_PTR               = ("800"),
    parameter C_LINK_TIMEOUT            = ("FFFFFF"),
    parameter C_PORT_TIMEOUT            = ("FFFFFF"),
    parameter C_IS_HOST                 = ( 1) ,
    parameter C_MASTER_EN               = ( 1) ,
    parameter C_DISCOVERED              = ( 0) ,
    parameter C_USER_EF_PTR             = ("0000"),
    parameter C_SW_CSR                  = ( 0) ,
    parameter c_enable_user_ef          = ( 0) ,
    parameter c_device_id_width         = ( 8) ,
    parameter c_device_id               = ("00FF"),
    parameter c_validation              = ( 0) ,
    parameter c_debug                   = ( 0) ,
    parameter c_ref_clk                 = ( 1) ,
    parameter c_xiltest                 = ( 0) ,
    parameter c_speedgrade              = ("-2"),
    parameter c_component_name          = ("srio_gen2_0"),
    parameter c_vc_en                   = ( 0) ,
    parameter c_vc_ct                   = ( 1) ,
    parameter c_family                  = ("zynq"),
    parameter c_device                  = ("xc7z012s"),
    parameter c_part                    = ("xc7z012sclg485-2"),
    parameter C_SILICON_REV             = ( 2) ,
    parameter C_SHARED_LOGIC            = ( 0) ,
    parameter c_gt0_debug_ports         = ( 1) ,
    parameter c_side_band               = ( 1) ,
    parameter c_transceivercontrol      = ( 0),
    parameter GT_BYTES                  = ( 8)
    ) 

    (
    //  port declarations ----------------
      // LOG signals
    input              log_lcl_log_clk   ,
    input              log_rst           ,
    input              log_lcl_cfg_clk   ,
    input              log_lcl_cfg_rst   ,
    input              s_axi_maintr_rst  ,                        

    input              s_axis_iotx_tvalid,
    output             s_axis_iotx_tready,
    input              s_axis_iotx_tlast ,
    input   [63: 0]    s_axis_iotx_tdata ,
    input   [ 7: 0]    s_axis_iotx_tkeep ,
    input   [31: 0]    s_axis_iotx_tuser ,

    output             m_axis_iorx_tvalid,
    input              m_axis_iorx_tready,
    output             m_axis_iorx_tlast ,
    output   [63: 0]   m_axis_iorx_tdata ,
    output   [ 7: 0]   m_axis_iorx_tkeep ,
    output   [31: 0]   m_axis_iorx_tuser ,

    input              s_axis_ireq_tvalid,             // Indicates Valid Input on the Request Channel
    output             s_axis_ireq_tready,             // Beat has been accepted
    input              s_axis_ireq_tlast,              // Indicates last beat
    input   [63: 0]    s_axis_ireq_tdata,              // Req Data Bus
    input   [ 7: 0]    s_axis_ireq_tkeep,              // Req Keep Bus
    input   [31: 0]    s_axis_ireq_tuser,              // Req User Bus

    output             m_axis_iresp_tvalid,            // Indicates Valid Output on the Response Channel
    input              m_axis_iresp_tready,            // Beat has been accepted
    output             m_axis_iresp_tlast,             // Indicates last beat
    output  [63: 0]    m_axis_iresp_tdata,             // Resp Data Bus
    output  [ 7: 0]    m_axis_iresp_tkeep,             // Resp Keep Bus
    output  [31: 0]    m_axis_iresp_tuser,             // Resp User Bus


    input              s_axis_tresp_tvalid,            // Indicates Valid Input on the Request Channel
    output             s_axis_tresp_tready,            // Beat has been accepted
    input              s_axis_tresp_tlast,             // Indicates last beat
    input   [63: 0]    s_axis_tresp_tdata,             // Req Data Bus
    input   [ 7: 0]    s_axis_tresp_tkeep,             // Req Keep Bus
    input   [31: 0]    s_axis_tresp_tuser,             // Req User Bus


    output             m_axis_treq_tvalid,             // Indicates Valid Output on the Response Channel
    input              m_axis_treq_tready,             // Beat has been accepted
    output             m_axis_treq_tlast,              // Indicates last beat
    output  [63: 0]    m_axis_treq_tdata,              // Resp Data Bus
    output  [ 7: 0]    m_axis_treq_tkeep,              // Resp Keep Bus
    output  [31: 0]    m_axis_treq_tuser,              // Resp User Bus










    output              m_axis_erriresp_tvalid,       // output   default values
    input               m_axis_erriresp_tready,       // input
    output              m_axis_erriresp_tlast ,       // output
    output [63: 0]      m_axis_erriresp_tdata ,       // output  [63:0]
    output [ 7: 0]      m_axis_erriresp_tkeep ,       // output  [7:0]
    output [31: 0]      m_axis_erriresp_tuser ,       // output  [31:0]

    input               s_axis_msgireq_tvalid,        // input         default values
    output              s_axis_msgireq_tready,        // output
    input               s_axis_msgireq_tlast ,        // input
    input  [63: 0]      s_axis_msgireq_tdata ,        // input  [63:0]
    input  [ 7: 0]      s_axis_msgireq_tkeep ,        // input  [7:0]
    input  [31: 0]      s_axis_msgireq_tuser ,        // input  [31:0]

    output              m_axis_msgiresp_tvalid,       // output       default values
    input               m_axis_msgiresp_tready,       // input
    output              m_axis_msgiresp_tlast ,       // output
    output  [63: 0]     m_axis_msgiresp_tdata ,       // output  [63:0]
    output  [ 7: 0]     m_axis_msgiresp_tkeep ,       // output  [7:0]
    output  [31: 0]     m_axis_msgiresp_tuser ,       // output  [31:0]

    input               s_axis_msgtresp_tvalid,       // input        default values
    output              s_axis_msgtresp_tready,       // output
    input               s_axis_msgtresp_tlast ,       // input
    input  [63: 0]      s_axis_msgtresp_tdata ,       // input  [63:0]
    input  [ 7: 0]      s_axis_msgtresp_tkeep ,       // input  [7:0]
    input  [31: 0]      s_axis_msgtresp_tuser ,       // input  [31:0]

    output              m_axis_msgtreq_tvalid,        // output        default values
    input               m_axis_msgtreq_tready,        // input
    output              m_axis_msgtreq_tlast ,        // output
    output  [63: 0]     m_axis_msgtreq_tdata ,        // output  [63:0]
    output  [ 7: 0]     m_axis_msgtreq_tkeep ,        // output  [7:0]
    output  [31: 0]     m_axis_msgtreq_tuser ,        // output  [31:0]
      // User-Defined Port
    input               s_axis_usrtx_tvalid,        // input      default values
    output              s_axis_usrtx_tready,        // output
    input               s_axis_usrtx_tlast ,        // input
    input  [63: 0]      s_axis_usrtx_tdata ,        // input  [63:0]
    input  [ 7: 0]      s_axis_usrtx_tkeep ,        // input  [7:0]
    input  [ 7: 0]      s_axis_usrtx_tuser ,        // input  [7:0]

    output              m_axis_usrrx_tvalid,          // output   default values
    input               m_axis_usrrx_tready,          // input
    output              m_axis_usrrx_tlast ,          // output
    output  [63: 0]     m_axis_usrrx_tdata ,          // output  [63:0]
    output  [ 7: 0]     m_axis_usrrx_tkeep ,          // output  [7:0]
    output  [ 7: 0]     m_axis_usrrx_tuser ,          // output  [7:0]

      // maintrx, maintreq and maiorts @ default values
    output              m_axis_maintrx_tvalid,        // out std_logic;
    input               m_axis_maintrx_tready,        // in  std_logic := '0';
    output              m_axis_maintrx_tlast ,        // out std_logic;
    output  [63: 0]     m_axis_maintrx_tdata ,        // out std_logic_vector(63 downto 0)  ;
    output  [ 7: 0]     m_axis_maintrx_tkeep ,        // out std_logic_vector(7 downto 0)  ;
    output  [((C_PORT_MAINT_HELLO * 24) + 7): 0]     m_axis_maintrx_tuser,         // out std_logic_vector(((C_PORT_MAINT_HELLO * 24) + 7) downto 0)  ;

    input               s_axis_maintreq_tvalid,       // : in std_logic := '0';
    output              s_axis_maintreq_tready,       // : out std_logic;
    input               s_axis_maintreq_tlast ,       // : in std_logic := '0';
    input  [63: 0]      s_axis_maintreq_tdata ,       // : in std_logic_vector(63 downto 0) := (others => '0');
    input  [ 7: 0]      s_axis_maintreq_tkeep ,       // : in std_logic_vector(7 downto 0) := (others => '0');
    input  [((C_PORT_MAINT_HELLO * 24) + 7): 0]       s_axis_maintreq_tuser,      // : in std_logic_vector(((C_PORT_MAINT_HELLO * 24) + 7) downto 0) := (others => '0');

    input               s_axis_maintresp_tvalid,      // : in std_logic := '0';
    output              s_axis_maintresp_tready,      // : out std_logic;
    input               s_axis_maintresp_tlast ,      // : in std_logic := '0';
    input  [63: 0]      s_axis_maintresp_tdata ,      // : in std_logic_vector(63 downto 0) := (others => '0');
    input  [ 7: 0]      s_axis_maintresp_tkeep ,      // : in std_logic_vector(7 downto 0) := (others => '0');
    input  [((C_PORT_MAINT_HELLO * 24) + 7): 0]          s_axis_maintresp_tuser,       // : in std_logic_vector(((C_PORT_MAINT_HELLO * 24) + 7) downto 0) := (others => '0');
    
    
    input               s_axi_maintr_awvalid,
    output              s_axi_maintr_awready,
    input  [31:0]       s_axi_maintr_awaddr ,
    input               s_axi_maintr_wvalid ,
    output              s_axi_maintr_wready ,
    input  [31:0]       s_axi_maintr_wdata  ,
    output              s_axi_maintr_bvalid ,
    input               s_axi_maintr_bready ,
    output [1:0]        s_axi_maintr_bresp  ,
    input               s_axi_maintr_arvalid,
    output              s_axi_maintr_arready,
    input  [31: 0]      s_axi_maintr_araddr ,
    output              s_axi_maintr_rvalid ,
    input               s_axi_maintr_rready ,
    output [31: 0]      s_axi_maintr_rdata  ,
    output [ 1: 0]      s_axi_maintr_rresp  ,

    // Configuration Master Interface
    output              m_axi_cfgr_awvalid,
    input               m_axi_cfgr_awready,
    output [23: 0]      m_axi_cfgr_awaddr ,
    output              m_axi_cfgr_wvalid ,
    input               m_axi_cfgr_wready ,
    output [31: 0]      m_axi_cfgr_wdata  ,
    output [ 3: 0]      m_axi_cfgr_wstrb  ,
    output [ 2: 0]      m_axi_cfgr_awprot ,
    input               m_axi_cfgr_bvalid ,
    output              m_axi_cfgr_bready ,
    input  [ 1: 0]      m_axi_cfgr_bresp  ,
    output              m_axi_cfgr_arvalid,
    input               m_axi_cfgr_arready,
    output [23: 0]      m_axi_cfgr_araddr ,
    output [ 2: 0]      m_axi_cfgr_arprot ,
    input               m_axi_cfgr_rvalid ,
    output              m_axi_cfgr_rready ,
    input  [31: 0]      m_axi_cfgr_rdata  ,
    input  [ 1: 0]      m_axi_cfgr_rresp  ,     

    // LOG-BUF Interface
    output              m_axis_buft_tvalid,
    input               m_axis_buft_tready,
    output [63: 0]      m_axis_buft_tdata ,
    output [ 7: 0]      m_axis_buft_tkeep ,
    output              m_axis_buft_tlast ,
    output [ 7: 0]      m_axis_buft_tuser ,
    input               log_lcl_response_only,   //not sure

    input               s_axis_bufr_tvalid,
    output              s_axis_bufr_tready,
    input  [63: 0]      s_axis_bufr_tdata ,
    input  [ 7: 0]      s_axis_bufr_tkeep ,
    input               s_axis_bufr_tlast ,
    input  [ 7: 0]      s_axis_bufr_tuser ,    

    // LOG Configuration Register Interface
    input               s_axi_cfgl_awvalid,
    output              s_axi_cfgl_awready,
    input  [23:0]       s_axi_cfgl_awaddr ,
    input               s_axi_cfgl_wvalid ,
    output              s_axi_cfgl_wready ,
    input  [31:0]       s_axi_cfgl_wdata  ,
    input  [ 3:0]       s_axi_cfgl_wstrb  ,
    output              s_axi_cfgl_bvalid ,
    input               s_axi_cfgl_bready ,
    input               s_axi_cfgl_arvalid,
    output              s_axi_cfgl_arready,
    input  [23: 0]      s_axi_cfgl_araddr ,
    output              s_axi_cfgl_rvalid ,
    input               s_axi_cfgl_rready ,
    output [31: 0]      s_axi_cfgl_rdata  ,   

    output                            port_decode_error ,     //not sure
    input  [C_DEVICEID_WIDTH - 1: 0]      deviceid          ,
    input                             log_lcl_maint_only,     //not sure

      // BUF signals
    input               buf_lcl_phy_clk ,
    input               buf_lcl_log_clk ,
    input               buf_lcl_cfg_clk ,
    input               buf_rst         ,
    input               buf_lcl_cfg_rst ,

    // LOG-BUF Interface
    output              s_axis_buft_tvalid   ,   
    input               s_axis_buft_tready   ,   
    output  [63: 0]     s_axis_buft_tdata    ,   
    output  [ 7: 0]     s_axis_buft_tkeep    ,   
    output              s_axis_buft_tlast    ,   
    output  [ 7: 0]     s_axis_buft_tuser    ,   
    input               buf_lcl_response_only,  

    input               m_axis_bufr_tvalid,
    output              m_axis_bufr_tready,
    input   [63: 0]     m_axis_bufr_tdata ,
    input   [ 7: 0]     m_axis_bufr_tkeep ,
    input               m_axis_bufr_tlast ,
    input   [ 7: 0]     m_axis_bufr_tuser ,  

    // BUF-PHY Interface
    output              m_axis_phyt_tvalid,
    input               m_axis_phyt_tready,
    output  [63: 0]     m_axis_phyt_tdata ,
    output  [ 7: 0]     m_axis_phyt_tkeep ,
    output              m_axis_phyt_tlast ,
    output  [ 7: 0]     m_axis_phyt_tuser ,


    input               s_axis_phyr_tvalid,
    output              s_axis_phyr_tready,
    input   [63: 0]     s_axis_phyr_tdata ,
    input   [ 7: 0]     s_axis_phyr_tkeep ,
    input               s_axis_phyr_tlast ,
    input   [ 7: 0]     s_axis_phyr_tuser ,

    input               buf_lcl_phy_rewind,

    input  [ 5: 0]      buf_lcl_phy_buf_stat     , 
    output [ 5: 0]      buf_lcl_phy_rcvd_buf_stat, 
    output [ 5: 0]      buf_lcl_phy_last_ack     , 
    output [ 5: 0]      buf_lcl_phy_next_fm      , 
    input               buf_lcl_tx_flow_control  , 
    output              buf_lcl_idle2_selected   , 

    // Config signals
    output              buf_lcl_master_enable,    

    // BUF Configuration Register Interface
    input               s_axi_cfgb_awvalid,
    output              s_axi_cfgb_awready,
    input   [23: 0]     s_axi_cfgb_awaddr ,
    input               s_axi_cfgb_wvalid ,
    output              s_axi_cfgb_wready ,
    input   [31: 0]     s_axi_cfgb_wdata  ,
    input   [ 3: 0]     s_axi_cfgb_wstrb  ,
    output              s_axi_cfgb_bvalid ,
    input               s_axi_cfgb_bready ,
    input               s_axi_cfgb_arvalid,
    output              s_axi_cfgb_arready,
    input   [23: 0]     s_axi_cfgb_araddr ,
    output              s_axi_cfgb_rvalid ,
    input               s_axi_cfgb_rready ,
    output  [31: 0]     s_axi_cfgb_rdata  ,

    // PHY signals
    input               phy_lcl_phy_clk, 
    input               phy_rst        , 
    input               phy_lcl_log_clk, 
    input               gt_pcs_clk     , 
    input               gt_pcs_rst     , 
    input               phy_lcl_cfg_clk, 
    input               phy_lcl_cfg_rst, 

    // BUF-PHY Interface
    output              s_axis_phyt_tvalid,
    input               s_axis_phyt_tready,
    output  [63: 0]     s_axis_phyt_tdata ,
    output  [ 7: 0]     s_axis_phyt_tkeep ,
    output              s_axis_phyt_tlast ,
    output  [ 7: 0]     s_axis_phyt_tuser ,

    input               m_axis_phyr_tvalid,
    output              m_axis_phyr_tready,
    input   [63: 0]     m_axis_phyr_tdata ,
    input   [ 7: 0]     m_axis_phyr_tkeep ,
    input               m_axis_phyr_tlast ,
    input   [ 7: 0]     m_axis_phyr_tuser ,

    output              phy_lcl_phy_rewind       ,
    output  [ 5: 0]     phy_lcl_phy_rcvd_buf_stat,
    output  [ 5: 0]     phy_lcl_phy_next_fm      ,
    output  [ 5: 0]     phy_lcl_phy_last_ack     ,
    output  [ 5: 0]     phy_lcl_phy_buf_stat     ,
    output              phy_lcl_tx_flow_control  ,

    // PHY Configuration Register Interface
    input               s_axi_cfgp_awvalid,
    output              s_axi_cfgp_awready,
    input      [23: 0]  s_axi_cfgp_awaddr ,
    input               s_axi_cfgp_wvalid ,
    output              s_axi_cfgp_wready ,
    input      [31: 0]  s_axi_cfgp_wdata  ,
    input      [ 3: 0]  s_axi_cfgp_wstrb  ,
    output              s_axi_cfgp_bvalid ,
    input               s_axi_cfgp_bready ,
    input               s_axi_cfgp_arvalid,
    output              s_axi_cfgp_arready,
    input      [23: 0]  s_axi_cfgp_araddr ,
    output              s_axi_cfgp_rvalid ,
    input               s_axi_cfgp_rready ,
    output     [31: 0]  s_axi_cfgp_rdata  ,

    // PHY Control/Status signals
    input               sim_train_en          , 
    input               idle_selected         , 
    input               phy_lcl_idle2_selected, 
    input               phy_mce               , 
    input               phy_link_reset        , 
    input               force_reinit          , 
    output              phy_lcl_master_enable , 
    output              phy_lcl_maint_only    , 
    output              link_initialized      , 
    output              phy_rcvd_mce          , 
    output              phy_rcvd_link_reset   , 
    output              port_error            , 
    output              port_initialized      , 
    input               mode_1x               , 
    input               rx_lane_r             , 
    output  [23: 0]     port_timeout          , 
    output              srio_host             , 

    // High-Speed Serial IO
    output      [C_LINK_WIDTH*4*8-1:0]     gttx_data         ,
    output      [C_LINK_WIDTH*4-1:0]       gttx_charisk      ,
    input       [C_LINK_WIDTH*4*8-1:0]     gtrx_data         ,
    input       [C_LINK_WIDTH*4-1:0]       gtrx_charisk      ,
    input       [C_LINK_WIDTH*4-1:0]       gtrx_chariscomma  ,
    input       [C_LINK_WIDTH*4-1:0]       gtrx_disperr      ,
    input       [C_LINK_WIDTH*4-1:0]       gtrx_notintable   ,
    //output reg  [C_LINK_WIDTH-1:0]    gttx_inhibit      ,
    output      [C_LINK_WIDTH-1:0]    gttx_inhibit      ,
    input       [C_LINK_WIDTH-1:0]    gtrx_chanisaligned,
    input                             gtrx_reset_req    ,
    input       [C_LINK_WIDTH-1:0]    gtrx_reset_done   ,
    output                            gtrx_reset        ,
    output                            gtrx_chanbonden   ,
    output      [223: 0]              phy_debug         
    );


    wire [95: 0]      pp_debug;
    wire [63: 0]      pt_debug;
    wire [63: 0]      pr_debug;

    assign phy_debug = {pp_debug, pt_debug, pr_debug};

    wire  [7:0] empty0;
    wire  [7:0] empty1;


    srio_gen2_v4_1_16_log_top
    #(
        .TCQ                       (TCQ                       ),
        .EVAL                      (1                         ),
        .DEVICEID_WIDTH            (C_DEVICEID_WIDTH            ),
        .DEVICEID                  (C_DEVICEID                  ),
        .INIT_NREAD                (C_INIT_NREAD                ),
        .INIT_NWRITE               (C_INIT_NWRITE               ),
        .INIT_NWRITE_R             (C_INIT_NWRITE_R             ),
        .INIT_SWRITE               (C_INIT_SWRITE               ),
        .INIT_DB                   (C_INIT_DB                   ),
        .INIT_DS                   (C_INIT_DS                   ),
        .INIT_ATOMIC               (C_INIT_ATOMIC               ),
        .TARGET_NREAD              (C_TARGET_NREAD              ),
        .TARGET_NWRITE             (C_TARGET_NWRITE             ),
        .TARGET_NWRITE_R           (C_TARGET_NWRITE_R           ),
        .TARGET_SWRITE             (C_TARGET_SWRITE             ),
        .TARGET_DB                 (C_TARGET_DB                 ),
        .TARGET_DS                 (C_TARGET_DS                 ),
        .TARGET_ATOMIC             (C_TARGET_ATOMIC             ),
        .MSG_INIT_SINGLE           (C_MSG_INIT_SINGLE           ),
        .MSG_INIT_MULTI            (C_MSG_INIT_MULTI            ),
        .MSG_SINK_SINGLE           (C_MSG_SINK_SINGLE           ),
        .MSG_SINK_MULTI            (C_MSG_SINK_MULTI            ),
        .CRF_SUPPORT               (C_CRF_SUPPORT               ),
        .SINGLE_SEG_MBOX           (C_SINGLE_SEG_MBOX           ),
        .MAINT_SOURCE              (C_MAINT_SOURCE              ),
        .MAINT_CFG                 (C_MAINT_CFG                 ),
        .DEVID_CAR                 (C_DEVID_CAR                 ),
        .DEVINFO_CAR               (C_DEVINFO_CAR               ),
        .DEV_CAR_OVRD              (C_DEV_CAR_OVRD              ),
        .LCSBA_SUPPORT             (C_LCSBA_SUPPORT             ),
        .LCSBA                     (C_LCSBA                     ),
        .HW_ARCH                   (C_HW_ARCH                   ),
        .ASSY_ID                   (C_ASSY_ID                   ),
        .ASSY_VENDOR               (C_ASSY_VENDOR               ),
        .ASSY_REV                  (C_ASSY_REV                  ),
        .PHY_EF_PTR                (C_PHY_EF_PTR                ),
        .PE_BRIDGE                 (C_PE_BRIDGE                 ),
        .PE_MEMORY                 (C_PE_MEMORY                 ),
        .PE_PROC                   (C_PE_PROC                   ),
        .PE_SWITCH                 (C_PE_SWITCH                 ),
        .VC                        (0                           ),
        .PORT_IO_HELLO             (C_PORT_IO_HELLO             ),
        .PORT_MSG_HELLO            (C_PORT_MSG_HELLO            ),
        .PORT_MAINT_HELLO          (C_PORT_MAINT_HELLO          ),
        .PORT_IO_STYLE             (C_PORT_IO_STYLE             ),
        .PORT_MSG_STYLE            (C_PORT_MSG_STYLE            ),

        .PORT_MAINT_STYLE          (C_PORT_MAINT_STYLE          ),

        .PORT_USERDEF_ENABLED      (C_PORT_USERDEF_ENABLED      ),
        .PORT_ERR_RESP_ENABLED     (C_PORT_ERR_RESP_ENABLED     ),
        .TX_ENABLE_FAIRNESS        (C_TX_ENABLE_FAIRNESS        )     
    )
    srio_gen2_v4_1_16_log_top_inst(
        .log_clk                (log_lcl_log_clk ),                 // LOG interface clock
        .log_rst                (log_rst         ),                // Reset for LOG clock Domain
        .cfg_clk                (log_lcl_cfg_clk ),       // CFG Interface user clock
        .cfg_rst                (log_lcl_cfg_rst ),      // Reset for CFG clk domain
        .maintr_rst             (s_axi_maintr_rst),              // Reset for maintr interface, on LOG clk domain

        
        .UG_tx_porta_tvalid     (1'b0 ),      // Indicates Valid Input on the Request Channel
        .LA_tx_porta_tready     (     ),      // Beat has been accepted
        .UG_tx_porta_tlast      (1'b0 ),       // Indicates last beat
        .UG_tx_porta_tdata      (64'b0),       // Req Data Bus
        .UG_tx_porta_tkeep      (8'b0 ),       // Req Keep Bus
        .UG_tx_porta_tuser      (40'b0),       // Req User Bus

      
        .LA_rx_porta_tvalid     (),      // Indicates Valid Output on the Response Channel
        .UG_rx_porta_tready     (1'b0),      // Beat has been accepted
        .LA_rx_porta_tlast      (),       // Indicates last beat
        .LA_rx_porta_tdata      (),       // Resp Data Bus
        .LA_rx_porta_tkeep      (),       // Resp Keep Bus
        .LA_rx_porta_tuser      (),       // Resp User Bus


        .UG_tx_portb_tvalid     (1'b0 ),      // Indicates Valid Input on the Request Channel
        .LA_tx_portb_tready     (     ),      // Beat has been accepted
        .UG_tx_portb_tlast      (1'b0  ),       // Indicates last beat
        .UG_tx_portb_tdata      (64'b0 ),       // Req Data Bus
        .UG_tx_portb_tkeep      (8'b0  ),       // Req keep Bus
        .UG_tx_portb_tuser      (40'b0),       // Req User Bus

        
        .LA_rx_portb_tvalid     (),      // Indicates Valid Output on the Response Channel
        .UG_rx_portb_tready     (1'b0),      // Beat has been accepted
        .LA_rx_portb_tlast      (),       // Indicates last beat
        .LA_rx_portb_tdata      (),       // Resp Data Bus
        .LA_rx_portb_tkeep      (),       // Resp Keep Bus
        .LA_rx_portb_tuser      (),       // Resp User Bus

        
        .UG_tx_portc_tvalid     (s_axis_ireq_tvalid),      // Indicates Valid Input on the Request Channel
        .LA_tx_portc_tready     (s_axis_ireq_tready),      // Beat has been accepted
        .UG_tx_portc_tlast      (s_axis_ireq_tlast),       // Indicates last beat
        .UG_tx_portc_tdata      (s_axis_ireq_tdata),       // Req Data Bus
        .UG_tx_portc_tkeep      (s_axis_ireq_tkeep),       // Req Keep Bus
        .UG_tx_portc_tuser      ({8'b0, s_axis_ireq_tuser}),       // Req User Bus

        
        .LA_rx_portc_tvalid     (m_axis_iresp_tvalid),      // Indicates Valid Output on the Response Channel
        .UG_rx_portc_tready     (m_axis_iresp_tready),      // Beat has been accepted
        .LA_rx_portc_tlast      (m_axis_iresp_tlast),       // Indicates last beat
        .LA_rx_portc_tdata      (m_axis_iresp_tdata),       // Resp Data Bus
        .LA_rx_portc_tkeep      (m_axis_iresp_tkeep),       // Resp Keep Bus
        .LA_rx_portc_tuser      ({m_axis_iresp_tuser,empty0}),       // Resp User Bus

        
        .UG_tx_portd_tvalid     (s_axis_tresp_tvalid),      // Indicates Valid Input on the Request Channel
        .LA_tx_portd_tready     (s_axis_tresp_tready),      // Beat has been accepted
        .UG_tx_portd_tlast      (s_axis_tresp_tlast),       // Indicates last beat
        .UG_tx_portd_tdata      (s_axis_tresp_tdata),       // Req Data Bus
        .UG_tx_portd_tkeep      (s_axis_tresp_tkeep),       // Req Keep Bus
        .UG_tx_portd_tuser      ({8'b0, s_axis_tresp_tuser}),       // Req User Bus

        
        .LA_rx_portd_tvalid     (m_axis_treq_tvalid),      // Indicates Valid Output on the Response Channel
        .UG_rx_portd_tready     (m_axis_treq_tready),      // Beat has been accepted
        .LA_rx_portd_tlast      (m_axis_treq_tlast),       // Indicates last beat
        .LA_rx_portd_tdata      (m_axis_treq_tdata),       // Resp Data Bus
        .LA_rx_portd_tkeep      (m_axis_treq_tkeep),       // Resp Keep Bus
        .LA_rx_portd_tuser      ({m_axis_treq_tuser,empty1}),       // Resp User Bus

        
        .UG_tx_porte_tvalid     (1'b0 ),      // Indicates Valid Input on the Request Channel
        .LA_tx_porte_tready     (     ),      // Beat has been accepted
        .UG_tx_porte_tlast      (1'b0 ),       // Indicates last beat
        .UG_tx_porte_tdata      (64'b0),       // Req Data Bus
        .UG_tx_porte_tkeep      (8'b0 ),       // Req Keep Bus
        .UG_tx_porte_tuser      (40'b0),       // Req User Bus

        
        .LA_rx_porte_tvalid     ( ),      // Indicates Valid Output on the Response Channel
        .UG_rx_porte_tready     (1'b0),      // Beat has been accepted
        .LA_rx_porte_tlast      ( ),       // Indicates last beat
        .LA_rx_porte_tdata      ( ),       // Resp Data Bus
        .LA_rx_porte_tkeep      ( ),       // Resp Keep Bus
        .LA_rx_porte_tuser      ( ),       // Resp User Bus

        
        .UG_tx_portf_tvalid     (1'b0 ),      // Indicates Valid Input on the Request Channel
        .LA_tx_portf_tready     (     ),      // Beat has been accepted
        .UG_tx_portf_tlast      (1'b0 ),       // Indicates last beat
        .UG_tx_portf_tdata      (64'b0),       // Req Data Bus
        .UG_tx_portf_tkeep      (8'b0 ),       // Req Keep Bus
        .UG_tx_portf_tuser      (40'b0),       // Req User Bus

        
        .LA_rx_portf_tvalid     ( ),      // Indicates Valid Output on the Response Channel
        .UG_rx_portf_tready     (1'b0),      // Beat has been accepted
        .LA_rx_portf_tlast      ( ),       // Indicates last beat
        .LA_rx_portf_tdata      ( ),       // Resp Data Bus
        .LA_rx_portf_tkeep      ( ),       // Resp Keep Bus
        .LA_rx_portf_tuser      ( ),       // Resp User Bus

        
        .UG_tx_portg_tvalid     (1'b0 ),      // Indicates Valid Input on the Request Channel
        .LA_tx_portg_tready     (     ),      // Beat has been accepted
        .UG_tx_portg_tlast      (1'b0 ),       // Indicates last beat
        .UG_tx_portg_tdata      (64'b0),       // Req Data Bus
        .UG_tx_portg_tkeep      (8'b0 ),       // Req Keep Bus
        .UG_tx_portg_tuser      (40'b0),       // Req User Bus

        
        .LA_rx_portg_tvalid     ( ),      // Indicates Valid Output on the Response Channel
        .UG_rx_portg_tready     (1'b0),      // Beat has been accepted
        .LA_rx_portg_tlast      ( ),       // Indicates last beat
        .LA_rx_portg_tdata      ( ),       // Resp Data Bus
        .LA_rx_portg_tkeep      ( ),       // Resp keep Bus
        .LA_rx_portg_tuser      ( ),       // Resp User Bus

        
        .UG_tx_porth_tvalid     (1'b0 ),      // Indicates Valid Input on the Request Channel
        .LA_tx_porth_tready     (     ),      // Beat has been accepted
        .UG_tx_porth_tlast      (1'b0 ),       // Indicates last beat
        .UG_tx_porth_tdata      (64'b0),       // Req Data Bus
        .UG_tx_porth_tkeep      (8'b0 ),       // Req Keep Bus
        .UG_tx_porth_tuser      (40'b0),       // Req User Bus

        
        .LA_rx_porth_tvalid     ( ),      // Indicates Valid Output on the Response Channel
        .UG_rx_porth_tready     (1'b0),      // Beat has been accepted
        .LA_rx_porth_tlast      ( ),       // Indicates last beat
        .LA_rx_porth_tdata      ( ),       // Resp Data Bus
        .LA_rx_porth_tkeep      ( ),       // Resp Keep Bus
        .LA_rx_porth_tuser      ( ),       // Resp User Bus

        
        . UG_maintr_awvalid         (s_axi_maintr_awvalid),      // Write Command Valid
        . LR_maintr_awready         (s_axi_maintr_awready),      // Write Port Ready
        . UG_maintr_awaddr          (s_axi_maintr_awaddr),       // Write Address
        . UG_maintr_wvalid          (s_axi_maintr_wvalid),       // Write Data Valid
        . LR_maintr_wready          (s_axi_maintr_wready),       // Write Port Ready
        . UG_maintr_wdata           (s_axi_maintr_wdata),        // Write Data
        . LR_maintr_bvalid          (s_axi_maintr_bvalid),       // Write Response Valid
        . UG_maintr_bready          (s_axi_maintr_bready),       // Write Response Fabric Ready
        . LR_maintr_bresp           (s_axi_maintr_bresp),        // Write Response

        . UG_maintr_arvalid         (s_axi_maintr_arvalid),      // Read Command Valid
        . LR_maintr_arready         (s_axi_maintr_arready),      // Read Port Ready
        . UG_maintr_araddr          (s_axi_maintr_araddr),       // Read Address
        . LR_maintr_rvalid          (s_axi_maintr_rvalid),       // Read Response Valid
        . UG_maintr_rready          (s_axi_maintr_rready),       // Read Response Fabric Ready
        . LR_maintr_rdata           (s_axi_maintr_rdata),        // Read Data
        . LR_maintr_rresp           (s_axi_maintr_rresp),        // Read Response


        
        .LR_cfgr_awvalid            (m_axi_cfgr_awvalid),// Write Command Valid
        .CF_cfgr_awready            (m_axi_cfgr_awready),// Write Port Ready
        .LR_cfgr_awaddr             (m_axi_cfgr_awaddr),// Write Address
        .LR_cfgr_wvalid             (m_axi_cfgr_wvalid),// Write Data Valid
        .CF_cfgr_wready             (m_axi_cfgr_wready),// Write Port Ready
        .LR_cfgr_wdata              (m_axi_cfgr_wdata ),// Write Data
        .LR_cfgr_wstrb              (m_axi_cfgr_wstrb ),// Write Data byte enables
        .LR_cfgr_awprot             (m_axi_cfgr_awprot),// Write Protection (Tied to 0)

        
        .CF_cfgr_bvalid             (m_axi_cfgr_bvalid),// Write Response Valid
        .LR_cfgr_bready             (m_axi_cfgr_bready),// Write Response Fabric Ready
        .CF_cfgr_bresp              (m_axi_cfgr_bresp ),// Write Response

        
        .LR_cfgr_arvalid            (m_axi_cfgr_arvalid),// Read Command Valid
        .CF_cfgr_arready            (m_axi_cfgr_arready),// Read Port Ready
        .LR_cfgr_araddr             (m_axi_cfgr_araddr ),// Read Address
        .LR_cfgr_arprot             (m_axi_cfgr_arprot ),// Read Protection (Tied to 0)

        
        .CF_cfgr_rvalid             (m_axi_cfgr_rvalid),// Read Response Valid
        .LR_cfgr_rready             (m_axi_cfgr_rready),// Read Response Fabric Ready
        .CF_cfgr_rdata              (m_axi_cfgr_rdata ),// Read Data
        .CF_cfgr_rresp              (m_axi_cfgr_rresp ),// Read Response


        .LD_buft_tvalid             (m_axis_buft_tvalid),          // Valid packet beat
        .BT_buft_tready             (m_axis_buft_tready),          // Packet beat accepted
        .LD_buft_tdata              (m_axis_buft_tdata ),           // Packet data
        .LD_buft_tkeep              (m_axis_buft_tkeep),           // Valid bytes in this beat, only valid on last
        .LD_buft_tlast              (m_axis_buft_tlast),           // Last beat
        .LD_buft_tuser              (m_axis_buft_tuser),           // {4'h00, Response, VC, CRF, 1'b0}

  // Sideband
        .BT_response_only           (log_lcl_response_only),        // Disable requests

        
        .BR_bufr_tvalid             (s_axis_bufr_tvalid),          // Valid packet beat
        .LE_bufr_tready             (s_axis_bufr_tready),          // Packet beat accepted
        .BR_bufr_tdata              (s_axis_bufr_tdata ),           // Packet data
        .BR_bufr_tkeep              (s_axis_bufr_tkeep ),           // Valid bytes in this beat, only valid on last
        .BR_bufr_tlast              (s_axis_bufr_tlast ),           // Last beat
        .BR_bufr_tuser              (s_axis_bufr_tuser ),           // {5'h00, VC, CRF, 1'b0}

        
        .CF_cfgl_awvalid            (s_axi_cfgl_awvalid),// Write Command Valid
        .LC_cfgl_awready            (s_axi_cfgl_awready),// Write Port Ready
        .CF_cfgl_awaddr             (s_axi_cfgl_awaddr ),// Write Address
        .CF_cfgl_wvalid             (s_axi_cfgl_wvalid ),// Write Data Valid
        .LC_cfgl_wready             (s_axi_cfgl_wready ),// Write Port Ready
        .CF_cfgl_wdata              (s_axi_cfgl_wdata  ),// Write Data
        .CF_cfgl_wstrb              (s_axi_cfgl_wstrb  ),// Write Data byte enables
        .LC_cfgl_bvalid             (s_axi_cfgl_bvalid ),// Write Response Valid
        .CF_cfgl_bready             (s_axi_cfgl_bready ),// Write Response Fabric Ready
        .CF_cfgl_arvalid            (s_axi_cfgl_arvalid),// Read Command Valid
        .LC_cfgl_arready            (s_axi_cfgl_arready),// Read Port Ready
        .CF_cfgl_araddr             (s_axi_cfgl_araddr ),// Read Address
        .LC_cfgl_rvalid             (s_axi_cfgl_rvalid ),// Read Response Valid
        .CF_cfgl_rready             (s_axi_cfgl_rready ),// Read Response Fabric Ready
        .LC_cfgl_rdata              (s_axi_cfgl_rdata  ),// Read Data

  //Sideband
        .LC_deviceid                (deviceid),             // Current DeviceID from the DeviceID register
        .PC_maint_only              (log_lcl_maint_only),// LOG can only send maint transactions
        .LA_port_decode_error       (port_decode_error)// No valid output port for the RX transaction

    );




    srio_gen2_v4_1_16_buf_top
    #(
        .TCQ                          (TCQ), 
        .HW_ARCH                      (C_HW_ARCH    ), 
        .REQ_REORDER                  (C_REQ_REORDER), 
        .TX_DEPTH                     (C_TX_DEPTH   ), 
        .RX_DEPTH                     (C_RX_DEPTH   ), 
        .RX_FC_ONLY                   (C_RX_FC_ONLY ), 
        .UNIFIED_CLK                  (C_UNIFIED_CLK), 
        .MODE_XG                      (C_MODE_XG    ), 
        .WM0                          (C_WM0        ), 
        .WM1                          (C_WM1        ), 
        .WM2                          (C_WM2        ), 
        .IDLE2                        (C_IDLE2      ), 
        .EVAL                         (1            ) 
    )
    srio_gen2_v4_1_16_buf_top_inst(
  // {{{ port declarations
  //SYSTEM Interface
        .phy_clk                    (buf_lcl_phy_clk),
        .log_clk                    (buf_lcl_log_clk),
        .cfg_clk                    (buf_lcl_cfg_clk),
        .buf_rst                    (buf_rst),
        .cfg_rst                    (buf_lcl_cfg_rst),       
        
        .LD_buft_tvalid             (s_axis_buft_tvalid ),//Valid Packet Beat
        .BT_buft_tready             (s_axis_buft_tready),       //Packet Beat Accepted
        .LD_buft_tdata              (s_axis_buft_tdata  ),        //Packet Data
        .LD_buft_tkeep              (s_axis_buft_tkeep ),        //Valid Bytes in this beat, only valid on last
        .LD_buft_tlast              (s_axis_buft_tlast ),        //Last Beat
        .LD_buft_tuser              (s_axis_buft_tuser),        //{4'h00, Response, VC, CRF, 1'b0} AXI Compliance Pad
        .BT_response_only           (buf_lcl_response_only),//Buffer only has room for Resp Packets      .
        
        .BT_phyt_tvalid             (s_axis_phyt_tvalid),//Valid Data Indicator
        .PT_phyt_tready             (s_axis_phyt_tready),       //Destination Ready
        .BT_phyt_tdata              (s_axis_phyt_tdata ),        //Packet Data
        .BT_phyt_tkeep              (s_axis_phyt_tkeep ),        //Byte Enable for data, only valid on last
        .BT_phyt_tlast              (s_axis_phyt_tlast ),        //Last Beat of Packet Data
        .BT_phyt_tuser              (s_axis_phyt_tuser),        //{1'b0, SKIP_CRC, 2'b00, VC[1:0], CRF, SRC_DSC}
        .BT_tx_flow_control         (buf_lcl_tx_flow_control),              //TX Flow Control Mode
        .PC_master_enable           (buf_lcl_master_enable),                 //Enable Request Transactions
        .PP_idle2_selected          (buf_lcl_idle2_selected),                 //OPLM has trained to use IDLE2 sequence
        .PR_phy_rcvd_buf_stat       (buf_lcl_phy_rcvd_buf_stat),                 //Buffer Status received from link partner
        .PR_phy_last_ack            (buf_lcl_phy_last_ack),      //Last PA Received by the PHY
        .PT_phy_next_fm             (buf_lcl_phy_next_fm),       //Next Packet's Ack ID
        .PT_phy_rewind              (buf_lcl_phy_rewind),        //An Errror or Retry Condition       .
        
        .BR_bufr_tvalid             (m_axis_bufr_tvalid),       //Valid Packet Beat
        .LE_bufr_tready             (m_axis_bufr_tready),       //Packet Beat Accepted
        .BR_bufr_tdata              (m_axis_bufr_tdata),        //Packet Data
        .BR_bufr_tkeep              (m_axis_bufr_tkeep),        //Valid bytes in this beat, only valid on last
        .BR_bufr_tlast              (m_axis_bufr_tlast),        //Last Beat
        .BR_bufr_tuser              (m_axis_bufr_tuser),        //{5'h00, VC, CRF, 1'b0}     .
        
        .PR_phyr_tvalid             (m_axis_phyr_tvalid),       //Valid Data Indicator
        .BR_phyr_tready             (m_axis_phyr_tready),       //Destination Ready
        .PR_phyr_tdata              (m_axis_phyr_tdata),        //Packet Data
        .PR_phyr_tkeep              (m_axis_phyr_tkeep),        //Byte Enable for Data, only valid on last
        .PR_phyr_tlast              (m_axis_phyr_tlast),        //Last DW of Packet Data
        .PR_phyr_tuser              (m_axis_phyr_tuser),        //{5'h00, VC, CRF, src_dsc} AXI Compliance Pad
        .BR_phy_buf_stat            (buf_lcl_phy_buf_stat),      //Buffer Status from the RX Buffer       .
        
        .CF_cfgb_awvalid            (s_axi_cfgb_awvalid),       //Write Command Valid
        .BC_cfgb_awready            (s_axi_cfgb_awready),       //Write Port Ready
        .CF_cfgb_awaddr             (s_axi_cfgb_awaddr ),       //Write Address
        .CF_cfgb_wvalid             (s_axi_cfgb_wvalid ),       //Write Data Valid
        .BC_cfgb_wready             (s_axi_cfgb_wready ),       //Write Port Ready
        .CF_cfgb_wdata              (s_axi_cfgb_wdata  ),       //Write Data
        .CF_cfgb_wstrb              (s_axi_cfgb_wstrb  ),       //Write Data Byte Enables
        .BC_cfgb_bvalid             (s_axi_cfgb_bvalid ),       //Write Response Valid
        .CF_cfgb_bready             (s_axi_cfgb_bready ),       //Write Response Fabric Ready
        .CF_cfgb_arvalid            (s_axi_cfgb_arvalid),       //Read Command Valid
        .BC_cfgb_arready            (s_axi_cfgb_arready),       //Read port Ready
        .CF_cfgb_araddr             (s_axi_cfgb_araddr ),       //Read Address
        .BC_cfgb_rvalid             (s_axi_cfgb_rvalid ),       //Read Response Valid
        .CF_cfgb_rready             (s_axi_cfgb_rready ),       //Read response Fabric Ready
        .BC_cfgb_rdata              (s_axi_cfgb_rdata  )        //Read Data
  // }}} end ports

    );



    srio_gen2_v4_1_16_phy_top
    #(
        .TCQ                            (TCQ),
        .SIM_TRAIN                      (C_SIM_TRAIN    ),
        .LINK_WIDTH                     (C_LINK_WIDTH   ),
        .MODE_XG                        (C_MODE_XG      ),
        .IDLE1                          (C_IDLE1        ),
        .IDLE2                          (C_IDLE2        ),
        .SCRAM                          (C_SCRAM        ),
        .VC                             (0              ),
        .RETRY                          (C_RETRY        ),
        .LINK_REQUESTS                  (C_LINK_REQUESTS),
        .TARGET_DS                      (C_TARGET_DS    ),
        .PHY_EF_PTR                     (C_PHY_EF_PTR   ),
        .LANE_EF_PTR                    (C_LANE_EF_PTR  ),
        .VC_EF_PTR                      (C_VC_EF_PTR    ),
        .LINK_TIMEOUT                   (C_LINK_TIMEOUT ),
        .PORT_TIMEOUT                   (C_PORT_TIMEOUT ),
        .IS_HOST                        (C_IS_HOST      ),
        .MASTER_EN                      (C_MASTER_EN    ),
        .DISCOVERED                     (C_DISCOVERED   ),
        .DEBUG                          (c_debug        ),
        .VC1_CT                         (1              ),
        .USER_EF_PTR                    (C_USER_EF_PTR  ),
        .SW_CSR                         (C_SW_CSR       ),
        .EVAL                           (1              ),
        .SWITCH_MODE                    (0              ),
        .GT_BYTES                       (GT_BYTES       )
    )
    srio_gen2_v4_1_16_phy_top(
        .phy_clk                        (phy_lcl_phy_clk),                    // PHY interface clock
        .phy_rst                        (phy_rst),                // Reset for PHY clock Domain
        .log_clk                        (phy_lcl_log_clk)   ,                    // LOG interface clock
        .log_rst                        (log_rst),                    // Reset for LOG clock Domain
        .gt_pcs_clk                     (gt_pcs_clk),                 // GT Interface user clock
        .gt_pcs_rst                     (gt_pcs_rst),                 // Reset for GT clk domain
        .cfg_clk                        (phy_lcl_cfg_clk),                        // CFG Interface user clock
        .cfg_rst                        (phy_lcl_cfg_rst),                        // Reset for CFG clk domain
        .sim_train_en                   (sim_train_en),            // Enable SIM_TRAIN mode for imp.
        .BT_phyt_tvalid                 (s_axis_phyt_tvalid),            // Valid data indicator
        .PT_phyt_tready                 (s_axis_phyt_tready),             // Destination Ready
        .BT_phyt_tdata                  (s_axis_phyt_tdata),              // Packet for transfer
        .BT_phyt_tkeep                  (s_axis_phyt_tkeep),              // Byte Enable for transferred packet
        .BT_phyt_tlast                  (s_axis_phyt_tlast),              // Last DW of incoming packet
        .BT_phyt_tuser                  (s_axis_phyt_tuser),              // {1'b0, SKIP_CRC, 2'b00, VC, CRF, SRC_DSC}
        .PT_phy_next_fm                 (phy_lcl_phy_next_fm),             // Next packet's ackID
        .PR_phy_last_ack                (phy_lcl_phy_last_ack),            // Last PA received by the PHY core
        .BR_phy_buf_stat                (phy_lcl_phy_buf_stat),            // Buffer status from the RX buffer to be transmitted
        .UG_phy_mce                     (phy_mce),                 // Send MCE control symbol
        .UG_phy_link_reset              (phy_link_reset),          // Send link reset control symbols
        .PR_link_initialized            (link_initialized),        // Indicates we are ready to transmit data
        .PR_phyr_tvalid                 (m_axis_phyr_tvalid),             // Valid data indicator
        .BR_phyr_tready                 (m_axis_phyr_tready),             // Destination Ready
        .PR_phyr_tdata                  (m_axis_phyr_tdata),              // Packet for transfer
        .PR_phyr_tkeep                  (m_axis_phyr_tkeep),              // Byte Enable for transferred packet
        .PR_phyr_tlast                  (m_axis_phyr_tlast),              // Last DW of incoming packet
        .PR_phyr_tuser                  (m_axis_phyr_tuser),              // {5'h00, VC, CRF, src_dsc}
        .PT_phy_rewind                  (phy_lcl_phy_rewind),              // An error or retry condition is in progress
        .PR_phy_rcvd_buf_stat           (phy_lcl_phy_rcvd_buf_stat),       // Buffer status received from the link partner
        .PR_phy_rcvd_mce                (phy_rcvd_mce),            // MCE control symbol received
        .PR_phy_rcvd_link_reset         (phy_rcvd_link_reset),        // Received 4 consecutive link reset control symbols
        .PR_port_error                  (port_error),             // Indicator that OLLM RX is in Port Error State
        .PP_port_initialized            (port_initialized),         // Indicates port is initialized
        .PP_mode_1x                     (mode_1x),                    // Indicates the link trained down to 1x
        .PP_idle2_selected              (phy_lcl_idle2_selected),// Indicates the link is operating in IDLE2 mode
        .PP_idle_selected               (idle_selected),              // Indicates the IDLE Sequence is selected
        .UG_force_reinit                (force_reinit),               // Force reinitialization
        .PC_port_timeout                (port_timeout),               // Timeout value user can use to detect lost packet
        .PC_srio_host                   (srio_host),                  // Endpoint is the system host
        .PC_master_enable               (phy_lcl_master_enable),      // Enable Request transactions
        .BT_tx_flow_control             (phy_lcl_tx_flow_control),    // Port negotiated to tx flow control
        .PC_maint_only                  (phy_lcl_maint_only),         // LOG can only send maintenance packets
        .CF_cfgp_awvalid                (s_axi_cfgp_awvalid),         // Write Command Valid
        .PC_cfgp_awready                (s_axi_cfgp_awready),         // Write Port Ready
        .CF_cfgp_awaddr                 (s_axi_cfgp_awaddr ),         // Write Address
        .CF_cfgp_wvalid                 (s_axi_cfgp_wvalid ),         // Write Data Valid
        .PC_cfgp_wready                 (s_axi_cfgp_wready ),         // Write Port Ready
        .CF_cfgp_wdata                  (s_axi_cfgp_wdata  ),         // Write Data
        .CF_cfgp_wstrb                  (s_axi_cfgp_wstrb  ),         // Write Data byte enables
        .PC_cfgp_bvalid                 (s_axi_cfgp_bvalid ),         // Write Response Valid
        .CF_cfgp_bready                 (s_axi_cfgp_bready ),         // Write Response Fabric Ready
        .CF_cfgp_arvalid                (s_axi_cfgp_arvalid),         // Read Command Valid
        .PC_cfgp_arready                (s_axi_cfgp_arready),         // Read Port Ready
        .CF_cfgp_araddr                 (s_axi_cfgp_araddr ),         // Read Address
        .PC_cfgp_rvalid                 (s_axi_cfgp_rvalid ),         // Read Response Valid
        .CF_cfgp_rready                 (s_axi_cfgp_rready ),         // Read Response Fabric Ready
        .PC_cfgp_rdata                  (s_axi_cfgp_rdata  ),         // Read Data
        .PP_gttx_data                   (gttx_data         ),         // Transmit Data to the GTs
        .PP_gttx_charisk                (gttx_charisk      ),         // Transmit char is K to the GTs
        .GT_gtrx_data                   (gtrx_data         ),         // Receive Data from the GTs
        .GT_gtrx_charisk                (gtrx_charisk      ),         // Receive Data is K from the GTs
        .GT_gtrx_chariscomma            (gtrx_chariscomma  ),         // Receive Data is comma
        .GT_gtrx_disperr                (gtrx_disperr      ),         // Receive Data contains disperity Error
        .GT_gtrx_notintable             (gtrx_notintable   ),         // Receive Data contains a not in table Error
        .PP_gttx_inhibit                (gttx_inhibit      ),         // TX Inhibit to the GTs
        .GT_gtrx_chanisaligned          (gtrx_chanisaligned),         // RX chanel is aligned across all GTs
        .GT_gtrx_reset_req              (gtrx_reset_req    ),         // RX Buffer Error from the GTs
        .GT_gtrx_reset_done             (gtrx_reset_done   ),         // RX Buffer Reset Done
        .PP_gtrx_reset                  (gtrx_reset        ),         // Reset the GTs RX Buffer
        .PP_rx_lane_r                   (rx_lane_r         ),         // Receiving Data on lane R
        .PP_gtrx_chanbonden             (gtrx_chanbonden   ),         // Enable chanel bonding
        .PP_debug                       (pp_debug          ),         // Debugs from OPLM
        .PT_debug                       (pt_debug          ),         // Debugs from OLLM TX
        .PR_debug                       (pr_debug          )             
    );
endmodule
