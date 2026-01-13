## 1. Matrix-Vector Multiplication (MVM)
To compute $y = M x$ where $M = AB^T$:
**Do not** compute $(AB^T)$. Use associativity:
$$y = A (B^T x)$$
1.  Compute $z = B^T x$ (Cost: $2km$). Result is size $k$.
2.  Compute $y = A z$ (Cost: $2nk$). Result is size $n$.
**Total Cost:** $2k(n+m)$ vs Dense $O(nm)$.

## 2. Matrix-Matrix Multiplication (MMM)
To compute $M_{prod} = M_1 M_2$ where $M_1 = A_1 B_1^T$ and $M_2 = A_2 B_2^T$:
Use the "Inner Kernel" trick:
$$M_{prod} = A_1 \underbrace{(B_1^T A_2)}_{\text{Kernel } K} B_2^T$$
1.  Compute Kernel $K = B_1^T A_2$ (Size $k \times k$).
2.  Multiply $A_{new} = A_1 K$ OR $B_{new}^T = K B_2^T$.
**Result:** The product is still a Rank-k matrix (specifically, rank is $\min(k_1, k_2)$).
**Total Cost:** $O(k^2 n)$ (Linear in $n$).

### Links
* **Prerequisite:** [[Rank-k Matrix Representation]]
* **Used In:** [[Algorithm - H-Matrix Matrix Multiplication (MMM)]]
* **Tags:** #algorithms #arithmetic

---
*Reference: Lecture Script Page 6 (Section 2.2)*