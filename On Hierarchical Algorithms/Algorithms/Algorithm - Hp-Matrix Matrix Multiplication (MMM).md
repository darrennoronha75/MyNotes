## Problem Statement
We want to compute the formatted product $C = A \odot B$ where $A, B \in \mathcal{H}_p$ (Model H-Matrices of depth $p$).
* **Goal:** Compute the result in **$\mathcal{O}(n \log^2 n)$** complexity.

## Derivation: Block Multiplication
We utilize the recursive structure where a matrix in $\mathcal{H}_p$ consists of blocks in $\mathcal{H}_{p-1}$ (Diagonal) and $\mathcal{R}_{p-1}$ (Off-diagonal).

$$
\begin{pmatrix} \mathcal{H}_{p-1} & \mathcal{R}_{p-1} \\ \mathcal{R}_{p-1} & \mathcal{H}_{p-1} \end{pmatrix} \odot \begin{pmatrix} \mathcal{H}_{p-1} & \mathcal{R}_{p-1} \\ \mathcal{R}_{p-1} & \mathcal{H}_{p-1} \end{pmatrix} = \begin{pmatrix} (\mathcal{H}_{p-1} \odot \mathcal{H}_{p-1}) \oplus (\mathcal{R}_{p-1} \cdot \mathcal{R}_{p-1}) & (\mathcal{H}_{p-1} \cdot \mathcal{R}_{p-1}) \oplus (\mathcal{R}_{p-1} \cdot \mathcal{H}_{p-1}) \\ (\mathcal{R}_{p-1} \cdot \mathcal{H}_{p-1}) \oplus (\mathcal{H}_{p-1} \cdot \mathcal{R}_{p-1}) & (\mathcal{R}_{p-1} \cdot \mathcal{R}_{p-1}) \oplus (\mathcal{H}_{p-1} \odot \mathcal{H}_{p-1}) \end{pmatrix}
$$


This breakdown requires three distinct types of operations at level $p$:

### Case 1: $\mathcal{R}_{p} \cdot \mathcal{R}_{p} \to \mathcal{R}_{p}$
The product of two low-rank matrices.
* **Operation:** $uv^T \cdot xy^T = u(v^Tx)y^T$.
* **Cost:** $N_{RR}(p) = 3n - 1$ (Linear).

### Case 2: $\mathcal{H}_{p} \cdot \mathcal{R}_{p} \to \mathcal{R}_{p}$
Computing the product of an H-Matrix and a low-rank matrix.
* **Operation:** $A \cdot (uv^T) = (Au)v^T$. This reduces to **MVM** (Matrix-Vector Multiplication).
* **Cost:** $N_{HR}(p) \approx 4n \log n$ (Log-Linear).

### Case 3: $\mathcal{H}_{p} \odot \mathcal{H}_{p} \to \mathcal{H}_{p}$
This is the main recursive step. We must sum the results of the sub-blocks and truncate them using **Formatted Addition** ($\oplus$).
The work required at level $p$ (denoted $p \to p-1$) is:
1.  **Recursion:** $2 \cdot N_{HH}(p-1)$. (Two diagonal calls).
2.  **MVM Updates:** $4 \cdot N_{HR}(p-1)$. (Four off-diagonal products).
3.  **Rank-Rank:** $2 \cdot N_{RR}(p-1)$. (Two off-diagonal corrections).
4.  **Additions:** Formatted additions to merge these results.

## Complexity Derivation
Summing these components, the lecture notes derive the specific recurrence relation for the total cost $N_{HH}(p)$:

$$N_{HH}(p) = 2 N_{HH}(p-1) + \underbrace{32n + 25np - 32}_{\text{Overhead per level}}$$
*(Where $n=2^p$ and $p = \log_2 n$)*.

**Solving the Recurrence:**
Using the summation formula $\sum_{i=1}^p i \cdot 2^i$, the closed-form solution is:
$$N_{HH}(p) = 12.5 n \log_2^2 n + 44.5 n \log_2 n - 31n + 32$$

**Conclusion:**
$$N_{HH} = \mathcal{O}(n \log^2 n)$$
The dominant term is $12.5 n \log^2 n$, satisfying the complexity requirement.

### Links
* **Depends on:** [[Algorithm - Hp-Matrix Vector Multiplication (MVM)]]
* **Depends on:** [[Algorithm - Hp-Matrix Addition]]
* **Tags:** #algorithms #matrix-multiplication #complexity #derivations

---
*Reference: Lecture Script Pages 20-21, Section 3.6*