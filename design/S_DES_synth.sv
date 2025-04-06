module top_module (
    input wire clk,                 // Clock for display multiplexing
    input wire [15:0] sw,           // Switches: sw[7:0] for plaintext, sw[15:6] for key
    input wire btnC,                // Button for encryption mode
    input wire btnD,                // Button for decryption mode
    output reg [7:0] led            // LED output for ciphertext (blinking)
);

    wire [7:0] plaintext = sw[7:0];     // 8-bit plaintext from switches
    wire [9:0] key = {sw[15:8], 2'b11}; // 10-bit key with fixed last 2 bits
    wire [7:0] ciphertext;              // Encrypted output

    // Instantiate the S-DES module
    S_DES sdes (
        .plaintext(plaintext),
        .key(key),
        .encrypt(btnC),   // Encrypt when button is pressed
        .ciphertext(ciphertext)
    );

    

    // LED Blinking for Ciphertext Output
    always @(posedge clk) begin
      if (btnC | btnD) begin
            led <= ciphertext; // Show encrypted data on LEDs
        end else begin
            led <= 8'b00000000; // Turn off LEDs when not encrypting
        end
    end


endmodule
