library verilog;
use verilog.vl_types.all;
entity bus_decoder is
    port(
        bAddr           : in     vl_logic_vector(31 downto 0);
        bSel            : out    vl_logic_vector(5 downto 0)
    );
end bus_decoder;
