---
tags: [statistics, linear-regression, modeling, matrices]
aliases: [General Linear Model, Multiple Linear Regression]
created: 2026-03-05

---

> [!abstract] Definition
> A Linear Model establishes a relationship between a random response vector $Y \in \mathbb{R}^n$ and a set of deterministic predictors. It assumes the expected value of the response is a linear combination of unknown parameters, plus an unobservable random error vector $\varepsilon \in \mathbb{R}^n$.
>
> Mathematically, it is written in matrix notation as:
> $$Y = A\gamma + \varepsilon$$
>
> Where:
> * **$Y$:** The $n \times 1$ random vector of observed responses.
> * **$A$:** The $n \times k$ **[[Design Matrix]]** containing the known predictor variables (usually with a first column of $1$s for the intercept).
> * **$\gamma$:** The $k \times 1$ deterministic vector of unknown parameters (coefficients) we want to estimate.
> * **$\varepsilon$:** The $n \times 1$ [[Random Vector]] of unobservable noise.


> [!warning] Strict Assumption (Second-Order Properties)
> For a model to be a standard Linear Model, we do not assume a specific probability distribution, but we strictly assume the first and second moments of the error vector $\varepsilon$:
> 1. **Zero Mean:** The noise balances out on average.
>    $$E[\varepsilon] = \mathbf{0}$$
>    *(Which implies $E[Y] = A\gamma$)*
> 2. **Homoscedasticity and Uncorrelatedness:** The errors have a constant variance ($\sigma^2 > 0$) and are mutually [[Uncorrelated Random Vectors|uncorrelated]].
>    $$Cov(\varepsilon) = \sigma^2 I_n$$
>    *(Where $I_n$ is the $n \times n$ identity matrix, implying $Cov(Y) = \sigma^2 I_n$)*
>

---
**Connections:**
* Because there is no distributional assumption, the parameters $\gamma$ are estimated purely geometrically using [[Ordinary Least Squares (OLS)]].
* If we additionally assume the errors are normally distributed, this becomes a [[Gaussian Linear Model]].
* The [[Gauss-Markov Theorem]] proves that under these specific assumptions, OLS provides the Best Linear Unbiased Estimator (BLUE).

---

## Caveat: Assumption of Deterministic Predictors



## The Generalization

In the standard rigorous formulation of the Gaussian Linear Model, the values $x_i^{(j)}$ are treated as deterministic constants.
In observational studies, these predictors are often random variables themselves. 

Remark 3.18

All theorems, exact distributions, and level-$\alpha$ limits continue to hold perfectly true if the design matrix $X$ is random, strictly provided that $X$ is mathematically independent from the random error terms $\epsilon_1, \dots, \epsilon_n$.