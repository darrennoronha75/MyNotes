## Definition
The rank of a matrix $M \in \mathbb{R}^{n \times m}$ is defined as the dimension of its image (or range):
$$\text{rank}(M) = \dim(\text{range}(M))$$
In the context of Hierarchical Algorithms, we are specifically interested in **Low-Rank Matrices** where $k = \text{rank}(M) \ll \min(n, m)$.

## Mathematical Formulation ([[Rank-k Matrix Representation]])
If a matrix $M$ has rank at most $k$, it can be represented as the sum of $k$ outer products (dyadic decomposition). We typically store it in the **factorized form**:
$$M = A \cdot B^T = \sum_{i=1}^k a_i b_i^T$$
* **$A \in \mathbb{R}^{n \times k}$**: Stores the $k$ column basis vectors ($a_i$).
* **$B \in \mathbb{R}^{m \times k}$**: Stores the $k$ row basis vectors ($b_i$).


## Complexity / Cost
This factorized representation is the key to data sparsity.
* **Storage Cost:** $k(n + m)$ (Linear in $n$).
    * *Contrast:* Full storage is $nm$ (Quadratic).
* **Compression Rate:** $\frac{k(n+m)}{nm} \approx \frac{2k}{n}$ (for square matrices).

### Links
* **Governed by:** [[Theorem - Properties of Rank]]
* **Constructed via:** [[Reduced Singular Value Decomposition]] or [[Algorithm - Adaptive Cross Approximation (ACA)]]
* **Used In:** [[Structures/Hierarchical Matrix (Hp) Format]]
* **Tags:** #foundations #linear-algebra #data-structures

---
*Reference: Lecture Script Page 5-6, Section 2.1 and 2.2*