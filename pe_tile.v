/* verilator lint_off UNOPTFLAT */
module coreir_and #(parameter width=1) (

  input [width-1:0] in0,

  input [width-1:0] in1,

  output [width-1:0] out

);

  assign out = in0 & in1;



endmodule //coreir_and

// End of module

module and1_wrapped (

  input [0:0] I0,

  input [0:0] I1,

  output [0:0] O

);

  //Wire declarations for instance 'inst0' (Module coreir_and)

  wire [0:0] inst0__in0;

  wire [0:0] inst0__in1;

  wire [0:0] inst0__out;

  coreir_and #(.width(1)) inst0(

    .in0(inst0__in0),

    .in1(inst0__in1),

    .out(inst0__out)

  );



  //All the connections

  assign inst0__in1[0:0] = I1[0:0];

  assign inst0__in0[0:0] = I0[0:0];

  assign O[0:0] = inst0__out[0:0];



endmodule //and1_wrapped

// End of module

module coreir_or #(parameter width=1) (

  input [width-1:0] in0,

  input [width-1:0] in1,

  output [width-1:0] out

);

  assign out = in0 | in1;



endmodule //coreir_or

// End of module

module or1_wrapped (

  input [0:0] I0,

  input [0:0] I1,

  output [0:0] O

);

  //Wire declarations for instance 'inst0' (Module coreir_or)

  wire [0:0] inst0__in0;

  wire [0:0] inst0__in1;

  wire [0:0] inst0__out;

  coreir_or #(.width(1)) inst0(

    .in0(inst0__in0),

    .in1(inst0__in1),

    .out(inst0__out)

  );



  //All the connections

  assign inst0__in0[0:0] = I0[0:0];

  assign inst0__in1[0:0] = I1[0:0];

  assign O[0:0] = inst0__out[0:0];



endmodule //or1_wrapped

// End of module

module coreir_xor #(parameter width=1) (

  input [width-1:0] in0,

  input [width-1:0] in1,

  output [width-1:0] out

);

  assign out = in0 ^ in1;



endmodule //coreir_xor

// End of module

module _Mux8 (

  input [7:0] I,

  output  O,

  input [2:0] S

);

  //Wire declarations for instance 'inst0' (Module _Mux4)

  wire [3:0] inst0__I;

  wire  inst0__O;

  wire [1:0] inst0__S;

  _Mux4 inst0(

    .I(inst0__I),

    .O(inst0__O),

    .S(inst0__S)

  );



  //Wire declarations for instance 'inst1' (Module _Mux4)

  wire [3:0] inst1__I;

  wire  inst1__O;

  wire [1:0] inst1__S;

  _Mux4 inst1(

    .I(inst1__I),

    .O(inst1__O),

    .S(inst1__S)

  );



  //Wire declarations for instance 'inst2' (Module _Mux2)

  wire [1:0] inst2__I;

  wire  inst2__O;

  wire  inst2__S;

  _Mux2 inst2(

    .I(inst2__I),

    .O(inst2__O),

    .S(inst2__S)

  );



  //All the connections

  assign inst0__I[0] = I[0];

  assign inst0__I[1] = I[1];

  assign inst0__I[2] = I[2];

  assign inst0__I[3] = I[3];

  assign inst2__I[0] = inst0__O;

  assign inst0__S[0] = S[0];

  assign inst1__S[0] = S[0];

  assign inst0__S[1] = S[1];

  assign inst1__S[1] = S[1];

  assign inst1__I[0] = I[4];

  assign inst1__I[1] = I[5];

  assign inst1__I[2] = I[6];

  assign inst1__I[3] = I[7];

  assign inst2__I[1] = inst1__O;

  assign O = inst2__O;

  assign inst2__S = S[2];



endmodule //_Mux8

// End of module

module Mux8x1 (

  input [0:0] I0,

  input [0:0] I1,

  input [0:0] I2,

  input [0:0] I3,

  input [0:0] I4,

  input [0:0] I5,

  input [0:0] I6,

  input [0:0] I7,

  output [0:0] O,

  input [2:0] S

);

  //Wire declarations for instance 'inst0' (Module _Mux8)

  wire [7:0] inst0__I;

  wire  inst0__O;

  wire [2:0] inst0__S;

  _Mux8 inst0(

    .I(inst0__I),

    .O(inst0__O),

    .S(inst0__S)

  );



  //All the connections

  assign inst0__I[0] = I0[0];

  assign inst0__I[1] = I1[0];

  assign inst0__I[2] = I2[0];

  assign inst0__I[3] = I3[0];

  assign inst0__I[4] = I4[0];

  assign inst0__I[5] = I5[0];

  assign inst0__I[6] = I6[0];

  assign inst0__I[7] = I7[0];

  assign O[0] = inst0__O;

  assign inst0__S[2:0] = S[2:0];



endmodule //Mux8x1

// End of module

module xor1_wrapped (

  input [0:0] I0,

  input [0:0] I1,

  output [0:0] O

);

  //Wire declarations for instance 'inst0' (Module coreir_xor)

  wire [0:0] inst0__in0;

  wire [0:0] inst0__in1;

  wire [0:0] inst0__out;

  coreir_xor #(.width(1)) inst0(

    .in0(inst0__in0),

    .in1(inst0__in1),

    .out(inst0__out)

  );



  //All the connections

  assign inst0__in0[0:0] = I0[0:0];

  assign inst0__in1[0:0] = I1[0:0];

  assign O[0:0] = inst0__out[0:0];



endmodule //xor1_wrapped

// End of module

