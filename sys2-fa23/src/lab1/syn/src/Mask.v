module Mask(
    input [2:0] addr_out,
    input [2:0]  memdata_width,
    output reg [7:0] mask
);

always@(*)
begin
    case(memdata_width)
    3'b001:mask=8'b11111111;
    3'b010:if(addr_out[2]==1'b1) mask=8'b11110000; else mask=8'b00001111;
    3'b011:case(addr_out[2:1])
            2'b00:mask=8'b00000011;
            2'b01:mask=8'b00001100;
            2'b10:mask=8'b00110000;
            2'b11:mask=8'b11000000;
           endcase
    3'b100:case(addr_out[2:0]) 
            3'b000:mask=8'b00000001;
            3'b001:mask=8'b00000010;
            3'b010:mask=8'b00000100;
            3'b011:mask=8'b00001000;
            3'b100:mask=8'b00010000;
            3'b101:mask=8'b00100000;
            3'b110:mask=8'b01000000;
            3'b111:mask=8'b10000000;
           endcase
    3'b101:if(addr_out[2]==1'b1) mask=8'b11110000; else mask=8'b00001111;
    3'b110:case(addr_out[2:1])
            2'b00:mask=8'b00000011;
            2'b01:mask=8'b00001100;
            2'b10:mask=8'b00110000;
            2'b11:mask=8'b11000000;
           endcase
    3'b111:case(addr_out[2:0]) 
            3'b000:mask=8'b00000001;
            3'b001:mask=8'b00000010;
            3'b010:mask=8'b00000100;
            3'b011:mask=8'b00001000;
            3'b100:mask=8'b00010000;
            3'b101:mask=8'b00100000;
            3'b110:mask=8'b01000000;
            3'b111:mask=8'b10000000;
           endcase
    default:mask=8'b00000000;
    endcase
end
endmodule
