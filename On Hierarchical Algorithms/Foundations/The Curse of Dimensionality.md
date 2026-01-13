## Definition
In the context of Hierarchical Algorithms, this refers to the fact that standard linear algebra operations scale effectively poorly as the problem size $n$ increases.
For dense matrices, operations typically scale with $O(n^2)$ (storage) or $O(n^3)$ (arithmetic).

## The Scale Problem
For a problem size of $n = 500,000$ ($5 \cdot 10^5$):

| Complexity | Approx. Time | Feasibility |
| :--- | :--- | :--- |
| **Linear** $O(n)$ | $\approx 1$ Minute | Ideal |
| **Quadratic** $O(n^2)$ | $\approx 1$ Year | Impossible |
| **Cubic** $O(n^3)$ | $\approx 500,000$ Years | Absurd |

## Goal
The goal of H-Matrices is to reduce the complexity of dense matrix operations to **Linear-Logarithmic** complexity:
$$O(n \log^\epsilon n)$$
where $\epsilon$ is a small constant.

### Links
* **Related:** [[Discretization Error vs Approximation Error]]
* **Solved By:** [[Hierarchical Matrix (Hp) Format]]
* **Tags:** #foundations #complexity

---
*Reference: Lecture Script Page 1 (Introduction)*