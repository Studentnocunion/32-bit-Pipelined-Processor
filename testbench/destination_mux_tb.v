
`timescale 1ns/1ps

module destination_mux_tb;

    reg [4:0] rt;
    reg [4:0] rd;
    reg reg_dst;

    wire [4:0] destination;

    destination_mux uut (
        .rt(rt),
        .rd(rd),
        .reg_dst(reg_dst),
        .destination(destination)
    );

    initial begin
        $display("DESTINATION MUX SIMULATION");
        $display("--------------------------------");

        // Test 1: Select rt
        rt = 5'd5;
        rd = 5'd10;
        reg_dst = 0;
        #10;

        $display("RT Selection: Destination=R%0d",
                 destination);

        // Test 2: Select rd
        reg_dst = 1;
        #10;

        $display("RD Selection: Destination=R%0d",
                 destination);

        // Test 3: Change register values and select rt
        rt = 5'd12;
        rd = 5'd20;
        reg_dst = 0;
        #10;

        $display("RT Selection 2: Destination=R%0d",
                 destination);

        // Test 4: Select rd again
        reg_dst = 1;
        #10;

        $display("RD Selection 2: Destination=R%0d",
                 destination);

        $display("--------------------------------");
        $display("DESTINATION MUX TEST COMPLETED");

        $finish;
    end

endmodule
