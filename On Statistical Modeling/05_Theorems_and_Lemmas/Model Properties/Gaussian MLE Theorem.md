---
tags: [statistics, theorems, linear-regression, stub]
aliases: [Gaussian MLE]
created: 2026-03-04
---
---
## Motivation
Why do statisticians bother assuming the unobservable error terms are perfectly Gaussian? This theorem exists to unify probability and geometry. It proves that if the noise follows a normal distribution, the pure geometric "least squares" line is mathematically identical to the probabilistically "most likely" reality. It also highlights the inherent bias that occurs when Maximum Likelihood Estimation is used to estimate variance without adjusting for degrees of freedom.

## The Theorem
Consider a [[Gaussian Linear Model]] where $\varepsilon \sim \text{Normal}(\mathbf{0}, \sigma^2 I_n)$. Let the unadjusted variance estimator be $\hat{\sigma}^2_{ML} = \frac{1}{n}\|\hat{\varepsilon}\|^2$.
Then, the joint maximum likelihood estimator for the parameters and the variance is:
$$(\hat{\gamma}_{ML}, \hat{\sigma}^2_{ML}) = (\hat{\gamma}_{OLS}, \frac{1}{n}\|\hat{\varepsilon}\|^2)$$

*Note: While $\hat{\gamma}_{ML}$ is unbiased, $\hat{\sigma}^2_{ML} = \frac{n-k-1}{n}\hat{\sigma}^2_{OLS}$, making the MLE variance estimator biased in finite samples, though asymptotically unbiased as $n \to \infty$.

## Rigorous Proof
Because $Y = A\gamma + \varepsilon$ and $\varepsilon$ is a normal vector, $Y \sim \text{Normal}(A\gamma, \sigma^2 I_n)$. 
The probability density function for the random vector $Y$ is:
$$f(y) = \frac{1}{(2\pi)^{n/2} \sigma^n} \exp\left(-\frac{\|y - A\gamma\|^2}{2\sigma^2}\right)$$

We define the Log-Likelihood function $L(\gamma, \sigma^2)$ by taking the natural logarithm:
$$L(\gamma, \sigma^2) = -n \ln(\sqrt{2\pi}) - \frac{n}{2} \ln(\sigma^2) - \frac{\|Y - A\gamma\|^2}{2\sigma^2}$$

**1. Maximizing for $\gamma$:**
For any strictly fixed $\sigma^2 > 0$, the function $L$ becomes maximal if and only if the negative distance term $\|Y - A\gamma\|^2$ is minimized. By strict geometric definition, the OLS estimator $\hat{\gamma}$ is the unique minimizer of this exact quadratic form. Therefore, $\hat{\gamma}_{ML} = \hat{\gamma}_{OLS}$.

**2. Maximizing for $\sigma^2$:**
We substitute $\hat{\gamma}$ into the log-likelihood and take the partial derivative with respect to $\sigma^2$:
$$\frac{\partial L(\hat{\gamma}, \sigma^2)}{\partial \sigma^2} = -\frac{n}{2\sigma^2} + \frac{\|Y - A\hat{\gamma}\|^2}{2\sigma^4}$$ 
Setting the derivative strictly to zero:
$$-\frac{n}{2\sigma^2} + \frac{\|\hat{\varepsilon}\|^2}{2\sigma^4} = 0 \iff \sigma^2 = \frac{1}{n}\|\hat{\varepsilon}\|^2$$ 
Because $L \to -\infty$ as $\sigma^2 \to 0$ and $\sigma^2 \to \infty$, this stationary point is the global maximum.

---
**Connections:**
* Links [[Maximum Likelihood Estimation]] framework directly to [[Matrix Formulation of OLS]].