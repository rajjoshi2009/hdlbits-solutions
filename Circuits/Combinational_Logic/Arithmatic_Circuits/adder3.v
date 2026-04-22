// Helper module: 1-bit Full Adder
module full_adder (
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

// Top module: 3-bit Ripple Carry Adder
module top_module (
    input [2:0] a, b,
    input cin,
    output [2:0] sum,
    output [2:0] cout
);

    // Instantiate 3 Full Adders
    // Bit 0: Takes the external carry-in
    full_adder fa0 (
        .a(a[0]), 
        .b(b[0]), 
        .cin(cin), 
        .sum(sum[0]), 
        .cout(cout[0])
    );

    // Bit 1: Takes carry-out from bit 0
    full_adder fa1 (
        .a(a[1]), 
        .b(b[1]), 
        .cin(cout[0]), 
        .sum(sum[1]), 
        .cout(cout[1])
    );

    // Bit 2: Takes carry-out from bit 1
    full_adder fa2 (
        .a(a[2]), 
        .b(b[2]), 
        .cin(cout[1]), 
        .sum(sum[2]), 
        .cout(cout[2])
    );

endmodule