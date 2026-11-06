
`timescale 1ns/1ps

module pipeline_flush_unit_tb;

    reg branch_taken;
    reg jump;

    wire if_id_flush;
    wire id_ex_flush;

    pipeline_flush_unit uut (
        .branch_taken(branch_taken),
        .jump(jump),
        .if_id_flush(if_id_flush),
        .id_ex_flush(id_ex_flush)
    );

    initial begin
        $display("PIPELINE FLUSH UNIT SIMULATION");
        $display("--------------------------------");

        // Test 1: Normal operation
        branch_taken = 0;
        jump = 0;
        #10;
        $display("Normal: IFIDFlush=%b IDEXFlush=%b",
                 if_id_flush, id_ex_flush);

        // Test 2: Branch taken
        branch_taken = 1;
        jump = 0;
        #10;
        $display("Branch Taken: IFIDFlush=%b IDEXFlush=%b",
                 if_id_flush, id_ex_flush);

        // Test 3: Jump instruction
        branch_taken = 0;
        jump = 1;
        #10;
        $display("Jump: IFIDFlush=%b IDEXFlush=%b",
                 if_id_flush, id_ex_flush);

        // Test 4: Branch and jump signals together
        branch_taken = 1;
        jump = 1;
        #10;
        $display("Both Signals: IFIDFlush=%b IDEXFlush=%b",
                 if_id_flush, id_ex_flush);

        $display("--------------------------------");
        $display("PIPELINE FLUSH TEST COMPLETED");

        $finish;
    end

endmodule
