`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:49 03/26/2020 
// Design Name: 
// Module Name:    top 
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
module top(
	input 	clk,
	input    c10_resetn,
	input 	rx,
	//input 	rstn,
	output [2:0]led,
	output 	tx
	//output PWR,  // not used
	//output HB    // not used
);

//PARAMETERS
parameter COUNTER_SIZE=31;
parameter SAMPLES_TO_COLLECT=1024;
parameter CIPHERS_COUNT = 1;
parameter N = 16; //word size in bits
parameter M = 4; //number of words in a key
parameter BLOCK_SIZE = 2*N;
parameter KEY_SIZE = N*M;
parameter REG_SIZE =511;
parameter AD_SIZE=128;

//////////////////////
//	regs and wires	//
//////////////////////

reg busy;

//for clock signals
wire clk0, clk1, clk2, clk3, clk4, clk5, clk0t, clk3t, clk4t, clk5x; 
wire roClk;

reg [9:0] counter;
reg [COUNTER_SIZE:0] counter1 = 0;
reg [COUNTER_SIZE:0] counter2 = 0;
wire SensorBusy;
wire [35:0] control0;		

//for FSM
reg  [9:0] MAIN_FSM=0;
reg  [9:0] SEN_FSM=0;
reg  [9:0] fsm1=0;

//for signals and regs of Simon cipher
reg  [BLOCK_SIZE -1:0] Din;
reg  [KEY_SIZE-1:0] Kin;
wire [BLOCK_SIZE-1:0] Dout;
reg Krdy, Drdy, EncDec, Resetn, EN;
wire Kvld, Dvld, BSY, EncDone;


reg CE, C, R, inc;
wire [9:0] Q;

//for onchip sensor
wire [AD_SIZE-1:0] out;		
reg [AD_SIZE-1:0] outReg;		
wire [7:0] processedOut;
reg	[AD_SIZE-1:0] adjust;

//for UART signal and regs
reg  [7:0] TXdata;
wire  [7:0] RXdata;
wire  TXDone, txActive, rxReady, delClk, err, done;
reg  transmitReg;
reg start, trig, one, adj, adjEN;

//for Sample memory of onchip sensor readings
reg [7:0] pow_trace [SAMPLES_TO_COLLECT-1:0]; //reg to hold sampling points of power trace
reg [7:0] dataCt [3:0]; 
reg [7:0] dataIn [3:0]; 
reg [7:0] dataKey [7:0]; 
reg [15:0] addr1;
reg [15:0] addr2;
reg [2:0] encCounter;
reg [9:0] total, total_old;
reg [7:0] senData  [3:0]; 
reg [127:0] A, B;
wire [127:0] Awire, Bwire, S;

reg [7:0] delay=15;
wire [4:0] Cdelay;

// reg  [7:0]  count;

//////////////////////////
//	Value Assignments	//
//////////////////////////

assign led	=counter2[27:25];
//assign HB 	=counter2[28];
assign SensorBusy = busy;
//assign PWR=1;

//
assign Bwire = {delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,7'b0000000,delay_wire[9]}; //delay_wire[9]
assign Awire = {~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay};
//assign Awire= {delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,8'b00000001};
//assign Bwire= {~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,7'b1111111,clk0};
assign S = Awire+Bwire;

//////////////////////////
///   Clock and UARTs  ///
//////////////////////////

clock clock(.inclk0(clk), .c0(clk0), .c1(clk1), .locked());
//clock (
//	areset,
//	inclk0,
//	c0,
//	c1,
//	locked

uart_tx uartTX(.i_Clock(clk1), .i_Tx_DV(transmitReg), .i_Tx_Byte(TXdata), .o_Tx_Active(txActive), .o_Tx_Serial(tx), .o_Tx_Done(TXDone) );		
uart_rx uartRX(.i_Clock(clk1), .i_Rx_Serial(rx), .o_Rx_DV(rxReady), .o_Rx_Byte(RXdata) );		

//////////////////////////
///   On-chip Sensor   ///
/////////////////////////

//tdc_top tp (clk0, clk0, out); // TDC sensor
tdc_decode tdc_decode(.clk(clk0), .rst(Resetn), .chainvalue_i(outReg), .coded_o(processedOut)); // calculate number of 1's in the TDC Sensor



//////////////////////////
///   CIPHERS LOOP    ////
//////////////////////////

wire [BLOCK_SIZE -1:0] DoutTemp [CIPHERS_COUNT-1:0] ;

wire  [CIPHERS_COUNT-1:0] DvldTemp;

assign Dout = DoutTemp[0]; //&  DoutTemp[1] &  DoutTemp[2];   // this line we manually need to change ; I will modify this duing next version
assign Dvld = &DvldTemp;

genvar i;

generate
	for(i = 0; i < CIPHERS_COUNT; i = i+1) 
		begin:gen_code_label
			//aes_tiny aes_tinyi ( .clk(clk1),  .rst(Drdy),  .din(Din), .key(Kin), .dout(DoutTemp[i]),  .done(DvldTemp[i]) );
			//(* noprune *)	AES_Composite_enc aes_tinyi (.Kin(Kin), .Din(Din), .Dout(DoutTemp[i]), .Krdy(Krdy), .Drdy1(Drdy), .EncDec(1'b0), .Kvld(), .Dvld(DvldTemp[i]), .EN(EN), .BSY(), .CLK(clk1), .RSTn(Resetn));
			simon #(N, M) simon_inst (.clk(clk1), .rst(~Resetn), .plaintext(Din), .key(Kin), .ciphertext(DoutTemp[i]), .en(EN), .done(EncDone));
		end
endgenerate	

wire [10:0] delay_wire;
	
generate
	for(i=0;i<10; i = i+1)
		begin: gen_code_label1
			if(i==0) begin
				(* noprune *) latch li (.d(clk0), .ena(1'b1), .q(delay_wire[i]));
	
			end
			else begin
				(* noprune *) latch li (.d(delay_wire[i-1]), .ena(1'b1), .q(delay_wire[i]));
	
			end
		end
endgenerate		

always @(posedge clk0) begin
	counter2 <= counter2+1;
end

///////////////////////////////////
///  Sample Onchip sensor FSM   ///
///////////////////////////////////

//  states of the onchip Sensor FSM
localparam	SEN_RESET = 8'h00,
	SEN_WAIT = 8'h01,
	SEN_CAPTURE	= 8'h02,
	SEN_WRAP_UP	= 8'h03;

// onchip sensor values samples FSM, clock0 >>>> clock1
always @(posedge clk0) begin
	//resettig state
	if(SEN_FSM==SEN_RESET) begin
		addr2 <= 0;		
		SEN_FSM <= SEN_WAIT;	
	end
	//waiting for encryption start state
	else if(SEN_FSM==SEN_WAIT) begin
		pow_trace[addr2] <= 250; //we just want to put a flag to detect start of encryption
		outReg <= S;
		addr2 <= 0;
		if(Drdy==1) begin
			SEN_FSM <= SEN_CAPTURE;	
		end
	end
	//state for captur samples
	else if(SEN_FSM==SEN_CAPTURE) begin
	    outReg <= S;    
		addr2 <= addr2 +1;
			
		if(Dvld==1) begin 
			//when ct is ready, we want to indicate it in the onchip sensor trace -- normally there is a clock cycle delay so if we dont capture last clock cycle's voltage flucations we are safe.
			pow_trace[addr2] <= 255;
		end
		else begin
			//sample and save TDC sensor's data
			pow_trace[addr2] <= processedOut;
		end

		if(addr2==SAMPLES_TO_COLLECT-1) begin
			//once required number of samples are collected we can wait to capture next encryption.
			SEN_FSM	<= SEN_WRAP_UP;	
		end
	end
	//state for wrapping up the trace collection
	else if(SEN_FSM==SEN_WRAP_UP) begin	
		//clear the addr and move to WAIT state
		addr2 <= 0;
		SEN_FSM <= SEN_WAIT;
	end
end

/////////////////////////////
///  Cipher and Main FSM  ///
/////////////////////////////
// main FSM states
localparam	MAIN_RESET = 8'h00,
	MAIN_DELAY_WAIT	= 8'h01,
	MAIN_DELAY_SET = 8'h02,
	MAIN_DELAY_WRAPUP = 8'h03,
	MAIN_AES_RESET = 8'h04,
	MAIN_AES_RESET1 = 8'h05,
	MAIN_AES_SET_KEY = 8'h06,
	MAIN_AES_SET_PT = 8'h07,
	MAIN_AES_ENCRYPT = 8'h08,
	MAIN_AES_WAIT = 8'h09,
	MAIN_PT_SEND = 8'h0A,
	MAIN_PT_WAIT = 8'h0B,
	MAIN_PT_WAIT1 = 8'h0C,
	MAIN_KEY_SEND = 8'h0D,
	MAIN_KEY_WAIT = 8'h0E,
	MAIN_KEY_WAIT1 = 8'h0F,
	MAIN_CT_SEND = 8'hA0,
	MAIN_CT_WAIT = 8'hA1,
	MAIN_CT_WAIT1 = 8'hA2,
	MAIN_SEN_SEND = 8'hA3,
	MAIN_SEN_WAIT = 8'hA4,	
	MAIN_SEN_WAIT1 = 8'hA5,	
	MAIN_SEN_DELAY = 8'hA6,	
	MAIN_WRAPUP = 8'hA7;	
		

always @(posedge clk1) begin	// Main FSM which also control AES  and data transmit
		
		if (MAIN_FSM==MAIN_RESET) begin
		     
			  //if(rxReady ==1 && RXdata==250)  begin				// you dont need to worry about these values they are from PC -> FPGA parameters
			  //	  MAIN_FSM <=MAIN_AES_RESET;
			  // inc <=1;
			  //  encCounter 	<= encCounter + 1;
			  //end
			  if(rxReady ==1 && (RXdata >= 0)) begin
				  MAIN_FSM <=MAIN_AES_RESET;
				  inc <=0;
				  delay <= RXdata;
				  adjust <= RXdata + 1;
			  end
			  
			  adjEN <=0;
		end
		else if (MAIN_FSM==MAIN_AES_RESET) begin			// AES circuit signals init and AES circuit reset - active low
			busy   <=1;			
			EncDec <=counter1[24];
			EN <=0;
			Resetn  <=0;
			Krdy <=0;
			Drdy <=0;
			addr1 <= 0;
			counter1<= counter1+1;
			R  <=0;
			CE <=0;
			adj <=1;
			
			//B<= {delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay,delay};
			//A<= {~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay,~delay};
			
			MAIN_FSM <=MAIN_AES_RESET1;
		end
		else if (MAIN_FSM==MAIN_AES_RESET1) begin
			
			Resetn  <=1;
			R<=1;
			if(inc==1) begin
				delay <= delay +1;
				adjust <= delay +1;
			end

			MAIN_FSM <= MAIN_AES_SET_KEY;
		end
		else if (MAIN_FSM==MAIN_AES_SET_KEY) begin
			EN		<=1;	 // Enable AES circuit
			Krdy <=1;	// set key is ready
			Kin  <= 64'h1918111009080100;  // this is AES key and it is hard corded.
			
			MAIN_FSM <= MAIN_AES_SET_PT;
					
		end
	
		else if (MAIN_FSM==MAIN_AES_SET_PT) begin
		
			//Din <= {Cdelay, 00000, encCounter , Dout[111:0]};	//	we use ciphertext of previous encryption as the pt of the this encryption + some counter values.
			Din  <= 32'h65656877; //Dout;
			Krdy <=0;
			R <=1;
//				dataKey[0] <= Kin[127:120];
//				dataKey[1] <= Kin[119:112];
//				dataKey[2] <= Kin[111:104];
//				dataKey[3] <= Kin[103:96];
//				dataKey[4] <= Kin[95:88];
//				dataKey[5] <= Kin[87:80];
//				dataKey[6] <= Kin[79:72];
//				dataKey[7] <= Kin[71:64];
				dataKey[0] <= Kin[63:56];
				dataKey[1] <= Kin[55:48];
				dataKey[2] <= Kin[47:40];
				dataKey[3] <= Kin[39:32];
				dataKey[4] <= Kin[31:24];
				dataKey[5] <= Kin[23:16];
				dataKey[6] <= Kin[15:8];
				dataKey[7] <= Kin[7:0];
				
				MAIN_FSM <= MAIN_AES_ENCRYPT;
		end
		
		else if (MAIN_FSM==MAIN_AES_ENCRYPT) begin
//			    dataIn[0] <= Din[127:120];
//				dataIn[1] <= Din[119:112];
//				dataIn[2] <= Din[111:104];
//				dataIn[3] <= Din[103:96];
//				dataIn[4] <= Din[95:88];
//				dataIn[5] <= Din[87:80];
//				dataIn[6] <= Din[79:72];
//				dataIn[7] <= Din[71:64];
//				dataIn[8] <= Din[63:56];
//				dataIn[9] <= Din[55:48];
//				dataIn[10] <= Din[47:40];
//				dataIn[11] <= Din[39:32];
				dataIn[0] <= Din[31:24];
				dataIn[1] <= Din[23:16];
				dataIn[2] <= Din[15:8];
				dataIn[3] <= Din[7:0];
			R 	<=0;
			Drdy <=1;
			CE   <=1;
			addr1 <= 0;
			
			MAIN_FSM<= MAIN_AES_WAIT;
		end
		
		else if(MAIN_FSM==MAIN_AES_WAIT) begin  
			Drdy <=0;
			//transmitReg <=1;
			//data1[addr1] <= 9;
			addr1 <= addr1+1;
			if(Dvld==1) begin   // when DVLD is 1, AES is finished Dout will have ciphertext
//				dataCt[0] <= Dout[127:120];
//				dataCt[1] <= Dout[119:112];
//				dataCt[2] <= Dout[111:104];
//				dataCt[3] <= Dout[103:96];
//				dataCt[4] <= Dout[95:88];
//				dataCt[5] <= Dout[87:80];
//				dataCt[6] <= Dout[79:72];
//				dataCt[7] <= Dout[71:64];
//				dataCt[8] <= Dout[63:56];
//				dataCt[9] <= Dout[55:48];
//				dataCt[10] <= Dout[47:40];
//				dataCt[11] <= Dout[39:32];
				dataCt[0] <= Dout[31:24];
				dataCt[1] <= Dout[23:16];
				dataCt[2] <= Dout[15:8];
				dataCt[3] <= Dout[7:0];
				CE   <=0;
			end
			if(addr1==1023) begin   // we wait 1024 clock cycles, we also wait for DVLD signal or AES done signal and goto next state
				addr1 <= 0;
				counter1 <=0;
				
				MAIN_FSM <= MAIN_PT_SEND;
			end
		end
		
		else if(MAIN_FSM==MAIN_PT_SEND) begin  // PT transmission from FPGA to PC. We have 3 arrays dataIn, dataKey and dataCt
			busy   <=0;
			transmitReg <=1;
			TXdata<=dataIn[addr1];  	// read ith value in plaintext
			addr1 <= addr1+1;
			
			MAIN_FSM <= MAIN_PT_WAIT;
		end
	else if(MAIN_FSM==MAIN_PT_WAIT) begin  
			transmitReg <=0;
			
			if (TXDone==1)
				MAIN_FSM<=MAIN_PT_WAIT1;
		
		end
		
	else if(MAIN_FSM==MAIN_PT_WAIT1) begin  
			if(addr1==16) begin
				addr1 <=0;
				MAIN_FSM<=MAIN_KEY_SEND;
				end
			else
				MAIN_FSM<=MAIN_PT_SEND;
		
		end
		else if(MAIN_FSM==MAIN_KEY_SEND) begin 
			transmitReg <=1;
			TXdata<=dataKey[addr1]; // read ith value in key
			addr1 <= addr1+1;
			
			MAIN_FSM<=MAIN_KEY_WAIT;
		end
	  else if(MAIN_FSM==MAIN_KEY_WAIT) begin  
			transmitReg <=0;
			
			if (TXDone==1)
				MAIN_FSM<=MAIN_KEY_WAIT1;
		end
		
		else if(MAIN_FSM==MAIN_KEY_WAIT1) begin  
			
			if(addr1==16) begin
				addr1 <=0;
				
				MAIN_FSM<=MAIN_CT_SEND;
				end
			else
			
				MAIN_FSM<=MAIN_KEY_SEND;
		end
	
		else if(MAIN_FSM==MAIN_CT_SEND) begin 
			transmitReg <=1;
			TXdata<=dataCt[addr1]; 		// read ith value in ciphertext
			addr1 <= addr1+1;
			
			MAIN_FSM<=MAIN_CT_WAIT;
		end
		
	else if(MAIN_FSM==MAIN_CT_WAIT) begin  
			transmitReg <=0;
		   	//count <= 0;
			
			if (TXDone==1)
				MAIN_FSM <= MAIN_CT_WAIT1;
		end
		
		else if(MAIN_FSM==MAIN_CT_WAIT1) begin  
			
			if(addr1==16) begin
				addr1 <=0;
				
				MAIN_FSM<=MAIN_SEN_SEND;
			end
			else  begin
			
				MAIN_FSM <= MAIN_CT_SEND;
			end	
		end
		else if(MAIN_FSM==MAIN_SEN_SEND) begin  
			transmitReg <=1;
			TXdata<=pow_trace[addr1];  // sensor memory
			
			MAIN_FSM <= MAIN_SEN_WAIT;
		end
		else if(MAIN_FSM==MAIN_SEN_WAIT) begin  
			transmitReg <=0;
			
			if (TXDone==1)
				MAIN_FSM <= MAIN_SEN_WAIT1;
		end
		
		else if(MAIN_FSM==MAIN_SEN_WAIT1) begin  
			
			if(addr1==SAMPLES_TO_COLLECT-1) begin 
				counter1 <=0;
				addr1 <=0;
				
				MAIN_FSM<=MAIN_SEN_DELAY;
			end
			else begin
				addr1 <= addr1+1;
				
				MAIN_FSM<=MAIN_SEN_SEND;
		   end
		end
		
		
		else if (MAIN_FSM==MAIN_SEN_DELAY) begin
		
				counter1<= counter1+1;
				if(counter1[12]==1) begin // we just wait until 2^^12 clock cycles before starting the next iteration. We probably can remove this. This is just let PDN fill power again
					counter1<=0;
					adjEN   <=1;
					
					MAIN_FSM <=MAIN_RESET;
				end
		end
	
		
end

endmodule