module switch_box (

  input [0:0] clb_result,

  input  clk,

  input [31:0] config_data,

  input  config_en,

  input  rst,

  input [0:0] side_0_track_0_in,

  output [0:0] side_0_track_0_out,

  input [0:0] side_0_track_1_in,

  output [0:0] side_0_track_1_out,

  input [0:0] side_0_track_2_in,

  output [0:0] side_0_track_2_out,

  input [0:0] side_0_track_3_in,

  output [0:0] side_0_track_3_out,

  input [0:0] side_1_track_0_in,

  output [0:0] side_1_track_0_out,

  input [0:0] side_1_track_1_in,

  output [0:0] side_1_track_1_out,

  input [0:0] side_1_track_2_in,

  output [0:0] side_1_track_2_out,

  input [0:0] side_1_track_3_in,

  output [0:0] side_1_track_3_out,

  input [0:0] side_2_track_0_in,

  output [0:0] side_2_track_0_out,

  input [0:0] side_2_track_1_in,

  output [0:0] side_2_track_1_out,

  input [0:0] side_2_track_2_in,

  output [0:0] side_2_track_2_out,

  input [0:0] side_2_track_3_in,

  output [0:0] side_2_track_3_out,

  input [0:0] side_3_track_0_in,

  output [0:0] side_3_track_0_out,

  input [0:0] side_3_track_1_in,

  output [0:0] side_3_track_1_out,

  input [0:0] side_3_track_2_in,

  output [0:0] side_3_track_2_out,

  input [0:0] side_3_track_3_in,

  output [0:0] side_3_track_3_out

);

  //Wire declarations for instance 'inst0' (Module Register32CER)

  wire  inst0__CE;

  wire  inst0__CLK;

  wire [31:0] inst0__I;

  wire [31:0] inst0__O;

  wire  inst0__RESET;

  Register32CER inst0(

    .CE(inst0__CE),

    .CLK(inst0__CLK),

    .I(inst0__I),

    .O(inst0__O),

    .RESET(inst0__RESET)

  );



  //Wire declarations for instance 'inst1' (Module Invert1_wrapped)

  wire [0:0] inst1__I;

  wire [0:0] inst1__O;

  Invert1_wrapped inst1(

    .I(inst1__I),

    .O(inst1__O)

  );



  //Wire declarations for instance 'inst10' (Module Mux4x1)

  wire [0:0] inst10__I0;

  wire [0:0] inst10__I1;

  wire [0:0] inst10__I2;

  wire [0:0] inst10__I3;

  wire [0:0] inst10__O;

  wire [1:0] inst10__S;

  Mux4x1 inst10(

    .I0(inst10__I0),

    .I1(inst10__I1),

    .I2(inst10__I2),

    .I3(inst10__I3),

    .O(inst10__O),

    .S(inst10__S)

  );



  //Wire declarations for instance 'inst11' (Module Mux4x1)

  wire [0:0] inst11__I0;

  wire [0:0] inst11__I1;

  wire [0:0] inst11__I2;

  wire [0:0] inst11__I3;

  wire [0:0] inst11__O;

  wire [1:0] inst11__S;

  Mux4x1 inst11(

    .I0(inst11__I0),

    .I1(inst11__I1),

    .I2(inst11__I2),

    .I3(inst11__I3),

    .O(inst11__O),

    .S(inst11__S)

  );



  //Wire declarations for instance 'inst12' (Module Mux4x1)

  wire [0:0] inst12__I0;

  wire [0:0] inst12__I1;

  wire [0:0] inst12__I2;

  wire [0:0] inst12__I3;

  wire [0:0] inst12__O;

  wire [1:0] inst12__S;

  Mux4x1 inst12(

    .I0(inst12__I0),

    .I1(inst12__I1),

    .I2(inst12__I2),

    .I3(inst12__I3),

    .O(inst12__O),

    .S(inst12__S)

  );



  //Wire declarations for instance 'inst13' (Module Mux4x1)

  wire [0:0] inst13__I0;

  wire [0:0] inst13__I1;

  wire [0:0] inst13__I2;

  wire [0:0] inst13__I3;

  wire [0:0] inst13__O;

  wire [1:0] inst13__S;

  Mux4x1 inst13(

    .I0(inst13__I0),

    .I1(inst13__I1),

    .I2(inst13__I2),

    .I3(inst13__I3),

    .O(inst13__O),

    .S(inst13__S)

  );



  //Wire declarations for instance 'inst14' (Module Mux4x1)

  wire [0:0] inst14__I0;

  wire [0:0] inst14__I1;

  wire [0:0] inst14__I2;

  wire [0:0] inst14__I3;

  wire [0:0] inst14__O;

  wire [1:0] inst14__S;

  Mux4x1 inst14(

    .I0(inst14__I0),

    .I1(inst14__I1),

    .I2(inst14__I2),

    .I3(inst14__I3),

    .O(inst14__O),

    .S(inst14__S)

  );



  //Wire declarations for instance 'inst15' (Module Mux4x1)

  wire [0:0] inst15__I0;

  wire [0:0] inst15__I1;

  wire [0:0] inst15__I2;

  wire [0:0] inst15__I3;

  wire [0:0] inst15__O;

  wire [1:0] inst15__S;

  Mux4x1 inst15(

    .I0(inst15__I0),

    .I1(inst15__I1),

    .I2(inst15__I2),

    .I3(inst15__I3),

    .O(inst15__O),

    .S(inst15__S)

  );



  //Wire declarations for instance 'inst16' (Module Mux4x1)

  wire [0:0] inst16__I0;

  wire [0:0] inst16__I1;

  wire [0:0] inst16__I2;

  wire [0:0] inst16__I3;

  wire [0:0] inst16__O;

  wire [1:0] inst16__S;

  Mux4x1 inst16(

    .I0(inst16__I0),

    .I1(inst16__I1),

    .I2(inst16__I2),

    .I3(inst16__I3),

    .O(inst16__O),

    .S(inst16__S)

  );



  //Wire declarations for instance 'inst17' (Module Mux4x1)

  wire [0:0] inst17__I0;

  wire [0:0] inst17__I1;

  wire [0:0] inst17__I2;

  wire [0:0] inst17__I3;

  wire [0:0] inst17__O;

  wire [1:0] inst17__S;

  Mux4x1 inst17(

    .I0(inst17__I0),

    .I1(inst17__I1),

    .I2(inst17__I2),

    .I3(inst17__I3),

    .O(inst17__O),

    .S(inst17__S)

  );



  //Wire declarations for instance 'inst2' (Module Mux4x1)

  wire [0:0] inst2__I0;

  wire [0:0] inst2__I1;

  wire [0:0] inst2__I2;

  wire [0:0] inst2__I3;

  wire [0:0] inst2__O;

  wire [1:0] inst2__S;

  Mux4x1 inst2(

    .I0(inst2__I0),

    .I1(inst2__I1),

    .I2(inst2__I2),

    .I3(inst2__I3),

    .O(inst2__O),

    .S(inst2__S)

  );



  //Wire declarations for instance 'inst3' (Module Mux4x1)

  wire [0:0] inst3__I0;

  wire [0:0] inst3__I1;

  wire [0:0] inst3__I2;

  wire [0:0] inst3__I3;

  wire [0:0] inst3__O;

  wire [1:0] inst3__S;

  Mux4x1 inst3(

    .I0(inst3__I0),

    .I1(inst3__I1),

    .I2(inst3__I2),

    .I3(inst3__I3),

    .O(inst3__O),

    .S(inst3__S)

  );



  //Wire declarations for instance 'inst4' (Module Mux4x1)

  wire [0:0] inst4__I0;

  wire [0:0] inst4__I1;

  wire [0:0] inst4__I2;

  wire [0:0] inst4__I3;

  wire [0:0] inst4__O;

  wire [1:0] inst4__S;

  Mux4x1 inst4(

    .I0(inst4__I0),

    .I1(inst4__I1),

    .I2(inst4__I2),

    .I3(inst4__I3),

    .O(inst4__O),

    .S(inst4__S)

  );



  //Wire declarations for instance 'inst5' (Module Mux4x1)

  wire [0:0] inst5__I0;

  wire [0:0] inst5__I1;

  wire [0:0] inst5__I2;

  wire [0:0] inst5__I3;

  wire [0:0] inst5__O;

  wire [1:0] inst5__S;

  Mux4x1 inst5(

    .I0(inst5__I0),

    .I1(inst5__I1),

    .I2(inst5__I2),

    .I3(inst5__I3),

    .O(inst5__O),

    .S(inst5__S)

  );



  //Wire declarations for instance 'inst6' (Module Mux4x1)

  wire [0:0] inst6__I0;

  wire [0:0] inst6__I1;

  wire [0:0] inst6__I2;

  wire [0:0] inst6__I3;

  wire [0:0] inst6__O;

  wire [1:0] inst6__S;

  Mux4x1 inst6(

    .I0(inst6__I0),

    .I1(inst6__I1),

    .I2(inst6__I2),

    .I3(inst6__I3),

    .O(inst6__O),

    .S(inst6__S)

  );



  //Wire declarations for instance 'inst7' (Module Mux4x1)

  wire [0:0] inst7__I0;

  wire [0:0] inst7__I1;

  wire [0:0] inst7__I2;

  wire [0:0] inst7__I3;

  wire [0:0] inst7__O;

  wire [1:0] inst7__S;

  Mux4x1 inst7(

    .I0(inst7__I0),

    .I1(inst7__I1),

    .I2(inst7__I2),

    .I3(inst7__I3),

    .O(inst7__O),

    .S(inst7__S)

  );



  //Wire declarations for instance 'inst8' (Module Mux4x1)

  wire [0:0] inst8__I0;

  wire [0:0] inst8__I1;

  wire [0:0] inst8__I2;

  wire [0:0] inst8__I3;

  wire [0:0] inst8__O;

  wire [1:0] inst8__S;

  Mux4x1 inst8(

    .I0(inst8__I0),

    .I1(inst8__I1),

    .I2(inst8__I2),

    .I3(inst8__I3),

    .O(inst8__O),

    .S(inst8__S)

  );



  //Wire declarations for instance 'inst9' (Module Mux4x1)

  wire [0:0] inst9__I0;

  wire [0:0] inst9__I1;

  wire [0:0] inst9__I2;

  wire [0:0] inst9__I3;

  wire [0:0] inst9__O;

  wire [1:0] inst9__S;

  Mux4x1 inst9(

    .I0(inst9__I0),

    .I1(inst9__I1),

    .I2(inst9__I2),

    .I3(inst9__I3),

    .O(inst9__O),

    .S(inst9__S)

  );



  //All the connections

  assign inst0__CE = config_en;

  assign inst0__CLK = clk;

  assign inst0__I[31:0] = config_data[31:0];

  assign inst2__S[0] = inst0__O[0];

  assign inst7__S[0] = inst0__O[10];

  assign inst7__S[1] = inst0__O[11];

  assign inst8__S[0] = inst0__O[12];

  assign inst8__S[1] = inst0__O[13];

  assign inst9__S[0] = inst0__O[14];

  assign inst9__S[1] = inst0__O[15];

  assign inst10__S[0] = inst0__O[16];

  assign inst10__S[1] = inst0__O[17];

  assign inst11__S[0] = inst0__O[18];

  assign inst11__S[1] = inst0__O[19];

  assign inst2__S[1] = inst0__O[1];

  assign inst12__S[0] = inst0__O[20];

  assign inst12__S[1] = inst0__O[21];

  assign inst13__S[0] = inst0__O[22];

  assign inst13__S[1] = inst0__O[23];

  assign inst14__S[0] = inst0__O[24];

  assign inst14__S[1] = inst0__O[25];

  assign inst15__S[0] = inst0__O[26];

  assign inst15__S[1] = inst0__O[27];

  assign inst16__S[0] = inst0__O[28];

  assign inst16__S[1] = inst0__O[29];

  assign inst3__S[0] = inst0__O[2];

  assign inst17__S[0] = inst0__O[30];

  assign inst17__S[1] = inst0__O[31];

  assign inst3__S[1] = inst0__O[3];

  assign inst4__S[0] = inst0__O[4];

  assign inst4__S[1] = inst0__O[5];

  assign inst5__S[0] = inst0__O[6];

  assign inst5__S[1] = inst0__O[7];

  assign inst6__S[0] = inst0__O[8];

  assign inst6__S[1] = inst0__O[9];

  assign inst0__RESET = inst1__O[0];

  assign inst1__I[0] = rst;

  assign inst10__I0[0:0] = side_0_track_0_in[0:0];

  assign inst14__I0[0:0] = side_0_track_0_in[0:0];

  assign inst6__I0[0:0] = side_0_track_0_in[0:0];

  assign inst10__I1[0:0] = side_1_track_0_in[0:0];

  assign inst14__I1[0:0] = side_1_track_0_in[0:0];

  assign inst2__I1[0:0] = side_1_track_0_in[0:0];

  assign inst10__I2[0:0] = clb_result[0:0];

  assign inst11__I2[0:0] = clb_result[0:0];

  assign inst12__I2[0:0] = clb_result[0:0];

  assign inst13__I2[0:0] = clb_result[0:0];

  assign inst14__I3[0:0] = clb_result[0:0];

  assign inst15__I3[0:0] = clb_result[0:0];

  assign inst16__I3[0:0] = clb_result[0:0];

  assign inst17__I3[0:0] = clb_result[0:0];

  assign inst2__I0[0:0] = clb_result[0:0];

  assign inst3__I0[0:0] = clb_result[0:0];

  assign inst4__I0[0:0] = clb_result[0:0];

  assign inst5__I0[0:0] = clb_result[0:0];

  assign inst6__I1[0:0] = clb_result[0:0];

  assign inst7__I1[0:0] = clb_result[0:0];

  assign inst8__I1[0:0] = clb_result[0:0];

  assign inst9__I1[0:0] = clb_result[0:0];

  assign inst10__I3[0:0] = side_3_track_0_in[0:0];

  assign inst2__I3[0:0] = side_3_track_0_in[0:0];

  assign inst6__I3[0:0] = side_3_track_0_in[0:0];

  assign side_2_track_0_out[0:0] = inst10__O[0:0];

  assign inst11__I0[0:0] = side_0_track_1_in[0:0];

  assign inst15__I0[0:0] = side_0_track_1_in[0:0];

  assign inst7__I0[0:0] = side_0_track_1_in[0:0];

  assign inst11__I1[0:0] = side_1_track_1_in[0:0];

  assign inst15__I1[0:0] = side_1_track_1_in[0:0];

  assign inst3__I1[0:0] = side_1_track_1_in[0:0];

  assign inst11__I3[0:0] = side_3_track_1_in[0:0];

  assign inst3__I3[0:0] = side_3_track_1_in[0:0];

  assign inst7__I3[0:0] = side_3_track_1_in[0:0];

  assign side_2_track_1_out[0:0] = inst11__O[0:0];

  assign inst12__I0[0:0] = side_0_track_2_in[0:0];

  assign inst16__I0[0:0] = side_0_track_2_in[0:0];

  assign inst8__I0[0:0] = side_0_track_2_in[0:0];

  assign inst12__I1[0:0] = side_1_track_2_in[0:0];

  assign inst16__I1[0:0] = side_1_track_2_in[0:0];

  assign inst4__I1[0:0] = side_1_track_2_in[0:0];

  assign inst12__I3[0:0] = side_3_track_2_in[0:0];

  assign inst4__I3[0:0] = side_3_track_2_in[0:0];

  assign inst8__I3[0:0] = side_3_track_2_in[0:0];

  assign side_2_track_2_out[0:0] = inst12__O[0:0];

  assign inst13__I0[0:0] = side_0_track_3_in[0:0];

  assign inst17__I0[0:0] = side_0_track_3_in[0:0];

  assign inst9__I0[0:0] = side_0_track_3_in[0:0];

  assign inst13__I1[0:0] = side_1_track_3_in[0:0];

  assign inst17__I1[0:0] = side_1_track_3_in[0:0];

  assign inst5__I1[0:0] = side_1_track_3_in[0:0];

  assign inst13__I3[0:0] = side_3_track_3_in[0:0];

  assign inst5__I3[0:0] = side_3_track_3_in[0:0];

  assign inst9__I3[0:0] = side_3_track_3_in[0:0];

  assign side_2_track_3_out[0:0] = inst13__O[0:0];

  assign inst14__I2[0:0] = side_2_track_0_in[0:0];

  assign inst2__I2[0:0] = side_2_track_0_in[0:0];

  assign inst6__I2[0:0] = side_2_track_0_in[0:0];

  assign side_3_track_0_out[0:0] = inst14__O[0:0];

  assign inst15__I2[0:0] = side_2_track_1_in[0:0];

  assign inst3__I2[0:0] = side_2_track_1_in[0:0];

  assign inst7__I2[0:0] = side_2_track_1_in[0:0];

  assign side_3_track_1_out[0:0] = inst15__O[0:0];

  assign inst16__I2[0:0] = side_2_track_2_in[0:0];

  assign inst4__I2[0:0] = side_2_track_2_in[0:0];

  assign inst8__I2[0:0] = side_2_track_2_in[0:0];

  assign side_3_track_2_out[0:0] = inst16__O[0:0];

  assign inst17__I2[0:0] = side_2_track_3_in[0:0];

  assign inst5__I2[0:0] = side_2_track_3_in[0:0];

  assign inst9__I2[0:0] = side_2_track_3_in[0:0];

  assign side_3_track_3_out[0:0] = inst17__O[0:0];

  assign side_0_track_0_out[0:0] = inst2__O[0:0];

  assign side_0_track_1_out[0:0] = inst3__O[0:0];

  assign side_0_track_2_out[0:0] = inst4__O[0:0];

  assign side_0_track_3_out[0:0] = inst5__O[0:0];

  assign side_1_track_0_out[0:0] = inst6__O[0:0];

  assign side_1_track_1_out[0:0] = inst7__O[0:0];

  assign side_1_track_2_out[0:0] = inst8__O[0:0];

  assign side_1_track_3_out[0:0] = inst9__O[0:0];



