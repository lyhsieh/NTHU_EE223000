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


module frequency_divider_exact_1hz(clk_in, rst, clk_for_ssd);
    // a counter-for-50M requires  26 bit
    input clk_in, rst;  //low active reset
    output [1:0] clk_for_ssd;
    
    reg [25:0] p_temp;
    reg [25:0] p;
    reg [1:0] clk_for_ssd;    
 
    always @* begin
        clk_for_ssd[0] = p[16];
        clk_for_ssd[1] = p[17];
    end
    
    always @(posedge clk_in or negedge rst) begin
        if(~rst) begin
            p <= 26'd0;
        end
        else begin
            p <= p_temp;
        end      
    end
    
    always @* begin
        p_temp = p + 1'b1;
    end
    
endmodule
