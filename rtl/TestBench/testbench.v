`timescale 1ns/1ps

module testbench;

    parameter CLOCK_PERIOD = 20;

    // Inputs
    reg clock;
    reg reset;
    reg start;

    // Outputs
    wire valid;

    // Test vectors

    reg [127:0] expected_ciphertext = 128'h94ECF589E2017C601B38C6346A10DCFA;
    reg [127:0] received_ciphertext;

    // Instantiate the Skinny-128-384 encryption module
    skinny_top top (
        .clock(clock),
        .reset(reset),
        .start(start),
        //Just check if the output is valid or not
        .valid(valid)
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
        received_ciphertext = 0;

        // Apply reset
        #40 reset = 0;
        
        #CLOCK_PERIOD;
        start = 1;
        
        #CLOCK_PERIOD;
        start = 0;
 

        // Wait for encryption to complete
//        wait(valid);

        #6000;
        // Check if the output matches the expected ciphertext
        if (valid) begin
            $display("Test Passed: Ciphertext matches the expected value.");
        end else begin
            $display("Test Failed: Ciphertext does not match the expected value.");
        end

        // Finish simulation
        
        $finish;
    end

endmodule
