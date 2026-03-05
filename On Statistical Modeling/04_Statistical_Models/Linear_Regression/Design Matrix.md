---
tags: [statistics, linear-regression, linear-algebra, matrices]
aliases: [Model Matrix, Predictor Matrix, Matrix A, Matrix X]
created: 2026-03-05
---
# Design Matrix

## Definition
The Design Matrix (often denoted as $A$ or $X$) is the core architectural component of a [[Linear Model]]. It is an $n \times k$ matrix that holds all the observed, deterministic data for the predictor variables. 

* **Rows ($n$):** Each row represents one single, independent observation or experimental unit.
* **Columns ($k$):** Each column represents a specific feature, predictor, or parameter being estimated (including the intercept).

$$A = \begin{pmatrix}
a_{11} & a_{12} & \dots & a_{1k} \\
a_{21} & a_{22} & \dots & a_{2k} \\
\vdots & \vdots & \ddots & \vdots \\
a_{n1} & a_{n2} & \dots & a_{nk}
\end{pmatrix}$$



## Structural Variations
The structure of the Design Matrix dictates the exact type of model being fitted. By manipulating the columns of $A$, the standard $Y = A\gamma + \varepsilon$ equation can represent vastly different geometric shapes and experimental designs.

### 1. The Standard Multiple Regression (With Intercept)
To estimate a baseline intercept ($\gamma_0$), the very first column of the matrix must be a column of pure $1$s.
$$A = \begin{pmatrix} 
1 & x_{11} & x_{12} \\ 
1 & x_{21} & x_{22} \\ 
\vdots & \vdots & \vdots \\ 
1 & x_{n1} & x_{n2} 
\end{pmatrix}$$
*When multiplied by the parameter vector $\gamma = (\gamma_0, \gamma_1, \gamma_2)^T$, the $1$ perfectly isolates the $\gamma_0$ intercept term.*

### 2. Regression Through the Origin
If the physics of the problem dictate that $Y$ must be exactly $0$ when all predictors are $0$ (e.g., measuring mass vs. volume), we drop the intercept. The matrix simply contains the raw variables.
$$A = \begin{pmatrix} 
x_{11} & x_{12} \\ 
x_{21} & x_{22} \\ 
\vdots & \vdots
\end{pmatrix}$$

### 3. The ANOVA Design Matrix (Dummy Variables)
When dealing with categorical groups rather than continuous numbers (e.g., Treatment A vs. Treatment B), the Design Matrix uses binary "indicator" columns (0s and 1s).
$$A = \begin{pmatrix} 
1 & 0 \\  \leftarrow \text{Subject 1 is in Group A} \\
1 & 0 \\  \leftarrow \text{Subject 2 is in Group A} \\
0 & 1 \\  \leftarrow \text{Subject 3 is in Group B} \\
0 & 1 \\  \leftarrow \text{Subject 4 is in Group B} 
\end{pmatrix}$$
*This is the exact matrix structure that links the [[Linear Model]] to [[Analysis of Variance (ANOVA)]].*

## The Rank Assumption
For the parameters to be uniquely estimable, the Design Matrix must have **Full Column Rank** ($rank(A) = k$). This means no column can be a perfect linear combination of the other columns. If columns are perfectly correlated (e.g., one column is "Length in meters" and another is "Length in centimeters"), the matrix suffers from strict multicollinearity, the determinant becomes zero, and the model mathematically shatters.

---
**Connections:**
* The mathematical operation required to solve for the parameters relies on the Gram matrix form ($A^TA$), as defined in the [[Matrix Formulation of OLS]].