`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/15 14:22:19
// Design Name: 
// Module Name: selector6
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


module selector6(hour1, result);
    input [3:0] hour1;
    output [3:0] result;
    reg [3:0] result;
    
    always @* begin
        if(hour1 == 4'd2) result = 4'd3;
        else result = 4'd9;
    end
endmodule
