`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/09 19:43:34
// Design Name: 
// Module Name: frequency_divider_about_1hz
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


module frequency_divider_about_1hz(clk, rst, k, a, b);
    input clk, rst;  //rst is a n active low reset
    output k;
    output a, b;
    reg [26:0] q_temp;
    reg [26:0] q;
    reg k;
    reg a, b;
    always @* begin
        q_temp = q + 1'b1;
        k = q[26];
        a <= q[16];
        b <= q[17];
    end
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            q <= 27'b000000000000000000000000000;
        end
        else begin
            q <= q_temp;
        end
    end
    
endmodule
