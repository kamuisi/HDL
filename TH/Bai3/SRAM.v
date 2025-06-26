module SRAM(ADDRESS, WriteData, ReadData, WriteEn, ReadEn, clk);
input [5:0] ADDRESS;
input [31:0] WriteData;
reg [31:0] Mem [0:31];
output reg [31:0] ReadData;
input WriteEn, ReadEn, clk;

always @(posedge clk)
	begin
		if(WriteEn && !ReadEn)
			Mem[ADDRESS] <= WriteData;
		else if(ReadEn && !WriteData)
			ReadData <= Mem[ADDRESS];
		else
			ReadData <= 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
	end	
endmodule
