A **Block Cluster Tree** $T_{I \times J}$ is a hierarchy of matrix blocks formed by combining two cluster trees, $T_I$ (for rows) and $T_J$ (for columns). It defines which parts of the matrix will be approximated (Low-Rank) and which will be stored densely.

**1. Node Structure:**

Each node in the block cluster tree represents a block $b = s \times t$, where:

- $s \in T_I$ is a row cluster.    
- $t \in T_J$ is a column cluster.    

**2. Recursive Construction:**

The tree is built recursively starting from the root $I \times J$:

- **Base Case (Admissible):** If a block $s \times t$ satisfies the [[Foundations/Admissibility Condition]], it becomes a leaf node of type **Admissible ($L^+$)**. It is not subdivided further.    
- **Base Case (Small):** If the blocks are too small (e.g., $\#s \le n_{min}$), it becomes a leaf node of type **Inadmissible ($L^-$)**.    
- **Recursive Step:** If neither base case applies, the block is subdivided. The successors are formed by all combinations of the children of $s$ and $t$: 
$$S(s \times t) = \{ s' \times t' \mid s' \in S(s), t' \in S(t) \}$$

## Leaf Types

The set of leaves $L(T_{I \times J})$ forms a complete partition of the matrix.

1. **Admissible Leaves ($L^+$):    
    - Satisfy $Adm(s, t) = \text{True}$.        
    - Stored as **Rank-k** matrices ($AB^T$).        
    - Typically "far" from the diagonal.

2. **Inadmissible Leaves ($L^-$):    
    - Satisfy $Adm(s, t) = \text{False}$.        
    - Stored as **Dense** matrices.        
    - Typically "on" or "near" the diagonal.


### Links

- **Uses:** [[Foundations/Admissibility Condition]]    
- **Input For:** [[Calculations/Sparsity Constant (C_sp)]]
- **Implementation:** [[Structures/Hierarchical Matrix (Hp) Format]]    
- **Tags:** #structures #definitions #matrix-partition