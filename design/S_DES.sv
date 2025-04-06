module S_DES (
    input wire [7:0] plaintext,  // 8-bit input data
    input wire [9:0] key,        // 10-bit key
    input wire encrypt,          // 1 for encryption, 0 for decryption
    output wire [7:0] ciphertext // 8-bit output data
);
    wire [7:0] initial_permuted;
    wire [7:0] final_permuted;
    wire [7:0] round1_output, round2_output;
    wire [7:0] swapped;
    wire [9:0] key_10;
    wire [7:0] key1, key2;

    // Key Generation
    key_generation key_gen (.key(key), .subkey1(key1), .subkey2(key2));

    // Initial Permutation
  permutation ip (.input_data(plaintext), .permuted_data(initial_permuted), .type_1(0));

    // Round 1
    feistel_round round1 (.input_data(initial_permuted), .key(encrypt ? key1 : key2), .output_data(round1_output));

    // Swap halves
    assign swapped = {round1_output[3:0], round1_output[7:4]};


    // Round 2
    feistel_round round2 (.input_data(swapped), .key(encrypt ? key2 : key1), .output_data(round2_output));

    // Final Permutation
  permutation fp (.input_data(round2_output), .permuted_data(final_permuted), .type_1(1));

    assign ciphertext = final_permuted;
endmodule
