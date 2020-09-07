`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/14 20:29:34
// Design Name: 
// Module Name: selector4
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


module selector4(month1, month0, result);
    input [3:0] month1;
    input [3:0] month0;
    output [3:0] result;
    
    reg [3:0] result;
    
    always @* begin
        if(month1 == 4'd0)
            result = 4'd9;
        else
            result = 4'd2;
    end
    
endmodule
