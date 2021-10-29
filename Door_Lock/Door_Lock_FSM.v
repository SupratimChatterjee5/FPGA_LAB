`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2021 12:06:49
// Design Name: 
// Module Name: Door_Lock_FSM
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


module Door_Lock_FSM(
    input Clk,
    input Rst,
    input B, // if B==0 key '0' is pressed if B==1 key '1' is pressed
    output reg Out,
    output reg Err
    ); 
    
    parameter S0=4'b0000, S1=4'b0001, S2=4'b0011, S3=4'b0010, S4=4'b0110, E1=4'b0100, E2=4'b1100, E3=4'b1000, E4=4'b1001;
     reg[3:0]presentstate,nextstate;   
     
     
     //state register
        always@(posedge Clk,posedge Rst)
        begin
        if(Rst==1)
        presentstate<=S0;
        else
        presentstate<=nextstate;
        end     
        
        //next state logic 
        always@(*)
        begin 
        case(presentstate)
        S0:
        begin//initial state 
           
                
                 if(B==0)
                nextstate=E1;
                else
                nextstate=S1;
        end 
        S1:
           begin//correct state 1
                   
                    if(B==0)
                   nextstate=S2;
                   else
                   nextstate=E2;
           end
        S2:
                 begin//correct state 2
                         
                          if(B==0)
                         nextstate=E3;
                         else
                         nextstate=S3;
                 end
                 
        S3:
                       begin // correct state 3
                               
                                if(B==0)
                               nextstate=S4;
                               else
                               nextstate=E4;
                       end   
         S4:
                             begin//correct final state
                                     
                                      if(B==0)
                                     nextstate=S4;
                                     else
                                     nextstate=S4;
                             end       
        
         E1:
                                                      begin//error state 1
                                                              
                                                               
                                                              nextstate=E2;
                                                              
                                                      end  
        E2:
                                            begin//error state 2
                                                      
                                                       
                                                      nextstate=E3;
                                                      
                                             end         
                                                      
       E3:
                                             begin//error state 3
                                                    
                                                     
                                                    nextstate=E4;
                                                    
                                               end                                              
                                                                                                                                                                                                      
              
        
        
        
        
        E4:
                                     begin//final error state 
                                                       
                                                       
                                                       nextstate=E4;
                                                       
                                                                                                      
                                                                                                                                                                                                         
                 
           
           
           end  
           default:nextstate=S0;
           endcase 
           end
           
           //output logic
           always@(presentstate) 
           begin 
           if(presentstate==S4) 
           begin
           Out=1;
           Err=0; 
           end
           else if(presentstate==E4)
           begin 
           Out=0;
           Err=1;
           end 
           else
           begin  
           Out=0;
           Err=0;
           
           end
                                                    
           end
         
         
     
     
     
endmodule
