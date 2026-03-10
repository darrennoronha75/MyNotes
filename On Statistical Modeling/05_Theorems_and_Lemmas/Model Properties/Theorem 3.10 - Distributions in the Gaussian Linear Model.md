---
tags: [statistics, theorems, linear-regression, stub]
aliases: [Gaussian Chi Squared, Residual Chi Squared]
created: 2026-03-04
---
## Motivation

Before establishing any hypothesis tests, we must prove the exact probability distributions of our geometric OLS estimators. This theorem mathematically guarantees that if the underlying noise is Gaussian, the coefficient estimates ($\hat{\gamma}$) and the residuals ($\hat{\varepsilon}$) not only follow exact Normal and Chi-squared distributions, but are strictly independent of each other.

> [!info] **Theorem 3.10**
> Consider a Gaussian linear model $Y = A\gamma + \varepsilon$ with $\varepsilon \sim \text{Normal}(0, \sigma^2 I_n)$.
> **a)** The random vectors $\hat{\gamma}$ and $\hat{\varepsilon}$ are independent and satisfy:
> * $\hat{\gamma} \sim \text{Normal}(\gamma, \sigma^2(A^T A)^{-1})$
> * $\hat{\varepsilon} \sim \text{Normal}(0, \sigma^2(I_n - A(A^T A)^{-1}A^T))$
> 
> **b)** If $n > k + 1$, the scaled squared residuals follow a Chi-Squared distribution:
> * $\frac{\|\hat{\varepsilon}\|^2}{\sigma^2} \sim \chi^2_{n-k-1}$

## Rigorous Proof

### Proof of Part A (Distributions and Independence)
Recall the affine transformations from the unobservable errors:
$\hat{\gamma} = \gamma + (A^T A)^{-1}A^T \varepsilon$
$\hat{\varepsilon} = (I_n - A(A^T A)^{-1}A^T)\varepsilon$

Because they are linear transformations of the normal vector $\varepsilon$, both are normal random vectors. Their expectations are trivially $\gamma$ and $0$.
Their covariance matrices are:
$$Cov(\hat{\gamma}) = (A^T A)^{-1}A^T (\sigma^2 I_n) A(A^T A)^{-1} = \sigma^2 (A^T A)^{-1}$$
$$Cov(\hat{\varepsilon}) = (I_n - \Pi_L) (\sigma^2 I_n) (I_n - \Pi_L)^T = \sigma^2 (I_n - \Pi_L)^2 = \sigma^2(I_n - \Pi_L)$$

**Proving Independence via Cross-Covariance:**
We calculate the covariance between the two vectors:
$$Cov(\hat{\gamma}, \hat{\varepsilon}) = E[(\hat{\gamma} - \gamma)(\hat{\varepsilon} - 0)^T]$$
$$= E[((A^T A)^{-1}A^T \varepsilon) ((I_n - A(A^T A)^{-1}A^T)\varepsilon)^T]$$
$$= (A^T A)^{-1}A^T E[\varepsilon \varepsilon^T] (I_n - A(A^T A)^{-1}A^T)$$
$$= \sigma^2 (A^T A)^{-1}A^T (I_n - A(A^T A)^{-1}A^T)$$
Distributing the terms:
$$= \sigma^2 \left( (A^T A)^{-1}A^T - (A^T A)^{-1}A^T A (A^T A)^{-1}A^T \right)$$
$$= \sigma^2 \left( (A^T A)^{-1}A^T - I_{k+1} (A^T A)^{-1}A^T \right) = \mathbf{0}$$
Because they are uncorrelated and jointly multivariate normal, they are perfectly independent by [[Independence of Uncorrelated Normal Variables|Lemma 2.2]].

### Proof of Part B (The Chi-Squared Distance)

Let $u_1, \dots, u_n \in \mathbb{R}^n$ be an orthonormal base such that $u_1, \dots, u_{k+1}$ strictly generate the linear subspace $L$. Let $O$ be the matrix containing these column vectors. Because it is orthonormal, $O^T O = I_n$ and $O O^T = I_n$.

The rotated error vector $O\varepsilon \sim \text{Normal}(0, \sigma^2 I_n)$ has the exact same distribution as $\varepsilon$. Multiplication by $O^T$ does not change a vector's norm.

$$\|\hat{\varepsilon}\|^2 = \|(I_n - \Pi_L)\varepsilon\|^2 \stackrel{d}{=} \|(I_n - \Pi_L)O\varepsilon\|^2 = \|O^T(I_n - \Pi_L)O\varepsilon\|^2$$

Because $\Pi_L u_i = u_i$ for $i \in \{1,\dots,k+1\}$ and $0$ otherwise, the matrix $O^T \Pi_L O$ is a diagonal matrix with exactly $k+1$ ones and the rest zeros.

Thus, $O^T(I_n - \Pi_L)O$ is a diagonal matrix where the first $k+1$ elements are $0$ and the remaining $n - (k+1)$ elements are $1$. 

This isolates exactly $n-k-1$ independent standard normal variables:
$$\|\hat{\varepsilon}\|^2 \stackrel{d}{=} \sum_{i=k+2}^n \varepsilon_i^2 \implies \frac{\|\hat{\varepsilon}\|^2}{\sigma^2} \sim \chi^2_{n-k-1}$$



---
**Connections:**
* The proven independence is mechanically required to construct the $t$-statistic in [[Corollary 3.11 - t-Test for Linear Combinations]].