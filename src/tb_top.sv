`include "uvm.sv"
import uvm_pkg::*;
module tb_top;
  bit clk;
  bit reset;
  initial begin
    clk = 0;
     forever #2 clk = ~clk;
  end
 
  
  initial begin
    //clk = 0;
    reset = 1;
    #5; 
    reset = 0;
  end
  add_if vif(clk, reset);
  
  adder DUT(.clk(vif.clk),.reset(vif.reset),.in1(vif.ip1),.in2(vif.ip2),.out(vif.out));
  
  initial begin
    // set interface in config_db
    uvm_config_db#(virtual add_if)::set(null, "*", "vif", vif);
  end
  initial begin
    run_test("base_test");
  end
endmodule