`include "uvm_macros.svh" 
`include "main_adder_agent.sv" 
`include "main_adder_scoreboard.sv" 

import uvm_pkg::*;

class main_adder_env extends uvm_env;
    `uvm_component_utils(main_adder_env)
    
    main_adder_agent      agent;
    main_adder_scoreboard scoreboard;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent      = main_adder_agent::type_id::create("agent", this);
        scoreboard = main_adder_scoreboard::type_id::create("scoreboard", this);
    endfunction
    
    function void connect_phase(uvm_phase phase);
        agent.monitor.analysis_port.connect(scoreboard.analysis_export);
    endfunction
endclass
