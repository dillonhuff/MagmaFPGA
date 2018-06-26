/* verilator lint_off UNOPTFLAT */
//Module: pullresistor defined externally


module corebit_and (
  input in0,
  input in1,
  output out
);
  assign out = in0 & in1;

endmodule //corebit_and

module corebit_concat (
  input in0,
  input in1,
  output [1:0] out
);
  assign out = {in0, in1};

endmodule //corebit_concat

module corebit_ibuf (
  inout in,
  output out
);
  assign out = in;

endmodule //corebit_ibuf

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

module corebit_or (
  input in0,
  input in1,
  output out
);
  assign out = in0 | in1;

endmodule //corebit_or

module corebit_const #(parameter value=1) (
  output out
);
  assign out = value;

endmodule //corebit_const

module corebit_not (
  input in,
  output out
);
  assign out = ~in;

endmodule //corebit_not

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
  assign pin_0 = top_pin[0];
  assign pin_1 = top_pin[0];
  assign pin_2 = top_pin[0];
  assign pin_3 = top_pin[0];

endmodule //io1in_pad

module corebit_term (
  input in
);


endmodule //corebit_term

module corebit_mux (
  input in0,
  input in1,
  input sel,
  output out
);
  assign out = sel ? in1 : in0;

endmodule //corebit_mux

module corebit_tribuf (
  input in,
  input en,
  inout out
);
  assign out = en ? in : 1'bz;

endmodule //corebit_tribuf

module corebit_wire (
  input in,
  output out
);
  assign out = in;

endmodule //corebit_wire

module corebit_xor (
  input in0,
  input in1,
  output out
);
  assign out = in0 ^ in1;

endmodule //corebit_xor
