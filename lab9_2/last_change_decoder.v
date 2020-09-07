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
            9'b0_0100_0101: digit = 4'd0;
            9'b0_0001_0110: digit = 4'd1;
            9'b0_0001_1110: digit = 4'd2;
            9'b0_0010_0110: digit = 4'd3;
            9'b0_0010_0101: digit = 4'd4;
            9'b0_0010_1110: digit = 4'd5;
            9'b0_0011_0110: digit = 4'd6;
            9'b0_0011_1101: digit = 4'd7;
            9'b0_0011_1110: digit = 4'd8;
            9'b0_0100_0110: digit = 4'd9;
            default: digit = 4'd0;
        endcase
    end
endmodule
