`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:19 08/01/2021 
// Design Name: 
// Module Name:    rippleCA 
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



module autoMult #(parameter ASIZE=64, parameter BSIZE=2)
	(
	input [ASIZE-1:0] A,
	input [BSIZE-1:0] B,
	input clk,
	output [(ASIZE+BSIZE)-1:0] out

	);

	(* s = "true" *)reg [(ASIZE+BSIZE)-1:0] outreg;
	(* s = "true" *) wire [(ASIZE+BSIZE):0] mult;
	wire dummy;
	
	assign out=outreg;
	//assign {add,dummy} = {A,Cin} + {B, Cin};
	assign mult = A * B;

	always @(posedge clk) begin
			outreg <= mult[(ASIZE+BSIZE)-1:0];
	end


endmodule


module rippleCA#(parameter SIZE=64)
	(
	input [SIZE-1:0] A,
	input [SIZE-1:0] B,
	input clk,
	input CE,
	input Cin,
	output [SIZE:0] out
    ); 
	
	 (* s = "true" *) wire [SIZE:0] carry;
	 (* s = "true" *) wire [SIZE:0] Q;
	 (* s = "true" *) wire [SIZE:0] C;
	 (* s = "true" *) wire [SIZE:0] ST;
	 (* s = "true" *) wire [SIZE:0] CO;
	 
	 assign out[SIZE] = carry[i-1];
	 
	 genvar i, j;
	 generate
	 
	   for(i = 0; i < SIZE/4; i = i+1) 
			begin:gen_code_label1  
				
				if(i==0) begin
					//RCA C(A[i], B[i], 0, Q[i], carry[i]);
					
					 for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label2 
							FDCE #(
							.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
							) FDCE_inst (
							.Q(out[4*i+j]), // 1-bit Data output
							.C(clk), // 1-bit Clock input
							.CE(1'b1), // 1-bit Clock enable input
							.CLR(1'b0), // 1-bit Asynchronous clear input
							.D(Q[4*i+j]) // 1-bit Data input
							);

					  end
					  
					  for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label3 
							LUT6_2 #(
							.INIT(64'h0000008000000060) // Specify LUT Contents
							) LUT6_2_inst (
							.O6(C[4*i+j]), // 1-bit LUT6 output
							.O5(ST[4*i+j]), // 1-bit lower LUT5 output
							.I0(A[4*i+j]), // 1-bit LUT input
							.I1(B[4*i+j]), // 1-bit LUT input
							.I2(CE), // 1-bit LUT input
							.I3(1'b0), // 1-bit LUT input
							.I4(1'b0), // 1-bit LUT input
							.I5(1'b1) // 1-bit LUT input (fast MUX select only available to O6 output)
							);

					  end
					  
					  CARRY4 CARRY4_inst (
						.CO(CO[4*(i)+3:4*(i)]), // 4-bit carry out
						.O(Q[4*(i)+3:4*(i)]), // 4-bit carry chain XOR data out
						.CI(), // 1-bit carry cascade input
						.CYINIT(Cin), // 1-bit carry initialization
						.DI(ST[4*(i)+3:4*(i)]), // 4-bit carry-MUX data in
						.S(C[4*(i)+3:4*(i)]) // 4-bit carry-MUX select input
						);
				
					
				end
				else begin
					//RCA C(A[i], B[i], carry[i-1], Q[i], carry[i]);
					
					
					 for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label2 
							FDCE #(
							.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
							) FDCE_inst (
							.Q(out[4*i+j]), // 1-bit Data output
							.C(clk), // 1-bit Clock input
							.CE(1'b1), // 1-bit Clock enable input
							.CLR(1'b0), // 1-bit Asynchronous clear input
							.D(Q[4*i+j]) // 1-bit Data input
							);

					  end
					  
					  for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label3 
							LUT6_2 #(
							.INIT(64'h0000008000000060) // Specify LUT Contents
							) LUT6_2_inst (
							.O6(C[4*i+j]), // 1-bit LUT6 output
							.O5(ST[4*i+j]), // 1-bit lower LUT5 output
							.I0(A[4*i+j]), // 1-bit LUT input
							.I1(B[4*i+j]), // 1-bit LUT input
							.I2(CE), // 1-bit LUT input
							.I3(1'b0), // 1-bit LUT input
							.I4(1'b0), // 1-bit LUT input
							.I5(1'b1) // 1-bit LUT input (fast MUX select only available to O6 output)
							);

					  end
					  
					  CARRY4 CARRY4_inst (
						.CO(CO[4*(i)+3:4*(i)]), // 4-bit carry out
						.O(Q[4*(i)+3:4*(i)]), // 4-bit carry chain XOR data out
						.CI(CO[4*(i)-1]), // 1-bit carry cascade input
						.CYINIT(), // 1-bit carry initialization
						.DI(ST[4*(i)+3:4*(i)]), // 4-bit carry-MUX data in
						.S(C[4*(i)+3:4*(i)]) // 4-bit carry-MUX select input
						);
				
					
				end
			
			end
	  
	  endgenerate
	 
	

endmodule

module RCA
	(input A,
	input B,
	input Cin,
	output S,
	output Cout);

	
		//(* s = "true" *)  wire 
		
	 (* s = "true" *)  assign S = A ^ B ^ Cin;
	 (* s = "true" *)  assign Cout = (A & B)  |  (A & Cin)  |  (B & Cin);
	
endmodule



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:19 08/01/2021 
// Design Name: 
// Module Name:    rippleCA 
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
module rippleCA1#(parameter SIZE=64)
	(
	input [SIZE-1:0] A,
	input [SIZE-1:0] B,
	input clk,
	input CE,
	input Cin,
	output [SIZE:0] out
    ); 
	
	 (* s = "true" *) wire [SIZE:0] carry;
	 (* s = "true" *) wire [SIZE:0] Q;
	 (* s = "true" *) wire [SIZE:0] C;
	 (* s = "true" *) wire [SIZE:0] ST;
	 (* s = "true" *) wire [SIZE:0] CO;
	 
	 assign out[SIZE] = carry[i-1];
	 
	 genvar i, j;
	 generate
	 
	   for(i = 0; i < SIZE/4; i = i+1) 
			begin:gen_code_label1  
				
				if(i==0) begin
					//RCA C(A[i], B[i], 0, Q[i], carry[i]);
					
					 for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label2 
							FDCE #(
							.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
							) FDCE_inst (
							.Q(out[4*i+j]), // 1-bit Data output
							.C(clk), // 1-bit Clock input
							.CE(1'b1), // 1-bit Clock enable input
							.CLR(1'b0), // 1-bit Asynchronous clear input
							.D(Q[4*i+j]) // 1-bit Data input
							);

					  end
					  
					  for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label3 
							LUT6_2 #(
							.INIT(64'h0000008000000060) // Specify LUT Contents
							) LUT6_2_inst (
							.O6(C[4*i+j]), // 1-bit LUT6 output
							.O5(ST[4*i+j]), // 1-bit lower LUT5 output
							.I0(A[4*i+j]), // 1-bit LUT input
							.I1(B[4*i+j]), // 1-bit LUT input
							.I2(CE), // 1-bit LUT input
							.I3(1'b0), // 1-bit LUT input
							.I4(1'b0), // 1-bit LUT input
							.I5(1'b1) // 1-bit LUT input (fast MUX select only available to O6 output)
							);

					  end
					  
					  CARRY4 CARRY4_inst (
						.CO(CO[4*(i)+3:4*(i)]), // 4-bit carry out
						.O(Q[4*(i)+3:4*(i)]), // 4-bit carry chain XOR data out
						.CI(), // 1-bit carry cascade input
						.CYINIT(Cin), // 1-bit carry initialization
						.DI(ST[4*(i)+3:4*(i)]), // 4-bit carry-MUX data in
						.S(C[4*(i)+3:4*(i)]) // 4-bit carry-MUX select input
						);
				
					
				end
				else begin
					//RCA C(A[i], B[i], carry[i-1], Q[i], carry[i]);
					
					
					 for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label2 
							FDCE #(
							.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
							) FDCE_inst (
							.Q(out[4*i+j]), // 1-bit Data output
							.C(clk), // 1-bit Clock input
							.CE(1'b1), // 1-bit Clock enable input
							.CLR(1'b0), // 1-bit Asynchronous clear input
							.D(Q[4*i+j]) // 1-bit Data input
							);

					  end
					  
					  for(j = 0; j < 4; j = j+1) 
							begin:gen_code_label3 
							LUT6_2 #(
							.INIT(64'h0000008000000060) // Specify LUT Contents
							) LUT6_2_inst (
							.O6(C[4*i+j]), // 1-bit LUT6 output
							.O5(ST[4*i+j]), // 1-bit lower LUT5 output
							.I0(A[4*i+j]), // 1-bit LUT input
							.I1(B[4*i+j]), // 1-bit LUT input
							.I2(CE), // 1-bit LUT input
							.I3(1'b0), // 1-bit LUT input
							.I4(1'b0), // 1-bit LUT input
							.I5(1'b1) // 1-bit LUT input (fast MUX select only available to O6 output)
							);

					  end
					  
					  CARRY4 CARRY4_inst (
						.CO(CO[4*(i)+3:4*(i)]), // 4-bit carry out
						.O(Q[4*(i)+3:4*(i)]), // 4-bit carry chain XOR data out
						.CI(CO[4*(i)-1]), // 1-bit carry cascade input
						.CYINIT(), // 1-bit carry initialization
						.DI(ST[4*(i)+3:4*(i)]), // 4-bit carry-MUX data in
						.S(C[4*(i)+3:4*(i)]) // 4-bit carry-MUX select input
						);
				
					
				end
			
			end
	  
	  endgenerate
	 
	

endmodule

module RCA2
	(input A,
	input B,
	input Cin,
	output S,
	output Cout);

	
		//(* s = "true" *)  wire 
		
	 (* s = "true" *)  assign S = A ^ B ^ Cin;
	 (* s = "true" *)  assign Cout = (A & B)  |  (A & Cin)  |  (B & Cin);
	
endmodule
