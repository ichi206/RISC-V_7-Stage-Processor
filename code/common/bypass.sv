`include "../common/definitions.vh"


function logic [1 : 0] GetS3Dependence(tag rs1, rs2, rd, logic valid, use_rs2, write_rd);
	GetS3Dependence[`RS1] = valid && write_rd && rs1 != 0 && rs1 == rd;
	GetS3Dependence[`RS2] = use_rs2 && valid && write_rd && rs2 != 0 && rs2 == rd;
endfunction


module bypass (
	input logic clock, reset,
	input logic s4a_valid, s4b_valid, s5_valid,
	input logic [`range_instrs] s3_instr_type, s4a_instr_type, s4b_instr_type, s5_instr_type,
	input tag s3_rs1, s3_rs2, s4a_rs2, s4a_rd, s4b_rd, s5_rd,
	input word s4a_value, s4b_value, s5_value,
	
	output logic stall,
	output logic [1 : 0] s3_bypass,
	output word s3_bypass_rs1, s3_bypass_rs2);
	
	logic [1 : 0] s3_on_s4a, s3_on_s4b, s3_on_s5;
	assign s3_on_s4a = GetS3Dependence(
		s3_rs1, s3_rs2, s4a_rd, s4a_valid, s3_instr_type[`use_rs2], s4a_instr_type[`write_rd]);
	assign s3_on_s4b = GetS3Dependence(
		s3_rs1, s3_rs2, s4b_rd, s4b_valid, s3_instr_type[`use_rs2], s4b_instr_type[`write_rd]);
	assign s3_on_s5 = GetS3Dependence(
		s3_rs1, s3_rs2, s5_rd, s5_valid, s3_instr_type[`use_rs2], s5_instr_type[`write_rd]);
	
	assign stall = !reset && (
		s3_on_s4a != 0 && s4a_instr_type[`do_load] ||
		s3_on_s4b != 0 && s4b_instr_type[`do_load]);
	
	assign s3_bypass = s3_on_s4a | s3_on_s4b | s3_on_s5;
	
	always_comb begin
		if (s3_on_s4a[`RS1])
			s3_bypass_rs1 = s4a_value;
		else if (s3_on_s4b[`RS1])
			s3_bypass_rs1 = s4b_value;
		else
			s3_bypass_rs1 = s5_value;
		
		if (s3_on_s4a[`RS2])
			s3_bypass_rs2 = s4a_value;
		else if (s3_on_s4b[`RS2])
			s3_bypass_rs2 = s4b_value;
		else
			s3_bypass_rs2 = s5_value;
	end

endmodule
