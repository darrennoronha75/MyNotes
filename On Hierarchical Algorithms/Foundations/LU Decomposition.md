## Definition
The LU decomposition factors a square matrix $A$ into a **Lower triangular** matrix $L$ and an **Upper triangular** matrix $U$.
$$A = L \cdot U$$

### Visualization
$$
\underbrace{
\begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{pmatrix}
}_{A}
=
\underbrace{
\begin{pmatrix}
1 & 0 & 0 \\
l_{21} & 1 & 0 \\
l_{31} & l_{32} & 1
\end{pmatrix}
}_{L \text{ (Unit Lower)}}
\cdot
\underbrace{
\begin{pmatrix}
u_{11} & u_{12} & u_{13} \\
0 & u_{22} & u_{23} \\
0 & 0 & u_{33}
\end{pmatrix}
}_{U \text{ (Upper)}}
$$

## The Purpose
It transforms a hard problem (solving $Ax=b$) into two easy problems (solving triangular systems).
1.  **Forward Substitution:** Solve $L y = b$ (Solve top-down).
2.  **Backward Substitution:** Solve $U x = y$ (Solve bottom-up).

## Complexity
* **Dense Matrix:** $\mathcal{O}(n^3)$.
* **Storage:** $\mathcal{O}(n^2)$.
* **Issue:** For $n=10,000$, standard LU is too slow. We need the Hierarchical version.

### Links
* **Replaced by:** [[Algorithm - Hp-LU Decomposition]]
* **Tags:** #foundations #linear-algebra

---
*Reference: Lecture Script Page 2*