`timescale 1ns / 1ps

module ALU16
(
    input [3:0] SW, 
    output wire [1:0] LED
);    
    reg [31:0] GG;
    
    parameter A = 32'h0000_0001;
    parameter B = 32'h0000_0002;
    
    assign LED = SW[1:0];
    
    always@( SW[3] ) begin
        GG = 32'h0000_0000;
    end
    
    always@(*) begin
        case( SW[1:0] )
            2'b00: GG = A + B;                   
            2'b01: GG = A - B;                   
            2'b10: GG = A * B;                   
            2'b11: GG = A >> B;
        endcase
    end
    
endmodule

/*

module tstclk(
    input [15:0] SW,
    output [15:0] LED,
    input CLK100MHZ
    );
    
    reg sclk;
    
    always@(posedge CLK100MHZ, posedge SW[15]) begin
        if(SW[15]==1)   sclk = 0;
        else            sclk = ~sclk;

    end
    
    assign LED[0] = CLK100MHZ;
    assign LED[1] = sclk;
    
endmodule
*/

/*
FOR SIM

module ALU16(
    input [3:0] SW,
    output reg [31:0] GG, 
    output wire [1:0] LED
    );
    
    parameter A = 32'h0000_0001;
    parameter B = 32'h0000_0002;
    
    assign LED = SW[1:0];
    
    always@(SW[3]) begin
        GG = 32'h0000_0000;
    end
    
    always@(*) begin        
        case( SW[1:0] )
            2'b00: GG = A + B;                   
            2'b01: GG = A - B;                   
            2'b10: GG = A * B;                   
            2'b11: GG = A >> B;
        endcase
    end
    
    
endmodule

*/





