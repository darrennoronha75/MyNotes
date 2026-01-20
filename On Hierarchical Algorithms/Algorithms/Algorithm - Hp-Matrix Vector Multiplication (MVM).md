## Problem Statement
We compute the matrix-vector product $y = A \cdot x$ where $A$ is in the model format $\mathcal{H}_p$ (rank $k=1$) and size $n=2^p$.
* **Goal:** Prove the complexity is $\mathcal{O}(n \log n)$.

## The Recursive Step
The matrix $A \in \mathcal{H}_p$ is structured as:
$$
A = \begin{pmatrix} A_{11} & A_{12} \\ A_{21} & A_{22} \end{pmatrix} = \begin{pmatrix} \mathcal{H}_{p-1} & \mathcal{R}_{p-1} \\ \mathcal{R}_{p-1} & \mathcal{H}_{p-1} \end{pmatrix}
$$
The multiplication $y = Ax$ splits into:
$$
\begin{pmatrix} y_1 \\ y_2 \end{pmatrix} = \begin{pmatrix} A_{11}x_1 + A_{12}x_2 \\ A_{21}x_1 + A_{22}x_2 \end{pmatrix}
$$

### Operations
1.  **Diagonal Blocks ($\mathcal{H}_{p-1}$):** Recursive calls ($2 \cdot N_{MV}(p-1)$).
2.  **Off-Diagonal Blocks ($\mathcal{R}_{p-1}$):** Multiplication with Rank-1 matrices.
    * For a rank-1 matrix of size $m = n/2$, the cost is $3m - 1$ (or roughly $6(n/2)$).
    * Total for 2 off-diagonal blocks: $\approx 4n$.

## Complexity Derivation
The exact recurrence relation given in the text is:
$$N_{MV}(p) = 2 N_{MV}(p-1) + 4n - 2$$

**Solving the recurrence:**
$$N_{MV}(p) = 4n \log_2 n - n + 2$$

* **Conclusion:** The complexity is **$\mathcal{O}(n \log n)$**.
* **Accuracy:** The operation is exact (no truncation errors occur in MVM).

### Links
* **Uses:** [[Rank-k Matrix Representation]]
* **Basis for:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
* **Tags:** #algorithms #mvm #complexity #derivations
