---
tags: [statistics, theorems, asymptotic-theory, multivariate]
aliases: [Multivariate CLT]
created: 2026-03-04

---

> [!abstract] Definition (Theorem 2.4)
> The Multivariate Central Limit Theorem extends the standard [[Central Limit Theorem]] to multi-dimensional data. It states that the sum of i.i.d. random vectors converges to a [[Multivariate Normal Distribution]], regardless of the underlying distribution of the data.
>
> Let $(X_i)_{i \in \mathbb{N}}$ be i.i.d. random vectors in $\mathbb{R}^m$ such that their second moments are finite ($E[\|X_1\|^2] < \infty$). 
> Let $S_n = \sum_{i=1}^n X_i$. 
> Let $\Sigma = Cov(X_1)$ be the covariance matrix, and let $N \sim \text{Normal}(\mathbf{0}, \Sigma)$.
>
> Then, the standardized sum converges in distribution ([[Convergence in Distribution]]):
> $$\frac{S_n - nE[X_1]}{\sqrt{n}} \xrightarrow{d} N \quad \text{as } n \to \infty$$
>

---
**Connections:**
* This theorem is vital for deriving asymptotic hypothesis tests and confidence regions in the [[Gaussian Linear Model]] when multiple parameters are evaluated simultaneously.