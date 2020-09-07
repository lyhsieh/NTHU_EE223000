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


module frequency_divider_exact_1hz(clk_in, rst, clk_out_1hz, clk_for_ssd);
    // a counter-for-50M requires  26 bit
    input clk_in, rst;  //low active reset
    output clk_out_1hz;
    output [1:0] clk_for_ssd;
    
    reg [25:0] p_temp;
    reg [25:0] p;
   
    reg clk_out_1hz;
   
    wire clk_out_1hz_next;
  
    reg [1:0] clk_for_ssd;
    
    assign clk_out_1hz_next = clk_out_1hz ^ (p == 26'd10000000);
    
    always @* begin
        clk_for_ssd[0] = p[16];
        clk_for_ssd[1] = p[17];
    end
    
    always @* begin
        if(p == 26'd10000000) begin
            p_temp = 26'd0;
        end
        else begin
            p_temp = p + 1'b1;
        end
    end
    
  
    
    always @(posedge clk_in or negedge rst) begin
        if(~rst) begin
            p <= 26'd0;
        end
        else begin
            p <= p_temp;
        end      
    end
  
    
    always @(posedge clk_in or negedge rst) begin
        if(~rst) begin
            clk_out_1hz <= 1'b0;
        end
        else begin
            clk_out_1hz <= clk_out_1hz_next;
        end
    end
        
endmodule
