`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/14 20:15:43
// Design Name: 
// Module Name: selector2
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


module selector2(month1, month0, day1, result);
    input [3:0] month1;
    input [3:0] month0;
    input [3:0] day1;
    output [3:0] result;

    reg [3:0] result;

    always @* begin
        case(month1)
            4'd0: begin
                case(month0)
                    4'd1: begin  //january
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                    4'd2: begin  //febuary
                        if(day1 == 4'd2)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                    4'd3: begin  //march
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                    4'd4: begin  //april
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                    4'd5: begin  //may
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;    
                    end
                    4'd6: begin  //june
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                    4'd7: begin  //july
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                        end
                    4'd8: begin  //august
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;                        
                        end
                    default: begin  //september
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                endcase  //case(month0)
            end
            default: begin
                case(month0)
                    4'd0: begin  //october
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                    4'd1: begin  //november
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                    default: begin  //december
                        if(day1 == 4'd3)
                            result = 4'd1;
                        else
                            result = 4'd0;
                    end
                endcase  //case(month0)
            end            
        endcase  //case(month1)
    end
endmodule
