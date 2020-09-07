`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 19:45:02
// Design Name: 
// Module Name: test_full_adder
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


module test_full_adder;

wire S, COUT;
reg X, Y, CIN;

full_adder U0(.s(S), .cout(COUT), .x(X), .y(Y), .cin(CIN));

initial
begin
X=0; Y=0; CIN=0;
#10 X=0; Y=0; CIN=1;
#10 X=0; Y=1; CIN=0;
#10 X=0; Y=1; CIN=1;
#10 X=1; Y=0; CIN=0;
#10 X=1; Y=0; CIN=1;
#10 X=1; Y=1; CIN=0;
#10 X=1; Y=1; CIN=1;
#10 $finish;
end


endmodule
