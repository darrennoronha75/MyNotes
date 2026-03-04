---
tags: [statistics, distributions, parametric-families, continuous]
aliases: [Gaussian Distribution, Bell Curve]
created: 2026-03-04
---
# Normal Distribution

## Definition
The Normal (or Gaussian) distribution is a continuous parametric family characterized by its perfectly symmetric, bell-shaped probability density function. It is strictly defined by exactly two parameters:
$$X \sim N(\mu, \sigma^2)$$

1. **The Mean ($\mu$):** The location parameter ($\mu \in \mathbb{R}$). It dictates where the absolute peak of the bell sits on the x-axis. 
2. **The Variance ($\sigma^2$):** The scale parameter ($\sigma^2 > 0$). It dictates the spread of the data. A small variance creates a narrow, spiked distribution; a large variance creates a wide, flat distribution. 

## Properties & Mathematical Transformations

### 1. The Location-Scale Property
If $X \sim N(\mu, \sigma^2)$, applying any linear transformation $Y = aX + b$ results in a new, perfectly normal distribution:
$$aX + b \sim N(a\mu + b, a^2\sigma^2)$$

### 2. Standardization (Z-Scores)
Because of the location-scale property, *every* normal distribution can be algebraically translated into one universal reference curve: the **Standard Normal Distribution**, denoted as $Z \sim N(0,1)$. We shift the mean to 0 and scale the variance to 1:
$$Z = \frac{X - \mu}{\sigma}$$

### 3. Stability under Addition
If $X \sim N(\mu_X, \sigma_X^2)$ and $Y \sim N(\mu_Y, \sigma_Y^2)$ are independent, their sum is perfectly normal. Variances *always* add, even under subtraction, because combining random noise always increases total uncertainty:
$$X + Y \sim N(\mu_X + \mu_Y, \sigma_X^2 + \sigma_Y^2)$$
$$X - Y \sim N(\mu_X - \mu_Y, \sigma_X^2 + \sigma_Y^2)$$

---
**Connections:**
* The independence of $\mu$ and $\sigma^2$ is mathematically formalized in the [[Independence of Sample Mean and Variance]].
* Normal limits are the target of the [[Central Limit Theorem (CLT)]].