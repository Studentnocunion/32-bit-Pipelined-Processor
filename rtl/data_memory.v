
module data_memory (
    input wire clk,
    input wire reset,
    input wire mem_read,
    input wire mem_write,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output reg [31:0] read_data
);

    reg [31:0] memory [0:255];
    integer i;

    // Clear memory during reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 256; i = i + 1)
                memory[i] <= 32'd0;
        end
        else if (mem_write) begin
            memory[address[9:2]] <= write_data;
        end
    end

    // Combinational read
    always @(*) begin
        if (mem_read)
            read_data = memory[address[9:2]];
        else
            read_data = 32'd0;
    end

endmodule
