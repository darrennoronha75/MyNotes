---
tags: [statistics, linear-regression, hypothesis-testing, corollary]
aliases: [Global F-Test, Overall Model Significance, Corollary 3.15]
created: 2026-03-10

---

---

Before analyzing specific slopes, we must ask the absolute baseline question: *Is this multivariable model statistically better than just predicting the average $\bar{Y}$?* If this test fails, the entire model is indistinguishable from random noise, and interpreting specific coefficients is mathematically invalid.

## The Hypothesis Framework

We test the null hypothesis that every single predictor is useless, meaning all coefficients (except the intercept) are zero.
* $H_0: \gamma_1 = \dots = \gamma_k = 0$
* $H_1: \gamma_j \neq 0$ for some $j \in \{1,\dots,k\}$

> [!info] **Global F-Test Formulation**
> The decision rule $\varphi(Y)$ is a level-$\alpha$ test:
> $$\varphi(Y) = \begin{cases} \text{cannot reject}, & \frac{(n-k-1)(\text{TSS} - \|\hat{\varepsilon}\|^2)}{k\|\hat{\varepsilon}\|^2} < F_{k, n-k-1, 1-\alpha} \\ \text{reject}, & \frac{(n-k-1)(\text{TSS} - \|\hat{\varepsilon}\|^2)}{k\|\hat{\varepsilon}\|^2} \ge F_{k, n-k-1, 1-\alpha} \end{cases}$$

## The Derivation

This test is a direct, extreme application of the [[Partial F-Test (Corollary 3.14)]].
We define our preserved subset $J = \{0\}$, meaning we only keep the intercept $\gamma_0$.
As proven in [[Sample Mean as an OLS Estimator]], the squared norm of the residuals for an intercept-only model is exactly the Total Sum of Squares ($\|\hat{\varepsilon}_{\{0\}}\|^2 = \text{TSS}$).
By substituting TSS for the reduced model error, and noting that the reduced model has exactly $|J| = 1$ parameter, the denominator degrees of freedom $(k+1-|J|)$ perfectly simplifies to $k$.

---
**Connections:**
* Always evaluated at the very bottom of the R `summary(lm())` output to validate the [[Coefficient of Determination (R-squared)]].