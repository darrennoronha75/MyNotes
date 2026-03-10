---
tags: [statistics, inference, hypothesis-testing]
aliases: [Level-alpha, Asymptotic Level Alpha Test]
created: 2026-03-10
---
# Level Alpha Test

## Motivation
Because a [[Statistical Test (Formal Definition)|Statistical Test]] operates on random variables, it will inevitably make mistakes. We cannot minimize both false positives and false negatives simultaneously. The Level-$\alpha$ framework solves this by strictly capping the worst-case scenario: we mathematically guarantee that the probability of a [[Type I Error]] will never exceed a pre-defined "speed limit" ($\alpha$), regardless of where the true parameter hides within the null space.

## Definition (Exact Level-$\alpha$)
A test $\varphi$ is said to have level $\alpha \in (0, 1)$ if the probability of rejecting $H_0$ when $H_0$ is actually true is bounded by $\alpha$ for *every possible parameter* inside the null space:
$$P_\vartheta(\varphi(X) = \text{reject}) \le \alpha \quad \text{for all } \vartheta \in \Theta_0$$

## Asymptotic Level-$\alpha$ Tests
In many complex models (like the ones used in Logistic Regression), we cannot guarantee the exact error rate for small sample sizes. Instead, we rely on stochastic convergence. 

A sequence of tests $(\varphi_n)_{n \in \mathbb{N}}$ is an **asymptotic test with level $\alpha$** if the worst-case error probability converges to a value less than or equal to $\alpha$ as the sample size $n$ goes to infinity:
$$\lim_{n \to \infty} \sup_{\vartheta \in \Theta_0} P_\vartheta(\varphi_n(X) = \text{reject}) \le \alpha$$
*(The supremum ($\sup$) ensures that even the absolute worst-case parameter combination in $\Theta_0$ rigorously respects the $\alpha$ limit).*

## Example: Proving the Type I Error Bound
To see how $\alpha$ mechanically controls the Type I error, we look at the mathematical complement of the confidence region derivation.

Suppose we have a normal sample where we test the true mean $\mu$ against a specific null value $\mu_0$:
* $H_0: \mu = \mu_0$
* $H_1: \mu \neq \mu_0$

We define our test map $\varphi: \mathbb{R}^n \to \{\text{cannot reject}, \text{reject}\}$ based on whether $\mu_0$ falls outside our calculated bounds:
$$\varphi(x) = \begin{cases} \text{cannot reject}, & \mu_0 \in \left( \bar{x} - z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}}, \bar{x} + z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} \right) \\ \text{reject}, & \mu_0 \notin \left( \bar{x} - z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}}, \bar{x} + z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} \right) \end{cases}$$

To prove this is a Level-$\alpha$ test, we must calculate the exact probability of triggering the `reject` condition *assuming the Null Hypothesis is strictly true* (i.e., assuming the true distribution is exactly $P_{\mu_0}$).



**The Calculation:**
$$P_{\mu_0}(\varphi(X) = \text{reject}) = P_{\mu_0}\left( \mu_0 \notin \left( \bar{X} - z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}}, \bar{X} + z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} \right) \right)$$
By the Law of Total Probability, this is 1 minus the probability that it *is* inside the interval:
$$= 1 - P_{\mu_0}\left( \mu_0 \in \left( \bar{X} - z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}}, \bar{X} + z_{1-\alpha/2} \frac{\sigma_0}{\sqrt{n}} \right) \right)$$
Standardizing $\bar{X} - \mu_0$ into $N \sim \text{Normal}(0,1)$:
$$= 1 - P_{\mu_0}\left( \frac{\bar{X} - \mu_0}{\sigma_0/\sqrt{n}} \in (-z_{1-\alpha/2}, z_{1-\alpha/2}) \right)$$
$$= 1 - (\Phi(z_{1-\alpha/2}) - \Phi(-z_{1-\alpha/2}))$$
From our confidence region proof, we know the probability of the interval covering the true mean is exactly $1 - \alpha$:
$$= 1 - (1 - \alpha) = \alpha$$

This strictly proves that if $H_0$ is true, the mathematical function $\varphi(X)$ will output `reject` exactly $\alpha$ proportion of the time, perfectly capping our False Positive rate.

---
**Connections:**
* This formal mathematical bound is exactly what we explicitly prove when validating the $t$-tests and partial $F$-tests in the [[Gaussian Linear Model]].