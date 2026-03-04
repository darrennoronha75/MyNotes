---
tags: [statistics, distributions, sampling-distributions]
aliases: [t-distribution, Student's t]
created: 2026-03-04
---
# Student's t-Distribution

## Definition
The Student's t-distribution is a continuous probability distribution that arises when estimating the mean of a normally distributed population in situations where the sample size is small and the true population variance ($\sigma^2$) is unknown.

Mathematically, it is formed by taking a Standard Normal variable ($Z$) and dividing it by the square root of an independent [[Chi-Squared Distribution|Chi-Squared variable]] ($V$) that has been scaled by its degrees of freedom ($\nu$):
$$T = \frac{Z}{\sqrt{V/\nu}}$$

### Rigorous Formulation
Let $N \sim \text{Normal}(0, 1)$ be a standard normal random variable, and let $Z \sim \chi^2_m$ be a [[Chi-Squared Distribution|chi-square random variable]] with $m$ degrees of freedom. If $N$ and $Z$ are independent, a random variable $X$ has a t-distribution with $m$ degrees of freedom if it follows the same distribution as:
$$X = \frac{N}{\sqrt{Z/m}} \sim t_m$$

### Symmetry
Because it is symmetric around zero, its [[Quantile|quantiles]] perfectly mirror each other:
$$P(X \le -t_{m,p}) = P(X \ge t_{m,p}) = 1 - p$$

## Intuition & Properties
* **Shape:** It is perfectly symmetric and centered at zero, resembling the Standard Normal distribution, but with distinctly **thicker tails**. 
* **The Penalty for Uncertainty:** Because we must estimate the variance using the sample standard deviation ($S$), we inject extra uncertainty into our calculations. The thicker tails of the $t$-distribution account for this, making it "harder" to find statistical significance and effectively preventing false positives in small samples.


## The Parameter: Degrees of Freedom ($\nu$)
The distribution is governed by a single parameter: degrees of freedom ($\nu = n - 1$). 
As the sample size $n$ increases, our estimate of the variance becomes exponentially more accurate. Consequently, as $\nu \rightarrow \infty$, the $t$-distribution perfectly converges to the Standard Normal distribution $N(0,1)$.

---
**Connections:**
* This distribution forms the backbone of the [[One-Sample t-Test]] and [[Two-Sample t-Test]].
* The convergence logic relies heavily on [[Slutsky's Theorem]].