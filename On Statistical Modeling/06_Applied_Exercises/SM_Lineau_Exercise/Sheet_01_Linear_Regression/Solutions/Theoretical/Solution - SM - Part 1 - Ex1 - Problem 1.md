---
tags: [exercise-solution, statistical-models, linear-regression]
---

# Solution - SM - Part 1 - Ex1 - Problem 1

![[SM-P1-e1-p1.png]]

---

## Detailed Deconstruction and Theoretical Mapping

> [!info] **The Setup**
> * We are given a sample size of **n = 7**.
> * The predictor (independent variable) is Latitude ($x$).
> * The response (dependent variable) is Mortality ($Y$).
> * We are building a model with **k = 1** predictor.

### Part a) Estimate the intercept, coefficient, and variance.

* **Theoretical Link:** [[Matrix Formulation of OLS]] & [[Ordinary Least Squares (OLS)]].
* **The Process:** We cannot solve this algebraically; we must construct the matrices.
    1. We build the Design Matrix $A$, which requires a column of 1s for the intercept ($\gamma_0$) and a column for Latitude ($x$).        
    2. We calculate the Gram matrix ($A^T A$) and the target vector $A^T Y$.        
    3. The coefficients are found geometrically via $\hat{\gamma} = (A^T A)^{-1}A^T Y$. (Here a Matrix Multiplication).
    4. To find the variance $\hat{\sigma}^2$, we must first calculate the Fitted Values and Residuals. We find the sum of squared residuals $\|\hat{\varepsilon}\|^2 = \|Y - A\hat{\gamma}\|^2$ and divide by the degrees of freedom ($n - k - 1$). Because **n = 7** and **k = 1**, we divide by **5**.

### Part b) Predict the mortality for Ohio ($x = 40$).

* **Theoretical Link:** [[t-Test for Linear Combinations (Corollary 3.11)]].
* **The Process:** Prediction is simply a linear combination of our estimated parameters. We define a selector vector $a = (1, 40)^T$ to represent Ohio's data. The prediction is the scalar dot product $\hat{y}_{new} = \langle a, \hat{\gamma} \rangle = a^T \hat{\gamma}$.

### Part c) Use a statistical test at $\alpha = 0.05$ to show the slope is negative.

* **Theoretical Link:** [[Alternative Hypothesis]], [[Level Alpha Test]], and [[t-Test for Linear Combinations (Corollary 3.11)]].
* **The Process:** 1. Because the prompt asks us "to show" the slope is negative, this must be our Alternative Hypothesis ($H_1: \gamma_1 < 0$). This makes it a one-sided, lower-tail test. Our Null Hypothesis is $H_0: \gamma_1 \ge 0$.
    2. We construct the T-statistic by dividing our estimate $\hat{\gamma}_1$ by its standard error. According to Theorem 3.10 and Corollary 3.11, the standard error for $\gamma_j$ isolates the corresponding diagonal element of the inverted Gram matrix: $\hat{\sigma} \sqrt{((A^TA)^{-1})_{2,2}}$.
    3. We compare $T_{obs}$ against the critical p-quantile of the Student's t-distribution: $-t_{n-k-1, 1-\alpha} = -t_{5, 0.95}$.

### Part d) Derive a confidence interval for Ohio with error level 0.1.

* **Theoretical Link:** [[Confidence Region]] & [[t-Test for Linear Combinations (Corollary 3.11)]].
* **The Process:** A confidence interval for an expected value uses the two-sided formulation from Corollary 3.11.
    1. An error level of **0.1** means $\alpha = 0.1$. Because it is a two-sided interval, we allocate $\alpha/2$ to each tail, meaning we need the **1 - 0.05 = 0.95** quantile: $t_{5, 0.95}$.        
    2. We use the Ohio selector vector $a = (1, 40)^T$. The standard error for this specific linear combination is mathematically defined as $\hat{\sigma}\sqrt{a^T(A^T A)^{-1}a}$.        
    3. The interval is $I = \langle a, \hat{\gamma} \rangle \pm t_{5, 0.95} \cdot \hat{\sigma}\sqrt{a^T(A^T A)^{-1}a}$.

---

## Summarized Solution

### a) Estimate the intercept, coefficient, and variance.

