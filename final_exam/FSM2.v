`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 16:21:21
// Design Name: 
// Module Name: FSM2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define quick 1'b0
`define slow 1'b1
module FSM2(clk, rst, quick_processed, slow_processed, state2);
    input clk, rst, quick_processed, slow_processed;
    output state2;
    
    reg state2, state2_next;
    
    always @* begin
        if(state2 == `quick) begin
            if(slow_processed == 1'b1)
                state2_next = `slow;
            else
                state2_next = `quick;
        end
        else begin
            if(quick_processed == 1'b1)
                state2_next = `quick;
            else
                state2_next = `slow;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            state2 <= `slow;
        else
            state2 <= state2_next;
    end
endmodule
