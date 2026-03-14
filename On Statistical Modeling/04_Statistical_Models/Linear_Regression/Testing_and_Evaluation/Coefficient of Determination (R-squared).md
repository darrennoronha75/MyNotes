---
tags: [statistics, linear-regression, stub]
aliases: [R-squared, Explained Variance]
created: 2026-03-04

---

## Motivation

While the absolute norm of the residuals $\|\hat{\varepsilon}\|^2$ tells us how much error remains, it is highly dependent on the physical scale of the data (e.g., millimeters vs. millions of dollars). $R^2$ transforms this error into a universal percentage, answering: *What proportion of the total chaos in the data did our model successfully explain?*

## Total Sum of Squares (TSS)

The baseline of chaos is defined by a model with zero predictors ($k=0$), meaning we simply predict the sample mean $\bar{Y}$ for every observation.
The Total Sum of Squares (TSS) is:

$$\text{TSS} = \sum_{i=1}^n (Y_i - \bar{Y})^2$$

> [!abstract] Definition of $R^2$
> The coefficient of determination is $1$ minus the ratio of the unexplainable residual variation to the baseline variation:
> $$R^2 = 1 - \frac{\|\hat{\varepsilon}\|^2}{\text{TSS}}$$
>
> * **If $R^2 = 1$:** $\|\hat{\varepsilon}\|^2 = 0$. The model passes exactly through every single data point.
> * **If $R^2 = 0$:** $\|\hat{\varepsilon}\|^2 = \text{TSS}$. The regression predictors provided zero geometric information beyond simply guessing the mean.
>

---
**Connections:**
* Forms the algebraic basis for the [[Global F-Test (Corollary 3.15)]].