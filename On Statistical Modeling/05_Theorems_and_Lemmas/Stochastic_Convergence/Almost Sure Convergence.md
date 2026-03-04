---
tags: [statistics, stochastic-convergence, asymptotic-theory]
aliases: [Strong Convergence, Converges Almost Surely, a.s. Convergence]
created: 2026-03-04
---
# Almost Sure Convergence

## Definition
A sequence of random vectors $(Y_n)_{n \in \mathbb{N}}$ in $\mathbb{R}^m$ **converges almost surely** to a random vector $Y$ if the set of outcomes where the sequence's limit exactly equals $Y$ has a probability of $1$.

$$P\left( \lim_{n \to \infty} Y_n = Y \right) = 1$$

*Notation:* $Y_n \xrightarrow{a.s.} Y$ as $n \to \infty$.

## Intuition
Imagine generating infinite parallel universes, each tracking a sequence of random numbers. Almost sure convergence means that in $100\%$ of those universes (except for a set of universes so rare their probability is strictly $0$), the sequence will eventually lock onto the target value $Y$ and never leave.



## Properties / Assumptions
* This is the strongest standard form of stochastic convergence.
* Almost sure convergence mathematically implies [[Convergence in Probability]] and [[Convergence in Distribution]].
* It forms the requirement for Strong Consistency in a [[Consistent Estimator]].

---
**Connections:**
* This form of convergence governs the Strong [[Law of Large Numbers (LLN)]].