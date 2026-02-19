`include "uvm_macros.svh" 

import uvm_pkg::*;

class main_adder_transaction extends uvm_sequence_item;
    rand bit [7:0] op1;
    rand bit [7:0] op2;
    bit 	 [8:0] res;
    bit 	 [8:0] c_res;
    bit 	 [4:0] cmd;
    bit 	 [8:0] exp;
    
    `uvm_object_utils_begin(main_adder_transaction)
        `uvm_field_int(op1, UVM_ALL_ON)
        `uvm_field_int(op2, UVM_ALL_ON)
        `uvm_field_int(res, UVM_ALL_ON)
        `uvm_field_int(c_res, UVM_ALL_ON)
        `uvm_field_int(cmd, UVM_ALL_ON)
        `uvm_field_int(exp, UVM_ALL_ON)
    `uvm_object_utils_end
    
    function new(string name = "main_adder_transaction");
        super.new(name);
    endfunction

endclass