`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 12:11:19
// Design Name: 
// Module Name: level_counter
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


module level_counter(clk_1hz, rst_n, level);
    input clk_1hz, rst_n;
    output [1:0] level;
   
    
    reg [1:0] level;
    
    reg [8:0] p;
    reg [8:0] p_next;
    
    always @* begin
        p_next = p + 1'b1;
    end
    always @(posedge clk_1hz or negedge rst_n) begin
        if(~rst_n)
            p <= 9'd0;
        else
            p <= p_next;
    end
    
    always @* begin
        if(p >= 9'd0 && p <= 9'd21) begin
            level = 2'b00;
           
        end
        else if(p > 9'd21 && p <= 9'd40) begin
            level = 2'b01;
          
        end
        else begin
            level = 2'b10;
           
        end
    end
endmodule
