library ieee;
  use ieee.std_logic_1164.all;

entity adder8b is
  port ( x : in std_logic_vector(3 downto 0);
         y : in std_logic_vector(3 downto 0);
         sum : out std_logic_vector(3 downto 0);
         overflow: out std_logic;
         underflow: out std_logic
  );
end entity;

architecture arch of adder8b is
  component full_adder is
    port (
        x,y,c_in : in std_logic;
        s,c_out : out std_logic
    );
  end component;
  signal c1,c2,c3 : std_logic;
  signal s3: std_logic;
begin
  fa0: full_adder port map(x(0),y(0),'0',sum(0),c1);
  fa1: full_adder port map(x(1),y(1),c1,sum(1),c2);
  fa2: full_adder port map(x(2),y(2),c2,sum(2),c3);
  fa3: full_adder port map(x(3),y(3),c3,s3,open);
  sum(3)<=s3;
  overflow<=s3 and (not x(3)) and (not y(3));--overflow if both numbers are positive and result is negative
  underflow<=(not s3) and x(3) and y(3); --underflow if two negatives make a positive



end architecture;
