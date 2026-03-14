---
tags: [statistics, foundations, probability]
aliases: [p-quantile, Percentile, Critical Value]
created: 2026-03-04

---

## Formal Definition

For a random variable $X$ and a given probability $p \in (0, 1)$, a value $q \in \mathbb{R}$ is defined as the **$p$-quantile** of the distribution of $X$ if it simultaneously satisfies both:

$$P(X \le q) \ge p \quad \text{and} \quad P(X \ge q) \ge 1 - p$$

## Continuous Distributions

In the specific case where $X$ has a continuous distribution function $F$, the inequalities collapse into a strict equality. The value $q$ is a $p$-quantile if and only if:

$$F(q) = p$$


## Standard Notations in Parametric Families

In statistical modeling, quantiles for standard distributions are denoted with specific subscripts indicating their required degrees of freedom (if any) and the target probability $p$:

| Distribution Family | Degrees of Freedom | Quantile Notation |
| :--- | :---: | :--- |
| **Standard Normal** | None | $z_p$ |
| **Student's t** | $n$ | $t_{n,p}$ |
| **Chi-Squared** | $n$ | $\chi^2_{n,p}$ |
| **F-Distribution** | $n_1, n_2$ | $\mathcal{F}_{n_1,n_2,p}$ |

## Symmetry Properties

For symmetric distributions centered at zero, specifically the Standard Normal ($X \sim \text{Normal}(0, 1)$) and the Student's t-distribution ($Y \sim t_n$), their shapes obey strict mirror symmetry:

$$P(X \le -u) = P(X \ge u)$$

For their specific quantiles, this symmetry allows us to calculate lower-tail probabilities using upper-tail quantiles:

$$P(X \le -z_p) = P(X \ge z_p) = 1 - P(X \le z_p) = 1 - p$$ $$P(Y \le -t_{n,p}) = P(Y \ge t_{n,p}) = 1 - P(Y \le t_{n,p}) = 1 - p$$

---
**Connections:**
* These exact symmetries are what allow us to algebraically compress the bounds in [[Confidence Region]] proofs.