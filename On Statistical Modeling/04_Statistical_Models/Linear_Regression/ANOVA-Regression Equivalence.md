---
tags: [statistics, linear-regression, anova]
aliases: [ANOVA and Regression Equivalence, F-test Equivalence]
created: 2026-03-04
---
# ANOVA-Regression Equivalence

## Definition
[[Analysis of Variance (ANOVA)]] and the [[Gaussian Linear Model]] are mathematically identical frameworks operating under different historical vocabularies. ANOVA uses "Sum of Squares" for categorical groups, while Regression uses $R^2$ (explained variance) for continuous variables. Both yield the exact same F-Statistic.

## The Mathematical Translation
Both frameworks construct a ratio of Explained Variance to Unexplained Variance:
$$F = \frac{\text{Explained Variance / Model Degrees of Freedom}}{\text{Unexplained Variance / Error Degrees of Freedom}}$$

### 1. The ANOVA View
Focuses on the physical squared distances between group means ($J$) and individual points ($N$):
$$F = \frac{\frac{\sum (\bar{\mu} - \mu_j)^2}{(J-1)}}{\frac{\sum (Y_i - Y_{ij})^2}{(N-J)}}$$

### 2. The Regression View
Focuses on the proportion of variance successfully explained by the $p$ predictors in the model:
$$F = \frac{R^2 / p}{(1 - R^2) / (n - p - 1)}$$

## The Mapping
The components map onto one another flawlessly:
* **Numerator DF:** The number of categorical groups minus one ($J-1$) equals the exact number of dummy predictors ($p$) required to model them in a regression matrix.
* **Denominator DF:** Total observations minus groups ($N-J$) exactly matches total observations minus parameters ($n - p - 1$).
* **Variance Components:** The Sum of Squares Between is proportionally equivalent to $R^2$. The Sum of Squares Within is proportionally equivalent to the unexplained $(1 - R^2)$.

---
**Connections:**
* The resulting test statistic follows the exact same [[F-Distribution]].