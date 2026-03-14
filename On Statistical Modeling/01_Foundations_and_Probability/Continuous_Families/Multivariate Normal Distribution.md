---
tags: [statistics, distributions, parametric-families, continuous, multivariate]
aliases: [Multivariate Normal, MVN]
created: 2026-03-05

---

> [!abstract] Definition
>
> ![[Multivariate-Normal-Dist.gif]]
>
> The Multivariate Normal Distribution is the multi-dimensional generalization of the [[Normal Distribution]]. It models the joint distribution of multiple normally distributed random variables that may be correlated.
>
> Let $N = (N_1, \dots, N_n)^T$ be a [[Random Vector]] consisting of independent standard normal random variables (i.e., $N_i \sim \text{Normal}(0, 1)$). The distribution of $N$ is called the **multivariate standard normal distribution** on $\mathbb{R}^n$.
>
> A random vector $X$ in $\mathbb{R}^n$ follows a general multivariate normal distribution if it can be constructed as an affine transformation of a standard multivariate normal vector $N$:
> $$X \stackrel{d}{=} \Sigma^{\frac{1}{2}}N + \mu$$
>
> *Notation:* $X \sim \text{Normal}(\mu, \Sigma)$.
>
>
>

## Parameters

1. **Mean Vector ($\mu$):** Determines the location of the center of the distribution in $n$-dimensional space. 
2. **[[Covariance Matrix]] ($\Sigma$):** Determines the scale and the orientation (correlation) of the distribution.

## Why must $\Sigma$ be "Positive Semi-Definite"?

The definition explicitly requires $\Sigma$ to be a **positive semi-definite (PSD)** matrix. This is not an arbitrary rule; it stems from two absolute mathematical necessities:

1. **The "No Negative Variance" Rule:** $\Sigma$ is a Covariance Matrix. If you project the random vector $X$ onto any 1D line using a vector $a$, the variance of that new projection is $a^T \Sigma a$. Because variance measures physical spread, it *cannot* be negative. A matrix where $a^T \Sigma a \ge 0$ for all $a$ is, by definition, a positive semi-definite matrix.
2. **The Matrix Square Root:** To mathematically construct the distribution ($X = \Sigma^{\frac{1}{2}}N + \mu$), we must calculate $\Sigma^{\frac{1}{2}}$ (a matrix that, when multiplied by itself, equals $\Sigma$). Just as you cannot take the square root of a negative scalar in real numbers ($\sqrt{-4}$), you cannot take the square root of a matrix unless it is positive semi-definite.

## Properties & Transformations

### 1. Affine Transformations

Because of how the distribution is constructed, any linear slice or affine transformation $Y = AX + b$ (where $A \in \mathbb{R}^{m \times n}$ is a constant matrix and $b \in \mathbb{R}^m$ is a constant vector) results in another perfectly multivariate normal vector:

$$AX + b \sim \text{Normal}(A\mu + b, A\Sigma A^T)$$

### 2. Independence and Correlation

For a multivariate normal vector, the condition of being [[Uncorrelated Random Vectors|uncorrelated]] strictly implies independence. This is a unique feature of the Gaussian family. See [[Independence of Uncorrelated Normal Variables]].

---
**Connections:**
* The error term $\epsilon$ in a [[Gaussian Linear Model]] is assumed to follow a multivariate normal distribution $\epsilon \sim \text{Normal}(0, \sigma^2 I_n)$.
* The [[Multivariate Central Limit Theorem]] states that the sum of i.i.d. random vectors converges asymptotically to a multivariate normal distribution.