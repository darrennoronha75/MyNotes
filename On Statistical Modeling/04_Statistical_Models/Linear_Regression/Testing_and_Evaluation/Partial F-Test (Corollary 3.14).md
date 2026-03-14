---
tags: [statistics, linear-regression, hypothesis-testing, corollary]
aliases: [Partial F-Test, Corollary 3.14, Nested F-Test]
created: 2026-03-10

---

## Motivation

When evaluating a categorical variable with $\ge 3$ levels (which spawns multiple dummy variables in the design matrix), we cannot check their $t$-tests individually. We must mathematically test if dropping that entire *block* of parameters significantly increases the unexplainable error. 

## The Hypothesis Framework

Let $J \subseteq \{0, 1, \dots, k\}$ with $J \neq \emptyset$ be the subset of indices representing the variables we want to *keep*. We test the null hypothesis that all excluded variables are perfectly zero.
* $H_0: \gamma_j = 0$ for all $j \in \{0, \dots, k\} \setminus J$
* $H_1: \gamma_j \neq 0$ for some $j \in \{0, \dots, k\} \setminus J$

Let $\hat{\varepsilon}_J$ be the residuals of the smaller, Reduced Model ($L_J$). 
Let $\hat{\varepsilon}$ be the residuals of the Full Model ($L$).

> [!info] **Partial F-Test Formulation**
> The decision rule $\varphi(Y)$ is a level-$\alpha$ test:
> $$\varphi(Y) = \begin{cases} \text{cannot reject}, & \frac{(n-k-1)(\|\hat{\varepsilon}_J\|^2 - \|\hat{\varepsilon}\|^2)}{(k+1-|J|)\|\hat{\varepsilon}\|^2} < F_{k+1-|J|, n-k-1, 1-\alpha} \\ \text{reject}, & \frac{(n-k-1)(\|\hat{\varepsilon}_J\|^2 - \|\hat{\varepsilon}\|^2)}{(k+1-|J|)\|\hat{\varepsilon}\|^2} \ge F_{k+1-|J|, n-k-1, 1-\alpha} \end{cases}$$

## The Derivation via the Pythagorean Theorem

We must map our observable errors ($\hat{\varepsilon}$) to the geometric projection differences established in Theorem 3.12.
We partition the distance from the data $Y$ to the reduced model $\hat{Y}_J$:

$$Y - \hat{Y}_J = (Y - \hat{Y}) + (\hat{Y} - \hat{Y}_J)$$
Because $Y - \hat{Y} \perp L$ (the residuals are orthogonal to the full model space), and both $\hat{Y}$ and $\hat{Y}_J$ exist inside $L$, the vector $\hat{Y} - \hat{Y}_J$ is also in $L$. Thus, the two components are perfectly orthogonal, invoking the Pythagorean theorem:

$$\|Y - \hat{Y}_J\|^2 = \|Y - \hat{Y}\|^2 + \|\hat{Y} - \hat{Y}_J\|^2$$
Substituting our residual definitions ($\|Y - \hat{Y}\| = \|\hat{\varepsilon}\|$):

$$\|\hat{\varepsilon}_J\|^2 - \|\hat{\varepsilon}\|^2 = \|\hat{Y} - \hat{Y}_J\|^2$$

This proves that the physical "explosion in error" caused by deleting the variables ($\|\hat{\varepsilon}_J\|^2 - \|\hat{\varepsilon}\|^2$) is mathematically identical to the term $\|\hat{Y} - \Pi_H Y\|^2$ from Theorem 3.12. Substituting this back into the ratio from Theorem 3.12 (where $r = |J|$) completes the F-distribution proof.



---
**Connections:**
* This theorem is structurally identical to the Sum of Squares algebra used in [[Analysis of Variance (ANOVA)]].