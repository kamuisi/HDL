module full_adder_4bit_1 (A, B, Cin, S, Cout);
input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;

assign {Cout, S} = A + B + Cin;
endmodule