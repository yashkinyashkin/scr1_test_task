`include "uvm_macros.svh" 
`include "ialu.sv" 
`include "transaction.sv" 

import uvm_pkg::*;

class main_adder_monitor extends uvm_monitor;
    `uvm_component_utils(main_adder_monitor)
    
    virtual ialu_if test_if;
	
    uvm_analysis_port #(main_adder_transaction) analysis_port;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_port = new("analysis_port", this);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual ialu_if)::get(this, "", "test_if", test_if))
            `uvm_fatal("MON", "cant get interface")
    endfunction
    
    task run_phase(uvm_phase phase);
        main_adder_transaction packet;
        forever begin
            @(posedge test_if.clk);
            packet = main_adder_transaction::type_id::create("packet");
            packet.op1 = test_if.exu2ialu_main_op1_i;
            packet.op2 = test_if.exu2ialu_main_op2_i;
            packet.res = test_if.ialu2exu_main_res_o;
            packet.с_res = test_if.ialu2exu_cmp_res_o;
            `uvm_info("MON", $sformatf("op1=%0d, op2=%0d, res=%0d",
                      packet.op1, packet.op2, packet.res), UVM_MEDIUM)
            analysis_port.write(packet);
        end
    endtask
endclass