`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/26 21:16:58
// Design Name: 
// Module Name: case_transformer
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


module case_transformer(clk, rst, last_change, key_down, state);
    input clk, rst;
    input [8:0] last_change;
    input [511:0] key_down;
    output state;
    
    reg before_one_pulse;
    wire after_one_pulse;
    
    always @* begin
        if(last_change == 9'h58)
            before_one_pulse = key_down[last_change];
        else 
            before_one_pulse = 1'b0;
    end
    
    one_pulse U0(.in_trig(before_one_pulse), .clk(clk), .rst(rst), .out_pulse(after_one_pulse));
    FSM U1(.clk(clk), .rst(rst), .caps_processed(after_one_pulse), .state(state));
endmodule
