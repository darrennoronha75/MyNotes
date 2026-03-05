---
tags: [statistics, linear-regression, modeling]
aliases: [GLM, Linear Regression]
created: 2026-03-04
---
## Definition
The Gaussian Linear Model is a specific, restricted formulation of the standard [[Linear Model]]. It inherits the exact same structural matrix equation, but adds one strong parametric assumption regarding the probability distribution of the error term.

$Y = A\gamma + \varepsilon$

* **$Y$:** The $n \times 1$ response vector.
* **$A$:** The $n \times k$ [[Design Matrix]].
* **$\gamma$:** The $k \times 1$ parameter vector.
* **$\varepsilon$:** The $n \times 1$ error vector.

### The Gaussian Assumption
Unlike the base Linear Model (which only assumes $E[\varepsilon]=0$ and constant variance), this model assumes the unobservable error vector $\varepsilon$ perfectly follows a [[Multivariate Normal Distribution]]:
$$\varepsilon \sim \text{Normal}(\mathbf{0}, \sigma^2 I_n)$$

## Implications for the Response Vector ($Y$)
Because affine transformations of normal vectors remain perfectly normal, adding the deterministic component $A\gamma$ means the observed response vector itself is also normally distributed:
$$Y \sim \text{Normal}(A\gamma, \sigma^2 I_n)$$


## Why make this strict assumption?
While [[Ordinary Least Squares (OLS)]] does not require the Gaussian assumption simply to calculate the coefficient estimates geometrically, the Gaussian assumption mathematically "unlocks" exact statistical inference:

1. **Constructing the Likelihood Function:** It allows us to define a joint probability density function for the data, enabling [[Maximum Likelihood Estimation]]. Under this model, the MLE for $\gamma$ is algebraically identical to the OLS estimator. (See [[Gaussian MLE Theorem]]).
2. **Exact Distribution of Estimators:** It guarantees that our coefficient estimates ($\hat{\gamma}$) follow exact normal distributions in finite samples:
   $$\hat{\gamma} \sim \text{Normal}(\gamma, \sigma^2(A^TA)^{-1})$$
3. **Statistical Independence:** It guarantees that the coefficient estimates ($\hat{\gamma}$) and the residuals ($\hat{\varepsilon}$) are perfectly independent.
4. **Exact Hypothesis Testing:** It guarantees that the scaled sum of squared residuals strictly follows a [[Chi-Squared Distribution]] (See [[Gaussian Chi Squared Theorem]]). This allows us to perform exact finite-sample $F$-tests in [[Analysis of Variance (ANOVA)]] and [[Linear Hypothesis Testing]].

---
**Connections:**
* The mathematical equivalence of global testing in this model and ANOVA is detailed in [[ANOVA-Regression Equivalence]].
* If the normality assumption fails, the exact tests are invalid, but if the sample size $n$ is sufficiently large, we can often rely on asymptotic approximations powered by the [[Multivariate Central Limit Theorem]].