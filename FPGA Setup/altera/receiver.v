//////////////////////////////////
// receiver accepts inputs from PC - FTDI chip
//////////////////////////////////
module receiver(
	input 		clk,
	input			rstn,
	input			start,
	input	 		rx,
	input[7:0] 	addr,
	output		ready,
	output[7:0]	data
);

	
	
	parameter NUM_ELEMENTS = 4;
	
	parameter WAIT 		=	8'b00000000,
				 READ 		=	8'b00010000,
				 UART_WAIT	=	8'b00100000,
				 DONE			=	8'b00110000;
				 
	reg 	[7:0]	 STATE, read_reg, memory_addr;
	reg   [7:0]  data_memory	[NUM_ELEMENTS:0]; // main array to which we read data from uart rx
	reg	ready_reg;
	wire  [7:0]  uart_data;
	wire  		 data_available;
	
	uart_rx ur0 (.i_Clock(clk), .i_Rx_Serial(rx), .o_Rx_DV(data_available), .o_Rx_Byte(uart_data));
	
	assign data = read_reg;
	assign ready= ready_reg;
	
	always @(posedge clk or negedge rstn) 
		begin
			if(rstn == 1'b0) begin
				
				memory_addr		<= 8'h0;
				STATE				<= WAIT; 
				ready_reg		<= 1'b0;
			end
			else begin
				read_reg <= data_memory[addr];
				
				case(STATE)
					WAIT:
						begin
						memory_addr		<= 8'h0;
						ready_reg		<= 1'b0;
						
						if(start == 1'b1)
							STATE			<= READ;
						
						
						end
					READ:
						begin
							if(data_available == 1'b1) begin
								STATE								<= UART_WAIT;
								data_memory[memory_addr]	<= uart_data;
							end
							
						end
					UART_WAIT:
						begin
							if(memory_addr == NUM_ELEMENTS-1) begin
								STATE								<= DONE;
								memory_addr						<= 8'b0;
							end
							else begin
								memory_addr						<= memory_addr + 1'b1;
								STATE								<= READ;
							end
								
						end
					DONE:
						begin
							ready_reg		<= 1'b1;
							STATE				<= WAIT;
						end
				endcase
			end
		
		end
	
	

endmodule
