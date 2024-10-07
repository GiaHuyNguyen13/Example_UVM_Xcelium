
class seq_item extends uvm_sequence_item;
   `uvm_object_utils(seq_item)
  rand bit [7:0] ip1, ip2;
  bit [8:0] out;
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction
  
  constraint ip_c {ip1 < 100; ip2 < 100;}
endclass