## Definition / Statement
For a matrix of dimension $n \times n$ where $n = 2^p$, defined in the model $\mathcal{H}_p$ format, the total number of blocks in the partition (admissible leaves + inadmissible leaves) grows linearly with $n$.

## Mathematical Formulation
Let $\mathcal{N}_{block}(p)$ be the number of blocks in the partition of an $\mathcal{H}_p$-matrix.
The precise count is:
$$\mathcal{N}_{block}(p) = 3n - 2$$
*(Where $n = 2^p$)*

### Derivation (Induction)
The count is derived from the recursive definition of the $\mathcal{H}_p$ format:
1.  **Base Case ($p=0, n=1$):**
    The matrix is a single dense block.
    $$\mathcal{N}(0) = 1 = 3(1) - 2$$
2.  **Recursive Step ($p > 0$):**
    An $\mathcal{H}_p$ matrix consists of:
    * 2 Diagonal blocks ($\mathcal{H}_{p-1}$) $\to$ Recursive count $2 \cdot \mathcal{N}(p-1)$.
    * 2 Off-diagonal blocks ($\mathcal{R}_{p-1}$) $\to$ These are leaves (count = 2).
    * **Recurrence:** $\mathcal{N}(p) = 2\mathcal{N}(p-1) + 2$.

Solving this recurrence:
$$\mathcal{N}(p) = 2(3 \cdot 2^{p-1} - 2) + 2 = 3 \cdot 2^p - 4 + 2 = 3n - 2$$

## Complexity / Cost
* **Sparsity:** The number of blocks is **$\mathcal{O}(n)$**.
* **Contrast:** A full block decomposition (like a quadtree down to leaves) would have $\mathcal{O}(n^2)$ blocks. This linear scaling is what makes H-Matrices efficient for storage and arithmetic.

### Links
* **Part of:** [[Structures/Hierarchical Matrix (Hp) Format]]
* **Determines:** [[Theorem - Storage Cost of H-Matrix]]
* **Tags:** #derivations #structures #complexity #proofs

---
[cite_start]*Reference: Lecture Script Page 17, Exercise 3.1 [cite: 370-373]*