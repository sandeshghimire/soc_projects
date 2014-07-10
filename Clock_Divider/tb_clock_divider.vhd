LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb_clock_divider IS
END tb_clock_divider;

ARCHITECTURE behavior OF tb_clock_divider IS 

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT clock_divider
PORT (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
END COMPONENT;


--Inputs

signal tb_clk_in : STD_LOGIC:= '0';
signal tb_reset  : STD_LOGIC:= '1';

--Output

signal tb_clk_out : STD_LOGIC:= '0';

-- Clock period definitions
constant clk_period : time := 20 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: clock_divider PORT MAP (
clk_in  => tb_clk_in,
reset   => tb_reset,
clk_out => tb_clk_out
);

-- Clock process definitions


CLK_gen: process begin
wait for 10 ns;
tb_clk_in <= NOT tb_clk_in;
end process;

simulation: process begin
wait for 100 ns;
tb_reset <= '0';

end process;



END;





