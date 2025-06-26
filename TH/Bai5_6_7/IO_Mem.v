module IO_Mem
(
	input clk,
	input [31:0] bAddress,
	input bSel,
	input bWrite,
	input [31:0] bWData,
	output reg [31:0] bRData
);

	reg [31:0] mem [16384:0];
	wire we;
	assign we = bWrite & bSel;
	always @(posedge clk) begin
		if(we) begin
			mem[bAddress] <= bWData;
		end
		bRData <= mem[bAddress];
	end
	endmodule
			
	