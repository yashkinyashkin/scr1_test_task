`include "uvm_macros.svh" 
`include "driver.sv" 
`include "sequencer.sv" 
`include "monitor.sv" 

import uvm_pkg::*;


class main_adder_agent extends uvm_agent;
    `uvm_component_utils(main_adder_agent)
    
    main_adder_driver    driver;
    main_adder_sequencer sequencer;
    main_adder_monitor   monitor;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        driver    = main_adder_driver::type_id::create("driver", this);
        sequencer = main_adder_sequencer::type_id::create("sequencer", this);
        monitor   = main_adder_monitor::type_id::create("monitor", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction
endclass