`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/14 14:24:22
// Design Name: 
// Module Name: date_function_without_leap_year
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


module date_function_without_leap_year(clk, rst_before, content_ctrl, ssd_ctrl, show);
    input clk, rst_before, content_ctrl;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    
    wire clk_1hz, rst;
    wire [1:0] clk_quick;
    wire [3:0] result1;
    wire [3:0] result2;
    wire [3:0] result3;
    wire [3:0] result4;
    wire [3:0] result5;
    wire ci_connect0, ci_connect1, ci_connect2, ci_connect3, ci_connect4, unuse;
    
    
    wire [3:0] day0;
    wire [3:0] day1;
    wire [3:0] month0;
    wire [3:0] month1;
    wire [3:0] year0;
    wire [3:0] year1;
    
    wire [7:0] day0_dec;
    wire [7:0] day1_dec;
    wire [7:0] month0_dec;
    wire [7:0] month1_dec;
    wire [7:0] year0_dec;
    wire [7:0] year1_dec;
    
    assign rst = ~(rst_before);
    
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_for_ssd(clk_quick));
    upcounter d0(.increase(1'b1), .upper_bound(result1), .initial_value(result2), .rst_value(4'd1), .clk_1hz(clk_1hz), .rst(rst), .value(day0), .carry(ci_connect0));
    upcounter d1(.increase(ci_connect0), .upper_bound(result3), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(day1), .carry(ci_connect1));
    upcounter m0(.increase(ci_connect1), .upper_bound(result4), .initial_value(result5), .rst_value(4'd1), .clk_1hz(clk_1hz), .rst(rst), .value(month0), .carry(ci_connect2));
    upcounter m1(.increase(ci_connect2), .upper_bound(4'd1), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(month1), .carry(ci_connect3));
    upcounter y0(.increase(ci_connect3), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(year0), .carry(ci_connect4));
    upcounter y1(.increase(ci_connect4), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(year1), .carry(unuse));
    selector1 U1(.month1(month1), .month0(month0), .day1(day1), .result(result1));
    selector2 U2(.month1(month1), .month0(month0), .day1(day1), .result(result2));
    selector3 U3(.month1(month1), .month0(month0), .result(result3));
    selector4 U4(.month1(month1), .month0(month0), .result(result4));
    selector5 U5(.month1(month1), .month0(month0), .result(result5));
    BCD_to_7_segment U6(.i(day0), .D_ssd(day0_dec));
    BCD_to_7_segment U7(.i(day1), .D_ssd(day1_dec));
    BCD_to_7_segment U8(.i(month0), .D_ssd(month0_dec));
    BCD_to_7_segment U9(.i(month1), .D_ssd(month1_dec));
    BCD_to_7_segment U10(.i(year0), .D_ssd(year0_dec));
    BCD_to_7_segment U11(.i(year1), .D_ssd(year1_dec));
    display_controller U12(.day0_dec(day0_dec), .day1_dec(day1_dec), .month0_dec(month0_dec), .month1_dec(month1_dec), .year0_dec(year0_dec), .year1_dec(year1_dec), .content(content_ctrl), .clk_quick(clk_quick), .ssd_ctrl(ssd_ctrl), .show(show));
    
    
    
endmodule
