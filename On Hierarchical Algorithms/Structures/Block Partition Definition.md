## Definition
Let $I$ and $J$ be index sets. A set $P_{I \times J} = \{b_1, \dots, b_p\}$ of subsets of $I \times J$ is called a **Block Partition** if:
1.  **Product Structure:** Every block $b_k$ is a Cartesian product $b_k = \sigma \times \tau$ where $\sigma \subset I$ and $\tau \subset J$.
2.  **Disjoint:** $b_i \cap b_j = \emptyset$ for $i \neq j$.
3. **Complete:** $\bigcup_{k=1}^p b_k = I \times J$. 

## Why Product Structure?
The condition $b = \sigma \times \tau$ is critical. It ensures that every block $b$ corresponds to a **rectangular submatrix** $M|_{\sigma \times \tau}$.
Without this structure, a "block" would just be a scattered collection of matrix entries, which cannot be approximated by linear algebra tools like Rank-$k$ (SVD). 

### Links
* **See Also:** [[Tensor Block Partition]]
* **Used In:** [[Hierarchical Matrix (Hp) Format]]
* **Tags:** #structures #definitions
