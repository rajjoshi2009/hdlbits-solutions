// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    always @(*)begin
        casez(in)
            8'b???????1: pos = 3'd0;  // in[0]
            8'b??????10: pos = 3'd1;  // in[1]
            8'b?????100: pos = 3'd2;  // in[2]
            8'b????1000: pos = 3'd3;  // in[3]
            8'b???10000: pos = 3'd4;  // in[4]
            8'b??100000: pos = 3'd5;  // in[5]
            8'b?1000000: pos = 3'd6;  // in[6]
            8'b10000000: pos = 3'd7;  // in[7]
            default:     pos = 3'd0;  // no bits set
        endcase
    end                    
endmodule
