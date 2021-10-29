`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2021 11:12:30
// Design Name: 
// Module Name: CountFSM
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


module CountFSM(
    input Clk,
    input Rst,
    input CountUp,
    output reg [3:0] CountValue
    );  
    reg[1:0] nextstate,presentstate; 
    parameter S0=2'b00, S1=2'b01, S2=2'b11, S3=2'b10; 
    reg [25:0] count_div;
    always@(posedge Clk, posedge Rst) begin
                if(Rst == 1'b1)
                count_div <= 0;
                else
                count_div <= count_div+1; 
                end
    
    //State register
    always @(posedge count_div[25], posedge Rst)
    begin 
    if(Rst==1) 
    presentstate<=S0;
    else
    presentstate<=nextstate;
    end  
    
    //Next State Logic
    always @(presentstate, CountUp)
    begin 
    case(presentstate)
    S0: begin  
        if(CountUp==1)
        nextstate=S1;
        else
        nextstate=S3;
        end 
    S1: begin  
                if(CountUp==1)
                nextstate=S2;
                else
                nextstate=S0;
         end 
    S2: begin  
                     if(CountUp==1)
                     nextstate=S3;
                     else
                     nextstate=S1;
         end  
    S3: begin  
                     if(CountUp==1)
                     nextstate=S0;
                     else
                     nextstate=S2;
              end 
    endcase         
    
    end
    //Output logic
    always @(presentstate) 
    begin
    case(presentstate)
    S0: CountValue=4'b0000;
    S1: CountValue=4'b0010;
    S2: CountValue=4'b0100;
    S3: CountValue=4'b0110;
    endcase
    end
    
    
endmodule
