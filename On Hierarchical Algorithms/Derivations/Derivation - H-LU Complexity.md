
## The Algorithm
The H-LU decomposition is recursive:
1.  **Recurse:** $L_{11}, U_{11} \leftarrow H\text{-}LU(A_{11})$
2.  **Triangular Solve:** Compute $U_{12}$ and $L_{21}$ (Forward/Backward substitution).
3.  **Schur Complement:** $S = A_{22} - L_{21} \cdot U_{12}$ (Formatted Multiplication & Addition).
4.  **Recurse:** $L_{22}, U_{22} \leftarrow H\text{-}LU(S)$.

## Complexity Analysis
The cost is dominated by the **Schur Complement** step (Matrix Multiplication $L_{21} \cdot U_{12}$).
Since H-Matrix multiplication costs $\mathcal{O}(n \log^2 n)$, the total complexity sums to:
$$N_{LU}(n) = \mathcal{O}(k^2 n \log^2 n)$$

## Exact Constant
The lecture notes derive the specific constant for the H-LU operation:
$$N_{LU}(p) \approx \frac{21}{4} n \log_2^2 n + \dots$$
* **Comparison:**
    * **Inversion:** $\approx 12.5 n \log^2 n$.
    * **LU:** $\approx 5.25 n \log^2 n$.
* **Conclusion:** LU decomposition is roughly **2x faster** than explicit inversion and numerically more stable.

### Links
* **Algorithm:** [[Algorithm - Hp-LU Decomposition]]
* **Uses:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
* **Tags:** #derivations #complexity #lu-decomposition

---
[cite_start]*Reference: Lecture Script Page 22, Section 3.8 [cite: 3450-3459]*