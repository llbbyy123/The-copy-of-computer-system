module BranchPrediction #(
    parameter DEPTH      = 32,
    parameter ADDR_WIDTH = 64,
    parameter STATE_NUM  = 2
) (
    input                   clk,
    input                   rst,
    input  [ADDR_WIDTH-1:0] pc_if,
    output                  jump_if,
    output [ADDR_WIDTH-1:0] pc_target_if,

    input [ADDR_WIDTH-1:0] pc_exe,
    input [ADDR_WIDTH-1:0] pc_target_exe,
    input                  jump_exe,//是否跳转
    input                  is_jump_exe,//是否是跳转指令

    input                   stall,
    output wire [63:0]      fetch_pc
);

    localparam INDEX_BEGIN = 2;
    localparam INDEX_LEN = $clog2(DEPTH);
    localparam INDEX_END = INDEX_BEGIN + INDEX_LEN - 1;
    localparam TAG_BEGIN = INDEX_END + 1;
    localparam TAG_END = ADDR_WIDTH - 1;
    localparam TAG_LEN = TAG_END - TAG_BEGIN + 1;

    typedef logic [TAG_LEN-1:0] tag_t;
    typedef logic [INDEX_LEN-1:0] index_t;
    typedef logic [STATE_NUM-1:0] state_t;
    typedef logic [ADDR_WIDTH-1:0] addr_t;

    typedef struct {
        tag_t   tag;
        addr_t  target;
        state_t state;
        logic   valid;
    } BTBLine;

    BTBLine btb       [DEPTH-1:0];

    tag_t   tag_exe;
    index_t index_exe;
    BTBLine btb_exe;
    assign tag_exe   = pc_exe[TAG_END:TAG_BEGIN];
    assign index_exe = pc_exe[INDEX_END:INDEX_BEGIN];
    assign btb_exe   = btb[index_exe];


    tag_t   tag_if;
    index_t index_if;
    BTBLine btb_if;
    assign tag_if   = pc_if[TAG_END:TAG_BEGIN];
    assign index_if = pc_if[INDEX_END:INDEX_BEGIN];
    assign btb_if   = btb[index_if];

    wire [63:0] fetch;
    assign jump_if=(btb_if.valid==1&tag_if==btb_if.tag&(btb_if.state==2'b11|btb_if.state==2'b10))?1'b1:1'b0;
    assign fetch=(btb_if.valid==1&tag_if==btb_if.tag&(btb_if.state==2'b11|btb_if.state==2'b10))?btb_if.target:64'b0;
    assign fetch_pc=fetch;
    assign pc_target_if=fetch;
    integer i;
    always@(posedge clk or posedge rst)
    begin   
        if(rst)
        begin
            for(i=0;i<DEPTH;i=i+1)
            begin
                btb[i].state=2'b00;
                btb[i].valid=1'b0;
                btb[i].tag=0;
                btb[i].target=0;
            end
        end
        else if(is_jump_exe==1&!stall)
        begin
            if(jump_exe==1)
            begin
                if(btb_exe.tag!=tag_exe|btb_exe.valid!=1'b1)
                begin
                    btb[index_exe].tag=tag_exe;
                    btb[index_exe].target=pc_target_exe;
                    btb[index_exe].valid=1'b1;
                    btb[index_exe].state=2'b10;
                end
                else
                case(btb_exe.state)
                    2'b00:btb[index_exe].state=2'b01;
                    2'b01:btb[index_exe].state=2'b10;
                    2'b10:btb[index_exe].state=2'b11;
                    2'b11:btb[index_exe].state=2'b11;
                endcase
            end
            else
            begin
                if(btb_exe.tag!=tag_exe|btb_exe.valid!=1'b1)
                begin
                    btb[index_exe].tag=tag_exe;
                    btb[index_exe].target=pc_target_exe;
                    btb[index_exe].valid=1'b1;
                    btb[index_exe].state=2'b01;
                end
                else
                case(btb_exe.state)
                    2'b00:btb[index_exe].state=2'b00;
                    2'b01:btb[index_exe].state=2'b00;
                    2'b10:btb[index_exe].state=2'b01;
                    2'b11:btb[index_exe].state=2'b10;
                endcase
            end
        end
    end

endmodule
