`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/27 13:35:34
// Design Name: 
// Module Name: double_tones
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


module double_tones(PS2_DATA, PS2_CLK, clk, rst, double, audio_mclk, audio_lrclk, audio_sclk, audio_sdin, show, ssd_ctrl);
    inout PS2_DATA, PS2_CLK;
    input clk, rst, double;
    output audio_mclk, audio_lrclk, audio_sclk, audio_sdin;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    
    wire [8:0] last_change;
    wire [511:0] key_down;
    wire key_valid;
        
    wire rst_for_keyboard;    
    
    wire [21:0] note_div_left;
    wire [21:0] note_div_right;
    
    assign rst_for_keyboard = ~(rst);    
    
    KeyboardDecoder U0(.PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .rst(rst_for_keyboard), .clk(clk), .last_change(last_change), .key_down(key_down), .key_valid(key_valid));
    note_decoder U1(.double(double), .last_change(last_change), .key_down(key_down), .note_div_left(note_div_left), .note_div_right(note_div_right));
    speaker U2(.clk(clk), .rst(rst), .note_div_left(note_div_left), .note_div_right(note_div_right), .audio_mclk(audio_mclk), .audio_lrclk(audio_lrclk), .audio_sclk(audio_sclk), .audio_sdin(audio_sdin));
    note_display U3(.note_div_left(note_div_left), .show(show), .ssd_ctrl(ssd_ctrl));
endmodule
