///////////////////////////////////
//    AES TestBench encryption   //
///////////////////////////////////
`timescale 1ns/1ns

module AES_TB;
parameter CLOCK = 50;

reg  [127:0] Din;
reg  [127:0] Key;
reg  [127:0] Kin;
reg  Drdy;
reg  Krdy;
reg  RSTn;
reg  EN_E, EN_D;
reg  CLK;
wire [127:0] Dout_E, Dout_D,DIout_E;
wire BSY_E, BSY_D;
wire Dvld_E, Dvld_D;

  aes_tiny aes_tiny( .clk(CLK),  .rst(~RSTn),  .din(Din), .key(Key), .dout(Dout_E),  .done(Dvld_E) );
 

// FIPS-197 Test Vectors
reg [127:0] KE, KD, CT, PT,KIE;
initial KE = 128'h000102030405060708090a0b0c0d0e0f; // Encryption Key
initial KIE = ~KE;
initial KD = 128'h13111d7fe3944a17f307a78b4d2b30c5; // Decryption Key (Encryption finlarl round key)
initial PT = 128'h00112233445566778899aabbccddeeff; // Plain Text
initial CT = 128'h69c4e0d86a7b0430d8cdb78070b4c55a; // Cipher Text

initial CLK = 1;
always #(CLOCK/2)
  CLK <= ~CLK;

initial begin

#(CLOCK/2)
// Reset
  RSTn <= 0;
 

// Eecryption key set
#(CLOCK)
  RSTn <= 1;
  Key  <= KE;
  Din  <= PT;

#(CLOCK*1)
  //RSTn <= 0;
#(CLOCK*80)

#(CLOCK)
// Reset
  RSTn <= 0;
 

// Eecryption key set
#(CLOCK)
  RSTn <= 1;
  Key  <= KD;
  Din  <= PT;
  
#(CLOCK*80)
  $finish;


   
end
endmodule
