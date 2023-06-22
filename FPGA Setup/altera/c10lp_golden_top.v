//////////////////////////////////
// TOP module
// Inputs and outputs are defined here.
//////////////////////////////////

module  c10lp_golden_top ( 
        //Clock and Reset
        input  wire        c10_clk50m    ,
        input  wire        hbus_clk_50m  ,  
        input  wire        c10_clk_adj   ,  
        input  wire        enet_clk_125m ,
        input  wire        c10_resetn    ,

        //LED PB DIPSW
        output wire [3:0]  user_led ,
        input  wire [3:0]  user_pb  ,
        input  wire [2:0]  user_dip ,
		  input  wire			rx			,
        //Ethernet Port 
        //output wire        enet_mdc        ,
        //inout  wire        enet_mdio       ,
        
        //input  wire        enet_int        ,     
        //output wire        enet_resetn     ,	    
        //input  wire        enet_rx_clk     ,     
        //output wire        enet_tx_clk     ,    
        //input  wire [3:0]  enet_rx_d       ,       
        //output wire [3:0]  enet_tx_d       ,       
        //output wire        enet_tx_en      ,      
        //input  wire        enet_rx_dv      ,      

        //PMOD PORT
        output	  wire 		  tx  
        //Side Bus
        //input  wire         usb_reset_n        ,
        //input  wire         c10_usb_clk        ,
        //input  wire         usb_wr_n           ,
        //input  wire         usb_rd_n           ,
        //input  wire         usb_oe_n           ,
        //output wire         usb_full           ,
        //output wire         usb_empty          ,
        //inout  wire   [7:0] usb_data           ,
        //inout  wire   [1:0] usb_addr           ,
        //inout  tri1         usb_scl            ,
        //inout  tri1         usb_sda            ,
        
        
        //User IO & Clock
        //inout  wire [35:0]  gpio            ,
        
        //ARDUINO IO
        //inout  wire [13:0]  arduino_io      ,
        //output wire         arduino_rstn    ,
        //inout  wire         arduino_sda     ,
        //inout  wire         arduino_scl     ,        
        //inout  wire         arduino_adc_sda ,
        //inout  wire         arduino_adc_scl ,

        //Cyclone 10 to MAX 10 IO
        //inout  wire [3:0]  c10_m10_io   ,       
        
        //HyperRAM IO
        //output wire         hbus_rstn   ,
        //output wire         hbus_clk0p  ,
        //output wire         hbus_clk0n  ,
        //output wire         hbus_cs2n   , //HyperRAM chip select
        //inout  wire         hbus_rwds   ,
        //inout  wire [7:0]   hbus_dq     ,
        //output wire         hbus_cs1n   , //For HyperFlash
        //input  wire         hbus_rston  , //For HyperFlash
        //input  wire         hbus_intn     //For HyperFlash

        //QSPI
//        output wire    qspi_dclk   ,
//        output wire    qspi_sce    ,
//        output wire    qspi_sdo    ,
//        input  wire    qspi_data0  


        );

// PARAMETERS
parameter CounterSize= 31;
parameter SAMPLES 	= 1024;
parameter SAMPLESTART= 0;
parameter AES_COUNT	= 2;
//parameter TDC_SIZE	= 128;
parameter NUM_ROSensors=64;

// STATES
parameter RESET				= 8'b0000_0000,
			START				= 8'b0000_0001,
			READ_DELAY		= 8'b0000_0010,
			SET_DELAY_CORSE= 8'b0000_0011,
			SET_DELAY_FINE = 8'b0000_0100,
			START_ENC		= 8'b0000_0101,
			ENC_KRDY			= 8'b0001_0000,
			ENC_WAIT_KVLD	= 8'b0001_0001,
			ENC_DRDY			= 8'b0001_0010,
			ENC_DRDY1		= 8'b0001_0011,
			ENC_WAIT_DVLD	= 8'b0001_0100,
			ENC_DVLD			= 8'b0001_01001,
			WAIT_TRANSMIT	= 8'b0001_01010,
			TRANSMIT_PT		= 8'b0010_0000,
			TRANSMIT_PT_DELAY= 8'b0010_0001,
			TRANSMIT_PT_WAIT=8'b0010_0010,
			TRANSMIT_KEY	= 8'b00011_0000,
			TRANSMIT_KEY_WAIT=8'b0011_0001,
			TRANSMIT_KEY_DELAY= 8'b0011_0010,
			TRANSMIT_CT		= 8'b0100_0000,
			TRANSMIT_CT_WAIT=8'b0100_0001,
			TRANSMIT_CT_DELAY=8'b0100_0010,	
			TRANSMIT_TRACE	= 8'b0101_0000,
			TRANSMIT_TRACE_WAIT = 8'b0101_0001,
			TRANSMIT_PARAM = 8'b0110_0000,
			TRANSMIT_PARAM_WAIT = 8'b0110_0001,
			TRANSMIT_PARAM_DELAY = 8'b0110_0010,
			WAIT_DONE		= 8'b1111_0000,
			WRAP_UP  		= 8'b1111_0001,
			TEMP		  		= 8'b1111_0010;
			 
