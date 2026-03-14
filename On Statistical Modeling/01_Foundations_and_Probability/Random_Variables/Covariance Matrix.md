---
tags: [statistics, foundations, linear-algebra, covariance]
aliases: [Variance-Covariance Matrix, Dispersion Matrix]
created: 2026-03-05

---

> [!abstract] Definition
> The Covariance Matrix is the multi-dimensional equivalent of variance. For a [[Random Vector]] $X = (X_1, \dots, X_n)^T$ whose components have finite second moments, the covariance matrix, denoted $\Sigma$ or $Cov(X)$, is an $n \times n$ matrix defined as the expected value of the outer product of the mean-centered vector:
>
> $$Cov(X) = E\left[(X - E[X])(X - E[X])^T\right]$$
>
> Element-wise, the entry in the $i$-th row and $j$-th column represents the scalar covariance between the $i$-th and $j$-th components of the vector:
> $$Cov(X)_{i,j} = Cov(X_i, X_j) = E[(X_i - E[X_i])(X_j - E[X_j])]$$
>
> Below is a visualization in Matrix Format - 
>
> $$\Sigma = \begin{bmatrix} \text{Var}(X_1) & \text{Cov}(X_1, X_2) & \cdots & \text{Cov}(X_1, X_n) \\ \text{Cov}(X_2, X_1) & \text{Var}(X_2) & \cdots & \text{Cov}(X_2, X_n) \\ \vdots & \vdots & \ddots & \vdots \\ \text{Cov}(X_n, X_1) & \text{Cov}(X_n, X_2) & \cdots & \text{Var}(X_n) \end{bmatrix}$$
>

## Intuition

If a random vector describes a point cloud in multi-dimensional space, the expectation vector $E[X]$ tells you where the *center* of the cloud is, while the covariance matrix tells you the *shape* and *orientation* of the cloud. 
* The **main diagonal** contains the individual variances of each variable ($Var(X_i)$), dictating how far the cloud stretches along each axis.
* The **off-diagonals** contain the covariances, dictating how the variables tilt or correlate with one another. If an off-diagonal is $0$, those two specific axes are orthogonal (uncorrelated).

## Properties / Assumptions

1. **Symmetry:** Because $Cov(X_i, X_j) = Cov(X_j, X_i)$, the matrix is perfectly symmetric across its main diagonal: $Cov(X) = Cov(X)^T$.
2. **Positive Semi-Definiteness:** For any constant vector $a \in \mathbb{R}^n$, the variance of the linear combination $a^T X$ must be non-negative. Therefore:
   $$Var(a^T X) = a^T Cov(X) a \ge 0$$
3. **Affine Transformations:** If $Y = AX + b$ (where $A$ is a constant matrix and $b$ is a constant vector), the covariance matrix shifts strictly multiplicatively (the constant $b$ does not affect spread):



---
**Connections
* If all off-diagonal elements are exactly zero, the components are [[Uncorrelated Random Vectors]].
* It is the primary scale and orientation parameter for the [[Multivariate Normal Distribution]].
* In a [[Gaussian Linear Model]], the covariance matrix of the error vector $\epsilon$ is assumed to be $\sigma^2 I_n$ (a scaled identity matrix), meaning errors are homoscedastic and uncorrelated.