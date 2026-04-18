# Synchronous $GF(2^3)$ Multiplier for Secure Hardware

This repository contains a SystemVerilog implementation of a finite field multiplier over $GF(2^3)$, specifically designed for cryptographic applications like AES or Elliptic Curve Cryptography. The design utilizes a primitive polynomial for modular reduction and is implemented as a synchronous circuit. 

## 📁 Project Structure
* GF_Multiplier.sv: The synthesizable SystemVerilog module.
* test_GF_Multiplier.sv: A comprehensive testbench verifying all input combinations.

## 🧮 Mathematical Context
Galois Field (Finite Field) arithmetic is the backbone of modern symmetric ciphers. In $GF(2^3)$, elements are represented as polynomials of degree 2.
* Addition: Performed using bitwise XOR.
* Multiplication: Performed as standard polynomial multiplication followed by a reduction step using a primitive polynomial (e.g., $x^3 + x + 1$) to ensure the result stays within the field.

## 🛠️ Implementation Details
The circuit is designed to be synchronous, featuring a global clock and an active-low reset.

### Design Methodology
1. Partial Products: The design calculates the product of the two 3-bit inputs.
2. Modular Reduction: Since the raw product can reach $x^4$, the design uses conditional XORing (based on the irreducible polynomial) to reduce the result back to a 3-bit element.
3. Pipelining/Latency: The current implementation uses internal registers (inter_c1, inter_c2) to manage the reduction steps, requiring a few clock cycles to produce a stable output.

### Hardware Specifications
* Inputs: a[2:0], b[2:0], clock, reset
* Output: c[2:0]
* Primitive Polynomial used: $x^3 + x + 1$ (Represented by the reduction logic).

## 🛡️ Security Analysis: Timing Attacks
One of the critical questions in secure hardware is whether a design is vulnerable to Timing Analysis Attacks.
Is this design vulnerable?
* Answer: No.
* Reasoning: In this implementation, the operations are synchronized to the clock. Regardless of the input values ($a$ or $b$), the result always takes a fixed number of clock cycles to propagate to the output. Because the execution time is constant and does not depend on the secret data (operands), an attacker cannot determine the inputs by measuring the time it takes for the calculation to finish.

## 🚀 How to Run
1. Clone the repository.
2. Load the files into your preferred HDL simulator (e.g., ModelSim, Vivado, or Icarus Verilog).
3. Run the testbench to observe the $8 \times 8$ input matrix verification.