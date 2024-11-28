// Top-level module for Skinny-128-384 encryption
module skinny128_384_encrypt (
    input               clock,
    input               reset,
    input               load,
    input               start,
    input      [7:0]  plaintext,       // 128-bit plaintext
    input      [7:0]  tweakey,         // 384-bit tweakey

    output reg [7:0]  ciphertext,      // 128-bit ciphertext
    output reg          valid 
);
    parameter [2:0]
        IDLE        = 3'b000,
        LOAD        = 3'b001,
        ENCRYPTION  = 3'b010,
        DONE        = 3'b011,
        TEMPSTATE1  = 3'b100,
        TEMPSTATE2  = 3'b101,
        TEMPSTATE3  = 3'b110,
        TEMPSTATE4  = 3'b111;


    // Internal signals for state and round key
    reg [2:0] nextState, state;
    reg isLoadDone, isEncDone;

    reg [1023:0] reg_plaintext;
    reg [1023:0] reg_ciphertext;
    reg [3071:0] reg_tweakey;
    
    reg [7:0] byte_counter;
    reg [8:0] round_counter;
    reg [127:0] reg_temp_state;
    reg [127:0] round_input;
    
    reg [383:0] key_schedule;


    // Round counter
    parameter round = 56;  // 56 rounds for Skinny-128-384
    // reg roundNumber;

    // Round constants for Skinny
    wire [5:0] RC [0:55];
    assign RC[0]  = 6'h01; assign RC[1]  = 6'h03;
    assign RC[2]  = 6'h07; assign RC[3]  = 6'h0F;
    assign RC[4]  = 6'h1F; assign RC[5]  = 6'h3E;
    assign RC[6]  = 6'h3D; assign RC[7]  = 6'h3B;
    assign RC[8]  = 6'h37; assign RC[9]  = 6'h2F;
    assign RC[10] = 6'h1E; assign RC[11] = 6'h3C;
    assign RC[12] = 6'h39; assign RC[13] = 6'h33;
    assign RC[14] = 6'h27; assign RC[15] = 6'h0E;
    assign RC[16] = 6'h1D; assign RC[17] = 6'h3A;
    assign RC[18] = 6'h35; assign RC[19] = 6'h2B;
    assign RC[20] = 6'h16; assign RC[21] = 6'h2C;
    assign RC[22] = 6'h18; assign RC[23] = 6'h31;
    assign RC[24] = 6'h23; assign RC[25] = 6'h06;
    assign RC[26] = 6'h0D; assign RC[27] = 6'h1B;
    assign RC[28] = 6'h36; assign RC[29] = 6'h2D;
    assign RC[30] = 6'h1A; assign RC[31] = 6'h34;
    assign RC[32] = 6'h29; assign RC[33] = 6'h12;
    assign RC[34] = 6'h24; assign RC[35] = 6'h08;
    assign RC[36] = 6'h11; assign RC[37] = 6'h22;
    assign RC[38] = 6'h04; assign RC[39] = 6'h09;
    assign RC[40] = 6'h13; assign RC[41] = 6'h26;
    assign RC[42] = 6'h0C; assign RC[43] = 6'h19;
    assign RC[44] = 6'h32; assign RC[45] = 6'h25;
    assign RC[46] = 6'h0A; assign RC[47] = 6'h15;
    assign RC[48] = 6'h2A; assign RC[49] = 6'h14;
    assign RC[50] = 6'h28; assign RC[51] = 6'h10;
    assign RC[52] = 6'h21; assign RC[53] = 6'h02;
    assign RC[54] = 6'h05; assign RC[55] = 6'h0B;

    /////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
    // Make an FSM and Data Path for the data 
    //FSM
    // always @(posedge clock or posedge reset) begin
    //         if (reset) begin
    //             state <= IDLE;
    //             valid <= 0;
    //         end else begin
    //             case (state)
    //                 IDLE: begin
    //                     if (start) state <= LOAD;
    //                 end
    //                 LOAD: begin
    //                     if (byte_counter < 15) begin
    //                         reg_tweakey[byte_counter*8 +: 8] <= tweakey;
    //                         reg_temp_state[byte_counter*8 +: 8] <= plaintext;
    //                         byte_counter <= byte_counter + 1;
    //                     end else begin
    //                         state <= ENCRYPTION;
    //                         byte_counter <= 0;
    //                     end
    //                 end
    //                 ENCRYPTION: begin
    //                     if (round_counter >= 56) state <= DONE;
    //                 end
    //                 DONE: begin
    //                     valid <= 1;
    //                     if (!start) state <= IDLE;
    //                 end
    //             endcase
    //         end
    // end

    always @(*) begin
        if(reset)begin
            state <= IDLE;
            // control signals
            valid <= 1'b1;
            isLoadDone <= 1'b0;
            isEncDone <= 1'b0;
          
        end
        else begin
            case (state)
                    IDLE: begin
                        if (start) state <= LOAD;
                    end
                    LOAD: begin 
                    // hardcoding the values until the functionality is sorted out
                        if(isLoadDone)
                            // state <= ENCRYPTION;
                            state <= TEMPSTATE1;
                        else 
                            state <= LOAD;
                    end
                    ENCRYPTION: begin
                        if (isEncDone) 
                            state <= DONE;
                        else 
                            state <= ENCRYPTION;
                    end
                    DONE: begin
                        valid <= 1'b1;
                        state <= IDLE;
                    end
                    TEMPSTATE1: begin
                        valid <= 1'b1;
                        state <= ENCRYPTION;
                    end
                endcase
        end
    end

     // Datapath always block
    always @(state or posedge reset) begin
        if (reset) begin
            // initializing registers to 0s
            reg_plaintext <= 'b0;
            reg_ciphertext <= 'b0;
            reg_tweakey <= 'b0;
            round_input <= 'b0; 
            // counters
            byte_counter <= 'b0;
            round_counter <= 'b0;
            
        end
        else begin
             case (state)
                    IDLE: begin
                        reg_plaintext <= 'b0;
                        reg_ciphertext <= 'b0;
                        reg_tweakey <= 'b0;

                        round_input <= 'b0; 
                        // counters
                        byte_counter <= 'b0;
                        round_counter <= 'b0;
                    end
                    LOAD: begin 
                        reg_plaintext <= 128'hA3994B66AD85A3459F44E92B08F550CB;
                        reg_tweakey <= 384'hDF889548CFC7EA52D296339301797449AB588A34A47F1AB2DFE9C8293FBEA9A5AB1AFAC2611012CD8CEF952618C3EBE8;
                        isLoadDone <=1'b1;
                    end
                    ENCRYPTION: begin // Need to do the round input logic here
                    
                         if (round_counter < 56) begin
                         if(round_counter == 1'b0)
                            reg_temp_state <= add_round_key();
                            reg_temp_state <= mix_columns(shift_rows(sub_cells(add_round_key(round_input, reg_tweakey, RC[round_counter]))));
                            reg_tweakey <= key_update(reg_tweakey);
                            round_counter <= round_counter + 1;
                        end else begin
                            ciphertext <= reg_temp_state; 
                        end

                    end
                    DONE: begin
                        valid <= 1'b1;
                        
                    end
                    TEMPSTATE1: begin
                        round_input <= reg_plaintext;
                        
                    end
                endcase

        end 

    end
    // // Datapath always block
    // always @(posedge clock or posedge reset) begin
    //     if (reset) begin
    //         reg_temp_state <= 128'b0;
    //         reg_tweakey <= 384'b0;
    //         ciphertext <= 8'b0;
    //         byte_counter <= 0;
    //         round_counter <= 0;
    //     end else if (state == ENCRYPTION) begin
    //         if (round_counter < 56) begin
    //             reg_temp_state <= mix_columns(shift_rows(sub_cells(add_round_key(round_input, reg_tweakey, RC[round_counter]))));
    //             reg_tweakey <= key_update(reg_tweakey);
    //             round_counter <= round_counter + 1;
    //         end else begin
    //             ciphertext <= reg_temp_state[127:120]; // Output one byte at a time
    //         end
    //     end
    // end



/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

//      Functions logic for rounds here

/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

        // AddRoundKey function
    function [127:0] add_round_key(
        input [127:0] in_state  = 'b0,
        input [383:0] in_key = 'b0,
        input [5:0] round_constant = 'b0
    );
        // Define AddRoundKey logic here
        integer i;
        reg [127:0] round_key;
        
        begin
            // Select the appropriate 128-bit round key portion from the 384-bit key
            round_key = in_key[127:0];  // Example for round key selection
    
            // XOR state with round key and round constant
            add_round_key = in_state ^ round_key ^ {122'b0, round_constant};
        end
    endfunction

/////////////////////////////////////////////////////////////////////////

    // SubCells (S-box) function
    function [127:0] sub_cells(input [127:0] in_state);
        automatic reg [127:0] out_state;
        integer i;
    
        // S-box transformation (replace with Skinny-specific S-box values)
        reg [3:0] sbox [15:0];
        
        begin
            sbox[0] = 4'hC; sbox[1] = 4'h6; sbox[2] = 4'h9; sbox[3] = 4'h0;
            sbox[4] = 4'hA; sbox[5] = 4'hD; sbox[6] = 4'h3; sbox[7] = 4'hE;
            sbox[8] = 4'hB; sbox[9] = 4'h5; sbox[10] = 4'h1; sbox[11] = 4'h8;
            sbox[12] = 4'hF; sbox[13] = 4'h4; sbox[14] = 4'h7; sbox[15] = 4'h2;
        
        
            // Apply S-box substitution to each 4-bit nibble in the state
            for (i = 0; i < 32; i = i + 1) begin
                    out_state[i*4 +: 4] = sbox[in_state[i*4 +: 4]];
                end
            sub_cells = out_state;
        end
    endfunction

/////////////////////////////////////////////////////////////////////////

    // ShiftRows function
    function [127:0] shift_rows(input [127:0] in_state);
        // Define ShiftRows logic here
        automatic reg [127:0] out_state;

        begin
            out_state[127:120] = in_state[127:120];     // Row 0: No shift
            out_state[95:88]   = in_state[103:96];      // Row 1: Left shift by 1
            out_state[63:56]   = in_state[71:64];       // Row 2: Left shift by 2
            out_state[31:24]   = in_state[39:32];       // Row 3: Left shift by 3
            shift_rows = out_state;
        end
    endfunction

/////////////////////////////////////////////////////////////////////////

    // MixColumns function
    function [127:0] mix_columns(input [127:0] in_state);
        // Define MixColumns logic here
        logic [127:0] out_state;

        begin
            // Define MixColumns logic according to Skinny's mix layer
            // This is a simplified XOR-based operation example
            out_state[127:96] = in_state[127:96] ^ in_state[95:64];
            out_state[95:64]  = in_state[95:64] ^ in_state[63:32];
            out_state[63:32]  = in_state[63:32] ^ in_state[31:0];
            out_state[31:0]   = in_state[31:0] ^ in_state[127:96];
            
            mix_columns = out_state;
        end
    endfunction

/////////////////////////////////////////////////////////////////////////

    // Key Update function for tweakey scheduling
    function [383:0] key_update(input [383:0] in_key);
        // Define key schedule update logic here
        automatic reg [383:0] out_key;

        begin
            // Rotate and permute key parts for Skinny key schedule
            out_key = {in_key[367:0], in_key[383:368]};  // Rotate left by 16 bits
            key_update = out_key;
        end
    endfunction
    



endmodule

