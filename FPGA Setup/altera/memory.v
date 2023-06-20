//////////////////////////////////
// cipher memory is used by AES circuit to store pt, ct and key
//////////////////////////////////
module cipher_memory (
	input w_clk,
	input r_clk,
	input rstn,
	input r_en,  // 0 read; 1 write
	input w_en,
	input [15:0]r_addr, 
	input [2:0]w_memsel,
	input [2:0]r_memsel,
	input [127:0]w_data,
	output [7:0]r_data,
	output r_dvld,
	output w_dvld
);


	reg [127:0] ctMemory;  	  
	reg [127:0] keyMemory;
   reg [127:0] ptMemory;
   
   
	reg w_data_valid, r_data_valid, transmit_reg;
	wire [7:0] read_datareg;
	reg  [7:0] TX_data;
	//wire tx_uart;
	
	//uart_tx uartTX(.i_Clock(w_clk), .i_Tx_DV(transmit_reg), .i_Tx_Byte(TX_data), .o_Tx_Active(), .o_Tx_Serial(tx_uart), .o_Tx_Done() );		
 
	
	assign r_data  = gen_output(r_en, r_addr, r_memsel);
	
	function [7:0] gen_output;
		input en;
		input [7:0] addr;
		input [2:0] memsel;
		begin
		case(memsel)
			3'b001:   // key memory
				begin
case(addr)
					8'b0000_0000:
						gen_output = keyMemory[127: 120];
					8'b0000_0001:
						gen_output = keyMemory[119: 112];
					8'b0000_0010:
						gen_output = keyMemory[111: 104];
					8'b0000_0011:
						gen_output = keyMemory[103: 96];
					8'b0000_0100:
						gen_output = keyMemory[95: 88];
					8'b0000_0101:
						gen_output = keyMemory[87: 80];
					8'b0000_0110:
						gen_output = keyMemory[79: 72];
					8'b0000_0111:
						gen_output = keyMemory[71: 64];
					8'b0000_1000:
						gen_output = keyMemory[63: 56];
					8'b0000_1001:
						gen_output = keyMemory[55: 48];
					8'b0000_1010:
						gen_output = keyMemory[47: 40];
					8'b0000_1011:
						gen_output = keyMemory[39: 32];
					8'b0000_1100:
						gen_output = keyMemory[31: 24];
					8'b0000_1101:
						gen_output = keyMemory[23: 16];
					8'b0000_1110:
						gen_output = keyMemory[15: 8];
					8'b0000_1111:
						gen_output = keyMemory[7: 0];
					endcase	
								
				end
			3'b010:   // pt memory
				begin
					case(addr)
					8'b0000_0000:
						gen_output = ptMemory[127: 120];
					8'b0000_0001:
						gen_output = ptMemory[119: 112];
					8'b0000_0010:
						gen_output = ptMemory[111: 104];
					8'b0000_0011:
						gen_output = ptMemory[103: 96];
					8'b0000_0100:
						gen_output = ptMemory[95: 88];
					8'b0000_0101:
						gen_output = ptMemory[87: 80];
					8'b0000_0110:
						gen_output = ptMemory[79: 72];
					8'b0000_0111:
						gen_output = ptMemory[71: 64];
					8'b0000_1000:
						gen_output = ptMemory[63: 56];
					8'b0000_1001:
						gen_output = ptMemory[55: 48];
					8'b0000_1010:
						gen_output = ptMemory[47: 40];
					8'b0000_1011:
						gen_output = ptMemory[39: 32];
					8'b0000_1100:
						gen_output = ptMemory[31: 24];
					8'b0000_1101:
						gen_output = ptMemory[23: 16];
					8'b0000_1110:
						gen_output = ptMemory[15: 8];
					8'b0000_1111:
						gen_output = ptMemory[7: 0];
					endcase

						
				end
			3'b100:   // ct memory
				begin
					case(addr)
					8'b0000_0000:
						gen_output = ctMemory[127: 120];
					8'b0000_0001:
						gen_output = ctMemory[119: 112];
					8'b0000_0010:
						gen_output = ctMemory[111: 104];
					8'b0000_0011:
						gen_output = ctMemory[103: 96];
					8'b0000_0100:
						gen_output = ctMemory[95: 88];
					8'b0000_0101:
						gen_output = ctMemory[87: 80];
					8'b0000_0110:
						gen_output = ctMemory[79: 72];
					8'b0000_0111:
						gen_output = ctMemory[71: 64];
					8'b0000_1000:
						gen_output = ctMemory[63: 56];
					8'b0000_1001:
						gen_output = ctMemory[55: 48];
					8'b0000_1010:
						gen_output = ctMemory[47: 40];
					8'b0000_1011:
						gen_output = ctMemory[39: 32];
					8'b0000_1100:
						gen_output = ctMemory[31: 24];
					8'b0000_1101:
						gen_output = ctMemory[23: 16];
					8'b0000_1110:
						gen_output = ctMemory[15: 8];
					8'b0000_1111:
						gen_output = ctMemory[7: 0];
					endcase
				
				end
			default:   // wrong memsel
				begin
						gen_output = 8'hf0;
				end
		endcase
		end

	endfunction
	
	
