module imm_gen(
    input [2:0] immgen_op,
    input [31:0] inst,
    output  [63:0] data
);

reg [63:0] data1;
always@(*)
begin
    case (immgen_op)
        3'b001://I指令
        begin
            if((inst[14:12]==3'b101||inst[14:12]==3'b001)&&(inst[6:0]==7'b0010011||inst[6:0]==7'b0011011))
            data1={{58{1'b0}},inst[25:20]};//移位指令
            else
            data1={{52{inst[31]}},inst[31:20]};
        end
        3'b010:data1={{52{inst[31]}},inst[31:25],inst[11:7]};//s指令
        3'b101:
            begin
            data1={{43{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],{1'b0}};//j指令
            if(inst[6:0]==7'b1100111)
            data1={{52{inst[31]}},inst[31:20]};//jalr指令
            end
        3'b100:data1={{32{inst[31]}},inst[31:12],{12{1'b0}}};//u指令
        3'b011:data1={{51{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],{1'b0}};//b类型指令
        default:data1={64{1'b0}};
    endcase
       
end
assign data=data1;
endmodule