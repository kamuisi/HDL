module rom
(
	input [5:0] A,
	output [31:0] RD
);
	reg [31:0] rom [63:0];
	assign RD = rom[A];
	initial begin	
		$readmemh("program.hex", rom);
	end
endmodule
