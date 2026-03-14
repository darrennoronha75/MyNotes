---
tags: [statistics, linear-regression, linear-algebra, matrices]
aliases: [Model Matrix, Predictor Matrix, Matrix A, Matrix X]
created: 2026-03-10

---
The word "Linear" in a Linear Model refers strictly to the parameters ($\gamma$), not the shape of the data. The Design Matrix exists to act as a mathematical translation layer. By engineering the columns of this matrix, we can embed highly non-linear geometries (curves, conditional slopes, categorical logic) into a perfectly flat, easily solvable linear algebra space.

> [!abstract] Definition
> The Design Matrix $A$ is an $n \times (k+1)$ matrix that holds all the observed, deterministic data for the predictor variables. 
> * **Rows ($n$):** Each row represents one single, independent observation.
> * **Columns ($k+1$):** Each column represents a specific feature, predictor, or parameter being estimated (including the intercept).
>
> $$A = \begin{pmatrix} 
> 1 & x^{(1)}_1 & \dots & x^{(k)}_1 \\ 
> 1 & x^{(1)}_2 & \dots & x^{(k)}_2 \\ 
> \vdots & \vdots & \ddots & \vdots \\ 
> 1 & x^{(1)}_n & \dots & x^{(k)}_n 
> \end{pmatrix}$$
>

## Structural Variations (Feature Engineering)

By manipulating the columns of $A$, the standard $Y = A\gamma + \varepsilon$ equation can represent complex experimental designs without changing the underlying optimization math.

### 1. The ANOVA Design Matrix (Dummy Variables)

When dealing with categorical groups (e.g., Treatment A vs. B), the matrix uses binary indicator columns. 

$$x^{(j)}_i = \mathbf{1}\{\text{subject } i \text{ is in group } j\}$$
*(Note: To avoid perfect multicollinearity, one category is always dropped and absorbed into the intercept $\gamma_0$.)*

### 2. Polynomial Regression

To model a curved relationship, we simply add a new column to the matrix that is the mathematical power of an existing independent variable. 
* Example: $Y = \gamma_0 + \gamma_1 x + \gamma_2 x^2 + \varepsilon$
* The design matrix receives a column containing $x$ and a separate column containing $x^2$. The model remains linear with respect to $\gamma$.

### 3. Interaction Terms

To model situations where the effect of one variable depends entirely on another (e.g., the effect of a drug dose depends on the delivery method), we create an interaction column by multiplying two existing columns together.
* Example: $Y = \gamma_0 + \gamma_1 \text{dose} + \gamma_2 \mathbf{1}\{\text{supp}=VC\} + \gamma_3 (\mathbf{1}\{\text{supp}=VC\} \times \text{dose}) + \varepsilon$
* The parameter $\gamma_3$ now specifically estimates the *difference* in slope between the two supplement types.

## The Rank Assumption

For the parameters to be uniquely estimable, $A^T A$ must be invertible. This is strictly equivalent to requiring the Design Matrix $A$ to have **Full Column Rank** ($rank(A) = k+1$). No column can be a perfect linear combination of the other columns.

---
**Connections:**
* Forms the column space $\mathbb{L}$ onto which the [[Orthogonal Projection Matrix]] operates.

---

## Variation: Models Without Intercept



## The Adjustment

In standard formulations, the intercept $\gamma_0$ dictates that the first column of the [[Design Matrix]] $A$ is filled with ones. 

If a physical model requires forcing the regression through the origin (no intercept), all previous geometric proofs and theorems continue to hold perfectly. 

**The single required adjustment:** Because you are estimating one less parameter, you must replace the number of parameters $k+1$ with $k$ in all degrees of freedom calculations.