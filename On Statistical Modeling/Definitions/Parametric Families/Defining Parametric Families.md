## Core Concept
A parametric family is a collection of [[Probability Distributions (PDF, PMF, CMF)]] that share a specific mathematical structure or shape, but are defined by one or more adjustable constants called **parameters** (typically denoted by $\theta$).

Instead of trying to guess an infinitely complex true distribution, we assume the data comes from a specific parametric family, represented mathematically as $f_\theta(x)$.


## The Problem of Estimation
By assuming a parametric family, we drastically simplify the task of the statistician. Instead of trying to find the entire [[The Data Generating Process|data generating process]] from scratch, we only need to estimate a few parameters ($\theta$) using our collected data.

* **Example:** If we assume our data follows a Normal distribution, our entire estimation problem is reduced to finding just two numbers: the mean ($\mu$) and the variance ($\sigma^2$).

## Assumptions and Risks
Using a parametric family is often the core assumption of a statistical model. A statistical model is essentially an approximation of reality using these mathematical forms. If we assume the wrong family (e.g., assuming symmetric data when the true process is highly skewed), our subsequent hypothesis tests and predictions will be invalid.

---
**Connections:**
* See [[Core Discrete & Continuous Families]] for examples like the Poisson or Binomial families.
* This assumption is the foundation of the [[The NHST Framework]].