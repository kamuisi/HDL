module top_module 
#(
	parameter sample = 8,
	parameter n_bit_for_sample = 3
)
(
    input RST_I,
    input CLK_I,
    input WE_I,
    input STB_I,
    input CYC_I,
    input signed [31:0] DAT_I,
    input [5 + n_bit_for_sample - 1:0] ADR_I,
    output signed [31:0] DAT_O,
    output ACK_O
);

    wire start;
    wire done;	 
	 wire [1:0] wr_sel, rd_sel, wr_sel_iDFT, wr_sel_wishbone, rd_sel_iDFT, rd_sel_wishbone;
	 wire wr_en, wishbone_wr_en, idft_wr_en, sub_en, ram_ctrl;
	 wire [n_bit_for_sample - 1:0] addr, wishbone_addr, idft_addr;
	 wire signed [31:0] data_in_1, iDFT_data_out_1, iDFT_data_out_2, wishbone_data_out;
	 wire signed [31:0] data_out_1, data_out_2;
	 
	 assign wr_sel = ram_ctrl ? wr_sel_iDFT : wr_sel_wishbone;
	 assign rd_sel = ram_ctrl ? rd_sel_iDFT : rd_sel_wishbone;
	 assign wr_en = ram_ctrl ? idft_wr_en : wishbone_wr_en;
	 assign addr = ram_ctrl ? idft_addr : wishbone_addr;
	 assign data_in_1 = ram_ctrl ? iDFT_data_out_1 : wishbone_data_out;

    // Wishbone slave
    wishbone_slave #(.sample(sample), .n_bit_for_sample(n_bit_for_sample)) u_slave  (
        .RST_I(RST_I),
        .CLK_I(CLK_I),
        .WE_I(WE_I),
        .STB_I(STB_I),
        .CYC_I(CYC_I),
        .ADR_I(ADR_I),
        .DAT_I(DAT_I),
        .done(done),
        .start(start),
        .DAT_O(DAT_O),
        .ACK_O(ACK_O),
		  .wishbone_addr(wishbone_addr),
		  .wr_en(wishbone_wr_en),
		  .wr_sel_wishbone(wr_sel_wishbone),
		  .rd_sel_wishbone(rd_sel_wishbone),
		  .data_in(data_out_1),
		  .data_out(wishbone_data_out)
    );

    // IDFT core
    iDFT #(.sample(sample), .n_bit_for_sample(n_bit_for_sample)) u_idft (
        .clk(CLK_I),
        .rst(RST_I),
        .start(start),
        .done(done),
		  .wr_en(idft_wr_en),
		  .sub_en(sub_en),
		  .ram_ctrl(ram_ctrl),
		  .idft_addr(idft_addr),
        .data_in_1(data_out_1),
		  .data_in_2(data_out_2),
		  .data_out_1(iDFT_data_out_1),
		  .data_out_2(iDFT_data_out_2),
		  .wr_sel_iDFT(wr_sel_iDFT),
		  .rd_sel_iDFT(rd_sel_iDFT)
    );

    // RAM
    local_ram #(.sample(sample), .n_bit_for_sample(n_bit_for_sample)) u_ram (
        .clk(CLK_I),
		  .addr(addr),
		  .wr_sel(wr_sel),
		  .rd_sel(rd_sel),
		  .wr_en(wr_en),
		  .sub_en(sub_en),
		  .data_in_1(data_in_1),
		  .data_in_2(iDFT_data_out_2),
		  .data_out_1(data_out_1),
		  .data_out_2(data_out_2)
    );

endmodule
