`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/30 17:31:51
// Design Name: 
// Module Name: one_pulse
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


module one_pulse(in_trig, clk_100hz, rst, out_pulse);
    input in_trig, clk_100hz, rst;
    output out_pulse;
    
    reg in_trig_delay, out_pulse;
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst) begin
            in_trig_delay <= 1'b0;
        end
        else begin
            in_trig_delay <= in_trig; 
        end
    end
    
    assign out_pulse_next = in_trig & (~in_trig_delay);
    
    always @(posedge clk_100hz or negedge rst) begin
        if(~rst) begin
            out_pulse <= 1'b0;
        end
        else begin
            out_pulse <= out_pulse_next;
        end
    end
    
endmodule
