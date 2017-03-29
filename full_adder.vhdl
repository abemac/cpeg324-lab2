library ieee;
  use ieee.std_logic_1164.all;

entity full_adder is
  port (
      x,y,c_in : in std_logic;
      s,c_out : out std_logic
  );
end entity;

architecture arch of full_adder is
  component half_adder is
    port (
          x : in std_logic;
          y :in std_logic;
          s : out std_logic;
          c: out std_logic
    );
  end component;
  signal c1,c2,s1: std_logic;
begin
ha1: half_adder port map(x,y,s1,c1);
ha2: half_adder port map(s1,c_in,s,c2);
c_out<=c1 or c2;

end architecture;
