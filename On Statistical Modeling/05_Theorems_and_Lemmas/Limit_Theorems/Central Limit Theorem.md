---
tags: [statistics, theorems, asymptotic-theory]
aliases: [CLT]
created: 2026-03-04
---
# Central Limit Theorem (CLT)

## Definition
The Central Limit Theorem (CLT) states that the distribution of a sample mean ($\bar{X}_n$) converges to a [[Normal Distribution]] as the sample size ($n$) grows to infinity, **regardless of the original shape of the data generating process**.

As $n \rightarrow \infty$, the standardized distance between the sample mean and the true mean converges in distribution ($\xrightarrow{d}$) to a normal distribution:
$$\sqrt{n}(\bar{X}_n - \mu) \xrightarrow{d} N(0, \sigma^2)$$

## The Standardized Representation
By dividing by $\sigma$ to neutralize the variance, we create an asymptotic Standard Normal representation:
$$\frac{\bar{X}_n - \mu}{\sigma / \sqrt{n}} \xrightarrow{d} N(0, 1)$$

In practice, the true population variance ($\sigma^2$) is rarely known. Using [[Slutsky's Theorem]], we can legally replace the unknown parameter $\sigma$ with the estimated sample standard deviation $S_n$, maintaining the asymptotic relationship:
$$\frac{\bar{X}_n - \mu}{S_n / \sqrt{n}} \xrightarrow{d} N(0, 1)$$

## Prerequisites
The CLT requires three strict mathematical assumptions to hold:
1. **Independent and Identically Distributed (i.i.d.):** The data points must not influence each other and must come from the same underlying probability distribution.
2. **Finite Expected Value:** The true population mean ($\mu$) must be a finite number.
3. **Finite Variance:** The true population variance ($\sigma^2$) must be less than infinity ($\sigma^2 < \infty$). 

---
**Connections:**
* If the requirement for finite variance fails, the CLT collapses entirely. This is observed in [[Heavy-Tailed Distributions]] families like the Cauchy distribution.
* The denominator term $\sigma / \sqrt{n}$ represents the standard error of the mean.