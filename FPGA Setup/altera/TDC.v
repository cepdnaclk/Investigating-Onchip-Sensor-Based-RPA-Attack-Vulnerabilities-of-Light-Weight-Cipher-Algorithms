// This is the primitive carry element from Fig. 1
module primitive_carry(
    //input wire a,
    //input wire b,
    input wire cin,
    output wire cout,
    output wire s
    );
	 
carry_sum #(.dont_touch("on") ) carry (.sin(0), .cin(cin),
.sout(s), .cout(cout));
	 

//cycloneiv_lcell_comb #(
//    .dont_touch("off") // default intel value
//    ) mycarry (
//        .dataa(),
//        .datab(b),
//        .datac(a),
//        .datad(),
//        .datae(),
//        .dataf(),
//        .datag(),
//        .cin(cin),
//        .sharein(),
//        .combout(),
//        .sumout(s),
//        .cout(cout)
//        );

// This LUT mask propagates the carry only
// It means that no logical function occurs
//defparam mycarry.lut_mask=16'h0000;

endmodule



// This is the basic register primitive in Fig. 1
module primitive_ff(
    input wire s,
    input wire clk,
    input wire clr,
    input wire ena,
    output wire q
    );

cycloneiv_ff #(.dont_touch("on") )  myff  (
    .d(s),
    .clk(clk),
    .clrn(),
    .aload(),
    .sclr(clr),
    .sload(),
    .asdata() ,
    .ena(ena),
    .devclrn(),
    .devpor() ,
    .q(q)
    );

endmodule



// This is the first input copy gate,
// as you cannot feed to carry port directly
module primitive_carry_in(
    input wire datac,
    output wire cout
    );

carry_sum #(.dont_touch("on") )  carry 
	 (.sin(datac), .cin(0),
.sout(), .cout(cout)); 
	 
	 
//cycloneiv_lcell_comb #(
//    .dont_touch("on")
//    ) mycarryin (
//        .dataa(),
//        .datab(),
//        .datac(datac),
//        .datad(),
//        .datae(),
//        .dataf(),
//        .datag(),
//        .cin(0),
//        .sharein(),
//        .combout(),
//        .sumout(),
//        .cout(cout)
//        );


// This LUT mask passes the datac port to cout
//defparam mycarryin.lut_mask=16'h0F0F0F0F;

// the mask works by concatenating the MPX LUTs
// these are f0, fl, f2, f3, and the mask has values
// mask[15:0]=f0; mask[31:16]=f1;
// mask[47:32]=£2; mask[63:48]=f3;

endmodule



// This is the carry chain itself
module carry_chain #(parameter N=128) (
    //input wire [N-1:0] a,
    //input wire [N-1:0] b,
    input wire carryin,
    input wire clk,
    input wire enable,
    input wire clear,
    output wire [N-1:0] regout,
    output wire carryout
    );

// internal wire for passing carries
// one bit larger for initial combinatorial cell
// which passes data_in along carry chain
wire [N:0] c_internal;

// assign first input manually
primitive_carry_in mycarry_in (
    .datac(carryin),
    .cout(c_internal[0])
    );

// internal wire for sum outs
wire [N-1:0] s;

// and rest with loop
genvar i;

generate
for (i=1; i<N+1; i=i+1) begin : gen

primitive_carry mycarry(
    //.a(0),
    //.b(0),
    .cin(c_internal[i-1]),
    .cout(c_internal[i]),
    .s(s[i-1])
    );

primitive_ff myff(
    .s(s[i-1]),
    .clk(clk),
    .q(regout[i-1]),
    .clr(clear),
    .ena(enable)
    );

end
endgenerate

assign carryout=c_internal[N];
endmodule