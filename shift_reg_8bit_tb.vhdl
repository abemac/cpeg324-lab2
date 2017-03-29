library ieee;
use ieee.std_logic_1164.all;

--  A testbench has no ports.
entity shift_reg_8bit_tb is
end shift_reg_8bit_tb;

architecture behav of shift_reg_8bit_tb is
--  Declaration of the component that will be instantiated.
component shift_reg_8bit
port (	I:	in std_logic_vector (7 downto 0);
		I_SHIFT_IN: in std_logic;
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic;
		enable:		in std_logic;
		O:	out std_logic_vector(7 downto 0)
);
end component;
--  Specifies which entity is bound with the component.
-- for shift_reg_0: shift_reg use entity work.shift_reg(rtl);
signal i, o : std_logic_vector(7 downto 0);
signal i_shift_in, clk, enable : std_logic;
signal sel : std_logic_vector(1 downto 0);
begin
--  Component instantiation.
shift_reg_0: shift_reg_8bit port map (I => i, I_SHIFT_IN => i_shift_in, sel => sel, clock => clk, enable => enable, O => o);

--  This process does the real job.
process
type pattern_type is record
--  The inputs of the shift_reg.
i: std_logic_vector (7 downto 0);
i_shift_in, enable: std_logic;
sel: std_logic_vector(1 downto 0);
--  The expected outputs of the shift_reg.
o: std_logic_vector (7 downto 0);
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array :=
(("01000001", '1', '1', "11", "01000001"),--load
("01000001", '0', '1', "00", "01000001"),--hold
("01000001", '1', '1', "01", "10000011"),--shift left with '1'
("01000001", '0', '1', "01", "00000110"),--shift left with '0'
("01000001", '0', '1', "01", "00001100"),--shift left with '0'
("01000001", '0', '1', "01", "00011000"),--shift left with '0'
("01000001", '0', '1', "01", "00110000"),--shift left with '0'
("01000001", '1', '1', "10", "10011000"),--shift right with '1'
("01000001", '1', '1', "10", "11001100"),--shift right with '1'
("01000001", '0', '1', "10", "01100110"),--shift right with '0'
("01000001", '0', '1', "10", "00110011"),--shift right with '0'
("11010100", '1', '1', "11", "11010100"),--load
("11010100", '0', '1', "00", "11010100"),--hold
("11010100", '1', '1', "01", "10101001"),--shift left with '1'
("11010100", '0', '1', "01", "01010010"),--shift left with '0'
("11010100", '0', '1', "01", "10100100"),--shift left with '0'
("11010100", '0', '1', "01", "01001000"),--shift left with '0'
("11010100", '0', '1', "01", "10010000"),--shift left with '0'
("11010100", '1', '1', "10", "11001000"),--shift right with '1'
("11010100", '1', '1', "10", "11100100"),--shift right with '1'
("11010100", '0', '1', "10", "01110010"),--shift right with '0'
("11010100", '0', '1', "10", "00111001"),--shift right with '0'
--now with enable=0
("01000001", '1', '0', "11", "00000000"),--load
("01000001", '0', '0', "00", "00000000"),--hold
("01000001", '1', '0', "01", "00000000"),--shift left with '1'
("01000001", '0', '0', "01", "00000000"),--shift left with '0'
("01000001", '0', '0', "01", "00000000"),--shift left with '0'
("01000001", '0', '0', "01", "00000000"),--shift left with '0'
("01000001", '0', '0', "01", "00000000"),--shift left with '0'
("01000001", '1', '0', "10", "00000000"),--shift right with '1'
("01000001", '1', '0', "10", "00000000"),--shift right with '1'
("01000001", '0', '0', "10", "00000000"),--shift right with '0'
("01000001", '0', '0', "10", "00000000"),--shift right with '0'
("11010100", '1', '0', "11", "00000000"),--load
("11010100", '0', '0', "00", "00000000"),--hold
("11010100", '1', '0', "01", "00000000"),--shift left with '1'
("11010100", '0', '0', "01", "00000000"),--shift left with '0'
("11010100", '0', '0', "01", "00000000"),--shift left with '0'
("11010100", '0', '0', "01", "00000000"),--shift left with '0'
("11010100", '0', '0', "01", "00000000"),--shift left with '0'
("11010100", '1', '0', "10", "00000000"),--shift right with '1'
("11010100", '1', '0', "10", "00000000"),--shift right with '1'
("11010100", '0', '0', "10", "00000000"),--shift right with '0'
("11010100", '0', '0', "10", "00000000")--shift right with '0'

);
begin
--  Check each pattern.
for n in patterns'range loop
--  Set the inputs.
i <= patterns(n).i;
i_shift_in <= patterns(n).i_shift_in;
sel <= patterns(n).sel;
clk <= '0';
enable <= patterns(n).enable;
wait for 1 ns;
clk<='1';--create rising edge
wait for 1 ns;
--  Check the outputs.
assert o = patterns(n).o
report "bad output value" severity error;
end loop;
assert false report "end of test" severity note;
--  Wait forever; this will finish the simulation.
wait;
end process;
end behav;