endmodule //switch_box

// End of module

module connect_box (

  input  clk,

  input [31:0] config_data,

  input  config_en,

  output [0:0] out,

  input  rst,

  input  track_0_in,

  input  track_0_out,

  input  track_1_in,

  input  track_1_out,

  input  track_2_in,

  input  track_2_out,

  input  track_3_in,

  input  track_3_out

);

  //Wire declarations for instance 'inst0' (Module Register32CER)

  wire  inst0__CE;

  wire  inst0__CLK;

  wire [31:0] inst0__I;

  wire [31:0] inst0__O;

  wire  inst0__RESET;

  Register32CER inst0(

    .CE(inst0__CE),

    .CLK(inst0__CLK),

    .I(inst0__I),

    .O(inst0__O),

    .RESET(inst0__RESET)

  );



  //Wire declarations for instance 'inst1' (Module Invert1_wrapped)

  wire [0:0] inst1__I;

  wire [0:0] inst1__O;

  Invert1_wrapped inst1(

    .I(inst1__I),

    .O(inst1__O)

  );



  //Wire declarations for instance 'inst2' (Module Mux8x1)

  wire [0:0] inst2__I0;

  wire [0:0] inst2__I1;

  wire [0:0] inst2__I2;

  wire [0:0] inst2__I3;

  wire [0:0] inst2__I4;

  wire [0:0] inst2__I5;

  wire [0:0] inst2__I6;

  wire [0:0] inst2__I7;

  wire [0:0] inst2__O;

  wire [2:0] inst2__S;

  Mux8x1 inst2(

    .I0(inst2__I0),

    .I1(inst2__I1),

    .I2(inst2__I2),

    .I3(inst2__I3),

    .I4(inst2__I4),

    .I5(inst2__I5),

    .I6(inst2__I6),

    .I7(inst2__I7),

    .O(inst2__O),

    .S(inst2__S)

  );



  //All the connections

  assign inst0__CE = config_en;

  assign inst0__CLK = clk;

  assign inst0__I[31:0] = config_data[31:0];

  assign inst2__S[0] = inst0__O[0];

  assign inst2__S[1] = inst0__O[1];

  assign inst2__S[2] = inst0__O[2];

  assign inst0__RESET = inst1__O[0];

  assign inst1__I[0] = rst;

  assign inst2__I0[0] = track_0_in;

  assign inst2__I1[0] = track_1_in;

  assign inst2__I2[0] = track_2_in;

  assign inst2__I3[0] = track_3_in;

  assign inst2__I4[0] = track_0_out;

  assign inst2__I5[0] = track_1_out;

  assign inst2__I6[0] = track_2_out;

  assign inst2__I7[0] = track_3_out;

  assign out[0:0] = inst2__O[0:0];



