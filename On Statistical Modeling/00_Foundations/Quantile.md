---
tags: [statistics, foundations, probability]
aliases: [p-quantile, Percentile, Critical Value]
created: 2026-03-04
---
# Quantile

## Definition
For a [[Random Variable]] $X$ and a probability $p \in (0, 1)$, a value $q \in \mathbb{R}$ is called the **$p$-quantile** of the distribution if it satisfies both:
$$P(X \le q) \ge p \quad \text{and} \quad P(X \ge q) \ge 1 - p$$

If $X$ has a continuous distribution function $F$, the $p$-quantile is simply the unique value $q$ where the Cumulative Distribution Function (CDF) equals $p$:
$$F(q) = p$$



## Standard Notation
In statistical literature, quantiles for standard parametric families are denoted with specific subscripts indicating their degrees of freedom (if applicable) and the probability $p$:
* **Standard Normal:** $z_p$
* **Student's t:** $t_{n,p}$
* **Chi-Squared:** $\chi^2_{n,p}$
* **F-Distribution:** $F_{n_1,n_2,p}$

## Symmetry Properties
For symmetric distributions centered at zero (like the Standard Normal and Student's t), the quantiles exhibit perfect mirror symmetry. The probability of landing below the negative quantile is equal to the probability of landing above the positive quantile:
* Normal: $P(X \le -z_p) = P(X \ge z_p) = 1 - p$
* t-dist: $P(Y \le -t_{n,p}) = P(Y \ge t_{n,p}) = 1 - p$

---
**Connections:**
* Quantiles are the mathematical thresholds used to define the boundaries of the [[Alternative Hypothesis|Critical Region]] and the [[Confidence Interval]].