---
tags: [statistics, inference, hypothesis-testing]
aliases: [Critical Region, One-Sided Test, Two-Sided Test]
created: 2026-03-04

---

> [!abstract] Definition
> In [[Null Hypothesis Significance Testing (NHST)]], the Alternative Hypothesis ($H_1$) is the competing claim to the Null Hypothesis. Its mathematical shape strictly dictates the location of the "rejection zones"ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â€šÂ¬Ã‚Âformally known as the **Critical Region ($K$)**ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â€šÂ¬Ã‚Âon the null distribution.
>

## Types of Alternatives

### 1. Two-Sided Alternative ($H_1: \mu \neq \mu_0$)

Used when testing for *any* difference or effect, regardless of direction. We split our risk tolerance ($\alpha$) equally into both the upper and lower tails of the distribution.
* **The Critical Region ($K$):** The set of all values where the absolute value of the test statistic is greater than the critical quantile.
  $$K = \left\{ T_{obs} : |T_{obs}| > t_{1-\alpha/2, n-1} \right\}$$
* *Example:* If $\alpha = 0.05$, we reject $H_0$ if $T_{obs}$ lands above the $97.5$th percentile or below the $2.5$th percentile.

### 2. One-Sided Alternative ($H_1: \mu > \mu_0$ or $H_1: \mu < \mu_0$)

Used when testing for an effect in a specific, pre-defined direction. We place our entire risk budget ($\alpha$) into a single tail.
* **The Critical Region ($K$):** $$K = \left\{ T_{obs} : T_{obs} > t_{1-\alpha, n-1} \right\}$$
* *Trade-off:* This makes it mathematically easier to reject $H_0$ in the predicted direction, but mathematically impossible to reject it in the opposite direction, regardless of how extreme the data is.

Below is an illustration of how this can look -

![[Alternative_Hypothesis_Concept1.jpeg]]

Another illustration with more annotations - 

![[AlternativeHypothesis_Concept2.jpg]]

---
**Connections:**
* The bounds of the critical region for a two-sided alternative are perfectly mirrored by a [[Confidence Interval]].