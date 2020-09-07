`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 16:11:08
// Design Name: 
// Module Name: FSM1
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

`define increase 1'b0
`define decrease 1'b1

module FSM1(clk, rst, increase_processed, decrease_processed, state1);
    input clk, rst, increase_processed, decrease_processed;
    output state1;
    
    reg state1, state1_next;
    
    always @* begin
        if(state1 == `increase) begin
            if(decrease_processed == 1'b1)
                state1_next = `decrease;
            else
                state1_next = `increase;
        end
        else begin
            if(increase_processed == 1'b1)
                state1_next = `increase;
            else
                state1_next = `decrease;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            state1 <= `increase;
        else 
            state1 <= state1_next;
    end
    
endmodule