To solve for the parameters geometrically, we construct the Design Matrix $A \in \mathbb{R}^{7 \times 2}$ by combining a column of ones (for the intercept) with the observed Latitude values $x$, and define our response vector $Y$ (Mortality):

$$Y = [200, 128, 117, 129, 182, 229, 134]^T$$
$$x = [39, 42, 44, 44, 35, 31, 43]^T$$

First, we compute the Gram matrix $A^T A$ and the target vector $A^T Y$:

$$A^T A = \begin{bmatrix} n & \sum x_i \\ \sum x_i & \sum x_i^2 \end{bmatrix} = \begin{bmatrix} 7 & 278 \\ 278 & 11192 \end{bmatrix}$$
$$A^T Y = \begin{bmatrix} \sum Y_i \\ \sum x_i Y_i \end{bmatrix} = \begin{bmatrix} 1119 \\ 43231 \end{bmatrix}$$

Inverting the Gram matrix yields:

$$(A^T A)^{-1} = \frac{1}{7(11192) - (278)^2} \begin{bmatrix} 11192 & -278 \\ -278 & 7 \end{bmatrix} = \frac{1}{1060} \begin{bmatrix} 11192 & -278 \\ -278 & 7 \end{bmatrix}$$

Applying the Matrix Formulation of OLS, we isolate $\hat{\gamma} = (A^T A)^{-1}A^T Y$:

$$\hat{\gamma} = \frac{1}{1060} \begin{bmatrix} 11192(1119) - 278(43231) \\ -278(1119) + 7(43231) \end{bmatrix} = \begin{bmatrix} 477.009 \\ -7.986 \end{bmatrix}$$

* **Intercept ($\hat{\gamma}_0$):** $\approx 477.01$
* **Coefficient ($\hat{\gamma}_1$):** $\approx -7.99$

To estimate the background variance, we calculate the sum of squared residuals ($\|\hat{\varepsilon}\|^2 = Y^TY - \hat{\gamma}^T A^T Y$):

$$Y^T Y = \sum Y_i^2 = 190235$$
$$\hat{\gamma}^T A^T Y = 477.009(1119) + (-7.986)(43231) = 188537.31$$
$$\|\hat{\varepsilon}\|^2 = 190235 - 188537.31 = 1697.69$$

Applying Unbiasedness and Covariance of OLS (Theorem 3.7), we divide by the degrees of freedom ($n - k - 1 = 7 - 1 - 1 = 5$):

$$\hat{\sigma}^2 = \frac{\|\hat{\varepsilon}\|^2}{n-k-1} = \frac{1697.69}{5} \approx 339.54$$

### b) Predict the mortality for Ohio ($x=40$).

Prediction represents a specific linear combination of the estimated parameters. We define the selector vector $a = (1, 40)^T$ representing the new observation:

$$\hat{y}_{ohio} = \langle a, \hat{\gamma} \rangle = a^T \hat{\gamma} = \hat{\gamma}_0 + 40\hat{\gamma}_1 = 477.009 + 40(-7.986) \approx 157.57$$

### c) Statistical test for negative slope ($\alpha = 0.05$).

**The Objective:** We are tasked to test if the slope ($\gamma_1$) is negative. Because we are testing a specific direction, this requires a one-sided test. Our hypotheses are:

* $H_0: \gamma_1 \ge 0$
* $H_1: \gamma_1 < 0$

Below are mathematically equivalent ways to approach this problem.

#### ==Approach 1: The Natural Left-Tailed Test (Applied Method)==

In practice, we rely on the exact symmetry of the Student's t-distribution. We isolate our coefficient $\hat{\gamma}_1$ and check if it falls far enough into the negative (left) tail of the distribution to reject the null hypothesis.

**Calculate the Test Statistic ($T_{obs}$):** We extract the variance for $\hat{\gamma}_1$ by looking at the corresponding diagonal element of our inverted Gram matrix ($(A^T A)^{-1}_{2,2} = \frac{7}{1060}$).

$$T_{obs} = \frac{\hat{\gamma}_1 - 0}{\hat{\sigma} \sqrt{((A^TA)^{-1})_{2,2}}} = \frac{-7.986}{\sqrt{339.54} \cdot \sqrt{\frac{7}{1060}}} = \frac{-7.986}{18.426 \cdot 0.0812} \approx -5.35$$

