`include "uvm_macros.svh" 
`include "ialu.sv" 
`include "transaction.sv" 

import uvm_pkg::*;

class main_adder_driver extends uvm_driver #(main_adder_transaction);
    `uvm_component_utils(main_adder_driver)
    
    virtual ialu_if test_if;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual ialu_if)::get(this, "", "test_if", test_if))
            `uvm_fatal("DRV", "cant get interface")
    endfunction
    
    task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            drive_transaction(req);
            seq_item_port.item_done();
        end
    endtask
    
    task drive_transaction(main_adder_transaction packet);
        @(posedge test_if.clk);
        test_if.exu2ialu_main_op1_i <= packet.op1;
        test_if.exu2ialu_main_op2_i <= packet.op2;
        `uvm_info("DRV", $sformatf("op1=%0d, op2=%0d", packet.op1, packet.op2), UVM_MEDIUM)
    endtask
endclass