library verilog;
use verilog.vl_types.all;
entity MUX2_1 is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        F               : out    vl_logic_vector(31 downto 0);
        S               : in     vl_logic
    );
end MUX2_1;
