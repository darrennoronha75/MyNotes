
![[SM-P1-e1-p3.png]]


> [!info] **The Setup**
> * We are given a sample size of **n = 32** children.
> * The predictors are School type (Categorical: Private/Rural) and Age (Continuous).
> * The response (dependent variable) is Height ($Y$).
> * We are tasked with building nested models to isolate the effect of the school environment on height.
> 

### Part a) School Only Model (LM0)

* **Theoretical Link:** [[Design Matrix]] (Dummy Variables) & [[t-Test for Linear Combinations (Corollary 3.11)]].
* **The Process:** We model height using only the categorical school variable. R creates a dummy variable $x_{\text{rural}}$ (where Rural = 1, Private = 0, meaning Private is absorbed into the intercept $\gamma_0$). 
    1. The model is $Y_i = \gamma_0 + \gamma_{\text{school}} x_{i, \text{rural}} + \varepsilon_i$.
    2. We test the two-sided hypothesis that the absolute average height between the schools is identical: $H_0: \gamma_{\text{school}} = 0$ against $H_1: \gamma_{\text{school}} \neq 0$ at level 0.05.

### Part b) School + Age Model (LM1)

* **Theoretical Link:** [[Linear Model]] (Multiple Predictors) & [[Unbiasedness and Covariance of OLS (Theorem 3.7)]].
* **The Process:** Age is introduced as a continuous covariate. This mathematically controls for the natural growth of the children, preventing age differences between the two school populations from confounding the school effect.
    1. The expanded model is $Y_i = \gamma_0 + \gamma_{\text{school}} x_{i, \text{rural}} + \gamma_{\text{age}} x_{i, \text{age}} + \varepsilon_i$.
    2. We test the identical mathematical hypothesis ($H_0: \gamma_{\text{school}} = 0$), but its physical interpretation changes: *Assuming age is strictly held constant*, is there a height difference between the schools?

### Part c) Interaction Model (LM2) - (Contextual Extension)

* **Theoretical Link:** Interaction Terms & Non-Parallel Slopes.
* **The Process:** We test if the *rate of growth* (slope) differs between the schools by multiplying the dummy variable by the continuous variable. The model becomes $Y_i = \gamma_0 + \gamma_{\text{school}} x_{i, \text{rural}} + \gamma_{\text{age}} x_{i, \text{age}} + \gamma_{\text{interaction}} (x_{i, \text{rural}} \times x_{i, \text{age}}) + \varepsilon_i$.

---

## Summarized Solution

### a) Linear model with school as the only independent variable.

We define the parameter $\gamma_{\text{school}}$ to represent the height difference for rural students compared to the private school baseline. 

**Hypotheses:**
* $H_0: \gamma_{\text{school}} = 0$ 
* $H_1: \gamma_{\text{school}} \neq 0$

**Results:**
The estimated difference is $\hat{\gamma}_{\text{school}} = -2.873$. 
Evaluating the T-statistic yields a p-value of 0.298. Because 0.298 > 0.05, we **fail to reject $H_0$**. In a vacuum, there is no statistically significant difference in the absolute average height between the two schools.

### b) Linear model incorporating both school and age.

We expand the model to include age, filtering out the variance caused by natural growth to isolate the pure school effect.

**Hypotheses:**
* $H_0: \gamma_{\text{school}} = 0$ 
* $H_1: \gamma_{\text{school}} \neq 0$

**Results:**
By accounting for age, the unexplainable noise ($\hat{\sigma}^2$) physically shrinks, and the true school effect is unmasked. The new estimated difference is $\hat{\gamma}_{\text{school}} = -5.4663$. 
Evaluating the T-statistic yields a p-value of 0.04242. Because 0.04242 < 0.05, we **reject $H_0$**. When comparing children of the exact same age, students at the rural school are significantly shorter.

---

## R Implementation & Output Interpretation

The software execution cleanly illustrates the shift from a noisy, single-variable view to a controlled, multi-variable view.

####  Model 0: School Only (Part A)

```
> LM0 <- lm(height~school, Greenberg)
> summary(LM0)

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  144.544      1.795  80.518   <2e-16 ***
schoolrural   -2.873      2.714  -1.059    0.298    

Residual standard error: 7.616 on 30 degrees of freedom
```

**Interpretation:** The baseline (Private school) average height is 144.54 cm. The Rural school is estimated to be 2.87 cm shorter. However, the high standard error (2.714) results in a weak $T$-value (-1.059) and a non-significant p-value (0.298).

####  Model 1: School + Age (Part B)

```
> LM1 <- lm(height~school+age, Greenberg)
> summary(LM1)

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  91.8171    17.9294   5.121 1.81e-05 ***
schoolrural  -5.4663     2.5749  -2.123  0.04242 * age           0.4157     0.1408   2.953  0.00619 ** Residual standard error: 6.793 on 29 degrees of freedom
```

**Interpretation:** Adding age absorbs a massive amount of the previously unexplained variance. Notice the `Residual standard error` drops from 7.616 down to 6.793. Because the background noise is quieter, the standard error for `schoolrural` shrinks (from 2.714 to 2.574), while the unmasked estimate grows to -5.466. This improved signal-to-noise ratio pushes the p-value down to 0.0424, crossing the 0.05 significance threshold.
#### Model 2: The Interaction Check

```
> LM2 <- lm(height~school+age+school*age, Greenberg)
> summary(LM2)

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
schoolrural:age  -0.3994     0.3273  -1.220  0.23251    
```

**Interpretation:** This checks if the lines _should_ be parallel. The interaction term (`schoolrural:age`) tests if the growth rate differs between the schools. The p-value is 0.232, meaning there is no statistically significant difference in their slopes. The simpler, parallel LM1 model is structurally sufficient.






