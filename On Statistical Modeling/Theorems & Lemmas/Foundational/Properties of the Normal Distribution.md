
## Core Concept
The mathematical power of [[The Normal Distribution]] lies in how it behaves under transformations. Even when stretched, shifted, or added together, a normal random variable fundamentally remains a normal random variable.

## 1. The Location-Scale Property
If $X \sim N(\mu, \sigma^2)$, applying any linear transformation $Y = aX + b$ results in a new normal distribution where:
* Adding a scalar ($b$) shifts the mean.
* Multiplying by a scalar ($a$) scales the variance by $a^2$.
$$aX + b \sim N(a\mu + b, a^2\sigma^2)$$

## 2. Standardization (Z-Scores)
Because of the location-scale property, *every* normal distribution in the universe can be rescaled into one single, universal reference curve: the **Standard Normal Distribution**, denoted as $Z \sim N(0,1)$.

We standardize a variable by subtracting its mean (shifting it to 0) and dividing by its standard deviation (scaling its variance to 1):
$$Z = \frac{X - \mu}{\sigma}$$


## 3. Stability under Addition
If you take two *independent* normal random variables and add them together, the resulting distribution is still perfectly normal. The means add together, and the variances add together:
If $X \sim N(\mu_X, \sigma_X^2)$ and $Y \sim N(\mu_Y, \sigma_Y^2)$, then:
$$X + Y \sim N(\mu_X + \mu_Y, \sigma_X^2 + \sigma_Y^2)$$
*Note:* Variances always add, even if you subtract the variables ($X - Y$), because combining uncertain measurements always increases total "noise."

---
**Connections:**
* Standardization is the exact algebraic mechanism used to build test statistics in [[The One-Sample t-test]].
* Stability is the property that allows us to compare two groups in [[The Two-Sample t-test]].