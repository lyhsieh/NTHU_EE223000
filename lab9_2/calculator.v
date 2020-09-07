`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/18 20:42:19
// Design Name: 
// Module Name: calculator
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


module calculator(left, right, sum_left, sum_right);
    input [3:0] left;
    input [3:0] right;
    output [3:0] sum_left;
    output [3:0] sum_right;
    
    reg [4:0] sum;
    reg [3:0] sum_left;
    reg [3:0] sum_right;
    
    always @* begin
        sum = left + right;
        sum_left = sum / 10;
        sum_right = sum % 10;
    end
endmodule
