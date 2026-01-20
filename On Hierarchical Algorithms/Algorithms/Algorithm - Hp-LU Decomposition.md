## The Goal
Compute $A \approx L \cdot U$ where $L$ and $U$ are H-Matrices, reducing complexity from $\mathcal{O}(n^3)$ to $\mathcal{O}(n \log^2 n)$.

## The Recursive Process (with Visuals)
We divide the matrix $A$ into $2 \times 2$ blocks and process them in four distinct steps.
$$
\begin{pmatrix} A_{11} & A_{12} \\ A_{21} & A_{22} \end{pmatrix} = \begin{pmatrix} L_{11} & 0 \\ L_{21} & L_{22} \end{pmatrix} \cdot \begin{pmatrix} U_{11} & U_{12} \\ 0 & U_{22} \end{pmatrix}
$$

### Step 1: Factorize the Pivot Block ($A_{11}$)
We recurse into the top-left block to find its $L$ and $U$ factors.
$$A_{11} = L_{11} \cdot U_{11}$$

### Step 2: Forward Substitution (Find $U_{12}$)
We need $L_{11} U_{12} = A_{12}$. Since we now know $L_{11}$, we solve for $U_{12}$.
$$U_{12} = L_{11}^{-1} A_{12}$$
* **Operation:** H-Matrix Forward Substitution.

### Step 3: Backward Substitution (Find $L_{21}$)
We need $L_{21} U_{11} = A_{21}$. Since we know $U_{11}$, we solve for $L_{21}$.
$$L_{21} = A_{21} U_{11}^{-1}$$
* **Operation:** H-Matrix Backward Substitution.


### Step 4: Schur Complement & Recurse ($A_{22}$)
We need $L_{21} U_{12} + L_{22} U_{22} = A_{22}$.
We compute the "Schur Complement" $S = A_{22} - L_{21} U_{12}$ and then factorize it recursively.
$$S = L_{22} \cdot U_{22}$$
* **Operation:** Formatted Multiplication ($L_{21} \cdot U_{12}$) followed by Formatted Subtraction.


## Complexity Analysis
The total cost is dominated by the Schur Complement update (Step 4), which involves H-Matrix multiplication.
$$N_{LU}(n) \approx \frac{21}{4} n \log_2^2 n + \dots$$
It is roughly **2x faster** than H-Matrix Inversion and more numerically stable.

### Links
* **Uses:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
* **Uses:** [[Lemma - Schur Complement]]
* **Tags:** #algorithms #h-lu #matrix-visualization
