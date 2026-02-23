This proof demonstrates why the number of dense blocks in an H-Matrix does not grow with the matrix size $N$, ensuring $O(N \log N)$ complexity.

**Context:**

We use **Geometric Bisection** in $d$ dimensions.

- **Neighborhood ($3^d$):** Any cluster $t$ (a box) is surrounded by at most $3^d - 1$ other boxes of the same size. Including itself, the "neighborhood of interest" has size $3^d$.    
- **Refinement ($2^d$):** When we split a cluster, it produces $2^d$ children.    

**The Argument:**

1. Let $s$ be a cluster. Its row sparsity is the number of blocks $s \times t$ in the H-Matrix.    
2. Blocks are only created if they are **admissible** (far) or **leaves**.    
3. Inadmissible blocks (dense) only happen if $s$ and $t$ are "close" (neighbors).    
4. At any level, the parent of $s$ had at most $3^d$ neighbors.    
5. Each of those neighbors splits into $2^d$ children.    
6. Therefore, $s$ can have at most $3^d \times 2^d = 6^d$ candidates for interaction at this level.    

**Conclusion:**

$$C_{sp} \le 6^d$$

This constant is independent of the depth of the tree and the number of points $N$.
### Links

- **Basis:** [[Construction/Geometric Balanced Clustering]]    
- **Defines:** [[Calculations/Sparsity Constant (C_sp)]]    
- **Tags:** #derivations #proofs #geometry