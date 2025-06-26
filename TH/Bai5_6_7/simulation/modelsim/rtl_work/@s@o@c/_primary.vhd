library verilog;
use verilog.vl_types.all;
entity SOC is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        gpioInput       : in     vl_logic_vector(15 downto 0);
        gpioOutput      : out    vl_logic_vector(15 downto 0);
        pwmOutput       : out    vl_logic
    );
end SOC;
