module d_ff(input d, clk, clear, output q, qbar);
wire s, sbar, r, rbar, cbar, clkbar;
not (cbar, clear);
not (clkbar, clk);
nand (sbar, rbar, s);
nand (s, sbar, cbar, clkbar);
nand (r, rbar, clkbar, s);
nand (rbar, r, cbar, d);
nand (q, s, qbar);
nand (qbar, q, r, cbar);
endmodule