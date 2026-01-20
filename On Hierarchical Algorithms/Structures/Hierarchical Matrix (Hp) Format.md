## Definition: The Model $\mathcal{H}_p$
The $\mathcal{H}_p$ format is a recursive block structure used to model the matrix arising from the 1D integral equation. It is defined recursively with respect to the depth parameter $p$ (where matrix size $n = 2^p$).

**1. Base Case ($p=0$):**
The matrix is of size $1 \times 1$ and is stored as a standard dense value.
$$M \in \mathbb{R}^{1 \times 1} \text{ is an } \mathcal{H}_0 \text{-matrix.}$$

**2. Recursive Step ($p > 0$):**
A matrix $M \in \mathbb{R}^{n \times n}$ is an $\mathcal{H}_p$-matrix if, in the block partition:
$$
M = \begin{pmatrix} M_{11} & M_{12} \\ M_{21} & M_{22} \end{pmatrix}
$$
* **Diagonal Blocks ($M_{11}, M_{22}$):** Are of type $\mathcal{H}_{p-1}$ (Recursive).
* **Off-Diagonal Blocks ($M_{12}, M_{21}$):** Are of type $\mathcal{R}(k, n/2, n/2)$ (Low-Rank).

*Note: In the specific model problem analysis, we often assume the "easy case" where **rank $k=1$**.*

## Structure Visual
The recursive definition leads to a structure that is refined towards the diagonal:
$$
\mathcal{H}_p = \begin{pmatrix} \mathcal{H}_{p-1} & \mathcal{R}_{p-1} \\ \mathcal{R}_{p-1} & \mathcal{H}_{p-1} \end{pmatrix}
$$


## Structural Complexity (Block Counting)
We can calculate exactly how many blocks of each type exist to prove the sparsity.
Let $n = 2^p$.

**1. Number of Low-Rank Blocks ($\mathcal{R}$):**
* Level $p$ (Root): 2 blocks.
* Level $p-1$: $2 \times 2 = 4$ blocks.
* Level $j$: $2^{p-j} \times 2$ blocks.
* **Total:** $\sum_{j=1}^{p} 2^j = 2^{p+1} - 2 = 2n - 2$.

**2. Number of Dense Leaf Blocks ($\mathcal{H}_0$):**
* These only exist at the very bottom (diagonal).
* **Total:** $2^p = n$.

**Conclusion:** The total number of blocks scales linearly with $n$ ($\approx 3n$), rather than quadratically.

### Links
* **Analyzed In:** [[Theorem - Storage Cost of H-Matrix]]
* **Used For:** [[Algorithm - Hp-Matrix Vector Multiplication (MVM)]]
* **Used For:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
* **Tags:** #structures #h-matrix #model-problem
