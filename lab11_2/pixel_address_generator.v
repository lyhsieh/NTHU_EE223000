`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/09 22:01:15
// Design Name: 
// Module Name: pixel_address_generator
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


module pixel_address_generator(h_cnt, v_cnt, left1, left2, right1, right2, pattern, result0, result1, result2, result3, pixel_addr);
    input [9:0] h_cnt;
    input [9:0] v_cnt;
    input [3:0] left1;
    input [3:0] left2;
    input [3:0] right1;
    input [3:0] right2;
    input [3:0] pattern;
    input [3:0] result3;
    input [3:0] result2;
    input [3:0] result1;
    input [3:0] result0;
    output [15:0] pixel_addr;
    
    reg [15:0] pixel_addr;
    
    always @* begin
        if(v_cnt < 50 &&  h_cnt < 50) begin
            case(left1)
                4'd0: pixel_addr = h_cnt + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt + 50 * v_cnt;
            endcase
        end
        else if(v_cnt < 50 && h_cnt <100 && h_cnt > 50) begin
            case(left2)
                4'd0: pixel_addr = h_cnt % 50 + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt % 50 + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt % 50 + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt % 50 + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt % 50 + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt % 50 + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt % 50 + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt % 50 + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt % 50 + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt % 50 + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt;
            endcase
        end
        else if(v_cnt < 50 && h_cnt < 150 && h_cnt > 100) begin
            case(pattern)
                4'd10: pixel_addr = h_cnt % 50 + 50 * v_cnt + 25000;
                4'd11: pixel_addr = h_cnt % 50 + 50 * v_cnt + 27500;
                4'd12: pixel_addr = h_cnt % 50 + 50 * v_cnt + 30000;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt + 25000;
            endcase
        end
        else if(v_cnt < 50 && h_cnt < 200 && h_cnt > 150) begin
            case(right1)
                4'd0: pixel_addr = h_cnt % 50 + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt % 50 + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt % 50 + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt % 50 + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt % 50 + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt % 50 + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt % 50 + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt % 50 + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt % 50 + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt % 50 + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt;
            endcase
        end
        else if(v_cnt < 50 && h_cnt < 250 && h_cnt > 200) begin
            case(right2)
                4'd0: pixel_addr = h_cnt % 50 + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt % 50 + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt % 50 + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt % 50 + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt % 50 + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt % 50 + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt % 50 + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt % 50 + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt % 50 + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt % 50 + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt;
            endcase
        end
        else if(v_cnt < 50 && h_cnt < 300 && h_cnt > 250) begin
            pixel_addr = h_cnt % 50 + 50 * v_cnt + 32500;
        end
        else if(v_cnt < 50 && h_cnt < 350 && h_cnt > 300) begin
            case(result3)
                4'd0: pixel_addr = h_cnt % 50 + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt % 50 + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt % 50 + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt % 50 + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt % 50 + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt % 50 + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt % 50 + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt % 50 + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt % 50 + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt % 50 + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt;
            endcase
        end
        else if(v_cnt < 50 && h_cnt < 400 && h_cnt > 350) begin
            case(result2)
                4'd0: pixel_addr = h_cnt % 50 + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt % 50 + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt % 50 + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt % 50 + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt % 50 + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt % 50 + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt % 50 + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt % 50 + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt % 50 + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt % 50 + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt;
            endcase
        end
        else if(v_cnt < 50 && h_cnt < 450 && h_cnt > 400) begin
            case(result1)
                4'd0: pixel_addr = h_cnt % 50 + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt % 50 + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt % 50 + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt % 50 + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt % 50 + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt % 50 + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt % 50 + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt % 50 + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt % 50 + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt % 50 + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt;
            endcase
        end
        else if(v_cnt < 50 && h_cnt < 500 && h_cnt > 450) begin
            case(result0)
                4'd0: pixel_addr = h_cnt % 50 + 50 * v_cnt;
                4'd1: pixel_addr = h_cnt % 50 + 50 * v_cnt + 2500;
                4'd2: pixel_addr = h_cnt % 50 + 50 * v_cnt + 5000;
                4'd3: pixel_addr = h_cnt % 50 + 50 * v_cnt + 7500;
                4'd4: pixel_addr = h_cnt % 50 + 50 * v_cnt + 10000;
                4'd5: pixel_addr = h_cnt % 50 + 50 * v_cnt + 12500;
                4'd6: pixel_addr = h_cnt % 50 + 50 * v_cnt + 15000;
                4'd7: pixel_addr = h_cnt % 50 + 50 * v_cnt + 17500;
                4'd8: pixel_addr = h_cnt % 50 + 50 * v_cnt + 20000;
                4'd9: pixel_addr = h_cnt % 50 + 50 * v_cnt + 22500;
                default: pixel_addr = h_cnt % 50 + 50 * v_cnt;
            endcase
        end
        else begin
            pixel_addr = 0;
        end
    end
endmodule
