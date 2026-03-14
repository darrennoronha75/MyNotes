---
tags: [statistics, statistical-tests, parametric]
aliases: [2-Sample t-test, Independent Samples t-test, Welch's t-test]
created: 2026-03-04

---

> [!abstract] Definition
> The Two-Sample t-test compares two independent random samples to determine if they originate from populations with the exact same mean ($H_0: \mu_B - \mu_A = 0$).
>

## The Variance of the Difference

To test the difference $D = \bar{X}_B - \bar{X}_A$, we must understand its variance. Crucially, the variances of independent random variables *always add*, even when the variables are subtracted:

$$Var(D) = \frac{\sigma_B^2}{n_B} + \frac{\sigma_A^2}{n_A}$$

## Test Variants

### 1. Unequal Variances (Welch's t-test)

If we cannot assume the populations have identical spreads, we substitute the sample variances ($S^2$) directly into the denominator.

$$T_{obs} = \frac{(\bar{X}_B - \bar{X}_A) - 0}{\sqrt{\frac{S_B^2}{n_B} + \frac{S_A^2}{n_A}}}$$
*Note:* The degrees of freedom for Welch's test require a complex approximation (the Welch-Satterthwaite equation).

### 2. Equal Variances (Student's t-test)

If we assume homoscedasticity ($\sigma_A^2 = \sigma_B^2 = \sigma^2$), we calculate a **Pooled Variance** ($S_p^2$) that combines both samples for a more highly powered estimate of the noise. 
* **Degrees of Freedom:** $(n_A - 1) + (n_B - 1) = n_A + n_B - 2$.

---
**Connections:**
* Extending this concept to $\ge 3$ groups requires [[Analysis of Variance (ANOVA)]].