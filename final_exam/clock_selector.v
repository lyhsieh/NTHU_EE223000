`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 16:29:06
// Design Name: 
// Module Name: clock_selector
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


module clock_selector(clk_1hz, clk_10hz, speed, clk_sel);
    input clk_1hz, clk_10hz, speed;
    output clk_sel;
    
    reg clk_sel;
    
    always @* begin
        if(speed == 1'b0)
            clk_sel = clk_10hz;
        else
            clk_sel = clk_1hz;
    end
endmodule
