library ieee;
use ieee.std_logic_1164.all;

entity mux_4to1_tb is
end mux_4to1_tb;

architecture behavoiral of mux_4to1_tb is

  component mux_4to1 is
    generic(word_size : integer);
    port(in0 : in std_logic_vector((word_size-1) downto 0);
         in1 : in std_logic_vector((word_size-1) downto 0);
         in2 : in std_logic_vector((word_size-1) downto 0);
         in3 : in std_logic_vector((word_size-1) downto 0);
         sel : in std_logic_vector(1 downto 0);
         mux_out : out std_logic_vector((word_size-1) downto 0)
    );
  end component mux_4to1;
  signal A: std_logic_vector(7 downto 0):="00101101"; --testing 8 bit word
  signal B: std_logic_vector(7 downto 0):="01111111"; --testing 8 bit word
  signal C: std_logic_vector(7 downto 0):="10000000"; --testing 8 bit word
  signal D: std_logic_vector(7 downto 0):="11010011"; --testing 8 bit word
  signal sel : std_logic_vector(1 downto 0) :="00";
  signal mux_out : std_logic_vector(7 downto 0):="00000000";
  begin
    mux : mux_4to1 generic map(word_size => 8)
                   port map(A,B,C,D,sel,mux_out);

    testb : process
    begin
      sel<="00";
      wait for 5 ns;
    --  assert mux_out = "00101101" report "bad output" severity error;

      sel<="01";
      wait for 5 ns;
      --assert mux_out = "01111111" report "bad output" severity error;

      sel<="10";
      wait for 5 ns;
      --assert mux_out = "10000000" report "bad output" severity error;

      sel<="11";
      wait for 5 ns;
      --assert mux_out = "11010011" report "bad output" severity error;

      wait for 5 ns;
      report "end of testbench" severity note;
      wait;
    end process;
end architecture behavoiral;
