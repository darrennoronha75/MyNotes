---
tags: [statistics, linear-regression, estimators]
aliases: [Example 3.8, OLS Base Case, Intercept-Only Model]
created: 2026-03-10
---
# Sample Mean as an OLS Estimator (Base Case k=0)

## Motivation
It is easy to get lost in high-dimensional matrix algebra. This base case serves as a crucial sanity check, linking the complex matrix operations of a General Linear Model back to the foundational statistics of 1D arrays. It mathematically proves that estimating a single sample mean is just the simplest possible form of linear regression.

## The Setup
Consider the special case where $k=0$. The model has no predictors, only a global intercept $\gamma_0$.
$$Y_i = \gamma_0 + \varepsilon_i \quad \text{for } i \in \{1,\dots,n\}$$
This simply describes $n$ uncorrelated random variables where $E[Y_i] = \gamma_0$.

## The Matrix Translation
We translate this simple scenario into our formal matrix architecture:
* **The Design Matrix ($A$):** Since there is only the intercept, $A$ is just an $n \times 1$ column vector of ones: $A = (1, \dots, 1)^T \in \mathbb{R}^n$.
* **The Gram Matrix ($A^T A$):** Multiplying a row of $n$ ones by a column of $n$ ones yields the scalar $n$.
* **The Target ($A^T Y$):** Multiplying the row of ones by the response vector $Y$ simply sums the elements: $A^T Y = \sum_{i=1}^n Y_i$.

## The Algebraic Collapse
We plug these collapsed matrices into the OLS estimator formula $\hat{\gamma} = (A^T A)^{-1}A^T Y$:
$$\hat{\gamma}_0 = (n)^{-1} \sum_{i=1}^n Y_i = \frac{1}{n} \sum_{i=1}^n Y_i = \bar{Y}$$
The complex matrix math perfectly yields the standard **sample mean**.

Furthermore, the residuals become $\hat{\varepsilon}_i = Y_i - \bar{Y}$. 
The unbiased variance estimator $\hat{\sigma}^2 = \frac{1}{n-k-1}\|\hat{\varepsilon}\|^2$ simplifies seamlessly (since $k=0$) to:
$$\hat{\sigma}^2 = \frac{1}{n-1} \sum_{i=1}^n (Y_i - \bar{Y})^2 = S^2$$
Which is the universally recognized formula for **sample variance**.

---
**Connections:**
* Validates the architecture established in the [[Matrix Formulation of OLS]].