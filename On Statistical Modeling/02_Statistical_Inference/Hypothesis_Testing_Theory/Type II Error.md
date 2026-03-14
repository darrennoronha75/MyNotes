---
tags: [statistics, inference, decision-errors]
aliases: [False Negative, Beta Error]
created: 2026-03-04

---

> [!abstract] Definition
> A Type II Error occurs when a researcher fails to reject a false Null Hypothesis. In practical terms, it is a **False Negative**ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Âmissing a real effect or difference because the sample data was not extreme enough to cross the statistical threshold.
>

## Mathematical Formulation

The probability of committing a Type II Error is denoted by $\beta$ (beta). 

It is the conditional probability that the test statistic ($T$) fails to reach the critical region ($K$) given that the Alternative Hypothesis ($H_1$) is actually true:

$$P(T \notin K \mid H_1 \text{ is true}) = \beta$$

## Intuition

Unlike $\alpha$, which is a single fixed number, $\beta$ is dynamic. It depends heavily on the true size of the underlying effect and the sample size. If the true effect is very small and the sample is small, the signal will be buried in the noise, driving $\beta$ extremely high.

---
**Connections:**
* The inverse of a Type II Error ($1 - \beta$) is known as [[Statistical Power]].