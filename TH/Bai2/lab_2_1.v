module lab_2_1 (loadEn, clk, load, count);
input loadEn, clk;
input [2:0] load;
output reg [2:0] count;
always @ (posedge clk, posedge loadEn)
	begin
	if (loadEn)
		count <= load;
	else
		case(count)
			3'b000 : count <= 3'b110;
			3'b110 : count <= 3'b100;
			3'b100 : count <= 3'b111;
			3'b111 : count <= 3'b011;
			3'b011 : count <= 3'b000;
			3'b101 : count <= 3'b010;
			3'b010 : count <= 3'b111;
			3'b001 : count <= 3'b110;
		endcase
	end
endmodule
			