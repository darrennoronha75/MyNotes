---
tags: [statistics, distributions, sampling-distributions, anova]
aliases: [Fisher-Snedecor distribution, F-ratio]
created: 2026-03-04
---
# F-Distribution

## Definition
The F-distribution is a continuous, strictly positive probability distribution used extensively for testing hypotheses about the equality of multiple variances. 

Mathematically, it is defined as the ratio of two independent [[Chi-Squared Distribution|Chi-Squared variables]] ($U$ and $V$), where each has been divided by its respective degrees of freedom ($d_1$ and $d_2$):
$$F = \frac{U / d_1}{V / d_2} \sim F(d_1, d_2)$$

## Properties
* **Parameters:** It is defined by two shape parameters: the numerator degrees of freedom ($d_1$) and the denominator degrees of freedom ($d_2$).
* **Domain & Shape:** Like the $\chi^2$ distribution, it is bounded at zero ($[0, \infty)$) and is strongly right-skewed. 



## Intuition
If you take two random samples from the exact same normally distributed population and calculate their sample variances, the ratio of those two variances will follow an F-distribution. If the populations are identical, the expected value of the F-ratio is approximately $1$. If the ratio is massively larger than $1$, it is mathematically indicative that the top variance is fundamentally different from the bottom variance.

---
**Connections:**
* The F-distribution is the core null distribution for the [[Analysis of Variance (ANOVA)]] framework.
* In multiple linear regression, the overall significance of the [[Coefficient of Determination (R-squared)]] is evaluated using this distribution.