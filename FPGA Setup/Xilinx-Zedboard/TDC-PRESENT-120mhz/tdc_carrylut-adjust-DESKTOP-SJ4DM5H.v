`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:09 11/27/2020 
// Design Name: 
// Module Name:    tdc_carrylut-adjust 
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



module tdc_carrylut_adjust #(parameter size =40, parameter adsize=40)
(input clk,
input[adsize*4-1:0] adjust,
output[(size*4)-1:0] out1
    );
    
  (* s = "true" *)   wire [size*4-1:0] co1;
  (* s = "true" *)   wire [size*4-1:0] do1;
  (* s = "true" *)   reg [size*4-1:0] regOut;
  (* s = "true" *)   wire [4*adsize-1:0] delLATCH, delLUT;     
  (* s = "true" *)   wire [4*adsize-1:0] delCarry, S, D;
  (* s = "true" *)   wire [4*adsize-1:0] CO;  
  (* s = "true" *)   wire [4*adsize-1:0] CICOConnect;    



 genvar i,j;
    generate
        for(i = 0; i < size; i = i+1) 
		  begin:gen_code_label1  
            
				
				if (i==0) begin
				(* keep = "true" *) (* s = "true" *)    CARRY4 CARRY4_insti (
            .CO(co1[(((i+1)*4)-1):(i*4)]), // 4-bit carry out
            .O(), // 4-bit carry chain XOR data out
            .CI(), // 1-bit carry cascade input CO[11]
            .CYINIT(clk), // 1-bit carry initialization  delLUT[i]
            //.CYINIT(delLUT[delsize-1]), // 1-bit carry initialization  delLUT[i]
            .DI(D[(i*4)+j]), // 4-bit carry-MUX data in
            .S(S[(i*4)+j]) // 4-bit carry-MUX select input
            );
				
				
				for(j=0;	j<4;	j=j+1)
				begin:gen_code_label31
										
					(* keep = "true" *) (* s = "true" *)  LUT6_2 #(
					.INIT(64'hFFFF00000000FF00) // Specify LUT Contents
					) LUT1_inst0i (
					.O6(S[(i*4)+j]), // 1-bit LUT6 output
					.O5(D[(i*4)+j]), // 1-bit lower LUT5 output
					.I0(I0), // 1-bit LUT input
					.I1(I1), // 1-bit LUT input
					.I2(I2), // 1-bit LUT input
					.I3(delLATCH[(i*4)+j]), // 1-bit LUT input
					.I4(adjust[(i*4)+j]), // 1-bit LUT input
					.I5(1'b1) // 1-bit LUT input (fast MUX select only available to O6 output)
					);
					
				end	
		
				end
				else begin
				
				 (* keep = "true" *) (* s = "true" *)    CARRY4 CARRY4_insti (
            .CO(co1[(((i+1)*4)-1):(i*4)]), // 4-bit carry out
            .O(), // 4-bit carry chain XOR data out
            .CI(co1[(i*4)-1]), // 1-bit carry cascade input
            .CYINIT(1'b0), // 1-bit carry initialization
            .DI(4'h0), // 4-bit carry-MUX data in
            .S(4'hF) // 4-bit carry-MUX select input
            );
				
//				for(j=0;	j<4;	j=j+1)
//				begin:gen_code_label31
//					// LUT6_2: 6-input, 2 output Look-Up Table
//					// 7 Series
//					// Xilinx HDL Libraries Guide, version 2012.2
//					
//					(* keep = "true" *) (* s = "true" *)  LUT6_2 #(
//					.INIT(64'hFFFF00000000FF00) // Specify LUT Contents
//					) LUT1_inst0i (
//					.O6(S[(i*4)+j]), // 1-bit LUT6 output
//					.O5(D[(i*4)+j]), // 1-bit lower LUT5 output
//					.I0(I0), // 1-bit LUT input
//					.I1(I1), // 1-bit LUT input
//					.I2(I2), // 1-bit LUT input
//					.I3(delLATCH[(i*4)+j]), // 1-bit LUT input
//					.I4(adjust[(i*4)+j]), // 1-bit LUT input
//					.I5(1'b1) // 1-bit LUT input (fast MUX select only available to O6 output)
//					);
//					
//				end
//				
				
				end
       end  
    endgenerate 



  generate
        for(i = 0; i < size*4; i = i+1) 
		  begin:gen_code_label2
			 (* s = "true" *)   LDPE #(
            .INIT(1'b0) // Initial value of latch (1'b0 or 1'b1)
            ) LDPE_insti (
            .Q(out1[i]), // Data output
            .PRE(1'b0), // Asynchronous clear/reset input
            .D(co1[i]), // Data input
            .G(clk), // Gate input
            .GE(1'b1) // Gate enable input
            );
			
				
        end
    endgenerate
				
    
endmodule
