`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/18 20:28:42
// Design Name: 
// Module Name: last_change_decoder
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


module last_change_decoder(last_change, digit);
    input [8:0] last_change;
    output [3:0] digit;
    
    reg [3:0] digit;
    
    always @* begin
        case(last_change)
            9'h70: digit = 4'd0;
            9'h69: digit = 4'd1;
            9'h72: digit = 4'd2;
            9'h7A: digit = 4'd3;
            9'h6B: digit = 4'd4;
            9'h73: digit = 4'd5;
            9'h74: digit = 4'd6;
            9'h6C: digit = 4'd7;
            9'h75: digit = 4'd8;
            9'h7D: digit = 4'd9;
            
            9'h79: digit = 4'd10;
            9'h7B: digit = 4'd11;
            9'h3A: digit = 4'd12;
            
            default: digit = 4'd0;
        endcase
    end
endmodule
