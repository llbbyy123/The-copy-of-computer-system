`include "ExceptStruct.vh"
module EX(
    input clk,
    input rst,
    input stall,
    input flush,

    input ExceptStruct::ExceptPack except_last,
    output ExceptStruct::ExceptPack except_next
);

always@(posedge clk )
begin
    if(rst|flush)
    begin
        except_next<='{except:0,epc:64'b0,ecause:64'b0,etval:64'b0};
    end
    else if(!stall)
    begin
        except_next<=except_last;
    end
end
endmodule