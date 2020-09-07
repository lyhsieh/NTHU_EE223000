`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/15 11:41:28
// Design Name: 
// Module Name: clock_with_leap_year
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


module clock_with_leap_year(clk, rst_before, press, am_or_not, show, ssd_ctrl);
    input clk, rst_before, press;
    output am_or_not;
    output [6:0] show;
    output [3:0] ssd_ctrl;
    
    
    
    
    
    wire rst, clk_1hz, clk_100hz;
    wire [1:0] clk_quick;
    wire after_debounce, after_one_pulse;
    wire [1:0] content;
    reg am_or_not;
    
    wire [3:0] min0;
    wire [3:0] min1;
    wire [3:0] hr0;
    wire [3:0] hr1;
    wire [3:0] hr0_12hr;
    wire [3:0] hr1_12hr;
    wire [3:0] day0;
    wire [3:0] day1;
    wire [3:0] month0;
    wire [3:0] month1;
    wire [3:0] year0;
    wire [3:0] year1;
    wire [3:0] year2;
    wire [3:0] year3;

    wire [6:0] min0_dec;
    wire [6:0] min1_dec;
    wire [6:0] hr0_dec;
    wire [6:0] hr1_dec;
    wire [6:0] hr0_12hr_dec;
    wire [6:0] hr1_12hr_dec;
    wire [6:0] day0_dec;
    wire [6:0] day1_dec;
    wire [6:0] month0_dec;
    wire [6:0] month1_dec;
    wire [6:0] year0_dec;
    wire [6:0] year1_dec;
    wire [6:0] year2_dec;
    wire [6:0] year3_dec;
    
    wire [3:0] result1;
    wire [3:0] result2;
    wire [3:0] result3;
    wire [3:0] result4;
    wire [3:0] result5;
    wire [3:0] result6;
    wire [3:0] result7;
    
    wire ci_connect0, ci_connect1, ci_connect2, ci_connect3, ci_connect4, ci_connect5;
    wire ci_connect6, ci_connect7, ci_connect8, ci_connect9, ci_connect10;
    
    wire am_or_not_temp;
    wire leap_or_not;
    
    always @* begin
        if(content == 2'b01) am_or_not = am_or_not_temp;
        else am_or_not = 1'b1;
    end
    
    assign rst = ~(rst_before);
    
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    debounce U1(.clk_100hz(clk_100hz), .rst(rst), .pb_in(press), .pb_debounced(after_debounce));
    one_pulse U2(.in_trig(after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(after_one_pulse));
    FSM U3(.clk_100hz(clk_100hz), .rst(rst), .press_processed(after_one_pulse), .state(content));
    
    upcounter mi0(.increase(1'b1), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(min0), .carry(ci_connect0));
    upcounter mi1(.increase(ci_connect0), .upper_bound(4'd5), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(min1), .carry(ci_connect1));
    upcounter h0(.increase(ci_connect1), .upper_bound(result6), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(hr0), .carry(ci_connect2));
    upcounter h1(.increase(ci_connect2), .upper_bound(4'd2), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(hr1), .carry(ci_connect3));
    upcounter d0(.increase(ci_connect3), .upper_bound(result1), .initial_value(result2), .rst_value(4'd1), .clk_1hz(clk_1hz), .rst(rst), .value(day0), .carry(ci_connect4));
    upcounter d1(.increase(ci_connect4), .upper_bound(result3), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(day1), .carry(ci_connect5));
    upcounter m0(.increase(ci_connect5), .upper_bound(result4), .initial_value(result5), .rst_value(4'd1), .clk_1hz(clk_1hz), .rst(rst), .value(month0), .carry(ci_connect6));
    upcounter m1(.increase(ci_connect6), .upper_bound(4'd1), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(month1), .carry(ci_connect7));
    upcounter y0(.increase(ci_connect7), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(year0), .carry(ci_connect8));
    upcounter y1(.increase(ci_connect8), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(year1), .carry(ci_connect9)); 
    upcounter y2(.increase(ci_connect9), .upper_bound(result7), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(year2), .carry(ci_connect10));
    upcounter y3(.increase(ci_connect10), .upper_bound(4'd2), .initial_value(4'd0), .rst_value(4'd2), .clk_1hz(clk_1hz), .rst(rst), .value(year3), .carry(unuse));
    
    selector1 U4(.month1(month1), .month0(month0), .day1(day1), .leap_or_not(leap_or_not), .result(result1));
    selector2 U5(.month1(month1), .month0(month0), .day1(day1), .result(result2));
    selector3 U6(.month1(month1), .month0(month0), .result(result3));
    selector4 U7(.month1(month1), .month0(month0), .result(result4));
    selector5 U8(.month1(month1), .month0(month0), .result(result5));
    selector6 U9(.hour1(hr1), .result(result6));
    selector7 U10(.year3(year3), .result(result7));
    
    leap_year_counter U27(.enable(ci_connect7), .rst(rst), .q(leap_or_not));
    
    time_system_converter U11(.hr0(hr0), .hr1(hr1), .hr0_12hr(hr0_12hr), .hr1_12hr(hr1_12hr), .am_or_not_temp(am_or_not_temp));
    
    BCD_to_7_segment U12(.i(min0), .D_ssd(min0_dec));
    BCD_to_7_segment U13(.i(min1), .D_ssd(min1_dec));
    BCD_to_7_segment U14(.i(hr0), .D_ssd(hr0_dec));
    BCD_to_7_segment U15(.i(hr1), .D_ssd(hr1_dec));
    BCD_to_7_segment U16(.i(hr0_12hr), .D_ssd(hr0_12hr_dec));
    BCD_to_7_segment U17(.i(hr1_12hr), .D_ssd(hr1_12hr_dec));
    BCD_to_7_segment U18(.i(day0), .D_ssd(day0_dec));
    BCD_to_7_segment U19(.i(day1), .D_ssd(day1_dec));
    BCD_to_7_segment U20(.i(month0), .D_ssd(month0_dec));
    BCD_to_7_segment U21(.i(month1), .D_ssd(month1_dec));
    BCD_to_7_segment U22(.i(year0), .D_ssd(year0_dec));
    BCD_to_7_segment U23(.i(year1), .D_ssd(year1_dec));
    BCD_to_7_segment U24(.i(year2), .D_ssd(year2_dec));
    BCD_to_7_segment U25(.i(year3), .D_ssd(year3_dec));
    
    display_controller U26(.min0_dec(min0_dec), .min1_dec(min1_dec), .hr0_dec(hr0_dec), .hr1_dec(hr1_dec), .hr0_12hr_dec(hr0_12hr_dec), .hr1_12hr_dec(hr1_12hr_dec), .day0_dec(day0_dec), .day1_dec(day1_dec), .month0_dec(month0_dec), .month1_dec(month1_dec), .year0_dec(year0_dec), .year1_dec(year1_dec), .year2_dec(year2_dec), .year3_dec(year3_dec), .content(content), .clk_quick(clk_quick), .ssd_ctrl(ssd_ctrl), .show(show));
    
    
endmodule
