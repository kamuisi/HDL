module lab_2_2 (ReadAddress1, ReadAddress2,
WriteAddress, WriteData, ReadData1, ReadData2,
ReadWriteEn, clk);

input [4:0] ReadAddress1, ReadAddress2, WriteAddress;
input [31:0] WriteData;
input ReadWriteEn;
input clk;
output reg [31:0] ReadData1, ReadData2;
reg [31:0] regfile [0:31];

always @ (posedge clk) 
	begin 
		if (ReadWriteEn)
		begin
			regfile[WriteAddress] <= WriteData;
			ReadData1 <= regfile[ReadAddress1];
			ReadData2 <= regfile[ReadAddress2];
		end
	end
endmodule