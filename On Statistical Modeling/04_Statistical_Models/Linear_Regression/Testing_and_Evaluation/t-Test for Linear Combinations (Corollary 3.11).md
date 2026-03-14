---
tags: [statistics, linear-regression, hypothesis-testing, confidence-intervals, corollary]
aliases: [Corollary 3.11, Single Coefficient Test, Prediction Interval]
created: 2026-03-10

---

## Motivation

We often need to test specific attributes of our model: *Is the slope for variable $X_1$ zero?* or *What is the predicted value for a new data point?* Both involve testing a specific linear combination of the parameters, represented by the dot product $\langle a, \gamma \rangle$. This corollary constructs the exact Level-$\alpha$ tests and Confidence Intervals for these combinations.

## Deriving the Pivotal Statistic

From Theorem 3.10, we have two independent components:
1. The Normal estimator: $\langle a, \hat{\gamma} \rangle \sim \text{Normal}(\langle a, \gamma \rangle, \sigma^2 a^T(A^T A)^{-1}a)$
2. The Chi-Squared variance estimator: $(n-k-1)\frac{\hat{\sigma}^2}{\sigma^2} \sim \chi^2_{n-k-1}$

By the definition of the [[Student's t-Distribution]], dividing the standardized normal variable by the root of the scaled chi-squared variable perfectly cancels out the unknown true variance $\sigma^2$:

$$\frac{\langle a, \hat{\gamma} \rangle - \langle a, \gamma \rangle}{\hat{\sigma}\sqrt{a^T(A^T A)^{-1}a}} \sim t_{n-k-1}$$

## Formal Test Formulations

> [!info] **Two-Sided Test (Part A)**
> For $H_0: \langle a, \gamma \rangle = c_0$ against $H_1: \langle a, \gamma \rangle \neq c_0$:
> The test $\varphi^{\neq}(Y)$ is a level-$\alpha$ test:
> $$\varphi^{\neq}(Y) = \begin{cases} \text{cannot reject}, & c_0 \in I^{\neq}_{a,\hat{\gamma}} \\ \text{reject}, & c_0 \notin I^{\neq}_{a,\hat{\gamma}} \end{cases}$$
> Where the confidence interval is defined as:
> $$I^{\neq}_{a,\hat{\gamma}} = \left( \langle a, \hat{\gamma} \rangle \pm t_{n-k-1, 1-\alpha/2} \hat{\sigma}\sqrt{a^T(A^T A)^{-1}a} \right)$$

> [!info] **One-Sided Test (Part B)**
> For $H_0: \langle a, \gamma \rangle \le c_0$ against $H_1: \langle a, \gamma \rangle > c_0$:
> The test $\varphi^>(Y)$ is a level-$\alpha$ test:
> $$\varphi^>(Y) = \begin{cases} \text{cannot reject}, & c_0 \in I^>_{a,\hat{\gamma}} \\ \text{reject}, & c_0 \notin I^>_{a,\hat{\gamma}} \end{cases}$$
> Where the open confidence interval is defined as:
> $$I^>_{a,\hat{\gamma}} = \left( \langle a, \hat{\gamma} \rangle - t_{n-k-1, 1-\alpha} \hat{\sigma}\sqrt{a^T(A^T A)^{-1}a} , \infty \right)$$

## Proof of Level-$\alpha$ (One-Sided Case)

Assume the boundary condition $H_0: \langle a, \gamma \rangle \le c_0$ is true. We calculate the probability of a Type I error:

$$P(\varphi^> \text{ rejects } H_0) = P(c_0 \notin I^>_{a,\hat{\gamma}})$$

$$= P\left( \langle a, \hat{\gamma} \rangle - t_{n-k-1, 1-\alpha} \hat{\sigma}\sqrt{a^T(A^T A)^{-1}a} \ge c_0 \right)$$
Because the true parameter $\langle a, \gamma \rangle \le c_0$, replacing $c_0$ with $\langle a, \gamma \rangle$ maintains the inequality direction, creating an upper bound:

$$\le P\left( \langle a, \hat{\gamma} \rangle - \langle a, \gamma \rangle \ge t_{n-k-1, 1-\alpha} \hat{\sigma}\sqrt{a^T(A^T A)^{-1}a} \right)$$
Dividing by the standard error isolates our $t$-distributed statistic $Y$:

$$= P(Y \ge t_{n-k-1, 1-\alpha}) = 1 - P(Y \le t_{n-k-1, 1-\alpha})$$
By the exact definition of a continuous $p$-quantile:

$$= 1 - (1 - \alpha) = \alpha$$
This flawlessly proves the test is bounded by $\alpha$.

### One-Sided Test (Left-Tailed Variant)
While foundational texts often only explicitly define the right-tailed variant for pedagogical economy, the exact mathematical symmetry of the Student's t-distribution allows us to directly construct the left-tailed equivalent. We simply flip the interval bound to catch everything down to $-\infty$ and establish a strict upper ceiling using a positive margin of error.

> [!info] **Left-Tailed Test Formulation**
> For $H_0: \langle a, \gamma \rangle \ge c_0$ against $H_1: \langle a, \gamma \rangle < c_0$:
> 
> The test $\varphi^<(Y)$ is a level-$\alpha$ test:
> $$\varphi^<(Y) = \begin{cases} \text{cannot reject}, & c_0 \in I^<_{a,\hat{\gamma}} \\ \text{reject}, & c_0 \notin I^<_{a,\hat{\gamma}} \end{cases}$$
> 
> Where the open-ended confidence interval is bounded on the right:
> $$I^<_{a,\hat{\gamma}} = \left( -\infty, \quad \langle a, \hat{\gamma} \rangle + t_{n-k-1, 1-\alpha} \hat{\sigma}\sqrt{a^T(A^T A)^{-1}a} \right)$$

*Caveat:* To strictly map a left-tailed problem to the original "Part B" theorem ($> c_0$), you can creatively multiply your selector vector $a$ by $-1$. This flips the inequality direction algebraically, allowing you to extract exactly $-\gamma_j$ and perfectly satisfy the formal $> c_0$ mathematical requirement of the standard corollary.



## The Single Coefficient Test ($H_0: \gamma_j = 0$)
If we want to test if a single specific predictor is useless, we must test the scalar coefficient $\gamma_j$. To isolate this from the parameter vector $\gamma$, we construct the selector vector $a$ such that the $(j+1)$-st component is $1$ and all others are $0$ (a one-hot vector).

#### The Interval Decision Rule (Checking for Zero)
If you look closely at the formal decision rules $\varphi(Y)$ defined above, they do not explicitly rely on checking a calculated $T$-statistic against a critical threshold. Instead, the test is defined entirely by checking whether the null value ($c_0$) lives inside the constructed Confidence Interval.

When evaluating a single coefficient, our null hypothesis is almost always that the predictor is useless, meaning $c_0 = 0$. 


This creates a highly intuitive, geometric way to solve the test:
1. Construct the appropriate $1 - \alpha$ confidence interval for $\hat{\gamma}_j$ (two-sided, or one-sided depending on the alternative hypothesis).
2. Check if the number 0 exists within those bounds.
3. **If 0 is inside the interval ($0 \in I$):** Zero is a mathematically plausible reality for the true slope. We **cannot reject** $H_0$.
4. **If 0 is strictly outside the interval ($0 \notin I$):** A flat line is highly incompatible with the observed data. We **reject** $H_0$ and conclude the variable is significant.

**How the Standard Error is Extracted:**
When you multiply a matrix $M$ by a one-hot vector $a^T M a$, linear algebra dictates that the result is strictly the corresponding diagonal element of $M$. 
Therefore, if $M = (A^T A)^{-1}$, then $a^T(A^T A)^{-1}a = ((A^T A)^{-1})_{j+1,j+1}$.

Substituting this into our pivotal statistic gives us the explicit $T$-formulation for testing a single coefficient:
$$T = \frac{\hat{\gamma}_j - \gamma_j}{\hat{\sigma}\sqrt{((A^T A)^{-1})_{j+1,j+1}}}$$



> [!info] **Single Coefficient Test Formulation**
> We reject $H_0: \gamma_j = 0$ against $H_1: \gamma_j \neq 0$ at level $\alpha$ if:
> $$\frac{\hat{\gamma}_j}{\hat{\sigma}\sqrt{((A^T A)^{-1})_{j+1,j+1}}} \notin (-t_{n-k-1, 1-\alpha/2}, t_{n-k-1, 1-\alpha/2})$$

---
**Connections:**
* This extraction of the diagonal element is exactly how statistical software computes the `Std. Error` column in standard R output.