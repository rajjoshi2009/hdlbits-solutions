`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
wire A1= a & b;
wire A2= c & d;
wire A3= A1 | A2;
assign out = A3;
assign out_n= ~A3;

endmodule