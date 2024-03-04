module IFID(
    input wire clk,
    input wire rst,
    input stall,
    input flush,
    input wire [63:0] insts,
    input wire [63:0] pc_if,
    output reg [63:0] pc_id,
    output reg [31:0] inst_id,
    output reg valid_id
);

always@(posedge clk or posedge rst)begin
    if(rst|flush)begin
        pc_id<={64{1'b0}};
        inst_id<={32{1'b0}};
        valid_id<=1'b0;
    end
    else if(~stall) begin
        pc_id<=pc_if;
        if(pc_if[2]==0)
        inst_id<=insts[31:0];
        else
        inst_id<=insts[63:32];
        valid_id<=1'b1;
    end
end
endmodule