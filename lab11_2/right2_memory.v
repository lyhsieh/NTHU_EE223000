`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 21:06:37
// Design Name: 
// Module Name: right2_memory
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


module right2_memory(clk, rst, digit, sel, right2);
    input clk, rst;
    input [3:0] digit;
    input [3:0] sel;
    output [3:0] right2;
    
    reg [3:0] right2_next;
    reg [3:0] right2;
    
    always @* begin
       if(sel == 4'b0110) 
           right2_next = digit;
       else 
           right2_next = right2;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            right2 <= 4'b0;
        else 
            right2 <= right2_next;
    end
endmodule
