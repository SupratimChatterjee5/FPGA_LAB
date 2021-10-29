`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2021 11:57:31
// Design Name: 
// Module Name: debounce
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


module debounce(
    input Clk190,
    input din,
    input Reset,
    output dout
    ); 
    reg A,B,C;
    always@(posedge Clk190,posedge Reset)
    begin 
    if(Reset==1) 
    begin
    A<=0;
    B<=0;
    C<=0; 
    end 
    else
    begin 
    A<=din;
    B<=A;
    C<=B;
    end
    
    end 
    assign dout= A & B & ~C; 
endmodule
