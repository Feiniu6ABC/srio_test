`timescale 1ps / 1ps

module GTXE2_COMMON_WRAP #(  // Verilog-2001
  parameter BIAS_CFG = "0000040000001000",
  parameter COMMON_CFG = "00000000",
  parameter QPLL_CFG = "0680181",
  parameter QPLL_CLKOUT_CFG = "0000",
  parameter QPLL_COARSE_FREQ_OVRD = "010000",
  parameter QPLL_COARSE_FREQ_OVRD_EN = "0",
  parameter QPLL_CP = "0000011111",
  parameter QPLL_CP_MONITOR_EN = "0",
  parameter QPLL_DMONITOR_SEL = "0",
  parameter QPLL_FBDIV = "0000000000",
  parameter QPLL_FBDIV_MONITOR_EN = "0",
  parameter QPLL_FBDIV_RATIO = "0",
  parameter QPLL_INIT_CFG = "000006",
  parameter QPLL_LOCK_CFG = "21E8",
  parameter QPLL_LPF = "1111",
  parameter integer QPLL_REFCLK_DIV = 2,
  parameter SIM_QPLLREFCLK_SEL = "001",
  parameter SIM_RESET_SPEEDUP = "TRUE",
  parameter SIM_VERSION = "3.0"
  ) (
  output [15:0] DRPDO,
  output DRPRDY,
  output [7:0] QPLLDMONITOR,
  output QPLLFBCLKLOST,
  output QPLLLOCK,
  output QPLLOUTCLK,
  output QPLLOUTREFCLK,
  output QPLLREFCLKLOST,
  output REFCLKOUTMONITOR,
  input BGBYPASSB,
  input BGMONITORENB,
  input BGPDB,
  input [4:0] BGRCALOVRD,
  input [7:0] DRPADDR,
  input DRPCLK,
  input [15:0] DRPDI,
  input DRPEN,
  input DRPWE,
  input GTGREFCLK,
  input GTNORTHREFCLK0,
  input GTNORTHREFCLK1,
  input GTREFCLK0,
  input GTREFCLK1,
  input GTSOUTHREFCLK0,
  input GTSOUTHREFCLK1,
  input [7:0] PMARSVD,
  input QPLLLOCKDETCLK,
  input QPLLLOCKEN,
  input QPLLOUTRESET,
  input QPLLPD,
  input [2:0] QPLLREFCLKSEL,
  input QPLLRESET,
  input [15:0] QPLLRSVD1,
  input [4:0] QPLLRSVD2,
  input RCALENB,
  input GSR
);

`pragma begin_decoded privkey="CDS_RSA_KEY", key_keyname="cds_rsa_key", key_keyowner="Cadence Design Systems."
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

