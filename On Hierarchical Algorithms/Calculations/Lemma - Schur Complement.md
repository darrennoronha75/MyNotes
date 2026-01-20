## Definition
For a block matrix $M = \begin{pmatrix} M_{11} & M_{12} \\ M_{21} & M_{22} \end{pmatrix}$, the Schur Complement $S$ is defined as:
$$S := M_{22} - M_{21} M_{11}^{-1} M_{12}$$

## Motivation: The Story of Elimination
Imagine you are solving a system of linear equations $Mx = b$. You want to eliminate the first set of variables $x_1$ to solve for $x_2$.

1.  **The System:**
    $$\begin{cases} M_{11}x_1 + M_{12}x_2 = b_1 \\ M_{21}x_1 + M_{22}x_2 = b_2 \end{cases}$$
2.  **Solve for $x_1$ (from eq 1):**
    $$M_{11}x_1 = b_1 - M_{12}x_2 \implies x_1 = M_{11}^{-1}b_1 - M_{11}^{-1}M_{12}x_2$$
3.  **Substitute into eq 2:**
    $$M_{21}(M_{11}^{-1}b_1 - M_{11}^{-1}M_{12}x_2) + M_{22}x_2 = b_2$$
4.  **Group $x_2$ terms:**
    $$(M_{22} - M_{21}M_{11}^{-1}M_{12})x_2 = b_2 - M_{21}M_{11}^{-1}b_1$$

**The Result:** The term in the parentheses is exactly the **Schur Complement** $S$. It represents the "effective" system matrix for $x_2$ after the influence of $x_1$ has been removed.

## Why do we need it this way for H-Matrices?
We want to compute the inverse $M^{-1}$ recursively.
The formula for the block inverse is:
$$
M^{-1} = \begin{pmatrix} M_{11}^{-1} + M_{11}^{-1}M_{12}S^{-1}M_{21}M_{11}^{-1} & -M_{11}^{-1}M_{12}S^{-1} \\ -S^{-1}M_{21}M_{11}^{-1} & S^{-1} \end{pmatrix}
$$
**The Magic:**
This formula expresses the inverse of a large matrix $M$ entirely in terms of:
1.  Inverses of **smaller** blocks ($M_{11}^{-1}$ and $S^{-1}$).
2.  Matrix multiplications and additions.

Since we have already defined efficient **H-Matrix Multiplication** and **Formatted Addition**, this formula allows us to build a recursive **H-Matrix Inversion** algorithm with complexity $\mathcal{O}(n \log^2 n)$. Without the Schur complement decomposition, we would have no way to break the inversion problem down into smaller pieces.

### Links
* **Used In:** [[Algorithm - H-Matrix Inversion (Newton-Schulz)]]
* **Used In:** [[Algorithm - Hp-LU Decomposition]]
* **Tags:** #calculations #inversion #schur-complement #linear-algebra

---
[cite_start]*Reference: Lecture Script Page 21 [cite: 3436-3438]*