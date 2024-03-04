module Core2Mem_FSM (
    input wire clk,
    input wire rst,
    input wire [63:0] pc,
    input wire if_request,
    input wire [63:0] address_cpu,
    input wire wen_cpu,
    input wire ren_cpu,
    input wire [63:0] wdata_cpu,
    input wire [7:0] wmask_cpu,
    output [63:0] insts,
    output [63:0] rdata_cpu,
    output if_stall,
    output mem_stall,

    output reg [63:0] address_mem,
    output reg ren_mem,
    output reg wen_mem,
    output reg [7:0] wmask_mem,
    output reg [63:0] wdata_mem,
    input wire [63:0] rdata_mem,
    input wire valid_mem
);

reg [1:0] state;
assign if_stall=~(state==2'b01&valid_mem);
assign mem_stall=(state==2'b01&(ren_cpu|wen_cpu))|(state==2'b10&(ren_cpu|wen_cpu)&~valid_mem)|(state==2'b00&(ren_cpu|wen_cpu));
assign rdata_cpu=rdata_mem;
assign insts=rdata_mem;

always@(*)begin
    wmask_mem=wmask_cpu;
    wdata_mem=wdata_cpu;
end
always@(posedge clk or posedge rst)begin
    if(rst)begin
        state=2'b00;
        ren_mem=1'b0;
        wen_mem=1'b0;
    end
    else if(state==2'b00)begin
        if(ren_cpu|wen_cpu)begin
            state=2'b10;
            address_mem=address_cpu;
            ren_mem=ren_cpu;
            wen_mem=wen_cpu;
        end
        else begin
            state=2'b01;
            address_mem=pc;
            ren_mem=1'b1;
            wen_mem=1'b0;
        end
    end
    else if(state==2'b01)begin
        if(valid_mem)begin
            state=2'b00;
            ren_mem=1'b0;
            wen_mem=1'b0;
        end
        else begin
            state=2'b01;
            ren_mem=1'b1;
            wen_mem=1'b0;
        end
    end
    else begin
        if(valid_mem)begin
            state=2'b00;
            ren_mem=1'b0;
            wen_mem=1'b0;
        end
        else begin
            state=2'b10;
            ren_mem=ren_cpu;
            wen_mem=wen_cpu;
        end
    end
end 
endmodule