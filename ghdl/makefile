CC = /home/abraham/MIA/ghdl/bin/ghdl
LIB = --ieee=standard

shift: shift_reg.vhdl shift_reg_tb.vhdl
	$(CC) -e $(LIB) shift_reg_tb;
shift_reg.vhdl:
	$(CC) -a $(LIB) ../shift_reg.vhdl
shift_reg_tb.vhdl:
	$(CC) -a $(LIB) ../shift_reg_tb.vhdl

shift8b: shift_reg_8bit.vhdl shift_reg_8bit_tb.vhdl
	$(CC) -e $(LIB) shift_reg_8bit_tb
shift_reg_8bit.vhdl:
	$(CC) -a $(LIB) ../shift_reg_8bit.vhdl
shift_reg_8bit_tb.vhdl:
	$(CC) -a $(LIB) ../shift_reg_8bit_tb.vhdl

mux: mux_4to1.vhdl mux_4to1_tb.vhdl
	$(CC) -e $(LIB) mux_4to1_tb;
mux_4to1.vhdl:
	$(CC) -a $(LIB) ../mux_4to1.vhdl
mux_4to1_tb.vhdl:
	$(CC) -a $(LIB) ../mux_4to1_tb.vhdl

demux:types.vhdl demux.vhdl demux_tb.vhdl
	$(CC) -e $(LIB) demux_tb
demux.vhdl:
	$(CC) -a $(LIB) ../demux.vhdl
demux_tb.vhdl:
	$(CC) -a $(LIB) ../demux_tb.vhdl
types.vhdl:
	$(CC) -a $(LIB) ../types.vhdl
clean:
	rm *.o *.cf
