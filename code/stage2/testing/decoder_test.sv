`include "../../common/definitions.vh"


module decoder_test ();

	logic clock;
	initial begin
		clock = 1;
		forever #50 clock = ~clock;
	end
	
	wire read = 1;
	word long_instruction_addr, instruction;

	instruction_memory #("instructions.mif") im (.*);
	
	logic [`range_instrs] instr_type;
	wire do_reg = instr_type[`do_reg];
	wire do_imm = instr_type[`do_imm];
	wire add_or_sub = instr_type[`add_or_sub];
	wire do_jal = instr_type[`do_jal];
	wire do_branch = instr_type[`do_branch];
	wire do_load = instr_type[`do_load];
	wire do_store = instr_type[`do_store];
	
	logic [3 : 0] branch_type;
	wire eq = branch_type[`eq];
	wire ne = branch_type[`ne];
	wire lt = branch_type[`lt];
	wire ge = branch_type[`ge];
	
	logic [2 : 0] load_type;
	wire BYTE = load_type[`BYTE];
	wire HWORD = load_type[`HWORD];
	wire WORD = load_type[`WORD];
	
	tag rs1_async, rs2_async, rd_async;
	word imm;

	decoder dec (
		.clock,
		.line(instruction),
		.instr_type, .branch_type, .load_type,
		.rs1_async, .rs2_async, .rd_async, .imm);
	
	logic reset;
	
	program_counter pc (
		.clock, .reset, .register_writeback(1'b1), .jump(1'b0),
		.jump_offset(32'b0),
		.instruction_addr(long_instruction_addr));
	
	initial begin
		reset = 1;
		@(posedge clock);
		reset = 0;
		repeat(14) @(posedge clock);
		$stop;
	end

endmodule
