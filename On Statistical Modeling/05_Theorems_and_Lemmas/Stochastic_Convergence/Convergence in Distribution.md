---
tags: [statistics, stochastic-convergence, asymptotic-theory]
aliases: [Converges in Distribution, Weak Convergence of Measures]
created: 2026-03-04
---
# Convergence in Distribution

## Definition
Let $(Y_n)_{n \in \mathbb{N}}$ be a sequence of random vectors with distribution functions $F_{Y_n}$, and let $Y$ have distribution function $F_Y$. 
The sequence **converges in distribution** to $Y$ if the limit of the sequence's CDF exactly equals the CDF of $Y$ at every point where $F_Y$ is continuous.

$$\lim_{n \to \infty} F_{Y_n}(t) = F_Y(t) \quad \text{for all continuity points } t$$

*Notation:* $Y_n \xrightarrow{d} Y$ as $n \to \infty$.

## Properties / Assumptions
* For continuous distributions, this implies that the probability of the sequence falling into any interval $I$ converges to the probability of the target variable $Y$ falling into that interval: $\lim_{n \to \infty} P(Y_n \in I) = P(Y \in I)$.
* This is the weakest form of stochastic convergence. It does *not* mean the random variables themselves are getting closer to each other, only that the *shapes* of their overall probability curves are becoming identical.

---
**Connections:**
* This is the exact mechanism that powers the [[Central Limit Theorem]] and [[Multivariate Central Limit Theorem]].