endmodule //connect_box

// End of module

module configurable_logic_block (

  input  clk,

  input [31:0] config_data,

  input  config_en,

  input [0:0] operand0,

  input [0:0] operand1,

  output [0:0] result,

  input  rst

);

  //Wire declarations for instance 'inst0' (Module Register32CER)

  wire  inst0__CE;

  wire  inst0__CLK;

  wire [31:0] inst0__I;

  wire [31:0] inst0__O;

  wire  inst0__RESET;

  Register32CER inst0(

    .CE(inst0__CE),

    .CLK(inst0__CLK),

    .I(inst0__I),

    .O(inst0__O),

    .RESET(inst0__RESET)

  );



  //Wire declarations for instance 'inst1' (Module Invert1_wrapped)

  wire [0:0] inst1__I;

  wire [0:0] inst1__O;

  Invert1_wrapped inst1(

    .I(inst1__I),

    .O(inst1__O)

  );



  //Wire declarations for instance 'inst2' (Module and1_wrapped)

  wire [0:0] inst2__I0;

  wire [0:0] inst2__I1;

  wire [0:0] inst2__O;

  and1_wrapped inst2(

    .I0(inst2__I0),

    .I1(inst2__I1),

    .O(inst2__O)

  );



  //Wire declarations for instance 'inst3' (Module or1_wrapped)

  wire [0:0] inst3__I0;

  wire [0:0] inst3__I1;

  wire [0:0] inst3__O;

  or1_wrapped inst3(

    .I0(inst3__I0),

    .I1(inst3__I1),

    .O(inst3__O)

  );



  //Wire declarations for instance 'inst4' (Module xor1_wrapped)

  wire [0:0] inst4__I0;

  wire [0:0] inst4__I1;

  wire [0:0] inst4__O;

  xor1_wrapped inst4(

    .I0(inst4__I0),

    .I1(inst4__I1),

    .O(inst4__O)

  );



  //Wire declarations for instance 'inst5' (Module Invert1_wrapped)

  wire [0:0] inst5__I;

  wire [0:0] inst5__O;

  Invert1_wrapped inst5(

    .I(inst5__I),

    .O(inst5__O)

  );



  //Wire declarations for instance 'inst6' (Module Mux4x1)

  wire [0:0] inst6__I0;

  wire [0:0] inst6__I1;

  wire [0:0] inst6__I2;

  wire [0:0] inst6__I3;

  wire [0:0] inst6__O;

  wire [1:0] inst6__S;

  Mux4x1 inst6(

    .I0(inst6__I0),

    .I1(inst6__I1),

    .I2(inst6__I2),

    .I3(inst6__I3),

    .O(inst6__O),

    .S(inst6__S)

  );



  //All the connections

  assign inst0__CE = config_en;

  assign inst0__CLK = clk;

  assign inst0__I[31:0] = config_data[31:0];

  assign inst6__S[0] = inst0__O[0];

  assign inst6__S[1] = inst0__O[1];

  assign inst0__RESET = inst1__O[0];

  assign inst1__I[0] = rst;

  assign inst2__I0[0:0] = operand0[0:0];

  assign inst3__I0[0:0] = operand0[0:0];

  assign inst4__I0[0:0] = operand0[0:0];

  assign inst5__I[0:0] = operand0[0:0];

  assign inst2__I1[0:0] = operand1[0:0];

  assign inst3__I1[0:0] = operand1[0:0];

  assign inst4__I1[0:0] = operand1[0:0];

  assign inst6__I0[0:0] = inst2__O[0:0];

  assign inst6__I1[0:0] = inst3__O[0:0];

  assign inst6__I2[0:0] = inst4__O[0:0];

  assign inst6__I3[0:0] = inst5__O[0:0];

  assign result[0:0] = inst6__O[0:0];



