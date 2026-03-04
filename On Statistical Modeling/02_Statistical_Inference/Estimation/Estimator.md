---
tags: [statistics, inference, estimation]
aliases: [Estimator Function]
created: 2026-03-04
---
## Definition
In parametric statistics, an estimator is a measurable map (a mathematical rule or function) used to guess the value of an unknown population parameter based on observable data. 

Let the sample space be $\mathcal{X}$, and let the true data generating parameter be $\vartheta \in \Theta$. If we want to estimate some function of the parameter $g(\vartheta)$, an estimator $U$ is a measurable map:
$$U: \mathcal{X} \to \mathbb{R}^m$$

## Intuition
Because an estimator $U$ is calculated directly from a random sample $X$, the estimator itself is a [[Random Variable]] (or random vector). It does not output the guaranteed "true" value; it outputs a "guess" that carries its own probability distribution.

## Key Desirable Properties
Because estimators are imperfect, statisticians evaluate their quality based on specific mathematical properties:
1. **[[Unbiased Estimator]]:** Does the estimator hit the true target *on average*?
2. **[[Consistent Estimator]]:** Does the estimator perfectly lock onto the true target if we collect an infinite amount of data?
3. **Efficiency:** Does the estimator have the smallest possible variance compared to other estimators?

---
**Connections:**
* The sample mean $\bar{X}$ is the classic estimator for the population mean $\mu$.
* Estimators are typically generated via methods like [[Maximum Likelihood Estimation]] or [[Ordinary Least Squares (OLS)]].