---
tags: [statistics, foundations, covariance]
aliases: [Uncorrelated, Uncorrelatedness]
created: 2026-03-04
---
# Uncorrelated Random Vectors

## Definition
Two random vectors $X = (X_1, \dots, X_m)^T$ and $Y = (Y_1, \dots, Y_n)^T$ with finite second moments ($E[\|X\|^2] < \infty$ and $E[\|Y\|^2] < \infty$) are called **uncorrelated** if the covariance between every possible pair of their components is strictly zero.

Mathematically, this means their cross-covariance matrix is a zero matrix:
$$Cov(X, Y) := (Cov(X_i, Y_j))_{i \in \{1,\dots,m\}, j \in \{1,\dots,n\}} = \mathbf{0}$$
When we combine $X$ and $Y$ into a single system, this results in a **Joint Covariance Matrix** with a distinct block diagonal structure:

$$\text{Cov}\begin{pmatrix} X \\ Y \end{pmatrix} = \left[ \begin{array}{c|c} \mathbf{\Sigma_{XX}} & \mathbf{0}_{m \times n} \\ \hline \mathbf{0}_{n \times m} & \mathbf{\Sigma_{YY}} \end{array} \right]$$

Here is the expanded structure, highlighting exactly where the zero matrices live: - 

$$\text{Cov}\begin{pmatrix} X \\ Y \end{pmatrix} = \underbrace{\begin{bmatrix} \begin{array}{ccc|ccc} \sigma^2_{x_1} & \cdots & \sigma_{x_1x_m} & \color{red}{0} & \cdots & \color{red}{0} \\ \vdots & \ddots & \vdots & \vdots & \ddots & \vdots \\ \sigma_{x_mx_1} & \cdots & \sigma^2_{x_m} & \color{red}{0} & \cdots & \color{red}{0} \\ \hline \color{red}{0} & \cdots & \color{red}{0} & \sigma^2_{y_1} & \cdots & \sigma_{y_1y_n} \\ \vdots & \ddots & \vdots & \vdots & \ddots & \vdots \\ \color{red}{0} & \cdots & \color{red}{0} & \sigma_{y_ny_1} & \cdots & \sigma^2_{y_n} \end{array} \end{bmatrix}}_{\text{Block Diagonal Matrix}}$$

- The **Red Sections** are the Cross-Covariance matrices. They are **Zero Matrices**.    
- The **White Sections** are the Auto-Covariance matrices. They contain the data's variance.    
- The **Entire Matrix** is a **Block Diagonal Matrix**.
## Properties / Assumptions
* **Relationship to Independence:** Independence is a strictly stronger property than uncorrelatedness. If two random vectors are independent, they are necessarily uncorrelated.
* **The Caveat:** The reverse is *not* generally true. Uncorrelated random vectors can still be highly dependent (e.g., through non-linear relationships like $Y = X^2$). 
* **The Exception:** The only scenario where uncorrelatedness strictly implies independence is within the [[Multivariate Normal Distribution]]. See [[Independence of Uncorrelated Normal Variables]].

---
**Connections:**
* Covariance is a foundational operator required to define the [[Multivariate Central Limit Theorem]].