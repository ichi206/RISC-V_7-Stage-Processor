`include "../common/definitions.vh"


module registers
(
	input logic clock, stall, valid, write_rd,
	input tag rs1, rs2, rd,
	input word rd_value,
	output word rs1_read, rs2_read
);
	// simulate reg x0 always being zero
	word register_values [1 : 31];
	
	always_ff @(negedge clock) begin

	end
	// = used instead of <= to ensure write before read
	always_ff @(posedge clock) begin
		if (valid && write_rd && rd != 0)
			register_values[rd] = rd_value;
		if (!stall) begin
			rs1_read = rs1 != 0 ? register_values[rs1] : 0;
			rs2_read = rs2 != 0 ? register_values[rs2] : 0;
		end
	end

endmodule
