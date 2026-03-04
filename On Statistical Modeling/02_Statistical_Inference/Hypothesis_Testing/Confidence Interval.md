---
tags: [statistics, inference, estimation]
aliases: [CI, Confidence Bounds, Duality of CI and Hypothesis Tests]
created: 2026-03-04
---
# Confidence Interval

## Definition
A Confidence Interval (CI) is a range of values computed from sample data that is likely to capture the true, unobservable population parameter. A $95\%$ CI means that if we repeated the experiment infinitely, $95\%$ of the generated intervals would contain the true parameter.

## Duality with Hypothesis Testing
A $95\%$ Confidence Interval and a two-sided [[Null Hypothesis Significance Testing (NHST)|hypothesis test]] at $\alpha = 0.05$ are mathematical duals. We can derive the interval by algebraically pivoting the probability statement of the test statistic.

Starting with the non-rejection region:
$$P\left(-t_{1-\alpha/2} \le \frac{\bar{X} - \mu}{S/\sqrt{n}} \le t_{1-\alpha/2}\right) = 1 - \alpha$$
Through algebraic manipulation (multiplying by standard error and isolating $\mu$), this pivots directly into the CI formula:
$$P\left(\bar{X} - t_{1-\alpha/2} \frac{S}{\sqrt{n}} \le \mu \le \bar{X} + t_{1-\alpha/2} \frac{S}{\sqrt{n}}\right) = 1 - \alpha$$

## The Decision Rule
Because they are identical formulas rearranged:
* If the CI **contains** the null value ($H_0$), the null is a mathematically plausible reality. We **fail to reject** $H_0$ ($p > \alpha$).
* If the CI **excludes** the null value, the null is statistically implausible. We **reject** $H_0$ ($p < \alpha$).



---
**Connections:**
* The critical values used to build the interval are drawn directly from the boundaries defined in [[Alternative Hypothesis]].