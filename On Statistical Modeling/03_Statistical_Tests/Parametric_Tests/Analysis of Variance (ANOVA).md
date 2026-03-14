---
tags: [statistics, statistical-tests, parametric, anova]
aliases: [ANOVA, One-Way ANOVA, F-Test]
created: 2026-03-04

---

> [!abstract] Definition
> Analysis of Variance (ANOVA) is a parametric test used to compare the means of three or more independent groups ($J \ge 3$). It evaluates the Null Hypothesis ($H_0: \mu_1 = \mu_2 = \dots = \mu_J$) by analyzing the variance *between* the group means relative to the background variance *within* the groups.
>

## The Test Statistic (F-Statistic)

ANOVA utilizes the [[F-Distribution]] by constructing a ratio of Mean Squares:

$$F_{obs} = \frac{\text{Mean Square Between (Explained)}}{\text{Mean Square Within (Unexplained)}}$$

* **Numerator (MSB):** Measures the squared distance of each group mean from the grand mean. $df = J - 1$.
* **Denominator (MSW):** Measures the squared distance of individual points from their specific group mean (the background noise). $df = N - J$.

$$F_{obs} = \frac{\frac{\sum (\bar{\mu} - \mu_j)^2}{(J-1)}}{\frac{\sum (Y_i - Y_{ij})^2}{(N-J)}}$$

> [!warning] Strict Assumption
> 1. **Normality:** Residuals within each group must follow a normal distribution.
> 2. **Homoscedasticity:** The variances in all groups must be identical ($\sigma_1^2 = \sigma_2^2 = \dots = \sigma_J^2$).
> 3. **Independence:** Observations must be entirely independent.
>

---
**Connections:**
* The mathematical justification for splitting the variance in this manner is the [[On Statistical Modeling/Definitions/Hypothesis Testing Framework/ANOVA/Law of Total Variance]].
* ANOVA is mathematically identical to a [[Gaussian Linear Model]] utilizing dummy variables.