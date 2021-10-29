`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2021 12:27:24
// Design Name: 
// Module Name: main_module
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


module main_module(
    input mClk,
    input Rst,
    input B0,
    input B1,
    output Correct,
    output Incorrect
    ); 
    wire Clk190,B,ClkFSM; 
    
    assign B=B0|B1; 
    ClockDivision c1(mClk,Rst,Clk190); 
    debounce d1(Clk190,B,Rst,ClkFSM); 
    Door_Lock_FSM d2(ClkFSM,Rst,B1,Correct,Incorrect);
    
endmodule
