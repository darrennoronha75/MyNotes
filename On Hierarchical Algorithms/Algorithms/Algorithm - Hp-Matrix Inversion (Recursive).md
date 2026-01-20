## The Concept
This is the direct method based on Block Gaussian Elimination. It breaks the large inversion problem down into smaller inversions and matrix multiplications using the **Schur Complement**.

## The Formula
For a block matrix $M = \begin{pmatrix} M_{11} & M_{12} \\ M_{21} & M_{22} \end{pmatrix}$, the inverse is:

$$
M^{-1} = \begin{pmatrix} 
M_{11}^{-1} + M_{11}^{-1}M_{12}S^{-1}M_{21}M_{11}^{-1} & -M_{11}^{-1}M_{12}S^{-1} \\ 
-S^{-1}M_{21}M_{11}^{-1} & S^{-1} 
\end{pmatrix}
$$

* **$S$ (Schur Complement):** $S := M_{22} - M_{21} M_{11}^{-1} M_{12}$.

## Visualization (Block Dependency)
To compute $M^{-1}$, we must descend the tree:
1.  **Recurse:** Invert $M_{11}$ (Top-Left).
2.  **Calculate $S$:** Requires H-Multiplication and H-Addition.
3.  **Recurse:** Invert $S$ (Bottom-Right effectively).
4.  **Assemble:** Compute off-diagonal blocks using multiplications.

## Complexity
The cost is dominated by the multiplications required to form $S$ and the final blocks.
$$N_{inv}(n) \approx 12.5 n \log_2^2 n + \mathcal{O}(n \log n)$$
* **Note:** This is roughly **2x more expensive** than Hp-LU decomposition.

### Links
* **Relies on:** [[Lemma - Schur Complement]]
* **Relies on:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
* **Tags:** #algorithms #inversion #recursive
