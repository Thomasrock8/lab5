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
    sum              : out std_logic_vector(7 downto 0);
	diff             : out std_logic_vector(7 downto 0)
	);
end add_sub;  

architecture beh of add_sub  is
begin
process(clk,reset)
  begin
    if (reset = '1') then 
	sum <= "00000000";
	diff <= "00000000";
    elsif (clk'event and clk = '1') then
		sum <= std_logic_vector(unsigned(a) + unsigned(b));
		diff <= std_logic_vector(unsigned(a) - unsigned(b));
		end if;
    end if;
  end process;
end beh;