CC = /home/abraham/MIA/ghdl/bin/ghdl
LIB = --ieee=standard

shift: shift_reg.vhdl shift_reg_tb.vhdl
	$(CC) -e $(LIB) shift_reg_tb;
shift_reg.vhdl:
	$(CC) -a $(LIB) ../shift_reg.vhdl
shift_reg_tb.vhdl:
	$(CC) -a $(LIB) ../shift_reg_tb.vhdl


mux: mux_4to1.vhdl mux_4to1_tb.vhdl
	$(CC) -e $(LIB) mux_4to1_tb;
mux_4to1.vhdl:
	$(CC) -a $(LIB) ../mux_4to1.vhdl
mux_4to1_tb.vhdl:
	$(CC) -a $(LIB) ../mux_4to1_tb.vhdl
