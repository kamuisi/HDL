module CLA_M(A, B, Cin, S);
    input [2:0] A, B;
    input Cin;
    output [3:0] S;

    assign S = (A + B + Cin);
endmodule
