module const_mod #(parameter value=1, parameter width=1)
   (output [width - 1 : 0] out);

   /* verilator lint_off WIDTH */
   assign out = value;

endmodule
