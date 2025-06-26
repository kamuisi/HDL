module register(clk, wr_en, r_en, rst, out, data_in);
input clk, rst, wr_en, r_en;
input [31:0] data_in;
reg [31:0] reg_fifo [31:0];
output reg [31:0] out;
reg [4:0] wr_ptr, r_ptr;
assign full = (wr_ptr == 5'b11111);
assign empty = (wr_ptr == r_ptr);
always @(posedge clk)
begin
	if(rst) begin
		wr_ptr = 0;
		r_ptr = 0;
		out = 32'bZ;
	end
	else begin
		if(wr_en && !full) begin
			reg_fifo[wr_ptr] = data_in;
			wr_ptr = wr_ptr + 5'b00001;
			end
		if(r_en && !empty) begin
			out = reg_fifo[r_ptr];
			r_ptr = r_ptr + 5'b00001;
			end
	end
end
endmodule		
			
			