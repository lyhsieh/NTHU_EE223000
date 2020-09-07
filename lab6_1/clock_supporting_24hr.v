`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 17:19:46
// Design Name: 
// Module Name: clock_supporting_24hr
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


module clock_supporting_24hr(press, rst_before, clk, content_ctrl, ssd_ctrl, show, am_or_not);
    input press, rst_before, clk, content_ctrl;
    output [3:0] ssd_ctrl;
    output [6:0] show;
    output am_or_not;
    
    /*
    output [3:0] led;
    output [3:0] ledc;
    reg [3:0] led;
    reg [3:0] ledc;
    always @* begin
        led = hr0;
        ledc = c;
    end
    */
    
    wire rst;
    wire after_debounce, after_one_pulse, time_system;
    wire [1:0] clk_quick;
    wire clk_1hz, clk_100hz;
    wire ci_connect0, ci_connect1, ci_connect2, ci_connect3, ci_connect4;
    wire am_or_not_temp;
    
    wire [3:0] sec0;
    wire [3:0] sec1;
    wire [3:0] min0;
    wire [3:0] min1;
    wire [3:0] hr0;
    wire [3:0] hr1;
    
    wire [3:0] hr0_12hr;
    wire [3:0] hr1_12hr;
    
    wire [6:0] sec0_dec;
    wire [6:0] sec1_dec;
    wire [6:0] min0_dec;
    wire [6:0] min1_dec;
    wire [6:0] hr0_dec;
    wire [6:0] hr1_dec;
    wire [6:0] hr0_12hr_dec;
    wire [6:0] hr1_12hr_dec;    
    
    reg am_or_not;
    reg [3:0] c;
    
    always @* begin
        if(hr1 == 4'd2) begin
            c = 4'd3;
        end
        else begin
            c = 4'd9;
        end
    end
        
    assign rst = ~(rst_before);
    
    always @* begin
        if(time_system == 1'b1) begin
            am_or_not = 1'b1;
        end
        else begin
            am_or_not = am_or_not_temp;
        end
    end
    
    frequency_divider_exact_1hz U0(.clk_in(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    debounce U1(.clk_100hz(clk_100hz), .rst(rst), .pb_in(press), .pb_debounced(after_debounce));
    one_pulse U2(.in_trig(after_debounce), .clk_100hz(clk_100hz), .rst(rst), .out_pulse(after_one_pulse));
    FSM U12(.clk_100hz(clk_100hz), .rst(rst), .press_processed(after_one_pulse), .state(time_system));
    upcounter s0(.increase(1'b1), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(sec0), .carry(ci_connect0));
    upcounter s1(.increase(ci_connect0), .upper_bound(4'd5), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(sec1), .carry(ci_connect1));
    upcounter m0(.increase(ci_connect1), .upper_bound(4'd9), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(min0), .carry(ci_connect2));
    upcounter m1(.increase(ci_connect2), .upper_bound(4'd5), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(min1), .carry(ci_connect3));
    upcounter h0(.increase(ci_connect3), .upper_bound(c), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(hr0), .carry(ci_connect4));
    upcounter h1(.increase(ci_connect4), .upper_bound(4'd2), .initial_value(4'd0), .rst_value(4'd0), .clk_1hz(clk_1hz), .rst(rst), .value(hr1), .carry(unuse));
    BCD_to_7_segment U3(.i(sec0), .D_ssd(sec0_dec));
    BCD_to_7_segment U4(.i(sec1), .D_ssd(sec1_dec));
    BCD_to_7_segment U5(.i(min0), .D_ssd(min0_dec));
    BCD_to_7_segment U6(.i(min1), .D_ssd(min1_dec));
    BCD_to_7_segment U7(.i(hr0), .D_ssd(hr0_dec));
    BCD_to_7_segment U8(.i(hr1), .D_ssd(hr1_dec));
    BCD_to_7_segment U9(.i(hr0_12hr), .D_ssd(hr0_12hr_dec));
    BCD_to_7_segment U10(.i(hr1_12hr), .D_ssd(hr1_12hr_dec));
    time_system_converter U11(.hr0(hr0), .hr1(hr1), .hr0_12hr(hr0_12hr), .hr1_12hr(hr1_12hr), .am_or_not_temp(am_or_not_temp));
    display_controller U13(.sec0_dec(sec0_dec), .sec1_dec(sec1_dec), .min0_dec(min0_dec), .min1_dec(min1_dec), .hr0_dec(hr0_dec), .hr1_dec(hr1_dec), .hr0_12hr_dec(hr0_12hr_dec), .hr1_12hr_dec(hr1_12hr_dec), .content(content_ctrl), .clk_quick(clk_quick), .time_system(time_system), .ssd_ctrl(ssd_ctrl), .show(show));
    
endmodule
