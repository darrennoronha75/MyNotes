---
tags: [statistics, foundations, estimators]
aliases: [Statistics, Sample Statistic]
created: 2026-03-04
---
## Definition
A statistic is strictly defined as a mathematical function evaluated over a set of sample data. It takes a dataset of $n$ observations and compresses it into a single numerical value, independent of any unknown true population parameters.

$$T = g(X_1, X_2, \dots, X_n)$$

## Intuition
When we collect a massive amount of data, we cannot interpret it in its raw form. A statistic $T$ serves to summarize a specific property of that data. Common examples include the sample mean ($\bar{X}$), the sample variance ($S^2$), or the maximum observed value ($X_{(n)}$).

## Properties / The Critical Implication
Data is simply a collection of $n$ observed random variables, denoted as the set $\{X_1, X_2, \dots, X_n\}$. 

Because a statistic $T$ is computed by applying a function to random variables, **a function of random variables is itself a random variable.** If an experiment is repeated and a different dataset is collected, the function will output a different statistic. Therefore, every statistic is random and possesses its own inherent uncertainty.

---
**Connections:**
* Because statistics are random variables, their behavior is perfectly described by sampling distributions.
* The asymptotic behavior of specific statistics as $n \rightarrow \infty$ is governed by theorems like the [[Central Limit Theorem]] and the [[Law of Large Numbers (LLN)]].