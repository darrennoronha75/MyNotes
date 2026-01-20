
## Statement
The storage requirement for a Rank-k matrix $M \in \mathbb{R}^{n \times m}$ given in factorized form $M = AB^T$ is linear with respect to the dimensions $n$ and $m$.

## Formula
$$\text{Storage}(M_{Rank-k}) = k(n + m)$$

## Comparison
* **Dense Format:** $n \cdot m$
* **Rank-k Format:** $k(n + m)$

**Example:**
If $n = 10,000$, $m = 10,000$, and $k = 10$:
* Dense: $100,000,000$ entries.
* Rank-k: $10(20,000) = 200,000$ entries.
* **Savings:** $\approx 99.8\%$ reduction.

### Links
* **Prerequisite:** [[Rank-k Matrix Representation]]
* **Used In:** [[Theorem - Storage Cost of H-Matrix]]
* **Tags:** #calculations #storage

---
*Reference: Lecture Script Page 5 (Remark 2.1)*