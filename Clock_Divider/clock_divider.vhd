--Author Parth Patel
--This clock_divider code is o convert 50 MHZ input clock in to 1HZ clock output
----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider is
    Port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clock_divider;

architecture Behavioral of clock_divider is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 24999999 := 0;
begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '0') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 24999999 ) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;