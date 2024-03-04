module Dataout(
    input [2:0] addr_out,
    input [63:0] data_out,
    input [2:0] memdata_width,
    output reg[63:0] data_mem
);
always@(*)
begin
    case(memdata_width)
    3'b001:data_mem=data_out;
    3'b010:if(addr_out[2]==1'b1) data_mem={data_out[31:0],{32{1'b0}}}; 
            else data_mem={{32{1'b0}},data_out[31:0]};
    3'b011:case(addr_out[2:1])
            2'b00:data_mem={{48{1'b0}},data_out[15:0]};
            2'b01:data_mem={{32{1'b0}},data_out[15:0],{16{1'b0}}};
            2'b10:data_mem={{16{1'b0}},data_out[15:0],{32{1'b0}}};
            2'b11:data_mem={data_out[15:0],{48{1'b0}}};
           endcase
    3'b100:case(addr_out[2:0]) 
            3'b000:data_mem={{56{1'b0}},data_out[7:0]};
            3'b001:data_mem={{48{1'b0}},data_out[7:0],{8{1'b0}}};
            3'b010:data_mem={{40{1'b0}},data_out[7:0],{16{1'b0}}};
            3'b011:data_mem={{32{1'b0}},data_out[7:0],{24{1'b0}}};
            3'b100:data_mem={{24{1'b0}},data_out[7:0],{32{1'b0}}};
            3'b101:data_mem={{16{1'b0}},data_out[7:0],{40{1'b0}}};
            3'b110:data_mem={{8{1'b0}},data_out[7:0],{48{1'b0}}};
            3'b111:data_mem={data_out[7:0],{56{1'b0}}};
           endcase
    3'b101:if(addr_out[2]==1'b1) data_mem={data_out[31:0],{32{1'b0}}}; 
            else data_mem={{32{1'b0}},data_out[31:0]};
    3'b110:case(addr_out[2:1])
            2'b00:data_mem={{48{1'b0}},data_out[15:0]};
            2'b01:data_mem={{32{1'b0}},data_out[15:0],{16{1'b0}}};
            2'b10:data_mem={{16{1'b0}},data_out[15:0],{32{1'b0}}};
            2'b11:data_mem={data_out[15:0],{48{1'b0}}};
           endcase
    3'b111:case(addr_out[2:0]) 
            3'b000:data_mem={{56{1'b0}},data_out[7:0]};
            3'b001:data_mem={{48{1'b0}},data_out[7:0],{8{1'b0}}};
            3'b010:data_mem={{40{1'b0}},data_out[7:0],{16{1'b0}}};
            3'b011:data_mem={{32{1'b0}},data_out[7:0],{24{1'b0}}};
            3'b100:data_mem={{24{1'b0}},data_out[7:0],{32{1'b0}}};
            3'b101:data_mem={{16{1'b0}},data_out[7:0],{40{1'b0}}};
            3'b110:data_mem={{8{1'b0}},data_out[7:0],{48{1'b0}}};
            3'b111:data_mem={data_out[7:0],{56{1'b0}}};
           endcase
    default:data_mem={64{1'b0}};
    endcase
end

endmodule