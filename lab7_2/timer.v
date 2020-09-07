`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 15:13:07
// Design Name: 
// Module Name: timer
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


module timer(setting, set_min, set_hr, press_or_resume, clk, rst_before, show, ssd_ctrl);
    input setting, set_min, set_hr, press_or_resume, clk, rst_before;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    
    wire pr_after_debounce, pr_after_one_pulse, state1_temp;
    wire sm_after_debounce, sm_after_one_pulse;
    wire sh_after_debounce, sh_after_one_pulse;
    reg sm_before, sh_before, state1;
    wire rst;
    wire clk_1hz, clk_100hz;
    wire [1:0] clk_quick;
    
    wire ci_connect1, ci_connect2;
    wire unuse1, unuse2, unuse3;
    wire result1;
    
    wire [3:0] min0_set;
    wire [3:0] min1_set;
    wire [3:0] hr0_set;
    wire [3:0] hr1_set;
    wire [3:0] min0;
    wire [3:0] min1;
    wire [3:0] hr0;
    wire [3:0] hr1; 
        
    assign rst = ~(rst_before);
    
    always @* begin
        if(setting == 1'b0)
            sm_before = 1'b0;
        else
            sm_before = set_min;
    end
    always @* begin
        if(setting == 1'b0)
            sh_before = 1'b0;
        else
            sh_before = set_hr;
    end
    
    always @* begin
        if(setting == 1'b0)
            state1 = state1_temp;
        else
            state1 = 1'b0;            
    end
    
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    
    debounce U1(.clk_100hz(clk_100hz), .rst(rst), .pb_in(press_or_resume), .pb_debounced(pr_after_debounce));
    one_pulse U2(.in_trig(pr_after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(pr_after_one_pulse));
    FSM U3(.clk_100hz(clk_100hz), .rst(rst), .press_processed(pr_after_one_pulse), .state(state1_temp));
    
    debounce U4(.clk_100hz(clk_100hz), .rst(rst), .pb_in(sm_before), .pb_debounced(sm_after_debounce));
    one_pulse U5(.in_trig(sm_after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(sm_after_one_pulse));
    
    debounce U6(.clk_100hz(clk_100hz), .rst(rst), .pb_in(sh_before), .pb_debounced(sh_after_debounce));
    one_pulse U7(.in_trig(sh_after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(sh_after_one_pulse));
    
    selector1 U8(.hr1_set(hr1_set), .result(result1));
    
    upcounter m0set(.increase(sm_after_one_pulse), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_100hz(clk_100hz), .rst(rst), .load_in(min0), .count_or_not(state1), .value(min0_set), .carry(ci_connect1));
    upcounter m1set(.increase(ci_connect1), .upper_bound(4'd5), .initial_value(4'd0), .rst_value(4'd0), .clk_100hz(clk_100hz), .rst(rst), .load_in(min1), .count_or_not(state1), .value(min1_set), .carry(unuse1));
    upcounter h0set(.increase(sh_after_one_pulse), .upper_bound(result1), .initial_value(4'd0), .rst_value(4'd0), .clk_100hz(clk_100hz), .rst(rst), .load_in(hr0), .count_or_not(state1), .value(hr0_set), .carry(ci_connect2));
    upcounter h1set(.increase(ci_connect2), .upper_bound(4'd2), .initial_value(4'd0), .rst_value(4'd0), .clk_100hz(clk_100hz), .rst(rst), .load_in(hr1), .count_or_not(state1), .value(hr1_set), .carry(unuse2));
    
    
    
endmodule
