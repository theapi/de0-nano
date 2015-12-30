
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE0_NANO(

	//////////// CLOCK //////////
	CLOCK_50,

	//////////// LED //////////
	LED,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;

//////////// LED //////////
output		     [7:0]		LED;

//////////// KEY //////////
input 		     [1:0]		KEY;

//////////// SW //////////
input 		     [3:0]		SW;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [15:0]		DRAM_DQ;
output		     [1:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;


//=======================================================
//  REG/WIRE declarations
//=======================================================


//////////// AVALON CONNECTOR //////////
wire		[31:0] read_base;
wire		read_go;
reg		[31:0] r_read_base;
reg		r_read_go;
wire		qsys_sdram_read_control_done;
wire		qsys_sdram_read_control_early_done;
wire		read_buffer;
reg		r_read_buffer;
wire		[15:0] read_buffer_output_data;
wire		read_data_available;


wire [31:0]	write_base;
wire        write_go;
wire [15:0]	buffer_input_data;
wire		qsys_sdram_write_user_buffer_full;
wire		qsys_sdram_write_control_done;
reg	[31:0]	r_write_base;
reg		    r_write_go;
reg		    r_write_buffer;
reg	[15:0]	r_buffer_input_data;

reg [15:0] r_q = 16'b0;

reg [31:0] counter = 32'b0;

//=======================================================
//  Structural coding
//=======================================================


qsys u0(
		.clk_clk(CLOCK_50),								//clk.clk
		.reset_reset_n(1'b1),							//reset.reset_n
		
		.sdram_clock_c0_clk(DRAM_CLK),				//sdram_clock_c0.clk
		.sdram_clock_areset_conduit_export(1'b0),	//sdram_clock_areset_conduit.export
		
		.sdram_wire_addr(DRAM_ADDR),					//sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),						//           .ba
		.sdram_wire_cas_n(DRAM_CAS_N),				//           .cas_n
		.sdram_wire_cke(DRAM_CKE),						//           .cke
		.sdram_wire_cs_n(DRAM_CS_N),					//           .cs_n
		.sdram_wire_dq(DRAM_DQ),						//           .dq
		.sdram_wire_dqm(DRAM_DQM),						//           .dqm
		.sdram_wire_ras_n(DRAM_RAS_N),				//           .ras_n
		.sdram_wire_we_n(DRAM_WE_N),					//           .we_n
		
		.sdram_read_control_fixed_location  (1'b1), // When set the master address will not increment.
		.sdram_read_control_read_base       (read_base),
		.sdram_read_control_read_length     (32'd2), // Number of bytes to transfer (16 bit words).
		.sdram_read_control_go              (read_go),
		.sdram_read_control_done            (qsys_sdram_read_control_done),
		.sdram_read_control_early_done      (qsys_sdram_read_control_early_done),
		.sdram_read_user_read_buffer        (read_buffer),
		.sdram_read_user_buffer_output_data (read_buffer_output_data),
		.sdram_read_user_data_available     (read_data_available),
        
        .sdram_write_user_write_buffer      (write_buffer),      //           sdram_write_user.write_buffer
		.sdram_write_user_buffer_input_data (buffer_input_data), //                           .buffer_input_data
		.sdram_write_user_buffer_full       (qsys_sdram_write_user_buffer_full),       //                           .buffer_full
		.sdram_write_control_fixed_location (1'b1), // When set the master address will not increment.
		.sdram_write_control_write_base     (write_base),     //                           .write_base
		.sdram_write_control_write_length   (32'd2), // Number of bytes to transfer (16 bit words).
		.sdram_write_control_go             (write_go),             //                           .go
		.sdram_write_control_done           (qsys_sdram_write_control_done)  
);

assign read_base [31:0] = r_read_base [31:0];
assign read_go = r_read_go;
assign read_buffer = r_read_buffer;


assign write_buffer             = r_write_buffer;
assign buffer_input_data [15:0] = r_buffer_input_data [15:0];
assign write_base [31:0]        = r_write_base [31:0];
assign write_go                 = r_write_go;

assign LED = r_q;

reg read_state = 1'b0; 
reg write_state = 1'b0;

always @(posedge CLOCK_50) begin
    case (read_state)
        1'b0: // waiting for a read request
            begin
                r_read_buffer <= 1'b0;
                if (r_read_go) begin
                    read_state <= 1'b1; 
                end
            end
        1'b1: // waiting for data
            begin
                r_read_go <= 1'b0;
                if (read_data_available) begin
                    r_q <= read_buffer_output_data[7:0];
                    r_read_buffer <= 1'b1; // Acts as a read acknowledge.
                    read_state <= 1'b0; 
                end
            end
    endcase    
end

always @(posedge CLOCK_50) begin
    case (write_state)
        1'b0: // waiting for a write request
            begin
                if (write_go) begin
                    read_state <= 1'b1;
                end
            end
        1'b1: // 
            begin
                write_go <= 1'b0;
                r_write_buffer <= 1'b0;
                read_state <= 1'b0;         
            end
    endcase    
end


    always @(posedge CLOCK_50) begin
        if (counter == 32'd25000000) begin
            //counter <= 32'd0;
            // stop
        end else begin
            counter <= counter + 32'b1;
        end
    end

    always @(posedge CLOCK_50) begin
        if (counter == 32'd2) begin
            // Write data.
            r_write_base <= 32'd0;
            
            //r_buffer_input_data <= 16'b1100_1100_1100_1100;
            //r_buffer_input_data <= 16'b1010_1010_1010_1010;
            r_buffer_input_data <= 16'b1111_0000_1110_1101;
            r_write_buffer <= 1'b1;
            r_write_go <= 1'b1;
        end else if (counter == 32'd10) begin
            // Send the read command.
            r_read_base <= 0;
            r_read_go <= 1;
        end 
        
    end


endmodule
