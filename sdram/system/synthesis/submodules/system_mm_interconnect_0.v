// system_mm_interconnect_0.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 15.1 185

`timescale 1 ps / 1 ps
module system_mm_interconnect_0 (
		input  wire        clk_clk_clk,                                              //                                            clk_clk.clk
		input  wire        sdram_read_clock_reset_reset_reset_bridge_in_reset_reset, // sdram_read_clock_reset_reset_reset_bridge_in_reset.reset
		input  wire [24:0] sdram_read_avalon_master_address,                         //                           sdram_read_avalon_master.address
		output wire        sdram_read_avalon_master_waitrequest,                     //                                                   .waitrequest
		input  wire [1:0]  sdram_read_avalon_master_byteenable,                      //                                                   .byteenable
		input  wire        sdram_read_avalon_master_read,                            //                                                   .read
		output wire [15:0] sdram_read_avalon_master_readdata,                        //                                                   .readdata
		output wire        sdram_read_avalon_master_readdatavalid,                   //                                                   .readdatavalid
		output wire [23:0] sdram_s1_address,                                         //                                           sdram_s1.address
		output wire        sdram_s1_write,                                           //                                                   .write
		output wire        sdram_s1_read,                                            //                                                   .read
		input  wire [15:0] sdram_s1_readdata,                                        //                                                   .readdata
		output wire [15:0] sdram_s1_writedata,                                       //                                                   .writedata
		output wire [1:0]  sdram_s1_byteenable,                                      //                                                   .byteenable
		input  wire        sdram_s1_readdatavalid,                                   //                                                   .readdatavalid
		input  wire        sdram_s1_waitrequest,                                     //                                                   .waitrequest
		output wire        sdram_s1_chipselect                                       //                                                   .chipselect
	);

	wire         sdram_read_avalon_master_translator_avalon_universal_master_0_waitrequest;   // sdram_s1_translator:uav_waitrequest -> sdram_read_avalon_master_translator:uav_waitrequest
	wire  [15:0] sdram_read_avalon_master_translator_avalon_universal_master_0_readdata;      // sdram_s1_translator:uav_readdata -> sdram_read_avalon_master_translator:uav_readdata
	wire         sdram_read_avalon_master_translator_avalon_universal_master_0_debugaccess;   // sdram_read_avalon_master_translator:uav_debugaccess -> sdram_s1_translator:uav_debugaccess
	wire  [24:0] sdram_read_avalon_master_translator_avalon_universal_master_0_address;       // sdram_read_avalon_master_translator:uav_address -> sdram_s1_translator:uav_address
	wire         sdram_read_avalon_master_translator_avalon_universal_master_0_read;          // sdram_read_avalon_master_translator:uav_read -> sdram_s1_translator:uav_read
	wire   [1:0] sdram_read_avalon_master_translator_avalon_universal_master_0_byteenable;    // sdram_read_avalon_master_translator:uav_byteenable -> sdram_s1_translator:uav_byteenable
	wire         sdram_read_avalon_master_translator_avalon_universal_master_0_readdatavalid; // sdram_s1_translator:uav_readdatavalid -> sdram_read_avalon_master_translator:uav_readdatavalid
	wire         sdram_read_avalon_master_translator_avalon_universal_master_0_lock;          // sdram_read_avalon_master_translator:uav_lock -> sdram_s1_translator:uav_lock
	wire         sdram_read_avalon_master_translator_avalon_universal_master_0_write;         // sdram_read_avalon_master_translator:uav_write -> sdram_s1_translator:uav_write
	wire  [15:0] sdram_read_avalon_master_translator_avalon_universal_master_0_writedata;     // sdram_read_avalon_master_translator:uav_writedata -> sdram_s1_translator:uav_writedata
	wire   [1:0] sdram_read_avalon_master_translator_avalon_universal_master_0_burstcount;    // sdram_read_avalon_master_translator:uav_burstcount -> sdram_s1_translator:uav_burstcount

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (25),
		.AV_DATA_W                   (16),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (2),
		.UAV_ADDRESS_W               (25),
		.UAV_BURSTCOUNT_W            (2),
		.USE_READ                    (1),
		.USE_WRITE                   (0),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (2),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) sdram_read_avalon_master_translator (
		.clk                    (clk_clk_clk),                                                                 //                       clk.clk
		.reset                  (sdram_read_clock_reset_reset_reset_bridge_in_reset_reset),                    //                     reset.reset
		.uav_address            (sdram_read_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount         (sdram_read_avalon_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read               (sdram_read_avalon_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write              (sdram_read_avalon_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest        (sdram_read_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid      (sdram_read_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable         (sdram_read_avalon_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata           (sdram_read_avalon_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata          (sdram_read_avalon_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock               (sdram_read_avalon_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess        (sdram_read_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address             (sdram_read_avalon_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest         (sdram_read_avalon_master_waitrequest),                                        //                          .waitrequest
		.av_byteenable          (sdram_read_avalon_master_byteenable),                                         //                          .byteenable
		.av_read                (sdram_read_avalon_master_read),                                               //                          .read
		.av_readdata            (sdram_read_avalon_master_readdata),                                           //                          .readdata
		.av_readdatavalid       (sdram_read_avalon_master_readdatavalid),                                      //                          .readdatavalid
		.av_burstcount          (1'b1),                                                                        //               (terminated)
		.av_beginbursttransfer  (1'b0),                                                                        //               (terminated)
		.av_begintransfer       (1'b0),                                                                        //               (terminated)
		.av_chipselect          (1'b0),                                                                        //               (terminated)
		.av_write               (1'b0),                                                                        //               (terminated)
		.av_writedata           (16'b0000000000000000),                                                        //               (terminated)
		.av_lock                (1'b0),                                                                        //               (terminated)
		.av_debugaccess         (1'b0),                                                                        //               (terminated)
		.uav_clken              (),                                                                            //               (terminated)
		.av_clken               (1'b1),                                                                        //               (terminated)
		.uav_response           (2'b00),                                                                       //               (terminated)
		.av_response            (),                                                                            //               (terminated)
		.uav_writeresponsevalid (1'b0),                                                                        //               (terminated)
		.av_writeresponsevalid  ()                                                                             //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (24),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (16),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (2),
		.UAV_BYTEENABLE_W               (2),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (2),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (1),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (2),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) sdram_s1_translator (
		.clk                    (clk_clk_clk),                                                                 //                      clk.clk
		.reset                  (sdram_read_clock_reset_reset_reset_bridge_in_reset_reset),                    //                    reset.reset
		.uav_address            (sdram_read_avalon_master_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount         (sdram_read_avalon_master_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read               (sdram_read_avalon_master_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write              (sdram_read_avalon_master_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest        (sdram_read_avalon_master_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid      (sdram_read_avalon_master_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable         (sdram_read_avalon_master_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata           (sdram_read_avalon_master_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata          (sdram_read_avalon_master_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock               (sdram_read_avalon_master_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess        (sdram_read_avalon_master_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address             (sdram_s1_address),                                                            //      avalon_anti_slave_0.address
		.av_write               (sdram_s1_write),                                                              //                         .write
		.av_read                (sdram_s1_read),                                                               //                         .read
		.av_readdata            (sdram_s1_readdata),                                                           //                         .readdata
		.av_writedata           (sdram_s1_writedata),                                                          //                         .writedata
		.av_byteenable          (sdram_s1_byteenable),                                                         //                         .byteenable
		.av_readdatavalid       (sdram_s1_readdatavalid),                                                      //                         .readdatavalid
		.av_waitrequest         (sdram_s1_waitrequest),                                                        //                         .waitrequest
		.av_chipselect          (sdram_s1_chipselect),                                                         //                         .chipselect
		.av_begintransfer       (),                                                                            //              (terminated)
		.av_beginbursttransfer  (),                                                                            //              (terminated)
		.av_burstcount          (),                                                                            //              (terminated)
		.av_writebyteenable     (),                                                                            //              (terminated)
		.av_lock                (),                                                                            //              (terminated)
		.av_clken               (),                                                                            //              (terminated)
		.uav_clken              (1'b0),                                                                        //              (terminated)
		.av_debugaccess         (),                                                                            //              (terminated)
		.av_outputenable        (),                                                                            //              (terminated)
		.uav_response           (),                                                                            //              (terminated)
		.av_response            (2'b00),                                                                       //              (terminated)
		.uav_writeresponsevalid (),                                                                            //              (terminated)
		.av_writeresponsevalid  (1'b0)                                                                         //              (terminated)
	);

endmodule