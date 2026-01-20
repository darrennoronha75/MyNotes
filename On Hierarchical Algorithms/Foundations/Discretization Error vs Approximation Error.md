## Concept
When solving continuous physical problems (like integral equations) numerically, we encounter two distinct types of errors. H-Matrices introduce the second type to reduce computational cost.

## 1. Discretization Error ($\epsilon_{disc}$)
The error introduced by replacing a continuous operator (infinite dimensional) with a finite matrix (dimension $n$).
* **Source:** Grid resolution ($h$), basis functions.
* **Behavior:** decreases as $n \to \infty$ (e.g., $\mathcal{O}(n^{-m/d})$).

## 2. Approximation Error ($\epsilon_{approx}$)
The error introduced by replacing the exact dense matrix $M$ with a compressed H-Matrix $M_{\mathcal{H}}$.
* **Source:** Rank truncation (SVD), block approximations.
* **Behavior:** Controlled by the rank $k$.

## The Balance Strategy
The goal of Hierarchical Algorithms is to choose the rank $k$ such that the approximation error is roughly equal to the discretization error:
$$
\epsilon_{approx} \approx \epsilon_{disc}
$$
There is no point in computing the matrix entries to 16-digit precision if the model itself is only 10% accurate due to a coarse grid. 

### Intuition
If you measure a room with a ruler that has $\pm 1$cm error (Discretization), it is a waste of time to calculate the area using $\pi = 3.1415926535...$ (Exact Arithmetic). Using $\pi \approx 3.14$ (Approximation) is faster and doesn't make your answer any "worse" than it already was.

### Links
* **Related:** [[The Curse of Dimensionality]]
* **Applied In:** [[Rank-k Matrix Representation]]
* **Tags:** #foundations #error-analysis

