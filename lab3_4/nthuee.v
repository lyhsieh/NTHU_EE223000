`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/17 21:14:19
// Design Name: 
// Module Name: nthuee
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


`define ss_n 8'b1010_1011
`define ss_T 8'b1000_0111
`define ss_H 8'b1000_1001
`define ss_U 8'b1100_0001
`define ss_E 8'b1000_0110

module nthuee(clk, rst, show, ssd_ctrl);
    input clk;
    input rst;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] c;
    reg [7:0] d;
    reg [7:0] e;
    reg [7:0] f;
    
    wire clk_1hz;
    wire [1:0] clk_ssd;
    reg [7:0] show;
    reg [3:0] ssd_ctrl;
    
    
    frequency_divider_about_1hz U0 (.clk(clk), .rst(rst), .k(clk_1hz), .a(clk_ssd[0]), .b(clk_ssd[1]));
    
    always @(posedge clk_1hz or negedge rst) begin
        if(~rst) begin
            a <= `ss_n;
            b <= `ss_T;
            c <= `ss_H;
            d <= `ss_U;
            e <= `ss_E;
            f <= `ss_E;
        end
        else begin
        
            a <= b;
            b <= c;
            c <= d;
            d <= e;
            e <= f;
            f <= a;
           
        end
    end
    
    always @* begin
        if(clk_ssd == 2'b00)
            ssd_ctrl <= 4'b0111;
        else if(clk_ssd == 2'b01)
            ssd_ctrl <= 4'b1011;           
        else if(clk_ssd == 2'b10)
            ssd_ctrl <= 4'b1101;            
        else 
            ssd_ctrl <= 4'b1110;            
    end
    
    
    always @* begin
        if(ssd_ctrl == 4'b0111)
            show = a;
        else if(ssd_ctrl == 4'b1011)
            show = b;
        else if(ssd_ctrl == 4'b1101)
            show = c;
        else 
            show = d;
    end
    
    
    
endmodule

