`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 21:39:56
// Design Name: 
// Module Name: test_decimal_adder
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


module test_decimal_adder;
wire [3:0] S; 
wire COUT;
reg [3:0] A; 
reg [3:0]B; 
reg CIN;

decimal_adder U0(.s(S), .cout(COUT), .a(A), .b(B), .cin(CIN));

initial begin

    CIN = 1'b0;
    A = 4'b0000;
    B = 4'b0000; 
    
    repeat(2) begin
       A = 4'b0000;
        repeat(10) begin
                B = 4'b0000;
                repeat(10) begin
                    #(3) B = B + 1;     
                end
            A = A + 1;
        end
        CIN = CIN + 1;    
    end
end

endmodule
