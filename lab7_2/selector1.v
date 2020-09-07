`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 22:34:23
// Design Name: 
// Module Name: selector1
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


module selector1(hr1_set, result);
    input [3:0] hr1_set;
    output [3:0] result;
    reg [3:0] result;
    always @* begin
        if(hr1_set == 4'd2)
            result = 4'd3;
        else 
            result = 4'd9;
    end
endmodule
