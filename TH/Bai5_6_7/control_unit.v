module control_unit
(
	input [5:0] opcode,
	input [5:0] funct,
	output reg condZero,
	output reg Branch,
	output reg regWrite,
	output reg [1:0] regDst,
	output reg ALUSrc,
	output reg [3:0] ALUOp,
	output reg [1:0] pcSrc,
	output reg memWrite,
	output reg [1:0] memToReg
);

always @(*) begin
	regDst <= 2'b0;
	regWrite <= 1;
	Branch <= 0;
	condZero <= 0;
	ALUSrc <= 0;
	memWrite <= 0;
	memToReg <= 2'b0;
	pcSrc <= 2'b0;
	case({opcode, funct})
		33: begin
			ALUOp <= 4'b0101;
			regDst <= 2'b01;
		end
		35: begin
			ALUOp <= 4'b0110;
			regDst <= 2'b01;
		end
		36: begin
			ALUOp <= 4'b0001;
			regDst <= 2'b01;
		end
		37: begin
			ALUOp <= 4'b0011;
			regDst <= 2'b01;
		end
		38: begin
			ALUOp <= 4'b0010;
			regDst <= 2'b01;
		end
		43: begin
			ALUOp <= 4'b1000;
			regDst <= 2'b01;
		end
		0: begin
			ALUOp <= 4'b1010;
			regDst <= 2'b01;
		end
		2: begin
			ALUOp <= 4'b1011;
			regDst <= 2'b01;
		end
		8: begin
			ALUOp <= 4'b0110;
			regDst <= 2'b01;
			regWrite <= 0;
			pcSrc <= 2'b10;
		end
		default: ALUOp <= 4'bZ;
	endcase
	case(opcode)
		9: begin
			ALUOp <= 4'b0101;
			ALUSrc <= 1;
		end
		12: begin
			ALUOp <= 4'b0001;
			ALUSrc <= 1;
		end
		13: begin
			ALUOp <= 4'b0011;
			ALUSrc <= 1;
		end
		11: begin
			ALUOp <= 4'b1000;
			ALUSrc <= 1;
		end
		15: begin
			ALUOp <= 4'b1100;
			ALUSrc <= 1;
		end
		4: begin
			ALUOp <= 4'b0110;
			regWrite <= 0;
			Branch <= 1;
			condZero <= 1;
			ALUSrc <= 1;
		end
		5: begin
			ALUOp <= 4'b0110;
			regWrite <= 0;
			Branch <= 1;
			ALUSrc <= 1;
		end
		35: begin
			ALUOp <= 4'b0101;
			ALUSrc <= 1;
			memToReg <= 2'b01;
		end
		43: begin
			ALUOp <= 4'b0101;
			regWrite <= 0;
			ALUSrc <= 1;
			memWrite <= 1;
		end
		2: begin
			ALUOp <= 4'b0110;
			regWrite <= 0;
			pcSrc <= 2'b01;
		end
		3: begin
			ALUOp <= 4'b0110;
			regDst <= 2'b10;
			ALUSrc <= 1;
			memToReg <= 2'b10;
			pcSrc <= 2'b01;
		end
		default: ALUOp <= 4'bZ;
	endcase
end
endmodule

		