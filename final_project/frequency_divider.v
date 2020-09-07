`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 10:28:14
// Design Name: 
// Module Name: frequency_divider
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


module frequency_divider(clk, rst_n, level, clk_1hz, clk_5hz, down_velocity, next_picture_delay, clk_quick,clk_25Mhz);
    
input clk, rst_n,clk_25Mhz;
input [1:0] level;
output clk_1hz, clk_5hz;    //clk_2hz is for background music
output reg down_velocity;
output next_picture_delay;
output [1:0] clk_quick;
    
reg [25:0] a_next;
reg [25:0] a;    
reg [25:0] b_next;
reg [25:0] b;
reg clk_1hz, clk_5hz;
wire [1:0] clk_quick;
wire clk_1hz_next, clk_5hz_next;
reg [26:0] tmp_dv_cnt;
reg [26:0] tmp_npd_cnt;
reg [26:0] dv_cnt_max;
reg [26:0] npd_cnt_max;
reg [26:0] dv_cnt;
reg [26:0] npd_cnt;
reg tmp_down_velocity,tmp_next_picture_delay;
wire [1:0] next_level;
reg [1:0] now_level;      
reg [3:0] cnt_for_npd,tmp_cnt_for_npd;
      
assign clk_1hz_next = clk_1hz ^ (a == 26'd50000000);
assign clk_5hz_next = clk_5hz ^ (b == 26'd10000000);
assign clk_quick[0] = a[16];
assign clk_quick[1] = a[17];
always@*begin
    if(a == 26'd50000000)
        a_next = 26'd0;
    else
        a_next = a + 1'b1; 
end
always @* begin
    if(b == 26'd10000000)
        b_next = 26'd0;
    else
        b_next = b + 1'b1;    
end

always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        a <= 26'd0;
    else
        a <= a_next;
    end
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        b <= 26'd0;
    else 
        b <= b_next;
end

always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        clk_1hz <= 1'b0;
    else
        clk_1hz <= clk_1hz_next;
    end
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
        clk_5hz <= 1'b0;
    else
        clk_5hz <= clk_5hz_next; 
end

always@*    
case(level)
2'b00:    
begin
    dv_cnt_max=7500000;        
    npd_cnt_max=75000000;
end
2'b01:
begin
    dv_cnt_max=5000000;
    npd_cnt_max=50000000;
end
2'b10:
begin
    dv_cnt_max=2500000;
    npd_cnt_max=25000000;
end
default:
begin
    dv_cnt_max=2500000;
    npd_cnt_max=25000000;
end
endcase
/*
assign next_level=level;

always@(posedge clk_25Mhz or negedge rst_n)
if(~rst_n)
    now_level<=0;
else
    now_level<=next_level;

always@*
if(dv_cnt>=dv_cnt_max||now_level!=next_level)
    tmp_dv_cnt=0;
else
    tmp_dv_cnt=dv_cnt+1;

always@*
if(npd_cnt>=npd_cnt_max||now_level!=next_level)
    tmp_npd_cnt=0;
else
    tmp_npd_cnt=npd_cnt+1;

always@(posedge clk or negedge rst_n)
if(~rst_n)
begin
    dv_cnt<=27'd0;
    npd_cnt<=27'd0;
end
else
begin
    dv_cnt<=tmp_dv_cnt;
    npd_cnt<=tmp_npd_cnt;
end

always@*
    if(now_level!=next_level)
        tmp_down_velocity=1;
    else
    begin
        if(dv_cnt>=dv_cnt_max)
            tmp_down_velocity=~down_velocity;
        else
            tmp_down_velocity=down_velocity;
    end
    
always@*
    if(now_level!=next_level)
        tmp_next_picture_delay=1;
    else
    begin
    if(npd_cnt>=npd_cnt_max)
        tmp_next_picture_delay=~next_picture_delay;
    else
        tmp_next_picture_delay=next_picture_delay;    
    end
    
always@(posedge clk or negedge rst_n)
if(~rst_n)
begin
    down_velocity<=1;
    next_picture_delay<=1;
end
else
begin
    down_velocity<=tmp_down_velocity;
    next_picture_delay<=tmp_next_picture_delay;
end
*/

always@*
if(dv_cnt>=dv_cnt_max)
    tmp_dv_cnt=0;
else
    tmp_dv_cnt=dv_cnt+1;

always@(posedge clk or negedge rst_n)
if(~rst_n)
    dv_cnt<=0;
else
    dv_cnt<=tmp_dv_cnt;

always@*
if(dv_cnt>=dv_cnt_max)
    tmp_down_velocity=~down_velocity;
else
    tmp_down_velocity=down_velocity;
    
always@(posedge clk or negedge rst_n)
if(~rst_n)
    down_velocity<=0;
else
    down_velocity<=tmp_down_velocity;

assign next_picture_delay=cnt_for_npd[3];

always@*
if(cnt_for_npd==4'd12)
    tmp_cnt_for_npd=0;
else if (cnt_for_npd==4'd4)
    tmp_cnt_for_npd=8;
else
    tmp_cnt_for_npd=cnt_for_npd+1;

always@(posedge down_velocity or negedge rst_n)
if(~rst_n)
    cnt_for_npd<=4'd8;
else
    cnt_for_npd<=tmp_cnt_for_npd;


endmodule
