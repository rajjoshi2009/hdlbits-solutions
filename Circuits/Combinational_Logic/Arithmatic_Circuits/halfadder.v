module top_module(
inout a,b,
output cout,sum);
assign cout = a & b;
assign sum =  a ^ b;
endmodule