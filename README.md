# SKINNY-AEAD Encryption

**Shiraz Anwar Khan\***  
\*Department of Electrical and Computer Engineering, North Carolina State University  
{skhan25@ncsu.edu}  

## Abstract
Our work presents the design and implementation of the SKINNY-128-384 [1] lightweight block cipher on FPGA for resource-constrained environments. The proposed architecture employs a finite state machine (FSM) for control and a highly modular datapath to execute encryption operations. The design is verified through simulation, achieving accurate results consistent with theoretical expectations. Performance metrics such as latency and throughput are discussed in detail. Furthermore, the proposed architecture is optimized for low resource utilization, making it a suitable choice for applications with strict power and area constraints.

**Index Terms:** Lightweight Cryptography, SKINNY-128-384, Tweakable Block Cipher, Hardware Security.

---

## I. INTRODUCTION

Lightweight cryptography addresses the need for efficient encryption in resource-constrained environments, such as IoT devices. The SKINNY block cipher [2] is a lightweight cryptographic primitive designed to achieve optimal performance on resource-constrained devices such as those used in IoT, mobile systems, and embedded applications. It is structured as a Substitution-Permutation Network (SPN) and offers configurations for different block and key sizes, including SKINNY-64 and SKINNY-128. This flexibility allows it to meet diverse cryptographic needs while maintaining efficiency and minimal hardware or software implementation costs.

SKINNY balances security and lightweight design, aiming to resist standard attacks such as linear and differential cryptanalysis. A key feature of SKINNY is its use of a lightweight tweakable block cipher [3] model, where the tweak can vary dynamically during encryption to provide added security. For instance, SKINNY-128-384 splits its tweakey into three 128-bit arrays, TK1, TK2, and TK3, processed in conjunction with the plaintext. Its design emphasizes minimal complexity while ensuring resilience against side-channel and differential fault attacks, making it a robust solution for modern cryptographic applications.

This project implements the SKINNY-128-384 algorithm on a Xilinx Spartan-7 FPGA, targeting encryption operations under realistic constraints. The implementation aims to evaluate its practicality and performance on hardware.

---

## II. BACKGROUND AND PRIOR WORK

The SKINNY-AEAD and SKINNY-Hash families are extensions of the SKINNY lightweight block cipher, designed for authenticated encryption and hashing applications. SKINNY-AEAD supports various configurations, including SKINNY-128-384 and SKINNY-128-256, optimizing both security and performance in constrained environments. The primary configuration uses a 128-bit key, nonce, associated data, and a message, producing ciphertext and a tag. These variants cater to specific use cases, such as reduced message sizes, making them versatile.

SKINNY-Hash uses the sponge construction and provides secure hash functions with varying security levels. The primary and secondary configurations, SKINNY-128-384 and SKINNY-128-256, ensure strong security and lightweight implementations, making them suitable for resource-constrained devices.

| AEAD Scheme Members | Hash Algorithm |
|----------------------|----------------|
| M1, M2, M3, M4      | SKINNY-tk3-Hash |
| M5, M6              | SKINNY-tk2-Hash |

---

## III. DESIGN

The SKINNY-128-384 has a block size of 128 bits, and the internal state is viewed as a 4×4 square array of cells, where each cell contains a byte. The tweakey state is viewed as a collection of three 4×4 square arrays of cells of 8 bits each (TK1, TK2, TK3). These arrays interact with plaintext to form the cipher state.

The round function consists of five transformations:
1. **Sub-Cells (SC):** A non-linear substitution layer introducing nonlinearity.
2. **Add Constants (AC):** Combines round constants using an LFSR.
3. **Add Round Tweakey (ART):** Merges tweakey arrays with the cipher state.
4. **Shift Rows (SR):** Cyclically shifts rows to enhance diffusion.
5. **Mix Columns (MC):** Applies linear mixing to the columns for propagation.

Each round transformation is executed in sequence to ensure optimal confusion and diffusion.

---

## IV. IMPLEMENTATION

The implementation consists of two main components:
- **FSM:** Controls the encryption flow across states such as IDLE, LOAD, SUB_CELLS, etc.
- **Datapath:** Executes cryptographic operations including round functions and tweakey transformations.

### A. Top-Level Architecture

The architecture includes:
- **FSM:** Manages state transitions.
- **Datapath:** Performs encryption transformations.
- **Testbench:** Simulates and verifies the implementation.

### B. FSM Design

The FSM transitions through the following states:
- **IDLE:** Initial state, awaits start signal.
- **LOAD:** Handles input data loading.
- **SUB_CELLS:** Executes non-linear substitution.
- **ADD_CONST:** Adds round constants.
- **ADD_ROUND:** Merges tweakey and cipher states.
- **SHIFT_ROWS:** Rearranges state rows.
- **MIX_COLUMNS:** Applies column transformations.
- **DONE:** Signals encryption completion.

Each state automatically transitions to the next based on completion signals, ensuring efficient operation flow.

---

**Figures and Tables:**  
Figures and tables mentioned (e.g., round functions, S-box, LFSR) can be referred to in their respective locations.

