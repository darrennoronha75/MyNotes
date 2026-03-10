---
tags: [statistics, theorems, linear-algebra, anova]
aliases: [Theorem 3.12, Nested Models, Subspace Projection]
created: 2026-03-10
---
## Motivation
To test if an entire *group* of variables is useless, we cannot test them individually. We must compare a "Full Model" against a "Reduced Model" that deletes those variables entirely. This theorem provides the geometric proof that the difference in predictions between two nested models mathematically constructs an F-distribution, unlocking the Partial F-Test.

## The Geometric Setup

Consider a Gaussian linear model where $L$ is the full parameter subspace (dimension $k+1$).
Let $H \subseteq \mathbb{R}^n$ be a smaller linear subspace representing the Reduced Model, where $r = \dim H < k+1$.

Assume the nested condition $H \subseteq L$, and that the true underlying signal actually lives in the smaller space: $A\gamma \in H$.

Let $\Pi_H$ be the orthogonal projection onto $H$.

> [!info] **Theorem 3.12 Properties**
> **a)** The model difference vector $(\hat{Y} - \Pi_H Y)$ and the full model residuals $\hat{\varepsilon}$ are strictly independent.
> **b)** The squared distance between models is $\chi^2$ distributed: $\frac{\|\hat{Y} - \Pi_H Y\|^2}{\sigma^2} \sim \chi^2_{k+1-r}$
> **c)** If $n > k+1$, the scaled ratio forms an F-distribution:
> $$\frac{(n-k-1)\|\hat{Y} - \Pi_H Y\|^2}{(k+1-r)\|\hat{\varepsilon}\|^2} \sim \mathcal{F}_{k+1-r, n-k-1}$$

## Rigorous Proof

### Proof of Part A (Independence)

Using Lemma 3.6, we expand the vectors:

$\hat{Y} - \Pi_H Y = (\Pi_L - \Pi_H)Y = (\Pi_L - \Pi_H)(A\gamma + \varepsilon)$

Because we assumed $A\gamma \in H \subseteq L$, the projection of $A\gamma$ onto either space is just $A\gamma$, causing them to cancel out:

$= A\gamma - A\gamma + (\Pi_L - \Pi_H)\varepsilon = (\Pi_L - \Pi_H)\varepsilon$

To prove independence, we evaluate the expected cross-product with $\hat{\varepsilon} = (I_n - \Pi_L)\varepsilon$:

$$E[\hat{\varepsilon}(\hat{Y} - \Pi_H Y)^T] = E[(I_n - \Pi_L)\varepsilon \varepsilon^T (\Pi_L - \Pi_H)^T]$$
$$= \sigma^2(I_n - \Pi_L)(\Pi_L - \Pi_H)$$
Because projections are idempotent ($\Pi_L^2 = \Pi_L$) and nested ($\Pi_L \Pi_H = \Pi_H$):
$$= \sigma^2(\Pi_L - \Pi_H - \Pi_L^2 + \Pi_L \Pi_H) = \sigma^2(\Pi_L - \Pi_H - \Pi_L + \Pi_H) = \mathbf{0}$$
Zero correlation implies strict independence under joint normality.

### Proof of Part B ($\chi^2$ Distribution)

Let $u_1, \dots, u_n$ be an orthonormal base where $u_1, \dots, u_r$ generate $H$, and $u_1, \dots, u_{k+1}$ generate $L$. Let $O$ be the matrix of these vectors.

$$\|\hat{Y} - \Pi_H Y\|^2 = \|(\Pi_L - \Pi_H)\varepsilon\|^2 \stackrel{d}{=} \|O^T(\Pi_L - \Pi_H)O\varepsilon\|^2$$

The matrix $O^T(\Pi_L - \Pi_H)O$ is a diagonal matrix whose elements are exactly zero except for the $(r+1)$-st to the $(k+1)$-st elements, which are $1$. 

This flawlessly isolates exactly $(k+1) - r$ standard normal variables:
$$\frac{1}{\sigma^2}\|\hat{Y} - \Pi_H Y\|^2 \stackrel{d}{=} \frac{1}{\sigma^2}\sum_{i=r+1}^{k+1} \varepsilon_i^2 \sim \chi^2_{k+1-r}$$

---
**Connections:**
* The exact theoretical foundation for the [[Partial F-Test (Corollary 3.14)]].