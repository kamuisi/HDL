module mips
(
	input clk,
	input rst_n,
	input [31:0] RD,
	output [31:0] WD,
	output [31:0] bAdrress,
	output memWrite
);
	wire [31:0] pc_next, pc;
	wire [5:0] imAddr;
	wire [31:0] instruction;
	wire [5:0] opcode;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [4:0] shamt;
	wire [5:0] funct;
	wire [4:0] A3;
	wire [31:0] WD3;
	wire [31:0] RD1;
	wire [31:0] RD2;
	wire [31:0] srcB;
	wire ALU_Zero;
	wire [31:0] ALU_Result;
	//wire [31:0] RD;
	wire [31:0] Sign_extend;
	wire [31:0] pcNext;
	wire [31:0] pcBranch;
	wire BranchCond;
	wire [31:0] pc_Branch;
	
	wire [1:0] regDst;
	wire regWrite;
	wire ALUSrc;
	wire [3:0] ALUOp;
	//wire memWrite;
	wire [1:0] memToReg;
	wire Branch;
	wire condZero;
	wire [1:0] pcSrc;
	
	assign imAddr = pc >> 2;
	assign opcode = instruction[31:26];
	assign rs = instruction[25:21];
	assign rt = instruction[20:16];
	assign rd = instruction[15:11];
	assign shamt = instruction[10:6];
	assign funct = instruction[5:0];
	assign A3 = (regDst == 1) ? rd : ((regDst == 2) ? 5'b1111 : rt);
	assign WD3 = (memToReg == 1) ? RD : ((memToReg == 2) ? pcNext : ALU_Result);
	assign srcB = (ALUSrc) ? Sign_extend : RD2;
	assign Sign_extend = {{16 {instruction[15]}}, instruction[15:0]};
	assign pcNext = pc + 4;
	assign pcBranch = pcNext + Sign_extend;
	assign BranchCond = Branch & (ALU_Zero == condZero);
	assign pc_Branch = BranchCond ? pcBranch : pcNext;
	assign pc_next = (pcSrc == 1) ? instruction[25:0] : ((pcSrc == 2) ? ALU_Result : pc_Branch);
	
	assign bAdrress = ALU_Result;
	assign WD = RD2;
	register pc_register(clk, rst_n, pc_next, pc);
	rom I_MEM(imAddr, instruction);
	register_file REG(clk, rs, rt, A3, WD3, regWrite, RD1, RD2);
	alu ALU(RD1, srcB, ALUOp, shamt, ALU_Zero, ALU_Result);
	//ram D_MEM(clk, ALU_Result, memWrite, RD2, RD);
	control_unit Control(opcode, funct, condZero, Branch, regWrite, regDst, ALUSrc, ALUOp, pcSrc, 
	memWrite, memToReg);
	
	
	
endmodule
