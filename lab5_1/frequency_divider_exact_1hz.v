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


module frequency_divider_exact_1hz(clk, rst, clk_out_1hz, clk_out_100hz, clk_for_ssd);
    // a counter-for-50M requires  26 bit
    input clk, rst;  //low active reset
    output clk_out_1hz, clk_out_100hz;
    output clk_for_ssd;
    
    reg [25:0] p_temp;
    reg [25:0] p;
    reg [25:0] q_temp;
    reg [25:0] q;
    reg clk_out_1hz;
    reg clk_out_100hz;
    wire clk_out_1hz_next;
    wire clk_out_100hz_next;
    reg clk_for_ssd;
    
    assign clk_out_1hz_next = clk_out_1hz ^ (p == 26'd50000000);
    assign clk_out_100hz_next = clk_out_100hz ^ (q == 26'd500000);
    
    always @* begin
        clk_for_ssd = p[16];
    end
    
    always @* begin
        if(p == 26'd50000000) begin
            p_temp = 26'd0;
        end
        else begin
            p_temp = p + 1'b1;
        end
    end
    
    always @* begin
        if(q == 26'd500000) begin
            q_temp = 26'd0;
        end
        else begin
            q_temp = q + 1'b1;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            p <= 26'd0;
        end
        else begin
            p <= p_temp;
        end      
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            q <= 26'd0;
        end
        else begin
            q <= q_temp;
        end      
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            clk_out_1hz <= 1'b0;
        end
        else begin
            clk_out_1hz <= clk_out_1hz_next;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            clk_out_100hz <= 1'b0;
        end
        else begin
            clk_out_100hz <= clk_out_100hz_next;
        end
    end
    
endmodule
