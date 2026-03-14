![[SM-P1-e1-p2.png]]


To perform exact statistical inference (like calculating valid p-values or confidence intervals), the [[Gaussian Linear Model]] relies on one strict assumption about the unobservable error term ($\varepsilon$):

$$\varepsilon \sim \text{Normal}(\mathbf{0}, \sigma^2 I_n)$$

This single mathematical statement packs in three distinct physical requirements:

1. **Normality:** The errors must follow a bell-curve distribution.    
2. **Homoscedasticity:** The errors must have a constant variance ($\sigma^2$) across all predictions.    
3. **Independence:** The errors must be entirely uncorrelated with one another ($I_n$).    

Because we can never see the true errors ($\varepsilon$), we must use the model's physical mistakes—the residuals ($\hat{\varepsilon}$)—as proxies. We evaluate them using two primary visual tools.

## The Diagnostic Tools

### 1. The Normal Q-Q Plot (`qqnorm`)

A Quantile-Quantile (Q-Q) plot is the ultimate test for the **Normality** assumption.

- **How it works:** It mathematically sorts your observed residuals from smallest to largest (the Sample Quantiles on the Y-axis) and plots them against where those values _should_ perfectly fall if they were drawn from a true Standard Normal distribution (the Theoretical Quantiles on the X-axis).    
- **How to read it:** If your residuals are perfectly normal, the dots will tightly hug the straight diagonal line (`qqline`).    
- **Spotting Violations:** If the dots peel away from the line at the edges, your data has a different shape. An "S-shape" indicates "light tails" (too tightly bounded), while a "U-shape" or inverted "S-shape" indicates "heavy tails" (too many extreme outliers).    

### 2. Residuals vs. Fitted Plot

This plot is the ultimate test for **Homoscedasticity** and **Independence**.

- **How it works:** It plots the model's predicted values ($\hat{Y}$) on the X-axis against the size of the residual ($\hat{\varepsilon}$) on the Y-axis.    
- **How to read it:** You are looking for a completely structureless, random cloud of points centered around $0$.    
- **Spotting Violations:** * **Heteroscedasticity:** If the cloud forms a "funnel" or "megaphone" shape (getting wider or narrower from left to right), the variance is not constant.    
    - **Non-linearity:** If the cloud forms a distinct curve (like a U-shape or a parabola), your linear model is missing a mathematical term (like a quadratic $x^2$ predictor).        

---

## Case Studies: Analyzing the Three Models

We will now evaluate LM1, LM2, and LM3 based on their diagnostic plots, and then reveal the "Ground Truth" using the raw data generation code.

### Model 1 (LM1): The "Bounded" Error

![[e1p2-lm1.png]]

- **Residuals vs. Fitted:** The cloud of points is spread evenly from left to right, meaning we have constant variance (Homoscedasticity). However, the cloud looks suspiciously "blocky." There are no points trailing off into the extremes; it looks like a hard rectangle.


![[e1p2-lm1-fitted-residuals.png]]


- **Q-Q Plot:** The points form a very distinct "S" shape. They hug the line in the middle but peel off horizontally at the top and bottom. This visually proves the residuals have "light tails"—extreme values are missing entirely.

![[e1p2-lm1-qqnorm-qline.png]]

- **Conclusion:** The errors are independent and have constant variance, but they are **not normally distributed**. The GLM assumption fails.

**The Ground Truth:**

Looking at the source code: `Y1 <- -U + runif(n)`.
The `runif()` function generates a _Uniform Distribution_. A uniform distribution is perfectly flat with hard boundaries. It has no bell-curve tails, exactly as the Q-Q plot diagnosed.

---

### Model 2 (LM2): The "Exploding" Variance

![[e1p2-lm2.png]]

- **Residuals vs. Fitted:** This is a textbook violation. The plot forms a massive **funnel shape**. On the left side (low fitted values), the errors are tightly packed. On the right side (high fitted values), the errors explode outward.   

![[e1p2-lm2-fitted-residuals.png]]


- **Q-Q Plot:** While it mostly follows the line, there are some severe deviations at the tails, largely driven by the extreme variance on the right side of the data.

![[e1p2-lm2-qqnorm-qline.png]]

- **Conclusion:** The model suffers from severe **Heteroscedasticity**. The variance ($\sigma^2$) is not a constant number; it is dynamically changing. The GLM assumption fails catastrophically.
    

**The Ground Truth:**

Looking at the source code: `Y2 <- -1 + 1.5*U + U*rnorm(n)`.
The error term is `U * rnorm(n)`. Because the random normal noise is mathematically multiplied by the predictor `U`, the noise physically scales up as `U` gets larger. This mathematically forces the funnel shape.

---

### Model 3 (LM3): The Perfect Model

![[e1p2-lm3.png]]


- **Residuals vs. Fitted:** The points form a beautiful, shapeless, random cloud centered around zero. There are no patterns, no curves, and no funnels. The spread is constant from left to right.

![[e1p2-lm3-qqnorm-qline.png]]

- **Q-Q Plot:** The points track the theoretical normal line almost perfectly from corner to corner.


![[e1p2-lm3-qqnorm-qline.png]]

   
- **Conclusion:** The residuals show constant variance, independence, and a perfect normal distribution. The GLM assumption holds completely true.
    

**The Ground Truth:**

Looking at the source code: `Y3 <- -3 - 2*U + 2*rnorm(n)`.

The error term is `2 * rnorm(n)`. This is a perfectly scaled Standard Normal distribution that is entirely independent of the predictor `U`. It perfectly matches the strict requirements of the Gaussian Linear Model.

