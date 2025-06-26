module iDFT 
#(
	parameter sample = 8,
	parameter n_bit_for_sample = 3
)
(
    input clk,
    input rst,
    input start,
	 input signed [31:0] data_in_1,
	 input signed [31:0] data_in_2,
    output reg done,
    output reg wr_en, 
	 output reg sub_en,
	 output reg ram_ctrl,
	 output reg [1:0] wr_sel_iDFT,
	 output reg [1:0] rd_sel_iDFT,
	 output reg [n_bit_for_sample - 1:0] idft_addr, 
	 output reg signed [31:0] data_out_1,
	 output reg signed [31:0] data_out_2
);

	 localparam IDLE = 3'b000,
					READ = 3'b001,
					WAIT = 3'b010,
					WRITE = 3'b011,
					DONE =  3'b100;

	 reg signed [31:0] W_real [0:64];
	 reg signed [31:0] W_imag [0:64];
    reg signed [31:0] sum_real [0:sample - 1];
    reg signed [31:0] sum_imag [0:sample - 1];

    reg [2:0] state;
	 reg [n_bit_for_sample:0] n;
	 reg [n_bit_for_sample:0] k;

	 // bang tra twiddle factor
initial begin
    W_real[ 0] = 1024; W_imag[ 0] =     0;
    W_real[ 1] = 1024; W_imag[ 1] =     0;
    W_real[ 2] = 1024; W_imag[ 2] =     0;
    W_real[ 3] = 1024; W_imag[ 3] =     0;
    W_real[ 4] = 1024; W_imag[ 4] =     0;
    W_real[ 5] = 1024; W_imag[ 5] =     0;
    W_real[ 6] = 1024; W_imag[ 6] =     0;
    W_real[ 7] = 1024; W_imag[ 7] =     0;
    W_real[ 8] = 1024; W_imag[ 8] =     0;
    W_real[ 9] = 724;  W_imag[ 9] =   724;
    W_real[10] = 0;    W_imag[10] =  1024;
    W_real[11] = -724; W_imag[11] =   724;
    W_real[12] =-1024; W_imag[12] =     0;
    W_real[13] = -724; W_imag[13] =  -724;
    W_real[14] =    0; W_imag[14] = -1024;
    W_real[15] =  724; W_imag[15] =  -724;
	 W_real[16] = 1024; W_imag[16] =     0; 
    W_real[17] = 0;    W_imag[17] =  1024;
    W_real[18] =-1024; W_imag[18] =     0;
    W_real[19] =    0; W_imag[19] = -1024;	 
    W_real[20] = 1024; W_imag[20] =     0; 	 
    W_real[21] =    0; W_imag[21] =  1024;	 
    W_real[22] =-1024; W_imag[22] =     0;	 
    W_real[23] =    0; W_imag[23] = -1024;	 
	 W_real[24] = 1024; W_imag[24] =     0;
    W_real[25] = -724; W_imag[25] =   724;	 
    W_real[26] =    0; W_imag[26] = -1024;	 
    W_real[27] =  724; W_imag[27] =   724;	 
    W_real[28] =-1024; W_imag[28] =     0;	 
    W_real[29] =  724; W_imag[29] =  -724;	 
    W_real[30] =    0; W_imag[30] =  1024; 	 
    W_real[31] = -724; W_imag[31] =  -724;	 
	 W_real[32] = 1024; W_imag[32] =     0;
    W_real[33] =-1024; W_imag[33] =     0;	 
    W_real[34] = 1024; W_imag[34] =     0;	 
    W_real[35] =-1024; W_imag[35] =     0; 	 
    W_real[36] = 1024; W_imag[36] =     0;	 
    W_real[37] =-1024; W_imag[37] =     0;	 
    W_real[38] = 1024; W_imag[38] =     0;	 
    W_real[39] =-1024; W_imag[39] =     0;	 
	 W_real[40] = 1024; W_imag[40] =     0;	 
    W_real[41] = -724; W_imag[41] =  -724;	 
    W_real[42] =    0; W_imag[42] =  1024; 	 
    W_real[43] =  724; W_imag[43] =  -724;	 
    W_real[44] =-1024; W_imag[44] =     0;	 
    W_real[45] =  724; W_imag[45] =   724;	 
    W_real[46] =    0; W_imag[46] = -1024;	 
    W_real[47] = -724; W_imag[47] =   724;	 
	 W_real[48] = 1024; W_imag[48] =     0;	 
    W_real[49] =    0; W_imag[49] = -1024;	 
    W_real[50] =-1024; W_imag[50] =     0; 	 
    W_real[51] =    0; W_imag[51] =  1024;	 
    W_real[52] = 1024; W_imag[52] =     0; 	 
    W_real[53] =    0; W_imag[53] = -1024;  	 
    W_real[54] =-1024; W_imag[54] =     0;	 
    W_real[55] =    0; W_imag[55] =  1024;	 
	 W_real[56] = 1024; W_imag[56] =     0;
    W_real[57] =  724; W_imag[57] =  -724;	 
    W_real[58] =    0; W_imag[58] = -1024; 	 
    W_real[59] = -724; W_imag[59] =  -724;	 
    W_real[60] =-1024; W_imag[60] =     0;	 
    W_real[61] = -724; W_imag[61] =   724;	 
    W_real[62] =    0; W_imag[62] =  1024;	 
    W_real[63] =  724; W_imag[63] =   724;	  
	 state <= IDLE;
	 done <= 0;
	 n <= 0;
	 k <= 0;			
	 data_out_1 <= 32'b0;
	 data_out_2 <= 32'b0;
	 wr_en <= 0;
	 sub_en <= 0;
	 ram_ctrl <= 0;
	 wr_sel_iDFT <= 2'b0;
	 rd_sel_iDFT <= 2'b0;	 
	 idft_addr <= {n_bit_for_sample{1'b0}};
end

 always @(posedge clk, posedge rst) begin
	  if (rst) begin
			state <= IDLE;			
			done <= 0;
			n <= 0;
			k <= 0;			
			data_out_1 <= 32'b0;
			data_out_2 <= 32'b0;
			wr_en <= 0;
			sub_en <= 0;
			ram_ctrl <= 0;
			wr_sel_iDFT <= 2'b0;
			rd_sel_iDFT <= 2'b0;	
			idft_addr <= {n_bit_for_sample{1'b0}};
	  end else begin		
			wr_en <= 0;
			sub_en <= 0;
			ram_ctrl <= 1;
			wr_sel_iDFT <= 2'b0;
			rd_sel_iDFT <= 2'b0;	
			case (state)
				 IDLE: begin
					  if (start) begin
							state <= READ;
							n <= 0;
							k <= 0;
							done <= 0;
					  end
					  else ram_ctrl <= 0;
				 end
				 READ: begin
					  rd_sel_iDFT <= 2'b10;
					  sub_en <= 1;
					  idft_addr <= k;
					  state <= WAIT;
				 end
				 WAIT: begin
					  state <= WRITE;
				 end
				 WRITE: begin
					  if(n < sample) begin
							if(k < sample) begin
								if(k == {n_bit_for_sample{1'b0}}) begin 
									sum_real[n] <=((data_in_1 * W_real[k * sample + n] - data_in_2 * W_imag[k * sample + n]) >>> 10);
									sum_imag[n] <=((data_in_1 * W_imag[k * sample + n] + data_in_2 * W_real[k * sample + n]) >>> 10);									
								end
								else begin
									sum_real[n] <= sum_real[n] + ((data_in_1 * W_real[k * sample + n] - data_in_2 * W_imag[k * sample + n]) >>> 10);
									sum_imag[n] <= sum_imag[n] + ((data_in_1 * W_imag[k * sample + n] + data_in_2 * W_real[k * sample + n]) >>> 10);
								end
								k <= k + 1;
								state <= READ;
							end
							else begin
								data_out_1 <= (sum_real[n] >>> n_bit_for_sample);
								data_out_2 <= (sum_imag[n] >>> n_bit_for_sample);
								wr_en <= 1;
								sub_en <= 1;
								wr_sel_iDFT <= 2'b00;
								idft_addr <= n;
								n <= n + 1;
								k <= {n_bit_for_sample{1'b0}};
								state <= READ;
							end
						end
						else begin
							done <= 1;
							state <= DONE; 
						end
				 end
				 DONE: begin
					if(!start) begin state <= IDLE; end
					ram_ctrl <= 0;
				 end
			endcase
	  end
 end
endmodule