parameter SAMPLE_RESET		= 8'b0000_0000,
			 SAMPLE_WAIT		= 8'b0001_0000,
			 SAMPLE_COLLECT	= 8'b0010_0000,
			 SAMPLE_DONE		= 8'b0011_0000;
			 		
		  
		  
		  
// USER REGISTERS AND WIRES
	wire 				clk0, clk1;
	wire 				locked, TXDone, txActive, dvld, kvld, transmit_done, receive_ready, trace_r_en;
	reg  	[7:0] 		STATE, STATE_TX, STATE_RX, STATE_SAMPLE;
	reg  	[7:0] 		transmitReg, sampleData, tx_data, delay;
	reg  	[127:0]	ptReg, ctReg, keyReg, cipher_w_data;
	reg  				keyRdy, dataRdy, tx_en, trace_w_en, transmit_en, cipher_w_en, cipher_r_en, enc_LED, transmit_para;
	wire 	[7:0]		RXdata, processedOut, cipher_r_data, receive_data, trace_r_data, trace_w_data, tracer_r_addr, param_addr, param_s_addr;
	reg  	[15:0]    tx_addr, tracer_w_addr;
	reg  	[2:0]		tracer_w_memsel, tracer_r_memsel, cipher_w_memsel;
	reg  	[4:0]     transmit_sel;
	wire 	[127:0] 	doutTemp [AES_COUNT-1:0] ;
	wire 	[127:0] 	dout;
	wire 	[AES_COUNT-1:0] dvldTemp;
	wire 	[2:0] 				cipher_r_memsel, trace_r_memsel;
	wire 	[15:0] 			cipher_r_addr;
	reg	[7:0] 	param 	[3:0], processedOutReg;
	reg	[TDC_SIZE-1:0]		outReg;
	wire	[TDC_SIZE-1:0]		out;
	// temp
	
	wire tx_uart;
		  
//Heart-beat counter
	reg   [25:0]  heart_beat50_cnt;
	reg   [25:0]  heart_beat12_cnt;
	reg   [25:0]  heart_beat200_cnt;
	
	// temp
	reg [7:0] 	TX_data, receive_addr;
	reg [10:0]  counter;
	reg			transmit_reg, receive_start;


// MODULES

clock clkmanager(.clkin(c10_clk50m), .rst(~c10_resetn), .clk0(clk0), .clk1(clk1), .locked(locked));	
cipher_memory cm0 (.w_clk(clk1), .r_clk(clk1), .rstn(c10_resetn), .r_en(trace_r_en), .w_en(cipher_w_en), .r_addr(cipher_r_addr), .w_memsel(cipher_w_memsel), .r_memsel(cipher_r_memsel), .w_data(cipher_w_data), .r_data(cipher_r_data), .r_dvld(), .w_dvld());
trace_memory  tm0 (.w_clk(clk0), .r_clk(clk1), .rstn(c10_resetn), .r_en(trace_r_en), .w_en(trace_w_en), .w_addr(tracer_w_addr), .r_addr(tracer_r_addr), .r_memsel(trace_r_memsel), .w_memsel(tracer_w_memsel), .w_data(trace_w_data), .r_data(trace_r_data), .r_dvld(), .w_dvld());
sender s0 (.clk(clk1), .rstn(c10_resetn), .transmit_sel(transmit_sel), .transmit_en(transmit_en), .cipher_mem_sel(cipher_r_memsel), .cipher_addr(cipher_r_addr), .cipher_data(cipher_r_data), .trace_r_en(trace_r_en), .trace_data(trace_r_data), .trace_mem_sel(trace_r_memsel), .trace_addr(tracer_r_addr), .transmit_done(transmit_done), .tx(tx), .param_addr(param_s_addr), .param_data(receive_data));
receiver r0 (.clk(clk1), .rstn(c10_resetn), .start(receive_start), .rx(rx), .addr(param_addr), .ready(receive_ready), .data(receive_data));


