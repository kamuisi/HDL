library verilog;
use verilog.vl_types.all;
entity pwm is
    port(
        bSel            : in     vl_logic;
        bWrite          : in     vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        bWData          : in     vl_logic_vector(31 downto 0);
        bRData          : out    vl_logic_vector(31 downto 0);
        pwmOutput       : out    vl_logic
    );
end pwm;
