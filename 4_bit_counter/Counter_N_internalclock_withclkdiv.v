`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2021 12:16:06
// Design Name: 
// Module Name: Counter_N
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


module Counter_N(
    input clk,
    input rst,
    output reg [3:0] count
    ); 
    reg [26:0] count_div;
            //reg count;
            always@(posedge clk, posedge rst) begin
            if(rst == 1'b1)
            count_div <= 0;
            else
            count_div <= count_div+1; 
            end
            always@(posedge count_div[26], posedge rst) begin
            if(rst == 1)
            count <= 0;
            else
            count = count+1;
            end
endmodule
