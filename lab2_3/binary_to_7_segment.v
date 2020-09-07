`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 21:25:01
// Design Name: 
// Module Name: binary_to_7_segment
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
`define SS_0 8'b0000_0011
`define SS_1 8'b1001_1111
`define SS_2 8'b0010_0101
`define SS_3 8'b0000_1101
`define SS_4 8'b1001_1001
`define SS_5 8'b0100_1001
`define SS_6 8'b0100_0001
`define SS_7 8'b0001_1011
`define SS_8 8'b0000_0001
`define SS_9 8'b0000_1001
`define SS_A 8'b0001_0001
`define SS_b 8'b1100_0001
`define SS_C 8'b0110_0011
`define SS_d 8'b1000_0101
`define SS_E 8'b0110_0001
`define SS_F 8'b0111_0001

module binary_to_7_segment(i, D, d, ctrl);
    input [3:0] i;  //i represents for 4-bit binary input
    output [7:0] D;  //ssd decoder
    output [3:0] d;  //LED controller
    output [3:0] ctrl;
    reg [7:0] D;
    reg [3:0] d;
    reg [3:0] ctrl;
    always @* begin
        case(i)
            4'b0000: D = `SS_0;
            4'b0001: D = `SS_1;
            4'b0010: D = `SS_2;
            4'b0011: D = `SS_3;
            4'b0100: D = `SS_4;
            4'b0101: D = `SS_5;
            4'b0110: D = `SS_6;
            4'b0111: D = `SS_7;
            4'b1000: D = `SS_8;
            4'b1001: D = `SS_9;
            4'b1010: D = `SS_A;
            4'b1011: D = `SS_b;
            4'b1100: D = `SS_C;
            4'b1101: D = `SS_d;
            4'b1110: D = `SS_E;
            4'b1111: D = `SS_F;
        endcase
        d = i;
        ctrl = 4'b0000;
    end
endmodule
