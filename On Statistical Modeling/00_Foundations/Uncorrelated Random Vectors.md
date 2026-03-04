---
tags: [statistics, foundations, covariance]
aliases: [Uncorrelated, Uncorrelatedness]
created: 2026-03-04
---
# Uncorrelated Random Vectors

## Definition
Two random vectors $X = (X_1, \dots, X_m)^T$ and $Y = (Y_1, \dots, Y_n)^T$ with finite second moments ($E[\|X\|^2] < \infty$ and $E[\|Y\|^2] < \infty$) are called **uncorrelated** if the covariance between every possible pair of their components is strictly zero.

Mathematically, this means their cross-covariance matrix is a zero matrix:
$$Cov(X, Y) := (Cov(X_i, Y_j))_{i \in \{1,\dots,m\}, j \in \{1,\dots,n\}} = \mathbf{0}$$

## Properties / Assumptions
* **Relationship to Independence:** Independence is a strictly stronger property than uncorrelatedness. If two random vectors are independent, they are necessarily uncorrelated.
* **The Caveat:** The reverse is *not* generally true. Uncorrelated random vectors can still be highly dependent (e.g., through non-linear relationships like $Y = X^2$). 
* **The Exception:** The only scenario where uncorrelatedness strictly implies independence is within the [[Multivariate Normal Distribution]]. See [[Independence of Uncorrelated Normal Variables]].

---
**Connections:**
* Covariance is a foundational operator required to define the [[Multivariate Central Limit Theorem]].