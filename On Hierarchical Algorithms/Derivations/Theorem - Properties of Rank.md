## Context: Why this matters for H-Matrices
These fundamental properties dictate the entire architecture of Hierarchical Matrix arithmetic:
1.  **The Problem (Addition):** Since $\text{rank}(A+B)$ can increase up to the sum of the ranks, we **cannot** add compressed matrices exactly without the storage blowing up. This necessitates **Formatted Addition** (Truncation).
2.  **The Solution (Multiplication):** Since $\text{rank}(AB)$ never exceeds the rank of the factors, matrix-vector multiplication (where one factor is rank 1) is **exact** and efficient. It does not require truncation.

## The Theorem
Let $M \in \mathbb{R}^{n \times m}$. The rank of $M$ satisfies the following properties:

### 1. Definitions
* **Range:** $\text{range}(M) := \{Mx \mid x \in \mathbb{R}^m\}$ (The image space).
* **Rank:** $\text{rank}(M) := \dim(\text{range}(M))$.
* **Bounds:** $0 \le \text{rank}(M) \le \min\{n, m\}$.

### 2. Arithmetic Properties
* **Multiplication (Sub-multiplicative):**
    $$\text{rank}(A \cdot B) \le \min\{\text{rank}(A), \text{rank}(B)\}$$
    * *Implication:* Multiplying a Rank-$k$ matrix by a vector (Rank-1) results in a vector (Rank-1). The complexity stays low.
* **Addition (Sub-additive):**
    $$\text{rank}(A + B) \le \text{rank}(A) + \text{rank}(B)$$
    * *Implication:* Adding two Rank-$k$ matrices results in a Rank-$2k$ matrix. We must use **Algebraic Recompression** to force it back to $k$.

### 3. Rank-Nullity Theorem
$$\text{rank}(M) + \dim(\text{null}(M)) = m$$
* *Interpretation:* The "information" ($m$) is split between what the matrix keeps (rank) and what it destroys (nullity).

### 4. Dyadic Decomposition
A matrix has rank $k$ if and only if it can be written as the sum of $k$ rank-1 products:
$$M = \sum_{i=1}^k a_i b_i^T$$
* This is the basis of the **Rank-k Matrix Representation** ($M = AB^T$).

### Links
* **Forces use of:** [[Algorithm - Formatted Addition]]
* **Prerequisite:** [[Rank of a Matrix]]
* **Allows efficient:** [[Algorithm - Hp-Matrix Vector Multiplication (MVM)]]
* **Tags:** #foundations #linear-algebra #rank
