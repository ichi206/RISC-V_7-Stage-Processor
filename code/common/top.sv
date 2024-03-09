`include "definitions.vh"


module top #(parameter program_file) (
	input logic clock, reset,
	output logic [7 : 0] display);

	logic stall, do_flush;
	word s1a_instruction_addr, s1b_instruction_addr, s2_instruction_addr, s3_instruction_addr;
	word s1b_jal_addr, s2_jal_addr, s3_jal_addr, s4a_jal_addr, s4b_jal_addr, s5_jal_addr;
	word instruction;
	
	always_ff @(posedge clock) begin
		if (!stall)
			s1b_instruction_addr <= s1a_instruction_addr;
	end
	
	instruction_memory #(program_file) instrs (
		.clock, .stall,
		.long_instruction_addr(s1a_instruction_addr),
		.instruction);
	
	always_ff @(posedge clock) begin
		if (!stall) begin
			s2_instruction_addr <= s1b_instruction_addr;
			s2_jal_addr <= s1b_jal_addr;
		end
	end
	
	logic [`range_instrs] s3_instr_type, s4a_instr_type, s4b_instr_type, s5_instr_type;
	logic [3 : 0] branch_type;
	logic [2 : 0] s3_load_type, s4a_load_type, s4b_load_type, s5_load_type;
	tag rs1_async, rs2_async, s3_rs1, s3_rs2, s3_rd, s4a_rs2, s4a_rd, s4b_rd, s5_rd;
	word imm;
	
	decoder dec (
		.clock, .stall,
		.line(instruction),
		.instr_type(s3_instr_type), .branch_type, .load_type(s3_load_type),
		.rs1_async, .rs2_async, .rs1(s3_rs1), .rs2(s3_rs2), .rd(s3_rd),
		.imm);
	
	always_ff @(posedge clock) begin
		if (!stall) begin
			s3_instruction_addr <= s2_instruction_addr;
			s3_jal_addr <= s2_jal_addr;
		end
	end
	
	word s3_rs1_read, s3_rs2_read, s4a_rs2_val;
	word s3_bypass_rs1, s3_bypass_rs2, s4_bypass_rs2;
	word s4a_eval, s4b_eval, s5_eval;
	logic s3_valid, s4a_valid, s4b_valid, s5_valid;
	logic [1 : 0] s3_bypass;
	logic s4_bypass;
	
	stage3_top s3 (
		.clock, .reset, .stall, .valid(s3_valid),
		.bypass(s3_bypass),
		.instr_type(s3_instr_type), .branch_type,
		.s3_instruction_addr, .rs1_read(s3_rs1_read), .rs2_read(s3_rs2_read), .imm,
		.rs1_bypass_value(s3_bypass_rs1), .rs2_bypass_value(s3_bypass_rs2),
		.do_flush,
		.s4a_rs2_val, .s1a_instruction_addr,
		.jal_addr(s1b_jal_addr), .eval(s4a_eval));
	
	always_ff @(posedge clock) begin
		s4a_valid <= s3_valid;
		s4a_instr_type <= s3_instr_type;
		s4a_load_type <= s3_load_type;
		s4a_rs2 <= s3_rs2;
		s4a_rd <= s3_rd;
		s4a_jal_addr <= s3_jal_addr;
	end
	
	always_ff @(posedge clock) begin
		s4b_valid <= s4a_valid;
		s4b_instr_type <= s4a_instr_type;
		s4b_load_type <= s4a_load_type;
		s4b_rd <= s4a_rd;
		s4b_jal_addr <= s4a_jal_addr;
		s4b_eval <= s4a_eval;
	end
	
	logic mem_write, mem_read;
	word memory_read_value;
	
	data_memory_top mem (
		.clock, .valid(s4a_valid),
		.instr_type(s4a_instr_type), .load_type(s4a_load_type),
		.long_addr(s4a_eval), .rs2_value(s4a_rs2_val),
		.read_value(memory_read_value));
	
	always_ff @(posedge clock) begin
		s5_valid <= s4b_valid;
		s5_instr_type <= s4b_instr_type;
		s5_load_type <= s4b_load_type;
		s5_rd <= s4b_rd;
		s5_jal_addr <= s4b_jal_addr;
		s5_eval <= s4b_eval;
	end
	
	word rd_value_async;
	
	stage5_top s5 (
		.clock, .stall, .valid(s5_valid), .sign_extend(1'b0),
		.instr_type(s5_instr_type), .load_type(s5_load_type),
		.rs1(rs1_async), .rs2(rs2_async), .rd(s5_rd),
		.jal_addr(s5_jal_addr), .alu_output(s5_eval), .memory_read_value,
		.rs1_read(s3_rs1_read), .rs2_read(s3_rs2_read), .rd_value_async);
	
	bypass b (
		.clock, .reset,
		.s4a_valid, .s4b_valid, .s5_valid,
		.s3_instr_type, .s4a_instr_type, .s4b_instr_type, .s5_instr_type,
		.s3_rs1, .s3_rs2, .s4a_rs2, .s4a_rd, .s4b_rd, .s5_rd,
		.s4a_value(s4a_eval), .s4b_value(s4b_eval), .s5_value(rd_value_async),
		.stall, .s3_bypass,
		.s3_bypass_rs1, .s3_bypass_rs2);
	
	flush f (
		.clock, .reset, .stall, .do_flush,
		.valid(s3_valid));
	
	logic [7 : 0] display_logic;
	assign display_logic = s5_instr_type[`write_rd] && s5_rd == 5'd10 ? rd_value_async[7 : 0] : display;
	
	always_ff @(posedge clock) begin
		if (reset)
			display <= {7{1'b1}};
		else
			display <= display_logic;
	end
	
endmodule
