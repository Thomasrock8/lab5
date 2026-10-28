-------------------------------------------------------------------------------
-- Dr. Kaputa
-- stateReg
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;      

entity stateReg is
  port (
    clk              : in std_logic; 
    reset            : in std_logic;
	nextState        : in std_logic;
    state            : out std_logic_vector(3 downto 0);
  ); 
end stateReg;  

architecture beh of stateReg is
begin
process(clk,reset)
  begin
    if (reset = '1') then 
	 state <= "0001";
    elsif (clk'event and clk = '1') then
     state <= nextState;
     end if;
	end if;
  end process;
end beh;