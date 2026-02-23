This lemma allows us to compute the norm of a massive H-Matrix without expanding it to its full dense size.

**Statement:**

Let $T$ be a block cluster tree where the set of leaves $\mathcal{L}(T)$ forms a partition of the index set $I \times J$.

Then the squared Frobenius norm of the matrix $M$ is exactly the sum of the squared norms of its leaf blocks:
$$\| M \|_F^2 = \sum_{b \in \mathcal{L}(T)} \| M|_b \|_F^2$$

**Proof Insight:**

Since the leaves partition the matrix, every entry $M_{ij}$ belongs to exactly one leaf block $b$.

$$\sum_{i,j} |M_{ij}|^2 = \sum_{b \in \mathcal{L}} \left( \sum_{(i,j) \in b} |M_{ij}|^2 \right) = \sum_{b \in \mathcal{L}} \| M|_b \|_F^2$$

### Links

- **Implementation:** [[Algorithm - Hp-Matrix Inversion (Recursive)]] (Norm checking)    
- **Related To:** [[Calculations/Lemma - Frobenius Norm Consistency]]    
- **Tags:** #lemmas #norm #implementation