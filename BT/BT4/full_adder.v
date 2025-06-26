module full_adder (input A, B, Cin, output S, Cout);
wire w0, w1, w2;
xor(w0, A, B);
and(w1, A, B);
xor(S, w0, Cin);
and(w2, w0, Cin);
or(Cout, w1, w2);
endmodule