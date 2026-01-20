## Theorem
Every matrix $M \in \mathbb{R}^{n \times m}$ can be decomposed as:
$$M = U \Sigma V^T$$
* **$U \in \mathbb{R}^{n \times n}$**: Orthogonal matrix ($U^T U = I_n$). The columns are the **Left Singular Vectors**.
* **$V \in \mathbb{R}^{m \times m}$**: Orthogonal matrix ($V^T V = I_m$). The columns are the **Right Singular Vectors**.
* **$\Sigma \in \mathbb{R}^{n \times m}$**: A diagonal matrix containing the **Singular Values** $\sigma_1 \ge \sigma_2 \ge \dots \ge 0$.

## Visualization (Full SVD)
The decomposition looks like this:
$$
\underbrace{M}_{n \times m} = \underbrace{\begin{pmatrix} | & & | \\ u_1 & \dots & u_n \\ | & & | \end{pmatrix}}_{U \, (n \times n)} \cdot \underbrace{\begin{pmatrix} \sigma_1 & & 0 \\ & \ddots & \\ 0 & & \sigma_m \\ \hline 0 & \dots & 0 \end{pmatrix}}_{\Sigma \, (n \times m)} \cdot \underbrace{\begin{pmatrix} - & v_1^T & - \\ & \vdots & \\ - & v_m^T & - \end{pmatrix}}_{V^T \, (m \times m)}
$$

## Best Approximation Property ([[Eckart-Young-Mirsky Theorem]])
The SVD provides the optimal low-rank approximation for any matrix. The best approximation $R_k$ of rank $k$ (where $k < \min(n,m)$) is obtained by keeping only the largest $k$ singular values:
$$R_k = \sum_{i=1}^k \sigma_i u_i v_i^T$$
**Error Bounds:**
* **Spectral Norm:** $\|M - R_k\|_2 = \sigma_{k+1}$
* **Frobenius Norm:** $\|M - R_k\|_F = \sqrt{\sum_{i=k+1}^{\min(n,m)} \sigma_i^2}$

## Complexity (The Bottleneck)
* **Standard Cost:** The computation of a full SVD for a dense $n \times n$ matrix is **$\mathcal{O}(n^3)$**.
* **Precise Count:** Approx $21n^3$ operations.
* **Implication:** We *cannot* use full SVDs inside our hierarchical algorithms because they would destroy the linear-logarithmic complexity goal. We only use them on small "core" matrices (see [[Algorithm - Algebraic Recompression]]).

### Links
* **Basis For:** [[Reduced Singular Value Decomposition]]
* **Alternative:** [[Algorithm - Algebraic Recompression]] (Cheaper)
* **Tags:** #foundations #linear-algebra #complexity

