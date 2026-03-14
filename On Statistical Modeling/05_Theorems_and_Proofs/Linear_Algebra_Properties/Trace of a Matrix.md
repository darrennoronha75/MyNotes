---
tags: [statistics, linear-algebra, foundations]
aliases: [Trace, Cyclic Permutation Property]
created: 2026-03-10

---

> [!abstract] Definition
> For a symmetric matrix $M = (M_{i,j})_{i,j \in \{1,\dots,d\}} \in \mathbb{R}^{d \times d}$, the trace is defined as the sum of its diagonal elements:
> $$trace(M) = \sum_{i=1}^{d} M_{i,i}$$
>

## Cyclic Permutation Property

For two given matrices $U \in \mathbb{R}^{p \times q}$ and $V \in \mathbb{R}^{q \times p}$, the trace of their products is identical, allowing matrices to be swapped inside the trace operator:

$$trace(UV) = \sum_{i=1}^{p} \sum_{j=1}^{q} u_{ij}v_{ji} = \sum_{j=1}^{q} \sum_{i=1}^{p} v_{ji}u_{ij} = trace(VU)$$

## Motivation

When calculating the expected value of quadratic forms (such as the expected variance of the residuals in a [[Linear Model]]), standard scalar algebra fails. The cyclic permutation property of the trace is the indispensable mathematical "trick" required to untangle matrix expectations. Specifically, it allows us to rearrange $E[\varepsilon^T M \varepsilon]$ into $\sigma^2 trace(M)$, which is the core mechanism used to prove the unbiasedness of the residual variance estimator in **Theorem 3.7**.

---
**Connections:**
* Crucial for proving the unbiasedness of $\hat{\sigma}^2$ in [[Theorem 3.7 - Unbiasedness and Covariance of OLS]].