
## Problem Statement
Compute $C = A \oplus_1 B$ where $A, B \in \mathcal{H}_p$ are model H-matrices with Rank 1.
* **Challenge:** The sum of two Rank-1 matrices is Rank-2. We must truncate back to Rank-1 immediately to stay in the $\mathcal{H}_p$ format.

## The Recursive Step
$$
\begin{pmatrix} \mathcal{H} & \mathcal{R} \\ \mathcal{R} & \mathcal{H} \end{pmatrix} \oplus_1 \begin{pmatrix} \mathcal{H} & \mathcal{R} \\ \mathcal{R} & \mathcal{H} \end{pmatrix} := \begin{pmatrix} \mathcal{H} \oplus_1 \mathcal{H} & \mathcal{R} \oplus_1 \mathcal{R} \\ \mathcal{R} \oplus_1 \mathcal{R} & \mathcal{H} \oplus_1 \mathcal{H} \end{pmatrix}
$$

### Operations
1.  **Diagonal Blocks ($\mathcal{H} \oplus_1 \mathcal{H}$):** Recursive calls ($2 \cdot N_{\oplus}(p-1)$).
2.  **Off-Diagonal Blocks ($\mathcal{R} \oplus_1 \mathcal{R}$):** Formatted addition of two Rank-1 matrices.
    * Cost for adding two Rank-1 matrices of size $m$: $17m + 19$.
    * With $m = n/2$, total cost for 2 blocks: $2(17 \frac{n}{2} + 19) = 17n + 38$.

## Complexity Derivation
The recurrence relation is:
$$N_{\oplus}(p) = 2 N_{\oplus}(p-1) + 17n + 38$$

**Solving the recurrence:**
$$N_{\oplus}(p) = 17n \log_2 n + 39n - 38$$

* **Conclusion:** The complexity is **$\mathcal{O}(n \log n)$**.
* **Comparison:** Standard dense addition is $\mathcal{O}(n^2)$. This is much faster.

### Links
* **Uses:** [[Algorithm - Formatted Addition]]
* **Part of:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
* **Tags:** #algorithms #matrix-arithmetic #complexity
