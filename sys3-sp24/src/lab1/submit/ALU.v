
module ALU (
  input signed [63:0] a,
  input signed [63:0] b,
  input  [3:0]  alu_op,
  output reg [63:0] res
);
reg signed [31:0] res2;
  always @(*)
      case (alu_op)
          4'b0000:
          begin
            res2=32'b0;
            res=a+b;//ADD
          end
          4'b0001:begin 
            res2=32'b0;
            res=a-b;//SUB
          end
          4'b0010:begin
            res2=32'b0;
            res=a&b;//AND
          end
          4'b0011:begin
            res2=32'b0;
            res=a|b;//OR
          end
          4'b0100:begin
            res2=32'b0;
            res=a^b;//XOR
          end
          4'b0101:begin
            res2=32'b0;
            res={{63{1'b0}},(a<b)};//SLT
          end
          4'b0110:begin
            res2=32'b0;
            res={{63{1'b0}},({1'b0,a}<{1'b0,b})};//SLTU
          end
          4'b0111:begin
            res2=32'b0;
            res=a<<b[5:0];//SLL
          end
          4'b1000:begin
            res2=32'b0;
            res=a>>b[5:0];//SRL
          end
          4'b1001:begin
            res2=32'b0;
            res=a>>>b[5:0];//SRA
          end
          4'b1010:begin
            res2=$signed(a[31:0])+$signed(b[31:0]);
            res={{32{res2[31]}},res2[31:0]};//ADDW
          end 
          4'b1011:begin
            res2=$signed(a[31:0])-$signed(b[31:0]);
            res={{32{res2[31]}},res2[31:0]};//SUBW
          end
          4'b1100:begin
            res2=a[31:0]<<b[4:0];
            res={{32{res2[31]}},res2[31:0]};//SLLW
          end
          4'b1101:begin
            res2=a[31:0]>>b[4:0];
            res={{32{res2[31]}},res2[31:0]};//SRLW
          end
          4'b1110:begin
            res2=$signed(a[31:0])>>>b[4:0];
            res={{32{res2[31]}},res2[31:0]};//SRAW
          end
          default:begin
            res2=32'b0;
            res={64{1'b0}};
          end
      endcase
endmodule



