---
tags: [statistics, theorems, linear-regression, estimators]
aliases: [Theorem 3.7, OLS Unbiasedness, OLS Covariance]
created: 2026-03-10
---
# Theorem 3.7 - Unbiasedness and Covariance of OLS

## Motivation
[[Ordinary Least Squares (OLS)]] is fundamentally a geometric operation (finding the closest point on a plane). This theorem exists to prove that this pure geometry possesses valid, rigorous statistical properties. It guarantees that the geometric optimization actually hits the true underlying data-generating parameters *on average*, and provides the exact mathematical shape of the uncertainty (covariance matrix) around those estimates.

## The Theorem
Assume a [[Linear Model]] $Y = A\gamma + \varepsilon$ where $E[\varepsilon_i] = 0$ and $Var[\varepsilon_i] = \sigma^2$ for all $i \in \{1,\dots,n\}$, and the errors are uncorrelated.

**a) Unbiasedness of Coefficients:**
The least squares estimator $\hat{\gamma} = (A^T A)^{-1}A^T Y$ is an unbiased estimator for the true parameter vector $\gamma$
$$E[\hat{\gamma}] = \gamma$$

**b) Covariance and Noise Estimation:**
The covariance matrix of the estimator is determined strictly by the underlying noise $\sigma^2$ and the design matrix $A$
$$Cov(\hat{\gamma}) = \sigma^2(A^T A)^{-1}$$
Furthermore, if $n > k+1$, the corrected sum of squared residuals $\hat{\sigma}^2 = \frac{1}{n-k-1}\|\hat{\varepsilon}\|^2$ is an unbiased estimator for the true variance $\sigma^2$:
$$E[\hat{\sigma}^2] = \sigma^2$$

## Rigorous Proof

### Proof of Part A (Unbiasedness)
First, express $\hat{\gamma}$ in terms of the true $\gamma$ and the error vector $\varepsilon$:
$$\hat{\gamma} = (A^T A)^{-1}A^T(A\gamma + \varepsilon) = \gamma + (A^T A)^{-1}A^T\varepsilon$$ 
Since $E[\varepsilon] = 0$ and $A$ is deterministic:
$$E[\hat{\gamma}] = \gamma + (A^T A)^{-1}A^T E[\varepsilon] = \gamma + \mathbf{0} = \gamma$$

### Proof of Part B (Covariance Matrix)
Because the errors are homoscedastic and uncorrelated, their covariance matrix is $Cov(\varepsilon) = \sigma^2 I_n$.
Applying affine transformation rules to $\hat{\gamma} = \gamma + (A^T A)^{-1}A^T\varepsilon$:
$$Cov(\hat{\gamma}) = (A^T A)^{-1}A^T Cov(\varepsilon) ((A^T A)^{-1}A^T)^T$$ 
$$= (A^T A)^{-1}A^T (\sigma^2 I_n) A(A^T A)^{-1}$$
$$= \sigma^2 (A^T A)^{-1}A^T A(A^T A)^{-1} = \sigma^2(A^T A)^{-1}$$

### Proof of Part B (Variance Estimator)
To prove $E[\hat{\sigma}^2] = \sigma^2$, we analyze the expected squared norm of the residuals. Using [[Lemma 3.6 - Projection and Annihilator Matrices]], we know $\hat{\varepsilon} = (I_n - A(A^T A)^{-1}A^T)\varepsilon$.
$$E[\|\hat{\varepsilon}\|^2] = E[\varepsilon^T(I_n - A(A^T A)^{-1}A^T)^T(I_n - A(A^T A)^{-1}A^T)\varepsilon]$$
Because the annihilator matrix is idempotent and symmetric, this simplifies to:
$$= E[\varepsilon^T(I_n - A(A^T A)^{-1}A^T)\varepsilon]$$
Applying the [[Trace of a Matrix|cyclic trace property]] and substituting $E[\varepsilon \varepsilon^T] = \sigma^2 I_n$:
$$= \sigma^2 trace(I_n - A(A^T A)^{-1}A^T)$$
$$= \sigma^2 trace(I_n) - \sigma^2 trace(A(A^T A)^{-1}A^T)$$
$$= \sigma^2 n - \sigma^2 trace(A^T A(A^T A)^{-1})$$$$= \sigma^2 n - \sigma^2 trace(I_{k+1}) = \sigma^2(n - k - 1)$$
Therefore, $E[\frac{1}{n-k-1}\|\hat{\varepsilon}\|^2] = \sigma^2$

---
**Connections:**
* Validates the $n-p-1$ denominator rule found in [[Ordinary Least Squares (OLS)]].