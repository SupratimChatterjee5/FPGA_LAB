`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2021 11:37:39
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(
    input Clk,
    output [7:0] Sum1
    ); 
    
    wire[7:0]A;
    wire[7:0]B;
    wire Cin;
    wire[7:0]Sum;
    wire Cout; 
    
    Adder_8 a1(A,B,Cin,Sum,Cout);
    vio_0 v1(Clk,Sum,Cout,A,B,Cin);
    assign Sum1=Sum;
    
endmodule
