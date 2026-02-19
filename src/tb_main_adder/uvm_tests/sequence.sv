`include "uvm_macros.svh" 

import uvm_pkg::*;

class main_adder_sequence extends uvm_sequence #(main_adder_transaction);
    `uvm_object_utils(main_adder_sequence)
    
	bit [4:0] cmd;
	
    function new(string name = "main_adder_sequence");
        super.new(name);
    endfunction
    
    task body();
        for (int i = 0; i < 10; i++) begin
            req = main_adder_transaction::type_id::create("req");
            start_item(req);
            req.randomize() with{cmd == cmd;};
            finish_item(req);
			
		end
    endtask
endclass
