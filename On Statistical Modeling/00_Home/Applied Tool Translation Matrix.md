---
tags: [reference, cheat-sheet, exam-prep, r-stats]
aliases: [Translation Matrix, Tool Map]
created: 2026-03-10

---

# Applied Tool Translation Matrix

## Problem to Tool Mapping

When executing data analysis or approaching an exercise prompt, use this matrix to translate the raw objective into its required mathematical corollary and corresponding R environment command.

| The Applied Objective                                                                                        | The Theoretical Framework                                                                                                           | R Implementation                                                                       |
| :----------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------- |
| **Estimate the baseline intercept and all parameters.**                                                      | Geometric projection solving for $\hat{\gamma} = (A^T A)^{-1} A^T Y$ via the [[Matrix Formulation of OLS]].                         | `model <- lm(Y ~ X1 + X2, data=df)`<br>`summary(model)`                                |
| **Check if the model assumptions are valid.**                                                                | Verifying the $\varepsilon \sim \text{Normal}(0, \sigma^2 I_n)$ requirement of the [[Gaussian Linear Model]].                       | `qqnorm(model$residuals)`<br>`plot(model$fitted.values, model$residuals)`              |
| **Test if a specific continuous predictor matters.** *(e.g., Does more training time increase win rate?)*    | Testing a single coefficient ($H_0: \gamma_j = 0$) using the [[t-Test for Linear Combinations (Corollary 3.11)]].                   | `summary(model)` $\rightarrow$ Check the `Pr(>\|t )` column for the specific variable. |
| **Predict an outcome for new, unseen data.** *(e.g., Win rate for 50 hours on a GPU)*                        | Testing a linear combination dot product $\langle a, \hat{\gamma} \rangle$ via [[t-Test for Linear Combinations (Corollary 3.11)]]. | `predict(model, newdata=..., interval="confidence")`                                   |
| **Test if an entire categorical concept is relevant.** *(e.g., Does Agent Architecture—MCTS vs PPO—matter?)* | Testing nested orthogonal subspaces ($H \subseteq L$) using the [[Partial F-Test (Corollary 3.14)]].                                | `car::Anova(model, type="III")`                                                        |
| **Determine which specific categorical groups differ.**                                                      | Post-hoc analysis applied after rejecting the null in [[Analysis of Variance (ANOVA)]].                                             | `TukeyHSD(aov(model))`                                                                 |
| **Check if the overall model is better than guessing the mean.**                                             | Testing against the baseline $TSS$ using the [[Global F-Test (Corollary 3.15)]].                                                    | `summary(model)` $\rightarrow$ Check the final `F-statistic` line.                     |
| **Extract the unobservable noise estimate.**                                                                 | Calculating the unbiased variance estimator $\hat{\sigma}^2 = \frac{1}{n-k-1}\|\hat{\varepsilon}\|^2$.                              | `summary(model)` $\rightarrow$ `Residual standard error`                               |

## R Distribution Function Reference (DPQR)

When calculating probabilities manually, use the appropriate prefix attached to the parametric family (`norm`, `t`, `chisq`, `f`).

* **`d` (Density):** The height of the curve at $x$. (e.g., `dnorm(0)`).
* **`p` (Probability):** The area to the left of $q$ / the CDF. (e.g., `pnorm(1.96)`).
* **`q` (Quantile):** The $x$-axis value given an area $p$. (e.g., `qnorm(0.975)`).
* **`r` (Random):** Generate $n$ stochastic samples. (e.g., `rnorm(100)`).