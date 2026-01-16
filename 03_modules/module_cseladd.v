module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry_low;
    wire [15:0] sum_upper0;
    wire [15:0] sum_upper1;
    
    add16 add_low (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(carry_low)
    );
    
    add16 add_high0(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_upper0),
        .cout()
    );
    
    add16 add_high1(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_upper1),
        .cout()
    );
    
    assign sum[31:16] = carry_low ? sum_upper1 : sum_upper0;

endmodule