---
tags: [statistics, theorems, foundations]
aliases: [Mean-Variance Independence]
created: 2026-03-04

---

> [!abstract] Definition
> For data generated exclusively by a Gaussian (Normal) process, the sample mean ($\bar{X}$) and the sample variance ($S^2$) are completely **statistically independent**. Knowing the value of one provides zero mathematical information about the value of the other.
>

## The Apparent Paradox

This independence feels counterintuitive because the formula for sample variance explicitly contains the sample mean:

$$S^2 = \frac{1}{n-1} \sum_{i=1}^n (X_i - \bar{X})^2$$
How can $S^2$ be independent of $\bar{X}$ if $\bar{X}$ is used to calculate it?

## The Geometric Resolution

The paradox is resolved by separating *algebraic dependence* from *statistical independence*:
1. **Algebraic necessity:** We must use $\bar{X}$ in the formula simply as a physical anchor point to measure distance. Spread cannot be measured without establishing a center.
2. **Statistical freedom:** Because the [[Normal Distribution]] is perfectly symmetrical and featureless, shifting the entire curve left or right along the number line (changing the mean) does absolutely nothing to warp, stretch, or squash its width (the variance). 

If a sample mean is $1,000,000$, there are no mathematical clues as to whether the data is tightly packed (variance of $1$) or wildly dispersed (variance of $10,000$).

---
**Connections:**
* This strict independence is the core mathematical requirement that allows us to construct the [[Student's t-Distribution]] as a ratio of a Normal variable and a Chi-Squared variable.