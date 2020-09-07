`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/22 22:37:15
// Design Name: 
// Module Name: buzzer_control
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


module buzzer_control(clk, rst, note_div, audio_out);
    input clk, rst;
    input [21:0] note_div;
    output [15:0] audio_out;
    
    reg [21:0] clk_cnt_next, clk_cnt;
    reg b_clk, b_clk_next;
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            clk_cnt <= 22'd0;
            b_clk <= 1'b0; 
        end
        else begin
            clk_cnt <= clk_cnt_next;
            b_clk <= b_clk_next;
        end
    end
    
    always @* begin
        if(clk_cnt == note_div) begin
            clk_cnt_next = 22'd0;
            b_clk_next = ~b_clk;
        end
        else begin
            clk_cnt_next = clk_cnt + 1'b1;
            b_clk_next = b_clk;
        end
    end
    
    assign audio_out = (b_clk == 1'b0) ? 16'hB000 : 16'h5FFF;
    
    
endmodule
