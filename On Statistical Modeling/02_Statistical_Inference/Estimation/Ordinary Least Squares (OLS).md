---
tags: [statistics, estimators, linear-regression]
aliases: [OLS, Residuals, Method of Least Squares]
created: 2026-03-04
---
# Ordinary Least Squares (OLS)

## Definition
Ordinary Least Squares (OLS) is a mathematical method used to estimate the unknown parameters ($\beta$) in a [[Gaussian Linear Model]]. It finds the specific coefficient estimates ($\hat{\beta}$) that strictly minimize the sum of the squared vertical distances (the residuals, $e_i$) between the observed data points and the predicted line.



## Estimating the Variance ($\hat{\sigma}^2$)
In addition to the coefficients, OLS estimates the true background population variance ($\sigma^2$) by taking the average of the squared residuals ($e_i = y_i - \hat{y}_i$). 

To ensure this estimator is unbiased, we must adjust the denominator to account for the degrees of freedom spent fitting the model:
$$\hat{\sigma}^2 = \frac{\sum (y_i - \hat{y}_i)^2}{n - p - 1}$$

## The "Loss of Liberty" ($n - p - 1$)
Because the OLS estimator ($\hat{\beta}$) is specifically engineered to minimize the residuals for *that specific sample*, the raw residuals will naturally appear slightly smaller than the true population errors. Dividing by a smaller number ($n - p - 1$ instead of $n$) inflates the result just enough to correct for that bias.
* **$n$**: Total number of observations (the starting "bank" of freedom).
* **$p$**: Number of non-intercept predictors (the "cost" of the slopes).
* **$1$**: The intercept ($\beta_0$).

Every parameter estimated spends one degree of freedom.

---
**Connections:**
* Because OLS estimators are calculated from sample data, they are themselves [[Statistic|random variables]] with their own covariance matrices.
* The $n - p - 1$ denominator is mathematically identical to the $N - J$ denominator used in the within-group variance of the [[Analysis of Variance (ANOVA)]].