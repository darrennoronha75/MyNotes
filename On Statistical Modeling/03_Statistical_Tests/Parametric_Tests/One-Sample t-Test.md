---
tags: [statistics, statistical-tests, parametric]
aliases: [1-Sample t-test, Single Mean Test]
created: 2026-03-04

---

> [!abstract] Definition
> The One-Sample t-test determines if a single population mean ($\mu$) is significantly different from a specific, hypothesized value ($\mu_0$). It is used when the underlying population variance ($\sigma^2$) is unknown and must be estimated from the data.
>

## The Mathematical Derivation

If we actually knew the true variance ($\sigma^2$), we would use a Z-statistic: $Z = \frac{\bar{X}_n - \mu_0}{\sigma / \sqrt{n}} \sim N(0,1)$.
Because $\sigma^2$ is unknown, we estimate it using the sample variance $S_n^2$. By Cochran's theorem, the scaled sample variance follows a [[Chi-Squared Distribution]]:

$$V = \frac{(n-1)S_n^2}{\sigma^2} \sim \chi^2_{n-1}$$

A [[Student's t-Distribution]] is formed by the ratio $T = \frac{Z}{\sqrt{V/\nu}}$. Substituting our specific variables ($\nu = n-1$):

$$T = \frac{\frac{\bar{X}_n - \mu_0}{\sigma / \sqrt{n}}}{\sqrt{\frac{\frac{(n-1)S_n^2}{\sigma^2}}{n-1}}}$$

**The Cancellation:** The $(n-1)$ terms cancel, and the unknown true parameter $\sigma$ cancels out perfectly from the top and bottom. This leaves the operational test statistic:

$$T_{obs} = \frac{\bar{X}_n - \mu_0}{S_n / \sqrt{n}} \sim t_{n-1}$$

## Properties

Because $\bar{X}_n$ acts as an anchor to calculate $S_n^2$, one independent piece of data is "spent", resulting in $n-1$ degrees of freedom.

---
**Connections:**
* This derivation strictly requires the [[Independence of Sample Mean and Variance]].