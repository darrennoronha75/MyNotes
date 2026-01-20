# Algorithms/Reduced QR Decomposition

## Definition
For a "tall and skinny" matrix $A \in \mathbb{R}^{n \times m}$ ($n > m$), the full $n \times n$ matrix $Q$ is wasteful. We compute the **Reduced** (or Thin/Compressed) QR:
$$A = Q_m \cdot R_m$$
* **$Q_m \in \mathbb{R}^{n \times m}$:** Contains only the first $m$ orthonormal columns of $Q$.
    * Property: $Q_m^T Q_m = I_m$ (Orthonormal columns), but $Q_m Q_m^T \neq I_n$ (Projector).
* **$R_m \in \mathbb{R}^{m \times m}$:** The small, square upper triangular block.

## Visualization (The Truncation)
We conceptually "chop off" the silent parts of the full decomposition.

**1. The Full Logic (Mental Model):**
$$
\underbrace{
\begin{pmatrix} \times & \times \\ \times & \times \\ \times & \times \\ \times & \times \end{pmatrix}
}_{A \; (n \times m)}
=
\left[
\begin{array}{cc|cc}
q & q & \color{gray} . & \color{gray} . \\
q & q & \color{gray} . & \color{gray} . \\
q & q & \color{gray} . & \color{gray} . \\
q & q & \color{gray} . & \color{gray} .
\end{array}
\right]
\cdot
\left[
\begin{array}{cc}
r & r \\
0 & r \\
\hline
\color{gray} 0 & \color{gray} 0 \\
\color{gray} 0 & \color{gray} 0
\end{array}
\right]
$$
* **Left Block:** $Q_{full}$ ($n \times n$). The gray part is orthogonal to $A$'s columns.
* **Right Block:** $R_{full}$ ($n \times m$). The gray part is pure zeros.

**2. The Reduced Setup (Actual Storage):**
We discard the gray zones because multiplying by the zero block yields nothing.
$$
\underbrace{
\begin{pmatrix} \times & \times \\ \times & \times \\ \times & \times \\ \times & \times \end{pmatrix}
}_{A \; (n \times m)}
=
\underbrace{
\begin{pmatrix} q & q \\ q & q \\ q & q \\ q & q \end{pmatrix}
}_{Q_m \; (n \times m)}
\cdot
\underbrace{
\begin{pmatrix} r & r \\ 0 & r \end{pmatrix}
}_{R_m \; (m \times m)}
$$
* **$Q_m$:** Same shape as $A$.
* **$R_m$:** Tiny square matrix.

## Detailed Complexity Analysis
The lecture notes provide a specific operation count for this reduced decomposition, which is critical for H-Matrix efficiency.

### 1. The Cost Formula
$$N_{QR} \approx 4nm^2$$
* **Why this number?** This accounts for the calculation of the Householder vectors and the accumulation of the matrix $Q_m$. (Note: Pure factorization is $2nm^2$, forming $Q$ explicitly adds cost).

### 2. Application in H-Matrices (The "Linear" Speedup)
In algorithms like **Algebraic Recompression**, we apply this to a rank-$l$ factor matrix $A \in \mathbb{R}^{n \times l}$.
* **Scenario:** $n$ is massive (cluster size), $l$ is tiny (rank, e.g., 10).
* **Substitution:** Set $m = l$.
* **Result:**
    $$\text{Cost} = 4nl^2$$
* **Interpretation:** The cost depends **linearly** on the large dimension $n$ ($\mathcal{O}(n)$).
    * Because $l^2$ is a small constant, this operation is computationally "cheap" compared to operations like full Matrix-Matrix multiplication or full SVD ($\mathcal{O}(n^3)$).

### 3. Stability Note
Using Reduced QR is the standard way to orthogonalize a low-rank basis before performing SVD. It acts as a "pre-conditioner" that shrinks the problem size for the expensive SVD step.

### Links
* **Used In:** [[Algorithm - Algebraic Recompression]]
* **Used In:** [[Algorithm - Formatted Agglomeration]]
* **Tags:** #algorithms #complexity #qr #h-matrices
