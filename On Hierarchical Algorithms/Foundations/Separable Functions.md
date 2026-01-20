## Definition
A function $g: D \times D \to \mathbb{R}$ is called **separable** (or degenerate) if it can be represented as a finite sum of products involving the variables $x$ and $y$ independently:
$$g(x, y) = \sum_{\nu=1}^{k} a_{\nu}(x) \cdot b_{\nu}(y)$$
* $k$: The **Separation Rank** of the function.
* $a_\nu, b_\nu$: Functions depending *only* on one variable.

## Intuition: The "Split"
Imagine $x$ is your "Row Index" and $y$ is your "Column Index".
* **Mixed (Bad):** $g(x, y) = \sin(x + y)$.
    * To calculate this, you need $x$ and $y$ *at the same time*. You cannot pre-calculate a part just knowing $x$.
* **Separable (Good):** $g(x, y) = \sin(x)\cos(y) + \cos(x)\sin(y)$.
    * We have split the complex interaction into "Terms of $x$" multiplied by "Terms of $y$".

## Connection to Matrices
If a kernel function is separable with rank $k$, its corresponding discrete matrix has **Rank at most $k$**.
We can rewrite the matrix $G$ as an outer product:
$$G = A \cdot B^T$$
1.  **Matrix A:** Columns contain the discretized values of $a_\nu(x)$.
2.  **Matrix B:** Columns contain the discretized values of $b_\nu(y)$.

## Methods to achieve Separation
Most physical kernels (like $\log|x-y|$) are not naturally separable. We approximate them as separable functions using:
1.  **[[Taylor Series Approximation]]:** Uses derivatives (Analytical).
2.  **[[Lagrange Interpolation]]:** Uses grid points (Numerical).

### Links
* **Prerequisite for:** [[Rank-k Matrix Representation]]
* **Tags:** #foundations #definitions #math-basics

---
*Reference: Lecture Script Page 31, Definition 4.1 and Page 26*