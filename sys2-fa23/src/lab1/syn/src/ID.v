module ID(
    input wire [63:0] pc_id,
    input wire [31:0] inst_id,
    output wire [4:0] rd_addr_id,
    output wire [23:0] comb_decode,
    output wire [63:0] imm_id,
    output wire [4:0] rs1_addr_id,
    output wire [4:0] rs2_addr_id
);

controller con(
    .comb_decode_inst(inst_id),
    .comb_decode(comb_decode)
);

imm_gen immgen(
    .immgen_op(comb_decode[18:16]),
    .inst(inst_id),
    .data(imm_id)
);
assign rd_addr_id=inst_id[11:7];
assign rs1_addr_id=inst_id[19:15];
assign rs2_addr_id=inst_id[24:20];
endmodule