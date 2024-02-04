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

`timescale 1ps/1fs
(* DowngradeIPIdentifiedWarnings = "yes" *)

module srio_sim;


  // {{{ local parameters -----------------

  // }}} End local parameters -------------


  // {{{ wire declarations ----------------


    wire            srio_rxn0;
    wire            srio_rxp0;
    wire            srio_rxn1;
    wire            srio_rxp1;
    wire            srio_rxn2;
    wire            srio_rxp2;
    wire            srio_rxn3;
    wire            srio_rxp3;

    wire            srio_txn0;
    wire            srio_txp0;
    wire            srio_txn1;
    wire            srio_txp1;
    wire            srio_txn2;
    wire            srio_txp2;
    wire            srio_txn3;
    wire            srio_txp3;

    reg             sys_clkp;
    wire            sys_clkn;
    reg             sys_rst;

    reg             simulation_finished = 0;
    wire    [7:0]   led0_primary;
    wire    [7:0]   led0_mirror;
    wire            link_initialized = led0_primary[4];
    wire            port_initialized = led0_primary[3];
    wire            autocheck_error_primary = led0_primary[6];
    wire            exercise_done_primary = led0_primary[7];
    // }}} End wire declarations ------------
    time sample_time =0;
    time min_period = 10000;
    time period = 10000;

    initial begin
      @(posedge port_initialized);
      forever begin  
        @(posedge srio_txp0);
         sample_time    = $time;
        @(negedge srio_txp0);
         period = $time-sample_time;
        if(period < min_period) begin
          min_period = period;
        end
      end
    end


  // {{{ SRIO_EXAMPLE_DESIGN (primary) instantation -----------------
  srio_example_top_srio_gen2_0
 //// NOTE: uncomment these lines to simulate packet transfer
 // #(
 //    .SIM_ONLY                (0), // mirror object handles reporting
 //    .VALIDATION_FEATURES     (1),
 //    .QUICK_STARTUP           (1),
 //    .USE_CHIPSCOPE           (0),
 //    .STATISTICS_GATHERING    (1) 
 //   )
   srio_example_top_primary
     (.sys_clkp                (sys_clkp),
      .sys_clkn                (sys_clkn),

      .sys_rst                 (sys_rst),

      .srio_rxn0               (srio_rxn0),
      .srio_rxp0               (srio_rxp0),

      .srio_txn0               (srio_txn0),
      .srio_txp0               (srio_txp0),

      .sim_train_en            (1'b1),
      .led0                    (led0_primary)

     );
  // }}} End of SRIO_EXAMPLE_DESIGN (primary) instantiation ---------


  // {{{ SRIO_EXAMPLE_DESIGN (mirror) instantation ------------------
  srio_example_top_srio_gen2_0
 //// NOTE: uncomment these lines to simulate packet transfer
 //  #(
 //     .SIM_ONLY                (1),
 //     .VALIDATION_FEATURES     (1),
 //     .QUICK_STARTUP           (0),
 //     .USE_CHIPSCOPE           (0),
 //     .STATISTICS_GATHERING    (1) 
 //    )
   srio_example_top_mirror
     (.sys_clkp                (sys_clkp),
      .sys_clkn                (sys_clkn),

      .sys_rst                 (sys_rst),

      // cross over serial data lines here
      .srio_rxn0               (srio_txn0),
      .srio_rxp0               (srio_txp0),

      .srio_txn0               (srio_rxn0),
      .srio_txp0               (srio_rxp0),

      .sim_train_en            (1'b1),
      .led0                    (led0_mirror)
     );
  // }}} End of SRIO_EXAMPLE_DESIGN (mirror) instantiation ----------


  // system clock generator
  // 125 MHz
  initial begin
    sys_clkp = 1'b0;
    forever #4000 sys_clkp = ~sys_clkp;
  end
  assign sys_clkn = ~sys_clkp;

  // reset generator
  initial begin
    sys_rst = 1'b1;
    #10000
    sys_rst = 1'b0;
  end

  // Monitor for a testbench time-out and stop the test after a reasonable
  // amount of time if the test hasn't finished.
  initial begin
    fork : sim_in_progress
      begin
      @(posedge simulation_finished) disable sim_in_progress;
      end
      begin
        repeat(1000) begin
          #8000000; // increased from 600000 to compensate the ies/ges devices
        end
        disable sim_in_progress;
      end
    join
    if (!simulation_finished) begin
      $display("#################################################################");
      $display("################## ERROR: TEST FAILED !!!!! #####################");
      $display("#################### Testbench Timed Out! #######################");
      $display("#########################  (%0t)  #########################",$time);
      $display("#################################################################");
      $stop;
    end
  end

  initial begin
      #100000;
      $display("\n");
      $display("*****************************************************************");
      $display("Waiting for Link Initialization.");
      $display("This may take some time.");
      $display("*****************************************************************");
      $display("\n");
  end

  always @(posedge port_initialized) begin
      #1000;
      $display("\n");
      $display("*****************************************************************");
      $display("********************Port Initialized*****************************");
      $display("*****************************************************************");
      $display("\n");
  end

  always @(posedge link_initialized) begin
      #1000;
      $display("\n");
      $display("*****************************************************************");
      $display("********************Link Initialized*****************************");
      $display("*****************************************************************");
      $display("\n");
      if((1000.000/min_period) != 5.0) begin
        $display("ERROR: Incorrect line rate: %0g, expected: 5.0",(1000.000/min_period));
        $finish;
      end
  end

  always @(posedge sys_clkp) begin
    if (link_initialized && port_initialized) begin
      if (exercise_done_primary) begin
        simulation_finished = 1'b1;
        #1000;
        $display("\n");
        $display("*****************************************************************");
        $display("**************** Test Completed Successfully ********************");
        $display("************* All Packets Checked and Accounted For *************");
        $display("*****************************************************************");
        $display("\n");
        $finish;
      end
    end
  end

  always @(posedge sys_clkp) begin
    if (autocheck_error_primary) begin
      simulation_finished = 1'b1;
      #1000;
      $display("\n");
      $display("*****************************************************************");
      $display("******************** ERROR: TEST FAILED *************************");
      $display("************ Packet Miscompare or Packet Corruption *************");
      $display("*****************************************************************");
      $display("\n");
      $finish;
    end
  end

endmodule
