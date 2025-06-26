module MUX2_1(A, B, F, S);
output reg [31:0] F;
input [31:0] A, B;
input S;
always @(*)
F = S ? A : B;
endmodule
