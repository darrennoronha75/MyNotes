## Definition
For any matrix $A \in \mathbb{R}^{n \times m}$ (with $n \ge m$), there exists a factorization:
$$A = Q \cdot R$$
* **$Q \in \mathbb{R}^{n \times n}$:** An orthogonal matrix ($Q^T Q = I$). Its columns form an orthonormal basis for $\mathbb{R}^n$.
* **$R \in \mathbb{R}^{n \times m}$:** An upper triangular matrix. If $A$ has full rank, the diagonal entries of $R$ can be chosen to be positive.

## Construction Methods & Complexities
The lecture notes identify three standard algorithms for computing this decomposition. While the general cost cited for compressed QR is $4nm^2$, the methods differ in operation count and stability:

### 1. Householder Transformations (Reflection)
* **Mechanism:** Multiplies $A$ by a sequence of orthogonal reflection matrices ($H_k = I - 2v_kv_k^T$) to "reflect" columns onto the main diagonal, zeroing out elements below it.
* **Complexity:** $\approx 2nm^2 - \frac{2}{3}m^3$ (for factorization only).
    * **Note:** This is the standard "stable" method used in libraries like LAPACK. It forms the basis for the cost estimate in the lecture notes.
* **Pros:** Numerically very stable.

### 2. Givens Rotations (Rotation)
* **Mechanism:** Uses rotation matrices to zero out entries **one by one**.
    $$G(i, k, \theta) = \begin{pmatrix} c & s \\ -s & c \end{pmatrix}$$
* **Complexity:** $\approx 3nm^2$ (50% more expensive than Householder).
* **Pros:** Highly efficient for **sparse** matrices or parallelization because it affects only two rows at a time. It allows selective zeroing of elements.

### 3. Gram-Schmidt Orthogonalization (Projection)
* **Mechanism:** Iteratively projects the $k$-th column of $A$ onto the orthogonal complement of the previous $k-1$ columns.
* **Complexity:** $\approx 2nm^2$.
* **Stability Warning:**
    * **Classical (CGS):** Unstable (orthogonality is lost due to rounding errors).
    * **Modified (MGS):** More stable, but still less robust than Householder.

### Links
* **Basis for:** [[Reduced QR Decomposition]]
* **Tags:** #foundations #linear-algebra #matrix-factorization
