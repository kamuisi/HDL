library verilog;
use verilog.vl_types.all;
entity lab_2_2 is
    port(
        ReadAddress1    : in     vl_logic_vector(4 downto 0);
        ReadAddress2    : in     vl_logic_vector(4 downto 0);
        WriteAddress    : in     vl_logic_vector(4 downto 0);
        WriteData       : in     vl_logic_vector(31 downto 0);
        ReadData1       : out    vl_logic_vector(31 downto 0);
        ReadData2       : out    vl_logic_vector(31 downto 0);
        ReadWriteEn     : in     vl_logic;
        clk             : in     vl_logic
    );
end lab_2_2;
