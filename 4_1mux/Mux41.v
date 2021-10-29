`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2021 11:41:36
// Design Name: 
// Module Name: Mux41
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


module Mux41(
    input I0,
    input I1,
    input I2,
    input I3,
    input S1,
    input S0,
    output reg O
    ); 
    always @(I0,I1,I2,I3,S1,S0)
    begin 
    case({S1,S0})
    2'b00: O=I0;
    2'b01: O=I1;
    2'b10: O=I2;
    2'b11: O=I3;
    
    endcase
    end
endmodule
