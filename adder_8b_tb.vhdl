library ieee;
  use ieee.std_logic_1164.all;

entity adder_8b_tb is
end entity;

architecture arch of adder_8b_tb is
  component adder8b is
    port ( x : in std_logic_vector(3 downto 0);
           y : in std_logic_vector(3 downto 0);
           sum : out std_logic_vector(3 downto 0);
           overflow: out std_logic;
           underflow: out std_logic
    );
  end component;
  signal x : std_logic_vector(3 downto 0);
  signal y : std_logic_vector(3 downto 0);
  signal sum : std_logic_vector(3 downto 0);
  signal overflow: std_logic;
  signal underflow:  std_logic;

begin
  adder : adder8b port map(x,y,sum,overflow,underflow);

  process
    type pattern_type is record
    x : std_logic_vector(3 downto 0);
    y : std_logic_vector(3 downto 0);
    exp_sum : std_logic_vector(3 downto 0);
    exp_overflow: std_logic;
    exp_underflow:  std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=(
    ("0000","0001","0001",'0','0'),--0+1=1
    ("0001","0001","0010",'0','0'),--1+1=2
    ("0111","0111","1110",'1','0'), --overflow
    ("0001","1111","0000",'0','0'), --1-1=0
    ("0001","1001","1010",'0','0'),--1-7=-6
    ("1111","1000","0111",'0','1')-- underflow
    );
  begin
    for n in patterns'range loop
      x<=patterns(n).x;
      y<=patterns(n).y;
      wait for 5 ns;
      assert sum = patterns(n).exp_sum report "bad ouput" severity error;
      assert overflow=patterns(n).exp_overflow report "bad output" severity error;
      assert underflow=patterns(n).exp_underflow report "bad output" severity error;
    end loop;
    report "tests completed";
    wait;
  end process;

end architecture;
