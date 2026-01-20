# Study Roadmap: Hierarchical Algorithms

## CHAPTER 1: Introduction & Basics
*Goal: Understand the motivation (Complexity) and the fundamental tool (Rank-k).*
**(Script Pages 1-4)**

- [x] [[Foundations/The Curse of Dimensionality]]
- [x] [[Foundations/Discretization Error vs Approximation Error]]
- [x] [[Structures/Block Partition Definition]]
- [ ] [[Structures/Tensor Block Partition]]

---

## CHAPTER 2: Rank-k Matrices
*Goal: The "Atomic Unit" of H-Matrices. Learn how to Compress (SVD/ACA) and Compute (Arithmetics).*
**(Script Pages 5-16)**

### 2.1 - 2.3: Definitions & Best Approximation
- [x] [[Foundations/Rank of a Matrix]]
- [x] [[Foundations/Rank-k Matrix Representation]]
- [x] [[Derivations/Theorem - Properties of Rank]]
- [x] [[Lemma - Rank k Storage Cost]]
- [x] [[Foundations/Singular Value Decomposition (SVD)]]
- [x] [[Reduced Singular Value Decomposition]]
- [x] [[Theorem - Best Low-Rank Approximation Error]]


### 2.4 - 2.7: Arithmetic & Truncation
- [x] [[Algorithms/Algorithm - Exact Rank-k Addition]]
- [x] [[Algorithms/Algorithm - Exact Rank-k Multiplication]]
- [x] [[Calculations/Lemma - QR Decomposition Cost]]
- [x] [[Algorithms/Algorithm - Algebraic Recompression]] (Truncation)
- [ ] [[Derivations/Theorem - Cost of Algebraic Recompression]]
- [x] [[Algorithms/Algorithm - Formatted Addition]]
- [x]  [[Algorithm - Formatted Agglomeration]]
- [x] [[Derivations/Theorem - Truncation Non-Associativity]]

---

## CHAPTER 3: Model Problem (Hp Format)
*Goal: A simplified "Sandbox" example to prove O(n log n) before the general theory.*
**(Script Pages 17-30)**

- [x] [[Structures/Hierarchical Matrix (Hp) Format]]
- [x] [[Derivations/Theorem - Number of Blocks in Hp]]
- [x] [[Derivations/Theorem - Storage Cost of H-Matrix]] (Specific to Hp)
- [x] [[Calculations/Lemma - Inverse of Tridiagonal Matrix]]
- [x] [[Taylor Series Approximation]] (Used in Integral Model Problem)
- [x] [[Calculations/Lemma - Error Bound of Taylor Expansion]]
- [x] [[Algorithm - Hp-Matrix Addition]]
- [x] [[Algorithm - Hp-LU Decomposition]]
- [x] [[Algorithm - Hp-Matrix Vector Multiplication (MVM)]]
- [x] [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
- [x] [[Algorithm - Hp-Matrix Inversion (Recursive)]]

## CHAPTER 4: Separable Approximation
*Goal: How to generate low-rank blocks using analytical functions (Interpolation).*
**(Script Pages 31-46)**

### 4.1 - 4.2: Interpolation Theory
- [ ] [[Foundations/Separable Functions]]
- [ ] [[Foundations/Separation Rank]]
- [ ] [[Approximation/Lagrange Interpolation]]
- [ ] [[Approximation/Runge's Phenomenon]] (Context for Chebyshev)
- [ ] [[Calculations/Lemma - Interpolation Error Bound]]
- [ ] [[Chebyshev Interpolation]]
- [ ] [[Calculations/Lemma - Chebyshev Max Norm]]

### 4.2.2: Multi-dimensional & Analysis
- [ ] [[Calculations/Stability Constant (C_stab)]]
- [ ] [[Calculations/Lebesgue Constant (C_L)]]
- [ ] [[Derivations/Theorem - Tensor Interpolation Error]]
- [ ] [[Calculations/Exponential Convergence Rate]]
- [ ] [[Calculations/Lemma - Exponential Convergence of Separable Functions]]
- [ ] [[Foundations/Asymptotically Smooth Kernels]]
- [ ] [[Foundations/Admissibility Condition]] (Geometric Definition)

---

## CHAPTER 5: Structure of H-Matrices (General)
*Goal: The rigorous definition of the Tree Structure and general Complexity.*
**(Script Pages 47-60)**

- [ ] [[Structures/Cluster Tree Definition]]
- [ ] [[Construction/Cardinality Balanced Clustering]]
- [ ] [[Construction/Geometric Balanced Clustering]]
- [ ] [[Construction/Resolution of Cluster Tree]]
- [ ] [[Structures/Block Cluster Tree Definition]]
- [ ] [[Structures/Sparsity Constant (C_sp)]]
- [ ] [[Calculations/Bounding Box Diameter Calculation]]
- [ ] [[Calculations/Lemma - Frobenius Norm Consistency]]

---

## CHAPTER 6: Arithmetic of H-Matrices
*Goal: The Engines - How to compute Ax, A+B, A*B, and A^-1.*
**(Script Pages 61-70)**

- [ ] [[Algorithm - Hp-Matrix Vector Multiplication (MVM)]]
- [ ] [[Calculations/Lemma - Cost of MVM (Lemma 6.1)]]
- [ ] [[Calculations/Lemma - Cost of Matrix Addition (Lemma 6.2)]]
- [ ] [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
- [ ] [[Calculations/Lemma - Update Cost]] (Adding Rank-k to H-block)
- [ ] [[Derivations/Derivation - MMM Complexity]]
- [ ] [[Algorithms/Algorithm - H-Matrix Inversion (Newton-Schulz)]]
- [ ] [[Algorithm - Hp-LU Decomposition]]
- [ ] [[Implementation/Formatted Forward Substitution]]
- [ ] [[Derivations/Derivation - H-LU Complexity]]

---

## CHAPTER 7: Cross Approximation
*Goal: The "Black Box" method to find Low-Rank blocks without derivatives.*
**(Script Pages 71-80)**

- [ ] [[Algorithm - Adaptive Cross Approximation (ACA)]]
- [ ] [[Algorithm - ACA with Partial Pivoting]]
- [ ] [[Implementation/Stopping Criteria for ACA]]

---

## CHAPTER 9: H2-Matrices
*Goal: Advanced optimization (O(n)) using Nested Bases.*
**(Script Pages 85-94)**

- [ ] [[Structures/H2-Matrix Concept]]
- [ ] [[Calculations/Lemma - Tensor Product Dimension]]
- [ ] [[Structures/Uniform Matrix Format]]
- [ ] [[Structures/Nested Basis Property]]
- [ ] [[Structures/Transfer Matrix (E)]]
- [ ] [[Structures/Cluster Basis (V)]]
- [ ] [[Calculations/Lemma - Storage of H2 Model (Lemma 9.4)]]
- [ ] [[Derivations/Theorem - H2 Storage Cost]]
- [ ] [[Algorithms/Algorithm - Fast H2-MVM]]

---

## Implementation & Code Logic
*Topics derived from Exercises/Coding tasks.*

- [ ] [[Implementation/Supermatrix Struct Definition]]
- [ ] [[Implementation/Recursion Patterns in C]]
- [ ] [[Construction/Stopping Criteria for Clustering]]