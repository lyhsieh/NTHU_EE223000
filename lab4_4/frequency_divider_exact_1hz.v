`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/09 20:50:09
// Design Name: 
// Module Name: frequency_divider_exact_1hz
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


module frequency_divider_exact_1hz(clk, rst, clk_out);
    // a counter-for-50M requires  26 bit
    input clk, rst;  //low active reset
    output clk_out;
    
    reg [25:0] q_temp;
    reg [25:0] q;
    reg clk_out;
    
    always @* begin
        q_temp <= q + 1'b1;
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            q <= 26'd0;
            clk_out = 1'b0;
        end
        else if(q >= 26'd 50000000) begin
            clk_out = ~clk_out;
            q = 26'd0;
        end
        else begin
            q <= q_temp;
        end
        
    end
endmodule
