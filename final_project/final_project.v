`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 10:24:51
// Design Name: 
// Module Name: final_project
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


module final_project(PS2_CLK, PS2_DATA, clk, rst_n, life_led, show, ssd_ctrl, 
                  hsync, vsync, vga_Red, vgaGreen, vgaBlue, audio_mclk, audio_lrclk, audio_sclk, audio_sdin);
    inout PS2_CLK, PS2_DATA;
    input clk, rst_n;
    output [15:0] life_led;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    //output audio_mclk, audio_lrclk, audio_slk, audio_sdin;
    output hsync, vsync;
    output [3:0] vga_Red;
    output [3:0] vgaGreen;
    output [3:0] vgaBlue;
    output audio_mclk, audio_lrclk, audio_sclk, audio_sdin;
    
    wire down_velocity, next_picture_delay;          
                  
    wire rst;
    wire clk_1hz, clk_5hz;  //clk_5hz is for background music
    wire [1:0] clk_quick;
    
    wire [8:0] last_change;
    wire [511:0] key_down;
    wire key_valid;
    
    wire [1:0] level;
    wire [7:0] random;
    wire [4:0] life;
    wire [9:0] point;
    wire [4:0] key_alphabet;
    wire [3:0] step;
    
    wire clk_25Mhz;
    wire [9:0] h_cnt;
    wire [9:0] v_cnt;
    wire [15:0] pixel_addr;
    wire [11:0] data;
    wire [11:0] pixel;
    
    assign rst = ~(rst_n);
    assign {vga_Red, vgaGreen, vgaBlue} = pixel;
    
    frequency_divider U0(.clk(clk), .clk_25Mhz(clk_25Mhz), .rst_n(rst_n), .level(level), .clk_1hz(clk_1hz), .clk_5hz(clk_5hz), .down_velocity(down_velocity), .next_picture_delay(next_picture_delay), .clk_quick(clk_quick));
    level_counter U1(.clk_1hz(clk_1hz), .rst_n(rst_n), .level(level));
    KeyboardDecoder U2(.key_down(key_down), .last_change(last_change), .key_valid(key_valid), .PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .clk(clk), .rst(rst));
    random U3(.clk(clk), .rst(rst), .random(random));
    
    clock_divisor U4(.clk1(clk_25Mhz), .clk(clk), .clk22());
    vga_controller U5(.pclk(clk_25Mhz), .reset(rst), .hsync(hsync), .vsync(vsync), .valid(), .h_cnt(h_cnt), .v_cnt(v_cnt));
    mem_addr_generator U6(.rst(rst), .clk(clk), .down_velocity(down_velocity), .next_picture_delay(next_picture_delay), .level(level), .key_alphabet(key_alphabet),
                       .random(random), .h_cnt(h_cnt), .v_cnt(v_cnt), .life(life), .point(point), .pixel_addr(pixel_addr));
    life_desplay U7(.life_in(life), .life(life_led));
    score_display U8(.point(point), .clk_quick(clk_quick), .show(show), .ssd_ctrl(ssd_ctrl));
    blk_mem_gen_0 U9(.clka(clk_25Mhz), .wea(0), .addra(pixel_addr), .dina(data), .douta(pixel));
    last_change_decoder U10(.last_change(last_change), .key_alphabet(key_alphabet));
    
    background_music U11(.clk(clk), .clk_5hz(clk_5hz), .rst_n(rst_n), .life(life), .audio_mclk(audio_mclk), .audio_lrclk(audio_lrclk), .audio_sclk(audio_sclk), .audio_sdin(audio_sdin));
    
endmodule
