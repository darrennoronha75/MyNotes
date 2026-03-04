---
tags: [statistics, stochastic-convergence, asymptotic-theory]
aliases: [Weak Convergence, Converges in Probability]
created: 2026-03-04
---
# Convergence in Probability

## Definition
A sequence of random vectors $(Y_n)_{n \in \mathbb{N}}$ in $\mathbb{R}^m$ **converges in probability** to a random vector $Y$ if, as the sequence index $n$ approaches infinity, the probability that the distance between $Y_n$ and $Y$ is larger than any arbitrarily small positive number $\varepsilon$ shrinks to exactly zero.

$$\lim_{n \to \infty} P(\|Y_n - Y\| \ge \varepsilon) = 0 \quad \text{for all } \varepsilon > 0$$

*Notation:* $Y_n \xrightarrow{P} Y$ as $n \to \infty$.

## Intuition
As you collect more and more data (increasing $n$), the probability of an "unusual" or "bad" estimate occurring becomes vanishingly small. The sequence of random variables heavily concentrates its probability mass exactly on $Y$.

## Properties / Assumptions
* Convergence in probability is the foundation of a [[Consistent Estimator]] (Weak Consistency).
* It is a weaker condition than [[Almost Sure Convergence]]; if a sequence converges almost surely, it automatically converges in probability.
* It is a stronger condition than [[Convergence in Distribution]].

---
**Connections:**
* This form of convergence governs the Weak [[Law of Large Numbers (LLN)]].