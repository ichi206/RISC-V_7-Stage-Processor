`include "../common/definitions.vh"


module stage5_top (
	input logic clock, valid, sign_extend,
	input logic [`range_instrs] instr_type,
	input logic [2 : 0] load_type,
	input tag rs1, rs2, rd,
	input word jal_addr, alu_output, memory_read_value,
	
	output word rs1_read, rs2_read, rd_value_async);
	
	word true_read_value;
	
	data_memory_read_interface dmri (
		.sign_extend,
		.long_addr(alu_output), .memory_read_value,
		.load_type,
		.true_read_value);
	
	word next_instruction_addr;
	
	always_comb begin
		if (instr_type[`do_load])
			rd_value_async = true_read_value;
		else if (instr_type[`do_jal] | instr_type[`do_jalr])
			rd_value_async = jal_addr;
		else
			rd_value_async = alu_output;
	end
	
	wire write_rd = valid & ~(
		instr_type[`do_store] | instr_type[`do_branch]);
	
	registers regs (
		.clock, .valid, .write_rd(instr_type[`write_rd]),
		.rs1, .rs2, .rd,
		.rd_value(rd_value_async),
		.rs1_read, .rs2_read);
	
endmodule
