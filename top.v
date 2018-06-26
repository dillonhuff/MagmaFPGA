/* verilator lint_off UNOPTFLAT */
//Module: pullresistor defined externally


module corebit_const #(parameter value=1) (
  output out
);
  assign out = value;

endmodule //corebit_const

module corebit_reg_arst #(parameter arst_posedge=1, parameter clk_posedge=1, parameter init=1) (
  input clk,
  input in,
  input arst,
  output out
);
reg outReg;
wire real_rst;
assign real_rst = arst_posedge ? arst : ~arst;
wire real_clk;
assign real_clk = clk_posedge ? clk : ~clk;
always @(posedge real_clk, posedge real_rst) begin
  if (real_rst) outReg <= init;
  else outReg <= in;
end
assign out = outReg;

endmodule //corebit_reg_arst

module corebit_mux (
  input in0,
  input in1,
  input sel,
  output out
);
  assign out = sel ? in1 : in0;

endmodule //corebit_mux

module coreir_or #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output [width-1:0] out
);
  assign out = in0 | in1;

endmodule //coreir_or

module corebit_reg #(parameter clk_posedge=1, parameter init=1) (
  input clk,
  input in,
  output out
);
reg outReg = init;
always @(posedge clk) begin
  outReg <= in;
end
assign out = outReg;

endmodule //corebit_reg

module corebit_or (
  input in0,
  input in1,
  output out
);
  assign out = in0 | in1;

endmodule //corebit_or

module corebit_concat (
  input in0,
  input in1,
  output [1:0] out
);
  assign out = {in0, in1};

endmodule //corebit_concat

module coreir_mux #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  input sel,
  output [width-1:0] out
);
  assign out = sel ? in1 : in0;

endmodule //coreir_mux

module corebit_term (
  input in
);


endmodule //corebit_term

module corebit_and (
  input in0,
  input in1,
  output out
);
  assign out = in0 & in1;

endmodule //corebit_and

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
  assign O[0:0] = inst0__out[0:0];
  assign inst0__in1[0:0] = I1[0:0];
  assign inst0__in0[0:0] = I0[0:0];

endmodule //or1_wrapped

module corebit_wire (
  input in,
  output out
);
  assign out = in;

endmodule //corebit_wire

module coreir_and #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output [width-1:0] out
);
  assign out = in0 & in1;

endmodule //coreir_and

module corebit_xor (
  input in0,
  input in1,
  output out
);
  assign out = in0 ^ in1;

endmodule //corebit_xor

module corebit_not (
  input in,
  output out
);
  assign out = ~in;

endmodule //corebit_not

module coreir_eq #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output out
);
  assign out = in0 == in1;

endmodule //coreir_eq

module corebit_tribuf (
  input in,
  input en,
  inout out
);
  assign out = en ? in : 1'bz;

endmodule //corebit_tribuf

module coreir_reg #(parameter clk_posedge=1, parameter init=1, parameter width=1) (
  input clk,
  input [width-1:0] in,
  output [width-1:0] out
);
reg [width-1:0] outReg=init;
wire real_clk;
assign real_clk = clk_posedge ? clk : ~clk;
always @(posedge real_clk) begin
  outReg <= in;
end
assign out = outReg;

endmodule //coreir_reg

module reg_U0 #(parameter init=1) (
  input  clk,
  input  en,
  input [0:0] in,
  output [0:0] out
);
  //Wire declarations for instance 'enMux' (Module coreir_mux)
  wire [0:0] enMux__in0;
  wire [0:0] enMux__in1;
  wire [0:0] enMux__out;
  wire  enMux__sel;
  coreir_mux #(.width(1)) enMux(
    .in0(enMux__in0),
    .in1(enMux__in1),
    .out(enMux__out),
    .sel(enMux__sel)
  );

  //Wire declarations for instance 'reg0' (Module coreir_reg)
  wire  reg0__clk;
  wire [0:0] reg0__in;
  wire [0:0] reg0__out;
  coreir_reg #(.clk_posedge(1),.init(init),.width(1)) reg0(
    .clk(reg0__clk),
    .in(reg0__in),
    .out(reg0__out)
  );

  //All the connections
  assign out[0:0] = reg0__out[0:0];
  assign enMux__in0[0:0] = reg0__out[0:0];
  assign reg0__clk = clk;
  assign reg0__in[0:0] = enMux__out[0:0];
  assign enMux__sel = en;
  assign enMux__in1[0:0] = in[0:0];

endmodule //reg_U0

module corebit_ibuf (
  inout in,
  output out
);
  assign out = in;

endmodule //corebit_ibuf

module coreir_xor #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output [width-1:0] out
);
  assign out = in0 ^ in1;

endmodule //coreir_xor

module EQ16 (
  input [15:0] I0,
  input [15:0] I1,
  output  O
);
  //Wire declarations for instance 'inst0' (Module coreir_eq)
  wire [15:0] inst0__in0;
  wire [15:0] inst0__in1;
  wire  inst0__out;
  coreir_eq #(.width(16)) inst0(
    .in0(inst0__in0),
    .in1(inst0__in1),
    .out(inst0__out)
  );

  //All the connections
  assign inst0__in0[15:0] = I0[15:0];
  assign inst0__in1[15:0] = I1[15:0];
  assign O = inst0__out;

endmodule //EQ16

module coreir_not #(parameter width=1) (
  input [width-1:0] in,
  output [width-1:0] out
);
  assign out = ~in;

endmodule //coreir_not

module Invert1_wrapped (
  input [0:0] I,
  output [0:0] O
);
  //Wire declarations for instance 'inst0' (Module coreir_not)
  wire [0:0] inst0__in;
  wire [0:0] inst0__out;
  coreir_not #(.width(1)) inst0(
    .in(inst0__in),
    .out(inst0__out)
  );

  //All the connections
  assign O[0:0] = inst0__out[0:0];
  assign inst0__in[0:0] = I[0:0];

endmodule //Invert1_wrapped

module _Mux2 (
  input [1:0] I,
  output  O,
  input  S
);
  //Wire declarations for instance 'inst0' (Module corebit_mux)
  wire  inst0__in0;
  wire  inst0__in1;
  wire  inst0__out;
  wire  inst0__sel;
  corebit_mux inst0(
    .in0(inst0__in0),
    .in1(inst0__in1),
    .out(inst0__out),
    .sel(inst0__sel)
  );

  //All the connections
  assign inst0__in1 = I[1];
  assign O = inst0__out;
  assign inst0__sel = S;
  assign inst0__in0 = I[0];

endmodule //_Mux2

module _Mux4 (
  input [3:0] I,
  output  O,
  input [1:0] S
);
  //Wire declarations for instance 'inst0' (Module _Mux2)
  wire [1:0] inst0__I;
  wire  inst0__O;
  wire  inst0__S;
  _Mux2 inst0(
    .I(inst0__I),
    .O(inst0__O),
    .S(inst0__S)
  );

  //Wire declarations for instance 'inst1' (Module _Mux2)
  wire [1:0] inst1__I;
  wire  inst1__O;
  wire  inst1__S;
  _Mux2 inst1(
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
  assign inst1__I[1] = I[3];
  assign inst2__I[1] = inst1__O;
  assign inst1__S = S[0];
  assign O = inst2__O;
  assign inst2__S = S[1];
  assign inst0__I[0] = I[0];
  assign inst0__I[1] = I[1];
  assign inst2__I[0] = inst0__O;
  assign inst0__S = S[0];
  assign inst1__I[0] = I[2];

endmodule //_Mux4

module Mux4x1 (
  input [0:0] I0,
  input [0:0] I1,
  input [0:0] I2,
  input [0:0] I3,
  output [0:0] O,
  input [1:0] S
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

  //All the connections
  assign inst0__I[0] = I0[0];
  assign inst0__I[1] = I1[0];
  assign inst0__I[2] = I2[0];
  assign inst0__I[3] = I3[0];
  assign O[0] = inst0__O;
  assign inst0__S[1:0] = S[1:0];

endmodule //Mux4x1

module DFF_init0_has_ceTrue_has_resetTrue (
  input  CE,
  input  CLK,
  input  I,
  output  O,
  input  RESET
);
  //Wire declarations for instance 'bit_const_GND' (Module corebit_const)
  wire  bit_const_GND__out;
  corebit_const #(.value(0)) bit_const_GND(
    .out(bit_const_GND__out)
  );

  //Wire declarations for instance 'inst0' (Module reg_U0)
  wire  inst0__clk;
  wire  inst0__en;
  wire [0:0] inst0__in;
  wire [0:0] inst0__out;
  reg_U0 #(.init(1'b0)) inst0(
    .clk(inst0__clk),
    .en(inst0__en),
    .in(inst0__in),
    .out(inst0__out)
  );

  //Wire declarations for instance 'inst1' (Module _Mux2)
  wire [1:0] inst1__I;
  wire  inst1__O;
  wire  inst1__S;
  _Mux2 inst1(
    .I(inst1__I),
    .O(inst1__O),
    .S(inst1__S)
  );

  //All the connections
  assign inst1__I[1] = bit_const_GND__out;
  assign inst0__clk = CLK;
  assign inst0__en = CE;
  assign inst0__in[0] = inst1__O;
  assign O = inst0__out[0];
  assign inst1__I[0] = I;
  assign inst1__S = RESET;

endmodule //DFF_init0_has_ceTrue_has_resetTrue

