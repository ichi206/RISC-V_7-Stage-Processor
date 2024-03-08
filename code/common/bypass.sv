`include "../common/definitions.vh"


function logic [1 : 0] GetDependence(tag rs1, rs2, rd, logic valid, use_rs2, write_rd);
	GetDependence[`RS1] = valid && write_rd && rs1 != 0 && rs1 == rd;
	GetDependence[`RS2] = valid && use_rs2 && write_rd && rs2 != 0 && rs2 == rd;
endfunction


module bypass (
	input logic clock, reset,
	input logic s4a_valid, s4b_valid, s5_valid,
	input logic [`range_instrs] s3_instr_type, s4a_instr_type, s4b_instr_type, s5_instr_type,
	input tag s3_rs1, s3_rs2, s4a_rd, s4b_rd, s5_rd,
	input word s4a_value, s4b_value, s5_value,
	
	output logic stall,
	output logic [1 : 0] bypass,
	output word rs1_bypass_value, rs2_bypass_value);
	
	wire [1 : 0] s4a_dependence = GetDependence(
		s3_rs1, s3_rs2, s4a_rd, s4a_valid, s3_instr_type[`use_rs2], s4a_instr_type[`write_rd]);
	wire [1 : 0] s4b_dependence = GetDependence(
		s3_rs1, s3_rs2, s4b_rd, s4b_valid, s3_instr_type[`use_rs2], s4b_instr_type[`write_rd]);
	wire [1 : 0] s5_dependence = GetDependence(
		s3_rs1, s3_rs2, s5_rd, s5_valid, s3_instr_type[`use_rs2], s5_instr_type[`write_rd]);
	
	assign stall = !reset && (
		s4a_dependence != 0 && s4a_instr_type[`do_load] ||
		s4b_dependence != 0 && s4b_instr_type[`do_load]);
	assign bypass = s4a_dependence | s4b_dependence | s5_dependence;
	
	always_comb begin
		if (s4a_dependence[`RS1])
			rs1_bypass_value = s4a_value;
		else if (s4b_dependence[`RS1])
			rs1_bypass_value = s4b_value;
		else
			rs1_bypass_value = s5_value;
		
		if (s4a_dependence[`RS2])
			rs2_bypass_value = s4a_value;
		else if (s4b_dependence[`RS2])
			rs2_bypass_value = s4b_value;
		else
			rs2_bypass_value = s5_value;
	end

endmodule
