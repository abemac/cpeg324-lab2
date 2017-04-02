library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1 is
  generic(word_size : positive);
  port(in0 : in std_logic_vector((word_size-1) downto 0);
       in1 : in std_logic_vector((word_size-1) downto 0);
       in2 : in std_logic_vector((word_size-1) downto 0);
       in3 : in std_logic_vector((word_size-1) downto 0);
       sel : in std_logic_vector(1 downto 0);
       mux_out : out std_logic_vector((word_size-1) downto 0)
  );
end entity mux_4to1;

architecture behavioral of mux_4to1 is
begin
  with sel select mux_out<=
    in0 when "00",
    in1 when "01",
    in2 when "10",
    in3 when others,


end architecture behavioral;
