module feistel_round (
    input wire [7:0] input_data,
    input wire [7:0] key,
    output wire [7:0] output_data
);
    wire [3:0] left, right, sbox_output, function_output;
    wire [7:0] expanded_right;

    assign left = input_data[7:4];
    assign right = input_data[3:0];

    // Expansion P4
    assign expanded_right = {right[0], right[3], right[2], right[1], right[2], right[1], right[0], right[3]};

    // XOR with key
    wire [7:0] xor_result = expanded_right ^ key;

    // S-Box S0 & S1
    sbox sbox_module (.input_data(xor_result), .output_data(sbox_output));

    // P4 Permutation
    assign function_output = {sbox_output[2], sbox_output[0], sbox_output[1], sbox_output[3]};

    // XOR with left half
    assign output_data = {(left ^ function_output),right};
endmodule