**Determine the Critical Region:**
For $\alpha=0.05$ and $n-k-1 = 5$ degrees of freedom, we look up the left-sided boundary: $-t_{5, 0.95} = -2.015$. 

**Conclusion:**
Because $T_{obs} = -5.35 < -2.015$, the test statistic falls deep into the critical rejection region. We strictly reject $H_0$ and conclude the slope is significantly negative.

#### ==Approach 2: Strict Mapping via Corollary 3.11b (Theoretical Method)==

Corollary 3.11(b) in the text strictly defines an upper-tail test ($H_1: \langle a, \gamma \rangle > c_0$). To execute the proof using only the theorem exactly as written, we must algebraically manipulate our hypothesis to fit the $> c_0$ format.

**Flip the Hypothesis:**
By multiplying our hypothesis by -1, the inequality flips:
* $H_0: -\gamma_1 \le 0$
* $H_1: -\gamma_1 > 0$

**Define the Selector Vector ($a$):**
To extract exactly $-\gamma_1$, we define our linear combination selector vector as $a = (0, -1)^T$. 
Our point estimate becomes: 
$$\langle a, \hat{\gamma} \rangle = 0(\hat{\gamma}_0) - 1(\hat{\gamma}_1) = -(-7.986) = +7.986$$

**Calculate the Test Statistic ($T_{obs}$):**
The variance scalar $a^T(A^T A)^{-1}a$ remains perfectly identical because squaring the -1 from our vector yields 1.

$$T_{obs} = \frac{\langle a, \hat{\gamma} \rangle - 0}{\hat{\sigma}\sqrt{a^T(A^T A)^{-1}a}} = \frac{+7.986}{18.426 \cdot 0.0812} \approx +5.35$$

**Conclusion:**
We compare this against the standard right-sided critical value from the corollary: $+t_{5, 0.95} = +2.015$. 
Because $T_{obs} = +5.35 > +2.015$, we reject $H_0$. The mathematical conclusion is identical: the slope is significantly negative.

#### ==Approach 3: The Confidence Interval Method (Professor's Preferred Solution)==

Rather than calculating a T-statistic and checking if it crosses a critical threshold, we can directly evaluate the exact mathematical definition of the test $\varphi(Y)$ provided in Corollary 3.11. The corollary states we reject $H_0$ if our null value ($c_0 = 0$) falls outside the corresponding one-sided confidence interval.

**Select the Interval:**
Because we are testing $H_1: \gamma_1 < 0$, we establish an upper ceiling using the Left-Tailed Variant of the confidence interval. We want to be 95% confident that the true parameter is somewhere below this ceiling.

$$I^<_{a,\hat{\gamma}} = \left( -\infty, \quad \hat{\gamma}_1 + t_{n-k-1, 1-\alpha} \cdot \hat{\sigma}\sqrt{((A^TA)^{-1})_{2,2}} \right)$$

**Calculate the Upper Bound:**
We plug in our known point estimate, critical t-value ($t_{5, 0.95} = 2.015$), and standard error:

$$\text{Upper Bound} = -7.986 + 2.015 \left( \sqrt{339.54} \cdot \sqrt{\frac{7}{1060}} \right)$$
$$\text{Upper Bound} = -7.986 + 2.015(1.496)$$
$$\text{Upper Bound} = -7.986 + 3.014 = -4.972$$

Our one-sided confidence region is:
$$I^< = (-\infty, \quad -4.972)$$

**Conclusion:**
We test our null hypothesis value $c_0 = 0$.
Because $0 > -4.972$, it is strictly outside our confidence interval ($0 \notin I^<$). Following the decision rule $\varphi^<(Y)$, we reject $H_0$ and conclude the slope is significantly negative.

### d) Confidence interval for Ohio (error level 0.1).

An error level of **0.1** implies $\alpha = 0.1$. Since a confidence interval is structurally two-sided, we use the symmetric quantile $t_{n-k-1, 1-\alpha/2} = t_{5, 0.95} = 2.015$.

Applying the symmetric interval formulation from t-Test for Linear Combinations (Corollary 3.11), we first calculate the standard error for the specific Ohio prediction using our selector vector $a = (1, 40)^T$:

