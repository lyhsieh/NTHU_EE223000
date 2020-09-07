`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 15:55:26
// Design Name: 
// Module Name: final_exam
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


module final_exam(clk, rst, increase, decrease, quick, slow, show, ssd_ctrl, led);
    input clk, rst, increase, decrease, quick, slow;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    output [15:0] led; 
    
    wire clk_1hz, clk_10hz, clk_100hz, clk_sel;
    wire [1:0] clk_quick;
        
    wire increase_after_debounce, increase_after_one_pulse, decrease_after_debounce, decrease_after_one_pulse;
    wire increase_or_decrease;
    wire quck_after_debounce, quick_after_one_pulse, slow_after_debounce, slow_after_one_pulse;
    wire speed;
    
    wire increase_en, decrease_en;
    
    wire [3:0] value0;
    wire [3:0] value1;
    wire [3:0] value2;
    wire [3:0] value3;
    wire ci_connect0, ci_connect1, ci_connect2, ci_connect3;
    wire bd_connect0, bd_connect1, bd_connect2, bd_connect3;
    
    wire [7:0] value0_dec;
    wire [7:0] value1_dec;
    wire [7:0] value2_dec;
    wire [7:0] value3_dec;
    
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_out_10hz(clk_10hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    
    debounce U1(.clk_100hz(clk_100hz), .rst(rst), .pb_in(increase), .pb_debounced(increase_after_debounce));
    one_pulse U2(.in_trig(increase_after_debounce), .clk(clk_100hz), .rst(rst), .out_pulse(increase_after_one_pulse));
    debounce U3(.clk_100hz(clk_100hz), .rst(rst), .pb_in(decrease), .pb_debounced(decrease_after_debounce));
    one_pulse U4(.in_trig(decrease_after_debounce), .clk(clk_100hz), .rst(rst), .out_pulse(decrease_after_one_pulse));
    FSM1 U5(.clk(clk_100hz), .rst(rst), .increase_processed(increase_after_one_pulse), .decrease_processed(decrease_after_one_pulse), .state1(increase_or_decrease));
    
    debounce U6(.clk_100hz(clk_100hz), .rst(rst), .pb_in(quick), .pb_debounced(quick_after_debounce));
    one_pulse U7(.in_trig(quick_after_debounce), .clk(clk_100hz), .rst(rst), .out_pulse(quick_after_one_pulse));
    debounce U8(.clk_100hz(clk_100hz), .rst(rst), .pb_in(slow), .pb_debounced(slow_after_debounce));
    one_pulse U9(.in_trig(slow_after_debounce), .clk(clk_100hz), .rst(rst), .out_pulse(slow_after_one_pulse));
    FSM2 U10(.clk(clk_100hz), .rst(rst), .quick_processed(quick_after_one_pulse), .slow_processed(slow_after_one_pulse), .state2(speed));
    
    clock_selector U11(.clk_1hz(clk_1hz), .clk_10hz(clk_10hz), .speed(speed), .clk_sel(clk_sel));
    initial_signal_generator U12(.value0(value0), .value1(value1), .value2(value2), .value3(value3), .increase_or_decrease(increase_or_decrease), .increase_en(increase_en), .decrease_en(decrease_en));
    
    songle_digit_counter U13(.clk(clk_sel), .rst(rst), .increase(increase_en), .decrease(decrease_en), .upper_bound(4'd9), .lower_bound(4'd0), .up_initial_value(4'd0), .down_initial_value(4'd9), .rst_value(4'd1), .carry(ci_connect0), .borrow(bd_connect0), .value(value0));
    songle_digit_counter U14(.clk(clk_sel), .rst(rst), .increase(ci_connect0), .decrease(bd_connect0), .upper_bound(4'd9), .lower_bound(4'd0), .up_initial_value(4'd0), .down_initial_value(4'd9), .rst_value(4'd0), .carry(ci_connect1), .borrow(bd_connect1), .value(value1));
    songle_digit_counter U15(.clk(clk_sel), .rst(rst), .increase(ci_connect1), .decrease(bd_connect1), .upper_bound(4'd9), .lower_bound(4'd0), .up_initial_value(4'd0), .down_initial_value(4'd9), .rst_value(4'd0), .carry(ci_connect2), .borrow(bd_connect2), .value(value2));
    songle_digit_counter U16(.clk(clk_sel), .rst(rst), .increase(ci_connect2), .decrease(bd_connect2), .upper_bound(4'd9), .lower_bound(4'd0), .up_initial_value(4'd0), .down_initial_value(4'd9), .rst_value(4'd0), .carry(ci_connect3), .borrow(bd_connect3), .value(value3));
    
    BCD_to_7_segment U17(.i(value0), .D_ssd(value0_dec));
    BCD_to_7_segment U18(.i(value1), .D_ssd(value1_dec));
    BCD_to_7_segment U19(.i(value2), .D_ssd(value2_dec));
    BCD_to_7_segment U20(.i(value3), .D_ssd(value3_dec));
    display U21(.clk_quick(clk_quick), .value0_dec(value0_dec), .value1_dec(value1_dec), .value2_dec(value2_dec), .value3_dec(value3_dec), .ssd_ctrl(ssd_ctrl), .show(show));
     
    led_controller U22(.value0(value0), .value1(value1), .value2(value2), .value3(value3), .clk_1hz(clk_1hz), .led(led));
endmodule
