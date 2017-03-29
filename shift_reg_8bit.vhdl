library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_8bit is
port(	I:	in std_logic_vector (7 downto 0);
		I_SHIFT_IN: in std_logic;
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic; -- positive level triggering in problem 3
		enable:		in std_logic; -- 0: don't do anything; 1: shift_reg is enabled
		O:	out std_logic_vector(7 downto 0)
);
end shift_reg_8bit;


architecture structural of shift_reg_8bit is
  component shift_reg
  port (	I:	in std_logic_vector (3 downto 0);
  		I_SHIFT_IN: in std_logic;
  		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
  		clock:		in std_logic;
  		enable:		in std_logic;
  		O:	out std_logic_vector(3 downto 0)
  );
  end component;
  signal I_SHIFT_IN_1 : std_logic;
  signal I_SHIFT_IN_0 : std_logic;
  signal D :std_logic_vector(7 downto 0);
begin
 sr1: shift_reg port map (I(7 downto 4),I_SHIFT_IN_1,sel,clock,enable,D(7 downto 4));
 sr0: shift_reg port map (I(3 downto 0),I_SHIFT_IN_0,sel,clock,enable,D(3 downto 0));
 I_SHIFT_IN_1<=(sel(1) and (not sel(0)) and I_SHIFT_IN) or ((not sel(1)) and sel(0) and D(3));
 I_SHIFT_IN_0<=(sel(1) and (not sel(0)) and D(4)) or ((not sel(1)) and sel(0) and I_SHIFT_IN);
 O<=D;

end architecture structural;
