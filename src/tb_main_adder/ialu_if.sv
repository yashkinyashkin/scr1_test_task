
`include "scr1_riscv_isa_decoding.svh"
`include "scr1_arch_description.svh"
`include "scr1_search_ms1.svh"


interface ialu_if (input clk);

	logic 						rst_n,                      // IALU reset
								exu2ialu_rvm_cmd_vd_i,      // MUL/DIV command valid
								ialu2exu_rvm_res_rdy_o,     // MUL/DIV result ready
								ialu2exu_cmp_res_o;         // IALU comparison result
						
	logic [`SCR1_XLEN-1:0]  	exu2ialu_main_op1_i,        // main ALU 1st operand
								exu2ialu_main_op2_i,        // main ALU 2nd operand
								ialu2exu_main_res_o;        // main ALU result
	
	// type_scr1_ialu_cmd_sel_e	exu2ialu_cmd_i;             // IALU command
	logic [SCR1_IALU_CMD_WIDTH_E-1:0]	exu2ialu_cmd_i;             // IALU command
	
endinterface: ialu_if
