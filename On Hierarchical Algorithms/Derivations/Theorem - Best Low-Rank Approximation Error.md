### Eckart-Young-Mirsky Theorem
Let $M = U \Sigma V^T$ be the [[Singular Value Decomposition (SVD)]] of $M$.
The best approximation $R_k$ of rank $k$ (in both spectral and Frobenius norms) is obtained by truncating the SVD to the first $k$ terms:
$$
R_k = \sum_{i=1}^k \sigma_i u_i v_i^T
$$

## Error Bounds
The error of this approximation is determined by the **neglected** singular values:
1.  **Spectral Norm ($\|\cdot\|_2$):**
    $$\|M - R_k\|_2 = \sigma_{k+1}$$
2.  **Frobenius Norm ($\|\cdot\|_F$):**
    $$\|M - R_k\|_F = \sqrt{\sum_{i=k+1}^{\min(n,m)} \sigma_i^2}$$


### Intuition
The singular values $\sigma_i$ tell you how "important" each rank component is.
* If singular values decay quickly ($100, 10, 0.1, 0.001...$), the matrix is "almost" low rank.
* If they stay flat ($1, 1, 1, 1...$), the matrix cannot be compressed.

### Links
* **Used In:** [[Algorithm - Algebraic Recompression]]
* **Tags:** #derivations #error-analysis
