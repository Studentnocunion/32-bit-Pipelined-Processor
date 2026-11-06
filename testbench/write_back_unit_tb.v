
`timescale 1ns/1ps

module write_back_unit_tb;

    reg [31:0] alu_result;
    reg [31:0] memory_data;
    reg mem_to_reg;

    wire [31:0] write_back_data;

    write_back_unit uut (
        .alu_result(alu_result),
        .memory_data(memory_data),
        .mem_to_reg(mem_to_reg),
        .write_back_data(write_back_data)
    );

    initial begin
        $display("WRITE-BACK UNIT SIMULATION");
        $display("--------------------------------");

        // Test 1: Select ALU result
        alu_result = 32'd100;
        memory_data = 32'd500;
        mem_to_reg = 0;
        #10;

        $display("ALU Selection: WriteBack=%0d",
                 write_back_data);

        // Test 2: Select memory data
        mem_to_reg = 1;
        #10;

        $display("Memory Selection: WriteBack=%0d",
                 write_back_data);

        // Test 3: Select another ALU result
        alu_result = 32'd250;
        mem_to_reg = 0;
        #10;

        $display("ALU Selection 2: WriteBack=%0d",
                 write_back_data);

        // Test 4: Select another memory value
        memory_data = 32'd750;
        mem_to_reg = 1;
        #10;

        $display("Memory Selection 2: WriteBack=%0d",
                 write_back_data);

        $display("--------------------------------");
        $display("WRITE-BACK UNIT TEST COMPLETED");

        $finish;
    end

endmodule
