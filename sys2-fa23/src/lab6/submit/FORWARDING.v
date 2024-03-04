module Forwarding(
    input wire [63:0] rs1_data_id,
    input wire [63:0] rs2_data_id,
    input wire [63:0] rd_data_exe,
    input wire [63:0] rd_data_mem,
    input wire [63:0] rd_data_wb,
    input wire [4:0] rs1_addr_id,
    input wire [4:0] rs2_addr_id,
    input wire [4:0] rd_exe,
    input wire [4:0] rd_mem,
    input wire [4:0] rd_wb,
    input wire regwen_exe,
    input wire regwen_mem,
    input wire regwen_wb,
    input wire [23:0] sign_wb,
    input wire [1:0] id_rs_use,
    output wire [63:0] rs1_data_fwd,
    output wire [63:0] rs2_data_fwd
);
wire data_exe1,data_mem1,data_wb1,data_exe2,data_mem2,data_wb2;
reg [63:0] rs1_data,rs2_data;

assign data_exe1=(rs1_addr_id==rd_exe&regwen_exe&rs1_addr_id!=0&id_rs_use[0]);
assign data_mem1=(rs1_addr_id==rd_mem&regwen_mem&rs1_addr_id!=0&id_rs_use[0]);
assign data_wb1=(rs1_addr_id==rd_wb&regwen_wb&rs1_addr_id!=0&id_rs_use[0]);
assign data_exe2=(rs2_addr_id==rd_exe&regwen_exe&rs2_addr_id!=0&id_rs_use[1]);
assign data_mem2=(rs2_addr_id==rd_mem&regwen_mem&rs2_addr_id!=0&id_rs_use[1]);
assign data_wb2=(rs2_addr_id==rd_wb&regwen_wb&rs2_addr_id!=0&id_rs_use[1]);



always@(*)begin
    if(data_exe1|data_wb1|data_mem1)
        begin
            if(data_exe1)
                rs1_data=rd_data_exe;
            else if(data_mem1)
                rs1_data=rd_data_mem;
            else 
                rs1_data=rd_data_wb;
        end
    else
        rs1_data=rs1_data_id;
    if(data_exe2|data_wb2|data_mem2)
        begin
            if(data_exe2)
                rs2_data=rd_data_exe;
            else if(data_mem1)
                rs2_data=rd_data_mem;
            else
                rs2_data=rd_data_wb;
        end
    else
        rs2_data=rs2_data_id;
end
assign rs1_data_fwd=rs1_data;
assign rs2_data_fwd=rs2_data;
endmodule