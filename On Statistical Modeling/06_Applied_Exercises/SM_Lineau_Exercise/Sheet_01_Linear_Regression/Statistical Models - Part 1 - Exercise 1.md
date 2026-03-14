---
tags: [exercise-index, statistical-models, linear-regression]
aliases: [SM Sheet 1, Exercise Sheet 1]
---

## Core Theme

This sheet covers the application of the [[Gaussian Linear Model]] through manual calculation, R implementation, and theoretical derivation.

---

## Problem 1: The Mechanics of Simple Linear Regression

**The Goal:** Build a model with one continuous predictor (Latitude) to predict a continuous outcome (Mortality), test its validity, and make a prediction. 

**The Challenge:** Executing the matrix algebra manually before relying on R to understand the mechanics under the hood.

* **Theoretical Mapping:** * [[Matrix Formulation of OLS]] to calculate $\hat{\gamma} = (A^TA)^{-1}A^TY$.
    * [[t-Test for Linear Combinations (Corollary 3.11)]] for the one-sided slope test ($H_1: \gamma_1 < 0$).
    * The exact formula for a [[Confidence Interval]] applied to a new prediction point ($x = 40$).
* **R Toolkit:** `lm()`, `summary()`, `confint.glht()`, and `predict(..., interval="confidence")`.

**Workspace & Solution:**
[[Solution - SM - Part 1 - Ex1 - Problem 1]]

---

## Problem 2: Model Diagnostics (Verifying Assumptions)

**The Goal:** A GLM is completely mathematically invalid if the errors ($\varepsilon$) are not normally distributed with constant variance. You must visually prove these assumptions hold for three different models.

**The Challenge:** Interpreting diagnostic plots to spot violations like heteroscedasticity (funnel shapes) or non-normality (curved Q-Q plots).

* **Theoretical Mapping:** * [[Gaussian Linear Model]] (specifically the strict assumption: $\varepsilon \sim \text{Normal}(0, \sigma^2 I_n)$).
    * [[Fitted Values and Residuals]] (Understanding that $\hat{\varepsilon}$ is our proxy for the unobservable true error).
* **R Toolkit:** `qqnorm()` to check the bell-curve assumption, and `plot(fitted, residuals)` to check for constant, uncorrelated noise.

**Workspace & Solution:**
[[Solution - SM - Part 1 - Ex1 - Problem 2]]

---

## Problem 3: Categorical Predictors & Multiple Regression

**The Goal:** Move from a simple 1D line to a multi-variable plane that includes categorical text data (Private vs. Rural school).

**The Challenge:** Mathematics cannot process the word "Rural". You must understand how categorical data is transformed into a mathematical matrix.

* **Theoretical Mapping:** * [[Design Matrix]] (specifically utilizing the "Dummy Variable" structural variation).
    * Evaluating the slope of the dummy variable using [[t-Test for Linear Combinations (Corollary 3.11)]].
* **R Toolkit:** R handles dummy variables automatically inside `lm(Height ~ School + Age)`.

**Workspace & Solution:**
[[Solution - SM - Part 1 - Ex1 - Problem 3]]

---

## Problem 4: Theoretical Unification (The Capstone)

**The Goal:** Prove that a standard Two-Sample t-test is literally just a Gaussian Linear Model in disguise. 
**The Challenge:** This is a pure mathematical proof. You must define a Design Matrix $A$ with binary indicator columns, and prove that the OLS estimator $(A^TA)^{-1}A^TY$ algebraically simplifies into the exact Two-Sample t-test formula.

* **Theoretical Mapping:** * [[Design Matrix]] (Formulating the matrix for two distinct groups).
    * [[Two-Sample t-Test]] (The target equation we are trying to derive).
    * [[Level Alpha Test]] (Proving the Type I error limit bounds).
* **R Toolkit:** N/A - Pure theoretical proof.

**Workspace & Solution:**
[[Solution - SM - Part 1 - Ex1 - Problem 4]]