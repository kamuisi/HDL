library verilog;
use verilog.vl_types.all;
entity bus_mux is
    port(
        bSel            : in     vl_logic_vector(5 downto 0);
        in0             : in     vl_logic_vector(31 downto 0);
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        in3             : in     vl_logic_vector(31 downto 0);
        in4             : in     vl_logic_vector(31 downto 0);
        in5             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end bus_mux;
