`include "../common/definitions.vh"


module stage5_top (
	input logic clock, reset, sign_extend, register_writeback, jump, do_load,
	input tag rs1, rs2, rd,
	input word long_addr, memory_read_value, alu_output, jump_offset,
	input logic [2 : 0] load_type,
	
	output word instruction_addr, rs1_read, rs2_read);
	
	word true_read_value;
	data_memory_read_interface dmri (.*);
	
	word rd_value;
	assign rd_value = do_load ? true_read_value : alu_output;
	registers regs (.*);
	
	program_counter pc (.*);
	
endmodule
