`include "../common/definitions.vh"


function byte GetCorrectByte(word read, logic[1 : 0] byte_select);
	case (byte_select)
		2'b00: return read[`byte0];
		2'b01: return read[`byte1];
		2'b10: return read[`byte2];
		2'b11: return read[`byte3];
	endcase
endfunction


function hword GetCorrectWord(word read, logic hword_select);
	if (!hword_select)
		return read[`hword0];
	else
		return read[`hword1];
endfunction


function word FormatByte(byte value, logic sign_extend);
	if (sign_extend)
		return {{24{value[7]}}, value};
	else
		return {24'b0, value};
endfunction


function word FormatHword(hword value, logic sign_extend);
	if (sign_extend)
		return {{16{value[15]}}, value};
	else
		return {16'b0, value};
endfunction


module data_read_interface
(
	input logic sign_extend,
	input word long_addr,
	input word memory_read_value,
	input logic [2 : 0] load_type,
	output word true_read_value
);

	wire [1 : 0] byte_select = long_addr[1 : 0];
	wire hword_select = long_addr[1];
	
	byte correct_byte;
	assign correct_byte = GetCorrectByte(memory_read_value, byte_select);
	word correct_hword;
	assign correct_word = GetCorrectWord(memory_read_value, hword_select);
	
	always_comb
	begin
		if (load_type[`BYTE])
			true_read_value = FormatByte(correct_byte, sign_extend);
		else if (load_type[`HWORD])
			true_read_value = FormatHword(correct_byte, sign_extend);
		else
			true_read_value = memory_read_value;
	end

endmodule
