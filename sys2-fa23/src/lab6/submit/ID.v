module ID(
    input wire [63:0] pc_id,
    input wire [31:0] inst_id,
    input wire valid_id,
    output wire [4:0] rd_addr_id,
    output reg [23:0] sign,
    output wire [63:0] imm_id,
    output wire [4:0] rs1_addr_id,
    output wire [4:0] rs2_addr_id,
    output wire [11:0] csr_addr_id,
    output wire [5:0] csr_sign_id,
    output wire [63:0] csr_imm,
    output wire is_csr
);
wire [23:0] comb_decode;
wire [5:0] csr_sign;
controller con(
    .comb_decode_inst(inst_id),
    .comb_decode(comb_decode)
);

imm_gen immgen(
    .immgen_op(comb_decode[18:16]),
    .inst(inst_id),
    .data(imm_id)
);

csr_controller csr_con(
    .inst(inst_id),
    .sign(csr_sign),
    .data(csr_imm)
);

assign rd_addr_id=inst_id[11:7];
assign rs1_addr_id=inst_id[19:15];
assign rs2_addr_id=inst_id[24:20];
assign is_csr=comb_decode[21:0]=={22{1'b0}};
assign csr_addr_id=inst_id[31:20];
assign csr_sign_id=csr_sign&{6{is_csr}};
always@(*)
begin
    if(comb_decode[21:0]!={22{1'b0}})
    sign=comb_decode&{24{valid_id}};
    else
    begin
        if(csr_sign[5])
        sign={{1{2'b01}},{1{2'b10}},{1{1'b0}},{3{1'b0}},{4{1'b0}},{3{1'b0}},{2{1'b0}},{2{1'b0}},{2{1'b0}},{3{1'b0}}}&{24{valid_id}};
        else
        sign={24{1'b0}};
    end
end
endmodule