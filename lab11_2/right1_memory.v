`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 21:06:18
// Design Name: 
// Module Name: right1_memory
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


module right1_memory(clk, rst, digit, sel, right1);
    input clk, rst;
    input [3:0] digit;
    input [3:0] sel;
    output [3:0] right1;
    
    reg [3:0] right1_next;
    reg [3:0] right1;
    
    always @* begin
       if(sel == 4'b0100) 
           right1_next = digit;
       else 
           right1_next = right1;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            right1 <= 4'b0;
        else 
            right1 <= right1_next;
    end
endmodule
