`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/22 11:19:45
// Design Name: 
// Module Name: background_music
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


module background_music(clk, clk_5hz, rst_n, life, audio_mclk, audio_lrclk, audio_sclk, audio_sdin);
    input clk, clk_5hz, rst_n;
    input [5:0] life;
    output audio_mclk, audio_lrclk, audio_sclk, audio_sdin;
    
    wire [21:0] note_div;
    reg [3:0] pitch;
    
    reg [11:0] p;
    reg [11:0] p_next;
    wire [5:0] series;
    
    always @* begin
        p_next = p + 1'b1;
    end
    always @(posedge clk_5hz or negedge rst_n) begin
        if(~rst_n)
            p <= 12'b0;
        else
            p <= p_next;
    end
    
    assign series = p % 64;
    
    always @* begin
        if(life == 5'b0)
            pitch = 4'd0;
        else begin
            case(series)
                6'd0: pitch = 4'd0;
                6'd1: pitch = 4'd0;
                6'd2: pitch = 4'd1;
                6'd3: pitch = 4'd1;
                6'd4: pitch = 4'd1;
                6'd5: pitch = 4'd2;
                6'd6: pitch = 4'd3;
                6'd7: pitch = 4'd2;
                6'd8: pitch = 4'd1;
                6'd9: pitch = 4'd5;            
                6'd10: pitch = 4'd5;            
                6'd11: pitch = 4'd5;
                6'd12: pitch = 4'd5;
                6'd13: pitch = 4'd6;
                6'd14: pitch = 4'd3;
                6'd15: pitch = 4'd4;
                6'd16: pitch = 4'd2;
                6'd17: pitch = 4'd2;
                6'd18: pitch = 4'd2;
                6'd19: pitch = 4'd2;
                6'd20: pitch = 4'd3;            
                6'd21: pitch = 4'd4;
                6'd22: pitch = 4'd3;
                6'd23: pitch = 4'd2;
                6'd24: pitch = 4'd1;
                6'd25: pitch = 4'd8;
                6'd26: pitch = 4'd7;
                6'd27: pitch = 4'd6;
                6'd28: pitch = 4'd5;
                6'd29: pitch = 4'd4;
                6'd30: pitch = 4'd3;
                6'd31: pitch = 4'd2;
                6'd32: pitch = 4'd1;
                6'd33: pitch = 4'd1;
                
                6'd34: pitch = 4'd1;
                6'd35: pitch = 4'd1;
                6'd36: pitch = 4'd1;
                6'd37: pitch = 4'd3;
                6'd38: pitch = 4'd4;
                6'd39: pitch = 4'd3;
                6'd40: pitch = 4'd2;
                6'd41: pitch = 4'd5;
                6'd42: pitch = 4'd5;
                6'd43: pitch = 4'd5;
                6'd44: pitch = 4'd5;
                6'd45: pitch = 4'd5;
                6'd46: pitch = 4'd6;
                6'd47: pitch = 4'd3;
                6'd48: pitch = 4'd4;
                6'd49: pitch = 4'd2;
                6'd50: pitch = 4'd2;
                6'd51: pitch = 4'd2;
                6'd52: pitch = 4'd2;
                6'd53: pitch = 4'd3;
                6'd54: pitch = 4'd4;
                6'd55: pitch = 4'd3;
                6'd56: pitch = 4'd2;
                6'd57: pitch = 4'd1;
                6'd58: pitch = 4'd5;
                6'd59: pitch = 4'd2;
                6'd60: pitch = 4'd3;
                6'd61: pitch = 4'd1;
                6'd62: pitch = 4'd1;
                6'd63: pitch = 4'd0;
            
                default: pitch = 4'd0;            
            endcase
        end
    end
    
    note_div_decoder U0(.pitch(pitch), .note_div(note_div));
    speaker U1(.clk(clk), .rst(rst_n), .note_div(note_div), .audio_mclk(audio_mclk), .audio_lrclk(audio_lrclk), .audio_sclk(audio_sclk), .audio_sdin(audio_sdin));
    /*
            11 232155- 56342-2 232(5)1(1!)765432-
            11 343255- 56342-2 34321(1!)675--
        */
endmodule
