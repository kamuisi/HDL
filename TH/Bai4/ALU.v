module ALU(A, B, S, M, F, add_sub_overflow, zero);
input signed [31:0] A, B;
input [1:0] S, M;
output reg [31:0] F;
output reg add_sub_overflow;
output reg zero;
always @(*)
begin
add_sub_overflow = 0;
case({M, S})
	0: F = ~A;
	1: F = A & B;
	2: F = A ^ B;
	3: F = A | B;
	4: F = A - 1;
	5: begin 
		F = A + B;
		if((A[31] == B[31]) && (A[31] != F[31]))
			add_sub_overflow = 1;
		end
	6: begin 
		F = A - B;
		if((A[31] != B[31]) && (A[31] != F[31]))
			add_sub_overflow = 1;
		end
	7: F = A + 1;
	8: F = A < B;
	9: F = A == B;
	10: F = A > B;
	default: F = 32'bZ;
endcase
zero = (F==0);
end
endmodule
