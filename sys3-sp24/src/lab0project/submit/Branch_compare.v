module Branch_compare (
      input [63:0] data1,
      input [63:0] data2,
      input [2:0] bralu_op,
      output reg br_taken
);
reg signed [63:0] data1_,data2_;

always@(*)
begin
   data1_=data1;
   data2_=data2;
end
always@*
begin
    case(bralu_op)
      3'b001:if(data1==data2) br_taken=1'b1;else br_taken=1'b0;
      3'b010:if(data1!=data2) br_taken=1'b1;else br_taken=1'b0;
      3'b011:if(data1_<data2_) br_taken=1'b1;else br_taken=1'b0;
      3'b100:if((data1_>data2_)||(data1==data2)) br_taken=1'b1;else br_taken=1'b0;
      3'b101:if(data1<data2) br_taken=1'b1;else br_taken=1'b0;
      3'b110:if((data1>data2)||(data1_==data2_)) br_taken=1'b1;else br_taken=1'b0;
      default:br_taken=1'b0;
    endcase
end

endmodule