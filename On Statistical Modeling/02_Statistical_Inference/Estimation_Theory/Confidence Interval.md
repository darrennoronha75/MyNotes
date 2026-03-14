---
tags: [statistics, inference, estimation]
aliases: [CI, Confidence Bounds, Duality of CI and Hypothesis Tests]
created: 2026-03-04

---

> [!abstract] Definition
> A Confidence Interval (CI) is a range of values computed from sample data that is likely to capture the true, unobservable population parameter. A $95\%$ CI means that if we repeated the experiment infinitely, $95\%$ of the generated intervals would contain the true parameter.
>

## Duality with Hypothesis Testing

A $95\%$ Confidence Interval and a two-sided hypothesis test at $\alpha = 0.05$ are mathematical duals. We can derive the interval by algebraically pivoting the probability statement of the test statistic.

### Algebraic Derivation & Justification

We begin with the non-rejection region of a [[Student's t-Distribution]] for a two-sided test:

$$P\left(-t_{1-\alpha/2, n-1} \le \frac{\bar{X} - \mu}{S/\sqrt{n}} \le t_{1-\alpha/2, n-1}\right) = 1 - \alpha$$



**1. Multiply by the Standard Error:**
Multiply all parts of the inequality by $S/\sqrt{n}$.

$$-t_{1-\alpha/2} \cdot \frac{S}{\sqrt{n}} \le \bar{X} - \mu \le t_{1-\alpha/2} \cdot \frac{S}{\sqrt{n}}$$
* **Justification:** This removes the denominator from the test statistic, leaving the "distance" between the sample mean and the population mean. Since the standard error is always positive, the inequality signs do not change.

**2. Subtract the Sample Mean ($\bar{X}$):**
Subtract $\bar{X}$ from all three parts.

$$-\bar{X} - t_{1-\alpha/2} \frac{S}{\sqrt{n}} \le -\mu \le -\bar{X} + t_{1-\alpha/2} \frac{S}{\sqrt{n}}$$
* **Justification:** This isolates the negative population parameter ($-\mu$) in the center.

**3. Multiply by $-1$ (The Pivot):**
Multiply the entire inequality by $-1$ to solve for $+\mu$.

$$\bar{X} + t_{1-\alpha/2} \frac{S}{\sqrt{n}} \ge \mu \ge \bar{X} - t_{1-\alpha/2} \frac{S}{\sqrt{n}}$$
* **Justification:** Multiplying by a negative number flips the direction of the inequality signs. This is the "pivot" where the statement shifts from being about the probability of the sample to the coverage of the parameter.

**4. Rearrange for Standard Notation:**
Rewrite from smallest to largest.

$$P\left(\bar{X} - t_{1-\alpha/2} \frac{S}{\sqrt{n}} \le \mu \le \bar{X} + t_{1-\alpha/2} \frac{S}{\sqrt{n}}\right) = 1 - \alpha$$



## The Decision Rule

Because they are identical formulas rearranged:
* **Fail to Reject:** If the CI **contains** the null value ($H_0$), the null is a mathematically plausible reality ($p > \alpha$).
* **Reject:** If the CI **excludes** the null value, the null is statistically implausible ($p < \alpha$).

### Proof of Coverage Probability

To prove that an interval has an exact error level of $\alpha$ (meaning it covers the true parameter with probability $1-\alpha$), we evaluate the probability of the standardized statistic falling between the negative and positive quantiles. 

For a Standard Normal variable $N \sim \text{Normal}(0, 1)$, the probability of falling within the bounds $(-z_{1-\alpha/2}, z_{1-\alpha/2})$ relies on the Cumulative Distribution Function ($\Phi$) and its symmetry property ($\Phi(-z) = 1 - \Phi(z)$).

$$P(N \in (-z_{1-\alpha/2}, z_{1-\alpha/2}))$$

**1. Evaluate via CDF:**

$$= \Phi(z_{1-\alpha/2}) - \Phi(-z_{1-\alpha/2})$$

**2. Apply Symmetry for the Lower Bound:**

$$= \Phi(z_{1-\alpha/2}) - (1 - \Phi(z_{1-\alpha/2}))$$

**3. Combine Terms:**

$$= 2\Phi(z_{1-\alpha/2}) - 1$$

**4. Substitute the Known Quantile Probability:**
By definition, the area to the left of $z_{1-\alpha/2}$ is exactly $1 - \alpha/2$.

$$= 2 \left( 1 - \frac{\alpha}{2} \right) - 1$$

$$= 2 - \alpha - 1$$

$$= 1 - \alpha$$



This mathematically proves that the confidence interval covers the true parameter in exactly $1 - \alpha$ proportion of repeated samples.

---
**Connections:**
* The critical values used to build the interval are drawn directly from the boundaries defined in [[Alternative Hypothesis]].
* Narrower intervals indicate higher **Precision** and are often a result of increased [[Statistical Power]].