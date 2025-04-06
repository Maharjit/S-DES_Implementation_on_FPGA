module permutation(
    input wire [7:0] input_data,
    output wire [7:0] permuted_data,
    input type_1  // 0 for IP, 1 for FP
);
  assign permuted_data = (type_1==0) ? {input_data[6], input_data[2], input_data[5], input_data[7], input_data[4], input_data[0], input_data[3], input_data[1]} :
                                   {input_data[4], input_data[7], input_data[5], input_data[3], input_data[1], input_data[6], input_data[0], input_data[2]};
endmodule


