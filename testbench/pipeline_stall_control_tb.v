
`timescale 1ns/1ps

module pipeline_stall_control_tb;

    reg stall;

    wire pc_enable;
    wire if_id_enable;
    wire id_ex_flush;

    pipeline_stall_control uut (
        .stall(stall),
        .pc_enable(pc_enable),
        .if_id_enable(if_id_enable),
        .id_ex_flush(id_ex_flush)
    );

    initial begin
        $display("PIPELINE STALL CONTROL SIMULATION");
        $display("--------------------------------");

        // Test 1: Normal operation
        stall = 0;
        #10;
        $display("Normal: PCEnable=%b IFIDEnable=%b IDEXFlush=%b",
                 pc_enable, if_id_enable, id_ex_flush);

        // Test 2: Stall activated
        stall = 1;
        #10;
        $display("Stall: PCEnable=%b IFIDEnable=%b IDEXFlush=%b",
                 pc_enable, if_id_enable, id_ex_flush);

        // Test 3: Stall released
        stall = 0;
        #10;
        $display("Released: PCEnable=%b IFIDEnable=%b IDEXFlush=%b",
                 pc_enable, if_id_enable, id_ex_flush);

        // Test 4: Stall activated again
        stall = 1;
        #10;
        $display("Stall Again: PCEnable=%b IFIDEnable=%b IDEXFlush=%b",
                 pc_enable, if_id_enable, id_ex_flush);

        $display("--------------------------------");
        $display("PIPELINE STALL CONTROL TEST COMPLETED");

        $finish;
    end

endmodule
