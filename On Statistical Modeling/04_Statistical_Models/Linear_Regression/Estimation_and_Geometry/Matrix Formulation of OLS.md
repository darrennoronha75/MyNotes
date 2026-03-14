---
tags: [statistics, linear-regression, estimators, linear-algebra]
aliases: [Normal Equations, OLS Estimator Matrix]
created: 2026-03-05

---

> [!abstract] Definition
> The Matrix Formulation of [[Ordinary Least Squares (OLS)]] extends the geometric principle of minimizing squared errors to $k$-dimensional space. For a [[Linear Model]] defined as $Y = A\gamma + \varepsilon$, we seek the specific parameter vector $\hat{\gamma}$ that minimizes the sum of the squared residuals.
>
> The residual vector is $\hat{\varepsilon} = Y - A\hat{\gamma}$. The objective function $S(\gamma)$ we want to minimize is the squared Euclidean norm (the dot product) of the residuals:
> $$S(\gamma) = \|\hat{\varepsilon}\|^2 = (Y - A\gamma)^T(Y - A\gamma)$$
>

## The Mathematical Derivation

To find the minimum, we expand the quadratic form, take the partial derivative (gradient) with respect to the vector $\gamma$, and set it exactly to zero.

**1. Expand the objective function:**

$$(Y^T - \gamma^T A^T)(Y - A\gamma) = Y^TY - Y^TA\gamma - \gamma^TA^TY + \gamma^TA^TA\gamma$$
Since $Y^TA\gamma$ is a scalar, it equals its transpose $\gamma^TA^TY$, simplifying to:

$$S(\gamma) = Y^TY - 2\gamma^TA^TY + \gamma^TA^TA\gamma$$

**2. Take the gradient with respect to $\gamma$ and set to $\mathbf{0}$:**

$$\frac{\partial S}{\partial \gamma} = -2A^TY + 2A^TA\gamma = 0$$

**3. The Normal Equations:**

Rearranging the derivative gives us the fundamental Normal Equations of linear regression:

$$A^TA\hat{\gamma} = A^TY$$

**4. Isolate $\hat{\gamma}$ (The Final Estimator):

Provided the [[Design Matrix]] $A$ has full column rank, the square Gram matrix $(A^TA)$ is invertible. Multiplying both sides by the inverse yields the final OLS estimator:

$$\hat{\gamma} = (A^TA)^{-1}A^TY$$



## Statistical Properties of $\hat{\gamma}$

Because $Y$ is a random vector, $\hat{\gamma}$ is also a random vector with its own distribution. Under the assumptions of the [[Linear Model]]:

1.  **Unbiasedness:** The estimator perfectly hits the true parameters on average.
    $$E[\hat{\gamma}] = E[(A^TA)^{-1}A^T(A\gamma + \varepsilon)] = \gamma + (A^TA)^{-1}A^TE[\varepsilon] = \gamma$$
2.  **Covariance (Spread):** The uncertainty of the estimates depends directly on the background noise ($\sigma^2$) and the structure of the data ($A^TA$).
    $$Cov(\hat{\gamma}) = \sigma^2 (A^TA)^{-1}$$
An illustration of how the line-fitting is done to the data is given below -

![[LinearRegression_Yahya.gif]]


---
**Connections:**
* The geometric action of projecting $Y$ onto the column space of $A$ is handled by the [[Orthogonal Projection Matrix]] (or Hat Matrix).
* Under a [[Gaussian Linear Model]], this exact matrix formula also represents the [[Maximum Likelihood Estimation]].
* The [[Gauss-Markov Theorem]] proves that out of all possible unbiased linear estimators, this specific formulation gives the smallest possible variance.

---

## Validation: Sample Mean as an OLS Base Case (k=0)

## Motivation

It is easy to get lost in high-dimensional matrix algebra. This base case serves as a crucial sanity check, linking the complex matrix operations of a General Linear Model back to the foundational statistics of 1D arrays. It mathematically proves that estimating a single sample mean is just the simplest possible form of linear regression.

## The Setup

Consider the special case where $k=0$. The model has no predictors, only a global intercept $\gamma_0$.

$$Y_i = \gamma_0 + \varepsilon_i \quad \text{for } i \in \{1,\dots,n\}$$
This simply describes $n$ uncorrelated random variables where $E[Y_i] = \gamma_0$.

## The Matrix Translation

We translate this simple scenario into our formal matrix architecture:
* **The Design Matrix ($A$):** Since there is only the intercept, $A$ is just an $n \times 1$ column vector of ones: $A = (1, \dots, 1)^T \in \mathbb{R}^n$.
* **The Gram Matrix ($A^T A$):** Multiplying a row of $n$ ones by a column of $n$ ones yields the scalar $n$.
* **The Target ($A^T Y$):** Multiplying the row of ones by the response vector $Y$ simply sums the elements: $A^T Y = \sum_{i=1}^n Y_i$.

## The Algebraic Collapse

We plug these collapsed matrices into the OLS estimator formula $\hat{\gamma} = (A^T A)^{-1}A^T Y$:

$$\hat{\gamma}_0 = (n)^{-1} \sum_{i=1}^n Y_i = \frac{1}{n} \sum_{i=1}^n Y_i = \bar{Y}$$
The complex matrix math perfectly yields the standard **sample mean**.

Furthermore, the residuals become $\hat{\varepsilon}_i = Y_i - \bar{Y}$. 
The unbiased variance estimator $\hat{\sigma}^2 = \frac{1}{n-k-1}\|\hat{\varepsilon}\|^2$ simplifies seamlessly (since $k=0$) to:

$$\hat{\sigma}^2 = \frac{1}{n-1} \sum_{i=1}^n (Y_i - \bar{Y})^2 = S^2$$
Which is the universally recognized formula for **sample variance**.

---
**Connections:**
* Validates the architecture established in the [[Matrix Formulation of OLS]].