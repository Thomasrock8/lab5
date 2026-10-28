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

signal a               : std_logic_vector(2 downto 0) := (others => '0');
signal b               : std_logic_vector(2 downto 0) := (others => '0');
signal add             : std_logic;
signal sub             : std_logic; 
signal seven_seg1      : std_logic_vector(6 downto 0);
signal seven_seg2      : std_logic_vector(6 downto 0);
signal seven_seg3      : std_logic_vector(6 downto 0);
constant NUM_BITS          : integer := 3;
constant SEQUENTIAL_FLAG   : boolean := true;     -- false : concurrent stimuli, true: sequential stimuli
constant period       : time := 20ns;                                              
signal clk            : std_logic := '0';
signal reset          : std_logic := '1';

begin

uut: top  
  port map(
    clk             => clk,
    reset           => reset,
	a               => a,
	b               => b,
    add             => add,
	sub             => sub,
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

sequential_stimuli: if SEQUENTIAL_FLAG generate
  sequential_tb : process 
    begin
      report "****************** sequential testbench start ****************";
      wait for 10 ns;   -- let all the initial conditions trickle through
        for k in 0 to 1  loop
          add <= std_logic(not add);
            for i in 0 to ((2 ** NUM_BITS) - 1) loop
              a <= std_logic_vector(unsigned(a) + 1 );
                for j in 0 to ((2 ** NUM_BITS) - 1)  loop
                  b <= std_logic_vector(unsigned(b) + 1 );
                wait for 10 ns;
               end loop;
             end loop;
        end loop;
      report "****************** sequential testbench stop ****************";
	  
	        report "****************** sequential testbench start ****************";
      wait for 10 ns;   -- let all the initial conditions trickle through
        for k in 0 to 1  loop
          sub <= std_logic(not sub);
            for i in 0 to ((2 ** NUM_BITS) - 1) loop
              a <= std_logic_vector(unsigned(a) + 1 );
                for j in 0 to ((2 ** NUM_BITS) - 1)  loop
                  b <= std_logic_vector(unsigned(b) + 1 );
                wait for 10 ns;
               end loop;
             end loop;
        end loop;
      report "****************** sequential testbench stop ****************";
	  
      wait;
  end process; 
end generate sequential_stimuli;

  end arch;