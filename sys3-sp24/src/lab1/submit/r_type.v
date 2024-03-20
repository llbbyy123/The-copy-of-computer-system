module r_type(
    input [31:0] inst,
    output wire [21:0] sign
);
reg we_reg,we_mem,npc_sel;
reg [2:0] immgen_op,bralu_op,memdata_width;
reg [3:0] alu_op;
reg [1:0] alu_asel,alu_bsel,wb_sel;
always@(*)
begin
    we_reg=1'b1;
    we_mem=1'b0;
    npc_sel=1'b0;
    immgen_op=3'b000;
    bralu_op=3'b000;
    memdata_width=3'b000;
    alu_asel=2'b01;
    alu_bsel=2'b01;
    wb_sel=2'b01;
    if(inst[6:0]==7'b0110011)
begin
    case({inst[30],inst[14:12]})
        4'b0000:alu_op=4'b0000;
        4'b1000:alu_op=4'b0001;
        4'b0001:alu_op=4'b0111;
        4'b0010:alu_op=4'b0101;
        4'b0011:alu_op=4'b0110;
        4'b0100:alu_op=4'b0100;
        4'b0101:alu_op=4'b1000;
        4'b1101:alu_op=4'b1001;
        4'b0110:alu_op=4'b0011;
        4'b0111:alu_op=4'b0010;
        default:alu_op=4'b0000;
    endcase
end
else
begin
    case({inst[30],inst[14:12]})
        4'b0000:alu_op=4'b1010;
        4'b1000:alu_op=4'b1011;
        4'b0001:alu_op=4'b1100;
        4'b0101:alu_op=4'b1101;
        4'b1101:alu_op=4'b1110;
        default:alu_op=4'b0000;
    endcase
end
end




assign sign[21]=we_reg;
assign sign[20]=we_mem;
assign sign[19]=npc_sel;
assign sign[18:16]=immgen_op;
assign sign[15:12]=alu_op;
assign sign[11:9]=bralu_op;
assign sign[8:7]=alu_asel;
assign sign[6:5]=alu_bsel;
assign sign[4:3]=wb_sel;
assign sign[2:0]=memdata_width;
endmodule