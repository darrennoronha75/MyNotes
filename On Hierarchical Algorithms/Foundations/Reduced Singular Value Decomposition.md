# Foundations/Reduced Singular Value Decomposition

## Definition
If we only want to represent a matrix of rank $k$ (or approximate a matrix using only $k$ terms), the full SVD contains a lot of "silent" zero or negligible information.
The **Reduced (or Truncated) SVD** discards the parts corresponding to singular values $\sigma_{k+1} \dots \sigma_m$.

Formally, for rank $k$:
$$M \approx M_k = U_k \Sigma_k V_k^T$$
* **$U_k \in \mathbb{R}^{n \times k}$**: Contains only the first $k$ columns of $U$.
* **$\Sigma_k \in \mathbb{R}^{k \times k}$**: The top-left $k \times k$ diagonal block of $\Sigma$.
* **$V_k \in \mathbb{R}^{m \times k}$**: Contains only the first $k$ columns of $V$ (so $V_k^T$ has $k$ rows).

## Visualization (Reduced SVD)
We move from square/large matrices to "thin" matrices:
$$
\underbrace{M_k}_{n \times m} \approx \underbrace{\begin{pmatrix} | & | \\ u_1 & u_k \\ | & | \end{pmatrix}}_{U_k \, (n \times k)} \cdot \underbrace{\begin{pmatrix} \sigma_1 & \\ & \sigma_k \end{pmatrix}}_{\Sigma_k \, (k \times k)} \cdot \underbrace{\begin{pmatrix} - v_1^T - \\ - v_k^T - \end{pmatrix}}_{V_k^T \, (k \times m)}
$$

## Complexity: Does it save time?
**Short Answer:** For a dense matrix, **No.** For a low-rank matrix, **Yes.**

1.  **General Dense Matrix ($n \times n$):**
    * Computing the Reduced SVD still requires reducing the matrix to bidiagonal form, which dominates the cost.
    * **Complexity:** Still **$\mathcal{O}(n^3)$**. (Specifically $\approx 14n^3$ for reduced vs $21n^3$ for full, but still cubic).
    * **Conclusion:** We cannot simply run "Reduced SVD" on a large dense block (e.g., $10^4 \times 10^4$) because it is too slow. 

2.  **Low-Rank Factorized Matrix ($A B^T$):**
    * If the matrix is *already* in a low-rank form (Rank-$l$), we can compute the Reduced SVD much faster using **Algebraic Recompression**.
    * **Complexity:** **$\mathcal{O}(n \cdot l^2)$**.
    * **Conclusion:** This is the method used in H-Matrices. We avoid the $n^3$ cost by never forming the dense matrix in the first place. 

## Storage Benefit
* **Full SVD:** Requires storing $n^2 + m^2 + \min(n,m)$ numbers.
* **Reduced SVD:** Requires storing $k(n + m + 1)$ numbers.
* **H-Matrix Context:** Since $k \ll n$, this format is the definition of the **Rank-k Matrix Representation** used in H-Matrices.

### Links
* **Computed via:** [[Algorithm - Algebraic Recompression]] (The $O(n)$ method)
* **Theoretical Basis:** [[Singular Value Decomposition (SVD)]]
* **Tags:** #foundations #linear-algebra #compression #complexity
