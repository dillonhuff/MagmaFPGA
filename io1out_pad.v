/* verilator lint_off UNOPTFLAT */
//Module: pullresistor defined externally


module corebit_concat (
  input in0,
  input in1,
  output [1:0] out
);
  assign out = {in0, in1};

endmodule //corebit_concat

module corebit_const #(parameter value=1) (
  output out
);
  assign out = value;

endmodule //corebit_const

module corebit_or (
  input in0,
  input in1,
  output out
);
  assign out = in0 | in1;

endmodule //corebit_or

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

module corebit_tribuf (
  input in,
  input en,
  inout out
);
  assign out = en ? in : 1'bz;

endmodule //corebit_tribuf

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

module coreir_not #(parameter width=1) (
  input [width-1:0] in,
  output [width-1:0] out
);
  assign out = ~in;

endmodule //coreir_not

module corebit_mux (
  input in0,
  input in1,
  input sel,
  output out
);
  assign out = sel ? in1 : in0;

endmodule //corebit_mux

module corebit_not (
  input in,
  output out
);
  assign out = ~in;

endmodule //corebit_not

module corebit_and (
  input in0,
  input in1,
  output out
);
  assign out = in0 & in1;

endmodule //corebit_and

module corebit_wire (
  input in,
  output out
);
  assign out = in;

endmodule //corebit_wire

module coreir_eq #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output out
);
  assign out = in0 == in1;

endmodule //coreir_eq

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
  assign inst0__in[0:0] = I[0:0];
  assign O[0:0] = inst0__out[0:0];

endmodule //Invert1_wrapped

module corebit_term (
  input in
);


endmodule //corebit_term

module coreir_mux #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  input sel,
  output [width-1:0] out
);
  assign out = sel ? in1 : in0;

endmodule //coreir_mux

module corebit_ibuf (
  inout in,
  output out
);
  assign out = in;

endmodule //corebit_ibuf

module corebit_xor (
  input in0,
  input in1,
  output out
);
  assign out = in0 ^ in1;

endmodule //corebit_xor

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
  assign reg0__clk = clk;
  assign reg0__in[0:0] = enMux__out[0:0];
  assign enMux__in0[0:0] = reg0__out[0:0];
  assign enMux__sel = en;
  assign enMux__in1[0:0] = in[0:0];

endmodule //reg_U0

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
  assign inst0__in0 = I[0];
  assign inst0__in1 = I[1];
  assign O = inst0__out;
  assign inst0__sel = S;

endmodule //_Mux2

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
  assign inst30__CE = CE;
  assign inst3__CE = CE;
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
  assign inst30__CLK = CLK;
  assign inst3__CLK = CLK;
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
  assign inst3__RESET = RESET;
  assign inst29__RESET = RESET;
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
  assign O[3] = inst3__O;
  assign inst30__I = I[30];
  assign O[30] = inst30__O;
  assign inst3__I = I[3];
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
  assign inst0__I[0] = I[0];
  assign inst0__I[1] = I[1];
  assign inst2__I[0] = inst0__O;
  assign inst0__S = S[0];
  assign inst1__S = S[0];
  assign inst1__I[0] = I[2];
  assign inst1__I[1] = I[3];
  assign inst2__I[1] = inst1__O;
  assign O = inst2__O;
  assign inst2__S = S[1];

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
  assign inst0__RESET = inst2__O[0];
  assign inst1__I0[0] = config_addr[0];
  assign inst1__I0[10] = config_addr[10];
  assign inst1__I0[11] = config_addr[11];

endmodule //io1out_pad
