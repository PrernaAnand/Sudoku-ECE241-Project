# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog FSM.v
vlog titleMemory.v
vlog easy_grid.v
vlog hard_grid.v
#vlog digitone.v
#vlog PS2_DEMO.v  (or whatever .v file the keyboard uses)
#vlog vga_address_translator.v

#vlog digittwo.v
#vlog digitthree.v
#vlog digitfour.v
#vlog digitfive.v
#vlog digitsix.v
#vlog digitseven.v
#vlog digiteight.v
#vlog digitnine.v

#starts the simulator using imagetester as top module
#vsim -L altera_mf_ver imagetester


#log all signals and add some signals to waveform window
log {/*}

# add wave {/*} would add all items in top level simulation module
add wave {/*}

#for clock_50
force {ClOCK_50} 0 0ns, 1 1ns -r 20ns

#initialise all to zero
force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 0

force {data_received} 8'd0

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 0
run 10ns

#forcing resetn :
force {KEY[3]} 1
run 10ns

#test case: making start=1=>goEasy=1=> Plot= one of allowed values=> go=1=>should go into next always block to DRAW_WAIT
force{SW[0]} 0
force {SW[1]} 1
force{SW[2]} 1
force {SW[3]} 0
force {data_received} 8'h6B
force {SW[9]} 1
run 38600ns

#at the end of this: LEDR[0]=OFF, LEDR[1]=OFF, LEDR[2]=OFF, LEDR[3]=ON, writeEn=1, ld_number=3'b100;

force {data_rec} 8'd0
run 100ns
 
force {KEY[3]} 1  
run 100ns

force {KEY[3]} 0
run 100ns

