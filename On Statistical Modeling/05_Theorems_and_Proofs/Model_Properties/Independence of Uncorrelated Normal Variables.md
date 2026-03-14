---
tags: [statistics, theorems, multivariate-normal, independence]
aliases: [Lemma 2.2, Normal Independence]
created: 2026-03-04

---

> [!abstract] Definition
> For general random vectors, being uncorrelated does not imply independence. However, **Lemma 2.2** states that if $X$ and $Y$ are jointly normally distributed, uncorrelatedness perfectly implies independence.
>
> Let $X$ and $Y$ be random vectors in $\mathbb{R}^m$ and $\mathbb{R}^n$, respectively, such that their joint vector $(X, Y)$ is a normally distributed random vector in $\mathbb{R}^{m+n}$. 
> If $X$ and $Y$ are [[Uncorrelated Random Vectors]], then $X$ and $Y$ are completely independent.
>

## Intuition

The [[Multivariate Normal Distribution]] is uniquely determined entirely by its mean vector and covariance matrix. It contains no "hidden" higher-order dependencies. If the linear dependency (covariance) is zero, the joint probability density function perfectly factors into the product of the marginal density functions, satisfying the strict mathematical definition of independence.



---
**Connections:**
* This lemma is frequently exploited when proving properties of [[Ordinary Least Squares (OLS)]] estimators in the [[Gaussian Linear Model]].