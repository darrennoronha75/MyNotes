---
tags: [statistics, distributions, parametric-families, continuous, multivariate]
aliases: [Multivariate Normal, MVN]
created: 2026-03-05
---
## Definition
The Multivariate Normal Distribution is the multi-dimensional generalization of the [[Normal Distribution]]. It models the joint distribution of multiple normally distributed random variables that may be correlated.

Let $N = (N_1, \dots, N_n)^T$ be a [[Random Vector]] consisting of independent standard normal random variables (i.e., $N_i \sim \text{Normal}(0, 1)$). The distribution of $N$ is called the **multivariate standard normal distribution** on $\mathbb{R}^n$. 

A random vector $X$ in $\mathbb{R}^n$ follows a general multivariate normal distribution if it can be constructed as an affine transformation of a standard multivariate normal vector $N$.
Specifically, $X$ follows a multivariate normal distribution with parameters $\mu \in \mathbb{R}^n$ and a positive semi-definite matrix $\Sigma \in \mathbb{R}^{n \times n}$ if $X$ has the exact same distribution as:
$$X \stackrel{d}{=} \Sigma^{\frac{1}{2}}N + \mu$$

Where $\Sigma^{\frac{1}{2}}$ is the unique positive semi-definite matrix such that $\Sigma^{\frac{1}{2}}\Sigma^{\frac{1}{2}} = \Sigma$. 

Notation:* $X \sim \text{Normal}(\mu, \Sigma)$. 


## Parameters
1.  **Mean Vector ($\mu$):** Determines the location of the center of the distribution in $n$-dimensional space. 
2.  **[[Covariance Matrix]] ($\Sigma$):** Determines the scale and the orientation (correlation) of the distribution.

## Properties & Transformations

### 1. Affine Transformations
If $X \sim \text{Normal}(\mu, \Sigma)$, then applying any affine transformation $Y = AX + b$ (where $A \in \mathbb{R}^{m \times n}$ is a constant matrix and $b \in \mathbb{R}^m$ is a constant vector) results in another multivariate normal vector: $$AX + b \sim \text{Normal}(A\mu + b, A\Sigma A^T)$$

### 2. Independence and Correlation
For a multivariate normal vector, the condition of being [[Uncorrelated Random Vectors|uncorrelated]] strictly implies independence.  See [[Independence of Uncorrelated Normal Variables]].

---
**Connections:**
* The error term $\epsilon$ in a [[Gaussian Linear Model]] is assumed to follow a multivariate normal distribution $\epsilon \sim \text{Normal}(0, \sigma^2 I_n)$. 
* The [[Multivariate Central Limit Theorem]] states that the sum of i.i.d. random vectors converges to a multivariate normal distribution. 