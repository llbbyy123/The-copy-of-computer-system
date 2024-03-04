module WB(
    input wire [63:0] pc_wb,
    input wire [31:0] inst_wb,
    input wire [1:0] wb_sel,
    input wire [63:0] data_in_wb,
    input wire [63:0] alu_result_wb,
    input wire [2:0] memdata_width,
    output wire [4:0] rd_addr_wb,
    output wire [63:0] rd_data_wb
);
reg [63:0] reg_result;
wire [63:0] data_in;
Datain datain(
    .addr_out(alu_result_wb[2:0]),
    .mem_data(data_in_wb),
    .memdata_width(memdata_width),
    .data_in(data_in)
);
always@(*)//决定写入目标寄存器的数据来自�???
begin
  case (wb_sel)
    2'b00:reg_result={64{1'b0}};
    2'b01:reg_result=alu_result_wb;
    2'b10:reg_result=data_in;
    2'b11:reg_result=pc_wb+4;
  endcase
end
assign rd_data_wb=reg_result;
assign rd_addr_wb=inst_wb[11:7];
endmodule