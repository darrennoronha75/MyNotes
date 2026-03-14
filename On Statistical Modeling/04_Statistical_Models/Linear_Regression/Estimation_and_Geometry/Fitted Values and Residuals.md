---
tags: [statistics, linear-regression, definitions]
aliases: [Fitted Values, Residuals, Y-hat, Epsilon-hat]
created: 2026-03-10

---

## Motivation

In statistics, there is a strict philosophical boundary between the unobservable true universe and the mathematical shadows we cast from our samples. Defining fitted values and residuals separately from the true parameters ensures we never confuse our *estimates* of reality with reality itself.

## The True, Unobservable Model

In the model $Y = A\gamma + \varepsilon$:
* **$A\gamma$**: The true, perfect deterministic signal.
* **$\varepsilon$**: The true, unobservable random error vector. 

## The Observable Estimations

### 1. Fitted Values ($\hat{Y}$)

Once the OLS estimator $\hat{\gamma}$ is computed, we generate our model's predictions for the dataset. These predictions are the **fitted values**.

$$\hat{Y} = A\hat{\gamma}$$
Because $\hat{\gamma} = (A^T A)^{-1}A^T Y$, we can express the fitted values geometrically as the projection of $Y$ via the [[Hat Matrix]]:

$$\hat{Y} = \Pi_{\mathbb{L}} Y$$

### 2. Residuals ($\hat{\varepsilon}$)

The residuals are the actual, measurable mistakes our specific model made on our sample data. They act as a proxy for the unobservable error vector $\varepsilon$.

$$\hat{\varepsilon} = Y - \hat{Y}$$
Geometrically, the residuals are isolated by applying the Annihilator Matrix to the observation vector:

$$\hat{\varepsilon} = (I_n - \Pi_{\mathbb{L}})Y$$

---
**Connections:**
* The properties of the residual vector are formalized in [[Lemma 3.6 - Projection and Annihilator Matrices]].
* The variance of the residuals is used to estimate the true noise $\sigma^2$ in [[Theorem 3.7 - Unbiasedness and Covariance of OLS]].