`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/15 14:25:49
// Design Name: 
// Module Name: selector7
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


module selector7(year3, result);
    input [3:0] year3;
    output [3:0] result;
    
    reg [3:0] result;
    
    always @* begin
        if(year3 == 4'd2) result = 4'd2;
        else result = 4'd9;
    end
endmodule
