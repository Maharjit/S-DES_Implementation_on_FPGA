module sbox(
    input wire [7:0] input_data,
    output reg [3:0] output_data
);
    wire [1:0] row_s0, col_s0, row_s1, col_s1;
    reg [1:0] s0_out, s1_out;

    assign row_s0 = {input_data[7], input_data[4]};
    assign col_s0 = {input_data[6], input_data[5]};
    assign row_s1 = {input_data[3], input_data[0]};
    assign col_s1 = {input_data[2], input_data[1]};

    // Initialize S-Box values using an initial block
    always @(*) begin
          case ({row_s0, col_s0})
              4'b0000: s0_out = 2'b01; 4'b0001: s0_out = 2'b00; 4'b0010: s0_out = 2'b11; 4'b0011: s0_out = 2'b10;
              4'b0100: s0_out = 2'b11; 4'b0101: s0_out = 2'b10; 4'b0110: s0_out = 2'b01; 4'b0111: s0_out = 2'b00;
              4'b1000: s0_out = 2'b00; 4'b1001: s0_out = 2'b10; 4'b1010: s0_out = 2'b01; 4'b1011: s0_out = 2'b11;
              4'b1100: s0_out = 2'b11; 4'b1101: s0_out = 2'b01; 4'b1110: s0_out = 2'b11; 4'b1111: s0_out = 2'b10;
              default: s0_out = 2'b00;
          endcase

          case ({row_s1, col_s1})
              4'b0000: s1_out = 2'b00; 4'b0001: s1_out = 2'b01; 4'b0010: s1_out = 2'b10; 4'b0011: s1_out = 2'b11;
              4'b0100: s1_out = 2'b10; 4'b0101: s1_out = 2'b00; 4'b0110: s1_out = 2'b01; 4'b0111: s1_out = 2'b11;
              4'b1000: s1_out = 2'b11; 4'b1001: s1_out = 2'b00; 4'b1010: s1_out = 2'b01; 4'b1011: s1_out = 2'b00;
              4'b1100: s1_out = 2'b10; 4'b1101: s1_out = 2'b01; 4'b1110: s1_out = 2'b00; 4'b1111: s1_out = 2'b11;
              default: s1_out = 2'b00;
          endcase
    end
    assign output_data = {s0_out, s1_out};
endmodule
