
## Definition
Formatted addition is the operation $M_{new} \leftarrow M_1 \oplus_k M_2$.
It approximates the sum of two rank-$k$ matrices with a new matrix of rank $k$, aiming to minimize the error $||(M_1 + M_2) - M_{new}||$.

## Mechanics: Exact Addition followed by Truncation
The process is a two-step "Expand and Shrink" strategy.

### Step 1: Exact Addition (Rank Expansion)
We rely on the property that the sum of two outer products can be written as a larger block outer product.
Given:
* $M_1 = A_1 B_1^T$ (Rank $k$)
* $M_2 = A_2 B_2^T$ (Rank $k$)

We can write the sum exactly as:
$$M_{sum} = M_1 + M_2 = \begin{pmatrix} A_1 & A_2 \end{pmatrix} \cdot \begin{pmatrix} B_1 & B_2 \end{pmatrix}^T$$
* **New Factor A:** The block concatenation $[A_1 \ A_2]$ has size $n \times 2k$.
* **New Factor B:** The block concatenation $[B_1 \ B_2]$ has size $m \times 2k$.
* **Result:** This is a matrix of **Rank $2k$**. 

### Step 2: Truncation (Algebraic Recompression)
The rank $2k$ is too high (it would grow exponentially in recursive algorithms). We must truncate it back to $k$.
We apply **Algebraic Recompression** (see [[Algorithm - Algebraic Recompression]]) with input rank $l = 2k$.

1.  **QR Factorization:** Orthogonalize the "fat" matrices $[A_1 \ A_2]$ and $[B_1 \ B_2]$.
2.  **SVD:** Compute SVD of the small $2k \times 2k$ interaction frame.
3.  **Keep $k$:** Discard the smallest $k$ singular values.

## Complexity
Substituting $l = 2k$ into the recompression cost formula ($\approx 6l^2n + 22l^3$):
$$\text{Cost} \approx 24 k^2 (n+m) + 176 k^3$$
## Intuition
Imagine adding two images that are compressed.
1.  **Exact:** You overlay them. The file size doubles because you are storing both sets of data.
2.  **Truncation:** You notice that some patterns in Image 1 overlap with Image 2. You run SVD to find the "dominant" features of the combined image and discard the faint details to get the file size back down to the original limit.

### Links
* **Depends on:** [[Algorithm - Algebraic Recompression]]
* **Used In:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
* **Tags:** #algorithms #arithmetic #truncation 
