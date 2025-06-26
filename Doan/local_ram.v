module local_ram
#(
	parameter sample = 8,
	parameter n_bit_for_sample = 3
)
(
	input clk, 
	input [1:0] wr_sel, 
	//wr_sel[0][0] = x_real_mem
	//wr_sel[0][1] = x_imag_mem
	//wr_sel[1][0] = X_real_mem
	//wr_sel[1][1] = X_real_mem
	input [1:0] rd_sel,
	//rd_sel[0][0] = x_real_mem
	//rd_sel[0][1] = x_imag_mem
	//rd_sel[1][0] = X_real_mem
	//rd_sel[1][1] = X_real_mem
	input wr_en,
	input sub_en,
	input [n_bit_for_sample - 1:0] addr, 
	input signed [31:0] data_in_1,
	input signed [31:0] data_in_2,
	output reg signed [31:0] data_out_1,
	output reg signed [31:0] data_out_2
);

reg signed [31:0] data_mem [1:0][1:0][sample - 1:0];
// data_mem[0][0] = x_real_mem
// data_mem[0][1] = x_imag_mem
// data_mem[1][0] = X_real_mem
// data_mem[1][1] = X_imag_mem

always @(posedge clk) begin
	if(wr_en) begin
		data_mem[wr_sel[1]][wr_sel[0]][addr] <= data_in_1;
		if(sub_en) begin
			data_mem[wr_sel[1]][1][addr] <= data_in_2;	
		end
	end
	
	data_out_1 <= data_mem[rd_sel[1]][rd_sel[0]][addr];
	
	if(sub_en) begin
		data_out_2 <= data_mem[rd_sel[1]][1][addr];		
	end

end
endmodule
