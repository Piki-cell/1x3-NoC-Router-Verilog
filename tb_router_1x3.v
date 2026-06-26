//==============================================================
// Testbench for 1x3 Router Module
//==============================================================

`timescale 1ns/1ps

module tb_router_1x3;

    // Inputs
    reg clk;
    reg reset;
    reg valid_in;
    reg [1:0] sel;
    reg [7:0] data_in;

    // Outputs
    wire [7:0] data_out0;
    wire [7:0] data_out1;
    wire [7:0] data_out2;

    wire valid_out0;
    wire valid_out1;
    wire valid_out2;


    //==========================================================
    // Instantiate DUT
    //==========================================================

    router_1x3 uut (

        .clk(clk),
        .reset(reset),
        .valid_in(valid_in),

        .sel(sel),
        .data_in(data_in),

        .data_out0(data_out0),
        .data_out1(data_out1),
        .data_out2(data_out2),

        .valid_out0(valid_out0),
        .valid_out1(valid_out1),
        .valid_out2(valid_out2)

    );


    //==========================================================
    // Clock Generation (10ns period)
    //==========================================================

    always #5 clk = ~clk;


    //==========================================================
    // Test Sequence
    //==========================================================

    initial
    begin

        clk = 0;
        reset = 1;

        valid_in = 0;
        sel = 2'b00;
        data_in = 8'd0;

        $display("========================================");
        $display("      1x3 NoC Router Testbench");
        $display("========================================");

        $monitor("Time=%0t | Sel=%b | Data=%h | O0=%h V0=%b | O1=%h V1=%b | O2=%h V2=%b",

        $time,

        sel,

        data_in,

        data_out0,
        valid_out0,

        data_out1,
        valid_out1,

        data_out2,
        valid_out2

        );

        //------------------------------------------------------
        // Release Reset
        //------------------------------------------------------

        #20;
        reset = 0;

        //------------------------------------------------------
        // TEST 1
        //------------------------------------------------------

        @(posedge clk);

        valid_in = 1;
        sel = 2'b00;
        data_in = 8'hA1;

        @(posedge clk);

        valid_in = 0;

        repeat(3)
        @(posedge clk);


        //------------------------------------------------------
        // TEST 2
        //------------------------------------------------------

        @(posedge clk);

        valid_in = 1;
        sel = 2'b01;
        data_in = 8'hB2;

        @(posedge clk);

        valid_in = 0;

        repeat(3)
        @(posedge clk);


        //------------------------------------------------------
        // TEST 3
        //------------------------------------------------------

        @(posedge clk);

        valid_in = 1;
        sel = 2'b10;
        data_in = 8'hC3;

        @(posedge clk);

        valid_in = 0;

        repeat(3)
        @(posedge clk);


        //------------------------------------------------------
        // TEST 4
        //------------------------------------------------------

        @(posedge clk);

        valid_in = 1;
        sel = 2'b00;
        data_in = 8'h55;

        @(posedge clk);

        valid_in = 0;

        repeat(2)
        @(posedge clk);


        //------------------------------------------------------
        // TEST 5
        //------------------------------------------------------

        @(posedge clk);

        valid_in = 1;
        sel = 2'b01;
        data_in = 8'hAA;

        @(posedge clk);

        valid_in = 0;

        repeat(2)
        @(posedge clk);


        //------------------------------------------------------

        #20;

        $display("========================================");
        $display("Simulation Completed Successfully");
        $display("========================================");

        $finish;

    end

endmodule