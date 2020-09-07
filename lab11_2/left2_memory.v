`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 21:05:57
// Design Name: 
// Module Name: left2_memory
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


module left2_memory(clk, rst, digit, sel, left2);
    input clk, rst;
    input [3:0] digit;
    input [3:0] sel;
    output [3:0] left2;
    
    reg [3:0] left2_next;
    reg [3:0] left2;
    
     always @* begin
       if(sel == 4'b0010) 
           left2_next = digit;
       else 
           left2_next = left2;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            left2 <= 4'b0;
        else 
            left2 <= left2_next;
    end
endmodule
