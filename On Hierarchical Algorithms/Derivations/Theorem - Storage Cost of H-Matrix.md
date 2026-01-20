## Theorem
The storage requirement $N_{\mathcal{H}}(p)$ for a Hierarchical Matrix in the $\mathcal{H}_p$ format (where $n = 2^p$) with rank-$k$ off-diagonal blocks is:
$$N_{\mathcal{H}}(p) = \mathcal{O}(k \cdot n \log n)$$
Specifically, for rank $k=1$, the exact cost is $n + 2n \log_2 n$. 

## Derivation
Let $S_{\mathcal{H}}(p)$ be the storage cost for a matrix of size $2^p \times 2^p$.
The $\mathcal{H}_p$ structure is defined recursively:
$$
M = \begin{pmatrix} M_{11} & M_{12} \\ M_{21} & M_{22} \end{pmatrix}
$$
* **Diagonals ($M_{11}, M_{22}$):** Two sub-matrices of type $\mathcal{H}_{p-1}$.
* **Off-Diagonals ($M_{12}, M_{21}$):** Two Rank-$k$ matrices of size $2^{p-1} \times 2^{p-1}$.

### 1. The Recurrence Relation
$$S_{\mathcal{H}}(p) = 2 \cdot S_{\mathcal{H}}(p-1) + 2 \cdot S_{\mathcal{R}}(p-1)$$
where $S_{\mathcal{R}}(p-1)$ is the cost of storing a rank-$k$ block of size $m = 2^{p-1}$.
* Cost of Rank-$k$ ($n \times n$): $k(n+n) = 2kn$.
* Here size is $2^{p-1}$, so cost is $2k(2^{p-1}) = k \cdot 2^p$. 

Substituting this back (assuming $k=1$ for simplicity as per the text):
$$S_{\mathcal{H}}(p) = 2 S_{\mathcal{H}}(p-1) + 2 \cdot (2^{p-1} + 2^{p-1}) = 2 S_{\mathcal{H}}(p-1) + 2^{p+1}$$

### 2. Solving the Recursion
We expand the recurrence step-by-step:
1.  $S_{\mathcal{H}}(p) = 2 S_{\mathcal{H}}(p-1) + 2^{p+1}$
2.  Substitute $S_{\mathcal{H}}(p-1)$:
    $= 2 [2 S_{\mathcal{H}}(p-2) + 2^p] + 2^{p+1}$
    $= 4 S_{\mathcal{H}}(p-2) + 2^{p+1} + 2^{p+1}$
    $= 2^2 S_{\mathcal{H}}(p-2) + 2 \cdot 2^{p+1}$
3.  General pattern after $i$ steps:
    $= 2^i S_{\mathcal{H}}(p-i) + i \cdot 2^{p+1}$

At the base case ($i=p$), $S_{\mathcal{H}}(0) = 1$ (storage for $1 \times 1$ matrix):
$$S_{\mathcal{H}}(p) = 2^p \cdot 1 + p \cdot 2^{p+1}$$
Since $n = 2^p$ and $p = \log_2 n$:
$$S_{\mathcal{H}}(p) = n + 2n \log_2 n$$

## Intuition (How to think about it)
* **The "Surface Area" Logic:** In a dense matrix, every element is stored ($n^2$, "Area"). In an H-Matrix, we only store the "perimeter" data of the off-diagonal blocks.
* **The Tree Depth:** The recursion depth is $p = \log n$. At *each* level of the tree, we store a set of low-rank blocks that cover the matrix. The storage cost per level is roughly linear ($\mathcal{O}(n)$).
* **Result:** $\text{Total Cost} = (\text{Cost per Level}) \times (\text{Number of Levels}) \approx n \times \log n$.

### Links
* **Related:** [[Hierarchical Matrix (Hp) Format]]
* **Uses:** [[Lemma - Rank k Storage Cost]]
* **Tags:** #derivations #complexity #storage

---
*Reference: Lecture Script Pages 17-18*