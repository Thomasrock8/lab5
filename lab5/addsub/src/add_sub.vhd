-------------------------------------------------------------------------------
-- Dr. Kaputa
-- seven_seg demo
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;      

entity add_sub is
  port (
    clk              : in std_logic; 
    reset            : in std_logic;
    a                : in std_logic_vector(7 downto 0);
	b                : in std_logic_vector(7 downto 0);
    sum              : out std_logic_vector(8 downto 0);
	diff             : out std_logic_vector(8 downto 0)
	);
end add_sub;  

architecture beh of add_sub  is
begin
process(clk,reset)
  begin
  
    if (reset = '1') then 
	sum <= "000000000";
	diff <= "000000000";
    elsif (clk'event and clk = '1') then
		sum <= std_logic_vector(unsigned(('0' & a)) + unsigned(('0' & b)));
		diff <= std_logic_vector(unsigned(('0' & a)) - unsigned(('0' & b)));
		end if;
  end process;
end beh;