module Register32CER (
  input  CE,
  input  CLK,
  input [31:0] I,
  output [31:0] O,
  input  RESET
);
  //Wire declarations for instance 'inst0' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst0__CE;
  wire  inst0__CLK;
  wire  inst0__I;
  wire  inst0__O;
  wire  inst0__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst0(
    .CE(inst0__CE),
    .CLK(inst0__CLK),
    .I(inst0__I),
    .O(inst0__O),
    .RESET(inst0__RESET)
  );

  //Wire declarations for instance 'inst1' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst1__CE;
  wire  inst1__CLK;
  wire  inst1__I;
  wire  inst1__O;
  wire  inst1__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst1(
    .CE(inst1__CE),
    .CLK(inst1__CLK),
    .I(inst1__I),
    .O(inst1__O),
    .RESET(inst1__RESET)
  );

  //Wire declarations for instance 'inst10' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst10__CE;
  wire  inst10__CLK;
  wire  inst10__I;
  wire  inst10__O;
  wire  inst10__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst10(
    .CE(inst10__CE),
    .CLK(inst10__CLK),
    .I(inst10__I),
    .O(inst10__O),
    .RESET(inst10__RESET)
  );

  //Wire declarations for instance 'inst11' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst11__CE;
  wire  inst11__CLK;
  wire  inst11__I;
  wire  inst11__O;
  wire  inst11__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst11(
    .CE(inst11__CE),
    .CLK(inst11__CLK),
    .I(inst11__I),
    .O(inst11__O),
    .RESET(inst11__RESET)
  );

  //Wire declarations for instance 'inst12' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst12__CE;
  wire  inst12__CLK;
  wire  inst12__I;
  wire  inst12__O;
  wire  inst12__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst12(
    .CE(inst12__CE),
    .CLK(inst12__CLK),
    .I(inst12__I),
    .O(inst12__O),
    .RESET(inst12__RESET)
  );

  //Wire declarations for instance 'inst13' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst13__CE;
  wire  inst13__CLK;
  wire  inst13__I;
  wire  inst13__O;
  wire  inst13__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst13(
    .CE(inst13__CE),
    .CLK(inst13__CLK),
    .I(inst13__I),
    .O(inst13__O),
    .RESET(inst13__RESET)
  );

  //Wire declarations for instance 'inst14' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst14__CE;
  wire  inst14__CLK;
  wire  inst14__I;
  wire  inst14__O;
  wire  inst14__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst14(
    .CE(inst14__CE),
    .CLK(inst14__CLK),
    .I(inst14__I),
    .O(inst14__O),
    .RESET(inst14__RESET)
  );

  //Wire declarations for instance 'inst15' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst15__CE;
  wire  inst15__CLK;
  wire  inst15__I;
  wire  inst15__O;
  wire  inst15__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst15(
    .CE(inst15__CE),
    .CLK(inst15__CLK),
    .I(inst15__I),
    .O(inst15__O),
    .RESET(inst15__RESET)
  );

  //Wire declarations for instance 'inst16' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst16__CE;
  wire  inst16__CLK;
  wire  inst16__I;
  wire  inst16__O;
  wire  inst16__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst16(
    .CE(inst16__CE),
    .CLK(inst16__CLK),
    .I(inst16__I),
    .O(inst16__O),
    .RESET(inst16__RESET)
  );

  //Wire declarations for instance 'inst17' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst17__CE;
  wire  inst17__CLK;
  wire  inst17__I;
  wire  inst17__O;
  wire  inst17__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst17(
    .CE(inst17__CE),
    .CLK(inst17__CLK),
    .I(inst17__I),
    .O(inst17__O),
    .RESET(inst17__RESET)
  );

  //Wire declarations for instance 'inst18' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst18__CE;
  wire  inst18__CLK;
  wire  inst18__I;
  wire  inst18__O;
  wire  inst18__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst18(
    .CE(inst18__CE),
    .CLK(inst18__CLK),
    .I(inst18__I),
    .O(inst18__O),
    .RESET(inst18__RESET)
  );

  //Wire declarations for instance 'inst19' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst19__CE;
  wire  inst19__CLK;
  wire  inst19__I;
  wire  inst19__O;
  wire  inst19__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst19(
    .CE(inst19__CE),
    .CLK(inst19__CLK),
    .I(inst19__I),
    .O(inst19__O),
    .RESET(inst19__RESET)
  );

  //Wire declarations for instance 'inst2' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst2__CE;
  wire  inst2__CLK;
  wire  inst2__I;
  wire  inst2__O;
  wire  inst2__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst2(
    .CE(inst2__CE),
    .CLK(inst2__CLK),
    .I(inst2__I),
    .O(inst2__O),
    .RESET(inst2__RESET)
  );

  //Wire declarations for instance 'inst20' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst20__CE;
  wire  inst20__CLK;
  wire  inst20__I;
  wire  inst20__O;
  wire  inst20__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst20(
    .CE(inst20__CE),
    .CLK(inst20__CLK),
    .I(inst20__I),
    .O(inst20__O),
    .RESET(inst20__RESET)
  );

  //Wire declarations for instance 'inst21' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst21__CE;
  wire  inst21__CLK;
  wire  inst21__I;
  wire  inst21__O;
  wire  inst21__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst21(
    .CE(inst21__CE),
    .CLK(inst21__CLK),
    .I(inst21__I),
    .O(inst21__O),
    .RESET(inst21__RESET)
  );

  //Wire declarations for instance 'inst22' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst22__CE;
  wire  inst22__CLK;
  wire  inst22__I;
  wire  inst22__O;
  wire  inst22__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst22(
    .CE(inst22__CE),
    .CLK(inst22__CLK),
    .I(inst22__I),
    .O(inst22__O),
    .RESET(inst22__RESET)
  );

  //Wire declarations for instance 'inst23' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst23__CE;
  wire  inst23__CLK;
  wire  inst23__I;
  wire  inst23__O;
  wire  inst23__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst23(
    .CE(inst23__CE),
    .CLK(inst23__CLK),
    .I(inst23__I),
    .O(inst23__O),
    .RESET(inst23__RESET)
  );

  //Wire declarations for instance 'inst24' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst24__CE;
  wire  inst24__CLK;
  wire  inst24__I;
  wire  inst24__O;
  wire  inst24__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst24(
    .CE(inst24__CE),
    .CLK(inst24__CLK),
    .I(inst24__I),
    .O(inst24__O),
    .RESET(inst24__RESET)
  );

  //Wire declarations for instance 'inst25' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst25__CE;
  wire  inst25__CLK;
  wire  inst25__I;
  wire  inst25__O;
  wire  inst25__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst25(
    .CE(inst25__CE),
    .CLK(inst25__CLK),
    .I(inst25__I),
    .O(inst25__O),
    .RESET(inst25__RESET)
  );

  //Wire declarations for instance 'inst26' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst26__CE;
  wire  inst26__CLK;
  wire  inst26__I;
  wire  inst26__O;
  wire  inst26__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst26(
    .CE(inst26__CE),
    .CLK(inst26__CLK),
    .I(inst26__I),
    .O(inst26__O),
    .RESET(inst26__RESET)
  );

  //Wire declarations for instance 'inst27' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst27__CE;
  wire  inst27__CLK;
  wire  inst27__I;
  wire  inst27__O;
  wire  inst27__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst27(
    .CE(inst27__CE),
    .CLK(inst27__CLK),
    .I(inst27__I),
    .O(inst27__O),
    .RESET(inst27__RESET)
  );

  //Wire declarations for instance 'inst28' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst28__CE;
  wire  inst28__CLK;
  wire  inst28__I;
  wire  inst28__O;
  wire  inst28__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst28(
    .CE(inst28__CE),
    .CLK(inst28__CLK),
    .I(inst28__I),
    .O(inst28__O),
    .RESET(inst28__RESET)
  );

  //Wire declarations for instance 'inst29' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst29__CE;
  wire  inst29__CLK;
  wire  inst29__I;
  wire  inst29__O;
  wire  inst29__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst29(
    .CE(inst29__CE),
    .CLK(inst29__CLK),
    .I(inst29__I),
    .O(inst29__O),
    .RESET(inst29__RESET)
  );

  //Wire declarations for instance 'inst3' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst3__CE;
  wire  inst3__CLK;
  wire  inst3__I;
  wire  inst3__O;
  wire  inst3__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst3(
    .CE(inst3__CE),
    .CLK(inst3__CLK),
    .I(inst3__I),
    .O(inst3__O),
    .RESET(inst3__RESET)
  );

  //Wire declarations for instance 'inst30' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst30__CE;
  wire  inst30__CLK;
  wire  inst30__I;
  wire  inst30__O;
  wire  inst30__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst30(
    .CE(inst30__CE),
    .CLK(inst30__CLK),
    .I(inst30__I),
    .O(inst30__O),
    .RESET(inst30__RESET)
  );

  //Wire declarations for instance 'inst31' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst31__CE;
  wire  inst31__CLK;
  wire  inst31__I;
  wire  inst31__O;
  wire  inst31__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst31(
    .CE(inst31__CE),
    .CLK(inst31__CLK),
    .I(inst31__I),
    .O(inst31__O),
    .RESET(inst31__RESET)
  );

  //Wire declarations for instance 'inst4' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst4__CE;
  wire  inst4__CLK;
  wire  inst4__I;
  wire  inst4__O;
  wire  inst4__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst4(
    .CE(inst4__CE),
    .CLK(inst4__CLK),
    .I(inst4__I),
    .O(inst4__O),
    .RESET(inst4__RESET)
  );

  //Wire declarations for instance 'inst5' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst5__CE;
  wire  inst5__CLK;
  wire  inst5__I;
  wire  inst5__O;
  wire  inst5__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst5(
    .CE(inst5__CE),
    .CLK(inst5__CLK),
    .I(inst5__I),
    .O(inst5__O),
    .RESET(inst5__RESET)
  );

  //Wire declarations for instance 'inst6' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst6__CE;
  wire  inst6__CLK;
  wire  inst6__I;
  wire  inst6__O;
  wire  inst6__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst6(
    .CE(inst6__CE),
    .CLK(inst6__CLK),
    .I(inst6__I),
    .O(inst6__O),
    .RESET(inst6__RESET)
  );

  //Wire declarations for instance 'inst7' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst7__CE;
  wire  inst7__CLK;
  wire  inst7__I;
  wire  inst7__O;
  wire  inst7__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst7(
    .CE(inst7__CE),
    .CLK(inst7__CLK),
    .I(inst7__I),
    .O(inst7__O),
    .RESET(inst7__RESET)
  );

  //Wire declarations for instance 'inst8' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst8__CE;
  wire  inst8__CLK;
  wire  inst8__I;
  wire  inst8__O;
  wire  inst8__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst8(
    .CE(inst8__CE),
    .CLK(inst8__CLK),
    .I(inst8__I),
    .O(inst8__O),
    .RESET(inst8__RESET)
  );

  //Wire declarations for instance 'inst9' (Module DFF_init0_has_ceTrue_has_resetTrue)
  wire  inst9__CE;
  wire  inst9__CLK;
  wire  inst9__I;
  wire  inst9__O;
  wire  inst9__RESET;
  DFF_init0_has_ceTrue_has_resetTrue inst9(
    .CE(inst9__CE),
    .CLK(inst9__CLK),
    .I(inst9__I),
    .O(inst9__O),
    .RESET(inst9__RESET)
  );

  //All the connections
  assign inst0__CE = CE;
  assign inst1__CE = CE;
  assign inst10__CE = CE;
  assign inst11__CE = CE;
  assign inst12__CE = CE;
  assign inst13__CE = CE;
  assign inst14__CE = CE;
  assign inst15__CE = CE;
  assign inst16__CE = CE;
  assign inst17__CE = CE;
  assign inst18__CE = CE;
  assign inst19__CE = CE;
  assign inst2__CE = CE;
  assign inst20__CE = CE;
  assign inst21__CE = CE;
  assign inst22__CE = CE;
  assign inst23__CE = CE;
  assign inst24__CE = CE;
  assign inst25__CE = CE;
  assign inst26__CE = CE;
  assign inst27__CE = CE;
  assign inst28__CE = CE;
  assign inst29__CE = CE;
  assign inst3__CE = CE;
  assign inst30__CE = CE;
  assign inst31__CE = CE;
  assign inst4__CE = CE;
  assign inst5__CE = CE;
  assign inst6__CE = CE;
  assign inst7__CE = CE;
  assign inst8__CE = CE;
  assign inst9__CE = CE;
  assign inst0__CLK = CLK;
  assign inst1__CLK = CLK;
  assign inst10__CLK = CLK;
  assign inst11__CLK = CLK;
  assign inst12__CLK = CLK;
  assign inst13__CLK = CLK;
  assign inst14__CLK = CLK;
  assign inst15__CLK = CLK;
  assign inst16__CLK = CLK;
  assign inst17__CLK = CLK;
  assign inst18__CLK = CLK;
  assign inst19__CLK = CLK;
  assign inst2__CLK = CLK;
  assign inst20__CLK = CLK;
  assign inst21__CLK = CLK;
  assign inst22__CLK = CLK;
  assign inst23__CLK = CLK;
  assign inst24__CLK = CLK;
  assign inst25__CLK = CLK;
  assign inst26__CLK = CLK;
  assign inst27__CLK = CLK;
  assign inst28__CLK = CLK;
  assign inst29__CLK = CLK;
  assign inst3__CLK = CLK;
  assign inst30__CLK = CLK;
  assign inst31__CLK = CLK;
  assign inst4__CLK = CLK;
  assign inst5__CLK = CLK;
  assign inst6__CLK = CLK;
  assign inst7__CLK = CLK;
  assign inst8__CLK = CLK;
  assign inst9__CLK = CLK;
  assign inst0__I = I[0];
  assign O[0] = inst0__O;
  assign inst0__RESET = RESET;
  assign inst1__RESET = RESET;
  assign inst10__RESET = RESET;
  assign inst11__RESET = RESET;
  assign inst12__RESET = RESET;
  assign inst13__RESET = RESET;
  assign inst14__RESET = RESET;
  assign inst15__RESET = RESET;
  assign inst16__RESET = RESET;
  assign inst17__RESET = RESET;
  assign inst18__RESET = RESET;
  assign inst19__RESET = RESET;
  assign inst2__RESET = RESET;
  assign inst20__RESET = RESET;
  assign inst21__RESET = RESET;
  assign inst22__RESET = RESET;
  assign inst23__RESET = RESET;
  assign inst24__RESET = RESET;
  assign inst25__RESET = RESET;
  assign inst26__RESET = RESET;
  assign inst27__RESET = RESET;
  assign inst28__RESET = RESET;
  assign inst29__RESET = RESET;
  assign inst3__RESET = RESET;
  assign inst30__RESET = RESET;
  assign inst31__RESET = RESET;
  assign inst4__RESET = RESET;
  assign inst5__RESET = RESET;
  assign inst6__RESET = RESET;
  assign inst7__RESET = RESET;
  assign inst8__RESET = RESET;
  assign inst9__RESET = RESET;
  assign inst1__I = I[1];
  assign O[1] = inst1__O;
  assign inst10__I = I[10];
  assign O[10] = inst10__O;
  assign inst11__I = I[11];
  assign O[11] = inst11__O;
  assign inst12__I = I[12];
  assign O[12] = inst12__O;
  assign inst13__I = I[13];
  assign O[13] = inst13__O;
  assign inst14__I = I[14];
  assign O[14] = inst14__O;
  assign inst15__I = I[15];
  assign O[15] = inst15__O;
  assign inst16__I = I[16];
  assign O[16] = inst16__O;
  assign inst17__I = I[17];
  assign O[17] = inst17__O;
  assign inst18__I = I[18];
  assign O[18] = inst18__O;
  assign inst19__I = I[19];
  assign O[19] = inst19__O;
  assign inst2__I = I[2];
  assign O[2] = inst2__O;
  assign inst20__I = I[20];
  assign O[20] = inst20__O;
  assign inst21__I = I[21];
  assign O[21] = inst21__O;
  assign inst22__I = I[22];
  assign O[22] = inst22__O;
  assign inst23__I = I[23];
  assign O[23] = inst23__O;
  assign inst24__I = I[24];
  assign O[24] = inst24__O;
  assign inst25__I = I[25];
  assign O[25] = inst25__O;
  assign inst26__I = I[26];
  assign O[26] = inst26__O;
  assign inst27__I = I[27];
  assign O[27] = inst27__O;
  assign inst28__I = I[28];
  assign O[28] = inst28__O;
  assign inst29__I = I[29];
  assign O[29] = inst29__O;
  assign inst3__I = I[3];
  assign O[3] = inst3__O;
  assign inst30__I = I[30];
  assign O[30] = inst30__O;
  assign inst31__I = I[31];
  assign O[31] = inst31__O;
  assign inst4__I = I[4];
  assign O[4] = inst4__O;
  assign inst5__I = I[5];
  assign O[5] = inst5__O;
  assign inst6__I = I[6];
  assign O[6] = inst6__O;
  assign inst7__I = I[7];
  assign O[7] = inst7__O;
  assign inst8__I = I[8];
  assign O[8] = inst8__O;
  assign inst9__I = I[9];
  assign O[9] = inst9__O;

