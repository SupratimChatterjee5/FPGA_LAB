`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2021 19:19:34
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
    
    output [7:0] YL
    

    ); 
    wire [7:0]A;
    wire [7:0]B;
    wire [2:0]S;
    wire [7:0]YH1;
    wire [7:0]YL1;  
    ALU a1(A,B,S,YH1,YL1);
    vio_0 v1(Clk,YH1,YL1,A,B,S);
    
    assign YL=YL1;
    
    
    
endmodule
