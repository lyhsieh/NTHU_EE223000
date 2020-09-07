`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/13 14:31:00
// Design Name: 
// Module Name: BCD_down_counter
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


module BCD_down_counter(clk, rst, led_ctrl, ssd_ctrl, ssd);
    input clk, rst;
    output [3:0] led_ctrl;
    output [3:0] ssd_ctrl;
    output [7:0] ssd;  //result from ssd decoder
    
    reg [3:0] led_ctrl;
    reg [3:0] q;
    reg [3:0] q_temp;
    reg [3:0] ssd_ctrl;
    wire clk_1hz;
    
    frequency_divider_exact_1hz U0 (.clk(clk), .rst(rst), .clk_out(clk_1hz));
    BCD_to_7_segment(.i(q), .D_ssd(ssd));
    
    always @* begin
        if(q == 4'd0) begin
            q_temp = 4'd9;
        end
        else begin
            q_temp = q - 4'd1;
        end
        
        led_ctrl = q;
        ssd_ctrl = 4'b1110;
    end
    
    always @(posedge clk_1hz or negedge rst) begin
        if(~rst) begin
            q <= 4'b0000;
        end
        else begin
            q <= q_temp;
        end
    end
endmodule