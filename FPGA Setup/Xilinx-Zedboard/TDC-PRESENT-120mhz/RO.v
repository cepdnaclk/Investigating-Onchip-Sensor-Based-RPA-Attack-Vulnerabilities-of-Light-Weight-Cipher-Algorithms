`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:23 03/26/2020 
// Design Name: 
// Module Name:    RO 
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
module RO_LUT5(
(* s = "true" *)input en,
(* s = "true" *)input en1,
(* s = "true" *)input en2,
(* s = "true" *)input en3

//(* s = "true" *)  output clk
    );

(* s = "true" *) wire clk;

//LUT2 #(
//.INIT(4'b0100) // Specify LUT Contents
//) LUT2_inst (
//.O(clk), // LUT general output
//.I0(clk), // LUT input
//.I1(en) // LUT input
//);

LUT5 #(
.INIT(32'b01010101010101010101010101010100) // Specify LUT Contents
) LUT5_inst (
.O(clk), // LUT general output
.I0(clk), // LUT input
.I1(en), // LUT input
.I2(en1), // LUT input
.I3(en2), // LUT input
.I4(en3) // LUT input
);

//SRL16E #(
//.INIT(16'hAAAA) // Initial Value of Shift Register
//) SRL16E_inst (
//.Q(temp), // SRL data output
//.A0(0), // Select[0] input
//.A1(0), // Select[1] input
//.A2(0), // Select[2] input
//.A3(0), // Select[3] input
//.CE(en), // Clock enable input
//.CLK(clk), // Clock input
//.D(temp) // SRL data input
//);

//wire clk;
endmodule

module RO_Lut62(
(* s = "true" *)input en

//(* s = "true" *)  output clk
    );

(* s = "true" *) wire RO, RO1;

LUT6_2 #(
.INIT(64'h555500000f0f0000) // Specify LUT Contents
) LUT6_2_inst (
.O6(RO), // 1-bit LUT6 output
.O5(RO1), // 1-bit lower LUT5 output
.I0(RO), // 1-bit LUT input
.I1(1'b0), // 1-bit LUT input
.I2(RO1), // 1-bit LUT input
.I3(1'b0), // 1-bit LUT input
.I4(en), // 1-bit LUT input
.I5(1'b1) // 1-bit LUT input (fast MUX select only available to O6 output)
);

endmodule


module RO1(
(* s = "true" *)input en,
(* s = "true" *)input en1,
(* s = "true" *)  output out
    );
wire out;
(* s = "true" *)wire clk, clk1;
LUT3 #(
.INIT(4'b010000) // Specify LUT Contents
) LUT3_inst (
.O(clk), // LUT general output
.I0(clk), // LUT input
.I1(en), // LUT input
.I2(en1) // LUT input
);

            (* s = "true" *)   LDPE #(
            .INIT(1'b0) // Initial value of latch (1'b0 or 1'b1)
            ) LDPE_insti (
            .Q(out), // Data output
            .PRE(1'b0), // Asynchronous clear/reset input
            .D(clk), // Data input
            .G(1'b1), // Gate input
            .GE(1'b1) // Gate enable input
            );

//
//FDCE #(
//.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
//) FDCE_inst (
//.Q(clk1), // 1-bit Data output
//.C(C), // 1-bit Clock input
//.CE(en), // 1-bit Clock enable input
//.CLR(CLR), // 1-bit Asynchronous clear input
//.D(D) // 1-bit Data input
//);


endmodule


module RO_Lut(
(* s = "true" *)input en

//(* s = "true" *)  output clk
    );

(* s = "true" *) wire clk;

LUT2 #(
.INIT(4'b0100) // Specify LUT Contents
) LUT2_inst (
.O(clk), // LUT general output
.I0(clk), // LUT input
.I1(en) // LUT input
);


//SRL16E #(
//.INIT(16'hAAAA) // Initial Value of Shift Register
//) SRL16E_inst (
//.Q(temp), // SRL data output
//.A0(0), // Select[0] input
//.A1(0), // Select[1] input
//.A2(0), // Select[2] input
//.A3(0), // Select[3] input
//.CE(en), // Clock enable input
//.CLK(clk), // Clock input
//.D(temp) // SRL data input
//);

//wire clk;
endmodule
