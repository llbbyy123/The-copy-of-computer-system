module IFID(
    input wire clk,
    input wire rst,
    input wire switch_mode,
    input stall,
    input flush,
    input wire [31:0] inst,
    input wire [63:0] pc_if,
    output reg [63:0] pc_id,
    output reg [31:0] inst_id,
    output reg valid_id,
    input wire jump_if,
    output reg jump_id,
    input wire [63:0] fetch_pc_if,
    output reg [63:0] fetch_pc_id
);

always@(posedge clk )begin
    if(rst|flush|switch_mode)begin
        pc_id<={64{1'b0}};
        inst_id<={32{1'b0}};
        valid_id<=1'b0;
        jump_id<=1'b0;
        fetch_pc_id<=64'b0;
    end
    else if(~stall) begin
        pc_id<=pc_if;
        inst_id<=inst;
        valid_id<=1'b1;
        jump_id<=jump_if;
        fetch_pc_id<=fetch_pc_if;
    end
end
endmodule