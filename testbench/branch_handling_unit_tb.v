
`timescale 1ns/1ps

module branch_handling_unit_tb;

    reg [31:0] pc;
    reg [31:0] immediate;
    reg branch;
    reg zero;

    wire [31:0] branch_target;
    wire [31:0] next_pc;
    wire branch_taken;

    branch_handling_unit uut (
        .pc(pc),
        .immediate(immediate),
        .branch(branch),
        .zero(zero),
        .branch_target(branch_target),
        .next_pc(next_pc),
        .branch_taken(branch_taken)
    );

    initial begin
        $display("BRANCH HANDLING UNIT SIMULATION");
        $display("--------------------------------");

        // Test 1: Branch taken
        pc = 32'd100;
        immediate = 32'd4;
        branch = 1;
        zero = 1;
        #10;
        $display("Branch Taken: Target=%0d NextPC=%0d Taken=%b",
                 branch_target, next_pc, branch_taken);

        // Test 2: Branch not taken
        pc = 32'd100;
        immediate = 32'd4;
        branch = 1;
        zero = 0;
        #10;
        $display("Branch Not Taken: Target=%0d NextPC=%0d Taken=%b",
                 branch_target, next_pc, branch_taken);

        // Test 3: Branch control disabled
        pc = 32'd200;
        immediate = 32'd8;
        branch = 0;
        zero = 1;
        #10;
        $display("Branch Disabled: Target=%0d NextPC=%0d Taken=%b",
                 branch_target, next_pc, branch_taken);

        // Test 4: Negative branch offset
        pc = 32'd200;
        immediate = -32'sd2;
        branch = 1;
        zero = 1;
        #10;
        $display("Negative Offset: Target=%0d NextPC=%0d Taken=%b",
                 branch_target, next_pc, branch_taken);

        $display("--------------------------------");
        $display("BRANCH HANDLING TEST COMPLETED");

        $finish;
    end

endmodule
