`include "uvm_macros.svh" 

import uvm_pkg::*;

class main_adder_sequencer extends uvm_sequencer #(main_adder_transaction);
    `uvm_component_utils(main_adder_sequencer)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass