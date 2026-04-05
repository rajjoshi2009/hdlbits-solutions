module top_module (
    input  [31:0] a,
    input  [31:0] b,
    input         sub,
    output [31:0] sum
);
    wire [31:0] b_xor;   // b after optional inversion
    wire carry;

    // XOR b with sub replicated 32 times
    assign b_xor = b ^ {32{sub}};

    // Lower 16-bit adder
    add16 add_low (
        .a   (a[15:0]),
        .b   (b_xor[15:0]),
        .cin (sub),              // +1 when subtracting
        .sum (sum[15:0]),
        .cout(carry)
    );

    // Upper 16-bit adder
    add16 add_high (
        .a   (a[31:16]),
        .b   (b_xor[31:16]),
        .cin (carry),
        .sum (sum[31:16]),
        .cout()                  // ignored
    );
endmodule
