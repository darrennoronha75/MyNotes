## Definition
A matrix $M \in \mathbb{R}^{n \times m}$ has **rank at most $k$** if it can be written as the outer product of two "thin" matrices:
$$
M = A \cdot B^T
$$
where:
* $A \in \mathbb{R}^{n \times k}$ (The column basis)
* [cite_start]$B \in \mathbb{R}^{m \times k}$ (The row basis) [cite: 3037]

## Visual Representation
$$
\begin{pmatrix} \quad \\ \quad M \quad \\ \quad \end{pmatrix}_{n \times m} 
= 
\begin{pmatrix} \ | \ \\ A \\ \ | \ \end{pmatrix}_{n \times k} 
\cdot 
\begin{pmatrix} - & B^T & - \end{pmatrix}_{k \times m}
$$

## Notation
We denote the set of rank-$k$ matrices as $\mathcal{R}(k, n, m)$.

### Intuition (The Compression)
A full matrix stores $n \times m$ numbers.
A rank-$k$ matrix stores only the "instructions" to build it: $k$ columns for $A$ and $k$ columns for $B$.
If $k$ is small ($k \ll n, m$), this is a massive compression.

### Links
* **Calculates:** [[Lemma - Rank-k Storage Cost]]
* **Operations:** [[Algorithm - Exact Rank-k Multiplication]]
* **Tags:** #foundations #rank-k
