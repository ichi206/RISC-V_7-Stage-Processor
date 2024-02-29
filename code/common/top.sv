`include "definitions.vh"


module top ();

	instr32 line;
	logic [`range_instrs] instr_type;
	logic [3 : 0] branch_type;
	tag rs1_async, rs2_async, rd_async;
	word imm;

	decoder dec(.*);
	
	word rs1_read, rs2_read;
	
	registers regs(
		.clock,
		.register_writeback,
		.rs1(rs1_async), .rs2(rs2_async), .rd(rd_async),
		.rd_value,
		.rs1_read, .rs2_read);

endmodule
