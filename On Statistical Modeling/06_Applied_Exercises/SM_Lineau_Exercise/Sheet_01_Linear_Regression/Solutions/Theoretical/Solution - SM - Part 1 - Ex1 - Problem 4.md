---
tags: [exercise-solution, statistical-models, linear-regression, formal-proofs]
---

# Solution - SM - Part 1 - Ex1 - Problem 4

![[SM-P1-e1-p4.png]]

---

> [!info] **The Setup**
> * We have two independent random samples: $Z_1$ (size $n_1$, mean $\mu_1$) and $Z_2$ (size $n_2$, mean $\mu_2$).
> * Both share the same unknown variance $\sigma^2$. 
> * Total sample size $n = n_1 + n_2 \ge 3$.
> * **The Goal:** Test $H_0: \mu_1 = \mu_2$ against $H_1: \mu_1 \neq \mu_2$ using the given formula, and prove it is a Level-$\alpha$ test.

### Part a) Formulate the situation as a regression problem.

* **Theoretical Link:** [[Design Matrix]] (Dummy Variables) & [[Linear Model]].
* **The Process (The Professor's Way):** We must map two separate vectors ($Z_1$ and $Z_2$) into one unified Gaussian Linear Model: $Y = A\gamma + \varepsilon$. 
    1. We stack the observations into a single response vector $Y$ of length $n_1 + n_2$.
    2. We build the Design Matrix $A$. The first column is our global intercept (a column of all $1$s). 
    3. The second column is our "Dummy Variable" or indicator. We assign $0$ for the first $n_1$ rows (Group 1) and $1$ for the remaining $n_2$ rows (Group 2). 
    4. By defining our parameter vector as $\gamma = (\gamma_0, \gamma_1)^T$, Group 1's expected value is $\gamma_0$ and Group 2's expected value is $\gamma_0 + \gamma_1$. Therefore, the slope $\gamma_1$ physically represents the difference in means ($\mu_2 - \mu_1$).

So, if there is no difference in means, the "null hypothesis" still holds.

### Part b) Show that the two-sample t-test is a level-$\alpha$ test.

* **Theoretical Link:** [[Level Alpha Test]], [[Matrix Formulation of OLS]], and [[t-Test for Linear Combinations (Corollary 3.11)]].

* **The Process:** 
1. **General Principle:** To prove any test is a Level-$\alpha$ test, you must prove that the probability of rejecting a true Null Hypothesis is exactly bounded by $\alpha$. Mathematically: $P_{H_0}(T_{obs} \in K) \le \alpha$.
2. **The Shortcut:** Because Professor Schulte has already rigorously proven Corollary 3.11 (which guarantees the confidence interval for a linear combination rejects $H_0$ at exactly level $\alpha$), we do not need to integrate probability density functions from scratch.
3. **The Proof:** We merely need to execute the matrix algebra to prove that the terrifying formula provided in the prompt is algebraically identical to the generic interval from Corollary 3.11. We must show that $\hat{\gamma}_1 = \bar{Z}_2 - \bar{Z}_1$ and that the standard error derived from the Gram matrix $(A^T A)^{-1}$ exactly matches $S \sqrt{\frac{1}{n_1} + \frac{1}{n_2}}$

---

## Summarized Solution

### a) Formulate as a regression problem.

Let $n = n_1 + n_2$. We define the $n \times 1$ response vector $Y$ by stacking $Z_1$ on top of $Z_2$:
$$Y = (Z_{1}^{(1)}, \dots, Z_{1}^{(n_1)}, Z_{2}^{(1)}, \dots, Z_{2}^{(n_2)})^T$$

We define the $n \times 2$ Design Matrix $A$ using the dummy variable method. The first column is the intercept (all ones). The second column indicates group membership (0 for $Z_1$, 1 for $Z_2$):
$$A = \begin{bmatrix} 1 & 0 \\ \vdots & \vdots \\ 1 & 0 \\ 1 & 1 \\ \vdots & \vdots \\ 1 & 1 \end{bmatrix} \leftarrow n_1 \text{ rows} \atop \leftarrow n_2 \text{ rows}$$

(Apologies for the misaligned visualization above - best possible for now and the professor draws this version out anyway.)

Our parameter vector is $\gamma = (\gamma_0, \gamma_1)^T$. 
* The expected value for the first group is $E[Z_1] = \gamma_0 = \mu_1$.
* The expected value for the second group is $E[Z_2] = \gamma_0 + \gamma_1 = \mu_2$.

Consequently, the parameter $\gamma_1 = \mu_2 - \mu_1$. The hypotheses translate perfectly:
* $H_0: \mu_1 = \mu_2 \iff H_0: \gamma_1 = 0$
* $H_1: \mu_1 \neq \mu_2 \iff H_1: \gamma_1 \neq 0$

### b) Show that it is a level-$\alpha$ test.

> **Explainer: How to show a test is Level-$\alpha$**
> To prove a test has level $\alpha$, you assume the Null Hypothesis is strictly true and prove that the false positive rate is bounded by $\alpha$. In the GLM framework, we rely on the pre-proven **Corollary 3.11**. If we can map the prompt's specific formula onto the generic parameters of Corollary 3.11, the level-$\alpha$ property is inherited automatically. 

We must calculate the OLS estimator $\hat{\gamma} = (A^T A)^{-1} A^T Y$.
First, calculate the Gram matrix $A^T A$:
$$A^T A = \begin{bmatrix} n_1 + n_2 & n_2 \\ n_2 & n_2 \end{bmatrix}$$

Next, invert it. The determinant is $(n_1+n_2)n_2 - n_2^2 = n_1 n_2$:
$$(A^T A)^{-1} = \frac{1}{n_1 n_2} \begin{bmatrix} n_2 & -n_2 \\ -n_2 & n_1 + n_2 \end{bmatrix} = \begin{bmatrix} \frac{1}{n_1} & -\frac{1}{n_1} \\ -\frac{1}{n_1} & \frac{1}{n_1} + \frac{1}{n_2} \end{bmatrix}$$

Calculate the target vector $A^T Y$:
$$A^T Y = \begin{bmatrix} \sum_{i=1}^{n_1} Z_1^{(i)} + \sum_{i=1}^{n_2} Z_2^{(i)} \\ \sum_{i=1}^{n_2} Z_2^{(i)} \end{bmatrix} = \begin{bmatrix} n_1 \bar{Z}_1 + n_2 \bar{Z}_2 \\ n_2 \bar{Z}_2 \end{bmatrix}$$

Multiply to find $\hat{\gamma}$:
$$\hat{\gamma} = \begin{bmatrix} \frac{1}{n_1} & -\frac{1}{n_1} \\ -\frac{1}{n_1} & \frac{1}{n_1} + \frac{1}{n_2} \end{bmatrix} \begin{bmatrix} n_1 \bar{Z}_1 + n_2 \bar{Z}_2 \\ n_2 \bar{Z}_2 \end{bmatrix} = \begin{bmatrix} \bar{Z}_1 \\ \bar{Z}_2 - \bar{Z}_1 \end{bmatrix}$$
Our point estimate for the difference is exactly $\hat{\gamma}_1 = \bar{Z}_2 - \bar{Z}_1$.

Now, calculate the standard error for $\hat{\gamma}_1$. According to Corollary 3.11, using selector vector $a = (0, 1)^T$, the variance scalar is strictly the bottom-right element of $(A^T A)^{-1}$. 
$$a^T (A^T A)^{-1} a = ((A^T A)^{-1})_{2,2} = \frac{1}{n_1} + \frac{1}{n_2} = \frac{n_1 + n_2}{n_1 n_2}$$

The unbiased variance estimator $\hat{\sigma}^2$ from the regression model perfectly matches the pooled sample variance $S^2$ provided in the prompt. Therefore, the standard error is:
$$SE(\hat{\gamma}_1) = S \sqrt{\frac{n_1 + n_2}{n_1 n_2}}$$

**Conclusion:**
By mapping our findings to the two-sided Confidence Interval from **Corollary 3.11**, the generic interval $I^{\neq}_{a,\hat{\gamma}}$ expands precisely to:
$$I = \left( (\bar{Z}_2 - \bar{Z}_1) \pm t_{n_1+n_2-2, 1-\alpha/2} \cdot S \sqrt{\frac{n_1 + n_2}{n_1 n_2}} \right)$$
Because Corollary 3.11 mathematically guarantees that rejecting $H_0: \gamma_1 = 0$ when $0 \notin I$ strictly caps the Type I Error rate at $\alpha$, this specific formulation of the Two-Sample t-test is proven to be a level-$\alpha$ test.





