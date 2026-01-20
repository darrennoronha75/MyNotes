## Problem
Reduce a rank-$l$ matrix $M = AB^T$ to a smaller rank $k$ ($k < l$) without forming the dense matrix $M$.

## The Algorithm Steps & Complexity Breakdown
The complexity is $\mathcal{O}(l^2(n+m) + l^3)$. Here is exactly where those terms come from: 

### 1. Orthogonalization (The $l^2(n+m)$ term)
We need to decouple the "spatial" size ($n, m$) from the "rank" size ($l$). We use QR decomposition to find orthonormal bases for the columns of $A$ and $B$.
* **Step:** Compute thin QR of $A$ ($n \times l$) and $B$ ($m \times l$).
    * $A = Q_A R_A$ and $B = Q_B R_B$.
* **Cost:** QR on an $n \times l$ matrix costs approx $4nl^2$.
    * Total QR cost: $4l^2(n+m)$. 

### 2. Core SVD (The $l^3$ term)
Now we operate on the small "core" matrix.
* **Step:** Form $R_{core} = R_A R_B^T$ (Size $l \times l$) and compute its SVD.
    * $R_{core} = \hat{U} \Sigma \hat{V}^T$.
* **Cost:**
    * Matrix mult ($R_A \cdot R_B^T$): $\frac{1}{3}l^3$ (using triangular structure). 
    * SVD of $l \times l$ matrix: $\approx 21l^3$. 
    * **Dominant Term:** This step depends *only* on rank $l$, not on problem size $n$.

### 3. Assembly (The $l^2(n+m)$ term)
We project the small singular vectors back to the full space.
* **Step:** Compute new factors $A_{new} = Q_A \hat{U}_k \Sigma_k$ and $B_{new} = Q_B \hat{V}_k$.
* **Cost:** Multiplying $Q_A$ ($n \times l$) by $\hat{U}$ ($l \times k$) costs $\approx 2n l k$.
    * Since $k \approx l$, this scales as $l^2(n+m)$. 

## Summary of Costs
* **Linear part ($n, m$):** $6l^2(n+m)$ — Projections and Basis changes.
* **Cubic part ($l$):** $22l^3$ — Operations on the dense core.
* **Why this matters:** Since $l$ (rank) is usually small constant (e.g., 10 or 20) and $n$ is massive ($10^6$), the $l^2n$ term dominates but is strictly linear in $n$.

### Links
* **Uses:** [[Lemma - QR Decomposition Cost]]
* **Basis for:** [[Algorithm - Formatted Addition]]
* **Tags:** #algorithms #svd #complexity

