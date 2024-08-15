`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:00 08/03/2021 
// Design Name: 
// Module Name:    delay 
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
module delay #(parameter DELAY=1)
	(
	input in,
	output delay
    );


	  (* s = "true" *)   wire [DELAY:0] delLATCH; 
	  assign delLATCH[0] =in;
	  
	  assign delay= delLATCH[DELAY];
	  genvar i;
	  generate
        for(i = 0; i < DELAY; i = i+1) 
		  begin:gen_code_label3
   
//			if(i==0) begin
//	
//			 (* keep = "true" *) (* s = "true" *)            LUT5 #(
//            .INIT(32'hffff0000) // Specify LUT Contents .INIT(32'h00000000)
//                ) LUT1_insti (
//                .O(delLUT[i]), // LUT general output
//                //.I0(clk) // LUT input
//                .I4(in), // LUT input
//                .I3(1'b0), // LUT input
//                .I2(1'b0), // LUT input
//                .I1(1'b0), // LUT input
//                .I0(1'b0) // LUT input
//                );
 
//				 (* keep = "true" *) (* s = "true" *)    LDCE #(
//            .INIT(1'b0) // Initial value of latch (1'b0 or 1'b1)
//            ) LDCE_Delayi (
//            //.Q(delLATCH[i]), // Data output
//            .Q(delLATCH[i]), // Data output
//            .CLR(1'b0), // Asynchronous clear/reset input
//            .D(delLUT[i]), // Data input
//            .G(1'b1), // Gate input
//            .GE(1'b1) // Gate enable input
//            );
	
//			end
//			else begin
	
				(* keep = "true" *) (* s = "true" *)  LUT5 #(
            .INIT(32'hffff0000) // Specify LUT Contents
                ) LUT1_insti (
                .O(delLATCH[i+1]), // LUT general output
                .I4(delLATCH[i]), // LUT input
					 .I3(1'b0), // LUT input
                .I2(1'b0), // LUT input
                .I1(1'b0), // LUT input
                .I0(1'b0) // LUT input
                );
//				(* keep = "true" *) (* s = "true" *)   LDCE #(
//            .INIT(1'b0) // Initial value of latch (1'b0 or 1'b1)
//            ) LDCE_Delayi (
//            .Q(delLATCH[i]), // Data output
//            .CLR(1'b0), // Asynchronous clear/reset input
//            .D(delLUT[i-1]), // Data input
//            .G(1'b1), // Gate input
//            .GE(1'b1) // Gate enable input
//            );	 
//			end			 
        end
    endgenerate

	

endmodule
