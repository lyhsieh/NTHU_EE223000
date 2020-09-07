`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/02 21:16:09
// Design Name: 
// Module Name: simple_speaker
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


module simple_speaker(clk, rst, Do, Re, Mi, plus, minus, audio_mclk, audio_lrclk, audio_sclk, audio_sdin, ssd_ctrl, show);
    input clk, rst, Do, Re, Mi, plus, minus;
    output audio_mclk, audio_lrclk, audio_sclk, audio_sdin;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    
    wire clk_1hz, clk_100hz;
    wire [1:0] clk_quick;
    
    wire Do_after_debounce, Re_after_debounce, Mi_after_debounce;
    wire [21:0] note_div;
    
    wire plus_after_debounce, minus_after_debounce, plus_after_one_pulse, minus_after_one_pulse;
    wire [3:0] state;
    wire [15:0] high;
    wire [15:0] low;
    
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    debounce d(.clk_100hz(clk_100hz), .rst(rst), .pb_in(Do), .pb_debounced(Do_after_debounce));
    debounce r(.clk_100hz(clk_100hz), .rst(rst), .pb_in(Re), .pb_debounced(Re_after_debounce));
    debounce m(.clk_100hz(clk_100hz), .rst(rst), .pb_in(Mi), .pb_debounced(Mi_after_debounce));
    note_decoder U1(.Do_processed(Do_after_debounce), .Re_processed(Re_after_debounce), .Mi_processed(Mi_after_debounce), .note_div(note_div));
    
    debounce U2(.clk_100hz(clk_100hz), .rst(rst), .pb_in(plus), .pb_debounced(plus_after_debounce));
    debounce U3(.clk_100hz(clk_100hz), .rst(rst), .pb_in(minus), .pb_debounced(minus_after_debounce));
    one_pulse U4(.in_trig(plus_after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(plus_after_one_pulse));
    one_pulse U5(.in_trig(minus_after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(minus_after_one_pulse));
    FSM U6(.clk_100hz(clk_100hz), .rst(rst), .plus_processed(plus_after_one_pulse), .minus_processed(minus_after_one_pulse), .state(state));
    volume_decoder U7(.state(state), .high(high), .low(low));
    
    speaker U8(.clk(clk), .rst(rst), .high(high), .low(low), .note_div(note_div), .audio_mclk(audio_mclk), .audio_lrclk(audio_lrclk), .audio_sclk(audio_sclk), .audio_sdin(audio_sdin));
    volume_display U9(.clk_quick(clk_quick), .state(state), .show(show), .ssd_ctrl(ssd_ctrl));
endmodule
