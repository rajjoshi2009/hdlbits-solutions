module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
wire A1= p2a & p2b;
wire A2= p2c & p2d;
assign p2y = A1 | A2;
wire A3 = p1a & p1c & p1b;
wire A4 = p1f & p1e & p1d;
assign p1y = A3 | A4;

endmodule