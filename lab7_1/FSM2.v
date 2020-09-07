`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 20:54:55
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
`define freeze 1'b0
`define unfreeze 1'b1

module FSM2(press_processed, clk_100hz, rst, state);
    input press_processed, clk_100hz, rst;
    output state;
    reg state, state_next;
    
    always @* begin
        case(press_processed)
            1'b0: begin
                if(state == `freeze)
                    state_next = `freeze;
                else
                    state_next = `unfreeze;
            end
            default: begin
                if(state == `freeze)
                    state_next = `unfreeze;
                else
                    state_next = `freeze;
            end
        endcase
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst)
            state <= `unfreeze;
        else
            state <= state_next;
    end
endmodule
