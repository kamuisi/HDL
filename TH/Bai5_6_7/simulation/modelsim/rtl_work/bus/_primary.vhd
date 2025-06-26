library verilog;
use verilog.vl_types.all;
entity \bus\ is
    port(
        bAddr           : in     vl_logic_vector(31 downto 0);
        bRData0         : in     vl_logic_vector(31 downto 0);
        bRData1         : in     vl_logic_vector(31 downto 0);
        bRData2         : in     vl_logic_vector(31 downto 0);
        bRData          : out    vl_logic_vector(31 downto 0);
        bSel            : out    vl_logic_vector(5 downto 0)
    );
end \bus\;
