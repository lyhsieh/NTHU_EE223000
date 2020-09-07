`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/19 21:53:13
// Design Name: 
// Module Name: calculator
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


module calculator(left1, left2, right1, right2, pattern, result3, result2, result1, result0, minus);
    input [3:0] left1;
    input [3:0] left2;
    input [3:0] right1;
    input [3:0] right2;
    input [3:0] pattern;
    output [3:0] result3;
    output [3:0] result2;
    output [3:0] result1;
    output [3:0] result0;
    output minus;
    
    reg [15:0] a;
    reg [15:0] b;
    reg [15:0] result;
    reg [3:0] result3;
    reg [3:0] result2;
    reg [3:0] result1;
    reg [3:0] result0;
    reg minus;
    
    always @* begin
        a = left1 * 10 + left2;
        b = right1 * 10 + right2;
    end
    
    always @* begin
        case(pattern)
            4'b1010: begin result = a + b; minus = 1'b0;end
            4'b1011: begin
                        if(a < b) begin
                            result = b - a;
                            minus = 1'b1;
                        end
                        else begin
                            result = a - b;
                            minus = 1'b0;
                        end
                    end
            4'b1100: begin result = a * b; minus = 1'b0; end
            default: begin result = 16'd0; minus = 1'b0; end
        endcase
    end
    
    always @* begin
        result3 = result / 1000;
        result2 = (result % 1000) / 100;
        result1 = (result % 100) / 10;
        result0 = result % 10;
    end
endmodule
