`timescale 1ns/1ps

module processor_tb;

    reg clk;
    reg reset;
    reg enable;

    processor DUT (
        .clk(clk),
        .reset(reset),
        .enable(enable)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        $display("======================================");
        $display("BRANCH VS JUMP PRIORITY TEST");
        $display("======================================");

        reset = 1;
        enable = 1;

        #1;

        // Instruction 0: ADDI R1, R0, 10
        DUT.IMEM.mem[0] = {6'b001000, 5'd0, 5'd1, 16'd10};

        // Instruction 1: ADDI R2, R0, 10
        DUT.IMEM.mem[1] = {6'b001000, 5'd0, 5'd2, 16'd10};

        // Instruction 2: BEQ R1, R2, 2
        // Branch target = instruction index 5
        DUT.IMEM.mem[2] = {6'b001011, 5'd1, 5'd2, 16'd2};

        // Instruction 3: J to instruction index 8
        // This jump must lose to the older branch
        DUT.IMEM.mem[3] = {6'b001100, 26'd8};

        // Instruction 4: Wrong-path instruction
        DUT.IMEM.mem[4] = {6'b001000, 5'd0, 5'd4, 16'd44};

        // Instruction 5: BEQ branch target
        DUT.IMEM.mem[5] = {6'b001000, 5'd0, 5'd5, 16'd55};
// Instruction 6: Jump to itself (infinite loop)
// Prevents sequential execution from reaching instruction 8
DUT.IMEM.mem[6] = {6'b001100, 26'd6};
        // Instruction 8: JUMP target
        // This must not execute
        DUT.IMEM.mem[8] = {6'b001000, 5'd0, 5'd8, 16'd88};

        #19;
        reset = 0;

        #300;

        $display("");
        $display("========== REGISTER RESULTS ==========");

        $display("R1 = %0d", DUT.RF.registers[1]);
        $display("R2 = %0d", DUT.RF.registers[2]);
        $display("R4 = %0d", DUT.RF.registers[4]);
        $display("R5 = %0d", DUT.RF.registers[5]);
        $display("R8 = %0d", DUT.RF.registers[8]);

        $display("");
        $display("========== VERIFICATION ==============");

        if (DUT.RF.registers[1] == 10 &&
            DUT.RF.registers[2] == 10 &&
            DUT.RF.registers[4] == 0 &&
            DUT.RF.registers[5] == 55 &&
            DUT.RF.registers[8] == 0)

            $display("BRANCH VS JUMP PRIORITY TEST PASSED");

        else
            $display("BRANCH VS JUMP PRIORITY TEST FAILED");

        $display("======================================");

        $finish;

    end

endmodule