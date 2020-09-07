`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/09 20:43:58
// Design Name: 
// Module Name: VGA_calculator
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


module VGA_calculator(PS2_DATA, PS2_CLK, clk, rst, ssd_ctrl, show, vgaRed, vgaGreen, vgaBlue, hsync, vsync);
    inout PS2_DATA, PS2_CLK;
    input clk, rst;  //rst is HIGH active
    output [3:0] ssd_ctrl;
    output [7:0] show;
    output [3:0] vgaRed;
    output [3:0] vgaGreen;
    output [3:0] vgaBlue;
    output hsync;
    output vsync;
    
    wire low_active_rst;    
    wire minus;
    wire [3:0] left1;
    wire [3:0] left2;
    wire [3:0] right1;
    wire [3:0] right2;
    wire [3:0] pattern;
    wire [3:0] result3;
    wire [3:0] result2;
    wire [3:0] result1;
    wire [3:0] result0;
    
    assign low_active_rst = ~(rst);
    
    simple_calculator U0(.PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .clk(clk), .rst(low_active_rst), .ssd_ctrl(ssd_ctrl), .show(show), .minus(minus), .l1(left1), .l2(left2), .r1(right1), .r2(right2), .patt(pattern), .res3(result3), .res2(result2), .res1(result1), .res0(result0));
    top U1(.clk(clk), .rst(rst), .left1(left1), .left2(left2), .right1(right1), .right2(right2), .pattern(pattern), .result3(result3), .result2(result2), .result1(result1), .result0(result0), .vgaRed(vgaRed), .vgaGreen(vgaGreen), .vgaBlue(vgaBlue), .hsync(hsync), .vsync(vsync));
    
endmodule
