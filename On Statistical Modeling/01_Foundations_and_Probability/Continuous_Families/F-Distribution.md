---
tags: [statistics, distributions, sampling-distributions, anova]
aliases: [Fisher-Snedecor distribution, F-ratio]
created: 2026-03-04

---

> [!abstract] Definition
> The F-distribution is a continuous, strictly positive probability distribution used extensively for testing hypotheses about the equality of multiple variances. 
>
> Mathematically, it is defined as the ratio of two independent [[Chi-Squared Distribution|Chi-Squared variables]] ($U$ and $V$), where each has been divided by its respective degrees of freedom ($d_1$ and $d_2$):
> $$F = \frac{U / d_1}{V / d_2} \sim F(d_1, d_2)$$

### Rigorous Formulation

Let $Z_1 \sim \chi^2_{m_1}$ and $Z_2 \sim \chi^2_{m_2}$ be independent [[Chi-Squared Distribution|chi-square random variables]]. A random variable $X$ follows an F-distribution with $m_1$ and $m_2$ degrees of freedom if it has the exact same distribution as the ratio of these variables divided by their degrees of freedom:

$$X = \frac{Z_1 / m_1}{Z_2 / m_2} \sim F_{m_1, m_2}$$

## Properties

* **Parameters:** It is defined by two shape parameters: the numerator degrees of freedom ($d_1$) and the denominator degrees of freedom ($d_2$).
* **Domain & Shape:** Like the $\chi^2$ distribution, it is bounded at zero ($[0, \infty)$) and is strongly right-skewed. 

## Intuition

If you take two random samples from the exact same normally distributed population and calculate their sample variances, the ratio of those two variances will follow an F-distribution. If the populations are identical, the expected value of the F-ratio is approximately $1$. If the ratio is massively larger than $1$, it is mathematically indicative that the top variance is fundamentally different from the bottom variance.

![[FDist_Lesson32_Drawing04a.gif]]

---
**Connections:**
* The F-distribution is the core null distribution for the [[Analysis of Variance (ANOVA)]] framework.
* In multiple linear regression, the overall significance of the [[Coefficient of Determination (R-squared)]] is evaluated using this distribution.