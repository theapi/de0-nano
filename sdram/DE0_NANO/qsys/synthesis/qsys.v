// qsys.v

// Generated using ACDS version 15.1 185

`timescale 1 ps / 1 ps
module qsys (
		input  wire        clk_clk,                            //                        clk.clk
		input  wire        reset_reset_n,                      //                      reset.reset_n
		input  wire        sdram_clock_areset_conduit_export,  // sdram_clock_areset_conduit.export
		output wire        sdram_clock_c0_clk,                 //             sdram_clock_c0.clk
		input  wire        sdram_read_control_fixed_location,  //         sdram_read_control.fixed_location
		input  wire [31:0] sdram_read_control_read_base,       //                           .read_base
		input  wire [31:0] sdram_read_control_read_length,     //                           .read_length
		input  wire        sdram_read_control_go,              //                           .go
		output wire        sdram_read_control_done,            //                           .done
		output wire        sdram_read_control_early_done,      //                           .early_done
		input  wire        sdram_read_user_read_buffer,        //            sdram_read_user.read_buffer
		output wire [15:0] sdram_read_user_buffer_output_data, //                           .buffer_output_data
		output wire        sdram_read_user_data_available,     //                           .data_available
		output wire [12:0] sdram_wire_addr,                    //                 sdram_wire.addr
		output wire [1:0]  sdram_wire_ba,                      //                           .ba
		output wire        sdram_wire_cas_n,                   //                           .cas_n
		output wire        sdram_wire_cke,                     //                           .cke
		output wire        sdram_wire_cs_n,                    //                           .cs_n
		inout  wire [15:0] sdram_wire_dq,                      //                           .dq
		output wire [1:0]  sdram_wire_dqm,                     //                           .dqm
		output wire        sdram_wire_ras_n,                   //                           .ras_n
		output wire        sdram_wire_we_n,                    //                           .we_n
		input  wire        sdram_write_control_fixed_location, //        sdram_write_control.fixed_location
		input  wire [31:0] sdram_write_control_write_base,     //                           .write_base
		input  wire [31:0] sdram_write_control_write_length,   //                           .write_length
		input  wire        sdram_write_control_go,             //                           .go
		output wire        sdram_write_control_done,           //                           .done
		input  wire        sdram_write_user_write_buffer,      //           sdram_write_user.write_buffer
		input  wire [15:0] sdram_write_user_buffer_input_data, //                           .buffer_input_data
		output wire        sdram_write_user_buffer_full        //                           .buffer_full
	);

	wire  [15:0] sdram_read_avalon_master_readdata;        // mm_interconnect_0:sdram_read_avalon_master_readdata -> sdram_read:master_readdata
	wire         sdram_read_avalon_master_waitrequest;     // mm_interconnect_0:sdram_read_avalon_master_waitrequest -> sdram_read:master_waitrequest
	wire  [31:0] sdram_read_avalon_master_address;         // sdram_read:master_address -> mm_interconnect_0:sdram_read_avalon_master_address
	wire         sdram_read_avalon_master_read;            // sdram_read:master_read -> mm_interconnect_0:sdram_read_avalon_master_read
	wire   [1:0] sdram_read_avalon_master_byteenable;      // sdram_read:master_byteenable -> mm_interconnect_0:sdram_read_avalon_master_byteenable
	wire         sdram_read_avalon_master_readdatavalid;   // mm_interconnect_0:sdram_read_avalon_master_readdatavalid -> sdram_read:master_readdatavalid
	wire         sdram_write_avalon_master_waitrequest;    // mm_interconnect_0:sdram_write_avalon_master_waitrequest -> sdram_write:master_waitrequest
	wire  [31:0] sdram_write_avalon_master_address;        // sdram_write:master_address -> mm_interconnect_0:sdram_write_avalon_master_address
	wire   [1:0] sdram_write_avalon_master_byteenable;     // sdram_write:master_byteenable -> mm_interconnect_0:sdram_write_avalon_master_byteenable
	wire         sdram_write_avalon_master_write;          // sdram_write:master_write -> mm_interconnect_0:sdram_write_avalon_master_write
	wire  [15:0] sdram_write_avalon_master_writedata;      // sdram_write:master_writedata -> mm_interconnect_0:sdram_write_avalon_master_writedata
	wire         mm_interconnect_0_sdram_s1_chipselect;    // mm_interconnect_0:sdram_s1_chipselect -> sdram:az_cs
	wire  [15:0] mm_interconnect_0_sdram_s1_readdata;      // sdram:za_data -> mm_interconnect_0:sdram_s1_readdata
	wire         mm_interconnect_0_sdram_s1_waitrequest;   // sdram:za_waitrequest -> mm_interconnect_0:sdram_s1_waitrequest
	wire  [23:0] mm_interconnect_0_sdram_s1_address;       // mm_interconnect_0:sdram_s1_address -> sdram:az_addr
	wire         mm_interconnect_0_sdram_s1_read;          // mm_interconnect_0:sdram_s1_read -> sdram:az_rd_n
	wire   [1:0] mm_interconnect_0_sdram_s1_byteenable;    // mm_interconnect_0:sdram_s1_byteenable -> sdram:az_be_n
	wire         mm_interconnect_0_sdram_s1_readdatavalid; // sdram:za_valid -> mm_interconnect_0:sdram_s1_readdatavalid
	wire         mm_interconnect_0_sdram_s1_write;         // mm_interconnect_0:sdram_s1_write -> sdram:az_wr_n
	wire  [15:0] mm_interconnect_0_sdram_s1_writedata;     // mm_interconnect_0:sdram_s1_writedata -> sdram:az_data
	wire         rst_controller_reset_out_reset;           // rst_controller:reset_out -> [mm_interconnect_0:sdram_read_clock_reset_reset_reset_bridge_in_reset_reset, sdram:reset_n, sdram_clock:reset, sdram_read:reset, sdram_write:reset]

	qsys_sdram sdram (
		.clk            (clk_clk),                                  //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),          // reset.reset_n
		.az_addr        (mm_interconnect_0_sdram_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_sdram_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_sdram_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_sdram_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_sdram_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_sdram_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_sdram_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_sdram_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_sdram_s1_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_wire_addr),                          //  wire.export
		.zs_ba          (sdram_wire_ba),                            //      .export
		.zs_cas_n       (sdram_wire_cas_n),                         //      .export
		.zs_cke         (sdram_wire_cke),                           //      .export
		.zs_cs_n        (sdram_wire_cs_n),                          //      .export
		.zs_dq          (sdram_wire_dq),                            //      .export
		.zs_dqm         (sdram_wire_dqm),                           //      .export
		.zs_ras_n       (sdram_wire_ras_n),                         //      .export
		.zs_we_n        (sdram_wire_we_n)                           //      .export
	);

	qsys_sdram_clock sdram_clock (
		.clk       (clk_clk),                           //       inclk_interface.clk
		.reset     (rst_controller_reset_out_reset),    // inclk_interface_reset.reset
		.read      (),                                  //             pll_slave.read
		.write     (),                                  //                      .write
		.address   (),                                  //                      .address
		.readdata  (),                                  //                      .readdata
		.writedata (),                                  //                      .writedata
		.c0        (sdram_clock_c0_clk),                //                    c0.clk
		.areset    (sdram_clock_areset_conduit_export), //        areset_conduit.export
		.locked    (),                                  //        locked_conduit.export
		.phasedone ()                                   //     phasedone_conduit.export
	);

	custom_master #(
		.MASTER_DIRECTION    (0),
		.DATA_WIDTH          (16),
		.ADDRESS_WIDTH       (32),
		.BURST_CAPABLE       (0),
		.MAXIMUM_BURST_COUNT (2),
		.BURST_COUNT_WIDTH   (2),
		.FIFO_DEPTH          (16),
		.FIFO_DEPTH_LOG2     (4),
		.MEMORY_BASED_FIFO   (0)
	) sdram_read (
		.clk                     (clk_clk),                                //       clock_reset.clk
		.reset                   (rst_controller_reset_out_reset),         // clock_reset_reset.reset
		.master_address          (sdram_read_avalon_master_address),       //     avalon_master.address
		.master_read             (sdram_read_avalon_master_read),          //                  .read
		.master_byteenable       (sdram_read_avalon_master_byteenable),    //                  .byteenable
		.master_readdata         (sdram_read_avalon_master_readdata),      //                  .readdata
		.master_readdatavalid    (sdram_read_avalon_master_readdatavalid), //                  .readdatavalid
		.master_waitrequest      (sdram_read_avalon_master_waitrequest),   //                  .waitrequest
		.control_fixed_location  (sdram_read_control_fixed_location),      //           control.export
		.control_read_base       (sdram_read_control_read_base),           //                  .export
		.control_read_length     (sdram_read_control_read_length),         //                  .export
		.control_go              (sdram_read_control_go),                  //                  .export
		.control_done            (sdram_read_control_done),                //                  .export
		.control_early_done      (sdram_read_control_early_done),          //                  .export
		.user_read_buffer        (sdram_read_user_read_buffer),            //              user.export
		.user_buffer_output_data (sdram_read_user_buffer_output_data),     //                  .export
		.user_data_available     (sdram_read_user_data_available),         //                  .export
		.master_write            (),                                       //       (terminated)
		.master_writedata        (),                                       //       (terminated)
		.master_burstcount       (),                                       //       (terminated)
		.control_write_base      (32'b00000000000000000000000000000000),   //       (terminated)
		.control_write_length    (32'b00000000000000000000000000000000),   //       (terminated)
		.user_write_buffer       (1'b0),                                   //       (terminated)
		.user_buffer_input_data  (16'b0000000000000000),                   //       (terminated)
		.user_buffer_full        ()                                        //       (terminated)
	);

	custom_master #(
		.MASTER_DIRECTION    (1),
		.DATA_WIDTH          (16),
		.ADDRESS_WIDTH       (32),
		.BURST_CAPABLE       (0),
		.MAXIMUM_BURST_COUNT (2),
		.BURST_COUNT_WIDTH   (2),
		.FIFO_DEPTH          (8),
		.FIFO_DEPTH_LOG2     (3),
		.MEMORY_BASED_FIFO   (0)
	) sdram_write (
		.clk                     (clk_clk),                               //       clock_reset.clk
		.reset                   (rst_controller_reset_out_reset),        // clock_reset_reset.reset
		.master_address          (sdram_write_avalon_master_address),     //     avalon_master.address
		.master_write            (sdram_write_avalon_master_write),       //                  .write
		.master_byteenable       (sdram_write_avalon_master_byteenable),  //                  .byteenable
		.master_writedata        (sdram_write_avalon_master_writedata),   //                  .writedata
		.master_waitrequest      (sdram_write_avalon_master_waitrequest), //                  .waitrequest
		.control_fixed_location  (sdram_write_control_fixed_location),    //           control.export
		.control_write_base      (sdram_write_control_write_base),        //                  .export
		.control_write_length    (sdram_write_control_write_length),      //                  .export
		.control_go              (sdram_write_control_go),                //                  .export
		.control_done            (sdram_write_control_done),              //                  .export
		.user_write_buffer       (sdram_write_user_write_buffer),         //              user.export
		.user_buffer_input_data  (sdram_write_user_buffer_input_data),    //                  .export
		.user_buffer_full        (sdram_write_user_buffer_full),          //                  .export
		.master_read             (),                                      //       (terminated)
		.master_readdata         (16'b0000000000000000),                  //       (terminated)
		.master_readdatavalid    (1'b0),                                  //       (terminated)
		.master_burstcount       (),                                      //       (terminated)
		.control_read_base       (32'b00000000000000000000000000000000),  //       (terminated)
		.control_read_length     (32'b00000000000000000000000000000000),  //       (terminated)
		.control_early_done      (),                                      //       (terminated)
		.user_read_buffer        (1'b0),                                  //       (terminated)
		.user_buffer_output_data (),                                      //       (terminated)
		.user_data_available     ()                                       //       (terminated)
	);

	qsys_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                                              (clk_clk),                                  //                                            clk_clk.clk
		.sdram_read_clock_reset_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),           // sdram_read_clock_reset_reset_reset_bridge_in_reset.reset
		.sdram_read_avalon_master_address                         (sdram_read_avalon_master_address),         //                           sdram_read_avalon_master.address
		.sdram_read_avalon_master_waitrequest                     (sdram_read_avalon_master_waitrequest),     //                                                   .waitrequest
		.sdram_read_avalon_master_byteenable                      (sdram_read_avalon_master_byteenable),      //                                                   .byteenable
		.sdram_read_avalon_master_read                            (sdram_read_avalon_master_read),            //                                                   .read
		.sdram_read_avalon_master_readdata                        (sdram_read_avalon_master_readdata),        //                                                   .readdata
		.sdram_read_avalon_master_readdatavalid                   (sdram_read_avalon_master_readdatavalid),   //                                                   .readdatavalid
		.sdram_write_avalon_master_address                        (sdram_write_avalon_master_address),        //                          sdram_write_avalon_master.address
		.sdram_write_avalon_master_waitrequest                    (sdram_write_avalon_master_waitrequest),    //                                                   .waitrequest
		.sdram_write_avalon_master_byteenable                     (sdram_write_avalon_master_byteenable),     //                                                   .byteenable
		.sdram_write_avalon_master_write                          (sdram_write_avalon_master_write),          //                                                   .write
		.sdram_write_avalon_master_writedata                      (sdram_write_avalon_master_writedata),      //                                                   .writedata
		.sdram_s1_address                                         (mm_interconnect_0_sdram_s1_address),       //                                           sdram_s1.address
		.sdram_s1_write                                           (mm_interconnect_0_sdram_s1_write),         //                                                   .write
		.sdram_s1_read                                            (mm_interconnect_0_sdram_s1_read),          //                                                   .read
		.sdram_s1_readdata                                        (mm_interconnect_0_sdram_s1_readdata),      //                                                   .readdata
		.sdram_s1_writedata                                       (mm_interconnect_0_sdram_s1_writedata),     //                                                   .writedata
		.sdram_s1_byteenable                                      (mm_interconnect_0_sdram_s1_byteenable),    //                                                   .byteenable
		.sdram_s1_readdatavalid                                   (mm_interconnect_0_sdram_s1_readdatavalid), //                                                   .readdatavalid
		.sdram_s1_waitrequest                                     (mm_interconnect_0_sdram_s1_waitrequest),   //                                                   .waitrequest
		.sdram_s1_chipselect                                      (mm_interconnect_0_sdram_s1_chipselect)     //                                                   .chipselect
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
