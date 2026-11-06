
`timescale 1ns/1ps

module if_id_register_tb;

    reg clk;
    reg reset;
    reg enable;
    reg [31:0] pc_in;
    reg [31:0] instruction_in;

    wire [31:0] pc_out;
    wire [31:0] instruction_out;

    if_id_register uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pc_in(pc_in),
        .instruction_in(instruction_in),
        .pc_out(pc_out),
        .instruction_out(instruction_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        enable = 0;
        pc_in = 0;
        instruction_in = 0;

        $display("IF/ID PIPELINE REGISTER SIMULATION");
        $display("--------------------------------");

        // Test 1: Reset
        #10;
        reset = 0;
        #1;
        $display("Reset: PC=%0d | Instruction=%h",
                 pc_out, instruction_out);

        // Test 2: Load pipeline register
        pc_in = 32'd4;
        instruction_in = 32'h12345678;
        enable = 1;
        #9;
        $display("Load: PC=%0d | Instruction=%h",
                 pc_out, instruction_out);

        // Test 3: Disable register and change inputs
        enable = 0;
        pc_in = 32'd8;
        instruction_in = 32'hABCDEF01;
        #10;
        $display("Hold: PC=%0d | Instruction=%h",
                 pc_out, instruction_out);

        // Test 4: Load new values
        enable = 1;
        #10;
        $display("Update: PC=%0d | Instruction=%h",
                 pc_out, instruction_out);

        $display("--------------------------------");
        $display("IF/ID REGISTER TEST COMPLETED");

        $finish;
    end

endmodule