// TDC and TDC chain value calculator

carry_chain tp (.a(128'h0), .b(128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff), .carryin(clk0), .clk(clk0), .enable(1'b0), .clear(1'b0), .regout(out), .carryout());
tdc_decode tdc_decode(.clk(clk0), .rst(AESResetn), .chainvalue_i(outReg), .coded_o(processedOut));


    genvar i;  genvar j;
	 generate
        for(i = 0; i < AES_COUNT; i = i+1) 
		  begin:gen_code_label
				aes_tiny aes_tinyi ( .clk(clk1),  .rst(~dataRdy),  .din(ptReg), .key(keyReg), .dout(doutTemp[i]),  .done(dvldTemp[i]) );
		  end
	endgenerate



// CONTINOUS ASSIGNMENT 

assign user_led[0] = heart_beat50_cnt[25];
assign user_led[1] = heart_beat12_cnt[25];
assign user_led[2] = heart_beat200_cnt[25];
assign user_led[3] = enc_LED;

assign dout 			= doutTemp[0]  & doutTemp[1];
assign dvld 			= &dvldTemp;
assign trace_w_data  = sampleData;

assign param_addr	= (transmit_para == 1'b1)? param_s_addr : receive_addr ;

//assign pmod_d[0]		= tx;
//assign pmod_d[3]		= rx;



// MAIN FSM WHICH COORDINATES ALL THE HARDWARE COMPONENTS
always @(posedge clk1  or negedge c10_resetn) 
	begin
	
	if(c10_resetn == 1'b0)
			STATE <= RESET;
	else 
   begin	
	  case (STATE) 
		RESET:
			begin  // initilise all the variables to default values 
				
				ptReg		<= 128'h0;
				ctReg		<= 128'h0;
				keyReg   <= 128'h0;
				keyRdy	<= 1'b0; 
				dataRdy	<= 1'b0;
				enc_LED	<= 1'b1;
				receive_addr	<= 8'h00;
				STATE 	<= START;
			end
		START:
			begin   
				STATE 			<= READ_DELAY;
				receive_addr	<= 8'h00;
				receive_start	<= 1'b1;
			end
		READ_DELAY:
			begin
				// read from UART
				counter 			<= 1'b1;
				receive_start	<= 1'b0;
				if(receive_ready	== 1'b1) begin
						STATE 	<= START_ENC;
						
				end
			end
		START_ENC:
			begin
				param[0]			<= receive_data;
				if(counter == 0)
					STATE		<= ENC_KRDY;
				else 
					counter <= counter + 1;
			end
		ENC_KRDY:
			begin
				keyReg   <= 128'h000102030405060708090a0b0c0d0ef0;
				keyRdy	<= 1'b1; 
				enc_LED	<=	1'b1;
				STATE		<= ENC_WAIT_KVLD;
			end
		ENC_WAIT_KVLD:  // wait for kvld or pass to next state
			begin
				keyRdy			 <= 1'b0;
				cipher_w_memsel <= 3'b001;
				cipher_w_en		 <= 1'b1;
				cipher_w_data	 <= keyReg;
				STATE				 <= ENC_DRDY;
			end
		ENC_DRDY:  
			begin
				ptReg    		 <= ptReg + 1; //ctReg;
				dataRdy			 <= 1'b1;
				cipher_w_memsel <= 3'b000;
				cipher_w_en		 <= 1'b0;
				STATE				 <= ENC_DRDY1;
			end
		ENC_DRDY1:
			begin
				cipher_w_memsel <= 3'b010;
				cipher_w_en		 <= 1'b1;
				dataRdy			 <= 1'b0;
				cipher_w_data	 <= ptReg[127:0];	
				STATE				 <= ENC_WAIT_DVLD;
			end
		ENC_WAIT_DVLD:  
			begin
				cipher_w_memsel <= 3'b000;
				cipher_w_en		 <= 1'b0;
				
				if(dvld==1'b1) begin
					ctReg 		<= dout;
					STATE			<= ENC_DVLD;
				end	
				
			end
		ENC_DVLD:
			begin
				cipher_w_memsel <= 3'b100;
				cipher_w_en		 <= 1'b1;
			   cipher_w_data	 <= ctReg;
				STATE				 <= WAIT_TRANSMIT;
			end
		WAIT_TRANSMIT:  
			begin
				cipher_w_memsel <= 3'b000;
				cipher_w_en		 <= 1'b0;
				if(STATE_SAMPLE == SAMPLE_DONE)
					STATE			<= TRANSMIT_PARAM;
				
			end
		TRANSMIT_PARAM:
			begin
				transmit_sel	<= 5'b10000;
				transmit_en		<= 1'b1;
				transmit_para	<= 1'b1;
				STATE				<= TRANSMIT_PARAM_WAIT;
			end
		TRANSMIT_PARAM_WAIT:
			begin
				transmit_en		<= 1'b0;
				transmit_sel	<= 5'b00000;
				delay				<= 8'h0;
				if(transmit_done == 1'b1)
					STATE				<= TRANSMIT_PARAM_DELAY;
			end
		TRANSMIT_PARAM_DELAY:
			begin
				transmit_para	<= 1'b0;
				STATE				<= TRANSMIT_PT_DELAY;
			end
		TRANSMIT_PT_DELAY:  
			begin
				
				delay				<= delay + 1'b1;
				if(delay == 200)
					STATE				<= TRANSMIT_PT;
			
			end
		TRANSMIT_PT:  
			begin
				
				transmit_en		<= 1'b1;
				transmit_sel	<= 5'b00010;
				STATE				<= TRANSMIT_PT_WAIT;
			
			end
		TRANSMIT_PT_WAIT:  
			begin
				
				transmit_en		<= 1'b0;
				transmit_sel	<= 5'b00000;
				delay				<= 8'h0;
				if(transmit_done == 1'b1)
					STATE				<= TRANSMIT_KEY_DELAY;//TRANSMIT_KEY;
					
			end
		TRANSMIT_KEY_DELAY:  
			begin
				
				delay				<= delay + 1'b1;
				if(delay == 200)
					STATE				<= TRANSMIT_KEY;
			
			end
		TRANSMIT_KEY:  
			begin				
					transmit_en		<= 1'b1;
					transmit_sel	<= 5'b00001;
					STATE				<= TRANSMIT_KEY_WAIT;
			end
		TRANSMIT_KEY_WAIT:  
			begin			
				
					transmit_en		<= 1'b0;
					transmit_sel	<= 5'b00000;
					if(transmit_done == 1'b1) 
						STATE				<= TRANSMIT_CT;//TRANSMIT_CT;
			end
		TRANSMIT_CT:  
			begin
				transmit_en			<= 1'b1;
				transmit_sel		<= 5'b00100;
				STATE				<= TRANSMIT_CT_WAIT;
			end
		TRANSMIT_CT_WAIT:  
			begin
				
				transmit_en		<= 1'b0;
				transmit_sel	<= 5'b00000;
				delay				<= 8'h0;
				if(transmit_done == 1'b1)
					STATE				<= TRANSMIT_CT_DELAY;//TRANSMIT_KEY;
					
			end
		TRANSMIT_CT_DELAY:  
			begin
				
				delay				<= delay + 1'b1;
				if(delay == 200)
					STATE				<= TRANSMIT_TRACE;
			
			end
		TRANSMIT_TRACE:  
			begin
				transmit_en		<= 1'b1;
				transmit_sel	<= 5'b01000;			
				STATE				<= TRANSMIT_TRACE_WAIT;
			end
		TRANSMIT_TRACE_WAIT:  
			begin
				
				transmit_en		<= 1'b0;
				transmit_sel	<= 5'b00000;
				delay				<= 8'h0;
				if(transmit_done == 1'b1)
					STATE				<= WRAP_UP;
					
			end
		WRAP_UP:  
			begin
				
				transmit_sel	<= 5'b00000;
				STATE				<= START;
				enc_LED			<=	1'b0;
			end
	  endcase
	end
	
	
	end

	// SAMPLE -- use sample clock
	// Sample clock and tracer memory are used by on-chip sensor
	always @(posedge clk0  or negedge c10_resetn) 
	begin
	if(c10_resetn == 1'b0)
			STATE_SAMPLE <= RESET;
	else
     begin
			case(STATE_SAMPLE)
				SAMPLE_RESET: begin
					sampleData		<= 8'h0;
					trace_w_en  	<= 1'b0;
					tracer_w_addr	<= 16'h0;
					tracer_w_memsel<=	1'b1;
					STATE_SAMPLE 	<= SAMPLE_WAIT;
				end
				SAMPLE_WAIT: begin
					sampleData		<= 8'h0;
					trace_w_en  	<= 1'b0;
					tracer_w_addr	<= 16'h0;
					tracer_w_memsel<=	1'b1;  // we use only 1 memory atm.
					
					outReg			<= out;
					processedOutReg<= processedOut;
					
					if(dataRdy== 1'b1)
						STATE_SAMPLE <= SAMPLE_COLLECT;
					
				end
				SAMPLE_COLLECT: begin
					outReg			<= out;
					processedOutReg<= processedOut;
				
					sampleData		<= processedOutReg;
					trace_w_en  	<= 1'b1;
					tracer_w_addr	<= tracer_w_addr + 1'b1;		
					if(tracer_w_addr == 1023) // check this- might not work
						STATE_SAMPLE 	<= SAMPLE_DONE;
					
				end
				SAMPLE_DONE: begin
					tracer_w_addr	<= 16'h0;
					trace_w_en  	<= 1'b0;
					if(STATE == TRANSMIT_PT)
						STATE_SAMPLE 	<= SAMPLE_WAIT;
					
				end
				
			endcase
	 end 
	
		
	end
	// UART TX DATA -- use aes clock (but can be any clock)
//	
//	always @(posedge clk1  or negedge c10_resetn) 
//	begin
//	
//	if(c10_resetn == 1'b0)
//			STATE_TX <= RESET;
//			
//	else 
//	 begin
//	case (STATE_TX) 
//		RESET:
//			begin  // initilise all the variables to default values 
//				tx_addr  <= 16'h0;
//				tx_en		<= 1'b0;
//				tx_data	<= 8'h0;
//				STATE_TX <= TX_WAIT;
//			end
//		TX_WAIT:
//		   begin
//				if(transmit == 1'b1)
//					STATE_TX <= TX_TRANSMIT;
//			end
//		TX_TRANSMIT:
//			begin
//					tx_en	<=	1'b1;
//					tx_data	<= trace_data[addr];
//					STATE_TX <= TX_DELAY;
//			end
//		TX_DELAY:
//			begin
//					tx_en	<=	1'b0;
//					if(tx_addr == SAMPLES-1)
//						STATE_TX <= TX_DONE;
//					else 
//						tx_addr <= tx_addr + 1'b1;
//			end
//		TX_DONE:
//			begin
//					tx_en		<=	1'b0;
//					tx_addr	<= 16'b0;
//					STATE_TX <= TX_WAIT;
//			end
//	endcase
//	
//	end
//	end
//	
//	// UART RX DATA
//	
//	always @(posedge clk1  or negedge c10_resetn) 
//	begin
//	
//	if(c10_resetn == 1'b0)
//	  begin
//			STATE_RX <= RESET;
//	  end
//	else
//	  begin
//		  case (STATE_RX) 
//		     RESET:
//		 	    begin  // initilise all the variables to default values 
//					
//			    end
//			  
//		  endcase
//	  end
//	
//	
//	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// HEART BEAT SIGNALS- ONLY FOR DEBUGGING

always @(posedge c10_clk50m or negedge c10_resetn)
	begin
		if (!c10_resetn)
			heart_beat50_cnt <= 26'h0; //0x3FFFFFF
		else
			heart_beat50_cnt <= heart_beat50_cnt + 1'b1;
	end


always @(posedge clk1  or negedge c10_resetn) 

	// HB signal- LED 1 - not Important
	begin
		
		if (!c10_resetn)
			heart_beat12_cnt <= 26'h0; 
		else
			heart_beat12_cnt <= heart_beat12_cnt + 1'b1;

	end

always @(posedge clk0  or negedge c10_resetn) 

	// HB signal- LED 1 - not Important
	begin
		
		if (!c10_resetn)
			heart_beat200_cnt <= 26'h0; 
		else
			heart_beat200_cnt <= heart_beat200_cnt + 1'b1;

	end	
	

endmodule


