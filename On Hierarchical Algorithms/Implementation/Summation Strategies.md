# Implementation/Summation Strategies

## The Problem
When computing matrix products $C = A \cdot B$, a single block $C_{ij}$ is the sum of many sub-products:
$$C_{ij} = \sum_{p=1}^{q} A_{ip} \cdot B_{pj} = \sum_{p=1}^{q} M_p$$
Where each $M_p$ is a Rank-$k$ matrix. We need to compute this sum while keeping the result in Rank-$k$ format.

## Strategy 1: Exact Accumulation (Global Truncation)
We sum all $q$ matrices exactly first, resulting in a temporary matrix of rank $q \cdot k$, and then truncate once at the very end.
$$M_{sum} = T_{k \leftarrow qk}^{\mathcal{R}} \left( \sum_{i=1}^q M_i \right)$$
* **Pros:** Most accurate (best approximation error).
* **Cons:** Extremely expensive. The cost of the final SVD depends on the intermediate rank $qk$.
    * Complexity scales as $\mathcal{O}((qk)^3) = \mathcal{O}(q^3 k^3)$.
    * If $q$ is large (e.g., in matrix multiplication), this is computationally prohibitive.

## Strategy 2: Pairwise Accumulation (Recursive Truncation)
We add one matrix at a time and truncate immediately after every addition.
$$M_{new} := T_{k \leftarrow 2k}^{\mathcal{R}} (M_{old} + M_{next})$$
Formally: $M := T_{k, pairwise}^{\mathcal{R}}(\sum M_i)$.
* **Pros:** Very fast. The rank never exceeds $2k$ at any step.
* **Cons:** **Cancellation Error.** Valuable information can be lost in intermediate steps.
    * **Exercise 2.14 (Cancellation):** You are asked to construct an example with $k=1$ and three matrices where the exact sum is non-zero ($M \neq 0$), but the pairwise truncated sum results in $0$. This is analogous to "cancellation" in standard floating-point arithmetic. 

## Compromise: Intermediate Rank Strategy
To balance speed and stability, we can modify the pairwise approach:
1.  **Intermediate Rank $k'$:** Perform pairwise additions truncating to a "safety" rank $k' > k$ (e.g., $2k$).
2.  **Final Truncation:** Perform one last truncation to rank $k$ at the end.
This prevents data that is "marginally important" from being cut off too early before it has a chance to accumulate. 

## Related: Formatted Agglomeration (Block Assembly)
While summation adds matrices "on top" of each other, agglomeration assembles them "side-by-side" (e.g., building a parent block from 4 children).
* **Exercise 2.15 (Cost Analysis):** Consider constructing a matrix $M \in \mathcal{R}(4k)$ from 4 sub-blocks.
    $$M = \begin{pmatrix} M_{11} & M_{12} \\ M_{21} & M_{22} \end{pmatrix}$$
    * **Method A (Global):** Agglomerate all 4 and truncate $T_{k \leftarrow 4k}$.
    * **Method B (Pairwise):** Agglomerate rows/cols pairwise (e.g., $M_1 = [M_{11} M_{12}]$), truncate to $2k$, then combine.
    * **Optimization:** The truncation step should exploit **structural zero blocks** (see [[Algorithm - Formatted Agglomeration]]) to reduce costs significantly compared to standard addition. 

### Links
* **Algorithm:** [[Algorithm - Formatted Addition]]
* **Algorithm:** [[Algorithm - Formatted Agglomeration]]
* **Tags:** #implementation #stability #error-analysis #exercises
