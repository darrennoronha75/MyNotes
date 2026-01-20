
## Statement
The Frobenius norm $\|M\|_F$ of a Rank-k matrix $M = \sum_{\nu=1}^k a_\nu b_\nu^T$ can be computed efficiently without assembling the full matrix $M$.

## Formula
$$\|M\|_F = \sqrt{ \sum_{\nu=1}^k \sum_{\mu=1}^k \langle a_\nu, a_\mu \rangle \langle b_\nu, b_\mu \rangle }$$

## Complexity Analysis
* **Naive Approach (Build M):** $O(n^2)$ operations.
* **Efficient Approach (This Lemma):** $O(k^2 n)$ operations.
    * Requires computing $k^2$ dot products of length $n$.
    * Since $k \ll n$, this is effectively linear.

## Application
This lemma is crucial for:
1.  **Error Estimation:** Checking $\|M - M_{approx}\|_F$.
2.  **Stopping Criteria:** Used in [[Algorithm - Adaptive Cross Approximation (ACA)]].

### Links
* **Prerequisite:** [[Rank-k Matrix Representation]]
* **Used In:** [[Algorithm - Algebraic Recompression]], [[Stopping Criteria for ACA]]
* **Tags:** #calculations #norms

---
*Reference: Lecture Script Page 6 (Exercise 2.2)*