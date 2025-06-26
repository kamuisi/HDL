library verilog;
use verilog.vl_types.all;
entity mealy is
    port(
        I               : in     vl_logic;
        clk             : in     vl_logic;
        Y               : out    vl_logic
    );
end mealy;
