`include "definitions.sv"


module registers
(
	input logic clock, write_to_rd,
	input tag rs1, rs2, rd,
	input word rd_value,
	
	output word rs1_value, rs2_value
);
	// simulate reg x0 always being zero
	reg [`word_size - 1 : 0] register_values [1 : 31];
	
	always_ff @(posedge clock)
	begin
		if (write_to_rd && rd != 0)
			register_values[rd] = rd_value;
	end
	
	assign rs1_value = rs1 != 0 ? register_values[rs1] : 0;
	assign rs2_value = rs2 != 0 ? register_values[rs2] : 0;

endmodule
