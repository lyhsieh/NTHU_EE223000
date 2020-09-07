`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 21:11:58
// Design Name: 
// Module Name: display_controller
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


module display_controller(sec0_dec, sec1_dec, min0_dec, min1_dec, lap_or_not, clk_100hz, rst, clk_quick, ssd_ctrl, show);
    input [7:0] sec0_dec;
    input [7:0] sec1_dec;
    input [7:0] min0_dec;
    input [7:0] min1_dec;
    input lap_or_not;
    input clk_100hz, rst;
    input [1:0] clk_quick;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    
    reg [7:0] digit0_temp;
    reg [7:0] digit1_temp;
    reg [7:0] digit2_temp;
    reg [7:0] digit3_temp;
    reg [7:0] digit0;
    reg [7:0] digit1;
    reg [7:0] digit2;
    reg [7:0] digit3;
    
    reg [7:0] show;
    reg [3:0] ssd_ctrl; 
    
    always @* begin
        if(lap_or_not == 1'b0) begin
            digit0_temp = digit0;
            digit1_temp = digit1;
            digit2_temp = digit2;
            digit3_temp = digit3;
        end
        else begin
            digit0_temp = sec0_dec;
            digit1_temp = sec1_dec;
            digit2_temp = min0_dec;
            digit3_temp = min1_dec;
        end
    end
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst) begin
            digit0 <= 8'b00000011;
            digit1 <= 8'b00000011;
            digit2 <= 8'b00000011;
            digit3 <= 8'b00000011;
        end
        else begin
            digit0 <= digit0_temp;
            digit1 <= digit1_temp;
            digit2 <= digit2_temp;
            digit3 <= digit3_temp;
        end
    end
        
    always @* begin
        if(clk_quick == 2'b00) begin
            show = digit0;
            ssd_ctrl = 4'b1110;
        end
        else if(clk_quick == 2'b01) begin
            show = digit1;
            ssd_ctrl = 4'b1101;
        end
        else if(clk_quick == 2'b10) begin
            show = digit2;
            ssd_ctrl = 4'b1011;
        end
        else begin
            show = digit3;
            ssd_ctrl = 4'b0111; 
        end
    end
    
endmodule
