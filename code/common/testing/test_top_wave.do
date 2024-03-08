onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_top/clock
add wave -noupdate /test_top/reset
add wave -noupdate -radix binary /test_top/cpu/stall
add wave -noupdate /test_top/cpu/do_flush
add wave -noupdate /test_top/cpu/s3_valid
add wave -noupdate /test_top/cpu/s4a_valid
add wave -noupdate /test_top/cpu/s4b_valid
add wave -noupdate /test_top/cpu/s5_valid
add wave -noupdate /test_top/cpu/bypass
add wave -noupdate -radix unsigned /test_top/cpu/instrs/long_instruction_addr
add wave -noupdate -radix hexadecimal /test_top/cpu/instrs/instruction
add wave -noupdate -radix unsigned /test_top/cpu/s3_rs1
add wave -noupdate -radix unsigned /test_top/cpu/s3_rs2
add wave -noupdate -radix unsigned /test_top/cpu/s3_rd
add wave -noupdate -radix unsigned /test_top/cpu/s4a_rd
add wave -noupdate -radix unsigned /test_top/cpu/s4b_rd
add wave -noupdate -radix unsigned /test_top/cpu/s5_rd
add wave -noupdate -radix unsigned /test_top/cpu/rs1_async
add wave -noupdate -radix unsigned /test_top/cpu/rs2_async
add wave -noupdate -radix unsigned /test_top/cpu/rs1_read
add wave -noupdate -radix unsigned /test_top/cpu/rs2_read
add wave -noupdate -radix decimal /test_top/cpu/imm
add wave -noupdate -radix decimal /test_top/cpu/s4a_eval
add wave -noupdate -radix decimal /test_top/cpu/s4b_eval
add wave -noupdate -radix decimal /test_top/cpu/s5_eval
add wave -noupdate -radix decimal /test_top/cpu/rd_value_async
add wave -noupdate -radix hexadecimal -childformat {{{/test_top/cpu/instrs/mem[0]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[1]} -radix binary} {{/test_top/cpu/instrs/mem[2]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[3]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[4]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[5]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[6]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[7]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[8]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[9]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[10]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[11]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[12]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[13]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[14]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[15]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[16]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[17]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[18]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[19]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[20]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[21]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[22]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[23]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[24]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[25]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[26]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[27]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[28]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[29]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[30]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[31]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[32]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[33]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[34]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[35]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[36]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[37]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[38]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[39]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[40]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[41]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[42]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[43]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[44]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[45]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[46]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[47]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[48]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[49]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[50]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[51]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[52]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[53]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[54]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[55]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[56]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[57]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[58]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[59]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[60]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[61]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[62]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[63]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[64]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[65]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[66]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[67]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[68]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[69]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[70]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[71]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[72]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[73]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[74]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[75]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[76]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[77]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[78]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[79]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[80]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[81]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[82]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[83]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[84]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[85]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[86]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[87]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[88]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[89]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[90]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[91]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[92]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[93]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[94]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[95]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[96]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[97]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[98]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[99]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[100]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[101]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[102]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[103]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[104]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[105]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[106]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[107]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[108]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[109]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[110]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[111]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[112]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[113]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[114]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[115]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[116]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[117]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[118]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[119]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[120]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[121]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[122]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[123]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[124]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[125]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[126]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[127]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[128]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[129]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[130]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[131]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[132]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[133]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[134]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[135]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[136]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[137]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[138]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[139]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[140]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[141]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[142]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[143]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[144]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[145]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[146]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[147]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[148]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[149]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[150]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[151]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[152]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[153]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[154]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[155]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[156]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[157]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[158]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[159]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[160]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[161]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[162]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[163]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[164]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[165]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[166]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[167]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[168]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[169]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[170]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[171]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[172]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[173]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[174]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[175]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[176]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[177]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[178]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[179]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[180]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[181]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[182]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[183]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[184]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[185]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[186]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[187]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[188]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[189]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[190]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[191]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[192]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[193]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[194]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[195]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[196]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[197]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[198]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[199]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[200]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[201]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[202]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[203]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[204]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[205]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[206]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[207]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[208]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[209]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[210]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[211]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[212]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[213]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[214]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[215]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[216]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[217]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[218]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[219]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[220]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[221]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[222]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[223]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[224]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[225]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[226]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[227]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[228]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[229]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[230]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[231]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[232]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[233]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[234]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[235]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[236]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[237]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[238]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[239]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[240]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[241]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[242]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[243]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[244]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[245]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[246]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[247]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[248]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[249]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[250]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[251]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[252]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[253]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[254]} -radix hexadecimal} {{/test_top/cpu/instrs/mem[255]} -radix hexadecimal}} -subitemconfig {{/test_top/cpu/instrs/mem[0]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[1]} {-height 15 -radix binary} {/test_top/cpu/instrs/mem[2]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[3]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[4]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[5]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[6]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[7]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[8]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[9]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[10]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[11]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[12]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[13]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[14]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[15]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[16]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[17]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[18]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[19]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[20]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[21]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[22]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[23]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[24]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[25]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[26]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[27]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[28]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[29]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[30]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[31]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[32]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[33]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[34]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[35]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[36]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[37]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[38]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[39]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[40]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[41]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[42]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[43]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[44]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[45]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[46]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[47]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[48]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[49]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[50]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[51]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[52]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[53]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[54]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[55]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[56]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[57]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[58]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[59]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[60]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[61]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[62]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[63]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[64]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[65]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[66]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[67]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[68]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[69]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[70]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[71]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[72]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[73]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[74]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[75]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[76]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[77]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[78]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[79]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[80]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[81]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[82]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[83]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[84]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[85]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[86]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[87]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[88]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[89]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[90]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[91]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[92]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[93]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[94]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[95]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[96]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[97]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[98]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[99]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[100]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[101]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[102]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[103]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[104]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[105]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[106]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[107]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[108]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[109]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[110]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[111]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[112]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[113]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[114]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[115]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[116]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[117]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[118]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[119]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[120]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[121]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[122]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[123]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[124]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[125]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[126]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[127]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[128]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[129]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[130]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[131]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[132]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[133]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[134]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[135]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[136]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[137]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[138]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[139]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[140]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[141]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[142]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[143]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[144]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[145]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[146]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[147]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[148]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[149]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[150]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[151]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[152]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[153]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[154]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[155]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[156]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[157]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[158]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[159]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[160]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[161]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[162]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[163]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[164]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[165]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[166]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[167]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[168]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[169]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[170]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[171]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[172]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[173]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[174]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[175]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[176]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[177]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[178]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[179]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[180]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[181]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[182]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[183]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[184]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[185]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[186]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[187]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[188]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[189]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[190]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[191]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[192]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[193]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[194]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[195]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[196]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[197]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[198]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[199]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[200]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[201]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[202]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[203]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[204]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[205]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[206]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[207]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[208]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[209]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[210]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[211]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[212]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[213]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[214]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[215]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[216]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[217]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[218]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[219]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[220]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[221]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[222]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[223]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[224]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[225]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[226]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[227]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[228]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[229]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[230]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[231]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[232]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[233]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[234]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[235]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[236]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[237]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[238]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[239]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[240]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[241]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[242]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[243]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[244]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[245]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[246]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[247]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[248]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[249]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[250]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[251]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[252]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[253]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[254]} {-height 15 -radix hexadecimal} {/test_top/cpu/instrs/mem[255]} {-height 15 -radix hexadecimal}} /test_top/cpu/instrs/mem
add wave -noupdate -radix decimal -childformat {{{/test_top/cpu/s5/regs/register_values[1]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[2]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[3]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[4]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[5]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[6]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[7]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[8]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[9]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[10]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[11]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[12]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[13]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[14]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[15]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[16]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[17]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[18]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[19]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[20]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[21]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[22]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[23]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[24]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[25]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[26]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[27]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[28]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[29]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[30]} -radix decimal} {{/test_top/cpu/s5/regs/register_values[31]} -radix decimal}} -subitemconfig {{/test_top/cpu/s5/regs/register_values[1]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[2]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[3]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[4]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[5]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[6]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[7]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[8]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[9]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[10]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[11]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[12]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[13]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[14]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[15]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[16]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[17]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[18]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[19]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[20]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[21]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[22]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[23]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[24]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[25]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[26]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[27]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[28]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[29]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[30]} {-height 15 -radix decimal} {/test_top/cpu/s5/regs/register_values[31]} {-height 15 -radix decimal}} /test_top/cpu/s5/regs/register_values
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {97 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {611 ps}
