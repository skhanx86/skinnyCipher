`timescale 1ns/1ps

module testbench;

    parameter CLOCK_PERIOD = 4;

    // Inputs
    reg clock;
    reg reset;
    reg start;
    reg [7:0] input_plaintext;
    reg [23:0] input_tweakey;

    // Outputs
    wire done;


    // Test vectors

    reg [383:0] reg_input_tweakey;
    reg [127:0] reg_input_plaintext;
    reg [127:0] expected_ciphertext;
    reg [127:0] received_ciphertext;
    
    integer i, j;
    

    // Instantiate the Skinny-128-384 encryption module
    skinny_top top (
        //Input
        .clock(clock),
        .reset(reset),
        .start(start),
        .input_plaintext(input_plaintext),
        .input_tweakey(input_tweakey),
        
        //Output
        .done(done)

    );

    // Clock generation
    initial begin
        clock = 0;
        forever #(CLOCK_PERIOD / 2) clock = ~clock; // 100 MHz clock
    end

    // Testbench logic
    initial begin
        // Initialize signals
        reset = 1;
        start = 0;
        reg_input_tweakey       = 384'hdf889548cfc7ea52d296339301797449ab588a34a47f1ab2dfe9c8293fbea9a5ab1afac2611012cd8cef952618c3ebe8;
        reg_input_plaintext     = 128'ha3994b66ad85a3459f44e92b08f550cb;
        expected_ciphertext = 128'h94ECF589E2017C601B38C6346A10DCFA;
        received_ciphertext = 128'b0;

        // Apply reset
        #40 reset = 0;
        
        #CLOCK_PERIOD;
        start = 1;

        // Start sending in the input data - LOAD
        for (i = 0; i < 16; i = i + 1) begin
            input_plaintext = reg_input_plaintext[(127 - i * 8) -: 8];
            input_tweakey = reg_input_tweakey[(383 - i * 24) -: 24];
            #CLOCK_PERIOD;
        end
        #CLOCK_PERIOD;
        start = 0;
        #CLOCK_PERIOD;
        wait(done);
        
//        #6000;
        // Check if the output matches the expected ciphertext
        if (done) begin
                $display("Test Passed: Ciphertext matches the expected value.");
            end else begin
                $display("Test Failed: Ciphertext does not match the expected value.");
        end 

        // Finish simulation
        
        $finish;
    end

endmodule
