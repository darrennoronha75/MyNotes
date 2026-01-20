## The Theorem
If $M$ is a tridiagonal matrix (non-zero entries only on the main diagonal and the immediate upper/lower diagonals), then its inverse $M^{-1}$ is an H-Matrix.
Specifically, all off-diagonal blocks of the inverse have **Rank 1**. 

## Visualization (Why is it Rank-1?)
Let's look at the structure of a tridiagonal matrix $M$ when partitioned into $2 \times 2$ blocks:

$$
M = \left( \begin{array}{c|c} M_{11} & M_{12} \\ \hline M_{21} & M_{22} \end{array} \right) 
= \left( \begin{array}{cccc|cccc} a_1 & b_1 & 0 & 0 & 0 & 0 & 0 & 0 \\ c_1 & a_2 & b_2 & 0 & 0 & 0 & 0 & 0 \\ 0 & c_2 & a_3 & b_3 & \mathbf{0} & \mathbf{0} & \mathbf{0} & \mathbf{0} \\ 0 & 0 & c_3 & a_4 & \mathbf{b_4} & \mathbf{0} & \mathbf{0} & \mathbf{0} \\ \hline 0 & 0 & 0 & \mathbf{c_4} & a_5 & b_5 & 0 & 0 \\ 0 & 0 & 0 & \mathbf{0} & c_5 & a_6 & b_6 & 0 \\ 0 & 0 & 0 & \mathbf{0} & 0 & c_6 & a_7 & b_7 \\ 0 & 0 & 0 & \mathbf{0} & 0 & 0 & c_7 & a_8 \end{array} \right)
$$

**Observe the Off-Diagonal Blocks ($M_{12}$ and $M_{21}$):**
* **$M_{12}$ (Top Right):** It is almost entirely zero. It has **only one** non-zero entry (bottom-left corner of the block, $b_4$).
* **$M_{21}$ (Bottom Left):** It is almost entirely zero. It has **only one** non-zero entry (top-right corner of the block, $c_4$).

**Mathematical Consequence:**
A matrix with only one non-zero entry (or one non-zero column/row) has **Rank = 1**.
Therefore, $M_{12}$ and $M_{21}$ are Rank-1 matrices. 

## The Proof (The "Bottleneck" Logic)
We need to prove that the **Inverse** $M^{-1}$ keeps this Rank-1 property in its off-diagonal blocks.
Using the block inverse formula, the top-right block of the inverse is:
$$
(M^{-1})_{12} = -M_{11}^{-1} \cdot \mathbf{M_{12}} \cdot S^{-1}
$$
* $M_{11}^{-1}$: A full-rank dense matrix.
* $S^{-1}$: A full-rank dense matrix.
* $\mathbf{M_{12}}$: **Rank 1**.

**Linear Algebra Rule:** The rank of a product $A \cdot B \cdot C$ is limited by the lowest rank in the chain.
$$\text{Rank}(M^{-1}_{12}) \le \text{Rank}(M_{12}) = 1$$
Thus, the off-diagonal block of the inverse is also Rank-1. [cite_start]This applies recursively to all sub-blocks, proving $M^{-1}$ is an H-Matrix. [cite: 3481-3483]

### Links
* **Uses:** [[Lemma - Schur Complement]]
* **Tags:** #calculations #tridiagonal #matrix-structure

---
*Reference: Lecture Script Page 23, Theorem 3.4*