library verilog;
use verilog.vl_types.all;
entity rom is
    port(
        A               : in     vl_logic_vector(5 downto 0);
        RD              : out    vl_logic_vector(31 downto 0)
    );
end rom;
