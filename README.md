# S-DES Hardware Implementation on FPGA


![WhatsApp Image 2025-03-31 at 11 32 56](https://github.com/user-attachments/assets/03305762-4647-48cb-b1b2-9e705b50ed19)


## Introduction and Abstract

The **Simplified Data Encryption Standard (S-DES)** is a lightweight cryptographic algorithm designed for security applications and educational purposes. Implementing S-DES on an **FPGA** enhances both **speed** and **efficiency** compared to software-based implementations.

This project explores the hardware implementation of S-DES, making key design adjustments to accommodate **FPGA limitations** such as reduced key length and fixed bits.

---

## Methodology

### Key Generation

- A **modified 8-bit key** is used instead of the original 10-bit key due to hardware constraints.
- The **two rightmost bits are fixed as `11`** to maintain structural consistency.
- **Key scheduling** follows the original S-DES structure.
- **Two subkeys** are generated for the two rounds of encryption.

### Encryption & Decryption Process

- Implementation follows the **Feistel structure** with **two rounds of encryption**.
- Key components:
  - **Initial Permutation (IP)**
  - **Substitution Boxes (S-Boxes)**
  - **XOR operations**
- **Decryption** is performed by reversing the encryption process with subkeys in reverse order.

### Design & Testing

- Entire design was coded in **Verilog**.
- Synthesized and deployed on **Basys-3 board**.
- **Functional testing** was conducted using multiple test cases to verify correctness.

---

## Results 

- **Successful implementation** of both encryption and decryption processes.
- **FPGA resource usage** was optimized to fit within the available logic elements.
- Achieved a **speedup of approximately 200x** compared to equivalent software implementation.
- Output was verified using **standard S-DES test cases** to ensure functional accuracy.

---

## Conclusion

The project demonstrates the feasibility of implementing S-DES on FPGA with minor structural modifications. The hardware-based approach provides a significant speed advantage and showcases how lightweight cryptographic algorithms can be adapted for embedded systems.

---

## Tools & Technologies

- Verilog
- Xilinx Vivado 
- Basys-3 board

---



