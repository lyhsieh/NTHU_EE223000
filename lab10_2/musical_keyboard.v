`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/26 21:10:06
// Design Name: 
// Module Name: musical_keyboard
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


module musical_keyboard(PS2_DATA, PS2_CLK, clk, rst, audio_mclk, audio_lrclk, audio_sclk, audio_sdin, letter_case, show, ssd_ctrl);
    inout PS2_DATA, PS2_CLK;
    input clk, rst;
    output audio_mclk, audio_lrclk, audio_sclk, audio_sdin;
    output letter_case;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    
    wire [8:0] last_change;
    wire [511:0] key_down;
    wire key_valid;
    
    wire rst_for_keyboard;
    wire state;
    wire [21:0] note_div;
    
    assign letter_case = state;
    assign rst_for_keyboard = ~(rst);
    
    KeyboardDecoder U0(.PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .rst(rst_for_keyboard), .clk(clk), .last_change(last_change), .key_down(key_down), .key_valid(key_valid));
    case_transformer U1(.clk(clk), .rst(rst), .last_change(last_change), .key_down(key_down), .state(state));
    note_decoder U2(.state(state), .last_change(last_change), .key_down(key_down), .note_div(note_div));
    speaker U3(.clk(clk), .rst(rst), .note_div(note_div), .audio_mclk(audio_mclk), .audio_lrclk(audio_lrclk), .audio_sclk(audio_sclk), .audio_sdin(audio_sdin));
    note_display U4(.state(state), .note_div(note_div), .show(show), .ssd_ctrl(ssd_ctrl));
    
endmodule
