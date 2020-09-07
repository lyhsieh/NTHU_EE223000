`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/10 14:17:11
// Design Name: 
// Module Name: ring_counter
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


module ring_counter(clk, rst, d);
    input clk, rst;  //rst is low active reset
    wire clk_out;
    output [7:0] d;
    reg [7:0] d;
    reg [7:0] led_ctrl;
    
    frequency_divider_exact_1hz U0 (.clk(clk), .rst(rst), .clk_out(clk_out));
    
    always @ (posedge clk_out or negedge rst) begin
        if(~rst) begin
            d <= 8'b01010101;
        end
        else begin
            d[0] <= d[7];
            d[1] <= d[0];
            d[2] <= d[1];
            d[3] <= d[2];
            d[4] <= d[3];
            d[5] <= d[4];
            d[6] <= d[5];
            d[7] <= d[6];
        end
    end
endmodule
