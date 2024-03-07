`include "definitions.vh"


module top #(parameter program_file) (
	input logic clock, reset,
	output logic [7 : 0] display);

	logic [6 : 0] stage;
	control c (.*);

	word long_instruction_addr, instruction;
	
	instruction_memory #(program_file) instrs (
		.clock, .stall(~stage[`instr_stage]),
		.long_instruction_addr,
		.instruction);
	
	logic s3_valid, s4a_valid, s4b_valid, s5_valid;
	logic [`range_instrs] s3_instr_type, s4a_instr_type, s4b_instr_type, s5_instr_type;
	logic [3 : 0] branch_type;
	logic [2 : 0] s3_load_type, s4a_load_type, s4b_load_type, s5_load_type;
	tag rs1_async, rs2_async, rd;
	word imm;
	
	decoder dec (
		.clock, .stall(~stage[`decode_stage]),
		.line(instruction),
		.instr_type(s3_instr_type), .branch_type, .load_type(s3_load_type),
		.rs1_async, .rs2_async, .rd,
		.imm);
	
	word rs1_read, rs2_read;
	word s4a_jal_addr, s4b_jal_addr, s5_jal_addr;
	word s4a_eval, s4b_eval, s5_eval;
	logic flush;
	
	stage3_top s3 (
		.clock, .reset, .stall(~stage[`exe_stage]), .valid(1'b1),
		.instr_type(s3_instr_type), .branch_type,
		.rs1_val(rs1_read), .rs2_val(rs2_read), .imm,
		.instruction_addr(long_instruction_addr),
		.flush,
		.jal_addr(s4a_jal_addr), .eval(s4a_eval));
	
	always_ff @(posedge clock) begin
		s4a_valid = s3_valid;
		s4a_instr_type = s3_instr_type;
		s4a_load_type = s3_load_type;
	end
	
	always_ff @(posedge clock) begin
		s4b_valid = s4a_valid;
		s4b_instr_type = s4a_instr_type;
		s4b_load_type = s4a_load_type;
		s4b_jal_addr = s4a_jal_addr;
		s4b_eval = s4a_eval;
	end
	
	logic mem_write, mem_read;
	word memory_read_value;
	
	data_memory_top mem (
		.clock, .valid(stage[`data_stage]),
		.instr_type(s4a_instr_type), .load_type(s4a_load_type),
		.long_addr(s4a_eval), .write_value(rs2_read),
		.read_value(memory_read_value));
	
	always_ff @(posedge clock) begin
		s5_valid = s4b_valid;
		s5_instr_type = s4b_instr_type;
		s5_load_type = s4b_load_type;
		s5_jal_addr = s4b_jal_addr;
		s5_eval = s4b_eval;
	end
	
	stage5_top s5 (
		.clock, .valid(stage[`reg_stage]), .sign_extend(1'b0),
		.instr_type(s5_instr_type), .load_type(s5_load_type),
		.rs1(rs1_async), .rs2(rs2_async), .rd,
		.jal_addr(s5_jal_addr), .alu_output(s5_eval), .memory_read_value,
		.rs1_read, .rs2_read);
	
	assign display = long_instruction_addr[7 : 0];
	
endmodule