//	
//	
//   // cipher memory
//	always @(posedge w_clk or negedge rstn) begin
//		if(rstn<= 1'b0) begin
//		
//		   r_data_valid 	 <= 1'b0;	
//			read_datareg <= 8'h0;
//		end
//		else  begin
//			if(r_en == 1'b0) begin
//				case(r_memsel)
//					3'b001:   // key memory
//						begin
//							r_data_valid 	 	<= 1'b1;
//							read_datareg	<= keyMemory[(r_addr*8+7): r_addr*8];
//								
//						end
//					3'b010:   // pt memory
//						begin
//							read_datareg	<= ptMemory[(r_addr*8+7): r_addr*8];
//							r_data_valid 	 	<= 1'b1;
//							
//						end
//					3'b100:   // ct memory
//						begin
//							r_data_valid 	 	<= 1'b1;
//							read_datareg	<= ctMemory[(r_addr*8+7): r_addr*8];
//						end
//					default:   // wrong memsel
//						begin
//							r_data_valid 	 	<= 1'b0;
//						end
//				endcase
//			
//			end
//					
//					
//		end
//		
//		
//	end
	
	
	always @(posedge w_clk or negedge rstn) begin
		if(rstn == 1'b0) begin
		   w_data_valid 	 <= 1'b0;	
		end
		else  begin
			if(w_en == 1'b1) begin
				case(w_memsel)
					3'b001:   // key memory
						begin
							w_data_valid 	 	<= 1'b1;
						   keyMemory			<= w_data;
								
						end
					3'b010:   // pt memory
						begin
							w_data_valid 	 	<= 1'b1;
							ptMemory          <= w_data;
							
						end
					3'b100:   // ct memory
						begin
							w_data_valid 	 	<= 1'b1;
							ctMemory	<= w_data;
							
						end
					default:  // wrong memsel
						begin
							w_data_valid 	 	<= 1'b0;
							transmit_reg		<= 1'b0;
							
						end
				endcase
			
			end
			else begin
				w_data_valid 	 	<= 1'b0;
				
			end
					
					
		end
		
		
	end
	
	
	endmodule
	
	
//////////////////////////////////
// trace memory saves on-chip sensor data. We want trace memory to be implented as a block ram
//////////////////////////////////
	module trace_memory
	(
	input 			w_clk,
	input 			r_clk,
	input 			rstn,
	input 			r_en,  // 0 read; 1 write
	input 			w_en,  // 0 read; 1 write
	input [15:0]	w_addr,
	input [15:0]	r_addr,	
	input [2:0]		r_memsel, // 0-wire plaintext; 1-wire key; 2- wire ciphertext;
	input [2:0]		w_memsel, // 0-wire plaintext; 1-wire key; 2- wire ciphertext;
	input [7:0]		w_data,   // we save 127bit data in registers-- then read 8 bit 
	output [7:0]	r_data    // we read 8 bits this is what UART can handle 
	);
	
//cipher_memory cm0 (.w_clk(clk1), .r_clk(clk1), .rstn(c10_resetn), .r_en(), .w_en(), .r_addr(), .w_memsel(), .r_memsel() .w_data(), .r_data(), .r_dvld(), .w_dvld());
//trace_memory  tm0 (.w_clk(clk0), .r_clk(clk1), .rstn(c10_resetn), .r_en(), .w_en(), .w_addr(), .r_addr(), .r_memsel(), .w_memsel(), .w_data(), .r_data(), .r_dvld(), .w_dvld());
	
	reg [7:0] traceMemory  [1023:0];
	reg r_data_valid, w_data_valid;
	reg [7:0] read_datareg;
	
	
	assign r_data   = read_datareg;
	assign r_valid  = r_data_valid;
	assign w_valid  = w_data_valid;
	
		always @(posedge r_clk or negedge rstn) begin
		if(rstn == 1'b0) begin
		
		   r_data_valid 	 <= 1'b0;	
			read_datareg <= 8'h0;
		end
		else  begin
			if(r_en == 1'b1) begin
				case(r_memsel)
					3'b001:   // trace memory
						begin
							r_data_valid 	 	<= 1'b1;
							read_datareg	<= traceMemory[r_addr];
								
						end
					default:   // wrong memsel
						begin
							r_data_valid 	 	<= 1'b0;
						end
				endcase
			
			end
								
					
		end
		
		
	end
	
	
	always @(posedge w_clk or negedge rstn) begin
		if(rstn == 1'b0) begin
		
		   w_data_valid 	 <= 1'b0;	
		end
		else  begin
			
			if(w_en == 1'b1) begin
				case(w_memsel)
					3'b001:   // trace memory
						begin
							w_data_valid 	 	<= 1'b1;
						   traceMemory[w_addr] <= w_data;
								
						end
					default:  // wrong memsel
						begin
							w_data_valid 	 	<= 1'b0;
						end
				endcase
			
			end
					
					
		end
		
		
	end
	
	
	
	
	endmodule
	