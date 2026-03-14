---
tags: [statistics, distributions, parametric-families, discrete, stub]
aliases: [Bernoulli, Binomial]
created: 2026-03-04

---

> [!abstract] Definition
> The Bernoulli distribution models a single random experiment with exactly two possible outcomes: "Success" ($1$) and "Failure" ($0$). It is the simplest discrete probability distribution and serves as the building block for more complex processes.
>

### Mathematical Formulation

A random variable $X$ follows a Bernoulli distribution with parameter $p \in [0, 1]$, denoted $X \sim \text{Bern}(p)$, if its Probability Mass Function (PMF) is:

$$f(x; p) = p^x (1-p)^{1-x} \quad \text{for } x \in \{0, 1\}$$

### Properties

* **Expectation:** $E[X] = p$
* **Variance:** $Var(X) = p(1-p)$
* **Moment Generating Function:** $M_X(t) = (1-p) + pe^t$

---
**Connections:**
* **GLM Link:** Forms the foundation for the **Logistic Regression Model**, where the probability $p$ of a Bernoulli outcome is modeled using a logit link function.
* **Generalization:** Summing $n$ independent Bernoulli trials results in a [[Binomial Distribution]].