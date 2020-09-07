`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 20:19:58
// Design Name: 
// Module Name: simple_calculator
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


module simple_calculator(PS2_DATA, PS2_CLK, clk, rst, ssd_ctrl, show, minus, test, test2, test3);
    inout PS2_DATA, PS2_CLK;
    input clk, rst;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    output minus;
    
    output [3:0] test;
    reg [3:0] test;
    always @* begin
        test = sel;
    end
    
    output [3:0] test2;
    reg [3:0] test2;
    always @* begin
        test2 = digit;
    end
    
    output [3:0] test3;
    reg [3:0] test3;
    reg [3:0] test3_next;
    always @* begin
        test3_next = test3 + 1'b1;
    end
    always @(posedge p_after_one_pulse or negedge rst) begin
        if(~rst)
            test3 <= 4'b0;
        else
            test3 <= test3_next;
    end
    
    
    
    wire [8:0] last_change;
    wire [511:0] key_down;
    wire key_valid;
    
    wire rst_for_keyboard;
    wire n_after_one_pulse, p_after_one_pulse;
    wire [3:0] sel;
    
    wire [3:0] digit;
    wire [3:0] left1;
    wire [3:0] left2;
    wire [3:0] right1;
    wire [3:0] right2;
    wire [3:0] pattern;
    
    wire [3:0] result3;
    wire [3:0] result2;
    wire [3:0] result1;
    wire [3:0] result0;
    
    wire [7:0] left1_dec;
    wire [7:0] left2_dec;
    wire [7:0] right1_dec;
    wire [7:0] right2_dec;
    wire [7:0] result3_dec;
    wire [7:0] result2_dec;
    wire [7:0] result1_dec;
    wire [7:0] result0_dec;
    
    wire [1:0] clk_quick;
    reg [3:0] ssd_ctrl;
    reg [7:0] show;
    
    assign rst_for_keyboard = ~(rst);
    
    KeyboardDecoder U2(.PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .rst(rst_for_keyboard), .clk(clk), .last_change(last_change), .key_down(key_down), .key_valid(key_valid));
    number_one_pulse_generator U3(.clk(clk), .rst(rst), .last_change(last_change), .key_down(key_down), .n_after_one_pulse(n_after_one_pulse));
    pattern_one_pulse_generator U4(.clk(clk), .rst(rst), .last_change(last_change), .key_down(key_down), .p_after_one_pulse(p_after_one_pulse));
    FSM U5(.clk(clk), .rst(rst), .number(n_after_one_pulse), .pattern(p_after_one_pulse), .sel(sel));
    last_change_decoder U6(.last_change(last_change), .digit(digit));
    left1_memory U7(.clk(clk), .rst(rst), .digit(digit), .sel(sel), .left1(left1));
    left2_memory U8(.clk(clk), .rst(rst), .digit(digit), .sel(sel), .left2(left2));
    right1_memory U9(.clk(clk), .rst(rst), .digit(digit), .sel(sel), .right1(right1));
    right2_memory U10(.clk(clk), .rst(rst), .digit(digit), .sel(sel), .right2(right2));
    pattern_memory U11(.clk(clk), .rst(rst), .digit(digit), .sel(sel), .pattern(pattern));
    calculator U12(.left1(left1), .left2(left2), .right1(right1), .right2(right2), .pattern(pattern), .result3(result3), .result2(result2), .result1(result1), .result0(result0), .minus(minus));
    
    BCD_to_7_segment U13(.i(left1), .D_ssd(left1_dec));
    BCD_to_7_segment U14(.i(left2), .D_ssd(left2_dec));
    BCD_to_7_segment U15(.i(right1), .D_ssd(right1_dec));
    BCD_to_7_segment U16(.i(right2), .D_ssd(right2_dec));
    BCD_to_7_segment U17(.i(result3), .D_ssd(result3_dec));
    BCD_to_7_segment U18(.i(result2), .D_ssd(result2_dec));
    BCD_to_7_segment U19(.i(result1), .D_ssd(result1_dec));
    BCD_to_7_segment U20(.i(result0), .D_ssd(result0_dec));
    frequency_divider_exact_1hz U21(.clk_in(clk), .rst(rst), .clk_for_ssd(clk_quick));
    
    always @* begin
        if(sel == 4'b1001) begin    //show the result
            if(clk_quick == 2'b00) begin
                ssd_ctrl = 4'b0111;
                show = result3_dec;
            end
            else if(clk_quick == 2'b01) begin
                ssd_ctrl = 4'b1011;
                show = result2_dec;
            end
            else if(clk_quick == 2'b10) begin
                ssd_ctrl = 4'b1101;
                show = result1_dec;
            end
            else begin
                ssd_ctrl = 4'b1110;
                show = result0_dec;
            end
        end
        else begin    //show the numbers before calculation
            if(clk_quick == 2'b00) begin
                ssd_ctrl = 4'b0111;
                show = left1_dec;
            end
            else if(clk_quick == 2'b01) begin
                ssd_ctrl = 4'b1011;
                show = left2_dec;
            end
            else if(clk_quick == 2'b10) begin
                ssd_ctrl = 4'b1101;
                show = right1_dec;
            end
            else begin
                ssd_ctrl = 4'b1110;
                show = right2_dec;
            end
        end
    end
endmodule
