`include "../common/definitions.vh"


module stage5_top (
	input logic clock, reset, sign_extend, is_writeback_stage,
	input logic [`range_instrs] instr_type,
	input tag rs1, rs2, rd,
	input logic [3 : 0] branch_type, compare,
	input word alu_output, memory_read_value, imm,
	input logic [2 : 0] load_type,
	
	output word instruction_addr, rs1_read, rs2_read);
	
	word long_addr;
	assign long_addr = alu_output;
	word true_read_value;
	data_memory_read_interface dmri (.*);
	
	word next_instruction_addr, rd_value;
	
	always_comb begin
		if (instr_type[`do_load])
			rd_value = true_read_value;
		else if (instr_type[`do_jal] | instr_type[`do_jalr])
			rd_value = next_instruction_addr;
		else
			rd_value = alu_output;
	end
	
	logic write_rd;
	assign write_rd = is_writeback_stage & ~(
		instr_type[`do_store] | instr_type[`do_branch]);
	
	registers regs (.*);
	
	logic compare_match;
	assign compare_match =
		branch_type[`eq] & compare[`eq] |
		branch_type[`ne] & compare[`ne] |
		branch_type[`lt] & compare[`lt] |
		branch_type[`ge] & compare[`ge];
	
	wire jump = instr_type[`do_jal] | (instr_type[`do_branch] & compare_match);
	wire jalr = instr_type[`do_jalr];
	
	word jump_offset;
	assign jump_offset = instr_type[`do_jalr] ? alu_output : imm;
	
	program_counter pc (.*);
	
endmodule
