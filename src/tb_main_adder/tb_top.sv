`timescale 1ns/1ps

`include "uvm_macros.svh" 
`include "scr1_riscv_isa_decoding.svh"
`include "scr1_arch_description.svh"
`include "scr1_search_ms1.svh"

`include "transaction.sv"
`include "tests.sv"
 

import uvm_pkg::*;


module tb_top;

	bit clk = 0;
	always #5 clk = ~clk;
	
	ialu_if test_if(clk);
	
	scr1_pipe_ialu dut(
		.clk(clk),
		.rst_n(test_if.rst_n),                  
		.exu2ialu_rvm_cmd_vd_i(test_if.exu2ialu_rvm_cmd_vd_i),
		.ialu2exu_rvm_res_rdy_o(test_if.ialu2exu_rvm_res_rdy_o), 
		.ialu2exu_cmp_res_o(test_if.ialu2exu_cmp_res_o),     
		
		.exu2ialu_main_op1_i(test_if.exu2ialu_main_op1_i),    
		.exu2ialu_main_op2_i(test_if.exu2ialu_main_op2_i),    
		.ialu2exu_main_res_o(test_if.ialu2exu_main_res_o),    
		
		.exu2ialu_cmd_i(type_scr1_ialu_cmd_sel_e'(test_if.exu2ialu_cmd_i)),   
		
        .exu2ialu_addr_op1_i('0),
        .exu2ialu_addr_op2_i('0),
        .ialu2exu_addr_res_o()  		
	);
	
	initial begin
	
        test_if.exu2ialu_rvm_cmd_vd_i = 1;
        test_if.exu2ialu_main_op1_i = '0;
        test_if.exu2ialu_main_op2_i = '0;
        test_if.exu2ialu_cmd_i = SCR1_IALU_CMD_ADD;
		
	    test_if.rst_n = 0;
		#100;
		test_if.rst_n = 1;
		#20;
		
	    uvm_config_db #(virtual ialu_if)::set(null, "*", "test_if", test_if); 
		run_test("addition_test");
		#20;
		run_test("substraction_test");
		#20;
		run_test("and_test");
		#20;
		run_test("or_test");
		#20;
		run_test("xor_test");
		#20;
		run_test("less_then_test");
		#20;
		run_test("equal_test");
		#20;
		run_test("greater_equal_test");
		#20;
		run_test("not_equal_test");
		#20;
		run_test("left_shift_test");
		#20;
		run_test("right_shift_test");
		#20;
		run_test("a_right_shift_test");
	end

endmodule
