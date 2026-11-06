
`timescale 1ns/1ps

module program_counter_tb;

    reg clk;
    reg reset;
    reg enable;
    reg [31:0] next_pc;

    wire [31:0] pc;

    program_counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .next_pc(next_pc),
        .pc(pc)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        enable = 0;
        next_pc = 0;

        #10;
        reset = 0;
        enable = 1;

        next_pc = 4;
        #10;

        next_pc = 8;
        #10;

        next_pc = 12;
        #10;

        next_pc = 16;
        #10;

        $display("Final Program Counter = %d", pc);

        $finish;

    end

endmodule
