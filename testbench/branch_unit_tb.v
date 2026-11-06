
`timescale 1ns/1ps

module branch_unit_tb;

    reg [31:0] A;
    reg [31:0] B;
    reg branch;

    wire equal;
    wire take_branch;

    branch_unit uut (
        .A(A),
        .B(B),
        .branch(branch),
        .equal(equal),
        .take_branch(take_branch)
    );

    initial begin
        $display("BRANCH UNIT SIMULATION");
        $display("--------------------------------");

        // Test 1: Equal values, branch enabled
        A = 32'd10;
        B = 32'd10;
        branch = 1'b1;
        #10;
        $display("Test 1: Equal=%b | Take Branch=%b",
                 equal, take_branch);

        // Test 2: Different values, branch enabled
        A = 32'd10;
        B = 32'd20;
        branch = 1'b1;
        #10;
        $display("Test 2: Equal=%b | Take Branch=%b",
                 equal, take_branch);

        // Test 3: Equal values, branch disabled
        A = 32'd15;
        B = 32'd15;
        branch = 1'b0;
        #10;
        $display("Test 3: Equal=%b | Take Branch=%b",
                 equal, take_branch);

        // Test 4: Different values, branch disabled
        A = 32'd5;
        B = 32'd8;
        branch = 1'b0;
        #10;
        $display("Test 4: Equal=%b | Take Branch=%b",
                 equal, take_branch);

        $display("--------------------------------");
        $display("BRANCH UNIT TEST COMPLETED");

        $finish;
    end

endmodule
