library verilog;
use verilog.vl_types.all;
entity BT3 is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Q               : out    vl_logic
    );
end BT3;
