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
	input 	rx,
	//input 	rstn,
	output [2:0]led,
	output 	tx,
	output PWR,
	output HB
    );

parameter CounterSize=31;
parameter AES_COUNT = 2;
parameter adsize=160;

reg [9:0] counter;
reg [CounterSize:0] counter1=0;
reg [CounterSize:0] counter2=0;
wire SensorBusy;
wire clk0, clk1, clk5, clk0t, clk2, clk5x; 
wire roClk;
wire [35:0] control0;		

reg  [9:0] fsm=0;
reg  [9:0] fsm1=0;
reg  [127:0] Kin, Din;
wire [127:0] Dout;
reg Krdy, Drdy, EncDec, RSTn, EN;
wire Kvld, Dvld, BSY;

reg CE, C, R, inc;
wire [9:0] Q;
reg  [7:0] TXdata;
wire  [7:0] RXdata;

reg [7:0] data1   [1023:0]; 
reg [7:0] data2   [1023:0]; 
reg [7:0] data3   [1023:0]; 

reg [7:0] dataCt   [15:0]; 
reg [7:0] dataIn   [15:0]; 
reg [7:0] dataKey   [15:0]; 
reg [9:0] addr1;
reg [9:0] addr2;
reg [9:0] total, total_old;
reg [7:0] senData  [3:0]; 
reg[adsize-1:0] adjust;
reg [4:0] delay=15;

wire  TXDone, txActive, rxReady, delClk;
reg  transmitReg;
reg start, trig, AESResetn, one, adj;


reg [63:0] A, B;

clock clock(clk, clk0, clk1, clk2, clk5t);
uart_tx uartTX(.i_Clock(clk1), .i_Tx_DV(transmitReg), .i_Tx_Byte(TXdata), .o_Tx_Active(txActive), .o_Tx_Serial(tx), .o_Tx_Done(TXDone) );		
uart_rx uartRX(.i_Clock(clk1), .i_Rx_Serial(rx), .o_Rx_DV(rxReady), .o_Rx_Byte(RXdata) );		

wire [255:0] out, out2, out3;		
reg [255:0] outReg, outReg2, outReg3;		
wire[7:0] processedOut, processedOut2, processedOut3;
parameter regsize =511;



//rippleCA rca(A, B, clk0, 1, 0, out);

delay del1 (clk0, delClk);
multiplier  rca(clk, A, B, out);

//AddSub as(.a(A), .b(B), .clk(clk0), .ce(1'b1), .c_in(clk5t), .s(out)); //clk0t
//
//  input clk;
//  input c_in;
//  input ce;
//  input [31 : 0] a;
//  input [31 : 0] b;
//  output [31 : 0] s;

//tdc_orig tp (clk0, out);
//tdc_top tp1 (clk0, out2);

//tdc_cou tp2 (clk5x, SensorBusy, out3);

tdc_decode tdc_decode(.clk(clk0), .rst(AESResetn), .chainvalue_i(outReg), .coded_o(processedOut)); 
//tdc_decode tdc_decode2(.clk(clk0), .rst(AESResetn), .chainvalue_i(outReg2), .coded_o(processedOut2)); 
//tdc_decode tdc_decode3(.clk(clk5t), .rst(AESResetn), .chainvalue_i(outReg3), .coded_o(processedOut3)); 

BUFG  u3 (.I(clk5x),   .O(clk5));

//////////---------------------
// function
/////////----------------------
wire [127:0] DoutTemp [AES_COUNT-1:0] ;
//wire [127:0] DoutTemp [AES_COUNT-1:0];
wire  [AES_COUNT-1:0] DvldTemp;

//assign Dout = Dout0 & Dout1 & Dout2 & Dout3;
assign Dout = DoutTemp[0]  & DoutTemp[1];
assign Dvld = &DvldTemp;
//assign Dvld= Dvld0 & Dvld1 & Dvld2 & Dvld3;//
//assign Dvld= Dvld0 & Dvld1 & Dvld2 & Dvld3 & Dvld4 & Dvld5 & Dvld6 & Dvld7;



    genvar i;  genvar j;
	 generate
        for(i = 0; i < AES_COUNT; i = i+1) 
		  begin:gen_code_label
			aes_tiny aes_tinyi ( .clk(clk1),  .rst(Drdy),  .din(Din), .key(Kin), .dout(DoutTemp[i]),  .done(DvldTemp[i]) );
	end
	endgenerate


