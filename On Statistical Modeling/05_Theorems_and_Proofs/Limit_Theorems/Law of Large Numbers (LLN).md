---
tags: [statistics, theorems, asymptotic-theory, stub]
aliases: [LLN]
created: 2026-03-04

---

> [!abstract] Definition (Theorem 2.3)
> The Law of Large Numbers states that the sample mean of a sequence of independent and identically distributed (i.i.d.) random vectors converges to their theoretical expected value as the sample size grows to infinity.
>
> Let $(X_i)_{i \in \mathbb{N}}$ be i.i.d. random vectors in $\mathbb{R}^m$ such that $E[\|X\|] < \infty$, and define $S_n = \sum_{i=1}^n X_i$.
>

### 1. The Weak Law of Large Numbers

The sample mean converges to the true mean in probability ([[Convergence in Probability]]):

$$\frac{1}{n} S_n \xrightarrow{P} E[X_1] \quad \text{as } n \to \infty$$

### 2. The Strong Law of Large Numbers

The sample mean converges to the true mean almost surely ([[Almost Sure Convergence]]):

$$\frac{1}{n} S_n \xrightarrow{a.s.} E[X_1] \quad \text{as } n \to \infty$$

## Intuition

If you flip a fair coin a few times, you might get $80\%$ heads. If you flip it a million times, the proportion of heads will converge to exactly $50\%$. The LLN guarantees that random noise cancels itself out over the long run, pulling the sample average toward the true population expectation.

---
**Connections:**
* The LLN is the primary theorem used to prove that the sample mean is a [[Consistent Estimator]] for the population mean.