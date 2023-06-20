//////////////////////////////////
// sends pass outputs (pt, ct, key and Trace memory) to PC via FTDI chip
//////////////////////////////////

module sender
 (
	input 		clk,
	input 		rstn,
	input[4:0]	transmit_sel,
	input			transmit_en,
	input[7:0]  cipher_data,
	output 		cipher_r_en,
	output[2:0]	cipher_mem_sel,
	output[15:0]cipher_addr,
	output 		trace_r_en,
	input[7:0]  trace_data,
	output[2:0]	trace_mem_sel,
	output[15:0]	trace_addr,
	output 		transmit_done,
	output tx,
	output [7:0] param_addr,
	input  [7:0] param_data
 );
 
 // states
 parameter RESET				 	= 8'b0000_1000,
			WAIT					 	= 8'b0000_0000,
			TRANSMIT_PT			 	= 8'b0010_0000,
			TRANSMIT_PT_DONE	 	= 8'b0010_1000,
			TRANSMIT_PT_UART_DONE= 8'b0010_1001,
			TRANSMIT_KEY		 	= 8'b0011_0000,
			TRANSMIT_KEY_DONE	 	= 8'b0011_1000,
			TRANSMIT_KEY_UART_DONE=8'b0011_1001,
			TRANSMIT_CT			 	= 8'b0100_0000,
			TRANSMIT_CT_DONE	 	= 8'b0100_1000,
			TRANSMIT_CT_UART_DONE= 8'b0100_1001,
			TRANSMIT_TRACE		 	= 8'b0111_0000,
			TRANSMIT_TRACE_DONE	= 8'b0111_1000,
			TRANSMIT_TRACE_UART_DONE= 8'b0111_1100,
			WRAP_UP  			 	= 8'b1000_0000,
			DELAY    			 	= 8'b1001_0000,
			TRANSMIT_PARAM		 	= 8'b1010_0000,
			TRANSMIT_PARAM_DONE 	= 8'b1010_0001,
			TRANSMIT_PARAM_UART_DONE= 8'b1010_0010; 
 
		parameter NUM_ELEMENTS = 4;
 
 // regs
 reg [7:0]	STATE;
 reg 			transmit_reg, cipher_r_en_reg, transmit_r_done, trace_mem_sel_reg, trace_r_en_reg;
 reg [2:0]  cipher_mem_sel_reg;
 reg [7:0]	TX_data;
 reg [15:0] addr;
 
 // wires
 wire		tx_active, TX_done;
 wire		tx_uart;
 
 // instances
 uart_tx uartTX(.i_Clock(clk), .i_Tx_DV(transmit_reg), .i_Tx_Byte(TX_data), .o_Tx_Active(tx_active), .o_Tx_Serial(tx_uart), .o_Tx_Done(TX_done) );		
 
 
 // assign
 assign tx					= tx_uart;
 assign cipher_addr		= addr;
 assign cipher_mem_sel	= cipher_mem_sel_reg;
 assign cipher_r_en		= cipher_r_en_reg;
 assign transmit_done	= transmit_r_done;
 
 assign trace_addr		= addr;
 assign trace_mem_sel  	= trace_mem_sel_reg;
 assign trace_r_en		= trace_r_en_reg;
 assign param_addr		= addr;
 
 always @(posedge clk or negedge rstn)
	begin
		if(rstn == 1'b0)
			begin
				transmit_reg 	<=	1'b0;	
				TX_data			<= 8'b0;
				transmit_r_done<= 1'b0;
				trace_r_en_reg <= 1'b0;
				STATE			   <= WAIT;			 
			end
		else
			begin
				case(STATE)
				  WAIT:
						begin
							transmit_reg 	<=	1'b0;	
							TX_data			<= 8'h0;							
							addr				<= 16'h0;
							transmit_r_done<= 1'b0;
							trace_r_en_reg <= 1'b0;
							// memsel decoder
							if(transmit_en == 1'b1)	begin
								case(transmit_sel)
									5'b00001: // transmit key
										begin
											STATE			<= TRANSMIT_KEY;
										end
									5'b00010: // transmit pt
										STATE			   <= TRANSMIT_PT;
										
									5'b00100: // transmit ct
										STATE			   <= TRANSMIT_CT;
										
									5'b01000: // transmit trace
										STATE			   <= TRANSMIT_TRACE;
									5'b10000: // transmit trace
										STATE			   <= TRANSMIT_PARAM;
									default:
										STATE			   <= WAIT;
								endcase
							end
							else begin
								transmit_r_done<= 1'b0;
							end
						end
						
				TRANSMIT_KEY:
					begin
						if(addr == 16) begin
							//addr 				<= 16'h0;
							transmit_reg 	<=	1'b0;
							TX_data			<= 8'b0;
							transmit_reg	<= 1'b0;
							//transmit_r_done		<= 1'b1;
							if(TX_done == 1'b1)
								STATE			   	<= TRANSMIT_KEY_UART_DONE;

						end
						else begin
							cipher_r_en_reg		 <= 1'b1;
							cipher_mem_sel_reg	 <= 3'b001;
							TX_data					 <= 8'h0;
							transmit_reg			 <= 1'b0;
							if(addr==0 || TX_done == 1'b1)
								STATE			   	<= TRANSMIT_KEY_DONE;
						end
					end
				TRANSMIT_KEY_DONE:
					begin
							cipher_r_en_reg		<= 1'b1;
							cipher_mem_sel_reg   <= 3'b001;
							addr						<= addr + 1'b1;
							TX_data					<= cipher_data;
							transmit_reg			<= 1'b1;
						   STATE			   	   <= TRANSMIT_KEY;
					end
				TRANSMIT_KEY_UART_DONE:
					begin
							STATE			   	   <= DELAY;
					end
				TRANSMIT_PT:
					begin
						if(addr == 16) begin
							//addr						<= 16'h0;
							transmit_reg 		   <=	1'b0;
							TX_data					<= 8'b0;
							transmit_reg			<= 1'b0;
							//transmit_r_done		<= 1'b1;
							if(TX_done == 1'b1)
								STATE			 			<= TRANSMIT_PT_UART_DONE;
						end
						else begin
							cipher_r_en_reg		 <= 1'b1;
							cipher_mem_sel_reg	 <= 3'b010;
							TX_data					 <= 8'h0;
							transmit_reg			 <= 1'b0;
							if(addr==0 || TX_done == 1'b1)
								STATE			   	<= TRANSMIT_PT_DONE;
								
						end
												
					end
				TRANSMIT_PT_DONE:
					begin
						cipher_r_en_reg		<= 1'b0;
						cipher_mem_sel_reg   <= 3'b000;
						addr						<= addr + 1'b1;
						TX_data					<= cipher_data;
						transmit_reg			<= 1'b1;
						STATE			   	   <= TRANSMIT_PT;
					end
				TRANSMIT_PT_UART_DONE:
					begin
							STATE			   	   <= DELAY;
					end
				TRANSMIT_CT:
					begin
						if(addr == 16) begin
							//addr						<= 16'h0;
							transmit_reg 		   <=	1'b0;
							TX_data					<= 8'b0;
							transmit_reg			<= 1'b0;
							//transmit_r_done		<= 1'b1;
							if(TX_done == 1'b1)
								STATE			 			<= TRANSMIT_CT_UART_DONE;
						end
						else begin
							cipher_r_en_reg		 <= 1'b1;
							cipher_mem_sel_reg	 <= 3'b100;
							TX_data					 <= 8'h0;
							transmit_reg			 <= 1'b0;
							if(addr==0 || TX_done == 1'b1)
								STATE			   	<= TRANSMIT_CT_DONE;
								
						end
												
					end
				TRANSMIT_CT_DONE:
					begin
						cipher_r_en_reg		<= 1'b0;
						cipher_mem_sel_reg   <= 3'b000;
						addr						<= addr + 1'b1;
						TX_data					<= cipher_data;
						transmit_reg			<= 1'b1;
						STATE			   	   <= TRANSMIT_CT;
					end
				TRANSMIT_CT_UART_DONE:
					begin
							STATE			   	   <= DELAY;
					end
				TRANSMIT_TRACE:
					begin
						if(addr == 1024) begin
							//addr						<= 16'h0;
							transmit_reg 		   <=	1'b0;
							TX_data					<= 8'b0;
							transmit_reg			<= 1'b0;
							//transmit_r_done		<= 1'b1;
							if(TX_done == 1'b1)
								STATE			 			<= TRANSMIT_TRACE_UART_DONE;
						end
						else begin
							trace_r_en_reg		 	 <= 1'b1;
							trace_mem_sel_reg	 	 <= 3'b001;
							TX_data					 <= 8'h0;
							transmit_reg			 <= 1'b0;
							if(addr==0 || TX_done == 1'b1)
								STATE			   	<= TRANSMIT_TRACE_DONE;
						end	
					end
				TRANSMIT_TRACE_DONE:
					begin
						trace_r_en_reg			<= 1'b0;
						trace_mem_sel_reg   	<= 3'b000;
						addr						<= addr + 1'b1;
						TX_data					<= trace_data;
						transmit_reg			<= 1'b1;
						STATE			   	   <= TRANSMIT_TRACE;
					end
				TRANSMIT_TRACE_UART_DONE:
					begin
							STATE			   	   <= DELAY;
					end
				TRANSMIT_PARAM:
					begin
						if(addr == NUM_ELEMENTS) begin //NUM_ELEMENTS
							//addr						<= 16'h0;
							transmit_reg 		   <=	1'b0;
							TX_data					<= 8'b0;
							if(TX_done == 1'b1)
								STATE			 		<= TRANSMIT_PARAM_UART_DONE;
						end
						else begin
							TX_data					 <= 8'h0;
							transmit_reg			 <= 1'b0;
							if(addr==0 || TX_done == 1'b1)
								STATE			   	 <= TRANSMIT_PARAM_DONE;
								
						end
					
					end
				TRANSMIT_PARAM_DONE:
					begin
						addr						<= addr + 1'b1;
						TX_data					<= param_data;
						transmit_reg			<= 1'b1;
						STATE			   	   <= TRANSMIT_PARAM;
					
					end
				TRANSMIT_PARAM_UART_DONE:
					begin
						addr						<= 16'h0;
						STATE			   	   <= DELAY;
					
					end
				DELAY:
					begin
						STATE			   	   <= WAIT;
						transmit_r_done		<= 1'b1;
						addr						<= 16'h0;
					end
			  endcase
			end
	
	end
 
 endmodule