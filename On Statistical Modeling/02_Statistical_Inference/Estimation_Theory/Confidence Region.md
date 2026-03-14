---
tags: [statistics, inference, estimation]
aliases: [Confidence Interval, Asymptotic Confidence Region, Confidence Bounds]
created: 2026-03-10

---

While an [[Estimator]] provides a single "best guess" vector for a parameter, it contains no inherent information about its own accuracy. A Confidence Region translates a point estimate into a geometric area (or interval) of certainty, guaranteeing that the true parameter is trapped within that area in a specified percentage of repeated experiments.

> [!abstract] Definition (Exact Confidence Region)
> Let $g(\vartheta)$ be the true, unknown parameter function we want to estimate. A set $I_X \subseteq \mathbb{R}^m$ (which depends entirely on the random sample $X$) is a **confidence region** for $g(\vartheta)$ with error level $\alpha \in (0, 1)$ if:
> $$P_\vartheta(g(\vartheta) \in I_X) \ge 1 - \alpha \quad \text{for all } \vartheta \in \Theta$$
> *(Note: If $m=1$ and the set is a continuous 1D line, $I_X$ is simply called a **Confidence Interval**).*
>

## Asymptotic Confidence Regions

When exact finite-sample distributions are unknown (or impossible to calculate), we construct regions that achieve the correct coverage probability only as $n \rightarrow \infty$.
A sequence of random sets $(I_n)_{n \in \mathbb{N}}$ forms an **asymptotic confidence region** with error level $\alpha$ if the lowest possible coverage probability across all parameters converges to at least $1-\alpha$:

$$\lim_{n \to \infty} \inf_{\vartheta \in \Theta} P_\vartheta(g(\vartheta) \in I_n) \ge 1 - \alpha$$

## Duality with Hypothesis Testing

A Confidence Region and a two-sided [[Statistical Test (Formal Definition)|Statistical Test]] are mathematical duals. You can derive one directly from the other. The region $I_X$ exactly contains all the values of $\vartheta_0$ for which the null hypothesis $H_0: \vartheta = \vartheta_0$ would **not** be rejected at level $\alpha$.

## Example: Deriving the Exact $\alpha$ Bound

To understand exactly how the probability bounds deal with $\alpha$, let's derive the exact confidence interval for a normal sample with unknown expectation ($\mu$) but known standard deviation ($\sigma_0$).

Let $X = (X_1, \dots, X_n)^T$ be $n$ i.i.d. variables where $X_1 \sim \text{Normal}(\mu, \sigma_0^2)$.
We define our interval $I_X$ using the $p$-quantiles ($z_p$) of the Standard Normal distribution:

$$I_X = \left( \bar{X} - z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}}, \quad \bar{X} + z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} \right)$$

To prove this is exactly a level $\alpha$ region, we must calculate $P_\mu(\mu \in I_X)$.
Because the sample mean $\bar{X} \sim \text{Normal}(\mu, \sigma_0^2/n)$, standardizing it gives us exactly a Standard Normal variable $N = \frac{\bar{X} - \mu}{\sigma_0/\sqrt{n}} \sim \text{Normal}(0,1)$.



**The Calculation:**

$$P_\mu(\mu \in I_X) = P_\mu\left( \mu \in \left( \bar{X} - z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}}, \bar{X} + z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} \right) \right)$$
Rearrange the inequality to isolate $\bar{X} - \mu$:

$$= P_\mu\left( -z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} < \bar{X} - \mu < z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} \right)$$
Divide by the standard error to create the Standard Normal variable ($N$):

$$= P_\mu\left( -z_{1-\alpha/2} < \frac{\bar{X} - \mu}{\sigma_0/\sqrt{n}} < z_{1-\alpha/2} \right)$$

$$= P(N \in (-z_{1-\alpha/2}, z_{1-\alpha/2}))$$

Using the Cumulative Distribution Function ($\Phi$) of the Standard Normal:

$$= \Phi(z_{1-\alpha/2}) - \Phi(-z_{1-\alpha/2})$$
By symmetry of the normal curve, $\Phi(-z) = 1 - \Phi(z)$:

$$= \Phi(z_{1-\alpha/2}) - (1 - \Phi(z_{1-\alpha/2}))$$

$$= 2\Phi(z_{1-\alpha/2}) - 1$$
Because $\Phi(z_{1-\alpha/2})$ is, by definition, $1 - \frac{\alpha}{2}$:

$$= 2\left(1 - \frac{\alpha}{2}\right) - 1 = 2 - \alpha - 1 = 1 - \alpha$$

This rigorous proof guarantees that the probability of the true parameter $\mu$ missing this interval is exactly bounded at $\alpha$.

---
**Connections:**
* Asymptotic regions rely heavily on the [[Central Limit Theorem]] and [[Slutsky's Theorem]] to approximate their boundaries.
* Narrower regions indicate higher statistical precision and are inherently linked to higher [[Statistical Power]].