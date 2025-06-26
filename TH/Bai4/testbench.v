`timescale 1ns/1ps
module testbench;
reg [1:0] S, M;
wire [31:0] F;
reg [31:0] A, B;
wire add_sub_overflow, zero;
/*
ALU something(.M(M), .S(S), .A(A), .B(B), .F(F), 
.add_sub_overflow(add_sub_overflow), .zero(zero));
*/
MUX2_1 something(.S(S[0]), .A(A), .B(B), .F(F));

initial
begin 
	A=$random;
	B=$random;
	fork
	/*
		{M, S} = 0;
		#5 {M, S} = 1;
		#10 {M, S} = 2;
		#15 {M, S} = 3;
		#20 {M, S} = 4;
		#25 {M, S} = 5;
		#30 {M, S} = 6;
		#35 {M, S} = 7;
		#40 {M, S} = 8;
		#45 {M, S} = 9;
		#50 {M, S} = 10;
		#55 $stop;
	*/
		S[0] = 0;
		#5 S[0] = 1;
		#10 $stop;
	join
end
endmodule