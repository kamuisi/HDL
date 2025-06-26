module CLA_3b(A, B, Cin, S);
input [2:0] A, B;
input Cin;
wire Cout;
output [3:0] S;
wire [2:0] G, P;
wire [1:0] C;
wire [5:0] W;

and a0(G[0], A[0], B[0]);
xor x0(P[0], A[0], B[0]);
and a1(G[1], A[1], B[1]);
xor x1(P[1], A[1], B[1]);
and a2(G[2], A[2], B[2]);
xor x2(P[2], A[2], B[2]);

and pc0(W[0], P[0], Cin);
or o0(C[0], W[0], G[0]);

and pc1(W[1], W[0], P[1]);
and pc2(W[2], G[0], P[1]);
or o1(C[1], G[1], W[1], W[2]);

and pc3(W[3], W[1], P[2]);
and pc4(W[4], W[2], P[2]);
and pc5(W[5], G[1], P[2]);
or o2(Cout, G[2], W[3], W[4], W[5]);

xor s0(S[0], Cin, P[0]);
xor S1(S[1], C[0], P[1]);
xor s2(S[2], C[1], P[2]);
and s4(S[3], Cout, 1);

endmodule