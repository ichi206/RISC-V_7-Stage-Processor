`include "../common/definitions.vh"


module stage5_top (
	input logic clock, reset, sign_extend, is_writeback_stage,
	input logic [`range_instrs] instr_type,
	input tag rs1, rs2, rd,
	input logic [3 : 0] branch_type, compare,
	input word alu_output, memory_read_value, jump_offset,
	input logic [2 : 0] load_type,
	
	output word instruction_addr, rs1_read, rs2_read);
	
	word long_addr;
	assign long_addr = alu_output;
	word true_read_value;
	data_memory_read_interface dmri (.*);
	
	word rd_value;
	assign rd_value = instr_type[`do_load] ? true_read_value : alu_output;
	logic write_rd;
	assign write_rd = is_writeback_stage &
		(instr_type[`do_reg] | instr_type[`do_imm] | instr_type[`do_load]);
	
	registers regs (.*);
	
	logic compare_match;
	assign compare_match =
		branch_type[`eq] & compare[`eq] |
		branch_type[`ne] & compare[`ne] |
		branch_type[`lt] & compare[`lt] |
		branch_type[`ge] & compare[`ge];
	
	assign jump = instr_type[`do_jal] | (instr_type[`do_branch] & compare_match);
	
	program_counter pc (.*);
	
endmodule
