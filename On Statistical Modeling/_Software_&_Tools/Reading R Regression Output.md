---
tags: [statistics, software, linear-regression]
aliases: [summary.lm, R Output, Example 3.16, Example 3.17]
created: 2026-03-10
---
# Reading R Regression Output

## Motivation
Statistical software (like R) abstracts away the heavy matrix math. Understanding how the theoretical corollaries directly map to the `summary(lm())` and `Anova()` outputs is critical for applied analysis.

## Mapping the Summary Table (Example 3.16)
Consider a model predicting tooth length (`len`) using `dose`, supplement type (`suppVC`), and an interaction term (`dose:suppVC`).
* **`Residual standard error`**: This is $\hat{\sigma}$, the square root of $\frac{||\hat{\epsilon}||^2}{n-k-1}$. 
* **`Degrees of freedom`**: Calculated as $n - k - 1$ ($60 - 3 - 1 = 56$).
* **`Std. Error` (Coefficients Table)**: These are the mathematical roots of the diagonal elements of the inverted Gram matrix $\sigma^2(A^T A)^{-1}$.
* **`t value`**: This is the ratio of the Estimate to the Std. Error. This exactly matches the test statistic formulation from [[Corollary 3.11 - t-Test for Linear Combinations]] for testing $H_0: \gamma_j = 0$.
* Pr(>|t|)`**: The p-value for the two-sided t-test. If it is $< 0.05$, we reject the null and conclude the coefficient's true sign matches the estimate's sign.
* **`F-statistic` (Bottom Line)**: This runs the [[Global F-Test (Corollary 3.15)]] to verify if all coefficients aside from the intercept are zero.

## Mapping the Anova Table (Example 3.17)
When dealing with categorical predictors with $>2$ levels (like `education_level: school, college, university`, the `summary` table splits them into multiple dummy variables. You cannot use the individual t-tests to evaluate the variable as a whole.

By running `Anova(model, type="III")` from the `car` package, R runs the [[Partial F-Test (Corollary 3.14)]]. It groups the dummy variables back together (e.g., `education_level` gets `Df = 2`) and provides a single global p-value `Pr(>F)` to test if the entire categorical concept is mathematically relevant to the model.