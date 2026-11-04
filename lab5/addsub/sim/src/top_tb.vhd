-------------------------------------------------------------------------------
-- Dr. Kaputa
-- blink test bench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity top_tb is
end top_tb;

architecture arch of top_tb is

component top is
  port (
    clk             : in  std_logic; 
    reset           : in  std_logic;
	button          : in  std_logic;
    data            : in  std_logic_vector(7 downto 0);
	LED				: out std_logic_vector(3 downto 0);
    seven_seg1      : out std_logic_vector(6 downto 0);
	seven_seg2      : out std_logic_vector(6 downto 0);
	seven_seg3      : out std_logic_vector(6 downto 0)
  );
end component;  

signal button          : std_logic := '0';
signal LED             : std_logic_vector(3 downto 0) := (others => '0');
signal data            : std_logic_vector(7 downto 0) := (others => '0');
signal seven_seg1      : std_logic_vector(6 downto 0);
signal seven_seg2      : std_logic_vector(6 downto 0);
signal seven_seg3      : std_logic_vector(6 downto 0);  
constant period        : time := 20 ns;                                            
signal clk             : std_logic := '0';
signal reset           : std_logic := '1';

begin

uut: top  
  port map(
    clk             => clk,
    reset           => reset,
	button          => button,
    data            => data,
	LED             => open,
    seven_seg1      => open,
	seven_seg2      => open,
    seven_seg3      => open
  );

-- clock process
clock: process
  begin
    clk <= not clk;
    wait for period/2;
end process; 
 
-- reset process
async_reset: process
  begin
    wait for 2 * period;
    reset <= '0';
    wait;
end process; 

simulate: process
 begin
        wait for 100 ns;
        data <= "11001000";
		LED <= "0001";
		wait for 100 ns;
		button <= '1';
		wait for 100 ns;
	    button <= '0';
		wait for 100 ns;
		button <= '1';
		wait for 100 ns;
	    button <= '0';
		data <= "01100100";
		LED <= "0010";
		wait for 100 ns;
		button <= '1';
		wait for 100 ns;
	    button <= '0';
		LED <= "0100";
		wait for 100 ns;
		button <= '1';
		wait for 100 ns;
	    button <= '0';
		LED <= "1000";
 end process;

  end arch;
