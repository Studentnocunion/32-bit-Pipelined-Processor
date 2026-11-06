
module instruction_memory (
    input wire [31:0] address,
    output wire [31:0] instruction
);

    // 256 locations, each 32 bits
    reg [31:0] mem [0:255];

    integer i;

    // Initialize memory
    initial begin
        for (i = 0; i < 256; i = i + 1)
            mem[i] = 32'b0;
    end

    // Read instruction using word-aligned address
    assign instruction = mem[address[9:2]];

endmodule
