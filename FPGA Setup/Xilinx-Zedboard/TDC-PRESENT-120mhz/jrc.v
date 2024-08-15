`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:37 04/01/2020 
// Design Name: 
// Module Name:    jrc 
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
module jrc(
	input CE,
	input C,
	input R,
	output [9:0] Q
    );
	
reg [9:0] Qt;
 
always @(posedge C)
begin
 
if(R==1)
 Qt<=10'h0;
 else if(CE==1)
 	begin
		Qt[9]<=Qt[8];
		Qt[8]<=Qt[7];
		Qt[7]<=Qt[6];
		Qt[6]<=Qt[5];
		Qt[5]<=Qt[4];
		Qt[4]<=Qt[3];
 		Qt[3]<=Qt[2];
  		Qt[2]<=Qt[1];
  		Qt[1]<=Qt[0];
   	Qt[0]<=(~Qt[9]);
 	end
 end
 
assign Q=Qt;  

endmodule
