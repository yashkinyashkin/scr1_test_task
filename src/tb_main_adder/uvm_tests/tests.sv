`include "uvm_macros.svh" 
`include "sequence.sv" 
`include "scr1_riscv_isa_decoding.svh"


import uvm_pkg::*;


typedef class main_adder_sequence;


//----------------------------------------------------------
//              Тест операции сложения
//----------------------------------------------------------

class addition_test extends uvm_test; 
    `uvm_component_utils(addition_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_ADD;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции вычитания
//----------------------------------------------------------

class substraction_test extends uvm_test; 
    `uvm_component_utils(substraction_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
    
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SUB;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции лог. И
//----------------------------------------------------------

class and_test extends uvm_test; 
    `uvm_component_utils(and_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_AND;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции лог. ИЛИ
//----------------------------------------------------------

class or_test extends uvm_test; 
    `uvm_component_utils(or_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_OR;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции XOR
//----------------------------------------------------------

class xor_test extends uvm_test; 
    `uvm_component_utils(xor_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_XOR;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции сравнения на МЕНЬШЕ
//----------------------------------------------------------

class less_then_test extends uvm_test; 
    `uvm_component_utils(less_then_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SUB_LT;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции сравнения на РАВНО
//----------------------------------------------------------

class equal_test extends uvm_test; 
    `uvm_component_utils(equal_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SUB_EQ;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции сравнения на БОЛЬШЕ ИЛИ РАВНО
//----------------------------------------------------------

class greater_equal_test extends uvm_test; 
    `uvm_component_utils(greater_equal_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SUB_GE;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции сравнения на НЕ РАВНО
//----------------------------------------------------------

class not_equal_test extends uvm_test; 
    `uvm_component_utils(not_equal_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SUB_NE;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции лог. СДВИГ ВПРАВО
//----------------------------------------------------------

class right_shift_test extends uvm_test; 
    `uvm_component_utils(right_shift_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SRL;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции лог. СДВИГ ВЛЕВО
//----------------------------------------------------------

class left_shift_test extends uvm_test; 
    `uvm_component_utils(left_shift_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SLL;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass


//----------------------------------------------------------
//              Тест операции арифм. СДВИГ ВПРАВО
//----------------------------------------------------------

class a_right_shift_test extends uvm_test; 
    `uvm_component_utils(a_right_shift_test) 
    
    virtual ialu_if test_if;
    main_adder_sequence seq;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        if (!uvm_config_db #(virtual ialu_if)::get(this, "", "test_if", test_if)) 
            `uvm_fatal("BFM", "Failed to get bfm");
        
        uvm_config_db #(virtual ialu_if)::set(this, "agent.driver", "virtual_port", test_if);
        uvm_config_db #(virtual ialu_if)::set(this, "agent.monitor", "virtual_port", test_if);
    endfunction
	
	
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        
        @(posedge test_if.clk);
        wait(test_if.rst_n);
        
        seq = main_adder_sequence::type_id::create("seq");
		seq.cmd = SCR1_IALU_CMD_SRA;
        seq.start(null);
        
        #100;
        phase.drop_objection(this);
    endtask
endclass
