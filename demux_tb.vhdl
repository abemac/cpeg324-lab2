library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;
use work.types.all;
entity demux_tb is
end demux_tb;

architecture behavioral of demux_tb is
  component demux is
    generic(x : positive;
            y : positive);

    port(in_vec : in std_logic_vector((x-1) downto 0);
         sel : in std_logic_vector((y-1) downto 0);
         en : in std_logic;
         out_vecs : out mult_arr((2**y-1) downto 0,(x-1) downto 0)
    );
  end component demux;
  --testing x=2,y=3 (1 to 8 mux with data_width 2)
  signal in_vec : std_logic_vector(1 downto 0) :="11";
  signal sel : std_logic_vector (2 downto 0) :="000";
  signal en :std_logic:='1';
  signal demux_out : mult_arr(7 downto 0,1 downto 0);

  --needed so simulator dumps for gtkwave
  signal out0 : std_logic_vector(1 downto 0);
  signal out1 : std_logic_vector(1 downto 0);
  signal out2 : std_logic_vector(1 downto 0);
  signal out3 : std_logic_vector(1 downto 0);
  signal out4 : std_logic_vector(1 downto 0);
  signal out5 : std_logic_vector(1 downto 0);
  signal out6 : std_logic_vector(1 downto 0);
  signal out7 : std_logic_vector(1 downto 0);


begin
  d_mux : demux generic map (x => 2,y => 3)
                port map(in_vec,sel,en,demux_out);

  testbench : process
  begin
    en<='1';
    sel<="000";
    for i in 0 to 7 loop
      wait for 5 ns;
      for j in 0 to 7 loop
        if(i=j) then
          assert demux_out(j,0)= '1' report "bad output" severity error;
          assert demux_out(j,1)='1' report "bad output" severity error;
        else
          assert demux_out(j,0)='0' report "bad output" severity error;
          assert demux_out(j,1)='0' report "bad output" severity error;
        end if;
      end loop;
      sel <= std_logic_vector( unsigned(sel) + 1 ) ;
    end loop;

    --turn enable off and run again
    en<='0';
    sel<="000";
    for i in 0 to 7 loop
      wait for 5 ns;
      for j in 0 to 7 loop
        assert demux_out(i,0)='0' report "bad output" severity error;
        assert demux_out(i,1)='0' report "bad output" severity error;
      end loop;
      sel <= std_logic_vector( unsigned(sel) + 1 ) ;
    end loop;

    report "testbench completed";
    wait;
  end process;

  --needed so simulator dumps for gtkwave
  out0(1)<=demux_out(0,1);
  out0(0)<=demux_out(0,0);
  out1(1)<=demux_out(1,1);
  out1(0)<=demux_out(1,0);
  out2(1)<=demux_out(2,1);
  out2(0)<=demux_out(2,0);
  out3(1)<=demux_out(3,1);
  out3(0)<=demux_out(3,0);
  out4(1)<=demux_out(4,1);
  out4(0)<=demux_out(4,0);
  out5(1)<=demux_out(5,1);
  out5(0)<=demux_out(5,0);
  out6(1)<=demux_out(6,1);
  out6(0)<=demux_out(6,0);
  out7(1)<=demux_out(7,1);
  out7(0)<=demux_out(7,0);

end architecture;
