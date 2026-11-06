
`timescale 1ns/1ps

module register_file_tb;

    reg clk;
    reg reset;

    reg [4:0] read_reg1;
    reg [4:0] read_reg2;

    reg [4:0] write_reg;
    reg [31:0] write_data;
    reg reg_write;

    wire [31:0] read_data1;
    wire [31:0] read_data2;

    register_file uut (
        .clk(clk),
        .reset(reset),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .reg_write(reg_write),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;

        read_reg1 = 0;
        read_reg2 = 0;

        write_reg = 0;
        write_data = 0;
        reg_write = 0;

        #12;
        reset = 0;

        // Write 10 into R1
        @(negedge clk);
        write_reg = 1;
        write_data = 10;
        reg_write = 1;

        @(posedge clk);
        #1;

        // Write 20 into R2
        @(negedge clk);
        write_reg = 2;
        write_data = 20;

        @(posedge clk);
        #1;

        reg_write = 0;

        // Read R1 and R2
        read_reg1 = 1;
        read_reg2 = 2;

        #2;

        $display("R1 = %0d", read_data1);
        $display("R2 = %0d", read_data2);

        // Try writing into R0
        @(negedge clk);
        write_reg = 0;
        write_data = 99;
        reg_write = 1;

        @(posedge clk);
        #1;

        reg_write = 0;
        read_reg1 = 0;

        #2;

        $display("R0 = %0d", read_data1);

        $display("------------------------------");
        $display("REGISTER FILE TEST COMPLETED");
        $display("------------------------------");

        $finish;

    end

endmodule
