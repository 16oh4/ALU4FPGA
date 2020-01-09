`timescale 1ns / 1ps

module TB();
reg SW1, SW2, SW4, SW16, SW15;
wire [31:0] OUT;
reg CLK;        //for simulating 100MHz clock

initial CLK = 0;
always #5 CLK = ~ CLK; //100MHZ CLK

//SLOW_CLK clk(CLK, SCLK);
ALU16 UUT(.CLK100MHZ(CLK), .SW1(SW1), .SW2(SW2), .SW4(SW4),
.SW16(SW16), .SW15(SW15), .ans(OUT)); 

initial begin
    {SW16, SW15, SW4}    = 3'b000;
    
    {SW2, SW1}      = 2'b00; //ADD
    #10 {SW2, SW1}  = 2'b01; //SUBTRACT
    #10 {SW2, SW1}  = 2'b10; //MULT
    #10 {SW2, SW1}  = 2'b11; //RSHIFT
    #10 SW4         = 1'b1;  //RESET
    
end
endmodule