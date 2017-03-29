--x bit, 2^y demux
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;
use work.types.all;

entity demux is
  generic(x : positive;
          y : positive);

  port(in_vec : in std_logic_vector((x-1) downto 0);
       sel : in std_logic_vector((y-1) downto 0);
       en : in std_logic;
       out_vecs : out mult_arr((2**y-1) downto 0,(x-1) downto 0)
  );
end entity demux;

architecture behavioral of demux is
begin
  process(sel,en,in_vec) is
  variable sel_val: integer:= to_integer(unsigned(sel));
  constant out_width: integer :=2**y-1;
  constant data_width: integer:=x-1;
  begin
    sel_val:= to_integer(unsigned(sel));
    if(en ='1') then
       for i in 0 to out_width loop
         if( i=sel_val ) then
           for j in 0 to data_width loop
             out_vecs(i,j) <= in_vec(j);
           end loop;
         else
           for j in 0 to data_width loop
             out_vecs(i,j) <= '0';
           end loop;
         end if;
      end loop;
    else
      for i in 0 to out_width loop
        for j in 0 to data_width loop
          out_vecs(i,j)<='0';
        end loop;
      end loop;
    end if;
  end process;
end architecture;