localparam [63:0] BIAS_CFG_conv = convert(BIAS_CFG);
localparam [31:0] COMMON_CFG_conv = convert(COMMON_CFG);
localparam [26:0] QPLL_CFG_conv = convert(QPLL_CFG);
localparam [3:0] QPLL_CLKOUT_CFG_conv = convertbin(QPLL_CLKOUT_CFG);
localparam [5:0] QPLL_COARSE_FREQ_OVRD_conv = convertbin(QPLL_COARSE_FREQ_OVRD);
localparam [0:0] QPLL_COARSE_FREQ_OVRD_EN_conv = convertbin(QPLL_COARSE_FREQ_OVRD_EN);
localparam [9:0] QPLL_CP_conv = convertbin(QPLL_CP);
localparam [0:0] QPLL_CP_MONITOR_EN_conv = convertbin(QPLL_CP_MONITOR_EN);
localparam [0:0] QPLL_DMONITOR_SEL_conv = convertbin(QPLL_DMONITOR_SEL);
localparam [9:0] QPLL_FBDIV_conv = convertbin(QPLL_FBDIV);
localparam [0:0] QPLL_FBDIV_MONITOR_EN_conv = convertbin(QPLL_FBDIV_MONITOR_EN);
localparam [0:0] QPLL_FBDIV_RATIO_conv = convertbin(QPLL_FBDIV_RATIO);
localparam [23:0] QPLL_INIT_CFG_conv = convert(QPLL_INIT_CFG);
localparam [15:0] QPLL_LOCK_CFG_conv = convert(QPLL_LOCK_CFG);
localparam [3:0] QPLL_LPF_conv = convertbin(QPLL_LPF);
localparam [2:0] SIM_QPLLREFCLK_SEL_conv = convertbin(SIM_QPLLREFCLK_SEL);
B_GTXE2_COMMON #(
  .BIAS_CFG (BIAS_CFG_conv),
  .COMMON_CFG (COMMON_CFG_conv),
  .QPLL_CFG (QPLL_CFG_conv),
  .QPLL_CLKOUT_CFG (QPLL_CLKOUT_CFG_conv),
  .QPLL_COARSE_FREQ_OVRD (QPLL_COARSE_FREQ_OVRD_conv),
  .QPLL_COARSE_FREQ_OVRD_EN (QPLL_COARSE_FREQ_OVRD_EN_conv),
  .QPLL_CP (QPLL_CP_conv),
  .QPLL_CP_MONITOR_EN (QPLL_CP_MONITOR_EN_conv),
  .QPLL_DMONITOR_SEL (QPLL_DMONITOR_SEL_conv),
  .QPLL_FBDIV (QPLL_FBDIV_conv),
  .QPLL_FBDIV_MONITOR_EN (QPLL_FBDIV_MONITOR_EN_conv),
  .QPLL_FBDIV_RATIO (QPLL_FBDIV_RATIO_conv),
  .QPLL_INIT_CFG (QPLL_INIT_CFG_conv),
  .QPLL_LOCK_CFG (QPLL_LOCK_CFG_conv),
  .QPLL_LPF (QPLL_LPF_conv),
  .QPLL_REFCLK_DIV (QPLL_REFCLK_DIV),
  .SIM_QPLLREFCLK_SEL (SIM_QPLLREFCLK_SEL_conv),
  .SIM_RESET_SPEEDUP (SIM_RESET_SPEEDUP),
  .SIM_VERSION (SIM_VERSION)
  )
  B_GTXE2_COMMON_INST (
  .BGBYPASSB (BGBYPASSB),
  .BGMONITORENB (BGMONITORENB),
  .BGPDB (BGPDB),
  .BGRCALOVRD (BGRCALOVRD),
  .DRPADDR (DRPADDR),
  .DRPCLK (DRPCLK),
  .DRPDI (DRPDI),
  .DRPDO (DRPDO),
  .DRPEN (DRPEN),
  .DRPRDY (DRPRDY),
  .DRPWE (DRPWE),
  .GTGREFCLK (GTGREFCLK),
  .GTNORTHREFCLK0 (GTNORTHREFCLK0),
  .GTNORTHREFCLK1 (GTNORTHREFCLK1),
  .GTREFCLK0 (GTREFCLK0),
  .GTREFCLK1 (GTREFCLK1),
  .GTSOUTHREFCLK0 (GTSOUTHREFCLK0),
  .GTSOUTHREFCLK1 (GTSOUTHREFCLK1),
  .PMARSVD (PMARSVD),
  .QPLLDMONITOR (QPLLDMONITOR),
  .QPLLFBCLKLOST (QPLLFBCLKLOST),
  .QPLLLOCK (QPLLLOCK),
  .QPLLLOCKDETCLK (QPLLLOCKDETCLK),
  .QPLLLOCKEN (QPLLLOCKEN),
  .QPLLOUTCLK (QPLLOUTCLK),
  .QPLLOUTREFCLK (QPLLOUTREFCLK),
  .QPLLOUTRESET (QPLLOUTRESET),
  .QPLLPD (QPLLPD),
  .QPLLREFCLKLOST (QPLLREFCLKLOST),
  .QPLLREFCLKSEL (QPLLREFCLKSEL),
  .QPLLRESET (QPLLRESET),
  .QPLLRSVD1 (QPLLRSVD1),
  .QPLLRSVD2 (QPLLRSVD2),
  .RCALENB (RCALENB),
  .REFCLKOUTMONITOR (REFCLKOUTMONITOR),
  .GSR(GSR)
);
endmodule
`pragma end_decoded
