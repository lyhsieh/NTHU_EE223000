`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 20:23:49
// Design Name: 
// Module Name: pattern_one_pulse_generator
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


module pattern_one_pulse_generator(clk, rst, last_change, key_down, p_after_one_pulse);
    input clk, rst; 
    input [8:0] last_change;
    input [511:0] key_down;
    output p_after_one_pulse;
    
    reg before_one_pulse;
    
    always @* begin
        if(last_change == 9'h79 || last_change == 9'h7B || last_change == 9'h3A)
            before_one_pulse = key_down[last_change];
        else 
            before_one_pulse = 1'b0;
    end
    
    one_pulse U1(.in_trig(before_one_pulse), .clk(clk), .rst(rst), .out_pulse(p_after_one_pulse));
endmodule
