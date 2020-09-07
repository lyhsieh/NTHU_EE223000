`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/25 14:40:11
// Design Name: 
// Module Name: speaker_control
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


module speaker_control(clk, rst, audio_left, audio_right, audio_mclk, audio_lrclk, audio_sclk, audio_sdin);
    input clk, rst;
    input [15:0] audio_left;
    input [15:0] audio_right;
    output audio_mclk, audio_lrclk, audio_sclk, audio_sdin;
    
    reg [4:0] p;
    reg [4:0] p_temp;
    
    reg audio_sdin_next;
    reg audio_sdin;
    reg [31:0] value;
    always @(negedge audio_lrclk or negedge rst) begin
        if(~rst)
            value <= 32'b0;
        else begin
            value[0] <= audio_left[15];
            value[1] <= audio_left[14];
            value[2] <= audio_left[13];
            value[3] <= audio_left[12];
            value[4] <= audio_left[11];
            value[5] <= audio_left[10];
            value[6] <= audio_left[9];
            value[7] <= audio_left[8];
            value[8] <= audio_left[7];
            value[9] <= audio_left[6];
            value[10] <= audio_left[5];
            value[11] <= audio_left[4];
            value[12] <= audio_left[3];
            value[13] <= audio_left[2];
            value[14] <= audio_left[1];
            value[15] <= audio_left[0];
            value[16] <= audio_right[15];
            value[17] <= audio_right[14];
            value[18] <= audio_right[13];
            value[19] <= audio_right[12];
            value[20] <= audio_right[11];
            value[21] <= audio_right[10];
            value[22] <= audio_right[9];
            value[23] <= audio_right[8];
            value[24] <= audio_right[7];
            value[25] <= audio_right[6];
            value[26] <= audio_right[5];
            value[27] <= audio_right[4];
            value[28] <= audio_right[3];
            value[29] <= audio_right[2];
            value[30] <= audio_right[1];
            value[31] <= audio_right[0];     
        end
    end
    
    always @* begin
        p_temp = p + 5'b1;
    end
    
    always @(negedge audio_sclk or negedge rst) begin
        if(~rst)
            p <= 5'b0;
        else 
            p <= p_temp;
    end
    
    always @* begin
        case(p)
            5'd0: audio_sdin_next = value[0];
            5'd1: audio_sdin_next = value[1];
            5'd2: audio_sdin_next = value[2];
            5'd3: audio_sdin_next = value[3];
            5'd4: audio_sdin_next = value[4];
            5'd5: audio_sdin_next = value[5];                                
            5'd6: audio_sdin_next = value[6];
            5'd7: audio_sdin_next = value[7];
            5'd8: audio_sdin_next = value[8];
            5'd9: audio_sdin_next = value[9];
            5'd10: audio_sdin_next = value[10];
            5'd11: audio_sdin_next = value[11];
            5'd12: audio_sdin_next = value[12];
            5'd13: audio_sdin_next = value[13];
            5'd14: audio_sdin_next = value[14];
            5'd15: audio_sdin_next = value[15];
            5'd16: audio_sdin_next = value[16];
            5'd17: audio_sdin_next = value[17];
            5'd18: audio_sdin_next = value[18];
            5'd19: audio_sdin_next = value[19]; 
            5'd20: audio_sdin_next = value[20];
            5'd21: audio_sdin_next = value[21];
            5'd22: audio_sdin_next = value[22];    
            5'd23: audio_sdin_next = value[23];
            5'd24: audio_sdin_next = value[24];
            5'd25: audio_sdin_next = value[25];
            5'd26: audio_sdin_next = value[26];
            5'd27: audio_sdin_next = value[27];
            5'd28: audio_sdin_next = value[28];
            5'd29: audio_sdin_next = value[29];
            5'd30: audio_sdin_next = value[30];
            default: audio_sdin_next = value[31];
        endcase
    end
    
    always @(posedge audio_sclk or negedge rst) begin
        if(~rst)
            audio_sdin <= 1'b0;
        else
            audio_sdin <= audio_sdin_next;
    end
    
    frequency_divider_for_speaker U0(.clk(clk), .rst(rst), .audio_mclk(audio_mclk), .audio_lrclk(audio_lrclk), .audio_sclk(audio_sclk));
        
endmodule
