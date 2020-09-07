`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 21:33:53
// Design Name: 
// Module Name: pattern_memory
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


module pattern_memory(clk, rst, digit, sel, pattern);
    input clk, rst;
    input [3:0] digit;
    input [3:0] sel;
    output [3:0] pattern;
    
    reg [3:0] pattern_next;
    reg [3:0] pattern;
    
      always @* begin
       if(sel == 4'b1000) 
           pattern_next = digit;
       else 
           pattern_next = pattern;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            pattern <= 4'b1010;
        else 
            pattern <= pattern_next;
    end
endmodule
