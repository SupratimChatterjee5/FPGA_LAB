`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2021 12:15:55
// Design Name: 
// Module Name: Test_Car_FSM
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


module Test_Car_FSM(

    ); 
    
    reg clk,rst,left,right; //inputs
    wire L1,L2,L3,R1,R2,R3; //outputs
    
    Car_FSM t1(left,right,L3,L2,L1,R3,R2,R1,clk,rst); //instantiation
    initial begin //for reset
    rst=1'b0;
    #1 rst=1'b1;
    #6 rst=1'b0;
    end
    
    initial begin //checking left and right inputs
    left=0;
    right=0;
    #1 left=1;
    right=0;
    #20
    left=1;
    right=1;
    #20
    left=0;
    right=1;
    end 
    
    initial begin //clock input
    clk=1'b0;
    repeat(100)
    #2 clk=~clk;
    $finish;
    end
    
    
        
endmodule
