
## Definition
Formatted Agglomeration is the process of merging two low-rank blocks **spatially** (e.g., side-by-side or top-bottom) to form a larger block, followed immediately by truncation to keep the rank low.
* **Input:** $M_1 \in \mathcal{R}(k, n, m_1)$ and $M_2 \in \mathcal{R}(k, n, m_2)$.
* **Operation:** Form the block $[M_1 \ M_2]$ and approximate it by a rank-$k$ matrix.

## The Zero-Block Optimization
Unlike standard addition ($M_1 + M_2$), agglomeration creates a matrix with structural **zeros**:
$$[M_1 \ M_2] = [A_1 B_1^T \ \ A_2 B_2^T] = [A_1 \ A_2] \cdot \begin{pmatrix} B_1^T & 0 \\ 0 & B_2^T \end{pmatrix}$$
When performing **Algebraic Recompression** on this, we can exploit the zero blocks in the $B$-factor.
1.  **QR of A:** Standard QR on $[A_1 \ A_2]$.
2.  **QR of B:** Since $B$ has a block-diagonal structure (zeros off-diagonal), we can QR perform independently on $B_1$ and $B_2$.
    * Cost reduced significantly compared to a full dense QR.

## Complexity
The exploitation of zero blocks reduces the constant factor of the complexity compared to standard formatted addition.
* **Standard Recompression:** $\approx 24 k^2 n$.
* **Agglomeration:** $\approx 16 k^2 n$ (rough estimate based on block independence).

## Use Case
This is used during **H-Matrix Construction** (moving up the tree). When a parent block is formed by its children, we "agglomerate" the children and compress to find the parent's low-rank representation.

### Links
* **Contrast with:** [[Algorithm - Formatted Addition]]
* **Uses:** [[Algorithm - Algebraic Recompression]]
* **Tags:** #algorithms #h-matrix-construction #optimization

