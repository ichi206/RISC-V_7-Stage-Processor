`include "../common/definitions.vh"


function logic [3 : 0] WhichByte(logic [1 : 0] byte_select);
	case (byte_select)
		2'b00: return 4'b0001;
		2'b01: return 4'b0010;
		2'b10: return 4'b0100;
		2'b11: return 4'b1000;
	endcase
endfunction


function logic [3 : 0] WhichHword(logic hword_select);
	if (!hword_select)
		return 4'b0011;
	else
		return 4'b1100;
endfunction


function word PlaceByte(logic [1 : 0] byte_select, byte value);
	case (byte_select)
		2'b00: return {24'bx, value};
		2'b01: return {16'bx, value, 8'bx};
		2'b10: return {8'bx, value, 16'bx};
		2'b11: return {value, 24'bx};
	endcase
endfunction


function word PlaceHword(logic hword_select, hword value);
	if (!hword_select)
		return {16'bx, value};
	else
		return {value, 16'bx};
endfunction


module data_memory_write_interface
(
	input word long_addr,
	input word register_write_value,
	input logic [2 : 0] load_type,
	
	output logic [3 : 0] write_to,
	output word true_write_value
);

	wire [1 : 0] byte_select = long_addr[1 : 0];
	wire hword_select = long_addr[1];
	
	always_comb
	begin
		if (load_type[`BYTE]) begin
			write_to = WhichByte(byte_select);
			true_write_value = PlaceByte(byte_select, register_write_value[`byte0]);
		end
		else if (load_type[`HWORD]) begin
			write_to = WhichHword(hword_select);
			true_write_value = PlaceHword(hword_select, register_write_value[`hword0]);
		end
		else begin
			write_to = 4'b1111;
			true_write_value = register_write_value;
		end
	end

endmodule
