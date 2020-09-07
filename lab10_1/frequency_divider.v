`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/25 14:41:45
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


module frequency_divider(clk, rst, audio_mclk, audio_lrclk, audio_sclk);
    input clk, rst;
    output audio_mclk, audio_lrclk, audio_sclk;
    
    reg [10:0] q;
    reg [10:0] q_temp;
    
    assign audio_mclk = q[2];
    assign audio_lrclk = q[9];
    assign audio_sclk = q[4];
    
    always @* begin
        q_temp = q + 1'b1;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst)
            q <= 11'b0;
        else 
            q <= q_temp;
    end
endmodule
