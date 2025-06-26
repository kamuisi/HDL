library verilog;
use verilog.vl_types.all;
entity SRAM is
    port(
        ADDRESS         : in     vl_logic_vector(5 downto 0);
        WriteData       : in     vl_logic_vector(31 downto 0);
        ReadData        : out    vl_logic_vector(31 downto 0);
        WriteEn         : in     vl_logic;
        ReadEn          : in     vl_logic;
        clk             : in     vl_logic
    );
end SRAM;
