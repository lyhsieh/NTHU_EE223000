`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/14 20:32:51
// Design Name: 
// Module Name: selector5
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


module selector5(month1, month0, result);
    input [3:0] month1;
    input [3:0] month0;
    output [3:0] result;
    
    reg [3:0] result;
    
    always @* begin
        if(month1 == 4'd0)
            result = 4'd0;
        else
            result = 4'd1;
    end
endmodule