//      (Kin, Din, Dout, Krdy, Drdy,EncDec, Kvld, Dvld, EN, BSY, CLK,RSTn);
assign led	=counter1[27:25];
assign HB 	=counter2[28];


reg busy;
assign SensorBusy = busy;
assign PWR=1;


(* IODELAY_LOC = "X1Y0" *)
IDELAYE2 #(
.CINVCTRL_SEL("FALSE"), // Enable dynamic clock inversion (FALSE, TRUE)
.DELAY_SRC("DATAIN"), // Delay input (IDATAIN, DATAIN)
.HIGH_PERFORMANCE_MODE("TRUE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
.IDELAY_TYPE("VAR_LOAD_PIPE"), // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
.IDELAY_VALUE(0), // Input delay tap setting (0-31)
.PIPE_SEL("TRUE"), // Select pipelined mode, FALSE, TRUE
.REFCLK_FREQUENCY(190.0), // IDELAYCTRL clock input frequency in MHz (190.0-210.0).
.SIGNAL_PATTERN("CLOCK") // DATA, CLOCK input signal
)
IDELAYE2_inst0 (
.CNTVALUEOUT(), // 5-bit output: Counter value output
.DATAOUT(clk0t), // 1-bit output: Delayed data output
.C(clk0), // 1-bit input: Clock input  refclk
.CE(1'b0), // 1-bit input: Active high enable increment/decrement input
.CINVCTRL(1'b0), // 1-bit input: Dynamic clock inversion input
.CNTVALUEIN(delay), // 5-bit input: Counter value input
.DATAIN(clk0), // 1-bit input: Internal delay data input
.IDATAIN(), // 1-bit input: Data input from the I/O
.INC(1'b0), // 1-bit input: Increment / Decrement tap delay input
.LD(1'b1), // 1-bit input: Load IDELAY_VALUE input
.LDPIPEEN(1'b1), // 1-bit input: Enable PIPELINE register to load data input
.REGRST(1'b0) // 1-bit input: Active-high reset tap-delay input
);


//(*LOC="IDELAY_X1Y1"*)
(* IODELAY_LOC = "X1Y0" *)
IDELAYCTRL IDELAYCTRL_inst (
.RDY(), // 1-bit output: Ready output
.REFCLK(clk2), // 1-bit input: Reference clock input  //CLKOUTREF
.RST(1'b0) // 1-bit input: Active high reset input
);

always @(posedge clk) begin
		counter2 <= counter2+1;
end

function [159:0] S;
input [7:0] number;

case (number)
0:S= 160'b0000;				
1:S= 160'b0001;				     2:S= 160'b0011;										3:S= 160'b0111; 							4:S= 160'b1111;
5:S= 160'b0001_1111;	   		  6:S= 160'b0011_1111;								7:S= 160'b0111_0111;						8:S= 160'b1111_1111;
9:S= 160'b0001_1111_1111; 		 10:S= 160'b0011_0000_0000;						10:S= 160'b0111_1111_1111;				11:S= 16'b1111_1111_1111;
12:S= 16'b0001_1111_1111_1111; 13:S= 160'b0011_1111_1111_1111;  				14:S= 160'b0111_1111_1111_1111;		15:S=160'b1111_1111_1111_1111;
31:S= 160'b0101_0111_1111_1111_0000; 32:S= 160'b0111_0111_1111_1111_000011; 
default: S = 160'b1111_1111_1111_0000;
endcase
endfunction


always @(posedge clk0) begin
   
	if(Drdy==1) begin
		   data1[addr2] <= 254;//processedOut;
		   data2[addr2] <= 254;//processedOut;
			//dataRaw[addr2]  <= out;
			outReg <= out;
			//addr2 <= 0;
			fsm1  <=1;
			addr2 <= addr2 +1;
			
			
	end
	else if(fsm1==1) begin
	      outReg <= out;    
			
			if(Dvld==1) begin
				data1[addr2] <= 255;
				data2[addr2] <= 255;
			end
			else begin
				//data1[addr2] <= out[7:0];//processedOut;
				//data1[addr2] <= out[15:8];//processedOut;
				data1[addr2] <= out[37:32];//processedOut;
				data2[addr2] <= processedOut;
				//data1[addr2] <= out[63:56];//processedOut;
			end 
			//dataRaw[addr2]  <= out;
			addr2 <= addr2 +1;
			if(addr2==1023) begin
				fsm1<=0;
				addr2 <=0;	
			end
	end

end

always @(posedge clk1) begin
//Kin  <= {Kin[126:0], Kin[127] ~^ Kin[0]};
		
		//if (RXdata==255) begin
		//	A= 32'hFFFFFFFF;
		//	B= 32'hFFFFFFFF;
		//end
		
		
		if (fsm==0) begin
		     
			  if(RXdata==250)  begin
				  fsm <=1;
				  inc <=1;
			  end
			  else if(RXdata >=0 & RXdata <= 31) begin
				  fsm <=1;
				  inc <=0;
				  delay <= RXdata;
				  adjust <= S(RXdata);
			  end
		end
		else if (fsm==1) begin
			//Kin <=128'h0;
			//Din <=128'h0;
			busy   <=1;			
			EncDec <=counter1[24];
			EN <=0;
			AESResetn  <=0;
			Krdy <=0;
			Drdy <=0;
			addr1 <= 0;
			counter1<= counter1+1;
			R  <=0;
			CE <=0;
			fsm <=2;
			adj <=1;

			//total <= senData[0] +  senData[1] + senData[2] + senData[3];
			
		end
		else if (fsm==2) begin
			
			AESResetn  <=1;
			R<=1;
			if(inc==1) begin
				delay <= delay +1;
				adjust <= S(delay);
			end
			//	adj	<=0;
			//end
			fsm <=3;
					//counter1 <=0;
				//end
		end
		else if (fsm==3 ) begin
			A= {RXdata,RXdata,RXdata,RXdata,RXdata,RXdata,RXdata,RXdata};
		   B= {~RXdata,~RXdata,~RXdata,~RXdata,~RXdata,~RXdata,~RXdata,~RXdata};
			EN		<=1;
			Krdy <=1;
			//counter1<= counter1+1;
			Kin  <=128'h000102030405060708090a0b0c0d0ef0;
			//     128'h00ff00ff00ff00ff00ff00ff00ff00ff
			fsm<=4;
					
		end
	
		else if (fsm==4 ) begin
		
			Din <= {delay, Dout[119:0]};//128'h0000ffff0000ffff0000ffff0000ffff;					
			Krdy <=0;
			fsm<= 5;
			R <=1;
				dataKey[0] <= Kin[127:120];
				dataKey[1] <= Kin[119:112];
				dataKey[2] <= Kin[111:104];
				dataKey[3] <= Kin[103:96];
				dataKey[4] <= Kin[95:88];
				dataKey[5] <= Kin[87:80];
				dataKey[6] <= Kin[79:72];
				dataKey[7] <= Kin[71:64];
				dataKey[8] <= Kin[63:56];
				dataKey[9] <= Kin[55:48];
				dataKey[10] <= Kin[47:40];
				dataKey[11] <= Kin[39:32];
				dataKey[12] <= Kin[31:24];
				dataKey[13] <= Kin[23:16];
				dataKey[14] <= Kin[15:8];
				dataKey[15] <= Kin[7:0];
		end
		
		else if (fsm==5) begin
			   dataIn[0] <= Din[127:120];
				dataIn[1] <= Din[119:112];
				dataIn[2] <= Din[111:104];
				dataIn[3] <= Din[103:96];
				dataIn[4] <= Din[95:88];
				dataIn[5] <= Din[87:80];
				dataIn[6] <= Din[79:72];
				dataIn[7] <= Din[71:64];
				dataIn[8] <= Din[63:56];
				dataIn[9] <= Din[55:48];
				dataIn[10] <= Din[47:40];
				dataIn[11] <= Din[39:32];
				dataIn[12] <= Din[31:24];
				dataIn[13] <= Din[23:16];
				dataIn[14] <= Din[15:8];
				dataIn[15] <= Din[7:0];
			R 	<=0;
			Drdy <=1;
			CE   <=1;
			fsm<= 6;
			addr1 <= 0;
		end
		
		else if(fsm==6) begin  // key rdy
			Drdy <=0;
			//transmitReg <=1;
			//data1[addr1] <= 9;
			addr1 <= addr1+1;
			if(Dvld==1) begin
				dataCt[0] <= Dout[127:120];
				dataCt[1] <= Dout[119:112];
				dataCt[2] <= Dout[111:104];
				dataCt[3] <= Dout[103:96];
				dataCt[4] <= Dout[95:88];
				dataCt[5] <= Dout[87:80];
				dataCt[6] <= Dout[79:72];
				dataCt[7] <= Dout[71:64];
				dataCt[8] <= Dout[63:56];
				dataCt[9] <= Dout[55:48];
				dataCt[10] <= Dout[47:40];
				dataCt[11] <= Dout[39:32];
				dataCt[12] <= Dout[31:24];
				dataCt[13] <= Dout[23:16];
				dataCt[14] <= Dout[15:8];
				dataCt[15] <= Dout[7:0];
				CE   <=0;
			end
			if(addr1==1023) begin
				fsm<=7;
				addr1 <= 0;
				counter1 <=0;
			end
		end
		
		else if(fsm==7) begin
			busy   <=0;
			transmitReg <=1;
			fsm<=8;
			TXdata<=dataIn[addr1];
			addr1 <= addr1+1;
		end
	else if(fsm==8) begin  // key rdy
			transmitReg <=0;
			fsm<=9;
		
		end
		
	else if(fsm==9 & TXDone==1) begin  // key rdy
			
			if(addr1==16) begin
				fsm<=11;
				addr1 <=0;
				end
			else
				fsm<=7;
		
		end

	
	
		else if(fsm==11) begin 
			transmitReg <=1;
			fsm<=12;
			TXdata<=dataKey[addr1];
			addr1 <= addr1+1;
		end
	else if(fsm==12) begin  // key rdy
			transmitReg <=0;
			fsm<=13;
		
		end
		
		else if(fsm==13 & TXDone==1) begin  // key rdy
			
			if(addr1==16) begin
				fsm<=14;
				addr1 <=0;
				end
			else
				fsm<=11;
		
		end
	
	
		else if(fsm==14) begin 
			transmitReg <=1;
			fsm<=15;
			TXdata<=dataCt[addr1];
			addr1 <= addr1+1;
		end
	else if(fsm==15) begin  // key rdy
			transmitReg <=0;
			fsm<=16;
		
		end
		
		else if(fsm==16 & TXDone==1) begin  // key rdy
			
			if(addr1==16) begin
				fsm<=20;
				addr1 <=0;
			//	outReg <= dataraw[0];
				end
			else
				fsm<=14;
		
		end
	
	
		else if(fsm==20) begin  // key rdy
			transmitReg <=1;
			fsm<=21;
			if(RXdata==0)
				TXdata<=data1[addr1];
			else
				TXdata<=data2[addr1];
			//addr1 <= addr1+1;
			//outReg <= dataRaw[addr1];
		end
		else if(fsm==21) begin  // key rdy
			transmitReg <=0;
			fsm<=22;
		
		end
		
		else if(fsm==22 & TXDone==1) begin  // key rdy
			
			if(addr1==1023) begin
				fsm<=23;
				counter1 <=0;
				addr1 <=0;
			end
			else begin
				fsm<=20;
				addr1 <= addr1+1;
		   end
		end
		
		
		else if (fsm==23) begin
		
				counter1<= counter1+1;
				if(counter1[12]==1) begin
				   fsm <=0;
					counter1<=0;
				end
		end
	//	//////////////////////////////////////////
	// FSM will not execute below this line
	//////////////////////////////////////////////////////// 
		else if(fsm==30) begin  // key rdy
			transmitReg <=1;
			fsm<=31;
			TXdata<=data2[addr1];
			//addr1 <= addr1+1;
			//outReg <= dataRaw[addr1];
		end
		else if(fsm==31) begin  // key rdy
			transmitReg <=0;
			fsm<=32;
		
		end
		
		else if(fsm==32 & TXDone==1) begin  // key rdy
			
			if(addr1==1023) begin
				fsm<=40;
				counter1 <=0;
				addr1<=0;
				total <=0;
				total_old <=total;
			end
			else begin
				fsm<=30;
				addr1 <= addr1+1;
		   end
		end
		
			
		else if(fsm==40) begin  // key rdy
			transmitReg <=1;
			fsm<=41;
			TXdata<=data3[addr1];
				if(addr1==50 | addr1==100 | addr1==150 | addr1==200) begin
					total <=  total + data3[addr1];
				end  
			
			//addr1 <= addr1+1;
			//outReg <= dataRaw[addr1];
		end
		else if(fsm==41) begin  // key rdy
			transmitReg <=0;
			fsm<=42;
		
		end
		
		else if(fsm==42 & TXDone==1) begin  // key rdy
			
			if(addr1==1023) begin
				fsm<=00;
				counter1 <=0;
			end
			else begin
				fsm<=40;
				addr1 <= addr1+1;
		   end
		end
		
		else if (fsm==100) begin
		
				counter1<= counter1+1;
				if(counter1[13]==1) begin
				   fsm <=0;
					counter1<=0;
				end
		end
		
end

//always @(posedge clk0) begin
//		
//		//counter1<=counter1+1;
//		
//		//if(counter1[CounterSize] ==0)
//		//	counter1<=counter1+ 1;
//		//else
//		//	counter1 <=0;
//		
//		if(fsm==0) begin
//		//if(counter1[CounterSize]==1) begin
//		Kin <=128'h0;
//		Din <=128'h0;	
//		EncDec <=0;
//		EN <=0;
//		AESResetn  <=0;
//		transmitReg <=0;
//		addr1  <=0;
//		trig   <=0;
//		
//		counter1 <= counter1 +1;
//				if(counter1[27]==1)
//					fsm<=1;
//		end
//		
////		else if(fsm==0) begin  // key rdy
////		EN <=1;
////		fsm<=1;
////		end
//		else if(fsm==1) begin  // key rdy
//		Kin <=128'hfffff;
//		EN <=1;
//		Krdy <=1;
//		fsm<=2;
//		R  <=1;
//		CE <=0;
//		trig   <=0;
//		AESResetn  <=1;
//		//addr1 <= addr1+1;
//		//data1[addr1] <= jrcToHex(Q); 
//		
//		end
//		
//		else if(fsm==2 & Kvld==1) begin  // key rdy
//		R  <=0;
//		CE <=1;
//		Din <=Dout;
//		Krdy <=0;0
//		Drdy <=1;
//		fsm<=3;
//		addr1 <= addr1+1;
//		data1[addr1] <= 2;//jrcToHex(Q);
//		trig   <=1;
//		counter1 <=0;
//		end
//		
//		else if(fsm==3) begin  // key rdy
//		trig <=0;
//		addr1 <= addr1+1;
//		data1[addr1] <= 3;//jrcToHex(Q);
//		if (BSY==1) begin
//			Drdy <=0;
//			fsm<=4;
//			end
//		
//		end
//		
//		else if(fsm==4) begin
//			addr1 <= addr1+1;
//			data1[addr1] <= 4;//jrcToHex(Q);
//			if (Dvld==1) begin
//				//Drdy <=0;
//				fsm<=5;
//				CE<=0;
//			end
//		
//		end
//		
//		else if(fsm==5) begin  // key rdy0
//		//Drdy <=0;
//		//Krdy <=0;
//		//EN   <=0;
//		//CE <=0;
//		fsm<=6;
//		addr1 <= 0;
//		data1[addr1] <= 5;//jrcToHex(Q);
//		
//		end
//			
//		else if(fsm==6) begin  // key rdy
//		transmitReg <=1;
//		fsm<=7;
//		TXdata<=data1[addr1];
//		addr1 <= addr1+1;
//		
//		end
//	
//		else if(fsm==7) begin  // key rdy
//		transmitReg <=0;
//		fsm<=8;
//		
//		end
//		
//		else if(fsm==8 & TXDone==1) begin  // key rdy
//		
//		if(addr1==1024)
//			fsm<=9;
//		else
//			fsm<=6;
//		
//		end
//		
//		else if(fsm==9) begin  // key rdy
//				
//				counter1 <= counter1 +1;
//				if(counter1[27]==1)
//					fsm<=10;
//				
//		end
//		
//		else if(fsm==10) begin  // key rdy
//				counter <=0;
//				fsm<=2;
//				R<=1;
//				addr1  <=0;
//		end
//		
//		
//		// transfer the data
//		
//		end
//
//




endmodule
