`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/18 14:38:42
// Design Name: 
// Module Name: thirty_second_timer
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


`define SS_0 8'b0000_0011
`define SS_1 8'b1001_1111
`define SS_2 8'b0010_0101
`define SS_3 8'b0000_1101
`define SS_4 8'b1001_1001
`define SS_5 8'b0100_1001
`define SS_6 8'b0100_0001
`define SS_7 8'b0001_1011
`define SS_8 8'b0000_0001
`define SS_9 8'b0000_1001
`define SS_F 8'b0111_0001

module thirty_second_timer(clk, rst, show, ssd_active);
    input clk, rst;
    output [7:0] show;
    output [3:0] ssd_active;
    
    reg [4:0] q_temp;
    reg [4:0] q;
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] show;
    reg [3:0] ssd_active;
    wire clk_1hz;
    wire ssd_ctrl;
    
    frequency_divider_about_1hz U0 (.clk(clk), .rst(rst), .k(clk_1hz), .a(ssd_ctrl));
    //frequency_divider_exact_1hz U1 (.clk(clk), .rst(rst), .clk_out(ssd_ctrl));
    
    always @* begin
        q_temp = q - 1'b1;
    end
    
    always @(posedge clk_1hz or negedge rst) begin
        if(~rst) begin
            q <= 5'd30;
        end
        else begin
            q <= q_temp;
        end
    end
    
    always @* begin
        case(q)
        5'd00 : a = `SS_0;
        5'd01 : a = `SS_0;
        5'd02 : a = `SS_0; 
        5'd03 : a = `SS_0;
        5'd04 : a = `SS_0;
        5'd05 : a = `SS_0;
        5'd06 : a = `SS_0;
        5'd07 : a = `SS_0;
        5'd08 : a = `SS_0;
        5'd09 : a = `SS_0;
        5'd10 : a = `SS_1;
        5'd11 : a = `SS_1;
        5'd12 : a = `SS_1;
        5'd13 : a = `SS_1;
        5'd14 : a = `SS_1;
        5'd15 : a = `SS_1;
        5'd16 : a = `SS_1;
        5'd17 : a = `SS_1;
        5'd18 : a = `SS_1;
        5'd19 : a = `SS_1;
        5'd20 : a = `SS_2;
        5'd21 : a = `SS_2;
        5'd22 : a = `SS_2;
        5'd23 : a = `SS_2;
        5'd24 : a = `SS_2;
        5'd25 : a = `SS_2;
        5'd26 : a = `SS_2;
        5'd27 : a = `SS_2;
        5'd28 : a = `SS_2;
        5'd29 : a = `SS_2;
        5'd30 : a = `SS_3;
        default : a = `SS_F;
        endcase
    end
    
    always @* begin
        case(q)
        5'd00 : b = `SS_0;
        5'd01 : b = `SS_1;
        5'd02 : b = `SS_2;
        5'd03 : b = `SS_3;
        5'd04 : b = `SS_4;
        5'd05 : b = `SS_5;
        5'd06 : b = `SS_6;
        5'd07 : b = `SS_7;
        5'd08 : b = `SS_8;
        5'd09 : b = `SS_9;
        5'd10 : b = `SS_0;
        5'd11 : b = `SS_1;
        5'd12 : b = `SS_2;
        5'd13 : b = `SS_3;
        5'd14 : b = `SS_4;
        5'd15 : b = `SS_5;
        5'd16 : b = `SS_6;
        5'd17 : b = `SS_7;
        5'd18 : b = `SS_8;
        5'd19 : b = `SS_9;
        5'd20 : b = `SS_0;
        5'd21 : b = `SS_1;
        5'd22 : b = `SS_2;
        5'd23 : b = `SS_3;
        5'd24 : b = `SS_4;
        5'd25 : b = `SS_5;
        5'd26 : b = `SS_6;
        5'd27 : b = `SS_7;
        5'd28 : b = `SS_8;
        5'd29 : b = `SS_9;
        5'd30 : b = `SS_0;
        default : b = `SS_F;
        endcase
    end
    
    always @* begin
        if(ssd_ctrl == 1'b0) begin
            ssd_active = 4'b1110;
            show = b;
        end
        else begin
            ssd_active = 4'b1101;
            show = a;
        end
    end
endmodule
