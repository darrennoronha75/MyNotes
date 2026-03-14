---
tags: [statistics, distributions, parametric-families, discrete, stub]
aliases: [Poisson]
created: 2026-03-04

---

> [!abstract] Definition
> The Poisson distribution models the number of events occurring within a fixed interval of time or space, provided these events occur with a known constant mean rate and independently of the time since the last event.
>

### Mathematical Formulation

A discrete random variable $X$ follows a Poisson distribution with parameter $\lambda > 0$, denoted $X \sim \text{Pois}(\lambda)$, if its PMF is:

$$f(k; \lambda) = P(X = k) = \frac{\lambda^k e^{-\lambda}}{k!} \quad \text{for } k \in \{0, 1, 2, \dots\}$$



## Key Properties

* **Equidispersion:** A unique property of the Poisson distribution is that the mean and variance are equal:
  $$E[X] = \lambda \quad \text{and} \quad Var(X) = \lambda$$
* **Summation:** If $X_1 \sim \text{Pois}(\lambda_1)$ and $X_2 \sim \text{Pois}(\lambda_2)$ are independent, then $X_1 + X_2 \sim \text{Pois}(\lambda_1 + \lambda_2)$.
* **Law of Rare Events:** The Poisson distribution is the limit of the Binomial Distribution when the number of trials is large and the probability of success is small.

## Assumptions

1. The probability of an event is proportional to the length of the interval.
2. The probability of two events occurring at the exact same time is zero.
3. Events in non-overlapping intervals are independent.

---
**Connections:**
* **Regression:** In **Poisson Regression** (a type of Generalized Linear Model), we use a log-link function to model the rate $\lambda$ as a linear combination of predictors.
* **Overdispersion:** When $Var(X) > E[X]$ in empirical data, the Poisson model is often replaced by a Negative Binomial model.