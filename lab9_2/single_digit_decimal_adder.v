`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/18 16:41:01
// Design Name: 
// Module Name: single_digit_decimal_adder
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


module single_digit_decimal_adder(PS2_DATA, PS2_CLK, clk, rst, ssd_ctrl, show, test, test2);
    inout PS2_DATA, PS2_CLK;
    input clk, rst;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    
    output [1:0] test;
    reg [1:0] test;    
    always @* begin
        test = sel;
    end
    output [5:0] test2;
    reg [5:0] test2;
    reg [5:0] test2_next;
    always @* begin
        test2_next = test2 + 1'b1;
    end
    always @(posedge after_one_pulse or negedge rst) begin
        if(~rst)
            test2 <= 5'b0;
        else
            test2 <= test2_next;
    end
    
    wire rst_for_keyboard;
    wire [8:0] last_change;
    wire [511:0] key_down;
    wire key_valid;
    
    reg  before_one_pulse;
    wire after_one_pulse;
    wire [1:0] sel;
    reg [3:0] left_next;
    reg [3:0] right_next;
    reg [3:0] left;
    reg [3:0] right;
    wire [3:0] digit;
    
    wire [3:0] sum_left;
    wire [3:0] sum_right;
    
    wire [7:0] left_dec;
    wire [7:0] right_dec;
    wire [7:0] sum_left_dec;
    wire [7:0] sum_right_dec;
    
    wire [1:0] clk_quick;
    reg [3:0] ssd_ctrl;
    reg [7:0] show;
    
    assign rst_for_keyboard = ~(rst);
    
    always @* begin
        if(last_change == 9'b0_0100_0101 || last_change == 9'b0_0001_0110 || last_change == 9'b0_0001_1110 || last_change == 9'b0_0010_0110
        || last_change == 9'b0_0010_0101 || last_change == 9'b0_0010_1110 || last_change == 9'b0_0011_0110 || last_change == 9'b0_0011_1101
        || last_change == 9'b0_0011_1110 || last_change == 9'b0_0100_0110) 
            before_one_pulse = key_down[last_change];
        else
            before_one_pulse = 1'b0;        
    end 
    
    always @* begin
        if(sel == 2'b01)
            left_next = digit;                 
        else 
            left_next = left;
                    
    end
    
    always @* begin
        if(sel == 2'b11)
            right_next = digit;
        else 
            right_next = right;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            left <= 4'd0;
        else 
            left <= left_next;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            right <= 4'd0;
        else 
            right <= right_next;
    end
    
    always @* begin
        if(clk_quick == 2'b00) begin
            ssd_ctrl = 4'b0111;
            show = left_dec;
        end
        else if(clk_quick == 2'b01) begin
            ssd_ctrl = 4'b1011;
            show = right_dec;
        end
        else if(clk_quick == 2'b10) begin
            ssd_ctrl = 4'b1101;
            show = sum_left_dec;
        end
        else begin
            ssd_ctrl = 4'b1110;
            show = sum_right_dec;
        end
        
    end
    
    one_pulse U0(.in_trig(before_one_pulse), .clk(clk), .rst(rst), .out_pulse(after_one_pulse));
    FSM U1(.sel(sel), .clk(clk), .rst(rst), .press_processed(after_one_pulse));
    KeyboardDecoder U2(.PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .rst(rst_for_keyboard), .clk(clk), .last_change(last_change), .key_down(key_down), .key_valid(key_calid));
    calculator U3(.left(left), .right(right), .sum_left(sum_left), .sum_right(sum_right));
    BCD_to_7_segment U4(.i(left), .D_ssd(left_dec));
    BCD_to_7_segment U5(.i(right), .D_ssd(right_dec));
    BCD_to_7_segment U6(.i(sum_left), .D_ssd(sum_left_dec));
    BCD_to_7_segment U7(.i(sum_right), .D_ssd(sum_right_dec));
    last_change_decoder U8(.last_change(last_change), .digit(digit));
    frequency_divider_exact_1hz U9(.clk_in(clk), .rst(rst), .clk_for_ssd(clk_quick));

endmodule
