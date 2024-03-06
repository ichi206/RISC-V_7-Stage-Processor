`include "../common/definitions.vh"


module stage5_top (
	input logic clock, sign_extend, is_writeback_stage,
	input logic [`range_instrs] instr_type,
	input logic [2 : 0] load_type,
	input tag rs1, rs2, rd,
	input word ia_plus4, alu_output, memory_read_value,
	
	output word rs1_read, rs2_read);
	
	word long_addr;
	assign long_addr = alu_output;
	word true_read_value;
	data_memory_read_interface dmri (.*);
	
	word next_instruction_addr, rd_value;
	
	always_comb begin
		if (instr_type[`do_load])
			rd_value = true_read_value;
		else if (instr_type[`do_jal] | instr_type[`do_jalr])
			rd_value = ia_plus4;
		else
			rd_value = alu_output;
	end
	
	logic write_rd;
	assign write_rd = is_writeback_stage & ~(
		instr_type[`do_store] | instr_type[`do_branch]);
	
	registers regs (.*);
	
endmodule
