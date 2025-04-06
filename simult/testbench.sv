module testbench;
    reg [7:0] plaintext;
    reg [9:0] key;
    reg encrypt;
    wire [7:0] ciphertext;

    S_DES uut (.plaintext(plaintext), .key(key), .encrypt(encrypt), .ciphertext(ciphertext));

    initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars;
        key = 10'b1010000010;
        plaintext = 8'b11010110;
        encrypt = 1; // Encryption
        #10;
        encrypt = 0; // Decryption
        #10;
        $stop;
    end
endmodule
