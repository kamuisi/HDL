library verilog;
use verilog.vl_types.all;
entity lifo_stack is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        push            : in     vl_logic;
        pop             : in     vl_logic;
        data_in         : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end lifo_stack;
