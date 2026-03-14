---
tags: [statistics, distributions, discrete]
aliases: [Binomial]
created: 2026-03-04

---

> [!abstract] Definition
> The Binomial distribution models the total number of successes in a fixed number $n$ of independent and identically distributed (i.i.d) Bernoulli trials.
>

### Mathematical Formulation

A random variable $X$ follows a Binomial distribution with parameters $n \in \mathbb{N}$ and $p \in [0, 1]$, denoted $X \sim \text{Bin}(n, p)$, if its PMF is:

$$f(k; n, p) = P(X = k) = \binom{n}{k} p^k (1-p)^{n-k}$$
for $k \in \{0, 1, \dots, n\}$, where $\binom{n}{k} = \frac{n!}{k!(n-k)!}$ is the binomial coefficient.



### Properties

* **Expectation:** $E[X] = np$
* **Variance:** $Var(X) = np(1-p)$
* **Additivity:** If $X \sim \text{Bin}(n, p)$ and $Y \sim \text{Bin}(m, p)$ are independent, then $X + Y \sim \text{Bin}(n+m, p)$.

## The Poisson Approximation

When the number of trials $n$ is very large and the probability of success $p$ is very small, the Binomial distribution converges to the [[Poisson Distribution]] with $\lambda = np$.

$$\lim_{n \to \infty, p \to 0} \binom{n}{k} p^k (1-p)^{n-k} = \frac{\lambda^k e^{-\lambda}}{k!}$$

---
**Connections:**
* **Inference:** The sample proportion $\hat{p} = X/n$ is the [[Maximum Likelihood Estimation (MLE)]] for the parameter $p$.
* **Testing:** Used for the **Binomial Test** and sign tests in non-parametric statistics.