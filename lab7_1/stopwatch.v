`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 20:03:10
// Design Name: 
// Module Name: stopwatch
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


module stopwatch(clk, pause_or_resume, lap_or_reset, ssd_ctrl, show, p);
    input clk, pause_or_resume, lap_or_reset;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    
    output reg p;
    always @* p = state1;
    
    wire rst;
    wire pr_after_debounce, pr_after_one_pulse, state1;
    wire lr_after_debounce, lr_after_one_pulse, state2;
    wire clk_1hz, clk_100hz;
    wire [1:0] clk_quick;
    
    wire ci_connect1, ci_connect2, ci_connect3, ci_connect4, unuse;
    wire [3:0] sec0;
    wire [3:0] sec1;
    wire [3:0] min0;
    wire [3:0] min1;    
    wire [7:0] sec0_dec;
    wire [7:0] sec1_dec;
    wire [7:0] min0_dec;
    wire [7:0] min1_dec;
    
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    debounce U1(.clk_100hz(clk_100hz), .rst(rst), .pb_in(pause_or_resume), .pb_debounced(pr_after_debounce));
    one_pulse U2(.in_trig(pr_after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(pr_after_one_pulse));
    FSM1 U3(.press_processed(pr_after_one_pulse), .clk_100hz(clk_100hz), .rst(rst), .state(state1));
    
    reset_counter U4(.press(lap_or_reset), .clk(clk), .rst(rst));
    debounce U5(.clk_100hz(clk_100hz), .rst(rst), .pb_in(lap_or_reset), .pb_debounced(lr_after_debounce));
    one_pulse U6(.in_trig(lr_after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(lr_after_one_pulse));
    FSM2 U7(.press_processed(lr_after_one_pulse), .clk_100hz(clk_100hz), .rst(rst), .state(state2));
    
    upcounter s0(.increase(state1), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(sec0), .carry(ci_connect1));
    upcounter s1(.increase(ci_connect1), .upper_bound(4'd5), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(sec1), .carry(ci_connect2));
    upcounter m0(.increase(ci_connect2), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(min0), .carry(ci_connect3));
    upcounter m1(.increase(ci_connect3), .upper_bound(4'd5), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(min1), .carry(unuse));
    
    BCD_to_7_segment U8(.i(sec0), .D_ssd(sec0_dec));
    BCD_to_7_segment U9(.i(sec1), .D_ssd(sec1_dec));
    BCD_to_7_segment U10(.i(min0), .D_ssd(min0_dec));
    BCD_to_7_segment U11(.i(min1), .D_ssd(min1_dec));
    
    display_controller U12(.sec0_dec(sec0_dec), .sec1_dec(sec1_dec), .min0_dec(min0_dec), .min1_dec(min1_dec), .lap_or_not(state2), .clk_100hz(clk_100hz), .rst(rst), .clk_quick(clk_quick), .ssd_ctrl(ssd_ctrl), .show(show));
    
endmodule
