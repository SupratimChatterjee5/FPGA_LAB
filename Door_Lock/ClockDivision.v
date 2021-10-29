`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2021 11:53:06
// Design Name: 
// Module Name: ClockDivision
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


module ClockDivision(
    input mClk,
    input Reset,
    output  Clk190
    ); 
    reg[18:0] Clk_Div; 
    always@(posedge mClk,posedge Reset)
    begin 
    if(Reset==1)
    Clk_Div=0;
    else
    Clk_Div=Clk_Div+1;
    end 
    
    assign Clk190=Clk_Div[18];
endmodule
