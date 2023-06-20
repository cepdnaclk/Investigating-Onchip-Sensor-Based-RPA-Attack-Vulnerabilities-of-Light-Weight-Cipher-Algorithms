////////////////////////////////////
// Clock manager genrates all the necessary clocks for different hardware components of the FPGA
//////////////////////////////////


module clock(
	input clkin,
	input rst,
	output clk0,
	output clk1,
	output locked
	);

	
// WIRES AND REGS
	
	wire locked_local;

// MODULES	
 pll p1( .areset(rst), .inclk0(clkin), .c0(clk0), .c1(clk1), .locked(locked_local));

 
// ASSIGN  
	assign locked = locked_local;
 
endmodule