endmodule //Register32CER

module io1out_pad (
  input  clk,
  input [31:0] config_addr,
  input [31:0] config_data,
  input  pin_0,
  input  pin_1,
  input  pin_2,
  input  pin_3,
  input  rst,
  input [15:0] tile_id,
  output [0:0] top_pin
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

  //Wire declarations for instance 'inst2' (Module Invert1_wrapped)
  wire [0:0] inst2__I;
  wire [0:0] inst2__O;
  Invert1_wrapped inst2(
    .I(inst2__I),
    .O(inst2__O)
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

  //All the connections
  assign inst0__CE = inst1__O;
  assign inst0__CLK = clk;
  assign inst0__I[31:0] = config_data[31:0];
  assign inst3__S[0] = inst0__O[0];
  assign inst3__S[1] = inst0__O[1];
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
  assign inst2__I[0] = rst;
  assign inst3__I0[0] = pin_0;
  assign inst3__I1[0] = pin_1;
  assign inst3__I2[0] = pin_2;
  assign inst3__I3[0] = pin_3;
  assign top_pin[0:0] = inst3__O[0:0];

endmodule //io1out_pad

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
  assign O[0:0] = inst0__out[0:0];
  assign inst0__in0[0:0] = I0[0:0];
  assign inst0__in1[0:0] = I1[0:0];

endmodule //and1_wrapped

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

module io1in_pad (
  input  clk,
  output  pin_0,
  output  pin_1,
  output  pin_2,
  output  pin_3,
  input  rst,
  input [0:0] top_pin
);
  //All the connections
  assign pin_3 = top_pin[0];
  assign pin_0 = top_pin[0];
  assign pin_1 = top_pin[0];
  assign pin_2 = top_pin[0];

endmodule //io1in_pad

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
  assign inst14__I1[0:0] = side_1_track_0_in[0:0];
  assign inst14__I2[0:0] = side_2_track_0_in[0:0];
  assign inst2__I2[0:0] = side_2_track_0_in[0:0];
  assign inst6__I2[0:0] = side_2_track_0_in[0:0];
  assign inst14__I3[0:0] = clb_result[0:0];
  assign side_3_track_0_out[0:0] = inst14__O[0:0];
  assign inst15__I0[0:0] = side_0_track_1_in[0:0];
  assign inst15__I1[0:0] = side_1_track_1_in[0:0];
  assign inst15__I2[0:0] = side_2_track_1_in[0:0];
  assign inst3__I2[0:0] = side_2_track_1_in[0:0];
  assign inst7__I2[0:0] = side_2_track_1_in[0:0];
  assign inst15__I3[0:0] = clb_result[0:0];
  assign side_3_track_1_out[0:0] = inst15__O[0:0];
  assign inst16__I0[0:0] = side_0_track_2_in[0:0];
  assign inst16__I1[0:0] = side_1_track_2_in[0:0];
  assign inst16__I2[0:0] = side_2_track_2_in[0:0];
  assign inst4__I2[0:0] = side_2_track_2_in[0:0];
  assign inst8__I2[0:0] = side_2_track_2_in[0:0];
  assign inst16__I3[0:0] = clb_result[0:0];
  assign side_3_track_2_out[0:0] = inst16__O[0:0];
  assign inst17__I0[0:0] = side_0_track_3_in[0:0];
  assign inst17__I1[0:0] = side_1_track_3_in[0:0];
  assign inst17__I2[0:0] = side_2_track_3_in[0:0];
  assign inst5__I2[0:0] = side_2_track_3_in[0:0];
  assign inst9__I2[0:0] = side_2_track_3_in[0:0];
  assign inst17__I3[0:0] = clb_result[0:0];
  assign side_3_track_3_out[0:0] = inst17__O[0:0];
  assign inst2__I0[0:0] = clb_result[0:0];
  assign inst2__I1[0:0] = side_1_track_0_in[0:0];
  assign inst2__I3[0:0] = side_3_track_0_in[0:0];
  assign side_0_track_0_out[0:0] = inst2__O[0:0];
  assign inst3__I0[0:0] = clb_result[0:0];
  assign inst3__I1[0:0] = side_1_track_1_in[0:0];
  assign inst3__I3[0:0] = side_3_track_1_in[0:0];
  assign side_0_track_1_out[0:0] = inst3__O[0:0];
  assign inst4__I0[0:0] = clb_result[0:0];
  assign inst4__I1[0:0] = side_1_track_2_in[0:0];
  assign inst4__I3[0:0] = side_3_track_2_in[0:0];
  assign side_0_track_2_out[0:0] = inst4__O[0:0];
  assign inst5__I0[0:0] = clb_result[0:0];
  assign inst5__I1[0:0] = side_1_track_3_in[0:0];
  assign inst5__I3[0:0] = side_3_track_3_in[0:0];
  assign side_0_track_3_out[0:0] = inst5__O[0:0];
  assign inst6__I0[0:0] = side_0_track_0_in[0:0];
  assign inst6__I1[0:0] = clb_result[0:0];
  assign inst6__I3[0:0] = side_3_track_0_in[0:0];
  assign side_1_track_0_out[0:0] = inst6__O[0:0];
  assign inst7__I0[0:0] = side_0_track_1_in[0:0];
  assign inst7__I1[0:0] = clb_result[0:0];
  assign inst7__I3[0:0] = side_3_track_1_in[0:0];
  assign side_1_track_1_out[0:0] = inst7__O[0:0];
  assign inst8__I0[0:0] = side_0_track_2_in[0:0];
  assign inst8__I1[0:0] = clb_result[0:0];
  assign inst8__I3[0:0] = side_3_track_2_in[0:0];
  assign side_1_track_2_out[0:0] = inst8__O[0:0];
  assign inst9__I0[0:0] = side_0_track_3_in[0:0];
  assign inst9__I1[0:0] = clb_result[0:0];
  assign inst9__I3[0:0] = side_3_track_3_in[0:0];
  assign side_1_track_3_out[0:0] = inst9__O[0:0];
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
  assign inst3__S[0] = inst0__O[2];
  assign inst17__S[0] = inst0__O[30];
  assign inst15__S[1] = inst0__O[27];
  assign inst16__S[0] = inst0__O[28];
  assign inst16__S[1] = inst0__O[29];
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
  assign inst10__I1[0:0] = side_1_track_0_in[0:0];
  assign inst10__I2[0:0] = clb_result[0:0];
  assign inst11__I2[0:0] = clb_result[0:0];
  assign inst12__I2[0:0] = clb_result[0:0];
  assign inst13__I2[0:0] = clb_result[0:0];
  assign inst10__I3[0:0] = side_3_track_0_in[0:0];
  assign side_2_track_0_out[0:0] = inst10__O[0:0];
  assign inst11__I0[0:0] = side_0_track_1_in[0:0];
  assign inst11__I1[0:0] = side_1_track_1_in[0:0];
  assign inst11__I3[0:0] = side_3_track_1_in[0:0];
  assign side_2_track_1_out[0:0] = inst11__O[0:0];
  assign inst12__I0[0:0] = side_0_track_2_in[0:0];
  assign inst12__I1[0:0] = side_1_track_2_in[0:0];
  assign inst12__I3[0:0] = side_3_track_2_in[0:0];
  assign side_2_track_2_out[0:0] = inst12__O[0:0];
  assign inst13__I0[0:0] = side_0_track_3_in[0:0];
  assign inst13__I1[0:0] = side_1_track_3_in[0:0];
  assign inst13__I3[0:0] = side_3_track_3_in[0:0];
  assign side_2_track_3_out[0:0] = inst13__O[0:0];

endmodule //switch_box

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

module pe_tile (
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

module top (
  input  clk,
  input [31:0] config_addr,
  input [31:0] config_data,
  input  in_wire_0,
  input  in_wire_1,
  input  in_wire_2,
  output  out_wire_0,
  output  out_wire_1,
  output  out_wire_2,
  input  reset
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

  //Wire declarations for instance 'inst0' (Module io1in_pad)
  wire  inst0__clk;
  wire  inst0__pin_0;
  wire  inst0__pin_1;
  wire  inst0__pin_2;
  wire  inst0__pin_3;
  wire  inst0__rst;
  wire [0:0] inst0__top_pin;
  io1in_pad inst0(
    .clk(inst0__clk),
    .pin_0(inst0__pin_0),
    .pin_1(inst0__pin_1),
    .pin_2(inst0__pin_2),
    .pin_3(inst0__pin_3),
    .rst(inst0__rst),
    .top_pin(inst0__top_pin)
  );

  //Wire declarations for instance 'inst1' (Module io1in_pad)
  wire  inst1__clk;
  wire  inst1__pin_0;
  wire  inst1__pin_1;
  wire  inst1__pin_2;
  wire  inst1__pin_3;
  wire  inst1__rst;
  wire [0:0] inst1__top_pin;
  io1in_pad inst1(
    .clk(inst1__clk),
    .pin_0(inst1__pin_0),
    .pin_1(inst1__pin_1),
    .pin_2(inst1__pin_2),
    .pin_3(inst1__pin_3),
    .rst(inst1__rst),
    .top_pin(inst1__top_pin)
  );

  //Wire declarations for instance 'inst10' (Module pe_tile)
  wire  inst10__clk;
  wire [31:0] inst10__config_addr;
  wire [31:0] inst10__config_data;
  wire  inst10__rst;
  wire [0:0] inst10__side_0_track_0_in;
  wire [0:0] inst10__side_0_track_0_out;
  wire [0:0] inst10__side_0_track_1_in;
  wire [0:0] inst10__side_0_track_1_out;
  wire [0:0] inst10__side_0_track_2_in;
  wire [0:0] inst10__side_0_track_2_out;
  wire [0:0] inst10__side_0_track_3_in;
  wire [0:0] inst10__side_0_track_3_out;
  wire [0:0] inst10__side_1_track_0_in;
  wire [0:0] inst10__side_1_track_0_out;
  wire [0:0] inst10__side_1_track_1_in;
  wire [0:0] inst10__side_1_track_1_out;
  wire [0:0] inst10__side_1_track_2_in;
  wire [0:0] inst10__side_1_track_2_out;
  wire [0:0] inst10__side_1_track_3_in;
  wire [0:0] inst10__side_1_track_3_out;
  wire [0:0] inst10__side_2_track_0_in;
  wire [0:0] inst10__side_2_track_0_out;
  wire [0:0] inst10__side_2_track_1_in;
  wire [0:0] inst10__side_2_track_1_out;
  wire [0:0] inst10__side_2_track_2_in;
  wire [0:0] inst10__side_2_track_2_out;
  wire [0:0] inst10__side_2_track_3_in;
  wire [0:0] inst10__side_2_track_3_out;
  wire [0:0] inst10__side_3_track_0_in;
  wire [0:0] inst10__side_3_track_0_out;
  wire [0:0] inst10__side_3_track_1_in;
  wire [0:0] inst10__side_3_track_1_out;
  wire [0:0] inst10__side_3_track_2_in;
  wire [0:0] inst10__side_3_track_2_out;
  wire [0:0] inst10__side_3_track_3_in;
  wire [0:0] inst10__side_3_track_3_out;
  wire [15:0] inst10__tile_id;
  pe_tile inst10(
    .clk(inst10__clk),
    .config_addr(inst10__config_addr),
    .config_data(inst10__config_data),
    .rst(inst10__rst),
    .side_0_track_0_in(inst10__side_0_track_0_in),
    .side_0_track_0_out(inst10__side_0_track_0_out),
    .side_0_track_1_in(inst10__side_0_track_1_in),
    .side_0_track_1_out(inst10__side_0_track_1_out),
    .side_0_track_2_in(inst10__side_0_track_2_in),
    .side_0_track_2_out(inst10__side_0_track_2_out),
    .side_0_track_3_in(inst10__side_0_track_3_in),
    .side_0_track_3_out(inst10__side_0_track_3_out),
    .side_1_track_0_in(inst10__side_1_track_0_in),
    .side_1_track_0_out(inst10__side_1_track_0_out),
    .side_1_track_1_in(inst10__side_1_track_1_in),
    .side_1_track_1_out(inst10__side_1_track_1_out),
    .side_1_track_2_in(inst10__side_1_track_2_in),
    .side_1_track_2_out(inst10__side_1_track_2_out),
    .side_1_track_3_in(inst10__side_1_track_3_in),
    .side_1_track_3_out(inst10__side_1_track_3_out),
    .side_2_track_0_in(inst10__side_2_track_0_in),
    .side_2_track_0_out(inst10__side_2_track_0_out),
    .side_2_track_1_in(inst10__side_2_track_1_in),
    .side_2_track_1_out(inst10__side_2_track_1_out),
    .side_2_track_2_in(inst10__side_2_track_2_in),
    .side_2_track_2_out(inst10__side_2_track_2_out),
    .side_2_track_3_in(inst10__side_2_track_3_in),
    .side_2_track_3_out(inst10__side_2_track_3_out),
    .side_3_track_0_in(inst10__side_3_track_0_in),
    .side_3_track_0_out(inst10__side_3_track_0_out),
    .side_3_track_1_in(inst10__side_3_track_1_in),
    .side_3_track_1_out(inst10__side_3_track_1_out),
    .side_3_track_2_in(inst10__side_3_track_2_in),
    .side_3_track_2_out(inst10__side_3_track_2_out),
    .side_3_track_3_in(inst10__side_3_track_3_in),
    .side_3_track_3_out(inst10__side_3_track_3_out),
    .tile_id(inst10__tile_id)
  );

  //Wire declarations for instance 'inst11' (Module pe_tile)
  wire  inst11__clk;
  wire [31:0] inst11__config_addr;
  wire [31:0] inst11__config_data;
  wire  inst11__rst;
  wire [0:0] inst11__side_0_track_0_in;
  wire [0:0] inst11__side_0_track_0_out;
  wire [0:0] inst11__side_0_track_1_in;
  wire [0:0] inst11__side_0_track_1_out;
  wire [0:0] inst11__side_0_track_2_in;
  wire [0:0] inst11__side_0_track_2_out;
  wire [0:0] inst11__side_0_track_3_in;
  wire [0:0] inst11__side_0_track_3_out;
  wire [0:0] inst11__side_1_track_0_in;
  wire [0:0] inst11__side_1_track_0_out;
  wire [0:0] inst11__side_1_track_1_in;
  wire [0:0] inst11__side_1_track_1_out;
  wire [0:0] inst11__side_1_track_2_in;
  wire [0:0] inst11__side_1_track_2_out;
  wire [0:0] inst11__side_1_track_3_in;
  wire [0:0] inst11__side_1_track_3_out;
  wire [0:0] inst11__side_2_track_0_in;
  wire [0:0] inst11__side_2_track_0_out;
  wire [0:0] inst11__side_2_track_1_in;
  wire [0:0] inst11__side_2_track_1_out;
  wire [0:0] inst11__side_2_track_2_in;
  wire [0:0] inst11__side_2_track_2_out;
  wire [0:0] inst11__side_2_track_3_in;
  wire [0:0] inst11__side_2_track_3_out;
  wire [0:0] inst11__side_3_track_0_in;
  wire [0:0] inst11__side_3_track_0_out;
  wire [0:0] inst11__side_3_track_1_in;
  wire [0:0] inst11__side_3_track_1_out;
  wire [0:0] inst11__side_3_track_2_in;
  wire [0:0] inst11__side_3_track_2_out;
  wire [0:0] inst11__side_3_track_3_in;
  wire [0:0] inst11__side_3_track_3_out;
  wire [15:0] inst11__tile_id;
  pe_tile inst11(
    .clk(inst11__clk),
    .config_addr(inst11__config_addr),
    .config_data(inst11__config_data),
    .rst(inst11__rst),
    .side_0_track_0_in(inst11__side_0_track_0_in),
    .side_0_track_0_out(inst11__side_0_track_0_out),
    .side_0_track_1_in(inst11__side_0_track_1_in),
    .side_0_track_1_out(inst11__side_0_track_1_out),
    .side_0_track_2_in(inst11__side_0_track_2_in),
    .side_0_track_2_out(inst11__side_0_track_2_out),
    .side_0_track_3_in(inst11__side_0_track_3_in),
    .side_0_track_3_out(inst11__side_0_track_3_out),
    .side_1_track_0_in(inst11__side_1_track_0_in),
    .side_1_track_0_out(inst11__side_1_track_0_out),
    .side_1_track_1_in(inst11__side_1_track_1_in),
    .side_1_track_1_out(inst11__side_1_track_1_out),
    .side_1_track_2_in(inst11__side_1_track_2_in),
    .side_1_track_2_out(inst11__side_1_track_2_out),
    .side_1_track_3_in(inst11__side_1_track_3_in),
    .side_1_track_3_out(inst11__side_1_track_3_out),
    .side_2_track_0_in(inst11__side_2_track_0_in),
    .side_2_track_0_out(inst11__side_2_track_0_out),
    .side_2_track_1_in(inst11__side_2_track_1_in),
    .side_2_track_1_out(inst11__side_2_track_1_out),
    .side_2_track_2_in(inst11__side_2_track_2_in),
    .side_2_track_2_out(inst11__side_2_track_2_out),
    .side_2_track_3_in(inst11__side_2_track_3_in),
    .side_2_track_3_out(inst11__side_2_track_3_out),
    .side_3_track_0_in(inst11__side_3_track_0_in),
    .side_3_track_0_out(inst11__side_3_track_0_out),
    .side_3_track_1_in(inst11__side_3_track_1_in),
    .side_3_track_1_out(inst11__side_3_track_1_out),
    .side_3_track_2_in(inst11__side_3_track_2_in),
    .side_3_track_2_out(inst11__side_3_track_2_out),
    .side_3_track_3_in(inst11__side_3_track_3_in),
    .side_3_track_3_out(inst11__side_3_track_3_out),
    .tile_id(inst11__tile_id)
  );

  //Wire declarations for instance 'inst12' (Module pe_tile)
  wire  inst12__clk;
  wire [31:0] inst12__config_addr;
  wire [31:0] inst12__config_data;
  wire  inst12__rst;
  wire [0:0] inst12__side_0_track_0_in;
  wire [0:0] inst12__side_0_track_0_out;
  wire [0:0] inst12__side_0_track_1_in;
  wire [0:0] inst12__side_0_track_1_out;
  wire [0:0] inst12__side_0_track_2_in;
  wire [0:0] inst12__side_0_track_2_out;
  wire [0:0] inst12__side_0_track_3_in;
  wire [0:0] inst12__side_0_track_3_out;
  wire [0:0] inst12__side_1_track_0_in;
  wire [0:0] inst12__side_1_track_0_out;
  wire [0:0] inst12__side_1_track_1_in;
  wire [0:0] inst12__side_1_track_1_out;
  wire [0:0] inst12__side_1_track_2_in;
  wire [0:0] inst12__side_1_track_2_out;
  wire [0:0] inst12__side_1_track_3_in;
  wire [0:0] inst12__side_1_track_3_out;
  wire [0:0] inst12__side_2_track_0_in;
  wire [0:0] inst12__side_2_track_0_out;
  wire [0:0] inst12__side_2_track_1_in;
  wire [0:0] inst12__side_2_track_1_out;
  wire [0:0] inst12__side_2_track_2_in;
  wire [0:0] inst12__side_2_track_2_out;
  wire [0:0] inst12__side_2_track_3_in;
  wire [0:0] inst12__side_2_track_3_out;
  wire [0:0] inst12__side_3_track_0_in;
  wire [0:0] inst12__side_3_track_0_out;
  wire [0:0] inst12__side_3_track_1_in;
  wire [0:0] inst12__side_3_track_1_out;
  wire [0:0] inst12__side_3_track_2_in;
  wire [0:0] inst12__side_3_track_2_out;
  wire [0:0] inst12__side_3_track_3_in;
  wire [0:0] inst12__side_3_track_3_out;
  wire [15:0] inst12__tile_id;
  pe_tile inst12(
    .clk(inst12__clk),
    .config_addr(inst12__config_addr),
    .config_data(inst12__config_data),
    .rst(inst12__rst),
    .side_0_track_0_in(inst12__side_0_track_0_in),
    .side_0_track_0_out(inst12__side_0_track_0_out),
    .side_0_track_1_in(inst12__side_0_track_1_in),
    .side_0_track_1_out(inst12__side_0_track_1_out),
    .side_0_track_2_in(inst12__side_0_track_2_in),
    .side_0_track_2_out(inst12__side_0_track_2_out),
    .side_0_track_3_in(inst12__side_0_track_3_in),
    .side_0_track_3_out(inst12__side_0_track_3_out),
    .side_1_track_0_in(inst12__side_1_track_0_in),
    .side_1_track_0_out(inst12__side_1_track_0_out),
    .side_1_track_1_in(inst12__side_1_track_1_in),
    .side_1_track_1_out(inst12__side_1_track_1_out),
    .side_1_track_2_in(inst12__side_1_track_2_in),
    .side_1_track_2_out(inst12__side_1_track_2_out),
    .side_1_track_3_in(inst12__side_1_track_3_in),
    .side_1_track_3_out(inst12__side_1_track_3_out),
    .side_2_track_0_in(inst12__side_2_track_0_in),
    .side_2_track_0_out(inst12__side_2_track_0_out),
    .side_2_track_1_in(inst12__side_2_track_1_in),
    .side_2_track_1_out(inst12__side_2_track_1_out),
    .side_2_track_2_in(inst12__side_2_track_2_in),
    .side_2_track_2_out(inst12__side_2_track_2_out),
    .side_2_track_3_in(inst12__side_2_track_3_in),
    .side_2_track_3_out(inst12__side_2_track_3_out),
    .side_3_track_0_in(inst12__side_3_track_0_in),
    .side_3_track_0_out(inst12__side_3_track_0_out),
    .side_3_track_1_in(inst12__side_3_track_1_in),
    .side_3_track_1_out(inst12__side_3_track_1_out),
    .side_3_track_2_in(inst12__side_3_track_2_in),
    .side_3_track_2_out(inst12__side_3_track_2_out),
    .side_3_track_3_in(inst12__side_3_track_3_in),
    .side_3_track_3_out(inst12__side_3_track_3_out),
    .tile_id(inst12__tile_id)
  );

  //Wire declarations for instance 'inst13' (Module pe_tile)
  wire  inst13__clk;
  wire [31:0] inst13__config_addr;
  wire [31:0] inst13__config_data;
  wire  inst13__rst;
  wire [0:0] inst13__side_0_track_0_in;
  wire [0:0] inst13__side_0_track_0_out;
  wire [0:0] inst13__side_0_track_1_in;
  wire [0:0] inst13__side_0_track_1_out;
  wire [0:0] inst13__side_0_track_2_in;
  wire [0:0] inst13__side_0_track_2_out;
  wire [0:0] inst13__side_0_track_3_in;
  wire [0:0] inst13__side_0_track_3_out;
  wire [0:0] inst13__side_1_track_0_in;
  wire [0:0] inst13__side_1_track_0_out;
  wire [0:0] inst13__side_1_track_1_in;
  wire [0:0] inst13__side_1_track_1_out;
  wire [0:0] inst13__side_1_track_2_in;
  wire [0:0] inst13__side_1_track_2_out;
  wire [0:0] inst13__side_1_track_3_in;
  wire [0:0] inst13__side_1_track_3_out;
  wire [0:0] inst13__side_2_track_0_in;
  wire [0:0] inst13__side_2_track_0_out;
  wire [0:0] inst13__side_2_track_1_in;
  wire [0:0] inst13__side_2_track_1_out;
  wire [0:0] inst13__side_2_track_2_in;
  wire [0:0] inst13__side_2_track_2_out;
  wire [0:0] inst13__side_2_track_3_in;
  wire [0:0] inst13__side_2_track_3_out;
  wire [0:0] inst13__side_3_track_0_in;
  wire [0:0] inst13__side_3_track_0_out;
  wire [0:0] inst13__side_3_track_1_in;
  wire [0:0] inst13__side_3_track_1_out;
  wire [0:0] inst13__side_3_track_2_in;
  wire [0:0] inst13__side_3_track_2_out;
  wire [0:0] inst13__side_3_track_3_in;
  wire [0:0] inst13__side_3_track_3_out;
  wire [15:0] inst13__tile_id;
  pe_tile inst13(
    .clk(inst13__clk),
    .config_addr(inst13__config_addr),
    .config_data(inst13__config_data),
    .rst(inst13__rst),
    .side_0_track_0_in(inst13__side_0_track_0_in),
    .side_0_track_0_out(inst13__side_0_track_0_out),
    .side_0_track_1_in(inst13__side_0_track_1_in),
    .side_0_track_1_out(inst13__side_0_track_1_out),
    .side_0_track_2_in(inst13__side_0_track_2_in),
    .side_0_track_2_out(inst13__side_0_track_2_out),
    .side_0_track_3_in(inst13__side_0_track_3_in),
    .side_0_track_3_out(inst13__side_0_track_3_out),
    .side_1_track_0_in(inst13__side_1_track_0_in),
    .side_1_track_0_out(inst13__side_1_track_0_out),
    .side_1_track_1_in(inst13__side_1_track_1_in),
    .side_1_track_1_out(inst13__side_1_track_1_out),
    .side_1_track_2_in(inst13__side_1_track_2_in),
    .side_1_track_2_out(inst13__side_1_track_2_out),
    .side_1_track_3_in(inst13__side_1_track_3_in),
    .side_1_track_3_out(inst13__side_1_track_3_out),
    .side_2_track_0_in(inst13__side_2_track_0_in),
    .side_2_track_0_out(inst13__side_2_track_0_out),
    .side_2_track_1_in(inst13__side_2_track_1_in),
    .side_2_track_1_out(inst13__side_2_track_1_out),
    .side_2_track_2_in(inst13__side_2_track_2_in),
    .side_2_track_2_out(inst13__side_2_track_2_out),
    .side_2_track_3_in(inst13__side_2_track_3_in),
    .side_2_track_3_out(inst13__side_2_track_3_out),
    .side_3_track_0_in(inst13__side_3_track_0_in),
    .side_3_track_0_out(inst13__side_3_track_0_out),
    .side_3_track_1_in(inst13__side_3_track_1_in),
    .side_3_track_1_out(inst13__side_3_track_1_out),
    .side_3_track_2_in(inst13__side_3_track_2_in),
    .side_3_track_2_out(inst13__side_3_track_2_out),
    .side_3_track_3_in(inst13__side_3_track_3_in),
    .side_3_track_3_out(inst13__side_3_track_3_out),
    .tile_id(inst13__tile_id)
  );

  //Wire declarations for instance 'inst14' (Module pe_tile)
  wire  inst14__clk;
  wire [31:0] inst14__config_addr;
  wire [31:0] inst14__config_data;
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
  wire [15:0] inst14__tile_id;
  pe_tile inst14(
    .clk(inst14__clk),
    .config_addr(inst14__config_addr),
    .config_data(inst14__config_data),
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
    .side_3_track_3_out(inst14__side_3_track_3_out),
    .tile_id(inst14__tile_id)
  );

  //Wire declarations for instance 'inst2' (Module io1in_pad)
  wire  inst2__clk;
  wire  inst2__pin_0;
  wire  inst2__pin_1;
  wire  inst2__pin_2;
  wire  inst2__pin_3;
  wire  inst2__rst;
  wire [0:0] inst2__top_pin;
  io1in_pad inst2(
    .clk(inst2__clk),
    .pin_0(inst2__pin_0),
    .pin_1(inst2__pin_1),
    .pin_2(inst2__pin_2),
    .pin_3(inst2__pin_3),
    .rst(inst2__rst),
    .top_pin(inst2__top_pin)
  );

  //Wire declarations for instance 'inst3' (Module io1out_pad)
  wire  inst3__clk;
  wire [31:0] inst3__config_addr;
  wire [31:0] inst3__config_data;
  wire  inst3__pin_0;
  wire  inst3__pin_1;
  wire  inst3__pin_2;
  wire  inst3__pin_3;
  wire  inst3__rst;
  wire [15:0] inst3__tile_id;
  wire [0:0] inst3__top_pin;
  io1out_pad inst3(
    .clk(inst3__clk),
    .config_addr(inst3__config_addr),
    .config_data(inst3__config_data),
    .pin_0(inst3__pin_0),
    .pin_1(inst3__pin_1),
    .pin_2(inst3__pin_2),
    .pin_3(inst3__pin_3),
    .rst(inst3__rst),
    .tile_id(inst3__tile_id),
    .top_pin(inst3__top_pin)
  );

  //Wire declarations for instance 'inst4' (Module io1out_pad)
  wire  inst4__clk;
  wire [31:0] inst4__config_addr;
  wire [31:0] inst4__config_data;
  wire  inst4__pin_0;
  wire  inst4__pin_1;
  wire  inst4__pin_2;
  wire  inst4__pin_3;
  wire  inst4__rst;
  wire [15:0] inst4__tile_id;
  wire [0:0] inst4__top_pin;
  io1out_pad inst4(
    .clk(inst4__clk),
    .config_addr(inst4__config_addr),
    .config_data(inst4__config_data),
    .pin_0(inst4__pin_0),
    .pin_1(inst4__pin_1),
    .pin_2(inst4__pin_2),
    .pin_3(inst4__pin_3),
    .rst(inst4__rst),
    .tile_id(inst4__tile_id),
    .top_pin(inst4__top_pin)
  );

  //Wire declarations for instance 'inst5' (Module io1out_pad)
  wire  inst5__clk;
  wire [31:0] inst5__config_addr;
  wire [31:0] inst5__config_data;
  wire  inst5__pin_0;
  wire  inst5__pin_1;
  wire  inst5__pin_2;
  wire  inst5__pin_3;
  wire  inst5__rst;
  wire [15:0] inst5__tile_id;
  wire [0:0] inst5__top_pin;
  io1out_pad inst5(
    .clk(inst5__clk),
    .config_addr(inst5__config_addr),
    .config_data(inst5__config_data),
    .pin_0(inst5__pin_0),
    .pin_1(inst5__pin_1),
    .pin_2(inst5__pin_2),
    .pin_3(inst5__pin_3),
    .rst(inst5__rst),
    .tile_id(inst5__tile_id),
    .top_pin(inst5__top_pin)
  );

  //Wire declarations for instance 'inst6' (Module pe_tile)
  wire  inst6__clk;
  wire [31:0] inst6__config_addr;
  wire [31:0] inst6__config_data;
  wire  inst6__rst;
  wire [0:0] inst6__side_0_track_0_in;
  wire [0:0] inst6__side_0_track_0_out;
  wire [0:0] inst6__side_0_track_1_in;
  wire [0:0] inst6__side_0_track_1_out;
  wire [0:0] inst6__side_0_track_2_in;
  wire [0:0] inst6__side_0_track_2_out;
  wire [0:0] inst6__side_0_track_3_in;
  wire [0:0] inst6__side_0_track_3_out;
  wire [0:0] inst6__side_1_track_0_in;
  wire [0:0] inst6__side_1_track_0_out;
  wire [0:0] inst6__side_1_track_1_in;
  wire [0:0] inst6__side_1_track_1_out;
  wire [0:0] inst6__side_1_track_2_in;
  wire [0:0] inst6__side_1_track_2_out;
  wire [0:0] inst6__side_1_track_3_in;
  wire [0:0] inst6__side_1_track_3_out;
  wire [0:0] inst6__side_2_track_0_in;
  wire [0:0] inst6__side_2_track_0_out;
  wire [0:0] inst6__side_2_track_1_in;
  wire [0:0] inst6__side_2_track_1_out;
  wire [0:0] inst6__side_2_track_2_in;
  wire [0:0] inst6__side_2_track_2_out;
  wire [0:0] inst6__side_2_track_3_in;
  wire [0:0] inst6__side_2_track_3_out;
  wire [0:0] inst6__side_3_track_0_in;
  wire [0:0] inst6__side_3_track_0_out;
  wire [0:0] inst6__side_3_track_1_in;
  wire [0:0] inst6__side_3_track_1_out;
  wire [0:0] inst6__side_3_track_2_in;
  wire [0:0] inst6__side_3_track_2_out;
  wire [0:0] inst6__side_3_track_3_in;
  wire [0:0] inst6__side_3_track_3_out;
  wire [15:0] inst6__tile_id;
  pe_tile inst6(
    .clk(inst6__clk),
    .config_addr(inst6__config_addr),
    .config_data(inst6__config_data),
    .rst(inst6__rst),
    .side_0_track_0_in(inst6__side_0_track_0_in),
    .side_0_track_0_out(inst6__side_0_track_0_out),
    .side_0_track_1_in(inst6__side_0_track_1_in),
    .side_0_track_1_out(inst6__side_0_track_1_out),
    .side_0_track_2_in(inst6__side_0_track_2_in),
    .side_0_track_2_out(inst6__side_0_track_2_out),
    .side_0_track_3_in(inst6__side_0_track_3_in),
    .side_0_track_3_out(inst6__side_0_track_3_out),
    .side_1_track_0_in(inst6__side_1_track_0_in),
    .side_1_track_0_out(inst6__side_1_track_0_out),
    .side_1_track_1_in(inst6__side_1_track_1_in),
    .side_1_track_1_out(inst6__side_1_track_1_out),
    .side_1_track_2_in(inst6__side_1_track_2_in),
    .side_1_track_2_out(inst6__side_1_track_2_out),
    .side_1_track_3_in(inst6__side_1_track_3_in),
    .side_1_track_3_out(inst6__side_1_track_3_out),
    .side_2_track_0_in(inst6__side_2_track_0_in),
    .side_2_track_0_out(inst6__side_2_track_0_out),
    .side_2_track_1_in(inst6__side_2_track_1_in),
    .side_2_track_1_out(inst6__side_2_track_1_out),
    .side_2_track_2_in(inst6__side_2_track_2_in),
    .side_2_track_2_out(inst6__side_2_track_2_out),
    .side_2_track_3_in(inst6__side_2_track_3_in),
    .side_2_track_3_out(inst6__side_2_track_3_out),
    .side_3_track_0_in(inst6__side_3_track_0_in),
    .side_3_track_0_out(inst6__side_3_track_0_out),
    .side_3_track_1_in(inst6__side_3_track_1_in),
    .side_3_track_1_out(inst6__side_3_track_1_out),
    .side_3_track_2_in(inst6__side_3_track_2_in),
    .side_3_track_2_out(inst6__side_3_track_2_out),
    .side_3_track_3_in(inst6__side_3_track_3_in),
    .side_3_track_3_out(inst6__side_3_track_3_out),
    .tile_id(inst6__tile_id)
  );

  //Wire declarations for instance 'inst7' (Module pe_tile)
  wire  inst7__clk;
  wire [31:0] inst7__config_addr;
  wire [31:0] inst7__config_data;
  wire  inst7__rst;
  wire [0:0] inst7__side_0_track_0_in;
  wire [0:0] inst7__side_0_track_0_out;
  wire [0:0] inst7__side_0_track_1_in;
  wire [0:0] inst7__side_0_track_1_out;
  wire [0:0] inst7__side_0_track_2_in;
  wire [0:0] inst7__side_0_track_2_out;
  wire [0:0] inst7__side_0_track_3_in;
  wire [0:0] inst7__side_0_track_3_out;
  wire [0:0] inst7__side_1_track_0_in;
  wire [0:0] inst7__side_1_track_0_out;
  wire [0:0] inst7__side_1_track_1_in;
  wire [0:0] inst7__side_1_track_1_out;
  wire [0:0] inst7__side_1_track_2_in;
  wire [0:0] inst7__side_1_track_2_out;
  wire [0:0] inst7__side_1_track_3_in;
  wire [0:0] inst7__side_1_track_3_out;
  wire [0:0] inst7__side_2_track_0_in;
  wire [0:0] inst7__side_2_track_0_out;
  wire [0:0] inst7__side_2_track_1_in;
  wire [0:0] inst7__side_2_track_1_out;
  wire [0:0] inst7__side_2_track_2_in;
  wire [0:0] inst7__side_2_track_2_out;
  wire [0:0] inst7__side_2_track_3_in;
  wire [0:0] inst7__side_2_track_3_out;
  wire [0:0] inst7__side_3_track_0_in;
  wire [0:0] inst7__side_3_track_0_out;
  wire [0:0] inst7__side_3_track_1_in;
  wire [0:0] inst7__side_3_track_1_out;
  wire [0:0] inst7__side_3_track_2_in;
  wire [0:0] inst7__side_3_track_2_out;
  wire [0:0] inst7__side_3_track_3_in;
  wire [0:0] inst7__side_3_track_3_out;
  wire [15:0] inst7__tile_id;
  pe_tile inst7(
    .clk(inst7__clk),
    .config_addr(inst7__config_addr),
    .config_data(inst7__config_data),
    .rst(inst7__rst),
    .side_0_track_0_in(inst7__side_0_track_0_in),
    .side_0_track_0_out(inst7__side_0_track_0_out),
    .side_0_track_1_in(inst7__side_0_track_1_in),
    .side_0_track_1_out(inst7__side_0_track_1_out),
    .side_0_track_2_in(inst7__side_0_track_2_in),
    .side_0_track_2_out(inst7__side_0_track_2_out),
    .side_0_track_3_in(inst7__side_0_track_3_in),
    .side_0_track_3_out(inst7__side_0_track_3_out),
    .side_1_track_0_in(inst7__side_1_track_0_in),
    .side_1_track_0_out(inst7__side_1_track_0_out),
    .side_1_track_1_in(inst7__side_1_track_1_in),
    .side_1_track_1_out(inst7__side_1_track_1_out),
    .side_1_track_2_in(inst7__side_1_track_2_in),
    .side_1_track_2_out(inst7__side_1_track_2_out),
    .side_1_track_3_in(inst7__side_1_track_3_in),
    .side_1_track_3_out(inst7__side_1_track_3_out),
    .side_2_track_0_in(inst7__side_2_track_0_in),
    .side_2_track_0_out(inst7__side_2_track_0_out),
    .side_2_track_1_in(inst7__side_2_track_1_in),
    .side_2_track_1_out(inst7__side_2_track_1_out),
    .side_2_track_2_in(inst7__side_2_track_2_in),
    .side_2_track_2_out(inst7__side_2_track_2_out),
    .side_2_track_3_in(inst7__side_2_track_3_in),
    .side_2_track_3_out(inst7__side_2_track_3_out),
    .side_3_track_0_in(inst7__side_3_track_0_in),
    .side_3_track_0_out(inst7__side_3_track_0_out),
    .side_3_track_1_in(inst7__side_3_track_1_in),
    .side_3_track_1_out(inst7__side_3_track_1_out),
    .side_3_track_2_in(inst7__side_3_track_2_in),
    .side_3_track_2_out(inst7__side_3_track_2_out),
    .side_3_track_3_in(inst7__side_3_track_3_in),
    .side_3_track_3_out(inst7__side_3_track_3_out),
    .tile_id(inst7__tile_id)
  );

  //Wire declarations for instance 'inst8' (Module pe_tile)
  wire  inst8__clk;
  wire [31:0] inst8__config_addr;
  wire [31:0] inst8__config_data;
  wire  inst8__rst;
  wire [0:0] inst8__side_0_track_0_in;
  wire [0:0] inst8__side_0_track_0_out;
  wire [0:0] inst8__side_0_track_1_in;
  wire [0:0] inst8__side_0_track_1_out;
  wire [0:0] inst8__side_0_track_2_in;
  wire [0:0] inst8__side_0_track_2_out;
  wire [0:0] inst8__side_0_track_3_in;
  wire [0:0] inst8__side_0_track_3_out;
  wire [0:0] inst8__side_1_track_0_in;
  wire [0:0] inst8__side_1_track_0_out;
  wire [0:0] inst8__side_1_track_1_in;
  wire [0:0] inst8__side_1_track_1_out;
  wire [0:0] inst8__side_1_track_2_in;
  wire [0:0] inst8__side_1_track_2_out;
  wire [0:0] inst8__side_1_track_3_in;
  wire [0:0] inst8__side_1_track_3_out;
  wire [0:0] inst8__side_2_track_0_in;
  wire [0:0] inst8__side_2_track_0_out;
  wire [0:0] inst8__side_2_track_1_in;
  wire [0:0] inst8__side_2_track_1_out;
  wire [0:0] inst8__side_2_track_2_in;
  wire [0:0] inst8__side_2_track_2_out;
  wire [0:0] inst8__side_2_track_3_in;
  wire [0:0] inst8__side_2_track_3_out;
  wire [0:0] inst8__side_3_track_0_in;
  wire [0:0] inst8__side_3_track_0_out;
  wire [0:0] inst8__side_3_track_1_in;
  wire [0:0] inst8__side_3_track_1_out;
  wire [0:0] inst8__side_3_track_2_in;
  wire [0:0] inst8__side_3_track_2_out;
  wire [0:0] inst8__side_3_track_3_in;
  wire [0:0] inst8__side_3_track_3_out;
  wire [15:0] inst8__tile_id;
  pe_tile inst8(
    .clk(inst8__clk),
    .config_addr(inst8__config_addr),
    .config_data(inst8__config_data),
    .rst(inst8__rst),
    .side_0_track_0_in(inst8__side_0_track_0_in),
    .side_0_track_0_out(inst8__side_0_track_0_out),
    .side_0_track_1_in(inst8__side_0_track_1_in),
    .side_0_track_1_out(inst8__side_0_track_1_out),
    .side_0_track_2_in(inst8__side_0_track_2_in),
    .side_0_track_2_out(inst8__side_0_track_2_out),
    .side_0_track_3_in(inst8__side_0_track_3_in),
    .side_0_track_3_out(inst8__side_0_track_3_out),
    .side_1_track_0_in(inst8__side_1_track_0_in),
    .side_1_track_0_out(inst8__side_1_track_0_out),
    .side_1_track_1_in(inst8__side_1_track_1_in),
    .side_1_track_1_out(inst8__side_1_track_1_out),
    .side_1_track_2_in(inst8__side_1_track_2_in),
    .side_1_track_2_out(inst8__side_1_track_2_out),
    .side_1_track_3_in(inst8__side_1_track_3_in),
    .side_1_track_3_out(inst8__side_1_track_3_out),
    .side_2_track_0_in(inst8__side_2_track_0_in),
    .side_2_track_0_out(inst8__side_2_track_0_out),
    .side_2_track_1_in(inst8__side_2_track_1_in),
    .side_2_track_1_out(inst8__side_2_track_1_out),
    .side_2_track_2_in(inst8__side_2_track_2_in),
    .side_2_track_2_out(inst8__side_2_track_2_out),
    .side_2_track_3_in(inst8__side_2_track_3_in),
    .side_2_track_3_out(inst8__side_2_track_3_out),
    .side_3_track_0_in(inst8__side_3_track_0_in),
    .side_3_track_0_out(inst8__side_3_track_0_out),
    .side_3_track_1_in(inst8__side_3_track_1_in),
    .side_3_track_1_out(inst8__side_3_track_1_out),
    .side_3_track_2_in(inst8__side_3_track_2_in),
    .side_3_track_2_out(inst8__side_3_track_2_out),
    .side_3_track_3_in(inst8__side_3_track_3_in),
    .side_3_track_3_out(inst8__side_3_track_3_out),
    .tile_id(inst8__tile_id)
  );

  //Wire declarations for instance 'inst9' (Module pe_tile)
  wire  inst9__clk;
  wire [31:0] inst9__config_addr;
  wire [31:0] inst9__config_data;
  wire  inst9__rst;
  wire [0:0] inst9__side_0_track_0_in;
  wire [0:0] inst9__side_0_track_0_out;
  wire [0:0] inst9__side_0_track_1_in;
  wire [0:0] inst9__side_0_track_1_out;
  wire [0:0] inst9__side_0_track_2_in;
  wire [0:0] inst9__side_0_track_2_out;
  wire [0:0] inst9__side_0_track_3_in;
  wire [0:0] inst9__side_0_track_3_out;
  wire [0:0] inst9__side_1_track_0_in;
  wire [0:0] inst9__side_1_track_0_out;
  wire [0:0] inst9__side_1_track_1_in;
  wire [0:0] inst9__side_1_track_1_out;
  wire [0:0] inst9__side_1_track_2_in;
  wire [0:0] inst9__side_1_track_2_out;
  wire [0:0] inst9__side_1_track_3_in;
  wire [0:0] inst9__side_1_track_3_out;
  wire [0:0] inst9__side_2_track_0_in;
  wire [0:0] inst9__side_2_track_0_out;
  wire [0:0] inst9__side_2_track_1_in;
  wire [0:0] inst9__side_2_track_1_out;
  wire [0:0] inst9__side_2_track_2_in;
  wire [0:0] inst9__side_2_track_2_out;
  wire [0:0] inst9__side_2_track_3_in;
  wire [0:0] inst9__side_2_track_3_out;
  wire [0:0] inst9__side_3_track_0_in;
  wire [0:0] inst9__side_3_track_0_out;
  wire [0:0] inst9__side_3_track_1_in;
  wire [0:0] inst9__side_3_track_1_out;
  wire [0:0] inst9__side_3_track_2_in;
  wire [0:0] inst9__side_3_track_2_out;
  wire [0:0] inst9__side_3_track_3_in;
  wire [0:0] inst9__side_3_track_3_out;
  wire [15:0] inst9__tile_id;
  pe_tile inst9(
    .clk(inst9__clk),
    .config_addr(inst9__config_addr),
    .config_data(inst9__config_data),
    .rst(inst9__rst),
    .side_0_track_0_in(inst9__side_0_track_0_in),
    .side_0_track_0_out(inst9__side_0_track_0_out),
    .side_0_track_1_in(inst9__side_0_track_1_in),
    .side_0_track_1_out(inst9__side_0_track_1_out),
    .side_0_track_2_in(inst9__side_0_track_2_in),
    .side_0_track_2_out(inst9__side_0_track_2_out),
    .side_0_track_3_in(inst9__side_0_track_3_in),
    .side_0_track_3_out(inst9__side_0_track_3_out),
    .side_1_track_0_in(inst9__side_1_track_0_in),
    .side_1_track_0_out(inst9__side_1_track_0_out),
    .side_1_track_1_in(inst9__side_1_track_1_in),
    .side_1_track_1_out(inst9__side_1_track_1_out),
    .side_1_track_2_in(inst9__side_1_track_2_in),
    .side_1_track_2_out(inst9__side_1_track_2_out),
    .side_1_track_3_in(inst9__side_1_track_3_in),
    .side_1_track_3_out(inst9__side_1_track_3_out),
    .side_2_track_0_in(inst9__side_2_track_0_in),
    .side_2_track_0_out(inst9__side_2_track_0_out),
    .side_2_track_1_in(inst9__side_2_track_1_in),
    .side_2_track_1_out(inst9__side_2_track_1_out),
    .side_2_track_2_in(inst9__side_2_track_2_in),
    .side_2_track_2_out(inst9__side_2_track_2_out),
    .side_2_track_3_in(inst9__side_2_track_3_in),
    .side_2_track_3_out(inst9__side_2_track_3_out),
    .side_3_track_0_in(inst9__side_3_track_0_in),
    .side_3_track_0_out(inst9__side_3_track_0_out),
    .side_3_track_1_in(inst9__side_3_track_1_in),
    .side_3_track_1_out(inst9__side_3_track_1_out),
    .side_3_track_2_in(inst9__side_3_track_2_in),
    .side_3_track_2_out(inst9__side_3_track_2_out),
    .side_3_track_3_in(inst9__side_3_track_3_in),
    .side_3_track_3_out(inst9__side_3_track_3_out),
    .tile_id(inst9__tile_id)
  );

  //All the connections
  assign inst10__tile_id[0] = bit_const_GND__out;
  assign inst10__tile_id[10] = bit_const_GND__out;
  assign inst10__tile_id[11] = bit_const_GND__out;
  assign inst10__tile_id[12] = bit_const_GND__out;
  assign inst10__tile_id[13] = bit_const_GND__out;
  assign inst10__tile_id[14] = bit_const_GND__out;
  assign inst10__tile_id[15] = bit_const_GND__out;
  assign inst10__tile_id[1] = bit_const_GND__out;
  assign inst10__tile_id[2] = bit_const_GND__out;
  assign inst10__tile_id[4] = bit_const_GND__out;
  assign inst10__tile_id[5] = bit_const_GND__out;
  assign inst10__tile_id[6] = bit_const_GND__out;
  assign inst10__tile_id[7] = bit_const_GND__out;
  assign inst10__tile_id[8] = bit_const_GND__out;
  assign inst10__tile_id[9] = bit_const_GND__out;
  assign inst11__tile_id[10] = bit_const_GND__out;
  assign inst11__tile_id[11] = bit_const_GND__out;
  assign inst11__tile_id[12] = bit_const_GND__out;
  assign inst11__tile_id[13] = bit_const_GND__out;
  assign inst11__tile_id[14] = bit_const_GND__out;
  assign inst11__tile_id[15] = bit_const_GND__out;
  assign inst11__tile_id[1] = bit_const_GND__out;
  assign inst11__tile_id[2] = bit_const_GND__out;
  assign inst11__tile_id[4] = bit_const_GND__out;
  assign inst11__tile_id[5] = bit_const_GND__out;
  assign inst11__tile_id[6] = bit_const_GND__out;
  assign inst11__tile_id[7] = bit_const_GND__out;
  assign inst11__tile_id[8] = bit_const_GND__out;
  assign inst11__tile_id[9] = bit_const_GND__out;
  assign inst12__tile_id[0] = bit_const_GND__out;
  assign inst12__tile_id[10] = bit_const_GND__out;
  assign inst12__tile_id[11] = bit_const_GND__out;
  assign inst12__tile_id[12] = bit_const_GND__out;
  assign inst12__tile_id[13] = bit_const_GND__out;
  assign inst12__tile_id[14] = bit_const_GND__out;
  assign inst12__tile_id[15] = bit_const_GND__out;
  assign inst12__tile_id[2] = bit_const_GND__out;
  assign inst12__tile_id[4] = bit_const_GND__out;
  assign inst12__tile_id[5] = bit_const_GND__out;
  assign inst12__tile_id[6] = bit_const_GND__out;
  assign inst12__tile_id[7] = bit_const_GND__out;
  assign inst12__tile_id[8] = bit_const_GND__out;
  assign inst12__tile_id[9] = bit_const_GND__out;
  assign inst13__tile_id[10] = bit_const_GND__out;
  assign inst13__tile_id[11] = bit_const_GND__out;
  assign inst13__tile_id[12] = bit_const_GND__out;
  assign inst13__tile_id[13] = bit_const_GND__out;
  assign inst13__tile_id[14] = bit_const_GND__out;
  assign inst13__tile_id[15] = bit_const_GND__out;
  assign inst13__tile_id[2] = bit_const_GND__out;
  assign inst13__tile_id[4] = bit_const_GND__out;
  assign inst13__tile_id[5] = bit_const_GND__out;
  assign inst13__tile_id[6] = bit_const_GND__out;
  assign inst13__tile_id[7] = bit_const_GND__out;
  assign inst13__tile_id[8] = bit_const_GND__out;
  assign inst13__tile_id[9] = bit_const_GND__out;
  assign inst14__tile_id[0] = bit_const_GND__out;
  assign inst14__tile_id[10] = bit_const_GND__out;
  assign inst14__tile_id[11] = bit_const_GND__out;
  assign inst14__tile_id[12] = bit_const_GND__out;
  assign inst14__tile_id[13] = bit_const_GND__out;
  assign inst14__tile_id[14] = bit_const_GND__out;
  assign inst14__tile_id[15] = bit_const_GND__out;
  assign inst14__tile_id[1] = bit_const_GND__out;
  assign inst14__tile_id[4] = bit_const_GND__out;
  assign inst14__tile_id[5] = bit_const_GND__out;
  assign inst14__tile_id[6] = bit_const_GND__out;
  assign inst14__tile_id[7] = bit_const_GND__out;
  assign inst14__tile_id[8] = bit_const_GND__out;
  assign inst14__tile_id[9] = bit_const_GND__out;
  assign inst3__tile_id[10] = bit_const_GND__out;
  assign inst3__tile_id[11] = bit_const_GND__out;
  assign inst3__tile_id[12] = bit_const_GND__out;
  assign inst3__tile_id[13] = bit_const_GND__out;
  assign inst3__tile_id[14] = bit_const_GND__out;
  assign inst3__tile_id[15] = bit_const_GND__out;
  assign inst3__tile_id[1] = bit_const_GND__out;
  assign inst3__tile_id[2] = bit_const_GND__out;
  assign inst3__tile_id[3] = bit_const_GND__out;
  assign inst3__tile_id[4] = bit_const_GND__out;
  assign inst3__tile_id[5] = bit_const_GND__out;
  assign inst3__tile_id[6] = bit_const_GND__out;
  assign inst3__tile_id[7] = bit_const_GND__out;
  assign inst3__tile_id[8] = bit_const_GND__out;
  assign inst3__tile_id[9] = bit_const_GND__out;
  assign inst4__tile_id[0] = bit_const_GND__out;
  assign inst4__tile_id[10] = bit_const_GND__out;
  assign inst4__tile_id[11] = bit_const_GND__out;
  assign inst4__tile_id[12] = bit_const_GND__out;
  assign inst4__tile_id[13] = bit_const_GND__out;
  assign inst4__tile_id[14] = bit_const_GND__out;
  assign inst4__tile_id[15] = bit_const_GND__out;
  assign inst4__tile_id[2] = bit_const_GND__out;
  assign inst4__tile_id[3] = bit_const_GND__out;
  assign inst4__tile_id[4] = bit_const_GND__out;
  assign inst4__tile_id[5] = bit_const_GND__out;
  assign inst4__tile_id[6] = bit_const_GND__out;
  assign inst4__tile_id[7] = bit_const_GND__out;
  assign inst4__tile_id[8] = bit_const_GND__out;
  assign inst4__tile_id[9] = bit_const_GND__out;
  assign inst5__tile_id[10] = bit_const_GND__out;
  assign inst5__tile_id[11] = bit_const_GND__out;
  assign inst5__tile_id[12] = bit_const_GND__out;
  assign inst5__tile_id[13] = bit_const_GND__out;
  assign inst5__tile_id[14] = bit_const_GND__out;
  assign inst5__tile_id[15] = bit_const_GND__out;
  assign inst5__tile_id[2] = bit_const_GND__out;
  assign inst5__tile_id[3] = bit_const_GND__out;
  assign inst5__tile_id[4] = bit_const_GND__out;
  assign inst5__tile_id[5] = bit_const_GND__out;
  assign inst5__tile_id[6] = bit_const_GND__out;
  assign inst5__tile_id[7] = bit_const_GND__out;
  assign inst5__tile_id[8] = bit_const_GND__out;
  assign inst5__tile_id[9] = bit_const_GND__out;
  assign inst6__tile_id[0] = bit_const_GND__out;
  assign inst6__tile_id[10] = bit_const_GND__out;
  assign inst6__tile_id[11] = bit_const_GND__out;
  assign inst6__tile_id[12] = bit_const_GND__out;
  assign inst6__tile_id[13] = bit_const_GND__out;
  assign inst6__tile_id[14] = bit_const_GND__out;
  assign inst6__tile_id[15] = bit_const_GND__out;
  assign inst6__tile_id[1] = bit_const_GND__out;
  assign inst6__tile_id[3] = bit_const_GND__out;
  assign inst6__tile_id[4] = bit_const_GND__out;
  assign inst6__tile_id[5] = bit_const_GND__out;
  assign inst6__tile_id[6] = bit_const_GND__out;
  assign inst6__tile_id[7] = bit_const_GND__out;
  assign inst6__tile_id[8] = bit_const_GND__out;
  assign inst6__tile_id[9] = bit_const_GND__out;
  assign inst7__tile_id[10] = bit_const_GND__out;
  assign inst7__tile_id[11] = bit_const_GND__out;
  assign inst7__tile_id[12] = bit_const_GND__out;
  assign inst7__tile_id[13] = bit_const_GND__out;
  assign inst7__tile_id[14] = bit_const_GND__out;
  assign inst7__tile_id[15] = bit_const_GND__out;
  assign inst7__tile_id[1] = bit_const_GND__out;
  assign inst7__tile_id[3] = bit_const_GND__out;
  assign inst7__tile_id[4] = bit_const_GND__out;
  assign inst7__tile_id[5] = bit_const_GND__out;
  assign inst7__tile_id[6] = bit_const_GND__out;
  assign inst7__tile_id[7] = bit_const_GND__out;
  assign inst7__tile_id[8] = bit_const_GND__out;
  assign inst7__tile_id[9] = bit_const_GND__out;
  assign inst8__tile_id[0] = bit_const_GND__out;
  assign inst8__tile_id[10] = bit_const_GND__out;
  assign inst8__tile_id[11] = bit_const_GND__out;
  assign inst8__tile_id[12] = bit_const_GND__out;
  assign inst8__tile_id[13] = bit_const_GND__out;
  assign inst8__tile_id[14] = bit_const_GND__out;
  assign inst8__tile_id[15] = bit_const_GND__out;
  assign inst8__tile_id[3] = bit_const_GND__out;
  assign inst8__tile_id[4] = bit_const_GND__out;
  assign inst8__tile_id[5] = bit_const_GND__out;
  assign inst8__tile_id[6] = bit_const_GND__out;
  assign inst8__tile_id[7] = bit_const_GND__out;
  assign inst8__tile_id[8] = bit_const_GND__out;
  assign inst8__tile_id[9] = bit_const_GND__out;
  assign inst9__tile_id[10] = bit_const_GND__out;
  assign inst9__tile_id[11] = bit_const_GND__out;
  assign inst9__tile_id[12] = bit_const_GND__out;
  assign inst9__tile_id[13] = bit_const_GND__out;
  assign inst9__tile_id[14] = bit_const_GND__out;
  assign inst9__tile_id[15] = bit_const_GND__out;
  assign inst9__tile_id[3] = bit_const_GND__out;
  assign inst9__tile_id[4] = bit_const_GND__out;
  assign inst9__tile_id[5] = bit_const_GND__out;
  assign inst9__tile_id[6] = bit_const_GND__out;
  assign inst9__tile_id[7] = bit_const_GND__out;
  assign inst9__tile_id[8] = bit_const_GND__out;
  assign inst9__tile_id[9] = bit_const_GND__out;
  assign inst10__tile_id[3] = bit_const_VCC__out;
  assign inst11__side_0_track_0_in[0] = bit_const_VCC__out;
  assign inst11__side_0_track_1_in[0] = bit_const_VCC__out;
  assign inst11__side_0_track_2_in[0] = bit_const_VCC__out;
  assign inst11__side_0_track_3_in[0] = bit_const_VCC__out;
  assign inst11__tile_id[0] = bit_const_VCC__out;
  assign inst11__tile_id[3] = bit_const_VCC__out;
  assign inst12__side_1_track_0_in[0] = bit_const_VCC__out;
  assign inst12__side_1_track_1_in[0] = bit_const_VCC__out;
  assign inst12__side_1_track_2_in[0] = bit_const_VCC__out;
  assign inst12__side_1_track_3_in[0] = bit_const_VCC__out;
  assign inst12__side_2_track_0_in[0] = bit_const_VCC__out;
  assign inst12__side_2_track_1_in[0] = bit_const_VCC__out;
  assign inst12__side_2_track_2_in[0] = bit_const_VCC__out;
  assign inst12__side_2_track_3_in[0] = bit_const_VCC__out;
  assign inst12__tile_id[1] = bit_const_VCC__out;
  assign inst12__tile_id[3] = bit_const_VCC__out;
  assign inst13__side_1_track_0_in[0] = bit_const_VCC__out;
  assign inst13__side_1_track_1_in[0] = bit_const_VCC__out;
  assign inst13__side_1_track_2_in[0] = bit_const_VCC__out;
  assign inst13__side_1_track_3_in[0] = bit_const_VCC__out;
  assign inst13__tile_id[0] = bit_const_VCC__out;
  assign inst13__tile_id[1] = bit_const_VCC__out;
  assign inst13__tile_id[3] = bit_const_VCC__out;
  assign inst14__side_0_track_0_in[0] = bit_const_VCC__out;
  assign inst14__side_0_track_1_in[0] = bit_const_VCC__out;
  assign inst14__side_0_track_2_in[0] = bit_const_VCC__out;
  assign inst14__side_0_track_3_in[0] = bit_const_VCC__out;
  assign inst14__side_1_track_0_in[0] = bit_const_VCC__out;
  assign inst14__side_1_track_1_in[0] = bit_const_VCC__out;
  assign inst14__side_1_track_2_in[0] = bit_const_VCC__out;
  assign inst14__side_1_track_3_in[0] = bit_const_VCC__out;
  assign inst14__tile_id[2] = bit_const_VCC__out;
  assign inst14__tile_id[3] = bit_const_VCC__out;
  assign inst3__tile_id[0] = bit_const_VCC__out;
  assign inst4__tile_id[1] = bit_const_VCC__out;
  assign inst5__tile_id[0] = bit_const_VCC__out;
  assign inst5__tile_id[1] = bit_const_VCC__out;
  assign inst6__side_2_track_0_in[0] = bit_const_VCC__out;
  assign inst6__side_2_track_1_in[0] = bit_const_VCC__out;
  assign inst6__side_2_track_2_in[0] = bit_const_VCC__out;
  assign inst6__side_2_track_3_in[0] = bit_const_VCC__out;
  assign inst6__tile_id[2] = bit_const_VCC__out;
  assign inst7__tile_id[0] = bit_const_VCC__out;
  assign inst7__tile_id[2] = bit_const_VCC__out;
  assign inst8__side_0_track_0_in[0] = bit_const_VCC__out;
  assign inst8__side_0_track_1_in[0] = bit_const_VCC__out;
  assign inst8__side_0_track_2_in[0] = bit_const_VCC__out;
  assign inst8__side_0_track_3_in[0] = bit_const_VCC__out;
  assign inst8__tile_id[1] = bit_const_VCC__out;
  assign inst8__tile_id[2] = bit_const_VCC__out;
  assign inst9__side_2_track_0_in[0] = bit_const_VCC__out;
  assign inst9__side_2_track_1_in[0] = bit_const_VCC__out;
  assign inst9__side_2_track_2_in[0] = bit_const_VCC__out;
  assign inst9__side_2_track_3_in[0] = bit_const_VCC__out;
  assign inst9__tile_id[0] = bit_const_VCC__out;
  assign inst9__tile_id[1] = bit_const_VCC__out;
  assign inst9__tile_id[2] = bit_const_VCC__out;
  assign inst0__clk = clk;
  assign inst1__clk = clk;
  assign inst10__clk = clk;
  assign inst11__clk = clk;
  assign inst12__clk = clk;
  assign inst13__clk = clk;
  assign inst14__clk = clk;
  assign inst2__clk = clk;
  assign inst3__clk = clk;
  assign inst4__clk = clk;
  assign inst5__clk = clk;
  assign inst6__clk = clk;
  assign inst7__clk = clk;
  assign inst8__clk = clk;
  assign inst9__clk = clk;
  assign inst6__side_3_track_0_in[0] = inst0__pin_0;
  assign inst6__side_3_track_1_in[0] = inst0__pin_1;
  assign inst6__side_3_track_2_in[0] = inst0__pin_2;
  assign inst6__side_3_track_3_in[0] = inst0__pin_3;
  assign inst0__rst = reset;
  assign inst1__rst = reset;
  assign inst10__rst = reset;
  assign inst11__rst = reset;
  assign inst12__rst = reset;
  assign inst13__rst = reset;
  assign inst14__rst = reset;
  assign inst2__rst = reset;
  assign inst3__rst = reset;
  assign inst4__rst = reset;
  assign inst5__rst = reset;
  assign inst6__rst = reset;
  assign inst7__rst = reset;
  assign inst8__rst = reset;
  assign inst9__rst = reset;
  assign inst0__top_pin[0] = in_wire_0;
  assign inst7__side_3_track_0_in[0] = inst1__pin_0;
  assign inst7__side_3_track_1_in[0] = inst1__pin_1;
  assign inst7__side_3_track_2_in[0] = inst1__pin_2;
  assign inst7__side_3_track_3_in[0] = inst1__pin_3;
  assign inst1__top_pin[0] = in_wire_1;
  assign inst10__config_addr[31:0] = config_addr[31:0];
  assign inst11__config_addr[31:0] = config_addr[31:0];
  assign inst12__config_addr[31:0] = config_addr[31:0];
  assign inst13__config_addr[31:0] = config_addr[31:0];
  assign inst14__config_addr[31:0] = config_addr[31:0];
  assign inst3__config_addr[31:0] = config_addr[31:0];
  assign inst4__config_addr[31:0] = config_addr[31:0];
  assign inst5__config_addr[31:0] = config_addr[31:0];
  assign inst6__config_addr[31:0] = config_addr[31:0];
  assign inst7__config_addr[31:0] = config_addr[31:0];
  assign inst8__config_addr[31:0] = config_addr[31:0];
  assign inst9__config_addr[31:0] = config_addr[31:0];
  assign inst10__config_data[31:0] = config_data[31:0];
  assign inst11__config_data[31:0] = config_data[31:0];
  assign inst12__config_data[31:0] = config_data[31:0];
  assign inst13__config_data[31:0] = config_data[31:0];
  assign inst14__config_data[31:0] = config_data[31:0];
  assign inst3__config_data[31:0] = config_data[31:0];
  assign inst4__config_data[31:0] = config_data[31:0];
  assign inst5__config_data[31:0] = config_data[31:0];
  assign inst6__config_data[31:0] = config_data[31:0];
  assign inst7__config_data[31:0] = config_data[31:0];
  assign inst8__config_data[31:0] = config_data[31:0];
  assign inst9__config_data[31:0] = config_data[31:0];
  assign inst10__side_0_track_0_in[0:0] = inst11__side_2_track_0_out[0:0];
  assign inst11__side_2_track_0_in[0:0] = inst10__side_0_track_0_out[0:0];
  assign inst10__side_0_track_1_in[0:0] = inst11__side_2_track_1_out[0:0];
  assign inst11__side_2_track_1_in[0:0] = inst10__side_0_track_1_out[0:0];
  assign inst10__side_0_track_2_in[0:0] = inst11__side_2_track_2_out[0:0];
  assign inst11__side_2_track_2_in[0:0] = inst10__side_0_track_2_out[0:0];
  assign inst10__side_0_track_3_in[0:0] = inst11__side_2_track_3_out[0:0];
  assign inst11__side_2_track_3_in[0:0] = inst10__side_0_track_3_out[0:0];
  assign inst10__side_1_track_0_in[0:0] = inst13__side_3_track_0_out[0:0];
  assign inst13__side_3_track_0_in[0:0] = inst10__side_1_track_0_out[0:0];
  assign inst10__side_1_track_1_in[0:0] = inst13__side_3_track_1_out[0:0];
  assign inst13__side_3_track_1_in[0:0] = inst10__side_1_track_1_out[0:0];
  assign inst10__side_1_track_2_in[0:0] = inst13__side_3_track_2_out[0:0];
  assign inst13__side_3_track_2_in[0:0] = inst10__side_1_track_2_out[0:0];
  assign inst10__side_1_track_3_in[0:0] = inst13__side_3_track_3_out[0:0];
  assign inst13__side_3_track_3_in[0:0] = inst10__side_1_track_3_out[0:0];
  assign inst10__side_2_track_0_in[0:0] = inst9__side_0_track_0_out[0:0];
  assign inst9__side_0_track_0_in[0:0] = inst10__side_2_track_0_out[0:0];
  assign inst10__side_2_track_1_in[0:0] = inst9__side_0_track_1_out[0:0];
  assign inst9__side_0_track_1_in[0:0] = inst10__side_2_track_1_out[0:0];
  assign inst10__side_2_track_2_in[0:0] = inst9__side_0_track_2_out[0:0];
  assign inst9__side_0_track_2_in[0:0] = inst10__side_2_track_2_out[0:0];
  assign inst10__side_2_track_3_in[0:0] = inst9__side_0_track_3_out[0:0];
  assign inst9__side_0_track_3_in[0:0] = inst10__side_2_track_3_out[0:0];
  assign inst10__side_3_track_0_in[0:0] = inst7__side_1_track_0_out[0:0];
  assign inst7__side_1_track_0_in[0:0] = inst10__side_3_track_0_out[0:0];
  assign inst10__side_3_track_1_in[0:0] = inst7__side_1_track_1_out[0:0];
  assign inst7__side_1_track_1_in[0:0] = inst10__side_3_track_1_out[0:0];
  assign inst10__side_3_track_2_in[0:0] = inst7__side_1_track_2_out[0:0];
  assign inst7__side_1_track_2_in[0:0] = inst10__side_3_track_2_out[0:0];
  assign inst10__side_3_track_3_in[0:0] = inst7__side_1_track_3_out[0:0];
  assign inst7__side_1_track_3_in[0:0] = inst10__side_3_track_3_out[0:0];
  assign inst11__side_1_track_0_in[0:0] = inst14__side_3_track_0_out[0:0];
  assign inst14__side_3_track_0_in[0:0] = inst11__side_1_track_0_out[0:0];
  assign inst11__side_1_track_1_in[0:0] = inst14__side_3_track_1_out[0:0];
  assign inst14__side_3_track_1_in[0:0] = inst11__side_1_track_1_out[0:0];
  assign inst11__side_1_track_2_in[0:0] = inst14__side_3_track_2_out[0:0];
  assign inst14__side_3_track_2_in[0:0] = inst11__side_1_track_2_out[0:0];
  assign inst11__side_1_track_3_in[0:0] = inst14__side_3_track_3_out[0:0];
  assign inst14__side_3_track_3_in[0:0] = inst11__side_1_track_3_out[0:0];
  assign inst11__side_3_track_0_in[0:0] = inst8__side_1_track_0_out[0:0];
  assign inst8__side_1_track_0_in[0:0] = inst11__side_3_track_0_out[0:0];
  assign inst11__side_3_track_1_in[0:0] = inst8__side_1_track_1_out[0:0];
  assign inst8__side_1_track_1_in[0:0] = inst11__side_3_track_1_out[0:0];
  assign inst11__side_3_track_2_in[0:0] = inst8__side_1_track_2_out[0:0];
  assign inst8__side_1_track_2_in[0:0] = inst11__side_3_track_2_out[0:0];
  assign inst11__side_3_track_3_in[0:0] = inst8__side_1_track_3_out[0:0];
  assign inst8__side_1_track_3_in[0:0] = inst11__side_3_track_3_out[0:0];
  assign inst12__side_0_track_0_in[0:0] = inst13__side_2_track_0_out[0:0];
  assign inst13__side_2_track_0_in[0:0] = inst12__side_0_track_0_out[0:0];
  assign inst12__side_0_track_1_in[0:0] = inst13__side_2_track_1_out[0:0];
  assign inst13__side_2_track_1_in[0:0] = inst12__side_0_track_1_out[0:0];
  assign inst12__side_0_track_2_in[0:0] = inst13__side_2_track_2_out[0:0];
  assign inst13__side_2_track_2_in[0:0] = inst12__side_0_track_2_out[0:0];
  assign inst12__side_0_track_3_in[0:0] = inst13__side_2_track_3_out[0:0];
  assign inst13__side_2_track_3_in[0:0] = inst12__side_0_track_3_out[0:0];
  assign inst3__pin_0 = inst12__side_1_track_0_out[0];
  assign inst3__pin_1 = inst12__side_1_track_1_out[0];
  assign inst3__pin_2 = inst12__side_1_track_2_out[0];
  assign inst3__pin_3 = inst12__side_1_track_3_out[0];
  assign inst12__side_3_track_0_in[0:0] = inst9__side_1_track_0_out[0:0];
  assign inst9__side_1_track_0_in[0:0] = inst12__side_3_track_0_out[0:0];
  assign inst12__side_3_track_1_in[0:0] = inst9__side_1_track_1_out[0:0];
  assign inst9__side_1_track_1_in[0:0] = inst12__side_3_track_1_out[0:0];
  assign inst12__side_3_track_2_in[0:0] = inst9__side_1_track_2_out[0:0];
  assign inst9__side_1_track_2_in[0:0] = inst12__side_3_track_2_out[0:0];
  assign inst12__side_3_track_3_in[0:0] = inst9__side_1_track_3_out[0:0];
  assign inst9__side_1_track_3_in[0:0] = inst12__side_3_track_3_out[0:0];
  assign inst13__side_0_track_0_in[0:0] = inst14__side_2_track_0_out[0:0];
  assign inst14__side_2_track_0_in[0:0] = inst13__side_0_track_0_out[0:0];
  assign inst13__side_0_track_1_in[0:0] = inst14__side_2_track_1_out[0:0];
  assign inst14__side_2_track_1_in[0:0] = inst13__side_0_track_1_out[0:0];
  assign inst13__side_0_track_2_in[0:0] = inst14__side_2_track_2_out[0:0];
  assign inst14__side_2_track_2_in[0:0] = inst13__side_0_track_2_out[0:0];
  assign inst13__side_0_track_3_in[0:0] = inst14__side_2_track_3_out[0:0];
  assign inst14__side_2_track_3_in[0:0] = inst13__side_0_track_3_out[0:0];
  assign inst4__pin_0 = inst13__side_1_track_0_out[0];
  assign inst4__pin_1 = inst13__side_1_track_1_out[0];
  assign inst4__pin_2 = inst13__side_1_track_2_out[0];
  assign inst4__pin_3 = inst13__side_1_track_3_out[0];
  assign inst5__pin_0 = inst14__side_1_track_0_out[0];
  assign inst5__pin_1 = inst14__side_1_track_1_out[0];
  assign inst5__pin_2 = inst14__side_1_track_2_out[0];
  assign inst5__pin_3 = inst14__side_1_track_3_out[0];
  assign inst8__side_3_track_0_in[0] = inst2__pin_0;
  assign inst8__side_3_track_1_in[0] = inst2__pin_1;
  assign inst8__side_3_track_2_in[0] = inst2__pin_2;
  assign inst8__side_3_track_3_in[0] = inst2__pin_3;
  assign inst2__top_pin[0] = in_wire_2;
  assign out_wire_0 = inst3__top_pin[0];
  assign out_wire_1 = inst4__top_pin[0];
  assign out_wire_2 = inst5__top_pin[0];
  assign inst6__side_0_track_0_in[0:0] = inst7__side_2_track_0_out[0:0];
  assign inst7__side_2_track_0_in[0:0] = inst6__side_0_track_0_out[0:0];
  assign inst6__side_0_track_1_in[0:0] = inst7__side_2_track_1_out[0:0];
  assign inst7__side_2_track_1_in[0:0] = inst6__side_0_track_1_out[0:0];
  assign inst6__side_0_track_2_in[0:0] = inst7__side_2_track_2_out[0:0];
  assign inst7__side_2_track_2_in[0:0] = inst6__side_0_track_2_out[0:0];
  assign inst6__side_0_track_3_in[0:0] = inst7__side_2_track_3_out[0:0];
  assign inst7__side_2_track_3_in[0:0] = inst6__side_0_track_3_out[0:0];
  assign inst6__side_1_track_0_in[0:0] = inst9__side_3_track_0_out[0:0];
  assign inst9__side_3_track_0_in[0:0] = inst6__side_1_track_0_out[0:0];
  assign inst6__side_1_track_1_in[0:0] = inst9__side_3_track_1_out[0:0];
  assign inst9__side_3_track_1_in[0:0] = inst6__side_1_track_1_out[0:0];
  assign inst6__side_1_track_2_in[0:0] = inst9__side_3_track_2_out[0:0];
  assign inst9__side_3_track_2_in[0:0] = inst6__side_1_track_2_out[0:0];
  assign inst6__side_1_track_3_in[0:0] = inst9__side_3_track_3_out[0:0];
  assign inst9__side_3_track_3_in[0:0] = inst6__side_1_track_3_out[0:0];
  assign inst7__side_0_track_0_in[0:0] = inst8__side_2_track_0_out[0:0];
  assign inst8__side_2_track_0_in[0:0] = inst7__side_0_track_0_out[0:0];
  assign inst7__side_0_track_1_in[0:0] = inst8__side_2_track_1_out[0:0];
  assign inst8__side_2_track_1_in[0:0] = inst7__side_0_track_1_out[0:0];
  assign inst7__side_0_track_2_in[0:0] = inst8__side_2_track_2_out[0:0];
  assign inst8__side_2_track_2_in[0:0] = inst7__side_0_track_2_out[0:0];
  assign inst7__side_0_track_3_in[0:0] = inst8__side_2_track_3_out[0:0];
  assign inst8__side_2_track_3_in[0:0] = inst7__side_0_track_3_out[0:0];

endmodule //top
