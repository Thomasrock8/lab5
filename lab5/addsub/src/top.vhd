-------------------------------------------------------------------------------
-- Dr. Kaputa
-- blink top
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity top is
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
end top;

architecture beh of top is

signal a            :std_logic;
signal b            :std_logic;
signal button_s     :std_logic;
signal nextState    :std_logic;
signal state        :std_logic_vector(3 downto 0);
signal data_s       :std_logic_vector(7 downto 0);
signal sum          :std_logic_vector(7 downto 0);
signal diff         :std_logic_vector(7 downto 0);
signal output       :std_logic_vector(7 downto 0);
signal output_pad   :std_logic_vector(11 downto 0);
signal out1s        :std_logic_vector(3 downto 0);
signal out10s       :std_logic_vector(3 downto 0);
signal out100s      :std_logic_vector(3 downto 0);


component seven_seg is
  port (
    clk             : in std_logic; 
    reset           : in std_logic;
    bcd             : in std_logic_vector(3 downto 0);
    seven_seg_out   : out std_logic_vector(6 downto 0)
  );  
end component; 

component synchronizer_8bit is
  port (
    clk             : in std_logic; 
    reset           : in std_logic;
    async_in        : in std_logic_vector(7 downto 0);
    sync_out        : out std_logic_vector(7 downto 0)
  );  
end component; 

component rising_edge_synchronizer is
  port (
    clk               : in std_logic;
    reset             : in std_logic;
    input             : in std_logic;
    edge              : out std_logic
  );  
end component; 

component stateReg is
  port (
    clk              : in std_logic; 
    reset            : in std_logic;
	nextState        : in std_logic;
    state            : out std_logic_vector(3 downto 0);
  );  
end component; 

component add_sub is
  port (
    clk              : in std_logic; 
    reset            : in std_logic;
    a                : in std_logic_vector(7 downto 0);
	b                : in std_logic_vector(7 downto 0);
    sum              : out std_logic_vector(7 downto 0);
	diff             : out std_logic_vector(7 downto 0)
  );  
end component; 

component double_dabble is
  port (
    result_padded           : in  std_logic_vector(11 downto 0); 
    ones                    : out std_logic_vector(3 downto 0);
    tens                    : out std_logic_vector(3 downto 0);
    hundreds                : out std_logic_vector(3 downto 0)
  );  
 end component;

begin
output_pad <= "0000" & output;

if(button_s) then
case state is
 when "0001" => 
 nextState <= "0010"
 end if;
 when "0010" => 
 nextState <= "0100"
 end if;
 when "0100" => 
 nextState <= "1000"
 end if;
  when "1000" => 
 nextState <= "0001"
 end if;
 end case;
 
 process(clk,reset)
 begin
 if (clk'event and clk = '1') then
  case state is
  when "0001" =>
  a <= data_s;
  end if;
  when "0010" =>
  b <= data_s;
  end if;
 end case;
end process;
 
 process(clk,reset)
 begin
 if (clk'event and clk = '1') then
  case state is
  when "0001" =>
  output <= a;
  end if;
  when "0010" =>
  output <= b;
  end if;
  when "0100" =>
  output <= sum;
  end if;
  when "1000" =>
  output <= diff;
  end if;
 end case;
end process;

uutas: add_sub
  port map(        
    clk            => clk,
    reset          => reset,
    a              => a,
	b              => b,
    sum            => sum,
	diff           => diff
  );

uutSR: stateReg
  port map(        
    clk            => clk,
    reset          => reset,
    nextState      => nextState,
    state          => state
  );

uutr1: synchronizer_8bit
  port map(        
    clk            => clk,
    reset          => reset,
    async_in       => data,
    sync_out       => data_s
  );
  
  uutr2: rising_edge_synchronizer
  port map(        
    clk            => clk,
    reset          => reset,
    input          => button,
    edge           => button_s
  );

  uutdd: double_dabble
  port map(        
    result_padded => output_pad,
    ones          => out1s,
    tens          => out10s,
    hundreds      => out100s
  );

uuts1: seven_seg
  port map(        
    clk            => clk,
    reset          => reset,
    bcd            => out1s,
    seven_seg_out  => seven_seg1
  );
  
  uuts2: seven_seg
  port map(        
    clk            => clk,
    reset          => reset,
    bcd            => out10s,
    seven_seg_out  => seven_seg2
  );
  
  uuts3: seven_seg
  port map(        
    clk            => clk,
    reset          => reset,
    bcd            => out100s,
    seven_seg_out  => seven_seg3
  );
  
 LED <= state;
  end beh;