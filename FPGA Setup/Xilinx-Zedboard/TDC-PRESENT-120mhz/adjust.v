`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:05 02/14/2022 
// Design Name: 
// Module Name:    adjust 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module adjust(
input [7:0] count,
input en,
input clk,
input rstn,
output [4:0]CorseDelay,
output [1:0] FineDelay,
output err,
output done
    );

parameter countAim= 64;  // count 1s  1's occur when delay is high
parameter TDLLOW=    0;
parameter TDLHIGH=  31;
parameter LUTLOW=    0;
parameter LUTHIGH=   3;


parameter [3:0] 	STATE_RST	=0, 
						STATE_WAIT	=1, 
						STATE_CADJUST=2,
						STATE_CUP	 =3,
						STATE_CDOWN	 =4,
						STATE_FADJUST=5,
						STATE_WRAP	=6;
						
reg [3:0] STATE;
reg done, err;
reg [4:0] Cadjust;
reg [1:0] Fadjust;
								


always @(posedge clk) begin
	if (rstn == 0) begin
		STATE <= STATE_RST;		
	end
	
	case(STATE)
		STATE_RST: begin
				Cadjust <= 15;
				Fadjust <= 0;
				STATE   <= STATE_WAIT;
			end
		STATE_WAIT: begin
				if(en==1)
					STATE   <= STATE_CADJUST;
				
				done	<= 0;					
			end
		STATE_CADJUST: begin
				if (count > countAim)
					STATE   <= STATE_CDOWN;
				else
					STATE   <= STATE_CUP;
				
			end
		STATE_CUP:  begin
				if(Cadjust == TDLHIGH)
					err 	<= 1;
				else 
				   Cadjust <= Cadjust + 1; 
			end
		STATE_CDOWN:  begin
				if(Cadjust == TDLLOW)
					err 	<= 1;
				else 
				   Cadjust <= Cadjust - 1; 
				
				STATE   <= STATE_WRAP;
			end
		STATE_FADJUST: begin
				
			end
		STATE_WRAP: begin
				err	<= 0;
				done	<= 1;
				STATE   <= STATE_WAIT;	
		   end
	   
	endcase
	

end

endmodule
