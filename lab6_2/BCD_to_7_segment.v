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
`define SS_F 8'b0111_0001

module BCD_to_7_segment(i, D_ssd);
    input [3:0] i;  //input
    output [7:0] D_ssd;  //decoder of ssd
    //output [3:0] d;  //controller of LED
    //output [3:0] ctrl;  //controller 
    reg [7:0] D_ssd;
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
