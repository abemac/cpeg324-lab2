library ieee;
use ieee.std_logic_1164.all;

entity shift_reg is
port(	I:	in std_logic_vector (3 downto 0);
		I_SHIFT_IN: in std_logic;
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic; -- positive level triggering in problem 3
		enable:		in std_logic; -- 0: don't do anything; 1: shift_reg is enabled
		O:	out std_logic_vector(3 downto 0)
);
end shift_reg;

architecture behav of shift_reg is
	signal D: std_logic_vector(3 downto 0);
begin
	process(clock,enable) is
	begin
		if clock'event and clock='1' and enable='1' then--rising edge of clock
			if(sel="01") then --shift left
				D(3)<=D(2);
				D(2)<=D(1);
				D(1)<=D(0);
				D(0)<=I_SHIFT_IN;
			elsif(sel="10") then --shift right
				D(0)<=D(1);
				D(1)<=D(2);
				D(2)<=D(3);
				D(3)<=I_SHIFT_IN;
			elsif(sel="11") then --load
				D<=I;
			end if;
		elsif enable='0' then
			D<="0000";
		end if;

	end process;

	O<=D;

end behav;
