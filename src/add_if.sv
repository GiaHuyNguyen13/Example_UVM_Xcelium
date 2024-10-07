interface add_if(input logic clk, input logic reset);

  // Inputs to the adder
  logic [7:0] ip1;
  logic [7:0] ip2;

  // Output of the adder
  logic [8:0] out;

endinterface
