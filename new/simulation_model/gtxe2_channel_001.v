`timescale 1ps / 1ps

module GTXE2_CHANNEL_WRAP #(  // Verilog-2001
  parameter ALIGN_COMMA_DOUBLE = "FALSE",
  parameter ALIGN_COMMA_ENABLE = "0001111111",
  parameter integer ALIGN_COMMA_WORD = 1,
  parameter ALIGN_MCOMMA_DET = "TRUE",
  parameter ALIGN_MCOMMA_VALUE = "1010000011",
  parameter ALIGN_PCOMMA_DET = "TRUE",
  parameter ALIGN_PCOMMA_VALUE = "0101111100",
  parameter CBCC_DATA_SOURCE_SEL = "DECODED",
  parameter CHAN_BOND_KEEP_ALIGN = "FALSE",
  parameter integer CHAN_BOND_MAX_SKEW = 7,
  parameter CHAN_BOND_SEQ_1_1 = "0101111100",
  parameter CHAN_BOND_SEQ_1_2 = "0000000000",
  parameter CHAN_BOND_SEQ_1_3 = "0000000000",
  parameter CHAN_BOND_SEQ_1_4 = "0000000000",
  parameter CHAN_BOND_SEQ_1_ENABLE = "1111",
  parameter CHAN_BOND_SEQ_2_1 = "0100000000",
  parameter CHAN_BOND_SEQ_2_2 = "0100000000",
  parameter CHAN_BOND_SEQ_2_3 = "0100000000",
  parameter CHAN_BOND_SEQ_2_4 = "0100000000",
  parameter CHAN_BOND_SEQ_2_ENABLE = "1111",
  parameter CHAN_BOND_SEQ_2_USE = "FALSE",
  parameter integer CHAN_BOND_SEQ_LEN = 1,
  parameter CLK_CORRECT_USE = "TRUE",
  parameter CLK_COR_KEEP_IDLE = "FALSE",
  parameter integer CLK_COR_MAX_LAT = 20,
  parameter integer CLK_COR_MIN_LAT = 18,
  parameter CLK_COR_PRECEDENCE = "TRUE",
  parameter integer CLK_COR_REPEAT_WAIT = 0,
  parameter CLK_COR_SEQ_1_1 = "0100011100",
  parameter CLK_COR_SEQ_1_2 = "0000000000",
  parameter CLK_COR_SEQ_1_3 = "0000000000",
  parameter CLK_COR_SEQ_1_4 = "0000000000",
  parameter CLK_COR_SEQ_1_ENABLE = "1111",
  parameter CLK_COR_SEQ_2_1 = "0100000000",
  parameter CLK_COR_SEQ_2_2 = "0100000000",
  parameter CLK_COR_SEQ_2_3 = "0100000000",
  parameter CLK_COR_SEQ_2_4 = "0100000000",
  parameter CLK_COR_SEQ_2_ENABLE = "1111",
  parameter CLK_COR_SEQ_2_USE = "FALSE",
  parameter integer CLK_COR_SEQ_LEN = 1,
  parameter CPLL_CFG = "B007D8",
  parameter integer CPLL_FBDIV = 4,
  parameter integer CPLL_FBDIV_45 = 5,
  parameter CPLL_INIT_CFG = "00001E",
  parameter CPLL_LOCK_CFG = "01E8",
  parameter integer CPLL_REFCLK_DIV = 1,
  parameter DEC_MCOMMA_DETECT = "TRUE",
  parameter DEC_PCOMMA_DETECT = "TRUE",
  parameter DEC_VALID_COMMA_ONLY = "TRUE",
  parameter DMONITOR_CFG = "000A00",
  parameter ES_CONTROL = "000000",
  parameter ES_ERRDET_EN = "FALSE",
  parameter ES_EYE_SCAN_EN = "FALSE",
  parameter ES_HORZ_OFFSET = "000",
  parameter ES_PMA_CFG = "0000000000",
  parameter ES_PRESCALE = "00000",
  parameter ES_QUALIFIER = "00000000000000000000",
  parameter ES_QUAL_MASK = "00000000000000000000",
  parameter ES_SDATA_MASK = "00000000000000000000",
  parameter ES_VERT_OFFSET = "000000000",
  parameter FTS_DESKEW_SEQ_ENABLE = "1111",
  parameter FTS_LANE_DESKEW_CFG = "1111",
  parameter FTS_LANE_DESKEW_EN = "FALSE",
  parameter GEARBOX_MODE = "000",
  parameter OUTREFCLK_SEL_INV = "11",
  parameter PCS_PCIE_EN = "FALSE",
  parameter PCS_RSVD_ATTR = "000000000000",
  parameter PD_TRANS_TIME_FROM_P2 = "03C",
  parameter PD_TRANS_TIME_NONE_P2 = "19",
  parameter PD_TRANS_TIME_TO_P2 = "64",
  parameter PMA_RSV = "00000000",
  parameter PMA_RSV2 = "2050",
  parameter PMA_RSV3 = "00",
  parameter PMA_RSV4 = "00000000",
  parameter RXBUFRESET_TIME = "00001",
  parameter RXBUF_ADDR_MODE = "FULL",
  parameter RXBUF_EIDLE_HI_CNT = "1000",
  parameter RXBUF_EIDLE_LO_CNT = "0000",
  parameter RXBUF_EN = "TRUE",
  parameter RXBUF_RESET_ON_CB_CHANGE = "TRUE",
  parameter RXBUF_RESET_ON_COMMAALIGN = "FALSE",
  parameter RXBUF_RESET_ON_EIDLE = "FALSE",
  parameter RXBUF_RESET_ON_RATE_CHANGE = "TRUE",
  parameter integer RXBUF_THRESH_OVFLW = 61,
  parameter RXBUF_THRESH_OVRD = "FALSE",
  parameter integer RXBUF_THRESH_UNDFLW = 4,
  parameter RXCDRFREQRESET_TIME = "00001",
  parameter RXCDRPHRESET_TIME = "00001",
  parameter RXCDR_CFG = "0B000023FF20400020",
  parameter RXCDR_FR_RESET_ON_EIDLE = "0",
  parameter RXCDR_HOLD_DURING_EIDLE = "0",
  parameter RXCDR_LOCK_CFG = "010101",
  parameter RXCDR_PH_RESET_ON_EIDLE = "0",
  parameter RXDFELPMRESET_TIME = "0001111",
  parameter RXDLY_CFG = "001F",
  parameter RXDLY_LCFG = "030",
  parameter RXDLY_TAP_CFG = "0000",
  parameter RXGEARBOX_EN = "FALSE",
  parameter RXISCANRESET_TIME = "00001",
  parameter RXLPM_HF_CFG = "00000011110000",
  parameter RXLPM_LF_CFG = "00000011110000",
  parameter RXOOB_CFG = "0000110",
  parameter integer RXOUT_DIV = 2,
  parameter RXPCSRESET_TIME = "00001",
  parameter RXPHDLY_CFG = "084020",
  parameter RXPH_CFG = "000000",
  parameter RXPH_MONITOR_SEL = "00000",
  parameter RXPMARESET_TIME = "00011",
  parameter RXPRBS_ERR_LOOPBACK = "0",
  parameter integer RXSLIDE_AUTO_WAIT = 7,
  parameter RXSLIDE_MODE = "OFF",
  parameter RX_BIAS_CFG = "000000000000",
  parameter RX_BUFFER_CFG = "000000",
  parameter integer RX_CLK25_DIV = 7,
  parameter RX_CLKMUX_PD = "1",
  parameter RX_CM_SEL = "11",
  parameter RX_CM_TRIM = "100",
  parameter integer RX_DATA_WIDTH = 20,
  parameter RX_DDI_SEL = "000000",
  parameter RX_DEBUG_CFG = "000000000000",
  parameter RX_DEFER_RESET_BUF_EN = "TRUE",
  parameter RX_DFE_GAIN_CFG = "180E0F",
  parameter RX_DFE_H2_CFG = "000111100000",
  parameter RX_DFE_H3_CFG = "000111100000",
  parameter RX_DFE_H4_CFG = "00011110000",
  parameter RX_DFE_H5_CFG = "00011110000",
  parameter RX_DFE_KL_CFG = "0001111110000",
  parameter RX_DFE_KL_CFG2 = "3008E56A",
  parameter RX_DFE_LPM_CFG = "0904",
  parameter RX_DFE_LPM_HOLD_DURING_EIDLE = "0",
  parameter RX_DFE_UT_CFG = "00111111000000000",
  parameter RX_DFE_VP_CFG = "00011111100000000",
  parameter RX_DFE_XYD_CFG = "0000000010000",
  parameter RX_DISPERR_SEQ_MATCH = "TRUE",
  parameter integer RX_INT_DATAWIDTH = 0,
  parameter RX_OS_CFG = "0001111110000",
  parameter integer RX_SIG_VALID_DLY = 10,
  parameter RX_XCLK_SEL = "RXREC",
  parameter integer SAS_MAX_COM = 64,
  parameter integer SAS_MIN_COM = 36,
  parameter SATA_BURST_SEQ_LEN = "1111",
  parameter SATA_BURST_VAL = "100",
  parameter SATA_CPLL_CFG = "VCO_3000MHZ",
  parameter SATA_EIDLE_VAL = "100",
  parameter integer SATA_MAX_BURST = 8,
  parameter integer SATA_MAX_INIT = 21,
  parameter integer SATA_MAX_WAKE = 7,
  parameter integer SATA_MIN_BURST = 4,
  parameter integer SATA_MIN_INIT = 12,
  parameter integer SATA_MIN_WAKE = 4,
  parameter SHOW_REALIGN_COMMA = "TRUE",
  parameter SIM_CPLLREFCLK_SEL = "001",
  parameter SIM_RECEIVER_DETECT_PASS = "TRUE",
  parameter SIM_RESET_SPEEDUP = "TRUE",
  parameter SIM_TX_EIDLE_DRIVE_LEVEL = "X",
  parameter SIM_VERSION = "4.0",
  parameter TERM_RCAL_CFG = "10000",
  parameter TERM_RCAL_OVRD = "0",
  parameter TRANS_TIME_RATE = "0E",
  parameter TST_RSV = "00000000",
  parameter TXBUF_EN = "TRUE",
  parameter TXBUF_RESET_ON_RATE_CHANGE = "FALSE",
  parameter TXDLY_CFG = "001F",
  parameter TXDLY_LCFG = "030",
  parameter TXDLY_TAP_CFG = "0000",
  parameter TXGEARBOX_EN = "FALSE",
  parameter integer TXOUT_DIV = 2,
  parameter TXPCSRESET_TIME = "00001",
  parameter TXPHDLY_CFG = "084020",
  parameter TXPH_CFG = "0780",
  parameter TXPH_MONITOR_SEL = "00000",
  parameter TXPMARESET_TIME = "00001",
  parameter integer TX_CLK25_DIV = 7,
  parameter TX_CLKMUX_PD = "1",
  parameter integer TX_DATA_WIDTH = 20,
  parameter TX_DEEMPH0 = "00000",
  parameter TX_DEEMPH1 = "00000",
  parameter TX_DRIVE_MODE = "DIRECT",
  parameter TX_EIDLE_ASSERT_DELAY = "110",
  parameter TX_EIDLE_DEASSERT_DELAY = "100",
  parameter integer TX_INT_DATAWIDTH = 0,
  parameter TX_LOOPBACK_DRIVE_HIZ = "FALSE",
  parameter TX_MAINCURSOR_SEL = "0",
  parameter TX_MARGIN_FULL_0 = "1001110",
  parameter TX_MARGIN_FULL_1 = "1001001",
  parameter TX_MARGIN_FULL_2 = "1000101",
  parameter TX_MARGIN_FULL_3 = "1000010",
  parameter TX_MARGIN_FULL_4 = "1000000",
  parameter TX_MARGIN_LOW_0 = "1000110",
  parameter TX_MARGIN_LOW_1 = "1000100",
  parameter TX_MARGIN_LOW_2 = "1000010",
  parameter TX_MARGIN_LOW_3 = "1000000",
  parameter TX_MARGIN_LOW_4 = "1000000",
  parameter TX_PREDRIVER_MODE = "0",
  parameter TX_QPI_STATUS_EN = "0",
  parameter TX_RXDETECT_CFG = "1832",
  parameter TX_RXDETECT_REF = "100",
  parameter TX_XCLK_SEL = "TXUSR",
  parameter UCODEER_CLR = "0"
  ) (
  output CPLLFBCLKLOST,
  output CPLLLOCK,
  output CPLLREFCLKLOST,
  output [7:0] DMONITOROUT,
  output [15:0] DRPDO,
  output DRPRDY,
  output EYESCANDATAERROR,
  output GTREFCLKMONITOR,
  output GTXTXN,
  output GTXTXP,
  output [15:0] PCSRSVDOUT,
  output PHYSTATUS,
  output [2:0] RXBUFSTATUS,
  output RXBYTEISALIGNED,
  output RXBYTEREALIGN,
  output RXCDRLOCK,
  output RXCHANBONDSEQ,
  output RXCHANISALIGNED,
  output RXCHANREALIGN,
  output [7:0] RXCHARISCOMMA,
  output [7:0] RXCHARISK,
  output [4:0] RXCHBONDO,
  output [1:0] RXCLKCORCNT,
  output RXCOMINITDET,
  output RXCOMMADET,
  output RXCOMSASDET,
  output RXCOMWAKEDET,
  output [63:0] RXDATA,
  output RXDATAVALID,
  output [7:0] RXDISPERR,
  output RXDLYSRESETDONE,
  output RXELECIDLE,
  output [2:0] RXHEADER,
  output RXHEADERVALID,
  output [6:0] RXMONITOROUT,
  output [7:0] RXNOTINTABLE,
  output RXOUTCLK,
  output RXOUTCLKFABRIC,
  output RXOUTCLKPCS,
  output RXPHALIGNDONE,
  output [4:0] RXPHMONITOR,
  output [4:0] RXPHSLIPMONITOR,
  output RXPRBSERR,
  output RXQPISENN,
  output RXQPISENP,
  output RXRATEDONE,
  output RXRESETDONE,
  output RXSTARTOFSEQ,
  output [2:0] RXSTATUS,
  output RXVALID,
  output [9:0] TSTOUT,
  output [1:0] TXBUFSTATUS,
  output TXCOMFINISH,
  output TXDLYSRESETDONE,
  output TXGEARBOXREADY,
  output TXOUTCLK,
  output TXOUTCLKFABRIC,
  output TXOUTCLKPCS,
  output TXPHALIGNDONE,
  output TXPHINITDONE,
  output TXQPISENN,
  output TXQPISENP,
  output TXRATEDONE,
  output TXRESETDONE,
  input CFGRESET,
  input [3:0] CLKRSVD,
  input CPLLLOCKDETCLK,
  input CPLLLOCKEN,
  input CPLLPD,
  input [2:0] CPLLREFCLKSEL,
  input CPLLRESET,
  input [8:0] DRPADDR,
  input DRPCLK,
  input [15:0] DRPDI,
  input DRPEN,
  input DRPWE,
  input EYESCANMODE,
  input EYESCANRESET,
  input EYESCANTRIGGER,
  input GTGREFCLK,
  input GTNORTHREFCLK0,
  input GTNORTHREFCLK1,
  input GTREFCLK0,
  input GTREFCLK1,
  input GTRESETSEL,
  input [15:0] GTRSVD,
  input GTRXRESET,
  input GTSOUTHREFCLK0,
  input GTSOUTHREFCLK1,
  input GTTXRESET,
  input GTXRXN,
  input GTXRXP,
  input [2:0] LOOPBACK,
  input [15:0] PCSRSVDIN,
  input [4:0] PCSRSVDIN2,
  input [4:0] PMARSVDIN,
  input [4:0] PMARSVDIN2,
  input QPLLCLK,
  input QPLLREFCLK,
  input RESETOVRD,
  input RX8B10BEN,
  input RXBUFRESET,
  input RXCDRFREQRESET,
  input RXCDRHOLD,
  input RXCDROVRDEN,
  input RXCDRRESET,
  input RXCDRRESETRSV,
  input RXCHBONDEN,
  input [4:0] RXCHBONDI,
  input [2:0] RXCHBONDLEVEL,
  input RXCHBONDMASTER,
  input RXCHBONDSLAVE,
  input RXCOMMADETEN,
  input RXDDIEN,
  input RXDFEAGCHOLD,
  input RXDFEAGCOVRDEN,
  input RXDFECM1EN,
  input RXDFELFHOLD,
  input RXDFELFOVRDEN,
  input RXDFELPMRESET,
  input RXDFETAP2HOLD,
  input RXDFETAP2OVRDEN,
  input RXDFETAP3HOLD,
  input RXDFETAP3OVRDEN,
  input RXDFETAP4HOLD,
  input RXDFETAP4OVRDEN,
  input RXDFETAP5HOLD,
  input RXDFETAP5OVRDEN,
  input RXDFEUTHOLD,
  input RXDFEUTOVRDEN,
  input RXDFEVPHOLD,
  input RXDFEVPOVRDEN,
  input RXDFEVSEN,
  input RXDFEXYDEN,
  input RXDFEXYDHOLD,
  input RXDFEXYDOVRDEN,
  input RXDLYBYPASS,
  input RXDLYEN,
  input RXDLYOVRDEN,
  input RXDLYSRESET,
  input [1:0] RXELECIDLEMODE,
  input RXGEARBOXSLIP,
  input RXLPMEN,
  input RXLPMHFHOLD,
  input RXLPMHFOVRDEN,
  input RXLPMLFHOLD,
  input RXLPMLFKLOVRDEN,
  input RXMCOMMAALIGNEN,
  input [1:0] RXMONITORSEL,
  input RXOOBRESET,
  input RXOSHOLD,
  input RXOSOVRDEN,
  input [2:0] RXOUTCLKSEL,
  input RXPCOMMAALIGNEN,
  input RXPCSRESET,
  input [1:0] RXPD,
  input RXPHALIGN,
  input RXPHALIGNEN,
  input RXPHDLYPD,
  input RXPHDLYRESET,
  input RXPHOVRDEN,
  input RXPMARESET,
  input RXPOLARITY,
  input RXPRBSCNTRESET,
  input [2:0] RXPRBSSEL,
  input RXQPIEN,
  input [2:0] RXRATE,
  input RXSLIDE,
  input [1:0] RXSYSCLKSEL,
  input RXUSERRDY,
  input RXUSRCLK,
  input RXUSRCLK2,
  input SETERRSTATUS,
  input [19:0] TSTIN,
  input [7:0] TX8B10BBYPASS,
  input TX8B10BEN,
  input [2:0] TXBUFDIFFCTRL,
  input [7:0] TXCHARDISPMODE,
  input [7:0] TXCHARDISPVAL,
  input [7:0] TXCHARISK,
  input TXCOMINIT,
  input TXCOMSAS,
  input TXCOMWAKE,
  input [63:0] TXDATA,
  input TXDEEMPH,
  input TXDETECTRX,
  input [3:0] TXDIFFCTRL,
  input TXDIFFPD,
  input TXDLYBYPASS,
  input TXDLYEN,
  input TXDLYHOLD,
  input TXDLYOVRDEN,
  input TXDLYSRESET,
  input TXDLYUPDOWN,
  input TXELECIDLE,
  input [2:0] TXHEADER,
  input TXINHIBIT,
  input [6:0] TXMAINCURSOR,
  input [2:0] TXMARGIN,
  input [2:0] TXOUTCLKSEL,
  input TXPCSRESET,
  input [1:0] TXPD,
  input TXPDELECIDLEMODE,
  input TXPHALIGN,
  input TXPHALIGNEN,
  input TXPHDLYPD,
  input TXPHDLYRESET,
  input TXPHDLYTSTCLK,
  input TXPHINIT,
  input TXPHOVRDEN,
  input TXPISOPD,
  input TXPMARESET,
  input TXPOLARITY,
  input [4:0] TXPOSTCURSOR,
  input TXPOSTCURSORINV,
  input TXPRBSFORCEERR,
  input [2:0] TXPRBSSEL,
  input [4:0] TXPRECURSOR,
  input TXPRECURSORINV,
  input TXQPIBIASEN,
  input TXQPISTRONGPDOWN,
  input TXQPIWEAKPUP,
  input [2:0] TXRATE,
  input [6:0] TXSEQUENCE,
  input TXSTARTSEQ,
  input TXSWING,
  input [1:0] TXSYSCLKSEL,
  input TXUSERRDY,
  input TXUSRCLK,
  input TXUSRCLK2,
  input GSR
);

`ifdef _INTERNAL_TRUE_
`undef _INTERNAL_TRUE_
`endif
`define _INTERNAL_TRUE_
`ifdef mti_secure_ip_available
`mti_require_secure_ip
`endif
function [255 : 0] convert; 
    input [511:0] init_inp; 
    integer k, t;
    integer count_tmp;
    reg [7:0] tmp_int;
