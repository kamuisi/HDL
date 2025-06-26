library verilog;
use verilog.vl_types.all;
entity mips is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        RD              : in     vl_logic_vector(31 downto 0);
        WD              : out    vl_logic_vector(31 downto 0);
        bAdrress        : out    vl_logic_vector(31 downto 0);
        memWrite        : out    vl_logic
    );
end mips;
