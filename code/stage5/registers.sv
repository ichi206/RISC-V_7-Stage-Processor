`include "../common/definitions.vh"


module registers
(
	input logic clock, register_writeback,
	input tag rs1, rs2, rd,
	input word rd_value,
	output word rs1_read, rs2_read
);
	// simulate reg x0 always being zero
	word register_values [1 : 31];
	
	word rs1_value, rs2_value;
	assign rs1_value = rs1 != 0 ? register_values[rs1] : 0;
	assign rs2_value = rs2 != 0 ? register_values[rs2] : 0;
	
	always_ff @(posedge clock)
	begin
		rs1_read = rs1_value;
		rs2_read = rs2_value;
		if (register_writeback && rd != 0)
			register_values[rd] = rd_value;
	end

endmodule
