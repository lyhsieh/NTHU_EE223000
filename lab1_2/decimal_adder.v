`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 21:39:24
// Design Name: 
// Module Name: decimal_adder
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


module decimal_adder(input [3:0]a, 
    input [3:0]b, 
    input cin, 
    output [3:0]s, 
    output cout);
    reg cout;
    reg [3:0]s;   
    always @* begin
        if(a + b + cin > 9) begin
            s = a + b + cin + 6;
            cout = 1'b1;
        end

        else begin
            s = a + b + cin;
            cout = 1'b0;
        end
    end
endmodule
