module key_generation (
    input wire [9:0] key,
    output wire [7:0] subkey1,
    output wire [7:0] subkey2
);
    wire [9:0] permuted_key;
    wire [4:0] left, right;
    wire [4:0] left_shift1, right_shift1;
    wire [4:0] left_shift2, right_shift2;

    // P10 Permutation
    assign permuted_key = {key[7], key[5], key[8], key[3], key[6], key[0], key[9], key[1], key[2], key[4]};

    assign left = permuted_key[9:5];
    assign right = permuted_key[4:0];

    // Left Shift (LS-1)
    assign left_shift1 = {left[3:0], left[4]};
    assign right_shift1 = {right[3:0], right[4]};

    // Generate Subkey 1 using P8
    assign subkey1 = {right_shift1[4], left_shift1[2], right_shift1[3], left_shift1[1], right_shift1[2], left_shift1[0], right_shift1[0], right_shift1[1]};

    // Left Shift (LS-2)
    assign left_shift2 = {left_shift1[2:0], left_shift1[4:3]};
    assign right_shift2 = {right_shift1[2:0], right_shift1[4:3]};

    // Generate Subkey 2 using P8
    assign subkey2 ={right_shift2[4], left_shift2[2], right_shift2[3], left_shift2[1], right_shift2[2], left_shift2[0], right_shift2[0], right_shift2[1]};
endmodule
