---
tags: [statistics, theorems, variance]
aliases: [Variance Decomposition, Law of Total Variance]
created: 2026-03-04
---
# Law of Total Variance

## Definition
The Law of Total Variance is a foundational theorem that partitions the total variance of a random variable $Y$ into two distinct, mathematically interpretable components conditioned on another variable $X$.

$$Var(Y) = E[Var(Y|X)] + Var(E[Y|X])$$

## Intuition (The ANOVA Perspective)
When $X$ represents a categorical grouping variable (e.g., different experimental treatments), this theorem explains the entire mechanical foundation of [[Analysis of Variance (ANOVA)]]:
* **$E[Var(Y|X)]$ (Unexplained Variance):** The average of the group variances. Because ANOVA assumes homoscedasticity, the variance strictly within any group is just the background noise ($\sigma^2$).
* **$Var(E[Y|X])$ (Explained Variance):** The variance of the group averages. This is the variance of the true group means ($\mu_j$). It measures how far the centers of the groups are spread apart from the grand mean.

Substituting these concepts gives the practical translation:
$$Var(Y) = \sigma^2 + Var(\mu_j)$$

## The Null Hypothesis Link
If the Null Hypothesis is true (all group means are identical), the group means have zero spread, causing $Var(\mu_j)$ to collapse to zero. Therefore, under $H_0$, $Var(Y) = \sigma^2$. 

---
**Connections:**
* This theorem directly constructs the numerator (Explained) and denominator (Unexplained) used to calculate the F-Statistic.