## Core Concept
The Central Limit Theorem is the ultimate error-correction machine. It states that the distribution of a [[Statistics as Random Variables|sample mean]] ($\bar{X}_n$) will converge to a Normal distribution as the sample size ($n$) grows to infinity, **regardless of the original shape of the data generating process**.

## Prerequisites
The CLT is practically magic, but it requires three strict assumptions to work:
1. **Independent and Identically Distributed (i.i.d.):** The data points must come from the same underlying process and not influence each other.
2. **Finite Expected Value:** The true population mean ($\mu$) must exist.
3. **Finite Variance:** The true population variance ($\sigma^2$) must be less than infinity ($\sigma^2 < \infty$).

## The Mathematical Representation
As $n \rightarrow \infty$, the standardized distance between the sample mean and the true mean converges in distribution ($\xrightarrow{d}$) to a normal distribution:
$$\sqrt{n}(\bar{X}_n - \mu) \xrightarrow{d} N(0, \sigma^2)$$

### The "Exam Version" (Standardized)
We divide by $\sigma$ to neutralize the variance on the right side, creating an asymptotic Standard Normal representation:
$$\frac{\bar{X}_n - \mu}{\sigma / \sqrt{n}} \xrightarrow{d} N(0, 1)$$

In practice, we rarely know the true $\sigma$. Using **Slutsky's Theorem**, we can replace the unknown population parameter $\sigma$ with the estimated sample standard deviation $S_n$. Because $S_n$ converges to $\sigma$, the asymptotic relationship holds:
$$\frac{\bar{X}_n - \mu}{S_n / \sqrt{n}} \xrightarrow{d} N(0, 1)$$

---
**Connections:**
* The term $\sigma / \sqrt{n}$ represents the standard error of the mean.
* If the requirement for finite variance fails, the CLT collapses. See [[Heavy-Tailed Distributions]].
* This theorem justifies our ability to use Gaussian methods even when raw data isn't perfectly Gaussian, forming the backbone of [[The NHST Framework]].