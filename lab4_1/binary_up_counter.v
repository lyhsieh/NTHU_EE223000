`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/12 17:07:29
// Design Name: 
// Module Name: binary_up_counter
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


module binary_up_counter(clk, rst, b);
    input clk, rst;
    output [3:0] b;
    
    wire clk_out;
    reg [3:0] b;
    reg [3:0] b_temp;
    
    frequency_divider_exact_1hz(.clk(clk), .rst(rst), .clk_out(clk_out));
    
    always @* begin
        b_temp = b + 1'b1;
    end
    
    always @(posedge clk_out or negedge rst) begin
        if(~rst)
            b <= 4'b0000;
        else
            b <= b_temp;
    end
endmodule
