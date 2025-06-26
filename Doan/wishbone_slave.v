module wishbone_slave
#(	
	parameter sample = 8,
	parameter n_bit_for_sample = 3
)
(
	input RST_I, 
	input CLK_I, 
	input WE_I, 
	input STB_I, 
	input CYC_I,
	input done,
	input [5 + n_bit_for_sample - 1:0] ADR_I,
	input signed [31:0] data_in,
	input signed [31:0] DAT_I,
	output reg start, 
	output reg wr_en,	
	output reg ACK_O,
	output reg [1:0] wr_sel_wishbone,
	output reg [1:0] rd_sel_wishbone,
	output reg [n_bit_for_sample - 1:0] wishbone_addr,
	output reg signed [31:0] data_out,
	output reg signed [31:0] DAT_O
);	
reg [n_bit_for_sample:0] count_sample;
reg [2:0] state;
reg is_real; 

localparam IDLE = 3'b000,
			  READ = 3'b001,
			  WAIT = 3'b010,
			  WRITE = 3'b011,
			  DONE = 3'b100;

initial begin
		state <= IDLE;		
	   ACK_O <= 0;
      start <= 0;
      DAT_O <= 32'b0;
      count_sample <= {(n_bit_for_sample+1){1'b0}};				
		wr_en <= 0;
		wr_sel_wishbone <= 2'b0;
		rd_sel_wishbone <= 2'b0;
		wishbone_addr <= {n_bit_for_sample{1'b0}};
		data_out <= 32'b0;
end
			  

always @(posedge CLK_I, posedge RST_I) begin
	if(RST_I) begin
		state <= IDLE;
      ACK_O <= 0;
      start <= 0;
      DAT_O <= 32'b0;
      count_sample <= {(n_bit_for_sample+1){1'b0}};				
		wr_en <= 0;
		wr_sel_wishbone <= 2'b0;
		rd_sel_wishbone <= 2'b0;
		wishbone_addr <= {n_bit_for_sample{1'b0}};
		data_out <= 32'b0;
		
	end else begin
		ACK_O <= 0;
		wr_sel_wishbone <= 2'b0;
		rd_sel_wishbone <= 2'b0;
		wr_en <= 0;
		case(state)
			IDLE: begin
				if (STB_I && CYC_I) begin
					if(WE_I) begin
						case(ADR_I[5 + n_bit_for_sample - 1:n_bit_for_sample])
							5'h00: begin 
								if(ADR_I[n_bit_for_sample - 1:0] == {n_bit_for_sample{1'b0}} && count_sample == sample) begin
									start <= DAT_I[0];
								end 
								state <= DONE;
							end
							5'h02: begin
								is_real <= 1;
								state <= WRITE;
							end
							5'h04: begin
								is_real <= 0;
								state <= WRITE;
							end
							default: state <= DONE;
						endcase
					end else begin
						case(ADR_I[5 + n_bit_for_sample - 1:n_bit_for_sample])
							5'h01: begin 
								if(ADR_I[n_bit_for_sample - 1:0] == {n_bit_for_sample{1'b0}}) begin
									DAT_O <= {31'b0, done};
									state <= DONE;
								end
							end
							5'h06: begin 
								is_real <= 1;
								state <= READ;
							end
							5'h08: begin 
								is_real <= 0;
								state <= READ;
							end
							default: begin DAT_O <= 32'bZ; state <= DONE; end
						endcase
					end
				end
			end
			READ: begin
				wishbone_addr <= ADR_I[n_bit_for_sample - 1:0];
				if(is_real) begin
					rd_sel_wishbone <= 2'b00;
				end
				else begin
					rd_sel_wishbone <= 2'b01;
				end
				state <= WAIT;
			end
			WAIT: begin
				state <= WRITE;				
			end
			WRITE: begin
				wishbone_addr <= ADR_I[n_bit_for_sample - 1:0];
				if(count_sample < sample) begin
					if(is_real) begin
						wr_sel_wishbone <= 2'b10;	
					end
					else begin
						wr_sel_wishbone <= 2'b11; 
						count_sample <= count_sample + 1;
					end
					data_out <= DAT_I; 
					wr_en <= 1;
				end
				else begin
					DAT_O <= data_in;
				end
				state <= DONE;
			end
			DONE: begin
				ACK_O <= 1;
				state <= IDLE;
			end
		endcase
	end
end
endmodule