begin 
count_tmp = 0;
for (k = 511; k >= 7; k = k-8) begin
      tmp_int = {init_inp[k],init_inp[k-1],init_inp[k-2],init_inp[k-3],init_inp[k-4],init_inp[k-5],init_inp[k-6],init_inp[k-7]};
      for (t = (255 - (count_tmp*4)); t >= ((255 - (count_tmp*4))-3) ; t = t - 4) begin
        case(tmp_int)
        8'b00110000 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0000;
        8'b00110001 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0001;
        8'b00110010 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0010;
        8'b00110011 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0011;
        8'b00110100 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0100;
        8'b00110101 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0101;
        8'b00110110 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0110;
        8'b00110111 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b0111;
        8'b00111000 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1000;
        8'b00111001 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1001;
        // Uppercase a-f
        8'b01000001 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1010;
        8'b01000010 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1011;
        8'b01000011 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1100;
        8'b01000100 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1101;
        8'b01000101 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1110;
        8'b01000110 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1111;
        // Lowercase a-f
        8'b01100001 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1010;
        8'b01100010 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1011;
        8'b01100011 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1100;
        8'b01100100 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1101;
        8'b01100101 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1110;
        8'b01100110 : {convert[t-0], convert[t-1], convert[t-2], convert[t-3]} = 4'b1111;
        endcase  
    	end
        count_tmp = count_tmp+1;
       end

    end
