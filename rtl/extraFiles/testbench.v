`timescale 1ns/1ps

module skinny128_384_encrypt_tb;

    parameter CLOCK_PERIOD = 20;

    // Inputs
    reg clock;
    reg reset;
    reg load;
    reg start;
    reg [7:0] plaintext;
    reg [7:0] tweakey;

    // Outputs
    wire [7:0] ciphertext;
    wire valid;

    // Test vectors
    reg [127:0] full_plaintext = 128'hA3994B66AD85A3459F44E92B08F550CB;
    reg [383:0] full_tweakey = 384'hDF889548CFC7EA52D296339301797449AB588A34A47F1AB2DFE9C8293FBEA9A5AB1AFAC2611012CD8CEF952618C3EBE8;
    reg [127:0] expected_ciphertext = 128'h94ECF589E2017C601B38C6346A10DCFA;
    reg [127:0] received_ciphertext;

    // Instantiate the Skinny-128-384 encryption module
    skinny128_384_encrypt uut (
        .clock(clock),
        .reset(reset),
        .load(load),
        .start(start),
        .plaintext(plaintext),
        .tweakey(tweakey),
        .ciphertext(ciphertext),
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
        load = 0;
        start = 0;
        plaintext = 0;
        tweakey = 0;
        received_ciphertext = 0;

        // Apply reset
        #40 reset = 0;

        // Load plaintext byte by byte
//        load = 1;
//        #10;
//        for (integer i = 0; i < 16; i = i + 1) begin
//            plaintext = full_plaintext[127:120];
//            full_plaintext = full_plaintext << 8;
//            #CLOCK_PERIOD;
//        end

//        // Load tweakey byte by byte
//        for (integer i = 0; i < 48; i = i + 1) begin
//            tweakey = full_tweakey[383:376];
//            full_tweakey = full_tweakey << 8;
//            #CLOCK_PERIOD;
//        end
//        load = 0;

        // Start encryption
//        start = 1;
        #CLOCK_PERIOD;
//        start = 0;

        // Wait for encryption to complete
        wait(valid);

//         Collect output ciphertext byte by byte
        for (integer i = 0; i < 16; i = i + 1) begin
            received_ciphertext = {received_ciphertext[119:0], ciphertext};
            #CLOCK_PERIOD;
        end

        // Check if the output matches the expected ciphertext
        if (received_ciphertext == expected_ciphertext) begin
            $display("Test Passed: Ciphertext matches the expected value.");
        end else begin
            $display("Test Failed: Ciphertext does not match the expected value.");
            $display("Expected: %h", expected_ciphertext);
            $display("Received: %h", received_ciphertext);
        end

        // Finish simulation
        $finish;
    end

endmodule
