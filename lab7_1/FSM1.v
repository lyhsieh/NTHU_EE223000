`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 20:12:39
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
`define pause 1'b0
`define resume 1'b1

module FSM1(press_processed, clk_100hz, rst, state);
    input press_processed, clk_100hz, rst;
    output state;
    
    reg state, state_next;
    
    always @* begin
        case(press_processed)
            1'b0: begin
                if(state == `pause)
                    state_next = `pause;
                else
                    state_next = `resume;
            end
            default: begin
                if(state == `pause)
                    state_next = `resume;
                else
                    state_next = `pause;
            end
        endcase
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst)
            state <= `pause;
        else
            state <= state_next;
    end
endmodule
