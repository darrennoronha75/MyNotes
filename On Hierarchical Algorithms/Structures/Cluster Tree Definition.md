## Definition: Cluster Tree

A **Cluster Tree** $T_I$ is a hierarchical structure used to partition an index set $I$ (e.g., $\{1, \dots, n\}$) into smaller subsets called **clusters**. This structure forms the basis for efficiently organizing the rows and columns of an H-Matrix.

**1. Graph Theoretic Foundation:**

Let $T = (V, E)$ be a tree with a set of vertices $V$ and edges $E$.

- **Root:** There is a unique node $r \in V$ such that every other node has exactly one path from $r$.
- **Successors ($S(t)$):** The set of children of a node $t$.
- **Leaves ($L(T)$):** The set of nodes with no successors ($S(t) = \emptyset$).

**2. Labeling (The "Cluster" Aspect):**

Each node $t \in T$ is assigned a subset of the index set $\hat{t} \subseteq I$. We often identify the node $t$ directly with its index set. A labeled tree is a **Cluster Tree** if:

1. **Root Coverage:** The root represents the entire index set ($\hat{r} = I$).
2. **Disjoint Decomposition:** For any non-leaf node $t$, its successors form a disjoint partition of $\hat{t}$:
  $$\hat{t} = \bigcup_{t' \in S(t)} \hat{t'} \quad \text{and} \quad \hat{t'} \cap \hat{s'} = \emptyset \quad \forall t', s' \in S(t), t' \neq s'$$


## Properties

- **Depth:** The maximum level of any node in the tree. For a balanced tree with $n$ indices, the depth is usually $\mathcal{O}(\log n)$.    
- **Level:** The distance of a node from the root (Root is level 0).    
- **Cardinality:** $\#t$ denotes the number of indices in cluster $t$.


## Visual Hierarchy

Imagine a set $I = \{1, \dots, 8\}$.

- **Level 0 (Root):** $\{1, \dots, 8\}$    
- **Level 1:** $\{1, \dots, 4\}$, $\{5, \dots, 8\}$    
- **Level 2:** $\{1, 2\}$, $\{3, 4\}$, $\{5, 6\}$, $\{7, 8\}$    
- **Level 3 (Leaves):** $\{1\}, \{2\}, \dots, \{8\}$


### Links

- **Basis For:** [[Structures/Block Cluster Tree Definition]]    
- **Constructed By:** [[Construction/Geometric Balanced Clustering]]    
- **Constructed By:** [[Construction/Cardinality Balanced Clustering]]    
- **Tags:** #structures #definitions #hierarchy