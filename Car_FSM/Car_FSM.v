`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2021 11:18:21
// Design Name: 
// Module Name: Car_FSM
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


module Car_FSM(
    input Left,
    input Right,
    output reg LC,
    output reg LB,
    output reg LA,
    output reg RC,
    output reg RB,
    output reg RA,
    input Clk,
    input Rst
    );  
    reg[25:0] count_div;  
    reg[2:0]nextstate,presentstate; 
    parameter S0=3'b000, S1=3'b001, S2=3'b011, S3=3'b010, S4=3'b110, S5=3'b111, S6=3'b101;  
    
    always@(posedge Clk, posedge Rst) begin
                    if(Rst == 1'b1)
                    count_div <= 0;
                    else
                    count_div <= count_div+1; 
                    end
    
    //State register
    always@(posedge count_div[25],posedge Rst)
    begin 
    if(Rst==1) 
    presentstate<=S0;
    else
    presentstate<=nextstate;
    end 
    
    //next state logic
    always@(presentstate,Left,Right)
    begin
    case(presentstate)
    S0: begin //initial condition
        if(Left==0 && Right==0)
        nextstate=S0;
        else if(Left==1 && Right==1)
        nextstate=S0;
        else if(Left==1 && Right==0)
        nextstate=S1;
        else
        nextstate=S4;
    end 
    S1: begin //left turn condition
            if(Left==0 && Right==0)
            nextstate=S0;
            else if(Left==1 && Right==1)
            nextstate=S0;
            else if(Left==1 && Right==0)
            nextstate=S2;
            else
            nextstate=S0;
        end
        S2: begin //left turn condition
                    if(Left==0 && Right==0)
                    nextstate=S0;
                    else if(Left==1 && Right==1)
                    nextstate=S0;
                    else if(Left==1 && Right==0)
                    nextstate=S3;
                    else
                    nextstate=S0;
              end 
        S3: begin //left turns final condition
                          if(Left==0 && Right==0)
                          nextstate=S0;
                          else if(Left==1 && Right==1)
                          nextstate=S0;
                          else if(Left==1 && Right==0)
                          nextstate=S0;
                          else
                          nextstate=S0;
                      end 
        S4: begin //right turn condition
                                  if(Left==0 && Right==0)
                                  nextstate=S0;
                                  else if(Left==1 && Right==1)
                                  nextstate=S0;
                                  else if(Left==1 && Right==0)
                                  nextstate=S0;
                                  else
                                  nextstate=S5;
                              end  
        S5: begin //right turn condition
                                          if(Left==0 && Right==0)
                                          nextstate=S0;
                                          else if(Left==1 && Right==1)
                                          nextstate=S0;
                                          else if(Left==1 && Right==0)
                                          nextstate=S0;
                                          else
                                          nextstate=S6;
                                      end  
       S6: begin //right turn final condition
                             if(Left==0 && Right==0)
                              nextstate=S0;
                              else if(Left==1 && Right==1)
                              nextstate=S0;
                              else if(Left==1 && Right==0)
                              nextstate=S0;
                              else
                              nextstate=S0;
                              end 
              
        
        
    
    endcase 
    end 
    
    //output logic 
    always@(presentstate)
    begin 
    case(presentstate)
    S0:  
    begin
    LA=0;
    LB=0;
    LC=0;
    RA=0;
    RB=0;
    RC=0; 
    end
    S1:  
        begin
        LA=1;
        LB=0;
        LC=0;
        RA=0;
        RB=0;
        RC=0; 
        end 
    S2:  
            begin
            LA=1;
            LB=1;
            LC=0;
            RA=0;
            RB=0;
            RC=0; 
      end 
    S3:  
                  begin
                  LA=1;
                  LB=1;
                  LC=1;
                  RA=0;
                  RB=0;
                  RC=0; 
            end 
   S4:  
            begin
                        LA=0;
                        LB=0;
                        LC=0;
                        RA=1;
                        RB=0;
                        RC=0; 
             end
   S5:  
             begin
                         LA=0;
                         LB=0;
                         LC=0;
                         RA=1;
                         RB=1;
                         RC=0; 
                   end
    
     S6:  
         begin
                                LA=0;
                                LB=0;
                                LC=0;
                                RA=1;
                                RB=1;
                                RC=1; 
         end
    
    
    endcase
    
    end

    
    
endmodule
