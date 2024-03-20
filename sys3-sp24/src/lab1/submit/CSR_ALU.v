module CSR_ALU(
    input wire [63:0] data1,
    input wire [63:0] data2,
    input wire [1:0] alu_op,
    output reg [63:0] csr_result
);
always@(*)
begin
    case(alu_op)
        2'b00:csr_result=data2;
        2'b01:csr_result=data2|data1;
        2'b10:csr_result=data1&(~data2);
        default:csr_result={64{1'b0}};
    endcase
end
endmodule