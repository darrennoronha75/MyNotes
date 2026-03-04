## Core Concept
When setting up [[The NHST Framework]], the mathematical shape of the Alternative Hypothesis ($H_1$) strictly dictates the location of the "rejection zones" (Critical Region, denoted $K$) on the Null Distribution.

## 1. Two-Sided Alternative ($H_1: \mu \neq \mu_0$)
We are testing for any difference. We split our risk tolerance ($\alpha$) equally into both tails.
* **The Critical Region ($K$):** The set of all values where the absolute value of the test statistic is greater than the critical quantile.
  $$K = \left\{ T_{obs} : |T_{obs}| > t_{1-\alpha/2, n-1} \right\}$$
* If $\alpha = 0.05$, we reject $H_0$ if $T_{obs}$ lands above the $97.5$th percentile or below the $2.5$th percentile.

## 2. One-Sided Alternative ($H_1: \mu > \mu_0$)
We place our entire risk budget ($\alpha$) into a single tail.
* **The Critical Region ($K$):** $$K = \left\{ T_{obs} : T_{obs} > t_{1-\alpha, n-1} \right\}$$
* This makes it mathematically easier to reject $H_0$ in the predicted direction, but mathematically impossible to reject it in the opposite direction, regardless of the data's extremity.

## The Algebraic Duality of Confidence Intervals
A Confidence Interval is perfectly dual to a two-sided hypothesis test. We can derive the interval by algebraically pivoting the probability statement of the test statistic.

We start with the 95% probability that the statistic falls in the non-rejection region:
$$P\left(-t_{1-\alpha/2} \le \frac{\bar{X} - \mu}{S/\sqrt{n}} \le t_{1-\alpha/2}\right) = 1 - \alpha$$
Multiply all terms by the standard error ($S/\sqrt{n}$):
$$P\left(-t_{1-\alpha/2} \frac{S}{\sqrt{n}} \le \bar{X} - \mu \le t_{1-\alpha/2} \frac{S}{\sqrt{n}}\right) = 1 - \alpha$$
Subtract $\bar{X}$ from all terms, and multiply by $-1$ (which flips the inequality signs):
$$P\left(\bar{X} - t_{1-\alpha/2} \frac{S}{\sqrt{n}} \le \mu \le \bar{X} + t_{1-\alpha/2} \frac{S}{\sqrt{n}}\right) = 1 - \alpha$$

**The Conclusion:** $H_0: \mu = \mu_0$ is rejected at significance level $\alpha$ **if and only if** the hypothesized parameter $\mu_0$ falls entirely outside the $(1-\alpha)$ confidence interval.

---
**Connections:**
* The $\alpha$ level defined here is the strict mathematical cap on making a [[Decision Errors and Power|Type I Error]].