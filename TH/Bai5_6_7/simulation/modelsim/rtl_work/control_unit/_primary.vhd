library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        opcode          : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        condZero        : out    vl_logic;
        Branch          : out    vl_logic;
        regWrite        : out    vl_logic;
        regDst          : out    vl_logic_vector(1 downto 0);
        ALUSrc          : out    vl_logic;
        ALUOp           : out    vl_logic_vector(3 downto 0);
        pcSrc           : out    vl_logic_vector(1 downto 0);
        memWrite        : out    vl_logic;
        memToReg        : out    vl_logic_vector(1 downto 0)
    );
end control_unit;
