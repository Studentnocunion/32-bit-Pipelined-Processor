
module immediate_generator (
    input wire [31:0] instruction,

    output wire [31:0] immediate,
    output wire [31:0] jump_address
);

    // Sign extension: 16 bits to 32 bits
    assign immediate = {
        {16{instruction[15]}},
        instruction[15:0]
    };

    // Extract and align 26-bit jump address
    assign jump_address = {
        instruction[25:0],
        2'b00
    };

endmodule