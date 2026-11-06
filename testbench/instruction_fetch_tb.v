
`timescale 1ns/1ps

module instruction_fetch_tb;

    reg clk;
    reg reset;
    reg enable;

    wire [31:0] pc;
    wire [31:0] instruction;

    instruction_fetch uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pc(pc),
        .instruction(instruction)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        enable = 0;

        // Load sample instructions
        uut.IMEM_UNIT.mem[0] = 32'h12345678;
        uut.IMEM_UNIT.mem[1] = 32'hABCDEF01;
        uut.IMEM_UNIT.mem[2] = 32'h87654321;
        uut.IMEM_UNIT.mem[3] = 32'hFEDCBA98;

        #12;

        reset = 0;
        enable = 1;

        // First instruction
        #1;
        $display("PC = %0d | Instruction = %h", pc, instruction);

        // Next instructions
        repeat (3) begin
            @(posedge clk);
            #1;
            $display("PC = %0d | Instruction = %h", pc, instruction);
        end

        $display("------------------------------");
        $display("INSTRUCTION FETCH COMPLETED");
        $display("------------------------------");

        $finish;

    end

endmodule
