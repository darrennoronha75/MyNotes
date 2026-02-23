The **Sparsity Constant** $C_{sp}$ is a structural constant that bounds the maximum number of blocks any single row or column cluster can interact with. It determines the complexity of H-Matrix storage and arithmetic.

**Definition:**

A block cluster tree $T_{I \times J}$ is $C_{sp}$-sparse if:

$$\max_{s \in T_I} \# \{ t \in T_J \mid s \times t \in T_{I \times J} \} \le C_{sp}$$

(And analogously for columns).

This means "For any cluster $s$, there are at most $C_{sp}$ blocks in its block row."

## Geometric Proof (The $6^d$ Bound)

For geometric clustering in $d$ dimensions, we can derive an upper bound for $C_{sp}$.

**1. Neighbors ($3^d$):**

Consider a cluster $s$. Admissibility usually fails only if clusters are touching or very close. In a regular grid, a box is surrounded by $3^d - 1$ neighbors (including diagonals). Including itself, there are $3^d$ "close" regions.

**2. Children ($2^d$):**

In the next level of recursion, each of these "close" neighbor clusters splits into $2^d$ children.

**3. Maximum Interaction:**

The maximum number of inadmissible (dense) or admissible blocks a cluster $s$ can interact with at a specific level of refinement is bounded by the product of the neighborhood size and the branching factor:

$$C_{sp} \le 3^d \times 2^d = 6^d$$

**Significance:**

- This constant proves that the complexity is **linear-logarithmic** $\mathcal{O}(N \log N)$ rather than quadratic.
    
- It grows rapidly with dimension ($6^1=6, 6^2=36, 6^3=216$), highlighting the "Curse of Dimensionality."
    

### Links

- **Used In:** [[Theorem - Storage Cost of H-Matrix]]    
- **Used In:** [[Lemma - Cost of MVM (Lemma 6.1)]]    
- **Used In:** [[Lemma - Cost of Matrix Addition (Lemma 6.2)]]    
- **Tags:** #calculations #complexity #proofs