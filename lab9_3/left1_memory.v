`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 21:05:32
// Design Name: 
// Module Name: left1_memory
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


module left1_memory(clk, rst, digit, sel, left1);
    input clk, rst;
    input [3:0] digit;
    input [3:0] sel;
    output [3:0] left1;
    
    reg [3:0] left1_next;
    reg [3:0] left1;
    
    always @* begin
        if(sel == 4'b0000) 
            left1_next = digit;
        else 
            left1_next = left1;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            left1 <= 4'b0;
        else 
            left1 <= left1_next;
    end
endmodule