$$a^T(A^T A)^{-1}a = \frac{1}{1060} \begin{bmatrix} 1 & 40 \end{bmatrix} \begin{bmatrix} 11192 & -278 \\ -278 & 7 \end{bmatrix} \begin{bmatrix} 1 \\ 40 \end{bmatrix} = \frac{152}{1060} \approx 0.1434$$

The margin of error is $t_{5, 0.95} \cdot \hat{\sigma} \cdot \sqrt{a^T(A^T A)^{-1}a}$:

$$\text{Margin} = 2.015 \cdot \sqrt{339.54} \cdot \sqrt{0.1434} = 2.015 \cdot 18.426 \cdot 0.3787 \approx 14.06$$

The 90% confidence region is centered on our prediction $\hat{y}_{ohio}$:

$$I = (157.57 - 14.06, \quad 157.57 + 14.06) = [143.51, \quad 171.63]$$

### e) R Implementation

Statistical software bypasses the manual matrix multiplication but follows the exact same geometric rules. Below is the step-by-step execution using standard R functions and the `multcomp` package.

#### 1. Data Setup & Parameter Estimation (Part A)
```R
> Cancer <- data.frame(Mortality=c(200,128,117,129,182,229,134), Latitude=c(39,42,44,44,35,31,43))
> LM <- lm(Mortality~Latitude, Cancer)
> LM

Call:
lm(formula = Mortality ~ Latitude, data = Cancer)

Coefficients:
(Intercept)     Latitude  
    477.009       -7.986  

> sum(LM$residuals^2)/5
[1] 339.5368
> sqrt(sum(LM$residuals^2)/5)
[1] 18.42652
````

**Interpretation:** 

- `lm()` calculates $(A^TA)^{-1}A^TY$, perfectly returning our manual estimates: $\hat{\gamma}_0 = 477.009$ and $\hat{\gamma}_1 = -7.986$.
- By squaring the residuals and dividing by the degrees of freedom ($n-k-1 = 5$), R calculates the exact unbiased variance $\hat{\sigma}^2 \approx 339.54$ and its square root, the residual standard error ($\hat{\sigma} \approx 18.43$).    

---

#### 2. Prediction for Ohio (Part B)

```
> LM$coefficients[1] + 40*LM$coefficients[2]
(Intercept) 
   157.5755 
> predict(LM, data.frame(Latitude=40))
       1 
157.5755 
```

**Interpretation:** 

Both methods compute the exact same linear combination $\langle a, \hat{\gamma} \rangle$. The `predict()` function simply automates the dot product of the estimated coefficients and the new data vector $a = (1, 40)^T$, yielding **157.57**.

---

#### 3. Statistical Test for Negative Slope (Part C)

```
> library(multcomp)
> Slope_negative <- glht(LM, linfct="Latitude>=0")
> summary(Slope_negative)

Linear Hypotheses:
              Estimate Std. Error t value  Pr(<t)   
Latitude >= 0   -7.986      1.497  -5.333 0.00155 **

> confint(Slope_negative)
Linear Hypotheses:
              Estimate lwr     upr    
Latitude >= 0 -7.9858     -Inf -4.9685
```

**Interpretation:**

 - **The Test (`summary`):** The `linfct="Latitude>=0"` command strictly defines our null hypothesis ($H_0: \gamma_1 \ge 0$). The output perfectly matches our manual $T$-statistic of **-5.333**. The `Pr(<t)` is the left-tailed p-value (**0.00155**). Because $0.00155 < 0.05$, we reject $H_0$.
* **The Professor's Interval (`confint`):** This executes **Approach 3** from our notes. It builds the 95% one-sided confidence ceiling: **[-Inf, -4.9685]**. Because our hypothesized value ($0$) is strictly outside this interval, we reject $H_0$.   

---

#### 4. Confidence Interval for Ohio Prediction (Part D)

```
> Prediction_Ohio <- glht(LM, linfct="(Intercept)+40*Latitude=0")
> confint(Prediction_Ohio, level=0.9)

Linear Hypotheses:
                                 Estimate lwr      upr     
(Intercept) + 40 * Latitude == 0 157.5755 143.5151 171.6359 
```

**Interpretation:** 

By feeding the full linear combination into `linfct` and setting `level=0.9`, the `glht` function applies the two-sided formula from Corollary 3.11. It extracts the standard error scaled by $a^T(A^T A)^{-1}a$ and outputs the exact 90% bounds we calculated manually: **[143.51, 171.63]**.