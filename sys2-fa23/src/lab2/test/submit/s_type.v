module s_type(
    input [31:0] inst,
    output wire [21:0] sign
);
reg we_reg,we_mem,npc_sel;
reg [2:0] immgen_op,bralu_op,memdata_width;
reg [3:0] alu_op;
reg [1:0] alu_asel,alu_bsel,wb_sel;
always@(*)
begin
    we_reg=1'b0;
    we_mem=1'b1;
    immgen_op=3'b010;
    npc_sel=1'b0;
    bralu_op=3'b000;
    alu_asel=2'b01;
    alu_bsel=2'b10;
    wb_sel=2'b00;
    alu_op=4'b0000;
    case(inst[14:12])
        3'b000:memdata_width=3'b100;//sb
        3'b001:memdata_width=3'b011;//sh
        3'b010:memdata_width=3'b010;//sw
        default:memdata_width=3'b001;
    endcase
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