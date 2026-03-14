---
tags: [statistics, foundations, random-variables]
aliases: [Multivariate Random Variable, Stochastic Vector]
created: 2026-03-04

---

> [!abstract] Definition
> A **Random Vector** is a column vector $X = (X_1, \dots, X_n)^T$ where each component $X_i$ is a [[Random Variable]] defined on the same probability space $(\Omega, \mathcal{F}, P)$. 
>
> Formally, a random vector is a measurable map:
> $$X: \Omega \to \mathbb{R}^n$$
>
>
>

## Moments of Random Vectors

Unlike scalar random variables, the "center" and "spread" of a random vector are represented by a vector and a matrix, respectively.

### 1. Expectation (Mean Vector)

The expectation of a random vector is simply the vector of the expectations of its components:

$$E[X] = (E[X_1], \dots, E[X_n])^T$$

### 2. Covariance Matrix

The spread and internal linear dependencies of a random vector are captured by the **Covariance Matrix** $\Sigma$ (or $Cov(X)$). This is an $n \times n$ symmetric matrix where the entry in the $i$-th row and $j$-th column is the covariance between $X_i$ and $X_j$:

$$\Sigma = Cov(X) = E[(X - E[X])(X - E[X])^T]$$

$$\Sigma_{ij} = Cov(X_i, X_j)$$



## Properties

* **Symmetry:** $Cov(X_i, X_j) = Cov(X_j, X_i)$, therefore $\Sigma = \Sigma^T$.
* **Positive Semi-Definiteness:** For any constant vector $a \in \mathbb{R}^n$, the variance of the linear combination $a^T X$ must be non-negative: $Var(a^T X) = a^T \Sigma a \ge 0$.
* **Linear Transformations:** If $Y = AX + b$ (where $A$ is a constant matrix and $b$ is a constant vector), then:
	* $E[Y] = AE[X] + b$
	* $Cov(Y) = A Cov(X) A^T$

## Absolutely Continuous Random Vectors

A random vector is called **absolutely continuous** if there exists a non-negative, integrable function $f: \mathbb{R}^n \to [0, \infty)$, called the **joint density function**, such that for any Borel set $A \in \mathcal{B}(\mathbb{R}^n)$:

$$P(X \in A) = \int_A f(x) \, dx$$

Whenever you see $A \in \mathcal{B}(\mathbb{R})$, it just means "A is a normal, measurable set of numbers."

---
**Connections:**
* When the components $X_i$ are independent and follow a normal distribution, the vector follows a [[Multivariate Normal Distribution]].
* The property $Cov(X, Y) = 0$ is the definition for [[Uncorrelated Random Vectors]].
* The sample-based version of the expectation vector is the basis for the **Design Matrix** in [[Linear Model]].