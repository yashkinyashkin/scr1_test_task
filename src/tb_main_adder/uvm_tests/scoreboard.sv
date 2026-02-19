`include "uvm_macros.svh" 
`include "transaction.sv" 
`include "uvm_macros.sv" 
`include "scr1_riscv_isa_decoding.svh"
`include "scr1_arch_description.svh"
`include "scr1_search_ms1.svh"


import uvm_pkg::*;

class main_adder_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(main_adder_scoreboard)
    
	type_scr1_ialu_cmd_sel_e cmd;
	bit 	 [8:0] exp;
	
    uvm_analysis_imp #(main_adder_transaction, main_adder_scoreboard) analysis_export;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new("analysis_export", this);
    endfunction
	
    function int expected_result(cmd);
        case (cmd)
			SCR1_IALU_CMD_NONE:     exp = 0;
			SCR1_IALU_CMD_AND:      exp = packet.op1 & packet.op2;
			SCR1_IALU_CMD_OR:       exp = packet.op1 | packet.op2;
			SCR1_IALU_CMD_XOR:      exp = packet.op1 ^ packet.op2;
			SCR1_IALU_CMD_ADD:      exp = packet.op1 + packet.op2;
			SCR1_IALU_CMD_SUB:      exp = packet.op1 - packet.op2;
			SCR1_IALU_CMD_SUB_LT:   begin
										if (packet.op1 - packet.op2 > 0) exp = 0;
										else exp = 1;
										end
			SCR1_IALU_CMD_SUB_EQ:   begin
										if (packet.op1 - packet.op2 != 0) exp = 0;
										else exp = 1;
										end
			SCR1_IALU_CMD_SUB_NE:   begin
										if (packet.op1 - packet.op2 == 0) exp = 0;
										else exp = 1;
										end
			SCR1_IALU_CMD_SUB_GE:   begin
										if (packet.op1 - packet.op2 < 0) exp = 0;
										else exp = 1;
										end
			SCR1_IALU_CMD_SLL:      exp = packet.op1 << packet.op2;    
			SCR1_IALU_CMD_SRL:      exp = packet.op1 >> packet.op2;   
			SCR1_IALU_CMD_SRA:      exp = packet.op1 >>> packet.op2; 
			
			// ≈сли честно, не пон€л, что делают эти две операции, так что не включил их в тестирование
			SCR1_IALU_CMD_SUB_LTU:  exp = 0;  
			SCR1_IALU_CMD_SUB_GEU:  exp = 0;  
			
		endcase
		
    endfunction
	
	
	// ≈сли получена команда на сравнение - сравниваем результат с соответствующим выходом модул€
	// ћожно было сделать красивее, но € сходу не придумал как
    function void write(main_adder_transaction packet);
	if ((type_scr1_ialu_cmd_sel_e(packet.cmd) != SCR1_IALU_CMD_SUB_LT) |
	    (type_scr1_ialu_cmd_sel_e(packet.cmd) != SCR1_IALU_CMD_SUB_EQ) |
	    (type_scr1_ialu_cmd_sel_e(packet.cmd) != SCR1_IALU_CMD_SUB_NE) |
	    (type_scr1_ialu_cmd_sel_e(packet.cmd) != SCR1_IALU_CMD_SUB_GE) |
	    (type_scr1_ialu_cmd_sel_e(packet.cmd) != SCR1_IALU_CMD_SUB_LTU) |
	    (type_scr1_ialu_cmd_sel_e(packet.cmd) != SCR1_IALU_CMD_SUB_GEU)) begin
			if(expected_result(type_scr1_ialu_cmd_sel_e(packet.cmd)) == packet.res) begin
				`uvm_info("SCB", $sformatf("GOOD: op1=%0d, op2=%0d, res=%0d", 
						packet.op1, packet.op2, packet.res), UVM_LOW)
			end else begin
				`uvm_error("SCB", $sformatf("ERROR: op1=%0d, op2=%0d, res=%0d, expected=%0d", 
						packet.op1, packet.op2, packet.res, packet.exp))
			end
		end else begin
			if(expected_result(type_scr1_ialu_cmd_sel_e(packet.cmd)) == packet.c_res) begin
				`uvm_info("SCB", $sformatf("GOOD: op1=%0d, op2=%0d, res=%0d", 
						packet.op1, packet.op2, packet.res), UVM_LOW)
			end else begin
				`uvm_error("SCB", $sformatf("ERROR: op1=%0d, op2=%0d, res=%0d, expected=%0d", 
						packet.op1, packet.op2, packet.c_res, packet.exp))
			end
    endfunction
endclass
