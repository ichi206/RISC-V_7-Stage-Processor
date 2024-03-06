`include "definitions.vh"


module top #(parameter program_file) (
	input logic clock, reset,
	output logic [7 : 0] display);

	logic [4 : 0] stage;
	control c (.*);

	word long_instruction_addr, instruction;
	
	instruction_memory #(program_file) instrs (
		.clock, .reset, .is_instr_stage(stage[`instr_stage]),
		.long_instruction_addr,
		.instruction);
	
	logic [`range_instrs] s3_instr_type, s4_instr_type, s5_instr_type;
	logic [3 : 0] branch_type;
	logic [2 : 0] s3_load_type, s4_load_type, s5_load_type;
	tag rs1_async, rs2_async, rd;
	word imm;
	
	decoder dec (
		.clock,
		.line(instruction),
		.instr_type(s3_instr_type), .branch_type, .load_type(s3_load_type),
		.rs1_async, .rs2_async, .rd,
		.imm);
	
	word rs1_read, rs2_read;
	word s4_ia_plus4, s5_ia_plus4;
	word s4_eval, s5_eval;
	
	stage3_top s3 (
		.clock, .reset, .is_exe_stage(stage[`exe_stage]),
		.instr_type(s3_instr_type), .branch_type,
		.rs1_val(rs1_read), .rs2_val(rs2_read), .imm,
		.instruction_addr(long_instruction_addr),
		.ia_plus4(s4_ia_plus4), .eval(s4_eval));
	
	always_ff @(posedge clock) begin
		s4_instr_type = s3_instr_type;
		s4_load_type = s3_load_type;
	end
	
	logic mem_write, mem_read;
	word memory_read_value;
	
	data_memory_top mem (
		.clock, .is_data_stage(stage[`data_stage]),
		.instr_type(s4_instr_type), .load_type(s4_load_type),
		.long_addr(s4_eval), .write_value(rs2_read),
		.read_value(memory_read_value));
	
	always_ff @(posedge clock) begin
		s5_instr_type = s4_instr_type;
		s5_load_type = s4_load_type;
		s5_ia_plus4 = s4_ia_plus4;
		s5_eval = s4_eval;
	end
	
	stage5_top s5 (
		.clock, .sign_extend(1'b0), .is_writeback_stage(stage[`reg_stage]),
		.instr_type(s5_instr_type), .load_type(s5_load_type),
		.rs1(rs1_async), .rs2(rs2_async), .rd,
		.ia_plus4(s5_ia_plus4), .alu_output(s5_eval), .memory_read_value,
		.rs1_read, .rs2_read);
	
	assign display = long_instruction_addr[7 : 0];
	
endmodule
