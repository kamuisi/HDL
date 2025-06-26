library verilog;
use verilog.vl_types.all;
entity IO_Mem is
    port(
        clk             : in     vl_logic;
        bAddress        : in     vl_logic_vector(31 downto 0);
        bSel            : in     vl_logic;
        bWrite          : in     vl_logic;
        bWData          : in     vl_logic_vector(31 downto 0);
        bRData          : out    vl_logic_vector(31 downto 0)
    );
end IO_Mem;
