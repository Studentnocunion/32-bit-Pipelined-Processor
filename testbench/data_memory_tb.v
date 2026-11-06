
`timescale 1ns/1ps

module data_memory_tb;

    reg clk;
    reg reset;
    reg mem_read;
    reg mem_write;
    reg [31:0] address;
    reg [31:0] write_data;

    wire [31:0] read_data;

    data_memory uut (
        .clk(clk),
        .reset(reset),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        mem_read = 0;
        mem_write = 0;
        address = 0;
        write_data = 0;

        $display("DATA MEMORY SIMULATION");
        $display("--------------------------------");

        // Reset memory
        #10;
        reset = 0;

        // Test 1: Write data at address 0
        address = 0;
        write_data = 32'd100;
        mem_write = 1;
        #10;
        mem_write = 0;

        // Test 2: Read data from address 0
        mem_read = 1;
        #1;
        $display("Memory[0] = %0d", read_data);

        // Test 3: Write data at address 4
        mem_read = 0;
        address = 4;
        write_data = 32'h12345678;
        mem_write = 1;
        #10;
        mem_write = 0;

        // Test 4: Read data from address 4
        mem_read = 1;
        #1;
        $display("Memory[4] = %h", read_data);

        // Test 5: Read disabled
        mem_read = 0;
        #1;
        $display("Read Disabled = %h", read_data);

        $display("--------------------------------");
        $display("DATA MEMORY TEST COMPLETED");

        $finish;
    end

endmodule
