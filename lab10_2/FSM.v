`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/26 21:23:21
// Design Name: 
// Module Name: FSM
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
`define lowercase 1'b0
`define uppercase 1'b1

module FSM(clk, rst, caps_processed, state);
    input clk, rst, caps_processed;
    output state;
    
    reg state, state_next;
    
    always @* begin
        if(state == `lowercase) begin
            if(caps_processed == 1'b1)
                state_next = `uppercase;
            else 
                state_next = `lowercase;
        end
        else begin
            if(caps_processed == 1'b1)
                state_next = `lowercase;
            else
                state_next = `uppercase;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            state <= `lowercase;
        else
            state <= state_next;
    end
endmodule