endfunction

function [71:0] convertbin;
    input [575:0] inp;
    integer i,j;
    reg [7:0] tmp_bin;
    integer countbin ;
begin
     countbin =1;
     for (i = 575; i >= 7; i = i-8) begin
      tmp_bin = {inp[i],inp[i-1],inp[i-2],inp[i-3],inp[i-4],inp[i-5],inp[i-6],inp[i-7]};
       for (j = (72 - (countbin)) ; j >= (71 - (countbin)) ; j = j-1 ) begin
        case(tmp_bin)
         8'b00110000 : convertbin[j] = 1'b0;
         8'b00110001 : convertbin[j] = 1'b1;
       endcase
      end
      countbin = countbin+1;
    end
 end
 endfunction

localparam [9:0] ALIGN_COMMA_ENABLE_conv = convertbin(ALIGN_COMMA_ENABLE);
localparam [9:0] ALIGN_MCOMMA_VALUE_conv = convertbin(ALIGN_MCOMMA_VALUE);
localparam [9:0] ALIGN_PCOMMA_VALUE_conv = convertbin(ALIGN_PCOMMA_VALUE);
localparam [9:0] CHAN_BOND_SEQ_1_1_conv = convertbin(CHAN_BOND_SEQ_1_1);
localparam [9:0] CHAN_BOND_SEQ_1_2_conv = convertbin(CHAN_BOND_SEQ_1_2);
localparam [9:0] CHAN_BOND_SEQ_1_3_conv = convertbin(CHAN_BOND_SEQ_1_3);
localparam [9:0] CHAN_BOND_SEQ_1_4_conv = convertbin(CHAN_BOND_SEQ_1_4);
localparam [3:0] CHAN_BOND_SEQ_1_ENABLE_conv = convertbin(CHAN_BOND_SEQ_1_ENABLE);
localparam [9:0] CHAN_BOND_SEQ_2_1_conv = convertbin(CHAN_BOND_SEQ_2_1);
localparam [9:0] CHAN_BOND_SEQ_2_2_conv = convertbin(CHAN_BOND_SEQ_2_2);
localparam [9:0] CHAN_BOND_SEQ_2_3_conv = convertbin(CHAN_BOND_SEQ_2_3);
localparam [9:0] CHAN_BOND_SEQ_2_4_conv = convertbin(CHAN_BOND_SEQ_2_4);
localparam [3:0] CHAN_BOND_SEQ_2_ENABLE_conv = convertbin(CHAN_BOND_SEQ_2_ENABLE);
localparam [9:0] CLK_COR_SEQ_1_1_conv = convertbin(CLK_COR_SEQ_1_1);
localparam [9:0] CLK_COR_SEQ_1_2_conv = convertbin(CLK_COR_SEQ_1_2);
localparam [9:0] CLK_COR_SEQ_1_3_conv = convertbin(CLK_COR_SEQ_1_3);
localparam [9:0] CLK_COR_SEQ_1_4_conv = convertbin(CLK_COR_SEQ_1_4);
localparam [3:0] CLK_COR_SEQ_1_ENABLE_conv = convertbin(CLK_COR_SEQ_1_ENABLE);
localparam [9:0] CLK_COR_SEQ_2_1_conv = convertbin(CLK_COR_SEQ_2_1);
localparam [9:0] CLK_COR_SEQ_2_2_conv = convertbin(CLK_COR_SEQ_2_2);
localparam [9:0] CLK_COR_SEQ_2_3_conv = convertbin(CLK_COR_SEQ_2_3);
localparam [9:0] CLK_COR_SEQ_2_4_conv = convertbin(CLK_COR_SEQ_2_4);
localparam [3:0] CLK_COR_SEQ_2_ENABLE_conv = convertbin(CLK_COR_SEQ_2_ENABLE);
localparam [23:0] CPLL_CFG_conv = convert(CPLL_CFG);
localparam [23:0] CPLL_INIT_CFG_conv = convert(CPLL_INIT_CFG);
localparam [15:0] CPLL_LOCK_CFG_conv = convert(CPLL_LOCK_CFG);
localparam [23:0] DMONITOR_CFG_conv = convert(DMONITOR_CFG);
localparam [5:0] ES_CONTROL_conv = convertbin(ES_CONTROL);
localparam [11:0] ES_HORZ_OFFSET_conv = convert(ES_HORZ_OFFSET);
localparam [9:0] ES_PMA_CFG_conv = convertbin(ES_PMA_CFG);
localparam [4:0] ES_PRESCALE_conv = convertbin(ES_PRESCALE);
localparam [79:0] ES_QUALIFIER_conv = convert(ES_QUALIFIER);
localparam [79:0] ES_QUAL_MASK_conv = convert(ES_QUAL_MASK);
localparam [79:0] ES_SDATA_MASK_conv = convert(ES_SDATA_MASK);
localparam [8:0] ES_VERT_OFFSET_conv = convertbin(ES_VERT_OFFSET);
localparam [3:0] FTS_DESKEW_SEQ_ENABLE_conv = convertbin(FTS_DESKEW_SEQ_ENABLE);
localparam [3:0] FTS_LANE_DESKEW_CFG_conv = convertbin(FTS_LANE_DESKEW_CFG);
localparam [2:0] GEARBOX_MODE_conv = convertbin(GEARBOX_MODE);
localparam [1:0] OUTREFCLK_SEL_INV_conv = convertbin(OUTREFCLK_SEL_INV);
localparam [47:0] PCS_RSVD_ATTR_conv = convert(PCS_RSVD_ATTR);
localparam [11:0] PD_TRANS_TIME_FROM_P2_conv = convert(PD_TRANS_TIME_FROM_P2);
localparam [7:0] PD_TRANS_TIME_NONE_P2_conv = convert(PD_TRANS_TIME_NONE_P2);
localparam [7:0] PD_TRANS_TIME_TO_P2_conv = convert(PD_TRANS_TIME_TO_P2);
localparam [31:0] PMA_RSV_conv = convert(PMA_RSV);
localparam [15:0] PMA_RSV2_conv = convert(PMA_RSV2);
localparam [1:0] PMA_RSV3_conv = convertbin(PMA_RSV3);
localparam [31:0] PMA_RSV4_conv = convert(PMA_RSV4);
localparam [4:0] RXBUFRESET_TIME_conv = convertbin(RXBUFRESET_TIME);
localparam [3:0] RXBUF_EIDLE_HI_CNT_conv = convertbin(RXBUF_EIDLE_HI_CNT);
localparam [3:0] RXBUF_EIDLE_LO_CNT_conv = convertbin(RXBUF_EIDLE_LO_CNT);
localparam [4:0] RXCDRFREQRESET_TIME_conv = convertbin(RXCDRFREQRESET_TIME);
localparam [4:0] RXCDRPHRESET_TIME_conv = convertbin(RXCDRPHRESET_TIME);
localparam [71:0] RXCDR_CFG_conv = convert(RXCDR_CFG);
localparam [0:0] RXCDR_FR_RESET_ON_EIDLE_conv = convertbin(RXCDR_FR_RESET_ON_EIDLE);
localparam [0:0] RXCDR_HOLD_DURING_EIDLE_conv = convertbin(RXCDR_HOLD_DURING_EIDLE);
localparam [5:0] RXCDR_LOCK_CFG_conv = convertbin(RXCDR_LOCK_CFG);
localparam [0:0] RXCDR_PH_RESET_ON_EIDLE_conv = convertbin(RXCDR_PH_RESET_ON_EIDLE);
localparam [6:0] RXDFELPMRESET_TIME_conv = convertbin(RXDFELPMRESET_TIME);
localparam [15:0] RXDLY_CFG_conv = convert(RXDLY_CFG);
localparam [8:0] RXDLY_LCFG_conv = convert(RXDLY_LCFG);
localparam [15:0] RXDLY_TAP_CFG_conv = convert(RXDLY_TAP_CFG);
localparam [4:0] RXISCANRESET_TIME_conv = convertbin(RXISCANRESET_TIME);
localparam [13:0] RXLPM_HF_CFG_conv = convertbin(RXLPM_HF_CFG);
localparam [13:0] RXLPM_LF_CFG_conv = convertbin(RXLPM_LF_CFG);
localparam [6:0] RXOOB_CFG_conv = convertbin(RXOOB_CFG);
localparam [4:0] RXPCSRESET_TIME_conv = convertbin(RXPCSRESET_TIME);
localparam [23:0] RXPHDLY_CFG_conv = convert(RXPHDLY_CFG);
localparam [23:0] RXPH_CFG_conv = convert(RXPH_CFG);
localparam [4:0] RXPH_MONITOR_SEL_conv = convertbin(RXPH_MONITOR_SEL);
localparam [4:0] RXPMARESET_TIME_conv = convertbin(RXPMARESET_TIME);
localparam [0:0] RXPRBS_ERR_LOOPBACK_conv = convertbin(RXPRBS_ERR_LOOPBACK);
localparam [11:0] RX_BIAS_CFG_conv = convertbin(RX_BIAS_CFG);
localparam [5:0] RX_BUFFER_CFG_conv = convertbin(RX_BUFFER_CFG);
localparam [0:0] RX_CLKMUX_PD_conv = convertbin(RX_CLKMUX_PD);
localparam [1:0] RX_CM_SEL_conv = convertbin(RX_CM_SEL);
localparam [2:0] RX_CM_TRIM_conv = convertbin(RX_CM_TRIM);
localparam [5:0] RX_DDI_SEL_conv = convertbin(RX_DDI_SEL);
localparam [11:0] RX_DEBUG_CFG_conv = convertbin(RX_DEBUG_CFG);
localparam [22:0] RX_DFE_GAIN_CFG_conv = convert(RX_DFE_GAIN_CFG);
localparam [11:0] RX_DFE_H2_CFG_conv = convertbin(RX_DFE_H2_CFG);
localparam [11:0] RX_DFE_H3_CFG_conv = convertbin(RX_DFE_H3_CFG);
localparam [10:0] RX_DFE_H4_CFG_conv = convertbin(RX_DFE_H4_CFG);
localparam [10:0] RX_DFE_H5_CFG_conv = convertbin(RX_DFE_H5_CFG);
localparam [12:0] RX_DFE_KL_CFG_conv = convertbin(RX_DFE_KL_CFG);
localparam [31:0] RX_DFE_KL_CFG2_conv = convert(RX_DFE_KL_CFG2);
localparam [15:0] RX_DFE_LPM_CFG_conv = convert(RX_DFE_LPM_CFG);
localparam [0:0] RX_DFE_LPM_HOLD_DURING_EIDLE_conv = convertbin(RX_DFE_LPM_HOLD_DURING_EIDLE);
localparam [16:0] RX_DFE_UT_CFG_conv = convertbin(RX_DFE_UT_CFG);
localparam [16:0] RX_DFE_VP_CFG_conv = convertbin(RX_DFE_VP_CFG);
localparam [12:0] RX_DFE_XYD_CFG_conv = convertbin(RX_DFE_XYD_CFG);
localparam [12:0] RX_OS_CFG_conv = convertbin(RX_OS_CFG);
localparam [3:0] SATA_BURST_SEQ_LEN_conv = convertbin(SATA_BURST_SEQ_LEN);
localparam [2:0] SATA_BURST_VAL_conv = convertbin(SATA_BURST_VAL);
localparam [2:0] SATA_EIDLE_VAL_conv = convertbin(SATA_EIDLE_VAL);
localparam [2:0] SIM_CPLLREFCLK_SEL_conv = convertbin(SIM_CPLLREFCLK_SEL);
localparam [4:0] TERM_RCAL_CFG_conv = convertbin(TERM_RCAL_CFG);
localparam [0:0] TERM_RCAL_OVRD_conv = convertbin(TERM_RCAL_OVRD);
localparam [7:0] TRANS_TIME_RATE_conv = convert(TRANS_TIME_RATE);
localparam [31:0] TST_RSV_conv = convert(TST_RSV);
localparam [15:0] TXDLY_CFG_conv = convert(TXDLY_CFG);
localparam [8:0] TXDLY_LCFG_conv = convert(TXDLY_LCFG);
localparam [15:0] TXDLY_TAP_CFG_conv = convert(TXDLY_TAP_CFG);
localparam [4:0] TXPCSRESET_TIME_conv = convertbin(TXPCSRESET_TIME);
localparam [23:0] TXPHDLY_CFG_conv = convert(TXPHDLY_CFG);
localparam [15:0] TXPH_CFG_conv = convert(TXPH_CFG);
localparam [4:0] TXPH_MONITOR_SEL_conv = convertbin(TXPH_MONITOR_SEL);
localparam [4:0] TXPMARESET_TIME_conv = convertbin(TXPMARESET_TIME);
localparam [0:0] TX_CLKMUX_PD_conv = convertbin(TX_CLKMUX_PD);
localparam [4:0] TX_DEEMPH0_conv = convertbin(TX_DEEMPH0);
localparam [4:0] TX_DEEMPH1_conv = convertbin(TX_DEEMPH1);
localparam [2:0] TX_EIDLE_ASSERT_DELAY_conv = convertbin(TX_EIDLE_ASSERT_DELAY);
localparam [2:0] TX_EIDLE_DEASSERT_DELAY_conv = convertbin(TX_EIDLE_DEASSERT_DELAY);
localparam [0:0] TX_MAINCURSOR_SEL_conv = convertbin(TX_MAINCURSOR_SEL);
localparam [6:0] TX_MARGIN_FULL_0_conv = convertbin(TX_MARGIN_FULL_0);
localparam [6:0] TX_MARGIN_FULL_1_conv = convertbin(TX_MARGIN_FULL_1);
localparam [6:0] TX_MARGIN_FULL_2_conv = convertbin(TX_MARGIN_FULL_2);
localparam [6:0] TX_MARGIN_FULL_3_conv = convertbin(TX_MARGIN_FULL_3);
localparam [6:0] TX_MARGIN_FULL_4_conv = convertbin(TX_MARGIN_FULL_4);
localparam [6:0] TX_MARGIN_LOW_0_conv = convertbin(TX_MARGIN_LOW_0);
localparam [6:0] TX_MARGIN_LOW_1_conv = convertbin(TX_MARGIN_LOW_1);
localparam [6:0] TX_MARGIN_LOW_2_conv = convertbin(TX_MARGIN_LOW_2);
localparam [6:0] TX_MARGIN_LOW_3_conv = convertbin(TX_MARGIN_LOW_3);
localparam [6:0] TX_MARGIN_LOW_4_conv = convertbin(TX_MARGIN_LOW_4);
localparam [0:0] TX_PREDRIVER_MODE_conv = convertbin(TX_PREDRIVER_MODE);
localparam [0:0] TX_QPI_STATUS_EN_conv = convertbin(TX_QPI_STATUS_EN);
localparam [13:0] TX_RXDETECT_CFG_conv = convert(TX_RXDETECT_CFG);
localparam [2:0] TX_RXDETECT_REF_conv = convertbin(TX_RXDETECT_REF);
localparam [0:0] UCODEER_CLR_conv = convertbin(UCODEER_CLR);
B_GTXE2_CHANNEL #(
  .ALIGN_COMMA_DOUBLE (ALIGN_COMMA_DOUBLE),
  .ALIGN_COMMA_ENABLE (ALIGN_COMMA_ENABLE_conv),
  .ALIGN_COMMA_WORD (ALIGN_COMMA_WORD),
  .ALIGN_MCOMMA_DET (ALIGN_MCOMMA_DET),
  .ALIGN_MCOMMA_VALUE (ALIGN_MCOMMA_VALUE_conv),
  .ALIGN_PCOMMA_DET (ALIGN_PCOMMA_DET),
  .ALIGN_PCOMMA_VALUE (ALIGN_PCOMMA_VALUE_conv),
  .CBCC_DATA_SOURCE_SEL (CBCC_DATA_SOURCE_SEL),
  .CHAN_BOND_KEEP_ALIGN (CHAN_BOND_KEEP_ALIGN),
  .CHAN_BOND_MAX_SKEW (CHAN_BOND_MAX_SKEW),
  .CHAN_BOND_SEQ_1_1 (CHAN_BOND_SEQ_1_1_conv),
  .CHAN_BOND_SEQ_1_2 (CHAN_BOND_SEQ_1_2_conv),
  .CHAN_BOND_SEQ_1_3 (CHAN_BOND_SEQ_1_3_conv),
  .CHAN_BOND_SEQ_1_4 (CHAN_BOND_SEQ_1_4_conv),
  .CHAN_BOND_SEQ_1_ENABLE (CHAN_BOND_SEQ_1_ENABLE_conv),
  .CHAN_BOND_SEQ_2_1 (CHAN_BOND_SEQ_2_1_conv),
  .CHAN_BOND_SEQ_2_2 (CHAN_BOND_SEQ_2_2_conv),
  .CHAN_BOND_SEQ_2_3 (CHAN_BOND_SEQ_2_3_conv),
  .CHAN_BOND_SEQ_2_4 (CHAN_BOND_SEQ_2_4_conv),
  .CHAN_BOND_SEQ_2_ENABLE (CHAN_BOND_SEQ_2_ENABLE_conv),
  .CHAN_BOND_SEQ_2_USE (CHAN_BOND_SEQ_2_USE),
  .CHAN_BOND_SEQ_LEN (CHAN_BOND_SEQ_LEN),
  .CLK_CORRECT_USE (CLK_CORRECT_USE),
  .CLK_COR_KEEP_IDLE (CLK_COR_KEEP_IDLE),
  .CLK_COR_MAX_LAT (CLK_COR_MAX_LAT),
  .CLK_COR_MIN_LAT (CLK_COR_MIN_LAT),
  .CLK_COR_PRECEDENCE (CLK_COR_PRECEDENCE),
  .CLK_COR_REPEAT_WAIT (CLK_COR_REPEAT_WAIT),
  .CLK_COR_SEQ_1_1 (CLK_COR_SEQ_1_1_conv),
  .CLK_COR_SEQ_1_2 (CLK_COR_SEQ_1_2_conv),
  .CLK_COR_SEQ_1_3 (CLK_COR_SEQ_1_3_conv),
  .CLK_COR_SEQ_1_4 (CLK_COR_SEQ_1_4_conv),
  .CLK_COR_SEQ_1_ENABLE (CLK_COR_SEQ_1_ENABLE_conv),
  .CLK_COR_SEQ_2_1 (CLK_COR_SEQ_2_1_conv),
  .CLK_COR_SEQ_2_2 (CLK_COR_SEQ_2_2_conv),
  .CLK_COR_SEQ_2_3 (CLK_COR_SEQ_2_3_conv),
  .CLK_COR_SEQ_2_4 (CLK_COR_SEQ_2_4_conv),
  .CLK_COR_SEQ_2_ENABLE (CLK_COR_SEQ_2_ENABLE_conv),
  .CLK_COR_SEQ_2_USE (CLK_COR_SEQ_2_USE),
  .CLK_COR_SEQ_LEN (CLK_COR_SEQ_LEN),
  .CPLL_CFG (CPLL_CFG_conv),
  .CPLL_FBDIV (CPLL_FBDIV),
  .CPLL_FBDIV_45 (CPLL_FBDIV_45),
  .CPLL_INIT_CFG (CPLL_INIT_CFG_conv),
  .CPLL_LOCK_CFG (CPLL_LOCK_CFG_conv),
  .CPLL_REFCLK_DIV (CPLL_REFCLK_DIV),
  .DEC_MCOMMA_DETECT (DEC_MCOMMA_DETECT),
  .DEC_PCOMMA_DETECT (DEC_PCOMMA_DETECT),
  .DEC_VALID_COMMA_ONLY (DEC_VALID_COMMA_ONLY),
  .DMONITOR_CFG (DMONITOR_CFG_conv),
  .ES_CONTROL (ES_CONTROL_conv),
  .ES_ERRDET_EN (ES_ERRDET_EN),
  .ES_EYE_SCAN_EN (ES_EYE_SCAN_EN),
  .ES_HORZ_OFFSET (ES_HORZ_OFFSET_conv),
  .ES_PMA_CFG (ES_PMA_CFG_conv),
  .ES_PRESCALE (ES_PRESCALE_conv),
  .ES_QUALIFIER (ES_QUALIFIER_conv),
  .ES_QUAL_MASK (ES_QUAL_MASK_conv),
  .ES_SDATA_MASK (ES_SDATA_MASK_conv),
  .ES_VERT_OFFSET (ES_VERT_OFFSET_conv),
  .FTS_DESKEW_SEQ_ENABLE (FTS_DESKEW_SEQ_ENABLE_conv),
  .FTS_LANE_DESKEW_CFG (FTS_LANE_DESKEW_CFG_conv),
  .FTS_LANE_DESKEW_EN (FTS_LANE_DESKEW_EN),
  .GEARBOX_MODE (GEARBOX_MODE_conv),
  .OUTREFCLK_SEL_INV (OUTREFCLK_SEL_INV_conv),
  .PCS_PCIE_EN (PCS_PCIE_EN),
  .PCS_RSVD_ATTR (PCS_RSVD_ATTR_conv),
  .PD_TRANS_TIME_FROM_P2 (PD_TRANS_TIME_FROM_P2_conv),
  .PD_TRANS_TIME_NONE_P2 (PD_TRANS_TIME_NONE_P2_conv),
  .PD_TRANS_TIME_TO_P2 (PD_TRANS_TIME_TO_P2_conv),
  .PMA_RSV (PMA_RSV_conv),
  .PMA_RSV2 (PMA_RSV2_conv),
  .PMA_RSV3 (PMA_RSV3_conv),
  .PMA_RSV4 (PMA_RSV4_conv),
  .RXBUFRESET_TIME (RXBUFRESET_TIME_conv),
  .RXBUF_ADDR_MODE (RXBUF_ADDR_MODE),
  .RXBUF_EIDLE_HI_CNT (RXBUF_EIDLE_HI_CNT_conv),
  .RXBUF_EIDLE_LO_CNT (RXBUF_EIDLE_LO_CNT_conv),
  .RXBUF_EN (RXBUF_EN),
  .RXBUF_RESET_ON_CB_CHANGE (RXBUF_RESET_ON_CB_CHANGE),
  .RXBUF_RESET_ON_COMMAALIGN (RXBUF_RESET_ON_COMMAALIGN),
  .RXBUF_RESET_ON_EIDLE (RXBUF_RESET_ON_EIDLE),
  .RXBUF_RESET_ON_RATE_CHANGE (RXBUF_RESET_ON_RATE_CHANGE),
  .RXBUF_THRESH_OVFLW (RXBUF_THRESH_OVFLW),
  .RXBUF_THRESH_OVRD (RXBUF_THRESH_OVRD),
  .RXBUF_THRESH_UNDFLW (RXBUF_THRESH_UNDFLW),
  .RXCDRFREQRESET_TIME (RXCDRFREQRESET_TIME_conv),
  .RXCDRPHRESET_TIME (RXCDRPHRESET_TIME_conv),
  .RXCDR_CFG (RXCDR_CFG_conv),
  .RXCDR_FR_RESET_ON_EIDLE (RXCDR_FR_RESET_ON_EIDLE_conv),
  .RXCDR_HOLD_DURING_EIDLE (RXCDR_HOLD_DURING_EIDLE_conv),
  .RXCDR_LOCK_CFG (RXCDR_LOCK_CFG_conv),
  .RXCDR_PH_RESET_ON_EIDLE (RXCDR_PH_RESET_ON_EIDLE_conv),
  .RXDFELPMRESET_TIME (RXDFELPMRESET_TIME_conv),
  .RXDLY_CFG (RXDLY_CFG_conv),
  .RXDLY_LCFG (RXDLY_LCFG_conv),
  .RXDLY_TAP_CFG (RXDLY_TAP_CFG_conv),
  .RXGEARBOX_EN (RXGEARBOX_EN),
  .RXISCANRESET_TIME (RXISCANRESET_TIME_conv),
  .RXLPM_HF_CFG (RXLPM_HF_CFG_conv),
  .RXLPM_LF_CFG (RXLPM_LF_CFG_conv),
  .RXOOB_CFG (RXOOB_CFG_conv),
  .RXOUT_DIV (RXOUT_DIV),
  .RXPCSRESET_TIME (RXPCSRESET_TIME_conv),
  .RXPHDLY_CFG (RXPHDLY_CFG_conv),
  .RXPH_CFG (RXPH_CFG_conv),
  .RXPH_MONITOR_SEL (RXPH_MONITOR_SEL_conv),
  .RXPMARESET_TIME (RXPMARESET_TIME_conv),
  .RXPRBS_ERR_LOOPBACK (RXPRBS_ERR_LOOPBACK_conv),
  .RXSLIDE_AUTO_WAIT (RXSLIDE_AUTO_WAIT),
  .RXSLIDE_MODE (RXSLIDE_MODE),
  .RX_BIAS_CFG (RX_BIAS_CFG_conv),
  .RX_BUFFER_CFG (RX_BUFFER_CFG_conv),
  .RX_CLK25_DIV (RX_CLK25_DIV),
  .RX_CLKMUX_PD (RX_CLKMUX_PD_conv),
  .RX_CM_SEL (RX_CM_SEL_conv),
  .RX_CM_TRIM (RX_CM_TRIM_conv),
  .RX_DATA_WIDTH (RX_DATA_WIDTH),
  .RX_DDI_SEL (RX_DDI_SEL_conv),
  .RX_DEBUG_CFG (RX_DEBUG_CFG_conv),
  .RX_DEFER_RESET_BUF_EN (RX_DEFER_RESET_BUF_EN),
  .RX_DFE_GAIN_CFG (RX_DFE_GAIN_CFG_conv),
  .RX_DFE_H2_CFG (RX_DFE_H2_CFG_conv),
  .RX_DFE_H3_CFG (RX_DFE_H3_CFG_conv),
  .RX_DFE_H4_CFG (RX_DFE_H4_CFG_conv),
  .RX_DFE_H5_CFG (RX_DFE_H5_CFG_conv),
  .RX_DFE_KL_CFG (RX_DFE_KL_CFG_conv),
  .RX_DFE_KL_CFG2 (RX_DFE_KL_CFG2_conv),
  .RX_DFE_LPM_CFG (RX_DFE_LPM_CFG_conv),
  .RX_DFE_LPM_HOLD_DURING_EIDLE (RX_DFE_LPM_HOLD_DURING_EIDLE_conv),
  .RX_DFE_UT_CFG (RX_DFE_UT_CFG_conv),
  .RX_DFE_VP_CFG (RX_DFE_VP_CFG_conv),
  .RX_DFE_XYD_CFG (RX_DFE_XYD_CFG_conv),
  .RX_DISPERR_SEQ_MATCH (RX_DISPERR_SEQ_MATCH),
  .RX_INT_DATAWIDTH (RX_INT_DATAWIDTH),
  .RX_OS_CFG (RX_OS_CFG_conv),
  .RX_SIG_VALID_DLY (RX_SIG_VALID_DLY),
  .RX_XCLK_SEL (RX_XCLK_SEL),
  .SAS_MAX_COM (SAS_MAX_COM),
  .SAS_MIN_COM (SAS_MIN_COM),
  .SATA_BURST_SEQ_LEN (SATA_BURST_SEQ_LEN_conv),
  .SATA_BURST_VAL (SATA_BURST_VAL_conv),
  .SATA_CPLL_CFG (SATA_CPLL_CFG),
  .SATA_EIDLE_VAL (SATA_EIDLE_VAL_conv),
  .SATA_MAX_BURST (SATA_MAX_BURST),
  .SATA_MAX_INIT (SATA_MAX_INIT),
  .SATA_MAX_WAKE (SATA_MAX_WAKE),
  .SATA_MIN_BURST (SATA_MIN_BURST),
  .SATA_MIN_INIT (SATA_MIN_INIT),
  .SATA_MIN_WAKE (SATA_MIN_WAKE),
  .SHOW_REALIGN_COMMA (SHOW_REALIGN_COMMA),
  .SIM_CPLLREFCLK_SEL (SIM_CPLLREFCLK_SEL_conv),
  .SIM_RECEIVER_DETECT_PASS (SIM_RECEIVER_DETECT_PASS),
  .SIM_RESET_SPEEDUP (SIM_RESET_SPEEDUP),
  .SIM_TX_EIDLE_DRIVE_LEVEL (SIM_TX_EIDLE_DRIVE_LEVEL),
  .SIM_VERSION (SIM_VERSION),
  .TERM_RCAL_CFG (TERM_RCAL_CFG_conv),
  .TERM_RCAL_OVRD (TERM_RCAL_OVRD_conv),
  .TRANS_TIME_RATE (TRANS_TIME_RATE_conv),
  .TST_RSV (TST_RSV_conv),
  .TXBUF_EN (TXBUF_EN),
  .TXBUF_RESET_ON_RATE_CHANGE (TXBUF_RESET_ON_RATE_CHANGE),
  .TXDLY_CFG (TXDLY_CFG_conv),
  .TXDLY_LCFG (TXDLY_LCFG_conv),
  .TXDLY_TAP_CFG (TXDLY_TAP_CFG_conv),
  .TXGEARBOX_EN (TXGEARBOX_EN),
  .TXOUT_DIV (TXOUT_DIV),
  .TXPCSRESET_TIME (TXPCSRESET_TIME_conv),
  .TXPHDLY_CFG (TXPHDLY_CFG_conv),
  .TXPH_CFG (TXPH_CFG_conv),
  .TXPH_MONITOR_SEL (TXPH_MONITOR_SEL_conv),
  .TXPMARESET_TIME (TXPMARESET_TIME_conv),
  .TX_CLK25_DIV (TX_CLK25_DIV),
  .TX_CLKMUX_PD (TX_CLKMUX_PD_conv),
  .TX_DATA_WIDTH (TX_DATA_WIDTH),
  .TX_DEEMPH0 (TX_DEEMPH0_conv),
  .TX_DEEMPH1 (TX_DEEMPH1_conv),
  .TX_DRIVE_MODE (TX_DRIVE_MODE),
  .TX_EIDLE_ASSERT_DELAY (TX_EIDLE_ASSERT_DELAY_conv),
  .TX_EIDLE_DEASSERT_DELAY (TX_EIDLE_DEASSERT_DELAY_conv),
  .TX_INT_DATAWIDTH (TX_INT_DATAWIDTH),
  .TX_LOOPBACK_DRIVE_HIZ (TX_LOOPBACK_DRIVE_HIZ),
  .TX_MAINCURSOR_SEL (TX_MAINCURSOR_SEL_conv),
  .TX_MARGIN_FULL_0 (TX_MARGIN_FULL_0_conv),
  .TX_MARGIN_FULL_1 (TX_MARGIN_FULL_1_conv),
  .TX_MARGIN_FULL_2 (TX_MARGIN_FULL_2_conv),
  .TX_MARGIN_FULL_3 (TX_MARGIN_FULL_3_conv),
  .TX_MARGIN_FULL_4 (TX_MARGIN_FULL_4_conv),
  .TX_MARGIN_LOW_0 (TX_MARGIN_LOW_0_conv),
  .TX_MARGIN_LOW_1 (TX_MARGIN_LOW_1_conv),
  .TX_MARGIN_LOW_2 (TX_MARGIN_LOW_2_conv),
  .TX_MARGIN_LOW_3 (TX_MARGIN_LOW_3_conv),
  .TX_MARGIN_LOW_4 (TX_MARGIN_LOW_4_conv),
  .TX_PREDRIVER_MODE (TX_PREDRIVER_MODE_conv),
  .TX_QPI_STATUS_EN (TX_QPI_STATUS_EN_conv),
  .TX_RXDETECT_CFG (TX_RXDETECT_CFG_conv),
  .TX_RXDETECT_REF (TX_RXDETECT_REF_conv),
  .TX_XCLK_SEL (TX_XCLK_SEL),
  .UCODEER_CLR (UCODEER_CLR_conv)
  )
  B_GTXE2_CHANNEL_INST (
  .CFGRESET (CFGRESET),
  .CLKRSVD (CLKRSVD),
  .CPLLFBCLKLOST (CPLLFBCLKLOST),
  .CPLLLOCK (CPLLLOCK),
  .CPLLLOCKDETCLK (CPLLLOCKDETCLK),
  .CPLLLOCKEN (CPLLLOCKEN),
  .CPLLPD (CPLLPD),
  .CPLLREFCLKLOST (CPLLREFCLKLOST),
  .CPLLREFCLKSEL (CPLLREFCLKSEL),
  .CPLLRESET (CPLLRESET),
  .DMONITOROUT (DMONITOROUT),
  .DRPADDR (DRPADDR),
  .DRPCLK (DRPCLK),
  .DRPDI (DRPDI),
  .DRPDO (DRPDO),
  .DRPEN (DRPEN),
  .DRPRDY (DRPRDY),
  .DRPWE (DRPWE),
  .EYESCANDATAERROR (EYESCANDATAERROR),
  .EYESCANMODE (EYESCANMODE),
  .EYESCANRESET (EYESCANRESET),
  .EYESCANTRIGGER (EYESCANTRIGGER),
  .GTGREFCLK (GTGREFCLK),
  .GTNORTHREFCLK0 (GTNORTHREFCLK0),
  .GTNORTHREFCLK1 (GTNORTHREFCLK1),
  .GTREFCLK0 (GTREFCLK0),
  .GTREFCLK1 (GTREFCLK1),
  .GTREFCLKMONITOR (GTREFCLKMONITOR),
  .GTRESETSEL (GTRESETSEL),
  .GTRSVD (GTRSVD),
  .GTRXRESET (GTRXRESET),
  .GTSOUTHREFCLK0 (GTSOUTHREFCLK0),
  .GTSOUTHREFCLK1 (GTSOUTHREFCLK1),
  .GTTXRESET (GTTXRESET),
  .GTXRXN (GTXRXN),
  .GTXRXP (GTXRXP),
  .GTXTXN (GTXTXN),
  .GTXTXP (GTXTXP),
  .LOOPBACK (LOOPBACK),
  .PCSRSVDIN (PCSRSVDIN),
  .PCSRSVDIN2 (PCSRSVDIN2),
  .PCSRSVDOUT (PCSRSVDOUT),
  .PHYSTATUS (PHYSTATUS),
  .PMARSVDIN (PMARSVDIN),
  .PMARSVDIN2 (PMARSVDIN2),
  .QPLLCLK (QPLLCLK),
  .QPLLREFCLK (QPLLREFCLK),
  .RESETOVRD (RESETOVRD),
  .RX8B10BEN (RX8B10BEN),
  .RXBUFRESET (RXBUFRESET),
  .RXBUFSTATUS (RXBUFSTATUS),
  .RXBYTEISALIGNED (RXBYTEISALIGNED),
  .RXBYTEREALIGN (RXBYTEREALIGN),
  .RXCDRFREQRESET (RXCDRFREQRESET),
  .RXCDRHOLD (RXCDRHOLD),
  .RXCDRLOCK (RXCDRLOCK),
  .RXCDROVRDEN (RXCDROVRDEN),
  .RXCDRRESET (RXCDRRESET),
  .RXCDRRESETRSV (RXCDRRESETRSV),
  .RXCHANBONDSEQ (RXCHANBONDSEQ),
  .RXCHANISALIGNED (RXCHANISALIGNED),
  .RXCHANREALIGN (RXCHANREALIGN),
  .RXCHARISCOMMA (RXCHARISCOMMA),
  .RXCHARISK (RXCHARISK),
  .RXCHBONDEN (RXCHBONDEN),
  .RXCHBONDI (RXCHBONDI),
  .RXCHBONDLEVEL (RXCHBONDLEVEL),
  .RXCHBONDMASTER (RXCHBONDMASTER),
  .RXCHBONDO (RXCHBONDO),
  .RXCHBONDSLAVE (RXCHBONDSLAVE),
  .RXCLKCORCNT (RXCLKCORCNT),
  .RXCOMINITDET (RXCOMINITDET),
  .RXCOMMADET (RXCOMMADET),
  .RXCOMMADETEN (RXCOMMADETEN),
  .RXCOMSASDET (RXCOMSASDET),
  .RXCOMWAKEDET (RXCOMWAKEDET),
  .RXDATA (RXDATA),
  .RXDATAVALID (RXDATAVALID),
  .RXDDIEN (RXDDIEN),
  .RXDFEAGCHOLD (RXDFEAGCHOLD),
  .RXDFEAGCOVRDEN (RXDFEAGCOVRDEN),
  .RXDFECM1EN (RXDFECM1EN),
  .RXDFELFHOLD (RXDFELFHOLD),
  .RXDFELFOVRDEN (RXDFELFOVRDEN),
  .RXDFELPMRESET (RXDFELPMRESET),
  .RXDFETAP2HOLD (RXDFETAP2HOLD),
  .RXDFETAP2OVRDEN (RXDFETAP2OVRDEN),
  .RXDFETAP3HOLD (RXDFETAP3HOLD),
  .RXDFETAP3OVRDEN (RXDFETAP3OVRDEN),
  .RXDFETAP4HOLD (RXDFETAP4HOLD),
  .RXDFETAP4OVRDEN (RXDFETAP4OVRDEN),
  .RXDFETAP5HOLD (RXDFETAP5HOLD),
  .RXDFETAP5OVRDEN (RXDFETAP5OVRDEN),
  .RXDFEUTHOLD (RXDFEUTHOLD),
  .RXDFEUTOVRDEN (RXDFEUTOVRDEN),
  .RXDFEVPHOLD (RXDFEVPHOLD),
  .RXDFEVPOVRDEN (RXDFEVPOVRDEN),
  .RXDFEVSEN (RXDFEVSEN),
  .RXDFEXYDEN (RXDFEXYDEN),
  .RXDFEXYDHOLD (RXDFEXYDHOLD),
  .RXDFEXYDOVRDEN (RXDFEXYDOVRDEN),
  .RXDISPERR (RXDISPERR),
  .RXDLYBYPASS (RXDLYBYPASS),
  .RXDLYEN (RXDLYEN),
  .RXDLYOVRDEN (RXDLYOVRDEN),
  .RXDLYSRESET (RXDLYSRESET),
  .RXDLYSRESETDONE (RXDLYSRESETDONE),
  .RXELECIDLE (RXELECIDLE),
  .RXELECIDLEMODE (RXELECIDLEMODE),
  .RXGEARBOXSLIP (RXGEARBOXSLIP),
  .RXHEADER (RXHEADER),
  .RXHEADERVALID (RXHEADERVALID),
  .RXLPMEN (RXLPMEN),
  .RXLPMHFHOLD (RXLPMHFHOLD),
  .RXLPMHFOVRDEN (RXLPMHFOVRDEN),
  .RXLPMLFHOLD (RXLPMLFHOLD),
  .RXLPMLFKLOVRDEN (RXLPMLFKLOVRDEN),
  .RXMCOMMAALIGNEN (RXMCOMMAALIGNEN),
  .RXMONITOROUT (RXMONITOROUT),
  .RXMONITORSEL (RXMONITORSEL),
  .RXNOTINTABLE (RXNOTINTABLE),
  .RXOOBRESET (RXOOBRESET),
  .RXOSHOLD (RXOSHOLD),
  .RXOSOVRDEN (RXOSOVRDEN),
  .RXOUTCLK (RXOUTCLK),
  .RXOUTCLKFABRIC (RXOUTCLKFABRIC),
  .RXOUTCLKPCS (RXOUTCLKPCS),
  .RXOUTCLKSEL (RXOUTCLKSEL),
  .RXPCOMMAALIGNEN (RXPCOMMAALIGNEN),
  .RXPCSRESET (RXPCSRESET),
  .RXPD (RXPD),
  .RXPHALIGN (RXPHALIGN),
  .RXPHALIGNDONE (RXPHALIGNDONE),
  .RXPHALIGNEN (RXPHALIGNEN),
  .RXPHDLYPD (RXPHDLYPD),
  .RXPHDLYRESET (RXPHDLYRESET),
  .RXPHMONITOR (RXPHMONITOR),
  .RXPHOVRDEN (RXPHOVRDEN),
  .RXPHSLIPMONITOR (RXPHSLIPMONITOR),
  .RXPMARESET (RXPMARESET),
  .RXPOLARITY (RXPOLARITY),
  .RXPRBSCNTRESET (RXPRBSCNTRESET),
  .RXPRBSERR (RXPRBSERR),
  .RXPRBSSEL (RXPRBSSEL),
  .RXQPIEN (RXQPIEN),
  .RXQPISENN (RXQPISENN),
  .RXQPISENP (RXQPISENP),
  .RXRATE (RXRATE),
  .RXRATEDONE (RXRATEDONE),
  .RXRESETDONE (RXRESETDONE),
  .RXSLIDE (RXSLIDE),
  .RXSTARTOFSEQ (RXSTARTOFSEQ),
  .RXSTATUS (RXSTATUS),
  .RXSYSCLKSEL (RXSYSCLKSEL),
  .RXUSERRDY (RXUSERRDY),
  .RXUSRCLK (RXUSRCLK),
  .RXUSRCLK2 (RXUSRCLK2),
  .RXVALID (RXVALID),
  .SETERRSTATUS (SETERRSTATUS),
  .TSTIN (TSTIN),
  .TSTOUT (TSTOUT),
  .TX8B10BBYPASS (TX8B10BBYPASS),
  .TX8B10BEN (TX8B10BEN),
  .TXBUFDIFFCTRL (TXBUFDIFFCTRL),
  .TXBUFSTATUS (TXBUFSTATUS),
  .TXCHARDISPMODE (TXCHARDISPMODE),
  .TXCHARDISPVAL (TXCHARDISPVAL),
  .TXCHARISK (TXCHARISK),
  .TXCOMFINISH (TXCOMFINISH),
  .TXCOMINIT (TXCOMINIT),
  .TXCOMSAS (TXCOMSAS),
  .TXCOMWAKE (TXCOMWAKE),
  .TXDATA (TXDATA),
  .TXDEEMPH (TXDEEMPH),
  .TXDETECTRX (TXDETECTRX),
  .TXDIFFCTRL (TXDIFFCTRL),
  .TXDIFFPD (TXDIFFPD),
  .TXDLYBYPASS (TXDLYBYPASS),
  .TXDLYEN (TXDLYEN),
  .TXDLYHOLD (TXDLYHOLD),
  .TXDLYOVRDEN (TXDLYOVRDEN),
  .TXDLYSRESET (TXDLYSRESET),
  .TXDLYSRESETDONE (TXDLYSRESETDONE),
  .TXDLYUPDOWN (TXDLYUPDOWN),
  .TXELECIDLE (TXELECIDLE),
  .TXGEARBOXREADY (TXGEARBOXREADY),
  .TXHEADER (TXHEADER),
  .TXINHIBIT (TXINHIBIT),
  .TXMAINCURSOR (TXMAINCURSOR),
  .TXMARGIN (TXMARGIN),
  .TXOUTCLK (TXOUTCLK),
  .TXOUTCLKFABRIC (TXOUTCLKFABRIC),
  .TXOUTCLKPCS (TXOUTCLKPCS),
  .TXOUTCLKSEL (TXOUTCLKSEL),
  .TXPCSRESET (TXPCSRESET),
  .TXPD (TXPD),
  .TXPDELECIDLEMODE (TXPDELECIDLEMODE),
  .TXPHALIGN (TXPHALIGN),
  .TXPHALIGNDONE (TXPHALIGNDONE),
  .TXPHALIGNEN (TXPHALIGNEN),
  .TXPHDLYPD (TXPHDLYPD),
  .TXPHDLYRESET (TXPHDLYRESET),
  .TXPHDLYTSTCLK (TXPHDLYTSTCLK),
  .TXPHINIT (TXPHINIT),
  .TXPHINITDONE (TXPHINITDONE),
  .TXPHOVRDEN (TXPHOVRDEN),
  .TXPISOPD (TXPISOPD),
  .TXPMARESET (TXPMARESET),
  .TXPOLARITY (TXPOLARITY),
  .TXPOSTCURSOR (TXPOSTCURSOR),
  .TXPOSTCURSORINV (TXPOSTCURSORINV),
  .TXPRBSFORCEERR (TXPRBSFORCEERR),
  .TXPRBSSEL (TXPRBSSEL),
  .TXPRECURSOR (TXPRECURSOR),
  .TXPRECURSORINV (TXPRECURSORINV),
  .TXQPIBIASEN (TXQPIBIASEN),
  .TXQPISENN (TXQPISENN),
  .TXQPISENP (TXQPISENP),
  .TXQPISTRONGPDOWN (TXQPISTRONGPDOWN),
  .TXQPIWEAKPUP (TXQPIWEAKPUP),
  .TXRATE (TXRATE),
  .TXRATEDONE (TXRATEDONE),
  .TXRESETDONE (TXRESETDONE),
  .TXSEQUENCE (TXSEQUENCE),
  .TXSTARTSEQ (TXSTARTSEQ),
  .TXSWING (TXSWING),
  .TXSYSCLKSEL (TXSYSCLKSEL),
  .TXUSERRDY (TXUSERRDY),
  .TXUSRCLK (TXUSRCLK),
  .TXUSRCLK2 (TXUSRCLK2),
  .GSR(GSR)
);
endmodule
