
## Definition / Statement
The **Formatted Addition** operator $\oplus_k$ (defined as best rank-$k$ approximation of a sum) is **not associative**.
$$(A \oplus_k B) \oplus_k C \neq A \oplus_k (B \oplus_k C)$$

This means that when summing a list of compressed matrices, the result depends on the **order of execution**.

## Mathematical Formulation
Let $A, B, C \in \mathbb{R}^{n \times m}$. Let $\mathcal{T}_k$ be the truncation operator to rank $k$.
$$\mathcal{T}_k(\mathcal{T}_k(A + B) + C) \neq \mathcal{T}_k(A + \mathcal{T}_k(B + C))$$

### Counter-Example Logic (The "Masking" Effect)
Imagine $k=1$.
1.  **Case 1:** $A$ is very large, $B$ is medium, $C$ is small but significant.
    * $(A+B)$ might truncate $B$ entirely if $A$ dominates. Then adding $C$ keeps $A$ and truncates $C$. Result: $\approx A$.
2.  **Case 2:** $B$ and $C$ are similar in direction.
    * $(B+C)$ might align to form a strong vector. Then adding $A$ might keep the combined $(B+C)$ vector if it's significant enough. Result: $\approx A + (B+C)$.

## Complexity / Cost Implications
* **Algorithmic Consequence:** We cannot simply use a `for` loop to accumulate a sum $\sum_{i=1}^q M_i$ if we want minimal error.
* **Fix:** We use **Tree Accumulation** (or Hierarchical Summation) to minimize the accumulation of truncation errors. This sums pairs of similar magnitude first.

### Links
* **Property of:** [[Algorithm - Formatted Addition]]
* **Motivates:** [[Implementation/Summation Strategies]]
* **Tags:** #foundations #numerical-stability #pitfalls
