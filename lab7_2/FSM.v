`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 21:53:38
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
`define pause 1'b0
`define count 1'b1

module FSM(clk_100hz, rst, press_processed, state);
    input clk_100hz, rst, press_processed;
    output state;
    reg state, state_next;
    always @* begin
        if(press_processed == 1'b0) begin
            if(state == `pause)
                state_next = `pause;
            else
                state_next = `count;
        end
        else begin
            if(state == `pause)
                state_next = `count;
            else
                state_next = `pause;
        end
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst)
            state <= `pause;
        else
            state <= state_next;
    end    
endmodule