endmodule //configurable_logic_block

// End of module

module pe_tile (

  input [0:0] clb_result,

  input  clk,

  input [31:0] config_addr,

  input [31:0] config_data,

  input  rst,

  input [0:0] side_0_track_0_in,

  output [0:0] side_0_track_0_out,

  input [0:0] side_0_track_1_in,

  output [0:0] side_0_track_1_out,

  input [0:0] side_0_track_2_in,

  output [0:0] side_0_track_2_out,

  input [0:0] side_0_track_3_in,

  output [0:0] side_0_track_3_out,

  input [0:0] side_1_track_0_in,

  output [0:0] side_1_track_0_out,

  input [0:0] side_1_track_1_in,

  output [0:0] side_1_track_1_out,

  input [0:0] side_1_track_2_in,

  output [0:0] side_1_track_2_out,

  input [0:0] side_1_track_3_in,

  output [0:0] side_1_track_3_out,

  input [0:0] side_2_track_0_in,

  output [0:0] side_2_track_0_out,

  input [0:0] side_2_track_1_in,

  output [0:0] side_2_track_1_out,

  input [0:0] side_2_track_2_in,

  output [0:0] side_2_track_2_out,

  input [0:0] side_2_track_3_in,

  output [0:0] side_2_track_3_out,

  input [0:0] side_3_track_0_in,

  output [0:0] side_3_track_0_out,

  input [0:0] side_3_track_1_in,

  output [0:0] side_3_track_1_out,

  input [0:0] side_3_track_2_in,

  output [0:0] side_3_track_2_out,

  input [0:0] side_3_track_3_in,

  output [0:0] side_3_track_3_out,

  input [15:0] tile_id

);

  //Wire declarations for instance 'bit_const_GND' (Module corebit_const)

  wire  bit_const_GND__out;

  corebit_const #(.value(0)) bit_const_GND(

    .out(bit_const_GND__out)

  );



  //Wire declarations for instance 'bit_const_VCC' (Module corebit_const)

  wire  bit_const_VCC__out;

  corebit_const #(.value(1)) bit_const_VCC(

    .out(bit_const_VCC__out)

  );



  //Wire declarations for instance 'inst0' (Module Register32CER)

  wire  inst0__CE;

  wire  inst0__CLK;

  wire [31:0] inst0__I;

  wire [31:0] inst0__O;

  wire  inst0__RESET;

  Register32CER inst0(

    .CE(inst0__CE),

    .CLK(inst0__CLK),

    .I(inst0__I),

    .O(inst0__O),

    .RESET(inst0__RESET)

  );



  //Wire declarations for instance 'inst1' (Module EQ16)

  wire [15:0] inst1__I0;

  wire [15:0] inst1__I1;

  wire  inst1__O;

  EQ16 inst1(

    .I0(inst1__I0),

    .I1(inst1__I1),

    .O(inst1__O)

  );



  //Wire declarations for instance 'inst10' (Module and1_wrapped)

  wire [0:0] inst10__I0;

  wire [0:0] inst10__I1;

  wire [0:0] inst10__O;

  and1_wrapped inst10(

    .I0(inst10__I0),

    .I1(inst10__I1),

    .O(inst10__O)

  );



  //Wire declarations for instance 'inst11' (Module connect_box)

  wire  inst11__clk;

  wire [31:0] inst11__config_data;

  wire  inst11__config_en;

  wire [0:0] inst11__out;

  wire  inst11__rst;

  wire  inst11__track_0_in;

  wire  inst11__track_0_out;

  wire  inst11__track_1_in;

  wire  inst11__track_1_out;

  wire  inst11__track_2_in;

  wire  inst11__track_2_out;

  wire  inst11__track_3_in;

  wire  inst11__track_3_out;

  connect_box inst11(

    .clk(inst11__clk),

    .config_data(inst11__config_data),

    .config_en(inst11__config_en),

    .out(inst11__out),

    .rst(inst11__rst),

    .track_0_in(inst11__track_0_in),

    .track_0_out(inst11__track_0_out),

    .track_1_in(inst11__track_1_in),

    .track_1_out(inst11__track_1_out),

    .track_2_in(inst11__track_2_in),

    .track_2_out(inst11__track_2_out),

    .track_3_in(inst11__track_3_in),

    .track_3_out(inst11__track_3_out)

  );



  //Wire declarations for instance 'inst12' (Module connect_box)

  wire  inst12__clk;

  wire [31:0] inst12__config_data;

  wire  inst12__config_en;

  wire [0:0] inst12__out;

  wire  inst12__rst;

  wire  inst12__track_0_in;

  wire  inst12__track_0_out;

  wire  inst12__track_1_in;

  wire  inst12__track_1_out;

  wire  inst12__track_2_in;

  wire  inst12__track_2_out;

  wire  inst12__track_3_in;

  wire  inst12__track_3_out;

  connect_box inst12(

    .clk(inst12__clk),

    .config_data(inst12__config_data),

    .config_en(inst12__config_en),

    .out(inst12__out),

    .rst(inst12__rst),

    .track_0_in(inst12__track_0_in),

    .track_0_out(inst12__track_0_out),

    .track_1_in(inst12__track_1_in),

    .track_1_out(inst12__track_1_out),

    .track_2_in(inst12__track_2_in),

    .track_2_out(inst12__track_2_out),

    .track_3_in(inst12__track_3_in),

    .track_3_out(inst12__track_3_out)

  );



  //Wire declarations for instance 'inst13' (Module configurable_logic_block)

  wire  inst13__clk;

  wire [31:0] inst13__config_data;

  wire  inst13__config_en;

  wire [0:0] inst13__operand0;

  wire [0:0] inst13__operand1;

  wire [0:0] inst13__result;

  wire  inst13__rst;

  configurable_logic_block inst13(

    .clk(inst13__clk),

    .config_data(inst13__config_data),

    .config_en(inst13__config_en),

    .operand0(inst13__operand0),

    .operand1(inst13__operand1),

    .result(inst13__result),

    .rst(inst13__rst)

  );



  //Wire declarations for instance 'inst14' (Module switch_box)

  wire [0:0] inst14__clb_result;

  wire  inst14__clk;

  wire [31:0] inst14__config_data;

  wire  inst14__config_en;

  wire  inst14__rst;

  wire [0:0] inst14__side_0_track_0_in;

  wire [0:0] inst14__side_0_track_0_out;

  wire [0:0] inst14__side_0_track_1_in;

  wire [0:0] inst14__side_0_track_1_out;

  wire [0:0] inst14__side_0_track_2_in;

  wire [0:0] inst14__side_0_track_2_out;

  wire [0:0] inst14__side_0_track_3_in;

  wire [0:0] inst14__side_0_track_3_out;

  wire [0:0] inst14__side_1_track_0_in;

  wire [0:0] inst14__side_1_track_0_out;

  wire [0:0] inst14__side_1_track_1_in;

  wire [0:0] inst14__side_1_track_1_out;

  wire [0:0] inst14__side_1_track_2_in;

  wire [0:0] inst14__side_1_track_2_out;

  wire [0:0] inst14__side_1_track_3_in;

  wire [0:0] inst14__side_1_track_3_out;

  wire [0:0] inst14__side_2_track_0_in;

  wire [0:0] inst14__side_2_track_0_out;

  wire [0:0] inst14__side_2_track_1_in;

  wire [0:0] inst14__side_2_track_1_out;

  wire [0:0] inst14__side_2_track_2_in;

  wire [0:0] inst14__side_2_track_2_out;

  wire [0:0] inst14__side_2_track_3_in;

  wire [0:0] inst14__side_2_track_3_out;

  wire [0:0] inst14__side_3_track_0_in;

  wire [0:0] inst14__side_3_track_0_out;

  wire [0:0] inst14__side_3_track_1_in;

  wire [0:0] inst14__side_3_track_1_out;

  wire [0:0] inst14__side_3_track_2_in;

  wire [0:0] inst14__side_3_track_2_out;

  wire [0:0] inst14__side_3_track_3_in;

  wire [0:0] inst14__side_3_track_3_out;

  switch_box inst14(

    .clb_result(inst14__clb_result),

    .clk(inst14__clk),

    .config_data(inst14__config_data),

    .config_en(inst14__config_en),

    .rst(inst14__rst),

    .side_0_track_0_in(inst14__side_0_track_0_in),

    .side_0_track_0_out(inst14__side_0_track_0_out),

    .side_0_track_1_in(inst14__side_0_track_1_in),

    .side_0_track_1_out(inst14__side_0_track_1_out),

    .side_0_track_2_in(inst14__side_0_track_2_in),

    .side_0_track_2_out(inst14__side_0_track_2_out),

    .side_0_track_3_in(inst14__side_0_track_3_in),

    .side_0_track_3_out(inst14__side_0_track_3_out),

    .side_1_track_0_in(inst14__side_1_track_0_in),

    .side_1_track_0_out(inst14__side_1_track_0_out),

    .side_1_track_1_in(inst14__side_1_track_1_in),

    .side_1_track_1_out(inst14__side_1_track_1_out),

    .side_1_track_2_in(inst14__side_1_track_2_in),

    .side_1_track_2_out(inst14__side_1_track_2_out),

    .side_1_track_3_in(inst14__side_1_track_3_in),

    .side_1_track_3_out(inst14__side_1_track_3_out),

    .side_2_track_0_in(inst14__side_2_track_0_in),

    .side_2_track_0_out(inst14__side_2_track_0_out),

    .side_2_track_1_in(inst14__side_2_track_1_in),

    .side_2_track_1_out(inst14__side_2_track_1_out),

    .side_2_track_2_in(inst14__side_2_track_2_in),

    .side_2_track_2_out(inst14__side_2_track_2_out),

    .side_2_track_3_in(inst14__side_2_track_3_in),

    .side_2_track_3_out(inst14__side_2_track_3_out),

    .side_3_track_0_in(inst14__side_3_track_0_in),

    .side_3_track_0_out(inst14__side_3_track_0_out),

    .side_3_track_1_in(inst14__side_3_track_1_in),

    .side_3_track_1_out(inst14__side_3_track_1_out),

    .side_3_track_2_in(inst14__side_3_track_2_in),

    .side_3_track_2_out(inst14__side_3_track_2_out),

    .side_3_track_3_in(inst14__side_3_track_3_in),

    .side_3_track_3_out(inst14__side_3_track_3_out)

  );



  //Wire declarations for instance 'inst2' (Module Invert1_wrapped)

  wire [0:0] inst2__I;

  wire [0:0] inst2__O;

  Invert1_wrapped inst2(

    .I(inst2__I),

    .O(inst2__O)

  );



  //Wire declarations for instance 'inst3' (Module EQ16)

  wire [15:0] inst3__I0;

  wire [15:0] inst3__I1;

  wire  inst3__O;

  EQ16 inst3(

    .I0(inst3__I0),

    .I1(inst3__I1),

    .O(inst3__O)

  );



  //Wire declarations for instance 'inst4' (Module EQ16)

  wire [15:0] inst4__I0;

  wire [15:0] inst4__I1;

  wire  inst4__O;

  EQ16 inst4(

    .I0(inst4__I0),

    .I1(inst4__I1),

    .O(inst4__O)

  );



  //Wire declarations for instance 'inst5' (Module EQ16)

  wire [15:0] inst5__I0;

  wire [15:0] inst5__I1;

  wire  inst5__O;

  EQ16 inst5(

    .I0(inst5__I0),

    .I1(inst5__I1),

    .O(inst5__O)

  );



  //Wire declarations for instance 'inst6' (Module EQ16)

  wire [15:0] inst6__I0;

  wire [15:0] inst6__I1;

  wire  inst6__O;

  EQ16 inst6(

    .I0(inst6__I0),

    .I1(inst6__I1),

    .O(inst6__O)

  );



  //Wire declarations for instance 'inst7' (Module and1_wrapped)

  wire [0:0] inst7__I0;

  wire [0:0] inst7__I1;

  wire [0:0] inst7__O;

  and1_wrapped inst7(

    .I0(inst7__I0),

    .I1(inst7__I1),

    .O(inst7__O)

  );



  //Wire declarations for instance 'inst8' (Module and1_wrapped)

  wire [0:0] inst8__I0;

  wire [0:0] inst8__I1;

  wire [0:0] inst8__O;

  and1_wrapped inst8(

    .I0(inst8__I0),

    .I1(inst8__I1),

    .O(inst8__O)

  );



  //Wire declarations for instance 'inst9' (Module and1_wrapped)

  wire [0:0] inst9__I0;

  wire [0:0] inst9__I1;

  wire [0:0] inst9__O;

  and1_wrapped inst9(

    .I0(inst9__I0),

    .I1(inst9__I1),

    .O(inst9__O)

  );



  //All the connections

  assign inst3__I0[0] = bit_const_GND__out;

  assign inst3__I0[10] = bit_const_GND__out;

  assign inst3__I0[11] = bit_const_GND__out;

  assign inst3__I0[12] = bit_const_GND__out;

  assign inst3__I0[13] = bit_const_GND__out;

  assign inst3__I0[14] = bit_const_GND__out;

  assign inst3__I0[15] = bit_const_GND__out;

  assign inst3__I0[1] = bit_const_GND__out;

  assign inst3__I0[3] = bit_const_GND__out;

  assign inst3__I0[4] = bit_const_GND__out;

  assign inst3__I0[5] = bit_const_GND__out;

  assign inst3__I0[6] = bit_const_GND__out;

  assign inst3__I0[7] = bit_const_GND__out;

  assign inst3__I0[8] = bit_const_GND__out;

  assign inst3__I0[9] = bit_const_GND__out;

  assign inst4__I0[10] = bit_const_GND__out;

  assign inst4__I0[11] = bit_const_GND__out;

  assign inst4__I0[12] = bit_const_GND__out;

  assign inst4__I0[13] = bit_const_GND__out;

  assign inst4__I0[14] = bit_const_GND__out;

  assign inst4__I0[15] = bit_const_GND__out;

  assign inst4__I0[1] = bit_const_GND__out;

  assign inst4__I0[3] = bit_const_GND__out;

  assign inst4__I0[4] = bit_const_GND__out;

  assign inst4__I0[5] = bit_const_GND__out;

  assign inst4__I0[6] = bit_const_GND__out;

  assign inst4__I0[7] = bit_const_GND__out;

  assign inst4__I0[8] = bit_const_GND__out;

  assign inst4__I0[9] = bit_const_GND__out;

  assign inst5__I0[10] = bit_const_GND__out;

  assign inst5__I0[11] = bit_const_GND__out;

  assign inst5__I0[12] = bit_const_GND__out;

  assign inst5__I0[13] = bit_const_GND__out;

  assign inst5__I0[14] = bit_const_GND__out;

  assign inst5__I0[15] = bit_const_GND__out;

  assign inst5__I0[3] = bit_const_GND__out;

  assign inst5__I0[4] = bit_const_GND__out;

  assign inst5__I0[5] = bit_const_GND__out;

  assign inst5__I0[6] = bit_const_GND__out;

  assign inst5__I0[7] = bit_const_GND__out;

  assign inst5__I0[8] = bit_const_GND__out;

  assign inst5__I0[9] = bit_const_GND__out;

  assign inst6__I0[0] = bit_const_GND__out;

  assign inst6__I0[10] = bit_const_GND__out;

  assign inst6__I0[11] = bit_const_GND__out;

  assign inst6__I0[12] = bit_const_GND__out;

  assign inst6__I0[13] = bit_const_GND__out;

  assign inst6__I0[14] = bit_const_GND__out;

  assign inst6__I0[15] = bit_const_GND__out;

  assign inst6__I0[3] = bit_const_GND__out;

  assign inst6__I0[4] = bit_const_GND__out;

  assign inst6__I0[5] = bit_const_GND__out;

  assign inst6__I0[6] = bit_const_GND__out;

  assign inst6__I0[7] = bit_const_GND__out;

  assign inst6__I0[8] = bit_const_GND__out;

  assign inst6__I0[9] = bit_const_GND__out;

  assign inst3__I0[2] = bit_const_VCC__out;

  assign inst4__I0[0] = bit_const_VCC__out;

  assign inst4__I0[2] = bit_const_VCC__out;

  assign inst5__I0[0] = bit_const_VCC__out;

  assign inst5__I0[1] = bit_const_VCC__out;

  assign inst5__I0[2] = bit_const_VCC__out;

  assign inst6__I0[1] = bit_const_VCC__out;

  assign inst6__I0[2] = bit_const_VCC__out;

  assign inst0__CE = inst1__O;

  assign inst10__I1[0] = inst1__O;

  assign inst7__I1[0] = inst1__O;

  assign inst8__I1[0] = inst1__O;

  assign inst9__I1[0] = inst1__O;

  assign inst0__CLK = clk;

  assign inst11__clk = clk;

  assign inst12__clk = clk;

  assign inst13__clk = clk;

  assign inst14__clk = clk;

  assign inst0__I[31:0] = config_data[31:0];

  assign inst11__config_data[31:0] = config_data[31:0];

  assign inst12__config_data[31:0] = config_data[31:0];

  assign inst13__config_data[31:0] = config_data[31:0];

  assign inst14__config_data[31:0] = config_data[31:0];

  assign inst0__RESET = inst2__O[0];

  assign inst1__I0[0] = config_addr[0];

  assign inst1__I0[10] = config_addr[10];

  assign inst1__I0[11] = config_addr[11];

  assign inst1__I0[12] = config_addr[12];

  assign inst1__I0[13] = config_addr[13];

  assign inst1__I0[14] = config_addr[14];

  assign inst1__I0[15] = config_addr[15];

  assign inst1__I0[1] = config_addr[1];

  assign inst1__I0[2] = config_addr[2];

  assign inst1__I0[3] = config_addr[3];

  assign inst1__I0[4] = config_addr[4];

  assign inst1__I0[5] = config_addr[5];

  assign inst1__I0[6] = config_addr[6];

  assign inst1__I0[7] = config_addr[7];

  assign inst1__I0[8] = config_addr[8];

  assign inst1__I0[9] = config_addr[9];

  assign inst1__I1[15:0] = tile_id[15:0];

  assign inst10__I0[0] = inst6__O;

  assign inst14__config_en = inst10__O[0];

  assign inst11__config_en = inst7__O[0];

  assign inst13__operand0[0:0] = inst11__out[0:0];

  assign inst11__rst = rst;

  assign inst12__rst = rst;

  assign inst13__rst = rst;

  assign inst14__rst = rst;

  assign inst2__I[0] = rst;

  assign inst14__side_0_track_0_in[0:0] = side_0_track_0_in[0:0];

  assign inst11__track_0_in = side_0_track_0_in[0];

  assign side_0_track_0_out[0:0] = inst14__side_0_track_0_out[0:0];

  assign inst11__track_0_out = inst14__side_0_track_0_out[0];

  assign inst14__side_0_track_1_in[0:0] = side_0_track_1_in[0:0];

  assign inst11__track_1_in = side_0_track_1_in[0];

  assign side_0_track_1_out[0:0] = inst14__side_0_track_1_out[0:0];

  assign inst11__track_1_out = inst14__side_0_track_1_out[0];

  assign inst14__side_0_track_2_in[0:0] = side_0_track_2_in[0:0];

  assign inst11__track_2_in = side_0_track_2_in[0];

  assign side_0_track_2_out[0:0] = inst14__side_0_track_2_out[0:0];

  assign inst11__track_2_out = inst14__side_0_track_2_out[0];

  assign inst14__side_0_track_3_in[0:0] = side_0_track_3_in[0:0];

  assign inst11__track_3_in = side_0_track_3_in[0];

  assign side_0_track_3_out[0:0] = inst14__side_0_track_3_out[0:0];

  assign inst11__track_3_out = inst14__side_0_track_3_out[0];

  assign inst12__config_en = inst8__O[0];

  assign inst13__operand1[0:0] = inst12__out[0:0];

  assign inst14__side_1_track_0_in[0:0] = side_1_track_0_in[0:0];

  assign inst12__track_0_in = side_1_track_0_in[0];

  assign side_1_track_0_out[0:0] = inst14__side_1_track_0_out[0:0];

  assign inst12__track_0_out = inst14__side_1_track_0_out[0];

  assign inst14__side_1_track_1_in[0:0] = side_1_track_1_in[0:0];

  assign inst12__track_1_in = side_1_track_1_in[0];

  assign side_1_track_1_out[0:0] = inst14__side_1_track_1_out[0:0];

  assign inst12__track_1_out = inst14__side_1_track_1_out[0];

  assign inst14__side_1_track_2_in[0:0] = side_1_track_2_in[0:0];

  assign inst12__track_2_in = side_1_track_2_in[0];

  assign side_1_track_2_out[0:0] = inst14__side_1_track_2_out[0:0];

  assign inst12__track_2_out = inst14__side_1_track_2_out[0];

  assign inst14__side_1_track_3_in[0:0] = side_1_track_3_in[0:0];

  assign inst12__track_3_in = side_1_track_3_in[0];

  assign side_1_track_3_out[0:0] = inst14__side_1_track_3_out[0:0];

  assign inst12__track_3_out = inst14__side_1_track_3_out[0];

  assign inst13__config_en = inst9__O[0];

  assign inst14__clb_result[0:0] = inst13__result[0:0];

  assign inst14__side_2_track_0_in[0:0] = side_2_track_0_in[0:0];

  assign side_2_track_0_out[0:0] = inst14__side_2_track_0_out[0:0];

  assign inst14__side_2_track_1_in[0:0] = side_2_track_1_in[0:0];

  assign side_2_track_1_out[0:0] = inst14__side_2_track_1_out[0:0];

  assign inst14__side_2_track_2_in[0:0] = side_2_track_2_in[0:0];

  assign side_2_track_2_out[0:0] = inst14__side_2_track_2_out[0:0];

  assign inst14__side_2_track_3_in[0:0] = side_2_track_3_in[0:0];

  assign side_2_track_3_out[0:0] = inst14__side_2_track_3_out[0:0];

  assign inst14__side_3_track_0_in[0:0] = side_3_track_0_in[0:0];

  assign side_3_track_0_out[0:0] = inst14__side_3_track_0_out[0:0];

  assign inst14__side_3_track_1_in[0:0] = side_3_track_1_in[0:0];

  assign side_3_track_1_out[0:0] = inst14__side_3_track_1_out[0:0];

  assign inst14__side_3_track_2_in[0:0] = side_3_track_2_in[0:0];

  assign side_3_track_2_out[0:0] = inst14__side_3_track_2_out[0:0];

  assign inst14__side_3_track_3_in[0:0] = side_3_track_3_in[0:0];

  assign side_3_track_3_out[0:0] = inst14__side_3_track_3_out[0:0];

  assign inst3__I1[0] = config_addr[16];

  assign inst4__I1[0] = config_addr[16];

  assign inst5__I1[0] = config_addr[16];

  assign inst6__I1[0] = config_addr[16];

  assign inst3__I1[10] = config_addr[26];

  assign inst4__I1[10] = config_addr[26];

  assign inst5__I1[10] = config_addr[26];

  assign inst6__I1[10] = config_addr[26];

  assign inst3__I1[11] = config_addr[27];

  assign inst4__I1[11] = config_addr[27];

  assign inst5__I1[11] = config_addr[27];

  assign inst6__I1[11] = config_addr[27];

  assign inst3__I1[12] = config_addr[28];

  assign inst4__I1[12] = config_addr[28];

  assign inst5__I1[12] = config_addr[28];

  assign inst6__I1[12] = config_addr[28];

  assign inst3__I1[13] = config_addr[29];

  assign inst4__I1[13] = config_addr[29];

  assign inst5__I1[13] = config_addr[29];

  assign inst6__I1[13] = config_addr[29];

  assign inst3__I1[14] = config_addr[30];

  assign inst4__I1[14] = config_addr[30];

  assign inst5__I1[14] = config_addr[30];

  assign inst6__I1[14] = config_addr[30];

  assign inst3__I1[15] = config_addr[31];

  assign inst4__I1[15] = config_addr[31];

  assign inst5__I1[15] = config_addr[31];

  assign inst6__I1[15] = config_addr[31];

  assign inst3__I1[1] = config_addr[17];

  assign inst4__I1[1] = config_addr[17];

  assign inst5__I1[1] = config_addr[17];

  assign inst6__I1[1] = config_addr[17];

  assign inst3__I1[2] = config_addr[18];

  assign inst4__I1[2] = config_addr[18];

  assign inst5__I1[2] = config_addr[18];

  assign inst6__I1[2] = config_addr[18];

  assign inst3__I1[3] = config_addr[19];

  assign inst4__I1[3] = config_addr[19];

  assign inst5__I1[3] = config_addr[19];

  assign inst6__I1[3] = config_addr[19];

  assign inst3__I1[4] = config_addr[20];

  assign inst4__I1[4] = config_addr[20];

  assign inst5__I1[4] = config_addr[20];

  assign inst6__I1[4] = config_addr[20];

  assign inst3__I1[5] = config_addr[21];

  assign inst4__I1[5] = config_addr[21];

  assign inst5__I1[5] = config_addr[21];

  assign inst6__I1[5] = config_addr[21];

  assign inst3__I1[6] = config_addr[22];

  assign inst4__I1[6] = config_addr[22];

  assign inst5__I1[6] = config_addr[22];

  assign inst6__I1[6] = config_addr[22];

  assign inst3__I1[7] = config_addr[23];

  assign inst4__I1[7] = config_addr[23];

  assign inst5__I1[7] = config_addr[23];

  assign inst6__I1[7] = config_addr[23];

  assign inst3__I1[8] = config_addr[24];

  assign inst4__I1[8] = config_addr[24];

  assign inst5__I1[8] = config_addr[24];

  assign inst6__I1[8] = config_addr[24];

  assign inst3__I1[9] = config_addr[25];

  assign inst4__I1[9] = config_addr[25];

  assign inst5__I1[9] = config_addr[25];

  assign inst6__I1[9] = config_addr[25];

  assign inst7__I0[0] = inst3__O;

  assign inst8__I0[0] = inst4__O;

  assign inst9__I0[0] = inst5__O;



endmodule //pe_tile

// End of module

