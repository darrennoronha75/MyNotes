---
tags: [statistics, software, r-stats]
aliases: [DPQR, R Distribution Functions]
created: 2026-03-04

---

## Definition

In the `R` programming environment, every standard parametric family (like `norm`, `t`, `pois`) is accessible via a standardized set of four functional prefixes: **D, P, Q, and R**. 

1. **`d` (Density/Mass):** Computes the exact height of the [[Probability Distribution|PDF or PMF]] at a specific value $x$. 
   * *Example:* `dnorm(0)` returns the peak height of the standard normal curve.
2. **`p` (Probability):** Computes the Cumulative Distribution Function (CDF). It gives the area under the curve (the probability) of observing a value *less than or equal to* $q$. 
   * *Example:* `pnorm(1.96)` returns $\approx 0.975$.
3. **`q` (Quantile):** The mathematical inverse of `p`. You input a probability (e.g., $0.95$), and it returns the exact value on the x-axis that divides the distribution such that the given probability lies to the left. 
   * *Example:* `qnorm(0.975)` returns $1.96$.
4. **`r` (Random):** A random number generator. It pulls synthetic, stochastic observations from the specified [[Data Generating Process]]. 
   * *Example:* `rnorm(100)` generates 100 random variables from a standard normal distribution.

---
**Connections:**
* The `q` function is absolutely essential for calculating the strict boundaries of the [[Alternative Hypothesis|Critical Region]] and the [[Confidence Interval]].