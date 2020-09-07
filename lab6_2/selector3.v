`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/14 20:21:36
// Design Name: 
// Module Name: selector3
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


module selector3(month1, month0, result);
    input [3:0] month1;
    input [3:0] month0;
    output [3:0] result;
    
    reg [3:0] result;
    
    always @* begin
        case(month1)
            4'd0: begin
                if(month0 == 4'd2)
                    result = 4'd2;
                else
                    result = 4'd3;
            end
            default: result = 4'd3;
        endcase
    end
endmodule
