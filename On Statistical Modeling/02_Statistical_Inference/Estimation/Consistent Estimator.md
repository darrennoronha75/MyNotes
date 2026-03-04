---
tags: [statistics, inference, estimators]
aliases: [Consistency, Weakly Consistent, Strongly Consistent]
created: 2026-03-04
---
# Consistent Estimator

## Definition
A sequence of estimators $(U_n)_{n \in \mathbb{N}}$ for an unknown parameter $g(\vartheta)$ is **consistent** if the estimates mathematically converge to the true value as the sample size $n$ increases toward infinity.

### 1. Strongly Consistent
The sequence converges almost surely ([[Almost Sure Convergence]]):
$$U_n \xrightarrow{P_\vartheta-a.s.} g(\vartheta) \quad \text{as } n \to \infty \text{ for all } \vartheta \in \Theta$$

### 2. Weakly Consistent
The sequence converges in probability ([[Convergence in Probability]]):
$$U_n \xrightarrow{P_\vartheta} g(\vartheta) \quad \text{as } n \to \infty \text{ for all } \vartheta \in \Theta$$

## Intuition
Consistency is the ultimate requirement for any valid statistical method. It means that collecting more data will inevitably lead you to the absolute truth. If an estimator is inconsistent, accumulating infinite data will still leave you guessing the wrong number.

*(Note: Strong consistency mathematically implies weak consistency).*

---
**Connections:**
* The sample mean is proven to be a strongly consistent estimator for the population expectation via the [[Law of Large Numbers (LLN)]].