`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/09 16:02:33
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

`define still 1'b0
`define scroll 1'b1

module FSM(press_processed, clk, rst, state);
    input press_processed, clk, rst;
    output state;
    reg state, state_next;
    always @* begin
        if(state == `still) begin
            if(press_processed == 1'b1)
                state_next = `scroll;
            else
                state_next = `still;
        end
        else begin
            if(press_processed == 1'b1)
                state_next = `still;
            else 
                state_next = `scroll;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            state <= `still;
        else
            state <= state_next;
    end
endmodule
