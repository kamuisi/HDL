module TEST(input A, B, C, D, output Y);
wire w1, w2, w3;
and(w1, A, B);
xor(w2, C, D);
or(w3, C, w1);
assign Y = (A) ? w2 : w3;
endmodule