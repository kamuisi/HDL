library verilog;
use verilog.vl_types.all;
entity register_we_0 is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        we              : in     vl_logic;
        d               : in     vl_logic_vector(7 downto 0);
        q               : out    vl_logic_vector(7 downto 0)
    );
end register_we_0;
