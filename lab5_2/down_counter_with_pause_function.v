`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/29 19:14:14
// Design Name: 
// Module Name: down_counter_with_pause_function
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


module down_counter_with_pause_function(press, clk, show, ssd_active, led, state_led);
    input press, clk;
    output [7:0] show;
    output [3:0] ssd_active;
    output [14:0] led;
    output state_led;
    
    wire rst;
    wire press;
    wire state;
    wire connect;
    wire unuse;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire clk_1hz, clk_100hz, clk_quick;
    wire one_pulse_in, after_one_pulse;
    wire [7:0] digit0_dec;
    wire [7:0] digit1_dec;
    wire rst_before;
    reg [3:0] limit0, limit1;
    reg [7:0] show;
    reg [3:0] ssd_active;
    reg [14:0] led;
    reg state_led;
    
    assign rst = (~rst_before);
    
    always @* begin
        limit0 = 4'd9;
        limit1 = 4'd2;
        state_led = state;
    end
    
    always @* begin
        if(digit0 == 1'b0 && digit1 == 1'b0) begin
            led = 16'b1111_1111_1111_1111;
        end
        else begin
            led = 16'b0;
        end
    end
    
    
    FSM U0(.clk(clk_100hz), .rst(rst), .press(after_one_pulse), .state(state));
    Udc0 right(.clk(clk_1hz), .rst(rst), .decrease(state), .rst_value(4'b0000), .limit(limit0), .value(digit0), .borrow(connect));
    Udc0 left(.clk(clk_1hz), .rst(rst), .decrease(connect), .rst_value(4'b0011), .limit(limit1), .value(digit1), .borrow(unuse));
    debounce U1(.clk_100hz(clk_100hz), .rst(rst), .pb_in(press), .pb_debounced(one_pulse_in));
    one_pulse U2(.clk_1hz(clk_100hz), .rst(rst), .in_trig(one_pulse_in), .out_pulse(after_one_pulse));
    frequency_divider_exact_1hz U3(.clk(clk), .rst(rst), .clk_out_1hz(clk_1hz), .clk_out_100hz(clk_100hz), .clk_for_ssd(clk_quick));
    BCD_to_7_segment U4(.i(digit0), .D_ssd(digit0_dec));
    BCD_to_7_segment U5(.i(digit1), .D_ssd(digit1_dec));
    button_timer U6(.clk(clk), .press(press), .rst_or_not(rst_before));
    
    always @* begin
        if(clk_quick == 1'b0) begin
            show = digit0_dec;
            ssd_active = 4'b1110;
        end
        else begin
            show = digit1_dec;
            ssd_active = 4'b1101;
        end
        
    end
endmodule
