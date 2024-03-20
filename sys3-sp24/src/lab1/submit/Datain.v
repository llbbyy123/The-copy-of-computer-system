module Datain(
    input [2:0] addr_out,
    input [63:0] mem_data,
    input [2:0] memdata_width,
    output reg[63:0] data_in
);
always@(*)
begin
    case(memdata_width)
    3'b001:data_in=mem_data;
    3'b010:if(addr_out[2]==1'b1) data_in={{32{mem_data[63]}},mem_data[63:32]}; 
            else data_in={{32{mem_data[31]}},mem_data[31:0]};
    3'b011:case(addr_out[2:1])
            2'b00:data_in={{48{mem_data[15]}},mem_data[15:0]};
            2'b01:data_in={{48{mem_data[31]}},mem_data[31:16]};
            2'b10:data_in={{48{mem_data[47]}},mem_data[47:32]};
            2'b11:data_in={{48{mem_data[63]}},mem_data[63:48]};
           endcase
    3'b100:case(addr_out[2:0]) 
            3'b000:data_in={{56{mem_data[7]}},mem_data[7:0]};
            3'b001:data_in={{56{mem_data[15]}},mem_data[15:8]};
            3'b010:data_in={{56{mem_data[23]}},mem_data[23:16]};
            3'b011:data_in={{56{mem_data[31]}},mem_data[31:24]};
            3'b100:data_in={{56{mem_data[39]}},mem_data[39:32]};
            3'b101:data_in={{56{mem_data[47]}},mem_data[47:40]};
            3'b110:data_in={{56{mem_data[55]}},mem_data[55:48]};
            3'b111:data_in={{56{mem_data[63]}},mem_data[63:56]};
           endcase
    3'b101:if(addr_out[2]==1'b1) data_in={{32{1'b0}},mem_data[63:32]}; 
            else data_in={{32{1'b0}},mem_data[31:0]};
    3'b110:case(addr_out[2:1])
            2'b00:data_in={{48{1'b0}},mem_data[15:0]};
            2'b01:data_in={{48{1'b0}},mem_data[31:16]};
            2'b10:data_in={{48{1'b0}},mem_data[47:32]};
            2'b11:data_in={{48{1'b0}},mem_data[63:48]};
           endcase
    3'b111:case(addr_out[2:0]) 
            3'b000:data_in={{56{1'b0}},mem_data[7:0]};
            3'b001:data_in={{56{1'b0}},mem_data[15:8]};
            3'b010:data_in={{56{1'b0}},mem_data[23:16]};
            3'b011:data_in={{56{1'b0}},mem_data[31:24]};
            3'b100:data_in={{56{1'b0}},mem_data[39:32]};
            3'b101:data_in={{56{1'b0}},mem_data[47:40]};
            3'b110:data_in={{56{1'b0}},mem_data[55:48]};
            3'b111:data_in={{56{1'b0}},mem_data[63:56]};
           endcase
    default:data_in={64{1'b0}};
    endcase
end

endmodule