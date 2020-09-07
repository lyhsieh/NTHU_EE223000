`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 17:34:11
// Design Name: 
// Module Name: BCD_to_7_segment
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
`define SS_0 7'b0000_001
`define SS_1 7'b1001_111
`define SS_2 7'b0010_010
`define SS_3 7'b0000_110
`define SS_4 7'b1001_100
`define SS_5 7'b0100_100
`define SS_6 7'b0100_000
`define SS_7 7'b0001_101
`define SS_8 7'b0000_000
`define SS_9 7'b0000_100
`define SS_F 7'b0111_000

module BCD_to_7_segment(i, D_ssd);
    input [3:0] i;  //input
    output [6:0] D_ssd;  //decoder of ssd
    //output [3:0] d;  //controller of LED
    //output [3:0] ctrl;  //controller 
    reg [6:0] D_ssd;
    //reg [3:0] d;
    //reg [3:0] ctrl;
    always @* begin
        case(i)
            4'b0000: D_ssd = `SS_0;
            4'b0001: D_ssd = `SS_1;
            4'b0010: D_ssd = `SS_2;
            4'b0011: D_ssd = `SS_3;
            4'b0100: D_ssd = `SS_4;
            4'b0101: D_ssd = `SS_5;
            4'b0110: D_ssd = `SS_6;
            4'b0111: D_ssd = `SS_7;
            4'b1000: D_ssd = `SS_8;
            4'b1001: D_ssd = `SS_9;
            default: D_ssd = `SS_F;
        endcase
    //d = i;
    //ctrl = 4'b0000;
    end
    
endmodule
