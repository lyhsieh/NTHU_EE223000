`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/30 00:25:35
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
`define count 1'b1
`define pause 1'b0

module FSM(clk_100hz, rst, press_processed, state);
    input clk_100hz, rst;
    input press_processed;
    output state;
    
    reg state, state_next;
    
    always @* begin
        case(press_processed)
            1'b0: begin
                if(state == `count) state_next = `count;
                else state_next = `pause;                
            end
            1'b1: begin
                if(state == `count) state_next = `pause;
                else state_next = `count;
            end
        endcase
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst) begin
            state <= 1'b0;
        end
        else begin
            state <= state_next;
        end
    end
endmodule
