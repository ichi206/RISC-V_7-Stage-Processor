`include "../common/definitions.vh"


function word GetImm(word line, logic [`range_instrs] instr_type_logic);
	if (instr_type_logic[`do_imm])
		return {{20{line[31]}}, line[31 : 20]};
	if (instr_type_logic[`do_jal])
		return {{12{line[31]}}, line[19 : 12], line[20], line[30 : 21], 1'b0};
	if (instr_type_logic[`do_jalr])
		return {{20{line[31]}}, line[31 : 20]};
	if (instr_type_logic[`do_branch])
		return {{20{line[31]}}, line[7], line[30 : 25], line[11 : 8], 1'b0};
	if (instr_type_logic[`do_load])
		return {{20{line[31]}}, line[31 : 20]};
	return {{20{line[31]}}, line[31 : 25], line[11 : 7]};
endfunction


function logic [3 : 0] GetBranchType(logic [2 : 0] funct3);
	case (funct3)
		3'h0: return `eq_mask;
		3'h1: return `ne_mask;
		3'h4: return `lt_mask;
		3'h5: return `ge_mask;
		default: return 4'bx;
	endcase
endfunction


function [2 : 0] GetLoadType(logic [2 : 0] funct3);
	case (funct3)
		3'h0: return `byte_mask;
		3'h1: return `hword_mask;
		3'h2: return `word_mask;
		default: return 3'bx;
	endcase
endfunction


module decoder(
	input logic clock,
	input word line,
	
	output logic [`range_instrs] instr_type,
	output logic [3 : 0] branch_type,
	output logic [2 : 0] load_type,
	output tag rs1_async, rs2_async, rd,
	output word imm);

	wire [6 : 0] op = line[6 : 0];
	wire [2 : 0] funct3 = line[14 : 12];
	wire [6 : 0] funct7 = line[31 : 25];
	
	logic [`range_instrs] instr_type_logic;
	assign instr_type_logic[`do_reg]     = op == `opcode_reg;
	assign instr_type_logic[`do_imm]     = op == `opcode_imm;
	assign instr_type_logic[`add_or_sub] = op == `opcode_reg && funct7 == 7'h20;
	assign instr_type_logic[`do_jal]     = op == `opcode_jal;
	assign instr_type_logic[`do_jalr]    = op == `opcode_jalr;
	assign instr_type_logic[`do_branch]  = op == `opcode_branch;
	assign instr_type_logic[`do_load]    = op == `opcode_load;
	assign instr_type_logic[`do_store]   = op == `opcode_store;
	
	logic [3 : 0] branch_type_logic;
	assign branch_type_logic = GetBranchType(funct3);
	
	logic [2 : 0] load_type_logic;
	assign load_type_logic = GetLoadType(funct3);
	
	assign rs1_async = line[19 : 15];
	assign rs2_async = line[24 : 20];
	tag rd_logic;
	assign rd_logic = line[11 : 7];
	
	word imm_logic;
	assign imm_logic = GetImm(line, instr_type_logic);
	
	always_ff @(posedge clock) begin
		instr_type = instr_type_logic;
		branch_type = branch_type_logic;
		load_type = load_type_logic;
		rd = rd_logic;
		imm = imm_logic;
	end
	
endmodule
