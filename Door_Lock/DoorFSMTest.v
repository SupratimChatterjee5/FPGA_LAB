`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2021 19:10:52
// Design Name: 
// Module Name: DoorFSMTest
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


module DoorFSMTest(

    ); 
    reg Clk,Rst,B;
    wire Out,Err;
    Door_Lock_FSM d1(Clk,Rst,B,Out,Err);
    
    //for reset signal
    initial begin 
    Rst=1'b0;
    #2 Rst=1'b1; 
    #6 Rst=1'b0; 
    #29 Rst=1'b1; 
    #10 Rst=1'b0;    
    end 
    
    // for input
    initial begin 
    B=0;
    #10
    B=1;
    #4
    B=0;
    #4
    B=1;
    #4
    B=0;
    #20
    B=1;
    #4
    B=1;
    #4
    B=0;
    #4
    B=0;
    end 
    
    initial begin //for clk cycle
        Clk=1'b0;
        repeat(50)
        #2 Clk=~Clk;
        $finish;
        
        end
    
endmodule
