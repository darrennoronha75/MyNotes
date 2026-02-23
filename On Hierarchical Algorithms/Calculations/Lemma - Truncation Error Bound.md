This lemma quantifies the error introduced when we compress a matrix $M$ (of rank $L$) into a smaller rank $k$. It is the fundamental justification for **Formatted Arithmetic**.

**Statement:**

Let $M \in \mathbb{R}^{n \times m}$ be a matrix with singular values $\sigma_1 \ge \sigma_2 \ge \dots \ge 0$.

Let $\tilde{M} = \mathcal{T}_k(M)$ be the truncation of $M$ to rank $k$ (keeping the largest $k$ singular values).

Then the error in the **Frobenius norm** is:

$$\| M - \tilde{M} \|_F = \sqrt{\sum_{i=k+1}^{\min(n,m)} \sigma_i^2}$$

And in the **Spectral norm**:

$$\| M - \tilde{M} \|_2 = \sigma_{k+1}$$

## Implication for H-Matrices

- **Adaptive Rank:** If we want an accuracy of $\varepsilon$, we simply keep adding singular values until the tail sum $\sqrt{\sum \sigma_i^2} < \varepsilon$.
    
- **Rank Growth:** If the singular values decay exponentially ($\sigma_i \sim \rho^{-i}$), we can achieve high accuracy with very small $k$.
    

### Links

- **Basis:** [[Theorem - Best Low-Rank Approximation Error]]    
- **Used In:** [[Algorithm - Algebraic Recompression]]    
- **Tags:** #lemmas #error-analysis #svd