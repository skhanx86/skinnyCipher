// Top-level module for Skinny-128-384 encryption
module skinny_top (
    input               clock,
    input               reset,
    input               start, 
    output reg          valid 
);
    parameter [2:0]
        IDLE        = 3'b000,
        LOAD        = 3'b001,
        DONE        = 3'b010,
        SUB_CELLS   = 3'b011,
        ADD_CONST   = 3'b100, // ADD CONST
        ADD_ROUND   = 3'b101, // ADD KEY
        SHIFT_ROWS  = 3'b110,
        MIX_COLUMNS = 3'b111;
        
    reg [2:0] current_state, next_state;
        
    reg [127:0] reg_plaintext, reg_ciphertext, reg_expected_ciphertext;
    reg [383:0] initial_tweakey;
    reg [127:0] reg_tweakey [2:0];
    reg isLoadDone, isEncDone;
    reg [7:0] round_counter;
    reg [5:0] round_constant; 
    reg [7:0] s_box[0:255];
    
    initial begin 
        s_box[8'h00] = 8'h65; s_box[8'h01] = 8'h4c; s_box[8'h02] = 8'h6a; s_box[8'h03] = 8'h42;
        s_box[8'h04] = 8'h4b; s_box[8'h05] = 8'h63; s_box[8'h06] = 8'h43; s_box[8'h07] = 8'h6b; 
        s_box[8'h08] = 8'h55; s_box[8'h09] = 8'h75; s_box[8'h0a] = 8'h5a; s_box[8'h0b] = 8'h7a; 
        s_box[8'h0c] = 8'h53; s_box[8'h0d] = 8'h73; s_box[8'h0e] = 8'h5b; s_box[8'h0f] = 8'h7b;
        s_box[8'h10] = 8'h35; s_box[8'h11] = 8'h8c; s_box[8'h12] = 8'h3a; s_box[8'h13] = 8'h81;
        s_box[8'h14] = 8'h89; s_box[8'h15] = 8'h33; s_box[8'h16] = 8'h80; s_box[8'h17] = 8'h3b; 
        s_box[8'h18] = 8'h95; s_box[8'h19] = 8'h25; s_box[8'h1a] = 8'h98; s_box[8'h1b] = 8'h2a; 
        s_box[8'h1c] = 8'h90; s_box[8'h1d] = 8'h23; s_box[8'h1e] = 8'h99; s_box[8'h1f] = 8'h2b;
        s_box[8'h20] = 8'he5; s_box[8'h21] = 8'hcc; s_box[8'h22] = 8'he8; s_box[8'h23] = 8'hc1;
        s_box[8'h24] = 8'hc9; s_box[8'h25] = 8'he0; s_box[8'h26] = 8'hc0; s_box[8'h27] = 8'he9; 
        s_box[8'h28] = 8'hd5; s_box[8'h29] = 8'hf5; s_box[8'h2a] = 8'hd8; s_box[8'h2b] = 8'hf8; 
        s_box[8'h2c] = 8'hd0; s_box[8'h2d] = 8'hf0; s_box[8'h2e] = 8'hd9; s_box[8'h2f] = 8'hf9;
        s_box[8'h30] = 8'ha5; s_box[8'h31] = 8'h1c; s_box[8'h32] = 8'ha8; s_box[8'h33] = 8'h12;
        s_box[8'h34] = 8'h1b; s_box[8'h35] = 8'ha0; s_box[8'h36] = 8'h13; s_box[8'h37] = 8'ha9; 
        s_box[8'h38] = 8'h05; s_box[8'h39] = 8'hb5; s_box[8'h3a] = 8'h0a; s_box[8'h3b] = 8'hb8; 
        s_box[8'h3c] = 8'h03; s_box[8'h3d] = 8'hb0; s_box[8'h3e] = 8'h0b; s_box[8'h3f] = 8'hb9;
        s_box[8'h40] = 8'h32; s_box[8'h41] = 8'h88; s_box[8'h42] = 8'h3c; s_box[8'h43] = 8'h85;
        s_box[8'h44] = 8'h8d; s_box[8'h45] = 8'h34; s_box[8'h46] = 8'h84; s_box[8'h47] = 8'h3d; 
        s_box[8'h48] = 8'h91; s_box[8'h49] = 8'h22; s_box[8'h4a] = 8'h9c; s_box[8'h4b] = 8'h2c; 
        s_box[8'h4c] = 8'h94; s_box[8'h4d] = 8'h24; s_box[8'h4e] = 8'h9d; s_box[8'h4f] = 8'h2d;
        s_box[8'h50] = 8'h62; s_box[8'h51] = 8'h4a; s_box[8'h52] = 8'h6c; s_box[8'h53] = 8'h45;
        s_box[8'h54] = 8'h4d; s_box[8'h55] = 8'h64; s_box[8'h56] = 8'h44; s_box[8'h57] = 8'h6d; 
        s_box[8'h58] = 8'h52; s_box[8'h59] = 8'h72; s_box[8'h5a] = 8'h5c; s_box[8'h5b] = 8'h7c; 
        s_box[8'h5c] = 8'h54; s_box[8'h5d] = 8'h74; s_box[8'h5e] = 8'h5d; s_box[8'h5f] = 8'h7d;
        s_box[8'h60] = 8'ha1; s_box[8'h61] = 8'h1a; s_box[8'h62] = 8'hac; s_box[8'h63] = 8'h15;
        s_box[8'h64] = 8'h1d; s_box[8'h65] = 8'ha4; s_box[8'h66] = 8'h14; s_box[8'h67] = 8'had; 
        s_box[8'h68] = 8'h02; s_box[8'h69] = 8'hb1; s_box[8'h6a] = 8'h0c; s_box[8'h6b] = 8'hbc; 
        s_box[8'h6c] = 8'h04; s_box[8'h6d] = 8'hb4; s_box[8'h6e] = 8'h0d; s_box[8'h6f] = 8'hbd;
        s_box[8'h70] = 8'he1; s_box[8'h71] = 8'hc8; s_box[8'h72] = 8'hec; s_box[8'h73] = 8'hc5;
        s_box[8'h74] = 8'hcd; s_box[8'h75] = 8'he4; s_box[8'h76] = 8'hc4; s_box[8'h77] = 8'hed; 
        s_box[8'h78] = 8'hd1; s_box[8'h79] = 8'hf1; s_box[8'h7a] = 8'hdc; s_box[8'h7b] = 8'hfc; 
        s_box[8'h7c] = 8'hd4; s_box[8'h7d] = 8'hf4; s_box[8'h7e] = 8'hdd; s_box[8'h7f] = 8'hfd;
        s_box[8'h80] = 8'h36; s_box[8'h81] = 8'h8e; s_box[8'h82] = 8'h38; s_box[8'h83] = 8'h82;
        s_box[8'h84] = 8'h8b; s_box[8'h85] = 8'h30; s_box[8'h86] = 8'h83; s_box[8'h87] = 8'h39; 
        s_box[8'h88] = 8'h96; s_box[8'h89] = 8'h26; s_box[8'h8a] = 8'h9a; s_box[8'h8b] = 8'h28; 
        s_box[8'h8c] = 8'h93; s_box[8'h8d] = 8'h20; s_box[8'h8e] = 8'h9b; s_box[8'h8f] = 8'h29;
        s_box[8'h90] = 8'h66; s_box[8'h91] = 8'h4e; s_box[8'h92] = 8'h68; s_box[8'h93] = 8'h41;
        s_box[8'h94] = 8'h49; s_box[8'h95] = 8'h60; s_box[8'h96] = 8'h40; s_box[8'h97] = 8'h69; 
        s_box[8'h98] = 8'h56; s_box[8'h99] = 8'h76; s_box[8'h9a] = 8'h58; s_box[8'h9b] = 8'h78; 
        s_box[8'h9c] = 8'h50; s_box[8'h9d] = 8'h70; s_box[8'h9e] = 8'h59; s_box[8'h9f] = 8'h79;
        s_box[8'ha0] = 8'ha6; s_box[8'ha1] = 8'h1e; s_box[8'ha2] = 8'haa; s_box[8'ha3] = 8'h11;
        s_box[8'ha4] = 8'h19; s_box[8'ha5] = 8'ha3; s_box[8'ha6] = 8'h10; s_box[8'ha7] = 8'hab; 
        s_box[8'ha8] = 8'h06; s_box[8'ha9] = 8'hb6; s_box[8'haa] = 8'h08; s_box[8'hab] = 8'hba; 
        s_box[8'hac] = 8'h00; s_box[8'had] = 8'hb3; s_box[8'hae] = 8'h09; s_box[8'haf] = 8'hbb;
        s_box[8'hb0] = 8'he6; s_box[8'hb1] = 8'hce; s_box[8'hb2] = 8'hea; s_box[8'hb3] = 8'hc2;
        s_box[8'hb4] = 8'hcb; s_box[8'hb5] = 8'he3; s_box[8'hb6] = 8'hc3; s_box[8'hb7] = 8'heb; 
        s_box[8'hb8] = 8'hd6; s_box[8'hb9] = 8'hf6; s_box[8'hba] = 8'hda; s_box[8'hbb] = 8'hfa; 
        s_box[8'hbc] = 8'hd3; s_box[8'hbd] = 8'hf3; s_box[8'hbe] = 8'hdb; s_box[8'hbf] = 8'hfb;
        s_box[8'hc0] = 8'h31; s_box[8'hc1] = 8'h8a; s_box[8'hc2] = 8'h3e; s_box[8'hc3] = 8'h86;
        s_box[8'hc4] = 8'h8f; s_box[8'hc5] = 8'h37; s_box[8'hc6] = 8'h87; s_box[8'hc7] = 8'h3f; 
        s_box[8'hc8] = 8'h92; s_box[8'hc9] = 8'h21; s_box[8'hca] = 8'h9e; s_box[8'hcb] = 8'h2e; 
        s_box[8'hcc] = 8'h97; s_box[8'hcd] = 8'h27; s_box[8'hce] = 8'h9f; s_box[8'hcf] = 8'h2f;
        s_box[8'hd0] = 8'h61; s_box[8'hd1] = 8'h48; s_box[8'hd2] = 8'h6e; s_box[8'hd3] = 8'h46;
        s_box[8'hd4] = 8'h4f; s_box[8'hd5] = 8'h67; s_box[8'hd6] = 8'h47; s_box[8'hd7] = 8'h6f; 
        s_box[8'hd8] = 8'h51; s_box[8'hd9] = 8'h71; s_box[8'hda] = 8'h5e; s_box[8'hdb] = 8'h7e; 
        s_box[8'hdc] = 8'h57; s_box[8'hdd] = 8'h77; s_box[8'hde] = 8'h5f; s_box[8'hdf] = 8'h7f;
        s_box[8'he0] = 8'ha2; s_box[8'he1] = 8'h18; s_box[8'he2] = 8'hae; s_box[8'he3] = 8'h16;
        s_box[8'he4] = 8'h1f; s_box[8'he5] = 8'ha7; s_box[8'he6] = 8'h17; s_box[8'he7] = 8'haf; 
        s_box[8'he8] = 8'h01; s_box[8'he9] = 8'hb2; s_box[8'hea] = 8'h0e; s_box[8'heb] = 8'hbe; 
        s_box[8'hec] = 8'h07; s_box[8'hed] = 8'hb7; s_box[8'hee] = 8'h0f; s_box[8'hef] = 8'hbf;
        s_box[8'hf0] = 8'he2; s_box[8'hf1] = 8'hca; s_box[8'hf2] = 8'hee; s_box[8'hf3] = 8'hc6;
        s_box[8'hf4] = 8'hcf; s_box[8'hf5] = 8'he7; s_box[8'hf6] = 8'hc7; s_box[8'hf7] = 8'hef; 
        s_box[8'hf8] = 8'hd2; s_box[8'hf9] = 8'hf2; s_box[8'hfa] = 8'hde; s_box[8'hfb] = 8'hfe; 
        s_box[8'hfc] = 8'hd7; s_box[8'hfd] = 8'hf7; s_box[8'hfe] = 8'hdf; s_box[8'hff] = 8'hff;   
    end
    
    // Round Constant LUT
    reg [5:0] round_constants [0:63];
    
    initial begin
        round_constants[0]  = 6'h01;    round_constants[1]  = 6'h03;    round_constants[2]  = 6'h07;    round_constants[3]  = 6'h0F;        round_constants[4]  = 6'h1F;    round_constants[5]  = 6'h3E;    round_constants[6]  = 6'h3D;    round_constants[7]  = 6'h3B;        round_constants[8]  = 6'h37;    round_constants[9]  = 6'h2F;    round_constants[10] = 6'h1E;    round_constants[11] = 6'h3C;        round_constants[12] = 6'h39;    round_constants[13] = 6'h33;    round_constants[14] = 6'h27;    round_constants[15] = 6'h0E;
        round_constants[16] = 6'h1D;    round_constants[17] = 6'h3A;    round_constants[18] = 6'h35;    round_constants[19] = 6'h2B;        round_constants[20] = 6'h16;    round_constants[21] = 6'h2C;    round_constants[22] = 6'h18;    round_constants[23] = 6'h30;        round_constants[24] = 6'h21;    round_constants[25] = 6'h02;    round_constants[26] = 6'h05;    round_constants[27] = 6'h0B;        round_constants[28] = 6'h17;    round_constants[29] = 6'h2E;    round_constants[30] = 6'h1C;    round_constants[31] = 6'h38;
        round_constants[32] = 6'h31;    round_constants[33] = 6'h23;    round_constants[34] = 6'h06;    round_constants[35] = 6'h0D;        round_constants[36] = 6'h1B;    round_constants[37] = 6'h36;    round_constants[38] = 6'h2D;    round_constants[39] = 6'h1A;        round_constants[40] = 6'h34;    round_constants[41] = 6'h29;    round_constants[42] = 6'h12;    round_constants[43] = 6'h24;        round_constants[44] = 6'h08;    round_constants[45] = 6'h11;    round_constants[46] = 6'h22;    round_constants[47] = 6'h04;
        round_constants[48] = 6'h09;    round_constants[49] = 6'h13;    round_constants[50] = 6'h26;    round_constants[51] = 6'h0C;        round_constants[52] = 6'h19;    round_constants[53] = 6'h32;    round_constants[54] = 6'h25;    round_constants[55] = 6'h0A;        round_constants[56] = 6'h15;    round_constants[57] = 6'h2A;    round_constants[58] = 6'h14;    round_constants[59] = 6'h28;        round_constants[60] = 6'h10;    round_constants[61] = 6'h20;    


end
    
    // Reset Logic
    always @(posedge clock or posedge reset)begin
        if(reset)begin
            current_state <= IDLE;
            round_counter <= 'b0;
            isLoadDone <= 0;
            isEncDone <= 0;
            valid <=0;
        end else begin
            current_state <= next_state;
            end
    end
    
    // FSM Logic
    always @(*) begin
        next_state = current_state;
        valid = 0;
        case(current_state)
            IDLE: begin
                if(start)
                    next_state = LOAD;
                else 
                    next_state = IDLE;
            end
            LOAD: begin
                if(isLoadDone)
                    next_state = SUB_CELLS;
                else
                    next_state = LOAD;
            end
            SUB_CELLS: begin
//                valid = 1;
                next_state = ADD_CONST;
            end
            ADD_CONST: begin // ADD CONST
                next_state = ADD_ROUND;
            end
            ADD_ROUND: begin // ADD KEY
//                valid = 1;
                next_state = SHIFT_ROWS;
            end
            SHIFT_ROWS: begin
//                valid = 1;
                next_state = MIX_COLUMNS;
            end
            MIX_COLUMNS: begin
//                valid = 1;
                if(!isEncDone)
                    next_state = SUB_CELLS;
                else begin
//                    isEncDone = 1'b1;
                    next_state = DONE;
                end
            end
            DONE: begin
                if(isEncDone) begin
//                    isEncDone =1'b0;
                    next_state = IDLE;
                end else
                    next_state = DONE;
            end
            default: begin
                next_state = IDLE;
//                valid = 1'bZ; 
            end
        endcase
    end
    
//    always@(reg_ciphertext)begin
//        if(reg_expected_ciphertext == reg_ciphertext)
//            valid =1'b1;
//         else
//            valid = 1'b0;
//    end
    
    assign valid = (reg_expected_ciphertext == reg_ciphertext)? 1'b1 :1'b0 ;
    // Datapath Logic
    always @(*) begin
        reg_plaintext = reg_plaintext;
        reg_ciphertext = reg_ciphertext;
        
        reg_tweakey[0] = reg_tweakey[0];
        reg_tweakey[1] = reg_tweakey[1];
        reg_tweakey[2] = reg_tweakey[2]; 
        
        round_counter = round_counter;
        round_constant = round_constant;
        isLoadDone = isLoadDone;
        isEncDone = isEncDone;
        valid = valid;
        
//        $display("Round Constant at Round %h: %h", round_counter, round_constant);
        
        
        case(current_state)
            IDLE: begin
                round_counter = 0;
                isLoadDone = 0;
                isEncDone = 0;
                valid = 0;
                round_constant = 6'b0;
            end
            
            LOAD: begin
            // Data from the paper
                reg_plaintext           = 128'ha3994b66ad85a3459f44e92b08f550cb;
                initial_tweakey         = 383'hdf889548cfc7ea52d296339301797449ab588a34a47f1ab2dfe9c8293fbea9a5ab1afac2611012cd8cef952618c3ebe8;
                reg_tweakey[0]          = 128'hdf889548cfc7ea52d296339301797449;
                reg_tweakey[1]          = 128'hab588a34a47f1ab2dfe9c8293fbea9a5;
                reg_tweakey[2]          = 128'hab1afac2611012cd8cef952618c3ebe8;

//                reg_tweakey[0] = initial_tweakey[127:0];
//                reg_tweakey[1] = initial_tweakey[255:128];
//                reg_tweakey[2] = initial_tweakey[383:256];
                
                reg_expected_ciphertext = 128'h94ecf589e2017c601b38c6346a10dcfa;
                reg_ciphertext = 0;

                isLoadDone = 1'b1;
            end
            
            SUB_CELLS: begin
                reg_plaintext = sub_cells(reg_plaintext);
            end
            
            ADD_CONST: begin
                 // Updating Round Constant
                round_constant = round_constants[round_counter];
//                round_constant = {round_constant[4:0], round_constant[5] ^ round_constant[3] ^ round_constant[0]};
//                round_constant = round_constants[round_counter];
                reg_plaintext = add_constant(reg_plaintext, round_constant);
                $display("Round Constant at Round %d: 0x%h", round_counter, round_constant);             
                
            end
            
            ADD_ROUND: begin
               {reg_tweakey[0], reg_tweakey[1], reg_tweakey[2]} = key_update(round_counter, {reg_tweakey[0], reg_tweakey[1], reg_tweakey[2]});
//               reg_plaintext = add_round_key(reg_plaintext, reg_tweakey[0], reg_tweakey[1],reg_tweakey[2], round_constants[round_counter]);
//               reg_plaintext = add_round_key(reg_plaintext, reg_tweakey[0], round_constants[round_counter]);
            end
            
            
            SHIFT_ROWS: begin
                reg_plaintext = shift_rows(reg_plaintext);
            end
            MIX_COLUMNS: begin
                reg_plaintext = mix_columns(reg_plaintext);
                if(round_counter < 'h38) // 56 ROUNDS
                    round_counter = round_counter + 1;
                else
                    isEncDone =1'b1;
            end
            
            
            
            DONE: begin
            reg_ciphertext = reg_plaintext;
            isEncDone =1'b1;
            end
            
            default: begin
            end
       endcase
     end
     
     ///////////////////////////////////////////////////////////////////////////
     //         Functions
     ///////////////////////////////////////////////////////////////////////////
     // Function to add round constant to tweakey
    function [127:0] add_constant;
        input [127:0] state; // Current state (plaintext or intermediate state)
        input [5:0] RC;      // 6-bit round constant
        reg [127:0] padded_RC; // Round constant padded to 128 bits
        reg [7:0] pad_RC;
        integer i;           // Loop index
        begin
            // Initialize padded round constant to all zeros
            padded_RC = 128'b0;
            pad_RC = {2'b00, RC};
            
            // Inject the round constant into the first column of the state
            for (i = 0; i < 4; i = i + 1) begin
                padded_RC[(127 - i * 32) -: 8] = padded_RC[(127 - i * 32) -: 8] ^ pad_RC; // Inject 6-bit RC into MSBs of each byte
            end
            
            // XOR the state with the padded round constant
            add_constant = state ^ padded_RC;
        end
    endfunction
     
//    // Function for Add Round Key
//    function [127:0] add_round_key;
//        input [127:0] state;      // Current state
//        input [127:0] tweakey0;    // Current tweakey
////        input [127:0] tweakey1;    // Current tweakey
////        input [127:0] tweakey2;    // Current tweakey
//        input [5:0] RC;           // Round constant
//        integer i;
//        reg [127:0] updated_state; // Updated state after applying the round constant
//        reg [7:0] padded_RC;       // 8-bit padded round constant
//        begin
//            updated_state = state;
//            padded_RC = {2'b00, RC}; // Pad RC with two leading zeros to make it 8-bit
    
//            // XOR the first column with the padded round constant
//            for (i = 0; i < 4; i = i + 1) begin
//                updated_state[(127 - 32 * i) -: 8] = state[(127 - 32 * i) -: 8] ^ padded_RC;
//            end
    
//            // XOR the updated state with the tweakey
//            add_round_key = updated_state ^ tweakey0;
            
////            $display("State before AddRoundKey: %h", state);
//////            $display("Tweakey: %h", {tweakey0, tweakey1, tweakey2});
////            $display("Round Constant: %h", padded_RC);
////            $display("State after AddRoundKey: %h", add_round_key);
////            $display("==============================================");
//        end
//    endfunction

    
    ///////////////////////////////////////////////////////////////////////////
    // Initialize the S-Box at the start



    // Function for Sub Cells
    function [127:0] sub_cells;
        input [127:0] in_data;        // 128-bit input
        reg [127:0] out_data;          // 128-bit output (substituted result)
        integer i;
        begin
            // Loop through each byte in the 128-bit input (16 bytes)
            for (i = 0; i < 16; i = i + 1) begin
                // Apply the S-box to each byte (8 bits)
                out_data[(i*8) +: 8] = s_box[in_data[(i*8) +: 8]]; 
            end
            // Return the substituted result
            sub_cells = out_data;
        end
     endfunction
    
    ///////////////////////////////////////////////////////////////////////////
    
    // Function for Shift Rows
    function [127:0] shift_rows;
        input [127:0] state;
        reg [127:0] result;
        begin
            // Perform row shifting on the state
            // Row 0: No shift
            result[127:120] = state[127:120];
            result[119:112] = state[119:112];
            result[111:104] = state[111:104];
            result[103:96]  = state[103:96];
    
            // Row 1: Circular left shift by 1 byte
            result[95:88]   = state[87:80];
            result[87:80]   = state[79:72];
            result[79:72]   = state[71:64];
            result[71:64]   = state[95:88];
    
            // Row 2: Circular left shift by 2 bytes
            result[63:56]   = state[47:40];
            result[55:48]   = state[39:32];
            result[47:40]   = state[63:56];
            result[39:32]   = state[55:48];
    
            // Row 3: Circular left shift by 3 bytes
            result[31:24]   = state[7:0];
            result[23:16]   = state[31:24];
            result[15:8]    = state[23:16];
            result[7:0]     = state[15:8];
    
            shift_rows = result; // Return the result
        end
    endfunction
    
    ///////////////////////////////////////////////////////////////////////////
    
    // Function for Mix Columns
    function [127:0] mix_columns;
        input [127:0] state;
        reg [31:0] column_in, column_out;
        reg [127:0] result;
        integer i;
        begin
            result = 128'b0;
            for (i = 0; i < 4; i = i + 1) begin
                // Extract each 32-bit column
                column_in = state[i * 32 +: 32];
    
                // Apply the MixColumns transformation to the column
                column_out[31:24] = xtime(column_in[31:24]) ^ multiply_by_3(column_in[23:16]) ^ column_in[15:8] ^ column_in[7:0];
                column_out[23:16] = column_in[31:24] ^ xtime(column_in[23:16]) ^ multiply_by_3(column_in[15:8]) ^ column_in[7:0];
                column_out[15:8]  = column_in[31:24] ^ column_in[23:16] ^ xtime(column_in[15:8]) ^ multiply_by_3(column_in[7:0]);
                column_out[7:0]   = multiply_by_3(column_in[31:24]) ^ column_in[23:16] ^ column_in[15:8] ^ xtime(column_in[7:0]);
    
                // Store the transformed column in the result
                result[i * 32 +: 32] = column_out;
            end
    
            mix_columns = result; // Return the transformed state
        end
    endfunction
    
    // Finite Field multiplication helpers
    function [7:0] xtime(input [7:0] b);
         xtime = {b[6:0], 1'b0} ^ (8'h1b & {8{b[7]}}); // GF(2^8) multiplication by 0x02
    endfunction
    
    function [7:0] multiply_by_3(input [7:0] b);
         multiply_by_3 = xtime(b) ^ b; // GF(2^8) multiplication by 0x03
     endfunction
     
     ///////////////////////////////////////////////////////////////////////////
    
    // Function for Key Update
    function [383:0] key_update;
        input [5:0] RC;
        input [383:0] tweakey_in;
        reg [127:0] tk0, tk1, tk2;
        reg [127:0] tk0_new, tk1_new, tk2_new;
        reg [5:0] round_const; // 6-bit round constant
        integer i;
        begin
        
            // Split the input tweakey into three parts
            tk0 = tweakey_in[127:0];
            tk1 = tweakey_in[255:128];
            tk2 = tweakey_in[383:256];
    
            // Step 1: Apply permutation to tk2
            tk2_new = permute_nibbles(tk2);
    
            // Step 2: XOR round constant to tk2
            round_const = round_constants[RC]; // Example round constant (replace with dynamic value)
            tk2_new = add_round_constant(tk2_new, round_const);
    
            // Step 3: Rotate tk0, tk1, tk2
            tk0_new = tk1;
            tk1_new = tk2_new;
            tk2_new = tk0;
    
            // Combine the updated tweakey arrays
            key_update = {tk2_new, tk1_new, tk0_new};
        end
    endfunction
    
    // Permutation logic (nibble-level)
        function [127:0] permute_nibbles(input [127:0] tweakey);
            integer j;
            reg [127:0] result;
            begin
                for (j = 0; j < 128; j = j + 4) begin
                    result[j +: 4] = tweakey[((j + 8) % 128) +: 4]; // Example rotation of nibbles
                end
                permute_nibbles = result;
            end
        endfunction
    
        // Round constant addition
        function [127:0] add_round_constant(input [127:0] tweakey, input [5:0] round_const);
            reg [127:0] result;
            begin
                result = tweakey;
                result[3:0] = result[3:0] ^ round_const[3:0]; // XOR lower nibble of the tweakey
                result[67:64] = result[67:64] ^ {2'b00, round_const[5:4]}; // XOR higher bits into specific positions
                add_round_constant = result;
            end
        endfunction
    
        

 

endmodule

