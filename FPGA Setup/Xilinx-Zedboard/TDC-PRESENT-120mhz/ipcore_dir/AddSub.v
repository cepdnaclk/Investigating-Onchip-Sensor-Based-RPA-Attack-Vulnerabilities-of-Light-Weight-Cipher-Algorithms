////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: AddSub.v
// /___/   /\     Timestamp: Mon Aug 02 18:44:18 2021
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog "D:/Onedrive/OneDrive - UNSW/My Onedrive/PhD/Src/New-Delay-Sensor/Ripple-Adder/ZEDBoard/ZEDBOARD-OrigTDCSensor/ZEDBOARD-OrigTDCSensor-8del-new/ipcore_dir/tmp/_cg/AddSub.ngc" "D:/Onedrive/OneDrive - UNSW/My Onedrive/PhD/Src/New-Delay-Sensor/Ripple-Adder/ZEDBoard/ZEDBOARD-OrigTDCSensor/ZEDBOARD-OrigTDCSensor-8del-new/ipcore_dir/tmp/_cg/AddSub.v" 
// Device	: 7z020clg484-1
// Input file	: D:/Onedrive/OneDrive - UNSW/My Onedrive/PhD/Src/New-Delay-Sensor/Ripple-Adder/ZEDBoard/ZEDBOARD-OrigTDCSensor/ZEDBOARD-OrigTDCSensor-8del-new/ipcore_dir/tmp/_cg/AddSub.ngc
// Output file	: D:/Onedrive/OneDrive - UNSW/My Onedrive/PhD/Src/New-Delay-Sensor/Ripple-Adder/ZEDBoard/ZEDBOARD-OrigTDCSensor/ZEDBOARD-OrigTDCSensor-8del-new/ipcore_dir/tmp/_cg/AddSub.v
// # of Modules	: 1
// Design Name	: AddSub
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module AddSub (
  clk, c_in, ce, a, b, s
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input c_in;
  input ce;
  input [63 : 0] a;
  input [63 : 0] b;
  output [63 : 0] s;
  
  // synthesis translate_off
  
  wire \blk00000001/sig000002ec ;
  wire \blk00000001/sig000002eb ;
  wire \blk00000001/sig000002ea ;
  wire \blk00000001/sig000002e9 ;
  wire \blk00000001/sig000002e8 ;
  wire \blk00000001/sig000002e7 ;
  wire \blk00000001/sig000002e6 ;
  wire \blk00000001/sig000002e5 ;
  wire \blk00000001/sig000002e4 ;
  wire \blk00000001/sig000002e3 ;
  wire \blk00000001/sig000002e2 ;
  wire \blk00000001/sig000002e1 ;
  wire \blk00000001/sig000002e0 ;
  wire \blk00000001/sig000002df ;
  wire \blk00000001/sig000002de ;
  wire \blk00000001/sig000002dd ;
  wire \blk00000001/sig000002dc ;
  wire \blk00000001/sig000002db ;
  wire \blk00000001/sig000002da ;
  wire \blk00000001/sig000002d9 ;
  wire \blk00000001/sig000002d8 ;
  wire \blk00000001/sig000002d7 ;
  wire \blk00000001/sig000002d6 ;
  wire \blk00000001/sig000002d5 ;
  wire \blk00000001/sig000002d4 ;
  wire \blk00000001/sig000002d3 ;
  wire \blk00000001/sig000002d2 ;
  wire \blk00000001/sig000002d1 ;
  wire \blk00000001/sig000002d0 ;
  wire \blk00000001/sig000002cf ;
  wire \blk00000001/sig000002ce ;
  wire \blk00000001/sig000002cd ;
  wire \blk00000001/sig000002cc ;
  wire \blk00000001/sig000002cb ;
  wire \blk00000001/sig000002ca ;
  wire \blk00000001/sig000002c9 ;
  wire \blk00000001/sig000002c8 ;
  wire \blk00000001/sig000002c7 ;
  wire \blk00000001/sig000002c6 ;
  wire \blk00000001/sig000002c5 ;
  wire \blk00000001/sig000002c4 ;
  wire \blk00000001/sig000002c3 ;
  wire \blk00000001/sig000002c2 ;
  wire \blk00000001/sig000002c1 ;
  wire \blk00000001/sig000002c0 ;
  wire \blk00000001/sig000002bf ;
  wire \blk00000001/sig000002be ;
  wire \blk00000001/sig000002bd ;
  wire \blk00000001/sig000002bc ;
  wire \blk00000001/sig000002bb ;
  wire \blk00000001/sig000002ba ;
  wire \blk00000001/sig000002b9 ;
  wire \blk00000001/sig000002b8 ;
  wire \blk00000001/sig000002b7 ;
  wire \blk00000001/sig000002b6 ;
  wire \blk00000001/sig000002b5 ;
  wire \blk00000001/sig000002b4 ;
  wire \blk00000001/sig000002b3 ;
  wire \blk00000001/sig000002b2 ;
  wire \blk00000001/sig000002b1 ;
  wire \blk00000001/sig000002b0 ;
  wire \blk00000001/sig000002af ;
  wire \blk00000001/sig000002ae ;
  wire \blk00000001/sig000002ad ;
  wire \blk00000001/sig000002ac ;
  wire \blk00000001/sig000002ab ;
  wire \blk00000001/sig000002aa ;
  wire \blk00000001/sig000002a9 ;
  wire \blk00000001/sig000002a8 ;
  wire \blk00000001/sig000002a7 ;
  wire \blk00000001/sig000002a6 ;
  wire \blk00000001/sig000002a5 ;
  wire \blk00000001/sig000002a4 ;
  wire \blk00000001/sig000002a3 ;
  wire \blk00000001/sig000002a2 ;
  wire \blk00000001/sig000002a1 ;
  wire \blk00000001/sig000002a0 ;
  wire \blk00000001/sig0000029f ;
  wire \blk00000001/sig0000029e ;
  wire \blk00000001/sig0000029d ;
  wire \blk00000001/sig0000029c ;
  wire \blk00000001/sig0000029b ;
  wire \blk00000001/sig0000029a ;
  wire \blk00000001/sig00000299 ;
  wire \blk00000001/sig00000298 ;
  wire \blk00000001/sig00000297 ;
  wire \blk00000001/sig00000296 ;
  wire \blk00000001/sig00000295 ;
  wire \blk00000001/sig00000294 ;
  wire \blk00000001/sig00000293 ;
  wire \blk00000001/sig00000292 ;
  wire \blk00000001/sig00000291 ;
  wire \blk00000001/sig00000290 ;
  wire \blk00000001/sig0000028f ;
  wire \blk00000001/sig0000028e ;
  wire \blk00000001/sig0000028d ;
  wire \blk00000001/sig0000028c ;
  wire \blk00000001/sig0000028b ;
  wire \blk00000001/sig0000028a ;
  wire \blk00000001/sig00000289 ;
  wire \blk00000001/sig00000288 ;
  wire \blk00000001/sig00000287 ;
  wire \blk00000001/sig00000286 ;
  wire \blk00000001/sig00000285 ;
  wire \blk00000001/sig00000284 ;
  wire \blk00000001/sig00000283 ;
  wire \blk00000001/sig00000282 ;
  wire \blk00000001/sig00000281 ;
  wire \blk00000001/sig00000280 ;
  wire \blk00000001/sig0000027f ;
  wire \blk00000001/sig0000027e ;
  wire \blk00000001/sig0000027d ;
  wire \blk00000001/sig0000027c ;
  wire \blk00000001/sig0000027b ;
  wire \blk00000001/sig0000027a ;
  wire \blk00000001/sig00000279 ;
  wire \blk00000001/sig00000278 ;
  wire \blk00000001/sig00000277 ;
  wire \blk00000001/sig00000276 ;
  wire \blk00000001/sig00000275 ;
  wire \blk00000001/sig00000274 ;
  wire \blk00000001/sig00000273 ;
  wire \blk00000001/sig00000272 ;
  wire \blk00000001/sig00000271 ;
  wire \blk00000001/sig00000270 ;
  wire \blk00000001/sig0000026f ;
  wire \blk00000001/sig0000026e ;
  wire \blk00000001/sig0000026d ;
  wire \blk00000001/sig0000026c ;
  wire \blk00000001/sig0000026b ;
  wire \blk00000001/sig0000026a ;
  wire \blk00000001/sig00000269 ;
  wire \blk00000001/sig00000268 ;
  wire \blk00000001/sig00000267 ;
  wire \blk00000001/sig00000266 ;
  wire \blk00000001/sig00000265 ;
  wire \blk00000001/sig00000264 ;
  wire \blk00000001/sig00000263 ;
  wire \blk00000001/sig00000262 ;
  wire \blk00000001/sig00000261 ;
  wire \blk00000001/sig00000260 ;
  wire \blk00000001/sig0000025f ;
  wire \blk00000001/sig0000025e ;
  wire \blk00000001/sig0000025d ;
  wire \blk00000001/sig0000025c ;
  wire \blk00000001/sig0000025b ;
  wire \blk00000001/sig0000025a ;
  wire \blk00000001/sig00000259 ;
  wire \blk00000001/sig00000258 ;
  wire \blk00000001/sig00000257 ;
  wire \blk00000001/sig00000256 ;
  wire \blk00000001/sig00000255 ;
  wire \blk00000001/sig00000254 ;
  wire \blk00000001/sig00000253 ;
  wire \blk00000001/sig00000252 ;
  wire \blk00000001/sig00000251 ;
  wire \blk00000001/sig00000250 ;
  wire \blk00000001/sig0000024f ;
  wire \blk00000001/sig0000024e ;
  wire \blk00000001/sig0000024d ;
  wire \blk00000001/sig0000024c ;
  wire \blk00000001/sig0000024b ;
  wire \blk00000001/sig0000024a ;
  wire \blk00000001/sig00000249 ;
  wire \blk00000001/sig00000248 ;
  wire \blk00000001/sig00000247 ;
  wire \blk00000001/sig00000246 ;
  wire \blk00000001/sig00000245 ;
  wire \blk00000001/sig00000244 ;
  wire \blk00000001/sig00000243 ;
  wire \blk00000001/sig00000242 ;
  wire \blk00000001/sig00000241 ;
  wire \blk00000001/sig00000240 ;
  wire \blk00000001/sig0000023f ;
  wire \blk00000001/sig0000023e ;
  wire \blk00000001/sig0000023d ;
  wire \blk00000001/sig0000023c ;
  wire \blk00000001/sig0000023b ;
  wire \blk00000001/sig0000023a ;
  wire \blk00000001/sig00000239 ;
  wire \blk00000001/sig00000238 ;
  wire \blk00000001/sig00000237 ;
  wire \blk00000001/sig00000236 ;
  wire \blk00000001/sig00000235 ;
  wire \blk00000001/sig00000234 ;
  wire \blk00000001/sig00000233 ;
  wire \blk00000001/sig00000232 ;
  wire \blk00000001/sig00000231 ;
  wire \blk00000001/sig00000230 ;
  wire \blk00000001/sig0000022f ;
  wire \blk00000001/sig0000022e ;
  wire \blk00000001/sig0000022d ;
  wire \blk00000001/sig0000022c ;
  wire \blk00000001/sig0000022b ;
  wire \blk00000001/sig0000022a ;
  wire \blk00000001/sig00000229 ;
  wire \blk00000001/sig00000228 ;
  wire \blk00000001/sig00000227 ;
  wire \blk00000001/sig00000226 ;
  wire \blk00000001/sig00000225 ;
  wire \blk00000001/sig00000224 ;
  wire \blk00000001/sig00000223 ;
  wire \blk00000001/sig00000222 ;
  wire \blk00000001/sig00000221 ;
  wire \blk00000001/sig00000220 ;
  wire \blk00000001/sig0000021f ;
  wire \blk00000001/sig0000021e ;
  wire \blk00000001/sig0000021d ;
  wire \blk00000001/sig0000021c ;
  wire \blk00000001/sig0000021b ;
  wire \blk00000001/sig0000021a ;
  wire \blk00000001/sig00000219 ;
  wire \blk00000001/sig00000218 ;
  wire \blk00000001/sig00000217 ;
  wire \blk00000001/sig00000216 ;
  wire \blk00000001/sig00000215 ;
  wire \blk00000001/sig00000214 ;
  wire \blk00000001/sig00000213 ;
  wire \blk00000001/sig00000212 ;
  wire \blk00000001/sig00000211 ;
  wire \blk00000001/sig00000210 ;
  wire \blk00000001/sig0000020f ;
  wire \blk00000001/sig0000020e ;
  wire \blk00000001/sig0000020d ;
  wire \blk00000001/sig0000020c ;
  wire \blk00000001/sig0000020b ;
  wire \blk00000001/sig0000020a ;
  wire \blk00000001/sig00000209 ;
  wire \blk00000001/sig00000208 ;
  wire \blk00000001/sig00000207 ;
  wire \blk00000001/sig00000206 ;
  wire \blk00000001/sig00000205 ;
  wire \blk00000001/sig00000204 ;
  wire \blk00000001/sig00000203 ;
  wire \blk00000001/sig00000202 ;
  wire \blk00000001/sig00000201 ;
  wire \blk00000001/sig00000200 ;
  wire \blk00000001/sig000001ff ;
  wire \blk00000001/sig000001fe ;
  wire \blk00000001/sig000001fd ;
  wire \blk00000001/sig000001fc ;
  wire \blk00000001/sig000001fb ;
  wire \blk00000001/sig000001fa ;
  wire \blk00000001/sig000001f9 ;
  wire \blk00000001/sig000001f8 ;
  wire \blk00000001/sig000001f7 ;
  wire \blk00000001/sig000001f6 ;
  wire \blk00000001/sig000001f5 ;
  wire \blk00000001/sig000001f4 ;
  wire \blk00000001/sig000001f3 ;
  wire \blk00000001/sig000001f2 ;
  wire \blk00000001/sig000001f1 ;
  wire \blk00000001/sig000001f0 ;
  wire \blk00000001/sig000001ef ;
  wire \blk00000001/sig000001ee ;
  wire \blk00000001/sig000001ed ;
  wire \blk00000001/sig000001ec ;
  wire \blk00000001/sig000001eb ;
  wire \blk00000001/sig000001ea ;
  wire \blk00000001/sig000001e9 ;
  wire \blk00000001/sig000001e8 ;
  wire \blk00000001/sig000001e7 ;
  wire \blk00000001/sig000001e6 ;
  wire \blk00000001/sig000001e5 ;
  wire \blk00000001/sig000001e4 ;
  wire \blk00000001/sig000001e3 ;
  wire \blk00000001/sig000001e2 ;
  wire \blk00000001/sig000001e1 ;
  wire \blk00000001/sig000001e0 ;
  wire \blk00000001/sig000001df ;
  wire \blk00000001/sig000001de ;
  wire \blk00000001/sig000001dd ;
  wire \blk00000001/sig000001dc ;
  wire \blk00000001/sig000001db ;
  wire \blk00000001/sig000001da ;
  wire \blk00000001/sig000001d9 ;
  wire \blk00000001/sig000001d8 ;
  wire \blk00000001/sig000001d7 ;
  wire \blk00000001/sig000001d6 ;
  wire \blk00000001/sig000001d5 ;
  wire \blk00000001/sig000001d4 ;
  wire \blk00000001/sig000001d3 ;
  wire \blk00000001/sig000001d2 ;
  wire \blk00000001/sig000001d1 ;
  wire \blk00000001/sig000001d0 ;
  wire \blk00000001/sig000001cf ;
  wire \blk00000001/sig000001ce ;
  wire \blk00000001/sig000001cd ;
  wire \blk00000001/sig000001cc ;
  wire \blk00000001/sig000001cb ;
  wire \blk00000001/sig000001ca ;
  wire \blk00000001/sig000001c9 ;
  wire \blk00000001/sig000001c8 ;
  wire \blk00000001/sig000001c7 ;
  wire \blk00000001/sig000001c6 ;
  wire \blk00000001/sig000001c5 ;
  wire \blk00000001/sig000001c4 ;
  wire \blk00000001/sig000001c3 ;
  wire \blk00000001/sig000001c2 ;
  wire \blk00000001/sig000001c1 ;
  wire \blk00000001/sig000001c0 ;
  wire \blk00000001/sig000001bf ;
  wire \blk00000001/sig000001be ;
  wire \blk00000001/sig000001bd ;
  wire \blk00000001/sig000001bc ;
  wire \blk00000001/sig000001bb ;
  wire \blk00000001/sig000001ba ;
  wire \blk00000001/sig000001b9 ;
  wire \blk00000001/sig000001b8 ;
  wire \blk00000001/sig000001b7 ;
  wire \blk00000001/sig000001b6 ;
  wire \blk00000001/sig000001b5 ;
  wire \blk00000001/sig000001b4 ;
  wire \blk00000001/sig000001b3 ;
  wire \blk00000001/sig000001b2 ;
  wire \blk00000001/sig000001b1 ;
  wire \blk00000001/sig000001b0 ;
  wire \blk00000001/sig000001af ;
  wire \blk00000001/sig000001ae ;
  wire \blk00000001/sig000001ad ;
  wire \blk00000001/sig000001ac ;
  wire \blk00000001/sig000001ab ;
  wire \blk00000001/sig000001aa ;
  wire \blk00000001/sig000001a9 ;
  wire \blk00000001/sig000001a8 ;
  wire \blk00000001/sig000001a7 ;
  wire \blk00000001/sig000001a6 ;
  wire \blk00000001/sig000001a5 ;
  wire \blk00000001/sig000001a4 ;
  wire \blk00000001/sig000001a3 ;
  wire \blk00000001/sig000001a2 ;
  wire \blk00000001/sig000001a1 ;
  wire \blk00000001/sig000001a0 ;
  wire \blk00000001/sig0000019f ;
  wire \blk00000001/sig0000019e ;
  wire \blk00000001/sig0000019d ;
  wire \blk00000001/sig0000019c ;
  wire \blk00000001/sig0000019b ;
  wire \blk00000001/sig0000019a ;
  wire \blk00000001/sig00000199 ;
  wire \blk00000001/sig00000198 ;
  wire \blk00000001/sig00000197 ;
  wire \blk00000001/sig00000196 ;
  wire \blk00000001/sig00000195 ;
  wire \blk00000001/sig00000194 ;
  wire \blk00000001/sig00000193 ;
  wire \blk00000001/sig00000192 ;
  wire \blk00000001/sig00000191 ;
  wire \blk00000001/sig00000190 ;
  wire \blk00000001/sig0000018f ;
  wire \blk00000001/sig0000018e ;
  wire \blk00000001/sig0000018d ;
  wire \blk00000001/sig0000018c ;
  wire \blk00000001/sig0000018b ;
  wire \blk00000001/sig0000018a ;
  wire \blk00000001/sig00000189 ;
  wire \blk00000001/sig00000188 ;
  wire \blk00000001/sig00000187 ;
  wire \blk00000001/sig00000186 ;
  wire \blk00000001/sig00000185 ;
  wire \blk00000001/sig00000184 ;
  wire \blk00000001/sig00000183 ;
  wire \blk00000001/sig00000182 ;
  wire \blk00000001/sig00000181 ;
  wire \blk00000001/sig00000180 ;
  wire \blk00000001/sig0000017f ;
  wire \blk00000001/sig0000017e ;
  wire \blk00000001/sig0000017d ;
  wire \blk00000001/sig0000017c ;
  wire \blk00000001/sig0000017b ;
  wire \blk00000001/sig0000017a ;
  wire \blk00000001/sig00000179 ;
  wire \blk00000001/sig00000178 ;
  wire \blk00000001/sig00000177 ;
  wire \blk00000001/sig00000176 ;
  wire \blk00000001/sig00000175 ;
  wire \blk00000001/sig00000174 ;
  wire \blk00000001/sig00000173 ;
  wire \blk00000001/sig00000172 ;
  wire \blk00000001/sig00000171 ;
  wire \blk00000001/sig00000170 ;
  wire \blk00000001/sig0000016f ;
  wire \blk00000001/sig0000016e ;
  wire \blk00000001/sig0000016d ;
  wire \blk00000001/sig0000016c ;
  wire \blk00000001/sig0000016b ;
  wire \blk00000001/sig0000016a ;
  wire \blk00000001/sig00000169 ;
  wire \blk00000001/sig00000168 ;
  wire \blk00000001/sig00000167 ;
  wire \blk00000001/sig00000166 ;
  wire \blk00000001/sig00000165 ;
  wire \blk00000001/sig00000164 ;
  wire \blk00000001/sig00000163 ;
  wire \blk00000001/sig00000162 ;
  wire \blk00000001/sig00000161 ;
  wire \blk00000001/sig00000160 ;
  wire \blk00000001/sig0000015f ;
  wire \blk00000001/sig0000015e ;
  wire \blk00000001/sig0000015d ;
  wire \blk00000001/sig0000015c ;
  wire \blk00000001/sig0000015b ;
  wire \blk00000001/sig0000015a ;
  wire \blk00000001/sig00000159 ;
  wire \blk00000001/sig00000158 ;
  wire \blk00000001/sig00000157 ;
  wire \blk00000001/sig00000156 ;
  wire \blk00000001/sig00000155 ;
  wire \blk00000001/sig00000154 ;
  wire \blk00000001/sig00000153 ;
  wire \blk00000001/sig00000152 ;
  wire \blk00000001/sig00000151 ;
  wire \blk00000001/sig00000150 ;
  wire \blk00000001/sig0000014f ;
  wire \blk00000001/sig0000014e ;
  wire \blk00000001/sig0000014d ;
  wire \blk00000001/sig0000014c ;
  wire \blk00000001/sig0000014b ;
  wire \blk00000001/sig0000014a ;
  wire \blk00000001/sig00000149 ;
  wire \blk00000001/sig00000148 ;
  wire \blk00000001/sig00000147 ;
  wire \blk00000001/sig00000146 ;
  wire \blk00000001/sig00000145 ;
  wire \blk00000001/sig00000144 ;
  wire \blk00000001/sig00000143 ;
  wire \blk00000001/sig00000142 ;
  wire \blk00000001/sig00000141 ;
  wire \blk00000001/sig00000140 ;
  wire \blk00000001/sig0000013f ;
  wire \blk00000001/sig0000013e ;
  wire \blk00000001/sig0000013d ;
  wire \blk00000001/sig0000013c ;
  wire \blk00000001/sig0000013b ;
  wire \blk00000001/sig0000013a ;
  wire \blk00000001/sig00000139 ;
  wire \blk00000001/sig00000138 ;
  wire \blk00000001/sig00000137 ;
  wire \blk00000001/sig00000136 ;
  wire \blk00000001/sig00000135 ;
  wire \blk00000001/sig00000134 ;
  wire \blk00000001/sig00000133 ;
  wire \blk00000001/sig00000132 ;
  wire \blk00000001/sig00000131 ;
  wire \blk00000001/sig00000130 ;
  wire \blk00000001/sig0000012f ;
  wire \blk00000001/sig0000012e ;
  wire \blk00000001/sig0000012d ;
  wire \blk00000001/sig0000012c ;
  wire \blk00000001/sig0000012b ;
  wire \blk00000001/sig0000012a ;
  wire \blk00000001/sig00000129 ;
  wire \blk00000001/sig00000128 ;
  wire \blk00000001/sig00000127 ;
  wire \blk00000001/sig00000126 ;
  wire \blk00000001/sig00000125 ;
  wire \blk00000001/sig00000124 ;
  wire \blk00000001/sig00000123 ;
  wire \blk00000001/sig00000122 ;
  wire \blk00000001/sig00000121 ;
  wire \blk00000001/sig00000120 ;
  wire \blk00000001/sig0000011f ;
  wire \blk00000001/sig0000011e ;
  wire \blk00000001/sig0000011d ;
  wire \blk00000001/sig0000011c ;
  wire \blk00000001/sig0000011b ;
  wire \blk00000001/sig0000011a ;
  wire \blk00000001/sig00000119 ;
  wire \blk00000001/sig00000118 ;
  wire \blk00000001/sig00000117 ;
  wire \blk00000001/sig00000116 ;
  wire \blk00000001/sig00000115 ;
  wire \blk00000001/sig00000114 ;
  wire \blk00000001/sig00000113 ;
  wire \blk00000001/sig00000112 ;
  wire \blk00000001/sig00000111 ;
  wire \blk00000001/sig00000110 ;
  wire \blk00000001/sig0000010f ;
  wire \blk00000001/sig0000010e ;
  wire \blk00000001/sig0000010d ;
  wire \blk00000001/sig0000010c ;
  wire \blk00000001/sig0000010b ;
  wire \blk00000001/sig0000010a ;
  wire \blk00000001/sig00000109 ;
  wire \blk00000001/sig00000108 ;
  wire \blk00000001/sig00000107 ;
  wire \blk00000001/sig00000106 ;
  wire \blk00000001/sig00000105 ;
  wire \blk00000001/sig00000104 ;
  wire \blk00000001/sig00000103 ;
  wire \blk00000001/sig00000102 ;
  wire \blk00000001/sig00000101 ;
  wire \blk00000001/sig00000100 ;
  wire \blk00000001/sig000000ff ;
  wire \blk00000001/sig000000fe ;
  wire \blk00000001/sig000000fd ;
  wire \blk00000001/sig000000fc ;
  wire \blk00000001/sig000000fb ;
  wire \blk00000001/sig000000fa ;
  wire \blk00000001/sig000000f9 ;
  wire \blk00000001/sig000000f8 ;
  wire \blk00000001/sig000000f7 ;
  wire \blk00000001/sig000000f6 ;
  wire \blk00000001/sig000000f5 ;
  wire \blk00000001/sig000000f4 ;
  wire \blk00000001/sig000000f3 ;
  wire \blk00000001/sig000000f2 ;
  wire \blk00000001/sig000000f1 ;
  wire \blk00000001/sig000000f0 ;
  wire \blk00000001/sig000000ef ;
  wire \blk00000001/sig000000ee ;
  wire \blk00000001/sig000000ed ;
  wire \blk00000001/sig000000ec ;
  wire \blk00000001/sig000000eb ;
  wire \blk00000001/sig000000ea ;
  wire \blk00000001/sig000000e9 ;
  wire \blk00000001/sig000000e8 ;
  wire \blk00000001/sig000000e7 ;
  wire \blk00000001/sig000000e6 ;
  wire \blk00000001/sig000000e5 ;
  wire \blk00000001/sig000000e4 ;
  wire \blk00000001/sig000000e3 ;
  wire \blk00000001/sig000000e2 ;
  wire \blk00000001/sig000000e1 ;
  wire \blk00000001/sig000000e0 ;
  wire \blk00000001/sig000000df ;
  wire \blk00000001/sig000000de ;
  wire \blk00000001/sig000000dd ;
  wire \blk00000001/sig000000dc ;
  wire \blk00000001/sig000000db ;
  wire \blk00000001/sig000000da ;
  wire \blk00000001/sig000000d9 ;
  wire \blk00000001/sig000000d8 ;
  wire \blk00000001/sig000000d7 ;
  wire \blk00000001/sig000000d6 ;
  wire \blk00000001/sig000000d5 ;
  wire \blk00000001/sig000000d4 ;
  wire \blk00000001/sig000000d3 ;
  wire \blk00000001/sig000000d2 ;
  wire \blk00000001/sig000000d1 ;
  wire \blk00000001/sig000000d0 ;
  wire \blk00000001/sig000000cf ;
  wire \blk00000001/sig000000ce ;
  wire \blk00000001/sig000000cd ;
  wire \blk00000001/sig000000cc ;
  wire \blk00000001/sig000000cb ;
  wire \blk00000001/sig000000ca ;
  wire \blk00000001/sig000000c9 ;
  wire \blk00000001/sig000000c8 ;
  wire \blk00000001/sig000000c7 ;
  wire \blk00000001/sig000000c6 ;
  wire \blk00000001/sig000000c5 ;
  wire \blk00000001/sig000000c4 ;
  wire \NLW_blk00000001/blk0000026a_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000268_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000266_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000264_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000262_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000260_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000025e_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000025c_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000025a_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000258_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000256_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000254_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000252_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000250_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000024e_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000024c_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000024a_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000248_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000246_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000244_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000242_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000240_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000023e_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000023c_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000023a_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000238_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000236_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000234_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000232_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000230_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000022e_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000022c_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000022a_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000228_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000226_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000224_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000222_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000220_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000021e_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000021c_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000021a_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000218_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000216_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000214_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000212_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000210_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000020e_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000020c_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000020a_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000208_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000206_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000204_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000202_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000200_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001fe_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001fc_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001fa_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001f8_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001f6_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001f4_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001f2_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001f0_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001ee_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001ec_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001ea_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001e8_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001e6_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001e4_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001e2_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001e0_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001de_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001dc_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001da_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001d8_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001d6_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001d4_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001d2_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001d0_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001ce_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001cc_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001ca_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001c8_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001c6_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001c4_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001c2_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001c0_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001be_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001bc_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk000001ba_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000109_O_UNCONNECTED ;
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000026b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ec ),
    .Q(s[42])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000026a  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000230 ),
    .Q(\blk00000001/sig000002ec ),
    .Q15(\NLW_blk00000001/blk0000026a_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000269  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002eb ),
    .Q(s[21])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000268  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000021b ),
    .Q(\blk00000001/sig000002eb ),
    .Q15(\NLW_blk00000001/blk00000268_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000267  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ea ),
    .Q(s[23])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000266  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000106 ),
    .Q(\blk00000001/sig000002ea ),
    .Q15(\NLW_blk00000001/blk00000266_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000265  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e9 ),
    .Q(s[24])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000264  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000107 ),
    .Q(\blk00000001/sig000002e9 ),
    .Q15(\NLW_blk00000001/blk00000264_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000263  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e8 ),
    .Q(s[22])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000262  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000105 ),
    .Q(\blk00000001/sig000002e8 ),
    .Q15(\NLW_blk00000001/blk00000262_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000261  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e7 ),
    .Q(s[26])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000260  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000109 ),
    .Q(\blk00000001/sig000002e7 ),
    .Q15(\NLW_blk00000001/blk00000260_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000025f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e6 ),
    .Q(s[27])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000025e  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000010a ),
    .Q(\blk00000001/sig000002e6 ),
    .Q15(\NLW_blk00000001/blk0000025e_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000025d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e5 ),
    .Q(s[25])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000025c  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000108 ),
    .Q(\blk00000001/sig000002e5 ),
    .Q15(\NLW_blk00000001/blk0000025c_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000025b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e4 ),
    .Q(s[29])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000025a  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000010c ),
    .Q(\blk00000001/sig000002e4 ),
    .Q15(\NLW_blk00000001/blk0000025a_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000259  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e3 ),
    .Q(s[30])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000258  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000010d ),
    .Q(\blk00000001/sig000002e3 ),
    .Q15(\NLW_blk00000001/blk00000258_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000257  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e2 ),
    .Q(s[28])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000256  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000010b ),
    .Q(\blk00000001/sig000002e2 ),
    .Q15(\NLW_blk00000001/blk00000256_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000255  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e1 ),
    .Q(s[31])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000254  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000010e ),
    .Q(\blk00000001/sig000002e1 ),
    .Q15(\NLW_blk00000001/blk00000254_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000253  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002e0 ),
    .Q(s[10])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000252  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000206 ),
    .Q(\blk00000001/sig000002e0 ),
    .Q15(\NLW_blk00000001/blk00000252_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000251  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002df ),
    .Q(s[12])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000250  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000011e ),
    .Q(\blk00000001/sig000002df ),
    .Q15(\NLW_blk00000001/blk00000250_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000024f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002de ),
    .Q(s[13])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000024e  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000011f ),
    .Q(\blk00000001/sig000002de ),
    .Q15(\NLW_blk00000001/blk0000024e_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000024d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002dd ),
    .Q(s[11])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000024c  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000011d ),
    .Q(\blk00000001/sig000002dd ),
    .Q15(\NLW_blk00000001/blk0000024c_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000024b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002dc ),
    .Q(s[15])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000024a  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000121 ),
    .Q(\blk00000001/sig000002dc ),
    .Q15(\NLW_blk00000001/blk0000024a_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000249  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002db ),
    .Q(s[16])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000248  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000122 ),
    .Q(\blk00000001/sig000002db ),
    .Q15(\NLW_blk00000001/blk00000248_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000247  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002da ),
    .Q(s[14])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000246  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000120 ),
    .Q(\blk00000001/sig000002da ),
    .Q15(\NLW_blk00000001/blk00000246_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000245  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d9 ),
    .Q(s[18])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000244  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000124 ),
    .Q(\blk00000001/sig000002d9 ),
    .Q15(\NLW_blk00000001/blk00000244_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000243  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d8 ),
    .Q(s[19])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000242  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000125 ),
    .Q(\blk00000001/sig000002d8 ),
    .Q15(\NLW_blk00000001/blk00000242_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000241  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d7 ),
    .Q(s[17])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000240  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000123 ),
    .Q(\blk00000001/sig000002d7 ),
    .Q15(\NLW_blk00000001/blk00000240_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000023f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d6 ),
    .Q(s[20])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000023e  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000126 ),
    .Q(\blk00000001/sig000002d6 ),
    .Q15(\NLW_blk00000001/blk0000023e_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000023d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d5 ),
    .Q(\blk00000001/sig000000ca )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000023c  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d3 ),
    .Q(\blk00000001/sig000002d5 ),
    .Q15(\NLW_blk00000001/blk0000023c_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000023b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d4 ),
    .Q(\blk00000001/sig000000cc )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000023a  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001dc ),
    .Q(\blk00000001/sig000002d4 ),
    .Q15(\NLW_blk00000001/blk0000023a_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000239  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d3 ),
    .Q(\blk00000001/sig000000cd )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000238  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001db ),
    .Q(\blk00000001/sig000002d3 ),
    .Q15(\NLW_blk00000001/blk00000238_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000237  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d2 ),
    .Q(\blk00000001/sig000000cb )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000236  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001dd ),
    .Q(\blk00000001/sig000002d2 ),
    .Q15(\NLW_blk00000001/blk00000236_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000235  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d1 ),
    .Q(\blk00000001/sig000000cf )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000234  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d9 ),
    .Q(\blk00000001/sig000002d1 ),
    .Q15(\NLW_blk00000001/blk00000234_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000233  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002d0 ),
    .Q(\blk00000001/sig000000d0 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000232  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d8 ),
    .Q(\blk00000001/sig000002d0 ),
    .Q15(\NLW_blk00000001/blk00000232_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000231  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002cf ),
    .Q(\blk00000001/sig000000ce )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000230  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001da ),
    .Q(\blk00000001/sig000002cf ),
    .Q15(\NLW_blk00000001/blk00000230_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000022f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ce ),
    .Q(\blk00000001/sig000000d2 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000022e  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d6 ),
    .Q(\blk00000001/sig000002ce ),
    .Q15(\NLW_blk00000001/blk0000022e_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000022d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002cd ),
    .Q(\blk00000001/sig000000d3 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000022c  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d5 ),
    .Q(\blk00000001/sig000002cd ),
    .Q15(\NLW_blk00000001/blk0000022c_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000022b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002cc ),
    .Q(\blk00000001/sig000000d1 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000022a  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d7 ),
    .Q(\blk00000001/sig000002cc ),
    .Q15(\NLW_blk00000001/blk0000022a_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000229  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002cb ),
    .Q(\blk00000001/sig000000d4 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000228  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d4 ),
    .Q(\blk00000001/sig000002cb ),
    .Q15(\NLW_blk00000001/blk00000228_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000227  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ca ),
    .Q(\blk00000001/sig000000e2 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000226  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b2 ),
    .Q(\blk00000001/sig000002ca ),
    .Q15(\NLW_blk00000001/blk00000226_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000225  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c9 ),
    .Q(\blk00000001/sig000000e4 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000224  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001bb ),
    .Q(\blk00000001/sig000002c9 ),
    .Q15(\NLW_blk00000001/blk00000224_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000223  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c8 ),
    .Q(\blk00000001/sig000000e5 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000222  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001ba ),
    .Q(\blk00000001/sig000002c8 ),
    .Q15(\NLW_blk00000001/blk00000222_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000221  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c7 ),
    .Q(\blk00000001/sig000000e3 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000220  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001bc ),
    .Q(\blk00000001/sig000002c7 ),
    .Q15(\NLW_blk00000001/blk00000220_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000021f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c6 ),
    .Q(\blk00000001/sig000000e7 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000021e  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b8 ),
    .Q(\blk00000001/sig000002c6 ),
    .Q15(\NLW_blk00000001/blk0000021e_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000021d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c5 ),
    .Q(\blk00000001/sig000000e8 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000021c  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b7 ),
    .Q(\blk00000001/sig000002c5 ),
    .Q15(\NLW_blk00000001/blk0000021c_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000021b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c4 ),
    .Q(\blk00000001/sig000000e6 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000021a  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b9 ),
    .Q(\blk00000001/sig000002c4 ),
    .Q15(\NLW_blk00000001/blk0000021a_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000219  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c3 ),
    .Q(\blk00000001/sig000000ea )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000218  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b5 ),
    .Q(\blk00000001/sig000002c3 ),
    .Q15(\NLW_blk00000001/blk00000218_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000217  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c2 ),
    .Q(\blk00000001/sig000000eb )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000216  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b4 ),
    .Q(\blk00000001/sig000002c2 ),
    .Q15(\NLW_blk00000001/blk00000216_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000215  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c1 ),
    .Q(\blk00000001/sig000000e9 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000214  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b6 ),
    .Q(\blk00000001/sig000002c1 ),
    .Q15(\NLW_blk00000001/blk00000214_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000213  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002c0 ),
    .Q(\blk00000001/sig000000ec )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000212  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b3 ),
    .Q(\blk00000001/sig000002c0 ),
    .Q15(\NLW_blk00000001/blk00000212_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000211  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002bf ),
    .Q(\blk00000001/sig00000110 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000210  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000173 ),
    .Q(\blk00000001/sig000002bf ),
    .Q15(\NLW_blk00000001/blk00000210_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000020f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002be ),
    .Q(\blk00000001/sig00000112 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000020e  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000017c ),
    .Q(\blk00000001/sig000002be ),
    .Q15(\NLW_blk00000001/blk0000020e_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000020d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002bd ),
    .Q(\blk00000001/sig00000113 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000020c  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000017b ),
    .Q(\blk00000001/sig000002bd ),
    .Q15(\NLW_blk00000001/blk0000020c_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000020b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002bc ),
    .Q(\blk00000001/sig00000111 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk0000020a  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000017d ),
    .Q(\blk00000001/sig000002bc ),
    .Q15(\NLW_blk00000001/blk0000020a_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000209  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002bb ),
    .Q(\blk00000001/sig00000115 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000208  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000179 ),
    .Q(\blk00000001/sig000002bb ),
    .Q15(\NLW_blk00000001/blk00000208_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000207  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ba ),
    .Q(\blk00000001/sig00000116 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000206  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000178 ),
    .Q(\blk00000001/sig000002ba ),
    .Q15(\NLW_blk00000001/blk00000206_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000205  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b9 ),
    .Q(\blk00000001/sig00000114 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000204  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000017a ),
    .Q(\blk00000001/sig000002b9 ),
    .Q15(\NLW_blk00000001/blk00000204_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000203  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b8 ),
    .Q(\blk00000001/sig00000118 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000202  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000176 ),
    .Q(\blk00000001/sig000002b8 ),
    .Q15(\NLW_blk00000001/blk00000202_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000201  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b7 ),
    .Q(\blk00000001/sig00000119 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000200  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000175 ),
    .Q(\blk00000001/sig000002b7 ),
    .Q15(\NLW_blk00000001/blk00000200_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001ff  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b6 ),
    .Q(\blk00000001/sig00000117 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001fe  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000177 ),
    .Q(\blk00000001/sig000002b6 ),
    .Q15(\NLW_blk00000001/blk000001fe_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001fd  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b5 ),
    .Q(\blk00000001/sig0000011a )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001fc  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000174 ),
    .Q(\blk00000001/sig000002b5 ),
    .Q15(\NLW_blk00000001/blk000001fc_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001fb  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b4 ),
    .Q(\blk00000001/sig000000e1 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001fa  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c4 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001d1 ),
    .Q(\blk00000001/sig000002b4 ),
    .Q15(\NLW_blk00000001/blk000001fa_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001f9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b3 ),
    .Q(\blk00000001/sig0000010f )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001f8  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000192 ),
    .Q(\blk00000001/sig000002b3 ),
    .Q15(\NLW_blk00000001/blk000001f8_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001f7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b2 ),
    .Q(s[32])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001f6  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000258 ),
    .Q(\blk00000001/sig000002b2 ),
    .Q15(\NLW_blk00000001/blk000001f6_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001f5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b1 ),
    .Q(\blk00000001/sig000000f8 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001f4  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000001b0 ),
    .Q(\blk00000001/sig000002b1 ),
    .Q15(\NLW_blk00000001/blk000001f4_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001f3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002b0 ),
    .Q(s[34])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001f2  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f0 ),
    .Q(\blk00000001/sig000002b0 ),
    .Q15(\NLW_blk00000001/blk000001f2_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001f1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002af ),
    .Q(s[35])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001f0  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f1 ),
    .Q(\blk00000001/sig000002af ),
    .Q15(\NLW_blk00000001/blk000001f0_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001ef  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ae ),
    .Q(s[33])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001ee  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000ef ),
    .Q(\blk00000001/sig000002ae ),
    .Q15(\NLW_blk00000001/blk000001ee_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001ed  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ad ),
    .Q(s[37])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001ec  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f3 ),
    .Q(\blk00000001/sig000002ad ),
    .Q15(\NLW_blk00000001/blk000001ec_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001eb  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ac ),
    .Q(s[38])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001ea  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f4 ),
    .Q(\blk00000001/sig000002ac ),
    .Q15(\NLW_blk00000001/blk000001ea_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001e9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002ab ),
    .Q(s[36])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001e8  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f2 ),
    .Q(\blk00000001/sig000002ab ),
    .Q15(\NLW_blk00000001/blk000001e8_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001e7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002aa ),
    .Q(s[39])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001e6  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f5 ),
    .Q(\blk00000001/sig000002aa ),
    .Q15(\NLW_blk00000001/blk000001e6_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001e5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a9 ),
    .Q(s[40])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001e4  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f6 ),
    .Q(\blk00000001/sig000002a9 ),
    .Q15(\NLW_blk00000001/blk000001e4_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001e3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a8 ),
    .Q(s[0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001e2  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000150 ),
    .Q(\blk00000001/sig000002a8 ),
    .Q15(\NLW_blk00000001/blk000001e2_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001e1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a7 ),
    .Q(s[1])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001e0  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000013c ),
    .Q(\blk00000001/sig000002a7 ),
    .Q15(\NLW_blk00000001/blk000001e0_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001df  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a6 ),
    .Q(s[41])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001de  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig000000f7 ),
    .Q(\blk00000001/sig000002a6 ),
    .Q15(\NLW_blk00000001/blk000001de_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001dd  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a5 ),
    .Q(s[3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001dc  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000013a ),
    .Q(\blk00000001/sig000002a5 ),
    .Q15(\NLW_blk00000001/blk000001dc_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001db  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a4 ),
    .Q(s[4])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001da  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000139 ),
    .Q(\blk00000001/sig000002a4 ),
    .Q15(\NLW_blk00000001/blk000001da_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001d9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a3 ),
    .Q(s[2])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001d8  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000013b ),
    .Q(\blk00000001/sig000002a3 ),
    .Q15(\NLW_blk00000001/blk000001d8_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001d7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a2 ),
    .Q(s[6])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001d6  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000137 ),
    .Q(\blk00000001/sig000002a2 ),
    .Q15(\NLW_blk00000001/blk000001d6_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001d5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a1 ),
    .Q(s[7])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001d4  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000136 ),
    .Q(\blk00000001/sig000002a1 ),
    .Q15(\NLW_blk00000001/blk000001d4_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001d3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000002a0 ),
    .Q(s[5])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001d2  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000138 ),
    .Q(\blk00000001/sig000002a0 ),
    .Q15(\NLW_blk00000001/blk000001d2_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001d1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000029f ),
    .Q(s[9])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001d0  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000134 ),
    .Q(\blk00000001/sig0000029f ),
    .Q15(\NLW_blk00000001/blk000001d0_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001cf  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000029e ),
    .Q(\blk00000001/sig000000f9 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001ce  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000194 ),
    .Q(\blk00000001/sig0000029e ),
    .Q15(\NLW_blk00000001/blk000001ce_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001cd  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000029d ),
    .Q(s[8])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001cc  (
    .A0(\blk00000001/sig000000c5 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c4 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000135 ),
    .Q(\blk00000001/sig0000029d ),
    .Q15(\NLW_blk00000001/blk000001cc_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001cb  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000029c ),
    .Q(\blk00000001/sig000000fb )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001ca  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000019c ),
    .Q(\blk00000001/sig0000029c ),
    .Q15(\NLW_blk00000001/blk000001ca_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001c9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000029b ),
    .Q(\blk00000001/sig000000fc )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001c8  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000019b ),
    .Q(\blk00000001/sig0000029b ),
    .Q15(\NLW_blk00000001/blk000001c8_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001c7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000029a ),
    .Q(\blk00000001/sig000000fa )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001c6  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000019d ),
    .Q(\blk00000001/sig0000029a ),
    .Q15(\NLW_blk00000001/blk000001c6_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001c5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000299 ),
    .Q(\blk00000001/sig000000fe )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001c4  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000199 ),
    .Q(\blk00000001/sig00000299 ),
    .Q15(\NLW_blk00000001/blk000001c4_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001c3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000298 ),
    .Q(\blk00000001/sig000000ff )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001c2  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000198 ),
    .Q(\blk00000001/sig00000298 ),
    .Q15(\NLW_blk00000001/blk000001c2_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001c1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000297 ),
    .Q(\blk00000001/sig000000fd )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001c0  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig0000019a ),
    .Q(\blk00000001/sig00000297 ),
    .Q15(\NLW_blk00000001/blk000001c0_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001bf  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000296 ),
    .Q(\blk00000001/sig00000101 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001be  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000196 ),
    .Q(\blk00000001/sig00000296 ),
    .Q15(\NLW_blk00000001/blk000001be_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001bd  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000295 ),
    .Q(\blk00000001/sig00000102 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001bc  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000195 ),
    .Q(\blk00000001/sig00000295 ),
    .Q15(\NLW_blk00000001/blk000001bc_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000001bb  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000294 ),
    .Q(\blk00000001/sig00000100 )
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk000001ba  (
    .A0(\blk00000001/sig000000c4 ),
    .A1(\blk00000001/sig000000c5 ),
    .A2(\blk00000001/sig000000c5 ),
    .A3(\blk00000001/sig000000c5 ),
    .CE(ce),
    .CLK(clk),
    .D(\blk00000001/sig00000197 ),
    .Q(\blk00000001/sig00000294 ),
    .Q15(\NLW_blk00000001/blk000001ba_Q15_UNCONNECTED )
  );
  INV   \blk00000001/blk000001b9  (
    .I(\blk00000001/sig000000f8 ),
    .O(\blk00000001/sig00000293 )
  );
  INV   \blk00000001/blk000001b8  (
    .I(\blk00000001/sig000000e1 ),
    .O(\blk00000001/sig00000292 )
  );
  INV   \blk00000001/blk000001b7  (
    .I(\blk00000001/sig0000010f ),
    .O(\blk00000001/sig00000291 )
  );
  INV   \blk00000001/blk000001b6  (
    .I(\blk00000001/sig00000127 ),
    .O(\blk00000001/sig00000290 )
  );
  MUXCY   \blk00000001/blk000001b5  (
    .CI(\blk00000001/sig000000ee ),
    .DI(\blk00000001/sig000000c4 ),
    .S(\blk00000001/sig00000293 ),
    .O(\blk00000001/sig000000c7 )
  );
  MUXCY   \blk00000001/blk000001b4  (
    .CI(\blk00000001/sig000000d6 ),
    .DI(\blk00000001/sig000000c4 ),
    .S(\blk00000001/sig00000292 ),
    .O(\blk00000001/sig000000c6 )
  );
  MUXCY   \blk00000001/blk000001b3  (
    .CI(\blk00000001/sig00000104 ),
    .DI(\blk00000001/sig000000c4 ),
    .S(\blk00000001/sig00000291 ),
    .O(\blk00000001/sig000000c8 )
  );
  MUXCY   \blk00000001/blk000001b2  (
    .CI(\blk00000001/sig0000011c ),
    .DI(\blk00000001/sig000000c4 ),
    .S(\blk00000001/sig00000290 ),
    .O(\blk00000001/sig000000c9 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001b1  (
    .I0(\blk00000001/sig000000f9 ),
    .O(\blk00000001/sig0000028f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001b0  (
    .I0(\blk00000001/sig000000fa ),
    .O(\blk00000001/sig0000028e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001af  (
    .I0(\blk00000001/sig000000fb ),
    .O(\blk00000001/sig0000028d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001ae  (
    .I0(\blk00000001/sig00000102 ),
    .O(\blk00000001/sig0000028c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001ad  (
    .I0(\blk00000001/sig000000fc ),
    .O(\blk00000001/sig0000028b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001ac  (
    .I0(\blk00000001/sig000000fd ),
    .O(\blk00000001/sig0000028a )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001ab  (
    .I0(\blk00000001/sig000000fe ),
    .O(\blk00000001/sig00000289 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001aa  (
    .I0(\blk00000001/sig000000ff ),
    .O(\blk00000001/sig00000288 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a9  (
    .I0(\blk00000001/sig00000100 ),
    .O(\blk00000001/sig00000287 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a8  (
    .I0(\blk00000001/sig00000101 ),
    .O(\blk00000001/sig00000286 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a7  (
    .I0(\blk00000001/sig000000ca ),
    .O(\blk00000001/sig00000285 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a6  (
    .I0(\blk00000001/sig000000cb ),
    .O(\blk00000001/sig00000284 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a5  (
    .I0(\blk00000001/sig000000cc ),
    .O(\blk00000001/sig00000283 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a4  (
    .I0(\blk00000001/sig000000d4 ),
    .O(\blk00000001/sig00000282 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a3  (
    .I0(\blk00000001/sig000000cd ),
    .O(\blk00000001/sig00000281 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a2  (
    .I0(\blk00000001/sig000000ce ),
    .O(\blk00000001/sig00000280 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a1  (
    .I0(\blk00000001/sig000000cf ),
    .O(\blk00000001/sig0000027f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk000001a0  (
    .I0(\blk00000001/sig000000d0 ),
    .O(\blk00000001/sig0000027e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000019f  (
    .I0(\blk00000001/sig000000d1 ),
    .O(\blk00000001/sig0000027d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000019e  (
    .I0(\blk00000001/sig000000d2 ),
    .O(\blk00000001/sig0000027c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000019d  (
    .I0(\blk00000001/sig000000d3 ),
    .O(\blk00000001/sig0000027b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000019c  (
    .I0(\blk00000001/sig000000e2 ),
    .O(\blk00000001/sig0000027a )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000019b  (
    .I0(\blk00000001/sig000000e3 ),
    .O(\blk00000001/sig00000279 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000019a  (
    .I0(\blk00000001/sig000000e4 ),
    .O(\blk00000001/sig00000278 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000199  (
    .I0(\blk00000001/sig000000ec ),
    .O(\blk00000001/sig00000277 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000198  (
    .I0(\blk00000001/sig000000e5 ),
    .O(\blk00000001/sig00000276 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000197  (
    .I0(\blk00000001/sig000000e6 ),
    .O(\blk00000001/sig00000275 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000196  (
    .I0(\blk00000001/sig000000e7 ),
    .O(\blk00000001/sig00000274 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000195  (
    .I0(\blk00000001/sig000000e8 ),
    .O(\blk00000001/sig00000273 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000194  (
    .I0(\blk00000001/sig000000e9 ),
    .O(\blk00000001/sig00000272 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000193  (
    .I0(\blk00000001/sig000000ea ),
    .O(\blk00000001/sig00000271 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000192  (
    .I0(\blk00000001/sig000000eb ),
    .O(\blk00000001/sig00000270 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000191  (
    .I0(\blk00000001/sig00000110 ),
    .O(\blk00000001/sig0000026f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000190  (
    .I0(\blk00000001/sig00000111 ),
    .O(\blk00000001/sig0000026e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000018f  (
    .I0(\blk00000001/sig00000112 ),
    .O(\blk00000001/sig0000026d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000018e  (
    .I0(\blk00000001/sig0000011a ),
    .O(\blk00000001/sig0000026c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000018d  (
    .I0(\blk00000001/sig00000113 ),
    .O(\blk00000001/sig0000026b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000018c  (
    .I0(\blk00000001/sig00000114 ),
    .O(\blk00000001/sig0000026a )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000018b  (
    .I0(\blk00000001/sig00000115 ),
    .O(\blk00000001/sig00000269 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000018a  (
    .I0(\blk00000001/sig00000116 ),
    .O(\blk00000001/sig00000268 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000189  (
    .I0(\blk00000001/sig00000117 ),
    .O(\blk00000001/sig00000267 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000188  (
    .I0(\blk00000001/sig00000118 ),
    .O(\blk00000001/sig00000266 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000187  (
    .I0(\blk00000001/sig00000119 ),
    .O(\blk00000001/sig00000265 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000186  (
    .I0(\blk00000001/sig00000128 ),
    .O(\blk00000001/sig00000264 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000185  (
    .I0(\blk00000001/sig00000129 ),
    .O(\blk00000001/sig00000263 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000184  (
    .I0(\blk00000001/sig0000012a ),
    .O(\blk00000001/sig00000262 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000183  (
    .I0(\blk00000001/sig00000132 ),
    .O(\blk00000001/sig00000261 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000182  (
    .I0(\blk00000001/sig0000012b ),
    .O(\blk00000001/sig00000260 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000181  (
    .I0(\blk00000001/sig0000012c ),
    .O(\blk00000001/sig0000025f )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk00000180  (
    .I0(\blk00000001/sig0000012d ),
    .O(\blk00000001/sig0000025e )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000017f  (
    .I0(\blk00000001/sig0000012e ),
    .O(\blk00000001/sig0000025d )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000017e  (
    .I0(\blk00000001/sig0000012f ),
    .O(\blk00000001/sig0000025c )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000017d  (
    .I0(\blk00000001/sig00000130 ),
    .O(\blk00000001/sig0000025b )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000001/blk0000017c  (
    .I0(\blk00000001/sig00000131 ),
    .O(\blk00000001/sig0000025a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000017b  (
    .I0(a[63]),
    .I1(b[63]),
    .O(\blk00000001/sig000001e7 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000017a  (
    .I0(a[62]),
    .I1(b[62]),
    .O(\blk00000001/sig000001de )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000179  (
    .I0(a[61]),
    .I1(b[61]),
    .O(\blk00000001/sig000001df )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000178  (
    .I0(a[60]),
    .I1(b[60]),
    .O(\blk00000001/sig000001e0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000177  (
    .I0(a[59]),
    .I1(b[59]),
    .O(\blk00000001/sig000001e1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000176  (
    .I0(a[58]),
    .I1(b[58]),
    .O(\blk00000001/sig000001e2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000175  (
    .I0(a[57]),
    .I1(b[57]),
    .O(\blk00000001/sig000001e3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000174  (
    .I0(a[56]),
    .I1(b[56]),
    .O(\blk00000001/sig000001e4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000173  (
    .I0(a[55]),
    .I1(b[55]),
    .O(\blk00000001/sig000001e5 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000172  (
    .I0(a[54]),
    .I1(b[54]),
    .O(\blk00000001/sig000001e6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000171  (
    .I0(a[53]),
    .I1(b[53]),
    .O(\blk00000001/sig000001e8 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000170  (
    .I0(a[52]),
    .I1(b[52]),
    .O(\blk00000001/sig000001c6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000016f  (
    .I0(a[51]),
    .I1(b[51]),
    .O(\blk00000001/sig000001bd )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000016e  (
    .I0(a[50]),
    .I1(b[50]),
    .O(\blk00000001/sig000001be )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000016d  (
    .I0(a[49]),
    .I1(b[49]),
    .O(\blk00000001/sig000001bf )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000016c  (
    .I0(a[48]),
    .I1(b[48]),
    .O(\blk00000001/sig000001c0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000016b  (
    .I0(a[47]),
    .I1(b[47]),
    .O(\blk00000001/sig000001c1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000016a  (
    .I0(a[46]),
    .I1(b[46]),
    .O(\blk00000001/sig000001c2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000169  (
    .I0(a[45]),
    .I1(b[45]),
    .O(\blk00000001/sig000001c3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000168  (
    .I0(a[44]),
    .I1(b[44]),
    .O(\blk00000001/sig000001c4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000167  (
    .I0(a[43]),
    .I1(b[43]),
    .O(\blk00000001/sig000001c5 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000166  (
    .I0(a[42]),
    .I1(b[42]),
    .O(\blk00000001/sig000001c7 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000165  (
    .I0(a[41]),
    .I1(b[41]),
    .O(\blk00000001/sig000001a6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000164  (
    .I0(a[40]),
    .I1(b[40]),
    .O(\blk00000001/sig0000019e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000163  (
    .I0(a[39]),
    .I1(b[39]),
    .O(\blk00000001/sig0000019f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000162  (
    .I0(a[38]),
    .I1(b[38]),
    .O(\blk00000001/sig000001a0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000161  (
    .I0(a[37]),
    .I1(b[37]),
    .O(\blk00000001/sig000001a1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000160  (
    .I0(a[36]),
    .I1(b[36]),
    .O(\blk00000001/sig000001a2 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000015f  (
    .I0(a[35]),
    .I1(b[35]),
    .O(\blk00000001/sig000001a3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000015e  (
    .I0(a[34]),
    .I1(b[34]),
    .O(\blk00000001/sig000001a4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000015d  (
    .I0(a[33]),
    .I1(b[33]),
    .O(\blk00000001/sig000001a5 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000015c  (
    .I0(a[32]),
    .I1(b[32]),
    .O(\blk00000001/sig000001a7 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000015b  (
    .I0(a[31]),
    .I1(b[31]),
    .O(\blk00000001/sig00000187 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000015a  (
    .I0(a[30]),
    .I1(b[30]),
    .O(\blk00000001/sig0000017e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000159  (
    .I0(a[29]),
    .I1(b[29]),
    .O(\blk00000001/sig0000017f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000158  (
    .I0(a[28]),
    .I1(b[28]),
    .O(\blk00000001/sig00000180 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000157  (
    .I0(a[27]),
    .I1(b[27]),
    .O(\blk00000001/sig00000181 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000156  (
    .I0(a[26]),
    .I1(b[26]),
    .O(\blk00000001/sig00000182 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000155  (
    .I0(a[25]),
    .I1(b[25]),
    .O(\blk00000001/sig00000183 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000154  (
    .I0(a[24]),
    .I1(b[24]),
    .O(\blk00000001/sig00000184 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000153  (
    .I0(a[23]),
    .I1(b[23]),
    .O(\blk00000001/sig00000185 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000152  (
    .I0(a[22]),
    .I1(b[22]),
    .O(\blk00000001/sig00000186 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000151  (
    .I0(a[21]),
    .I1(b[21]),
    .O(\blk00000001/sig00000188 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000150  (
    .I0(a[20]),
    .I1(b[20]),
    .O(\blk00000001/sig00000166 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000014f  (
    .I0(a[19]),
    .I1(b[19]),
    .O(\blk00000001/sig0000015d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000014e  (
    .I0(a[18]),
    .I1(b[18]),
    .O(\blk00000001/sig0000015e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000014d  (
    .I0(a[17]),
    .I1(b[17]),
    .O(\blk00000001/sig0000015f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000014c  (
    .I0(a[16]),
    .I1(b[16]),
    .O(\blk00000001/sig00000160 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000014b  (
    .I0(a[15]),
    .I1(b[15]),
    .O(\blk00000001/sig00000161 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000014a  (
    .I0(a[14]),
    .I1(b[14]),
    .O(\blk00000001/sig00000162 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000149  (
    .I0(a[13]),
    .I1(b[13]),
    .O(\blk00000001/sig00000163 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000148  (
    .I0(a[12]),
    .I1(b[12]),
    .O(\blk00000001/sig00000164 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000147  (
    .I0(a[11]),
    .I1(b[11]),
    .O(\blk00000001/sig00000165 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000146  (
    .I0(a[10]),
    .I1(b[10]),
    .O(\blk00000001/sig00000167 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000145  (
    .I0(a[9]),
    .I1(b[9]),
    .O(\blk00000001/sig00000145 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000144  (
    .I0(a[8]),
    .I1(b[8]),
    .O(\blk00000001/sig0000013d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000143  (
    .I0(a[7]),
    .I1(b[7]),
    .O(\blk00000001/sig0000013e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000142  (
    .I0(a[6]),
    .I1(b[6]),
    .O(\blk00000001/sig0000013f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000141  (
    .I0(a[5]),
    .I1(b[5]),
    .O(\blk00000001/sig00000140 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000140  (
    .I0(a[4]),
    .I1(b[4]),
    .O(\blk00000001/sig00000141 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000013f  (
    .I0(a[3]),
    .I1(b[3]),
    .O(\blk00000001/sig00000142 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000013e  (
    .I0(a[2]),
    .I1(b[2]),
    .O(\blk00000001/sig00000143 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000013d  (
    .I0(a[1]),
    .I1(b[1]),
    .O(\blk00000001/sig00000144 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000013c  (
    .I0(a[0]),
    .I1(b[0]),
    .O(\blk00000001/sig00000146 )
  );
  MUXCY   \blk00000001/blk0000013b  (
    .CI(\blk00000001/sig00000103 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000028f ),
    .O(\blk00000001/sig00000259 )
  );
  XORCY   \blk00000001/blk0000013a  (
    .CI(\blk00000001/sig00000103 ),
    .LI(\blk00000001/sig0000028f ),
    .O(\blk00000001/sig00000258 )
  );
  MUXCY   \blk00000001/blk00000139  (
    .CI(\blk00000001/sig00000259 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000028e ),
    .O(\blk00000001/sig00000257 )
  );
  XORCY   \blk00000001/blk00000138  (
    .CI(\blk00000001/sig00000259 ),
    .LI(\blk00000001/sig0000028e ),
    .O(\blk00000001/sig00000256 )
  );
  MUXCY   \blk00000001/blk00000137  (
    .CI(\blk00000001/sig00000257 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000028d ),
    .O(\blk00000001/sig00000255 )
  );
  XORCY   \blk00000001/blk00000136  (
    .CI(\blk00000001/sig00000257 ),
    .LI(\blk00000001/sig0000028d ),
    .O(\blk00000001/sig00000254 )
  );
  XORCY   \blk00000001/blk00000135  (
    .CI(\blk00000001/sig00000248 ),
    .LI(\blk00000001/sig0000028c ),
    .O(\blk00000001/sig00000253 )
  );
  MUXCY   \blk00000001/blk00000134  (
    .CI(\blk00000001/sig00000248 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000028c ),
    .O(\blk00000001/sig000000ee )
  );
  MUXCY   \blk00000001/blk00000133  (
    .CI(\blk00000001/sig00000255 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000028b ),
    .O(\blk00000001/sig00000252 )
  );
  XORCY   \blk00000001/blk00000132  (
    .CI(\blk00000001/sig00000255 ),
    .LI(\blk00000001/sig0000028b ),
    .O(\blk00000001/sig00000251 )
  );
  MUXCY   \blk00000001/blk00000131  (
    .CI(\blk00000001/sig00000252 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000028a ),
    .O(\blk00000001/sig00000250 )
  );
  XORCY   \blk00000001/blk00000130  (
    .CI(\blk00000001/sig00000252 ),
    .LI(\blk00000001/sig0000028a ),
    .O(\blk00000001/sig0000024f )
  );
  MUXCY   \blk00000001/blk0000012f  (
    .CI(\blk00000001/sig00000250 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000289 ),
    .O(\blk00000001/sig0000024e )
  );
  XORCY   \blk00000001/blk0000012e  (
    .CI(\blk00000001/sig00000250 ),
    .LI(\blk00000001/sig00000289 ),
    .O(\blk00000001/sig0000024d )
  );
  MUXCY   \blk00000001/blk0000012d  (
    .CI(\blk00000001/sig0000024e ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000288 ),
    .O(\blk00000001/sig0000024c )
  );
  XORCY   \blk00000001/blk0000012c  (
    .CI(\blk00000001/sig0000024e ),
    .LI(\blk00000001/sig00000288 ),
    .O(\blk00000001/sig0000024b )
  );
  MUXCY   \blk00000001/blk0000012b  (
    .CI(\blk00000001/sig0000024c ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000287 ),
    .O(\blk00000001/sig0000024a )
  );
  XORCY   \blk00000001/blk0000012a  (
    .CI(\blk00000001/sig0000024c ),
    .LI(\blk00000001/sig00000287 ),
    .O(\blk00000001/sig00000249 )
  );
  MUXCY   \blk00000001/blk00000129  (
    .CI(\blk00000001/sig0000024a ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000286 ),
    .O(\blk00000001/sig00000248 )
  );
  XORCY   \blk00000001/blk00000128  (
    .CI(\blk00000001/sig0000024a ),
    .LI(\blk00000001/sig00000286 ),
    .O(\blk00000001/sig00000247 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000127  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000253 ),
    .Q(\blk00000001/sig000000f7 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000126  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000247 ),
    .Q(\blk00000001/sig000000f6 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000125  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000249 ),
    .Q(\blk00000001/sig000000f5 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000124  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000024b ),
    .Q(\blk00000001/sig000000f4 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000123  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000024d ),
    .Q(\blk00000001/sig000000f3 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000122  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000024f ),
    .Q(\blk00000001/sig000000f2 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000121  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000251 ),
    .Q(\blk00000001/sig000000f1 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000120  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000254 ),
    .Q(\blk00000001/sig000000f0 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000011f  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000256 ),
    .Q(\blk00000001/sig000000ef )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000011e  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000d7 ),
    .Q(s[43])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000011d  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000d8 ),
    .Q(s[44])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000011c  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000d9 ),
    .Q(s[45])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000011b  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000da ),
    .Q(s[46])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000011a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000db ),
    .Q(s[47])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000119  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000dc ),
    .Q(s[48])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000118  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000dd ),
    .Q(s[49])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000117  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000de ),
    .Q(s[50])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000116  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000df ),
    .Q(s[51])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000115  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000e0 ),
    .Q(s[52])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000114  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c6 ),
    .Q(\blk00000001/sig000000d5 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000113  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c7 ),
    .Q(\blk00000001/sig000000ed )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000112  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c8 ),
    .Q(\blk00000001/sig00000103 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000111  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000000c9 ),
    .Q(\blk00000001/sig0000011b )
  );
  MUXCY   \blk00000001/blk00000110  (
    .CI(\blk00000001/sig000000d5 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000285 ),
    .O(\blk00000001/sig00000246 )
  );
  XORCY   \blk00000001/blk0000010f  (
    .CI(\blk00000001/sig000000d5 ),
    .LI(\blk00000001/sig00000285 ),
    .O(\blk00000001/sig00000245 )
  );
  MUXCY   \blk00000001/blk0000010e  (
    .CI(\blk00000001/sig00000246 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000284 ),
    .O(\blk00000001/sig00000244 )
  );
  XORCY   \blk00000001/blk0000010d  (
    .CI(\blk00000001/sig00000246 ),
    .LI(\blk00000001/sig00000284 ),
    .O(\blk00000001/sig00000243 )
  );
  MUXCY   \blk00000001/blk0000010c  (
    .CI(\blk00000001/sig00000244 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000283 ),
    .O(\blk00000001/sig00000242 )
  );
  XORCY   \blk00000001/blk0000010b  (
    .CI(\blk00000001/sig00000244 ),
    .LI(\blk00000001/sig00000283 ),
    .O(\blk00000001/sig00000241 )
  );
  XORCY   \blk00000001/blk0000010a  (
    .CI(\blk00000001/sig00000233 ),
    .LI(\blk00000001/sig00000282 ),
    .O(\blk00000001/sig00000240 )
  );
  MUXCY   \blk00000001/blk00000109  (
    .CI(\blk00000001/sig00000233 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000282 ),
    .O(\NLW_blk00000001/blk00000109_O_UNCONNECTED )
  );
  MUXCY   \blk00000001/blk00000108  (
    .CI(\blk00000001/sig00000242 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000281 ),
    .O(\blk00000001/sig0000023f )
  );
  XORCY   \blk00000001/blk00000107  (
    .CI(\blk00000001/sig00000242 ),
    .LI(\blk00000001/sig00000281 ),
    .O(\blk00000001/sig0000023e )
  );
  MUXCY   \blk00000001/blk00000106  (
    .CI(\blk00000001/sig0000023f ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000280 ),
    .O(\blk00000001/sig0000023d )
  );
  XORCY   \blk00000001/blk00000105  (
    .CI(\blk00000001/sig0000023f ),
    .LI(\blk00000001/sig00000280 ),
    .O(\blk00000001/sig0000023c )
  );
  MUXCY   \blk00000001/blk00000104  (
    .CI(\blk00000001/sig0000023d ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000027f ),
    .O(\blk00000001/sig0000023b )
  );
  XORCY   \blk00000001/blk00000103  (
    .CI(\blk00000001/sig0000023d ),
    .LI(\blk00000001/sig0000027f ),
    .O(\blk00000001/sig0000023a )
  );
  MUXCY   \blk00000001/blk00000102  (
    .CI(\blk00000001/sig0000023b ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000027e ),
    .O(\blk00000001/sig00000239 )
  );
  XORCY   \blk00000001/blk00000101  (
    .CI(\blk00000001/sig0000023b ),
    .LI(\blk00000001/sig0000027e ),
    .O(\blk00000001/sig00000238 )
  );
  MUXCY   \blk00000001/blk00000100  (
    .CI(\blk00000001/sig00000239 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000027d ),
    .O(\blk00000001/sig00000237 )
  );
  XORCY   \blk00000001/blk000000ff  (
    .CI(\blk00000001/sig00000239 ),
    .LI(\blk00000001/sig0000027d ),
    .O(\blk00000001/sig00000236 )
  );
  MUXCY   \blk00000001/blk000000fe  (
    .CI(\blk00000001/sig00000237 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000027c ),
    .O(\blk00000001/sig00000235 )
  );
  XORCY   \blk00000001/blk000000fd  (
    .CI(\blk00000001/sig00000237 ),
    .LI(\blk00000001/sig0000027c ),
    .O(\blk00000001/sig00000234 )
  );
  MUXCY   \blk00000001/blk000000fc  (
    .CI(\blk00000001/sig00000235 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000027b ),
    .O(\blk00000001/sig00000233 )
  );
  XORCY   \blk00000001/blk000000fb  (
    .CI(\blk00000001/sig00000235 ),
    .LI(\blk00000001/sig0000027b ),
    .O(\blk00000001/sig00000232 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000fa  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000240 ),
    .Q(s[63])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000232 ),
    .Q(s[62])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f8  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000234 ),
    .Q(s[61])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000236 ),
    .Q(s[60])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f6  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000238 ),
    .Q(s[59])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000023a ),
    .Q(s[58])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f4  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000023c ),
    .Q(s[57])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000023e ),
    .Q(s[56])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f2  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000241 ),
    .Q(s[55])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000243 ),
    .Q(s[54])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000f0  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000245 ),
    .Q(s[53])
  );
  MUXCY   \blk00000001/blk000000ef  (
    .CI(\blk00000001/sig000000ed ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000027a ),
    .O(\blk00000001/sig00000231 )
  );
  XORCY   \blk00000001/blk000000ee  (
    .CI(\blk00000001/sig000000ed ),
    .LI(\blk00000001/sig0000027a ),
    .O(\blk00000001/sig00000230 )
  );
  MUXCY   \blk00000001/blk000000ed  (
    .CI(\blk00000001/sig00000231 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000279 ),
    .O(\blk00000001/sig0000022f )
  );
  XORCY   \blk00000001/blk000000ec  (
    .CI(\blk00000001/sig00000231 ),
    .LI(\blk00000001/sig00000279 ),
    .O(\blk00000001/sig0000022e )
  );
  MUXCY   \blk00000001/blk000000eb  (
    .CI(\blk00000001/sig0000022f ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000278 ),
    .O(\blk00000001/sig0000022d )
  );
  XORCY   \blk00000001/blk000000ea  (
    .CI(\blk00000001/sig0000022f ),
    .LI(\blk00000001/sig00000278 ),
    .O(\blk00000001/sig0000022c )
  );
  XORCY   \blk00000001/blk000000e9  (
    .CI(\blk00000001/sig0000021e ),
    .LI(\blk00000001/sig00000277 ),
    .O(\blk00000001/sig0000022b )
  );
  MUXCY   \blk00000001/blk000000e8  (
    .CI(\blk00000001/sig0000021e ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000277 ),
    .O(\blk00000001/sig000000d6 )
  );
  MUXCY   \blk00000001/blk000000e7  (
    .CI(\blk00000001/sig0000022d ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000276 ),
    .O(\blk00000001/sig0000022a )
  );
  XORCY   \blk00000001/blk000000e6  (
    .CI(\blk00000001/sig0000022d ),
    .LI(\blk00000001/sig00000276 ),
    .O(\blk00000001/sig00000229 )
  );
  MUXCY   \blk00000001/blk000000e5  (
    .CI(\blk00000001/sig0000022a ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000275 ),
    .O(\blk00000001/sig00000228 )
  );
  XORCY   \blk00000001/blk000000e4  (
    .CI(\blk00000001/sig0000022a ),
    .LI(\blk00000001/sig00000275 ),
    .O(\blk00000001/sig00000227 )
  );
  MUXCY   \blk00000001/blk000000e3  (
    .CI(\blk00000001/sig00000228 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000274 ),
    .O(\blk00000001/sig00000226 )
  );
  XORCY   \blk00000001/blk000000e2  (
    .CI(\blk00000001/sig00000228 ),
    .LI(\blk00000001/sig00000274 ),
    .O(\blk00000001/sig00000225 )
  );
  MUXCY   \blk00000001/blk000000e1  (
    .CI(\blk00000001/sig00000226 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000273 ),
    .O(\blk00000001/sig00000224 )
  );
  XORCY   \blk00000001/blk000000e0  (
    .CI(\blk00000001/sig00000226 ),
    .LI(\blk00000001/sig00000273 ),
    .O(\blk00000001/sig00000223 )
  );
  MUXCY   \blk00000001/blk000000df  (
    .CI(\blk00000001/sig00000224 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000272 ),
    .O(\blk00000001/sig00000222 )
  );
  XORCY   \blk00000001/blk000000de  (
    .CI(\blk00000001/sig00000224 ),
    .LI(\blk00000001/sig00000272 ),
    .O(\blk00000001/sig00000221 )
  );
  MUXCY   \blk00000001/blk000000dd  (
    .CI(\blk00000001/sig00000222 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000271 ),
    .O(\blk00000001/sig00000220 )
  );
  XORCY   \blk00000001/blk000000dc  (
    .CI(\blk00000001/sig00000222 ),
    .LI(\blk00000001/sig00000271 ),
    .O(\blk00000001/sig0000021f )
  );
  MUXCY   \blk00000001/blk000000db  (
    .CI(\blk00000001/sig00000220 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000270 ),
    .O(\blk00000001/sig0000021e )
  );
  XORCY   \blk00000001/blk000000da  (
    .CI(\blk00000001/sig00000220 ),
    .LI(\blk00000001/sig00000270 ),
    .O(\blk00000001/sig0000021d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000022b ),
    .Q(\blk00000001/sig000000e0 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d8  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000021d ),
    .Q(\blk00000001/sig000000df )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000021f ),
    .Q(\blk00000001/sig000000de )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d6  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000221 ),
    .Q(\blk00000001/sig000000dd )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000223 ),
    .Q(\blk00000001/sig000000dc )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d4  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000225 ),
    .Q(\blk00000001/sig000000db )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000227 ),
    .Q(\blk00000001/sig000000da )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d2  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000229 ),
    .Q(\blk00000001/sig000000d9 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000022c ),
    .Q(\blk00000001/sig000000d8 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000d0  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000022e ),
    .Q(\blk00000001/sig000000d7 )
  );
  MUXCY   \blk00000001/blk000000cf  (
    .CI(\blk00000001/sig0000011b ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000026f ),
    .O(\blk00000001/sig0000021c )
  );
  XORCY   \blk00000001/blk000000ce  (
    .CI(\blk00000001/sig0000011b ),
    .LI(\blk00000001/sig0000026f ),
    .O(\blk00000001/sig0000021b )
  );
  MUXCY   \blk00000001/blk000000cd  (
    .CI(\blk00000001/sig0000021c ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000026e ),
    .O(\blk00000001/sig0000021a )
  );
  XORCY   \blk00000001/blk000000cc  (
    .CI(\blk00000001/sig0000021c ),
    .LI(\blk00000001/sig0000026e ),
    .O(\blk00000001/sig00000219 )
  );
  MUXCY   \blk00000001/blk000000cb  (
    .CI(\blk00000001/sig0000021a ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000026d ),
    .O(\blk00000001/sig00000218 )
  );
  XORCY   \blk00000001/blk000000ca  (
    .CI(\blk00000001/sig0000021a ),
    .LI(\blk00000001/sig0000026d ),
    .O(\blk00000001/sig00000217 )
  );
  XORCY   \blk00000001/blk000000c9  (
    .CI(\blk00000001/sig00000209 ),
    .LI(\blk00000001/sig0000026c ),
    .O(\blk00000001/sig00000216 )
  );
  MUXCY   \blk00000001/blk000000c8  (
    .CI(\blk00000001/sig00000209 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000026c ),
    .O(\blk00000001/sig00000104 )
  );
  MUXCY   \blk00000001/blk000000c7  (
    .CI(\blk00000001/sig00000218 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000026b ),
    .O(\blk00000001/sig00000215 )
  );
  XORCY   \blk00000001/blk000000c6  (
    .CI(\blk00000001/sig00000218 ),
    .LI(\blk00000001/sig0000026b ),
    .O(\blk00000001/sig00000214 )
  );
  MUXCY   \blk00000001/blk000000c5  (
    .CI(\blk00000001/sig00000215 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000026a ),
    .O(\blk00000001/sig00000213 )
  );
  XORCY   \blk00000001/blk000000c4  (
    .CI(\blk00000001/sig00000215 ),
    .LI(\blk00000001/sig0000026a ),
    .O(\blk00000001/sig00000212 )
  );
  MUXCY   \blk00000001/blk000000c3  (
    .CI(\blk00000001/sig00000213 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000269 ),
    .O(\blk00000001/sig00000211 )
  );
  XORCY   \blk00000001/blk000000c2  (
    .CI(\blk00000001/sig00000213 ),
    .LI(\blk00000001/sig00000269 ),
    .O(\blk00000001/sig00000210 )
  );
  MUXCY   \blk00000001/blk000000c1  (
    .CI(\blk00000001/sig00000211 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000268 ),
    .O(\blk00000001/sig0000020f )
  );
  XORCY   \blk00000001/blk000000c0  (
    .CI(\blk00000001/sig00000211 ),
    .LI(\blk00000001/sig00000268 ),
    .O(\blk00000001/sig0000020e )
  );
  MUXCY   \blk00000001/blk000000bf  (
    .CI(\blk00000001/sig0000020f ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000267 ),
    .O(\blk00000001/sig0000020d )
  );
  XORCY   \blk00000001/blk000000be  (
    .CI(\blk00000001/sig0000020f ),
    .LI(\blk00000001/sig00000267 ),
    .O(\blk00000001/sig0000020c )
  );
  MUXCY   \blk00000001/blk000000bd  (
    .CI(\blk00000001/sig0000020d ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000266 ),
    .O(\blk00000001/sig0000020b )
  );
  XORCY   \blk00000001/blk000000bc  (
    .CI(\blk00000001/sig0000020d ),
    .LI(\blk00000001/sig00000266 ),
    .O(\blk00000001/sig0000020a )
  );
  MUXCY   \blk00000001/blk000000bb  (
    .CI(\blk00000001/sig0000020b ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000265 ),
    .O(\blk00000001/sig00000209 )
  );
  XORCY   \blk00000001/blk000000ba  (
    .CI(\blk00000001/sig0000020b ),
    .LI(\blk00000001/sig00000265 ),
    .O(\blk00000001/sig00000208 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b9  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000216 ),
    .Q(\blk00000001/sig0000010e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b8  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000208 ),
    .Q(\blk00000001/sig0000010d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b7  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000020a ),
    .Q(\blk00000001/sig0000010c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b6  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000020c ),
    .Q(\blk00000001/sig0000010b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b5  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000020e ),
    .Q(\blk00000001/sig0000010a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b4  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000210 ),
    .Q(\blk00000001/sig00000109 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b3  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000212 ),
    .Q(\blk00000001/sig00000108 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b2  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000214 ),
    .Q(\blk00000001/sig00000107 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b1  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000217 ),
    .Q(\blk00000001/sig00000106 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk000000b0  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000219 ),
    .Q(\blk00000001/sig00000105 )
  );
  MUXCY   \blk00000001/blk000000af  (
    .CI(\blk00000001/sig00000133 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000264 ),
    .O(\blk00000001/sig00000207 )
  );
  XORCY   \blk00000001/blk000000ae  (
    .CI(\blk00000001/sig00000133 ),
    .LI(\blk00000001/sig00000264 ),
    .O(\blk00000001/sig00000206 )
  );
  MUXCY   \blk00000001/blk000000ad  (
    .CI(\blk00000001/sig00000207 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000263 ),
    .O(\blk00000001/sig00000205 )
  );
  XORCY   \blk00000001/blk000000ac  (
    .CI(\blk00000001/sig00000207 ),
    .LI(\blk00000001/sig00000263 ),
    .O(\blk00000001/sig00000204 )
  );
  MUXCY   \blk00000001/blk000000ab  (
    .CI(\blk00000001/sig00000205 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000262 ),
    .O(\blk00000001/sig00000203 )
  );
  XORCY   \blk00000001/blk000000aa  (
    .CI(\blk00000001/sig00000205 ),
    .LI(\blk00000001/sig00000262 ),
    .O(\blk00000001/sig00000202 )
  );
  XORCY   \blk00000001/blk000000a9  (
    .CI(\blk00000001/sig000001f4 ),
    .LI(\blk00000001/sig00000261 ),
    .O(\blk00000001/sig00000201 )
  );
  MUXCY   \blk00000001/blk000000a8  (
    .CI(\blk00000001/sig000001f4 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000261 ),
    .O(\blk00000001/sig0000011c )
  );
  MUXCY   \blk00000001/blk000000a7  (
    .CI(\blk00000001/sig00000203 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig00000260 ),
    .O(\blk00000001/sig00000200 )
  );
  XORCY   \blk00000001/blk000000a6  (
    .CI(\blk00000001/sig00000203 ),
    .LI(\blk00000001/sig00000260 ),
    .O(\blk00000001/sig000001ff )
  );
  MUXCY   \blk00000001/blk000000a5  (
    .CI(\blk00000001/sig00000200 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000025f ),
    .O(\blk00000001/sig000001fe )
  );
  XORCY   \blk00000001/blk000000a4  (
    .CI(\blk00000001/sig00000200 ),
    .LI(\blk00000001/sig0000025f ),
    .O(\blk00000001/sig000001fd )
  );
  MUXCY   \blk00000001/blk000000a3  (
    .CI(\blk00000001/sig000001fe ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000025e ),
    .O(\blk00000001/sig000001fc )
  );
  XORCY   \blk00000001/blk000000a2  (
    .CI(\blk00000001/sig000001fe ),
    .LI(\blk00000001/sig0000025e ),
    .O(\blk00000001/sig000001fb )
  );
  MUXCY   \blk00000001/blk000000a1  (
    .CI(\blk00000001/sig000001fc ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000025d ),
    .O(\blk00000001/sig000001fa )
  );
  XORCY   \blk00000001/blk000000a0  (
    .CI(\blk00000001/sig000001fc ),
    .LI(\blk00000001/sig0000025d ),
    .O(\blk00000001/sig000001f9 )
  );
  MUXCY   \blk00000001/blk0000009f  (
    .CI(\blk00000001/sig000001fa ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000025c ),
    .O(\blk00000001/sig000001f8 )
  );
  XORCY   \blk00000001/blk0000009e  (
    .CI(\blk00000001/sig000001fa ),
    .LI(\blk00000001/sig0000025c ),
    .O(\blk00000001/sig000001f7 )
  );
  MUXCY   \blk00000001/blk0000009d  (
    .CI(\blk00000001/sig000001f8 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000025b ),
    .O(\blk00000001/sig000001f6 )
  );
  XORCY   \blk00000001/blk0000009c  (
    .CI(\blk00000001/sig000001f8 ),
    .LI(\blk00000001/sig0000025b ),
    .O(\blk00000001/sig000001f5 )
  );
  MUXCY   \blk00000001/blk0000009b  (
    .CI(\blk00000001/sig000001f6 ),
    .DI(\blk00000001/sig000000c5 ),
    .S(\blk00000001/sig0000025a ),
    .O(\blk00000001/sig000001f4 )
  );
  XORCY   \blk00000001/blk0000009a  (
    .CI(\blk00000001/sig000001f6 ),
    .LI(\blk00000001/sig0000025a ),
    .O(\blk00000001/sig000001f3 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000099  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000201 ),
    .Q(\blk00000001/sig00000126 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000098  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000001f3 ),
    .Q(\blk00000001/sig00000125 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000097  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000001f5 ),
    .Q(\blk00000001/sig00000124 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000096  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000001f7 ),
    .Q(\blk00000001/sig00000123 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000095  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000001f9 ),
    .Q(\blk00000001/sig00000122 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000094  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000001fb ),
    .Q(\blk00000001/sig00000121 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000093  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000001fd ),
    .Q(\blk00000001/sig00000120 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000092  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig000001ff ),
    .Q(\blk00000001/sig0000011f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000091  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000202 ),
    .Q(\blk00000001/sig0000011e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000090  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000204 ),
    .Q(\blk00000001/sig0000011d )
  );
  MUXCY   \blk00000001/blk0000008f  (
    .CI(\blk00000001/sig000000c5 ),
    .DI(a[53]),
    .S(\blk00000001/sig000001e8 ),
    .O(\blk00000001/sig000001f2 )
  );
  MUXCY   \blk00000001/blk0000008e  (
    .CI(\blk00000001/sig000001f2 ),
    .DI(a[54]),
    .S(\blk00000001/sig000001e6 ),
    .O(\blk00000001/sig000001f1 )
  );
  MUXCY   \blk00000001/blk0000008d  (
    .CI(\blk00000001/sig000001f1 ),
    .DI(a[55]),
    .S(\blk00000001/sig000001e5 ),
    .O(\blk00000001/sig000001f0 )
  );
  MUXCY   \blk00000001/blk0000008c  (
    .CI(\blk00000001/sig000001f0 ),
    .DI(a[56]),
    .S(\blk00000001/sig000001e4 ),
    .O(\blk00000001/sig000001ef )
  );
  MUXCY   \blk00000001/blk0000008b  (
    .CI(\blk00000001/sig000001ef ),
    .DI(a[57]),
    .S(\blk00000001/sig000001e3 ),
    .O(\blk00000001/sig000001ee )
  );
  MUXCY   \blk00000001/blk0000008a  (
    .CI(\blk00000001/sig000001ee ),
    .DI(a[58]),
    .S(\blk00000001/sig000001e2 ),
    .O(\blk00000001/sig000001ed )
  );
  MUXCY   \blk00000001/blk00000089  (
    .CI(\blk00000001/sig000001ed ),
    .DI(a[59]),
    .S(\blk00000001/sig000001e1 ),
    .O(\blk00000001/sig000001ec )
  );
  MUXCY   \blk00000001/blk00000088  (
    .CI(\blk00000001/sig000001ec ),
    .DI(a[60]),
    .S(\blk00000001/sig000001e0 ),
    .O(\blk00000001/sig000001eb )
  );
  MUXCY   \blk00000001/blk00000087  (
    .CI(\blk00000001/sig000001eb ),
    .DI(a[61]),
    .S(\blk00000001/sig000001df ),
    .O(\blk00000001/sig000001ea )
  );
  MUXCY   \blk00000001/blk00000086  (
    .CI(\blk00000001/sig000001ea ),
    .DI(a[62]),
    .S(\blk00000001/sig000001de ),
    .O(\blk00000001/sig000001e9 )
  );
  XORCY   \blk00000001/blk00000085  (
    .CI(\blk00000001/sig000001f2 ),
    .LI(\blk00000001/sig000001e6 ),
    .O(\blk00000001/sig000001dd )
  );
  XORCY   \blk00000001/blk00000084  (
    .CI(\blk00000001/sig000001f1 ),
    .LI(\blk00000001/sig000001e5 ),
    .O(\blk00000001/sig000001dc )
  );
  XORCY   \blk00000001/blk00000083  (
    .CI(\blk00000001/sig000001f0 ),
    .LI(\blk00000001/sig000001e4 ),
    .O(\blk00000001/sig000001db )
  );
  XORCY   \blk00000001/blk00000082  (
    .CI(\blk00000001/sig000001ef ),
    .LI(\blk00000001/sig000001e3 ),
    .O(\blk00000001/sig000001da )
  );
  XORCY   \blk00000001/blk00000081  (
    .CI(\blk00000001/sig000001ee ),
    .LI(\blk00000001/sig000001e2 ),
    .O(\blk00000001/sig000001d9 )
  );
  XORCY   \blk00000001/blk00000080  (
    .CI(\blk00000001/sig000001ed ),
    .LI(\blk00000001/sig000001e1 ),
    .O(\blk00000001/sig000001d8 )
  );
  XORCY   \blk00000001/blk0000007f  (
    .CI(\blk00000001/sig000001ec ),
    .LI(\blk00000001/sig000001e0 ),
    .O(\blk00000001/sig000001d7 )
  );
  XORCY   \blk00000001/blk0000007e  (
    .CI(\blk00000001/sig000001eb ),
    .LI(\blk00000001/sig000001df ),
    .O(\blk00000001/sig000001d6 )
  );
  XORCY   \blk00000001/blk0000007d  (
    .CI(\blk00000001/sig000001ea ),
    .LI(\blk00000001/sig000001de ),
    .O(\blk00000001/sig000001d5 )
  );
  XORCY   \blk00000001/blk0000007c  (
    .CI(\blk00000001/sig000001e9 ),
    .LI(\blk00000001/sig000001e7 ),
    .O(\blk00000001/sig000001d4 )
  );
  XORCY   \blk00000001/blk0000007b  (
    .CI(\blk00000001/sig000000c5 ),
    .LI(\blk00000001/sig000001e8 ),
    .O(\blk00000001/sig000001d3 )
  );
  MUXCY   \blk00000001/blk0000007a  (
    .CI(\blk00000001/sig000000c5 ),
    .DI(a[42]),
    .S(\blk00000001/sig000001c7 ),
    .O(\blk00000001/sig000001d2 )
  );
  MUXCY   \blk00000001/blk00000079  (
    .CI(\blk00000001/sig000001c8 ),
    .DI(a[52]),
    .S(\blk00000001/sig000001c6 ),
    .O(\blk00000001/sig000001d1 )
  );
  MUXCY   \blk00000001/blk00000078  (
    .CI(\blk00000001/sig000001d2 ),
    .DI(a[43]),
    .S(\blk00000001/sig000001c5 ),
    .O(\blk00000001/sig000001d0 )
  );
  MUXCY   \blk00000001/blk00000077  (
    .CI(\blk00000001/sig000001d0 ),
    .DI(a[44]),
    .S(\blk00000001/sig000001c4 ),
    .O(\blk00000001/sig000001cf )
  );
  MUXCY   \blk00000001/blk00000076  (
    .CI(\blk00000001/sig000001cf ),
    .DI(a[45]),
    .S(\blk00000001/sig000001c3 ),
    .O(\blk00000001/sig000001ce )
  );
  MUXCY   \blk00000001/blk00000075  (
    .CI(\blk00000001/sig000001ce ),
    .DI(a[46]),
    .S(\blk00000001/sig000001c2 ),
    .O(\blk00000001/sig000001cd )
  );
  MUXCY   \blk00000001/blk00000074  (
    .CI(\blk00000001/sig000001cd ),
    .DI(a[47]),
    .S(\blk00000001/sig000001c1 ),
    .O(\blk00000001/sig000001cc )
  );
  MUXCY   \blk00000001/blk00000073  (
    .CI(\blk00000001/sig000001cc ),
    .DI(a[48]),
    .S(\blk00000001/sig000001c0 ),
    .O(\blk00000001/sig000001cb )
  );
  MUXCY   \blk00000001/blk00000072  (
    .CI(\blk00000001/sig000001cb ),
    .DI(a[49]),
    .S(\blk00000001/sig000001bf ),
    .O(\blk00000001/sig000001ca )
  );
  MUXCY   \blk00000001/blk00000071  (
    .CI(\blk00000001/sig000001ca ),
    .DI(a[50]),
    .S(\blk00000001/sig000001be ),
    .O(\blk00000001/sig000001c9 )
  );
  MUXCY   \blk00000001/blk00000070  (
    .CI(\blk00000001/sig000001c9 ),
    .DI(a[51]),
    .S(\blk00000001/sig000001bd ),
    .O(\blk00000001/sig000001c8 )
  );
  XORCY   \blk00000001/blk0000006f  (
    .CI(\blk00000001/sig000001d2 ),
    .LI(\blk00000001/sig000001c5 ),
    .O(\blk00000001/sig000001bc )
  );
  XORCY   \blk00000001/blk0000006e  (
    .CI(\blk00000001/sig000001d0 ),
    .LI(\blk00000001/sig000001c4 ),
    .O(\blk00000001/sig000001bb )
  );
  XORCY   \blk00000001/blk0000006d  (
    .CI(\blk00000001/sig000001cf ),
    .LI(\blk00000001/sig000001c3 ),
    .O(\blk00000001/sig000001ba )
  );
  XORCY   \blk00000001/blk0000006c  (
    .CI(\blk00000001/sig000001ce ),
    .LI(\blk00000001/sig000001c2 ),
    .O(\blk00000001/sig000001b9 )
  );
  XORCY   \blk00000001/blk0000006b  (
    .CI(\blk00000001/sig000001cd ),
    .LI(\blk00000001/sig000001c1 ),
    .O(\blk00000001/sig000001b8 )
  );
  XORCY   \blk00000001/blk0000006a  (
    .CI(\blk00000001/sig000001cc ),
    .LI(\blk00000001/sig000001c0 ),
    .O(\blk00000001/sig000001b7 )
  );
  XORCY   \blk00000001/blk00000069  (
    .CI(\blk00000001/sig000001cb ),
    .LI(\blk00000001/sig000001bf ),
    .O(\blk00000001/sig000001b6 )
  );
  XORCY   \blk00000001/blk00000068  (
    .CI(\blk00000001/sig000001ca ),
    .LI(\blk00000001/sig000001be ),
    .O(\blk00000001/sig000001b5 )
  );
  XORCY   \blk00000001/blk00000067  (
    .CI(\blk00000001/sig000001c9 ),
    .LI(\blk00000001/sig000001bd ),
    .O(\blk00000001/sig000001b4 )
  );
  XORCY   \blk00000001/blk00000066  (
    .CI(\blk00000001/sig000001c8 ),
    .LI(\blk00000001/sig000001c6 ),
    .O(\blk00000001/sig000001b3 )
  );
  XORCY   \blk00000001/blk00000065  (
    .CI(\blk00000001/sig000000c5 ),
    .LI(\blk00000001/sig000001c7 ),
    .O(\blk00000001/sig000001b2 )
  );
  MUXCY   \blk00000001/blk00000064  (
    .CI(\blk00000001/sig000000c5 ),
    .DI(a[32]),
    .S(\blk00000001/sig000001a7 ),
    .O(\blk00000001/sig000001b1 )
  );
  MUXCY   \blk00000001/blk00000063  (
    .CI(\blk00000001/sig000001a8 ),
    .DI(a[41]),
    .S(\blk00000001/sig000001a6 ),
    .O(\blk00000001/sig000001b0 )
  );
  MUXCY   \blk00000001/blk00000062  (
    .CI(\blk00000001/sig000001b1 ),
    .DI(a[33]),
    .S(\blk00000001/sig000001a5 ),
    .O(\blk00000001/sig000001af )
  );
  MUXCY   \blk00000001/blk00000061  (
    .CI(\blk00000001/sig000001af ),
    .DI(a[34]),
    .S(\blk00000001/sig000001a4 ),
    .O(\blk00000001/sig000001ae )
  );
  MUXCY   \blk00000001/blk00000060  (
    .CI(\blk00000001/sig000001ae ),
    .DI(a[35]),
    .S(\blk00000001/sig000001a3 ),
    .O(\blk00000001/sig000001ad )
  );
  MUXCY   \blk00000001/blk0000005f  (
    .CI(\blk00000001/sig000001ad ),
    .DI(a[36]),
    .S(\blk00000001/sig000001a2 ),
    .O(\blk00000001/sig000001ac )
  );
  MUXCY   \blk00000001/blk0000005e  (
    .CI(\blk00000001/sig000001ac ),
    .DI(a[37]),
    .S(\blk00000001/sig000001a1 ),
    .O(\blk00000001/sig000001ab )
  );
  MUXCY   \blk00000001/blk0000005d  (
    .CI(\blk00000001/sig000001ab ),
    .DI(a[38]),
    .S(\blk00000001/sig000001a0 ),
    .O(\blk00000001/sig000001aa )
  );
  MUXCY   \blk00000001/blk0000005c  (
    .CI(\blk00000001/sig000001aa ),
    .DI(a[39]),
    .S(\blk00000001/sig0000019f ),
    .O(\blk00000001/sig000001a9 )
  );
  MUXCY   \blk00000001/blk0000005b  (
    .CI(\blk00000001/sig000001a9 ),
    .DI(a[40]),
    .S(\blk00000001/sig0000019e ),
    .O(\blk00000001/sig000001a8 )
  );
  XORCY   \blk00000001/blk0000005a  (
    .CI(\blk00000001/sig000001b1 ),
    .LI(\blk00000001/sig000001a5 ),
    .O(\blk00000001/sig0000019d )
  );
  XORCY   \blk00000001/blk00000059  (
    .CI(\blk00000001/sig000001af ),
    .LI(\blk00000001/sig000001a4 ),
    .O(\blk00000001/sig0000019c )
  );
  XORCY   \blk00000001/blk00000058  (
    .CI(\blk00000001/sig000001ae ),
    .LI(\blk00000001/sig000001a3 ),
    .O(\blk00000001/sig0000019b )
  );
  XORCY   \blk00000001/blk00000057  (
    .CI(\blk00000001/sig000001ad ),
    .LI(\blk00000001/sig000001a2 ),
    .O(\blk00000001/sig0000019a )
  );
  XORCY   \blk00000001/blk00000056  (
    .CI(\blk00000001/sig000001ac ),
    .LI(\blk00000001/sig000001a1 ),
    .O(\blk00000001/sig00000199 )
  );
  XORCY   \blk00000001/blk00000055  (
    .CI(\blk00000001/sig000001ab ),
    .LI(\blk00000001/sig000001a0 ),
    .O(\blk00000001/sig00000198 )
  );
  XORCY   \blk00000001/blk00000054  (
    .CI(\blk00000001/sig000001aa ),
    .LI(\blk00000001/sig0000019f ),
    .O(\blk00000001/sig00000197 )
  );
  XORCY   \blk00000001/blk00000053  (
    .CI(\blk00000001/sig000001a9 ),
    .LI(\blk00000001/sig0000019e ),
    .O(\blk00000001/sig00000196 )
  );
  XORCY   \blk00000001/blk00000052  (
    .CI(\blk00000001/sig000001a8 ),
    .LI(\blk00000001/sig000001a6 ),
    .O(\blk00000001/sig00000195 )
  );
  XORCY   \blk00000001/blk00000051  (
    .CI(\blk00000001/sig000000c5 ),
    .LI(\blk00000001/sig000001a7 ),
    .O(\blk00000001/sig00000194 )
  );
  MUXCY   \blk00000001/blk00000050  (
    .CI(\blk00000001/sig000000c5 ),
    .DI(a[21]),
    .S(\blk00000001/sig00000188 ),
    .O(\blk00000001/sig00000193 )
  );
  MUXCY   \blk00000001/blk0000004f  (
    .CI(\blk00000001/sig00000189 ),
    .DI(a[31]),
    .S(\blk00000001/sig00000187 ),
    .O(\blk00000001/sig00000192 )
  );
  MUXCY   \blk00000001/blk0000004e  (
    .CI(\blk00000001/sig00000193 ),
    .DI(a[22]),
    .S(\blk00000001/sig00000186 ),
    .O(\blk00000001/sig00000191 )
  );
  MUXCY   \blk00000001/blk0000004d  (
    .CI(\blk00000001/sig00000191 ),
    .DI(a[23]),
    .S(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig00000190 )
  );
  MUXCY   \blk00000001/blk0000004c  (
    .CI(\blk00000001/sig00000190 ),
    .DI(a[24]),
    .S(\blk00000001/sig00000184 ),
    .O(\blk00000001/sig0000018f )
  );
  MUXCY   \blk00000001/blk0000004b  (
    .CI(\blk00000001/sig0000018f ),
    .DI(a[25]),
    .S(\blk00000001/sig00000183 ),
    .O(\blk00000001/sig0000018e )
  );
  MUXCY   \blk00000001/blk0000004a  (
    .CI(\blk00000001/sig0000018e ),
    .DI(a[26]),
    .S(\blk00000001/sig00000182 ),
    .O(\blk00000001/sig0000018d )
  );
  MUXCY   \blk00000001/blk00000049  (
    .CI(\blk00000001/sig0000018d ),
    .DI(a[27]),
    .S(\blk00000001/sig00000181 ),
    .O(\blk00000001/sig0000018c )
  );
  MUXCY   \blk00000001/blk00000048  (
    .CI(\blk00000001/sig0000018c ),
    .DI(a[28]),
    .S(\blk00000001/sig00000180 ),
    .O(\blk00000001/sig0000018b )
  );
  MUXCY   \blk00000001/blk00000047  (
    .CI(\blk00000001/sig0000018b ),
    .DI(a[29]),
    .S(\blk00000001/sig0000017f ),
    .O(\blk00000001/sig0000018a )
  );
  MUXCY   \blk00000001/blk00000046  (
    .CI(\blk00000001/sig0000018a ),
    .DI(a[30]),
    .S(\blk00000001/sig0000017e ),
    .O(\blk00000001/sig00000189 )
  );
  XORCY   \blk00000001/blk00000045  (
    .CI(\blk00000001/sig00000193 ),
    .LI(\blk00000001/sig00000186 ),
    .O(\blk00000001/sig0000017d )
  );
  XORCY   \blk00000001/blk00000044  (
    .CI(\blk00000001/sig00000191 ),
    .LI(\blk00000001/sig00000185 ),
    .O(\blk00000001/sig0000017c )
  );
  XORCY   \blk00000001/blk00000043  (
    .CI(\blk00000001/sig00000190 ),
    .LI(\blk00000001/sig00000184 ),
    .O(\blk00000001/sig0000017b )
  );
  XORCY   \blk00000001/blk00000042  (
    .CI(\blk00000001/sig0000018f ),
    .LI(\blk00000001/sig00000183 ),
    .O(\blk00000001/sig0000017a )
  );
  XORCY   \blk00000001/blk00000041  (
    .CI(\blk00000001/sig0000018e ),
    .LI(\blk00000001/sig00000182 ),
    .O(\blk00000001/sig00000179 )
  );
  XORCY   \blk00000001/blk00000040  (
    .CI(\blk00000001/sig0000018d ),
    .LI(\blk00000001/sig00000181 ),
    .O(\blk00000001/sig00000178 )
  );
  XORCY   \blk00000001/blk0000003f  (
    .CI(\blk00000001/sig0000018c ),
    .LI(\blk00000001/sig00000180 ),
    .O(\blk00000001/sig00000177 )
  );
  XORCY   \blk00000001/blk0000003e  (
    .CI(\blk00000001/sig0000018b ),
    .LI(\blk00000001/sig0000017f ),
    .O(\blk00000001/sig00000176 )
  );
  XORCY   \blk00000001/blk0000003d  (
    .CI(\blk00000001/sig0000018a ),
    .LI(\blk00000001/sig0000017e ),
    .O(\blk00000001/sig00000175 )
  );
  XORCY   \blk00000001/blk0000003c  (
    .CI(\blk00000001/sig00000189 ),
    .LI(\blk00000001/sig00000187 ),
    .O(\blk00000001/sig00000174 )
  );
  XORCY   \blk00000001/blk0000003b  (
    .CI(\blk00000001/sig000000c5 ),
    .LI(\blk00000001/sig00000188 ),
    .O(\blk00000001/sig00000173 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003a  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000152 ),
    .Q(\blk00000001/sig00000128 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000039  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000015c ),
    .Q(\blk00000001/sig00000129 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000038  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000015b ),
    .Q(\blk00000001/sig0000012a )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000037  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000015a ),
    .Q(\blk00000001/sig0000012b )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000036  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000159 ),
    .Q(\blk00000001/sig0000012c )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000035  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000158 ),
    .Q(\blk00000001/sig0000012d )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000034  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000157 ),
    .Q(\blk00000001/sig0000012e )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000033  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000156 ),
    .Q(\blk00000001/sig0000012f )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000032  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000155 ),
    .Q(\blk00000001/sig00000130 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000031  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000154 ),
    .Q(\blk00000001/sig00000131 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000030  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000153 ),
    .Q(\blk00000001/sig00000132 )
  );
  MUXCY   \blk00000001/blk0000002f  (
    .CI(\blk00000001/sig000000c5 ),
    .DI(a[10]),
    .S(\blk00000001/sig00000167 ),
    .O(\blk00000001/sig00000172 )
  );
  MUXCY   \blk00000001/blk0000002e  (
    .CI(\blk00000001/sig00000168 ),
    .DI(a[20]),
    .S(\blk00000001/sig00000166 ),
    .O(\blk00000001/sig00000171 )
  );
  MUXCY   \blk00000001/blk0000002d  (
    .CI(\blk00000001/sig00000172 ),
    .DI(a[11]),
    .S(\blk00000001/sig00000165 ),
    .O(\blk00000001/sig00000170 )
  );
  MUXCY   \blk00000001/blk0000002c  (
    .CI(\blk00000001/sig00000170 ),
    .DI(a[12]),
    .S(\blk00000001/sig00000164 ),
    .O(\blk00000001/sig0000016f )
  );
  MUXCY   \blk00000001/blk0000002b  (
    .CI(\blk00000001/sig0000016f ),
    .DI(a[13]),
    .S(\blk00000001/sig00000163 ),
    .O(\blk00000001/sig0000016e )
  );
  MUXCY   \blk00000001/blk0000002a  (
    .CI(\blk00000001/sig0000016e ),
    .DI(a[14]),
    .S(\blk00000001/sig00000162 ),
    .O(\blk00000001/sig0000016d )
  );
  MUXCY   \blk00000001/blk00000029  (
    .CI(\blk00000001/sig0000016d ),
    .DI(a[15]),
    .S(\blk00000001/sig00000161 ),
    .O(\blk00000001/sig0000016c )
  );
  MUXCY   \blk00000001/blk00000028  (
    .CI(\blk00000001/sig0000016c ),
    .DI(a[16]),
    .S(\blk00000001/sig00000160 ),
    .O(\blk00000001/sig0000016b )
  );
  MUXCY   \blk00000001/blk00000027  (
    .CI(\blk00000001/sig0000016b ),
    .DI(a[17]),
    .S(\blk00000001/sig0000015f ),
    .O(\blk00000001/sig0000016a )
  );
  MUXCY   \blk00000001/blk00000026  (
    .CI(\blk00000001/sig0000016a ),
    .DI(a[18]),
    .S(\blk00000001/sig0000015e ),
    .O(\blk00000001/sig00000169 )
  );
  MUXCY   \blk00000001/blk00000025  (
    .CI(\blk00000001/sig00000169 ),
    .DI(a[19]),
    .S(\blk00000001/sig0000015d ),
    .O(\blk00000001/sig00000168 )
  );
  XORCY   \blk00000001/blk00000024  (
    .CI(\blk00000001/sig00000172 ),
    .LI(\blk00000001/sig00000165 ),
    .O(\blk00000001/sig0000015c )
  );
  XORCY   \blk00000001/blk00000023  (
    .CI(\blk00000001/sig00000170 ),
    .LI(\blk00000001/sig00000164 ),
    .O(\blk00000001/sig0000015b )
  );
  XORCY   \blk00000001/blk00000022  (
    .CI(\blk00000001/sig0000016f ),
    .LI(\blk00000001/sig00000163 ),
    .O(\blk00000001/sig0000015a )
  );
  XORCY   \blk00000001/blk00000021  (
    .CI(\blk00000001/sig0000016e ),
    .LI(\blk00000001/sig00000162 ),
    .O(\blk00000001/sig00000159 )
  );
  XORCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig0000016d ),
    .LI(\blk00000001/sig00000161 ),
    .O(\blk00000001/sig00000158 )
  );
  XORCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig0000016c ),
    .LI(\blk00000001/sig00000160 ),
    .O(\blk00000001/sig00000157 )
  );
  XORCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig0000016b ),
    .LI(\blk00000001/sig0000015f ),
    .O(\blk00000001/sig00000156 )
  );
  XORCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig0000016a ),
    .LI(\blk00000001/sig0000015e ),
    .O(\blk00000001/sig00000155 )
  );
  XORCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig00000169 ),
    .LI(\blk00000001/sig0000015d ),
    .O(\blk00000001/sig00000154 )
  );
  XORCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig00000168 ),
    .LI(\blk00000001/sig00000166 ),
    .O(\blk00000001/sig00000153 )
  );
  XORCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig000000c5 ),
    .LI(\blk00000001/sig00000167 ),
    .O(\blk00000001/sig00000152 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig00000171 ),
    .Q(\blk00000001/sig00000127 )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .CE(ce),
    .D(\blk00000001/sig0000014f ),
    .Q(\blk00000001/sig00000133 )
  );
  MUXCY   \blk00000001/blk00000017  (
    .CI(c_in),
    .DI(a[0]),
    .S(\blk00000001/sig00000146 ),
    .O(\blk00000001/sig00000151 )
  );
  XORCY   \blk00000001/blk00000016  (
    .CI(c_in),
    .LI(\blk00000001/sig00000146 ),
    .O(\blk00000001/sig00000150 )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig00000147 ),
    .DI(a[9]),
    .S(\blk00000001/sig00000145 ),
    .O(\blk00000001/sig0000014f )
  );
  MUXCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig00000151 ),
    .DI(a[1]),
    .S(\blk00000001/sig00000144 ),
    .O(\blk00000001/sig0000014e )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig0000014e ),
    .DI(a[2]),
    .S(\blk00000001/sig00000143 ),
    .O(\blk00000001/sig0000014d )
  );
  MUXCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig0000014d ),
    .DI(a[3]),
    .S(\blk00000001/sig00000142 ),
    .O(\blk00000001/sig0000014c )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig0000014c ),
    .DI(a[4]),
    .S(\blk00000001/sig00000141 ),
    .O(\blk00000001/sig0000014b )
  );
  MUXCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig0000014b ),
    .DI(a[5]),
    .S(\blk00000001/sig00000140 ),
    .O(\blk00000001/sig0000014a )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig0000014a ),
    .DI(a[6]),
    .S(\blk00000001/sig0000013f ),
    .O(\blk00000001/sig00000149 )
  );
  MUXCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig00000149 ),
    .DI(a[7]),
    .S(\blk00000001/sig0000013e ),
    .O(\blk00000001/sig00000148 )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig00000148 ),
    .DI(a[8]),
    .S(\blk00000001/sig0000013d ),
    .O(\blk00000001/sig00000147 )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig00000151 ),
    .LI(\blk00000001/sig00000144 ),
    .O(\blk00000001/sig0000013c )
  );
  XORCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig0000014e ),
    .LI(\blk00000001/sig00000143 ),
    .O(\blk00000001/sig0000013b )
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig0000014d ),
    .LI(\blk00000001/sig00000142 ),
    .O(\blk00000001/sig0000013a )
  );
  XORCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig0000014c ),
    .LI(\blk00000001/sig00000141 ),
    .O(\blk00000001/sig00000139 )
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig0000014b ),
    .LI(\blk00000001/sig00000140 ),
    .O(\blk00000001/sig00000138 )
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig0000014a ),
    .LI(\blk00000001/sig0000013f ),
    .O(\blk00000001/sig00000137 )
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig00000149 ),
    .LI(\blk00000001/sig0000013e ),
    .O(\blk00000001/sig00000136 )
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000148 ),
    .LI(\blk00000001/sig0000013d ),
    .O(\blk00000001/sig00000135 )
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000147 ),
    .LI(\blk00000001/sig00000145 ),
    .O(\blk00000001/sig00000134 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig000000c5 )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig000000c4 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
