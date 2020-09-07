`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 20:24:36
// Design Name: 
// Module Name: number_one_pulse_generator
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


module number_one_pulse_generator(clk, rst, last_change, key_down, n_after_one_pulse);
    input clk, rst; 
    input [8:0] last_change;
    input [511:0] key_down;
    output n_after_one_pulse;
    
    reg before_one_pulse;
    
    always @* begin
        if(last_change == 9'h70 || last_change == 9'h69 || last_change == 9'h72 || last_change == 9'h7A
        || last_change == 9'h6B || last_change == 9'h73 || last_change == 9'h74 || last_change == 9'h6C
        || last_change == 9'h75 || last_change == 9'h7D)
            before_one_pulse = key_down[last_change];
        else 
            before_one_pulse = 1'b0;
    end
    
    one_pulse U0(.in_trig(before_one_pulse), .clk(clk), .rst(rst), .out_pulse(n_after_one_pulse));
endmodule
