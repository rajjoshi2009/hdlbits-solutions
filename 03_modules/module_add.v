module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry;
    
    add16 add_low (
        .a (a[15:0]),
    	.b   (b[15:0]),
        .cin (1'b0),        // no carry-in
        .sum (sum[15:0]),
        .cout(carry)
    );
    
    add16 add_high (
        .a   (a[31:16]),
        .b   (b[31:16]),
        .cin (carry),       // carry from lower adder
        .sum (sum[31:16]),
        .cout()             // final carry ignored
    );
    
endmodule