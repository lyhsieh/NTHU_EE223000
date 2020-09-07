`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/25 14:44:19
// Design Name: 
// Module Name: test_dec
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


module test_dec;

    wire [7:0] D;
    reg [2:0] IN;
    reg EN;
    
    dec U0(.d(D), .in(IN), .en(EN));
    
    initial begin
        IN = 3'b000; EN = 1'b0;
        #5 IN = 3'b001; EN = 1'b0;
        #5 IN = 3'b010; EN = 1'b0;
        #5 IN = 3'b011; EN = 1'b0;
        #5 IN = 3'b100; EN = 1'b0;
        #5 IN = 3'b101; EN = 1'b0;
        #5 IN = 3'b110; EN = 1'b0;
        #5 IN = 3'b111; EN = 1'b0;
        #5 IN = 3'b000; EN = 1'b1;
        #5 IN = 3'b001; EN = 1'b1;
        #5 IN = 3'b010; EN = 1'b1;
        #5 IN = 3'b011; EN = 1'b1;
        #5 IN = 3'b100; EN = 1'b1;
        #5 IN = 3'b101; EN = 1'b1;
        #5 IN = 3'b110; EN = 1'b1;
        #5 IN = 3'b111; EN = 1'b1;
        #5 $finish;
    end
    
    
endmodule
