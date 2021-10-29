`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2021 11:32:50
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
    input Clk,
    input Rst,
    output reg [3:0] Count
    ); 
    always@(posedge Clk, posedge Rst)
    begin  
    if(Rst==1)
    Count=0;
    else
    Count=Count+1;
    
    end
endmodule
