module csr_controller(
    input [31:0] inst,
    output [5:0] sign,
    output wire [63:0] data
);
wire bralu_op,alu_sel;
reg [1:0] alu_op;
assign bralu_op=1'b0;
assign alu_sel=!(inst[14:12]==3'b001||inst[14:12]==3'b010||inst[14:12]==3'b011);
always@(*)
begin
    case(inst[14:12])
        3'b000:alu_op=2'b11;//ret
        3'b001:alu_op=2'b00;//csrrw
        3'b010:alu_op=2'b01;//csrrs
        3'b011:alu_op=2'b10;//csrrc
        3'b101:alu_op=2'b00;//csrrwi
        3'b110:alu_op=2'b01;//csrrsi
        3'b111:alu_op=2'b10;//csrrwi
        default:alu_op=2'b11;
    endcase
end
assign sign[5]=alu_op!=2'b11;//csr 写使能
assign sign[4]=(inst[31:25]==7'b0011000)&alu_op==2'b11;//mret
assign sign[3]=inst[31:25]==7'b0001000&alu_op==2'b11;//sret
assign sign[2]=alu_sel;
assign sign[1:0]=alu_op;
assign data={{59{1'b0}},inst[19:15]};
endmodule