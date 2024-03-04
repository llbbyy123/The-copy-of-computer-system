module Core2Mem_FSM (
    input wire clk,
    input wire rstn,
    input wire [63:0] pc,
    input wire if_request,
    input wire switch_mode,
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
    localparam IDLE=2'b00;
    localparam INST=2'b01;
    localparam DATA=2'b10;
    wire rst=~rstn;
    reg switch_flush;
    
    assign if_stall=(state==INST)&~valid_mem|(state!=INST)&if_request|switch_flush;
    assign mem_stall=(state==2'b01&(ren_cpu|wen_cpu))|(state==2'b10&(ren_cpu|wen_cpu)&~valid_mem)|(state==2'b00&(ren_cpu|wen_cpu));
    assign rdata_cpu=rdata_mem;
    assign insts=rdata_mem;
    
    always@(*)begin
        wmask_mem=wmask_cpu;
        wdata_mem=wdata_cpu;
    end
    always@(posedge clk)begin
        if(rst)begin
            switch_flush<=1'b0;
            state<=2'b00;
            ren_mem<=1'b0;
            wen_mem<=1'b0;
        end
        else if(state==2'b00)begin
            if(switch_mode) begin
                switch_flush<=1'b0;
                state<=2'b00;
                ren_mem<=1'b0;
                wen_mem<=1'b0;
            end
            else if(ren_cpu|wen_cpu)begin
                switch_flush<=1'b0;
                state<=2'b10;
                address_mem<=address_cpu;
                ren_mem<=ren_cpu;
                wen_mem<=wen_cpu;
            end
            else begin
                switch_flush<=1'b0;
                state<=2'b01;
                address_mem<=pc;
                ren_mem<=1'b1;
                wen_mem<=1'b0;
            end
        end
        else if(state==2'b01)begin
            if(switch_mode)begin
                switch_flush<=1'b1;
            end
            else if(valid_mem)begin
                if(!switch_flush)begin
                state<=2'b00;
                ren_mem<=1'b0;
                wen_mem<=1'b0;
                end
                else begin
                    state<=2'b01;
                    ren_mem<=1'b1;
                    wen_mem<=1'b0;
                    switch_flush<=1'b0;
                    address_mem<=pc;
                end
            end
            else begin
                state<=2'b01;
                ren_mem<=1'b1;
                wen_mem<=1'b0;
            end
        end
        else begin
            if(switch_mode)begin
                switch_flush<=1'b0;
                state<=2'b00;
                ren_mem<=1'b0;
                wen_mem<=1'b0;
            end
            if(valid_mem)begin
                switch_flush<=1'b0;
                state<=2'b00;
                ren_mem<=1'b0;
                wen_mem<=1'b0;
                // $display("pc:%X w:%d r:%d",pc,wen_cpu,ren_cpu);
                // $display("wdata:%X rdata:%X address:%X",wdata_mem,rdata_mem,address_mem);
            end
            else begin
                switch_flush<=1'b0;
                state<=2'b10;
                ren_mem<=ren_cpu;
                wen_mem<=wen_cpu;
            end
        end
    end 
    // always@(posedge clk or posedge rst)
    // begin
    //     if(wen_mem&&state==2'b10&&!rst&&address_mem[63:3]==61'b10000000001000000011000000000)
    //     $finish;
    // end
    
endmodule