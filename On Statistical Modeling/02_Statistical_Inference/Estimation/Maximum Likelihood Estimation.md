---
tags: [statistics, estimators, stub]
aliases: [MLE, Likelihood]
created: 2026-03-04
---
## Definition
Maximum Likelihood Estimation (MLE) is an approach to construct estimators by finding the parameter values $\hat{\vartheta}$ that make the actually observed sample data $X$ as mathematically probable as possible. 

### 1. The Discrete Case
If the probability distribution $P_\vartheta$ is discrete, the MLE $\hat{\vartheta}$ maximizes the Probability Mass Function (PMF) for the observed data $x$:
$$P_{\hat{\vartheta}}(\{x\}) = \sup_{\tilde{\vartheta} \in \Theta} P_{\tilde{\vartheta}}(\{x\})$$

### 2. The Continuous Case
If the distribution has a Probability Density Function (PDF) $f_\vartheta$, the MLE $\hat{\vartheta}$ maximizes the density at the observed data points $x$:
$$f_{\hat{\vartheta}}(x) = \sup_{\tilde{\vartheta} \in \Theta} f_{\tilde{\vartheta}}(x)$$

## The Likelihood Function
To find the MLE, we treat the data $X$ as fixed constants and define a function over the parameter space $\Theta$. This is the **Likelihood Function**: $L(\vartheta) = f_\vartheta(X)$.

Because probabilities multiply (which is mathematically tedious to differentiate), we almost always apply a logarithmic transformation to maximize the **Log-Likelihood Function**:
$$\ell(\vartheta) = \log L(\vartheta)$$
*Due to the strict monotonicity of the logarithm, the parameter that maximizes the log-likelihood is identical to the one that maximizes the original likelihood.*



## Examples
* **[[Binomial Distribution]]:** For $Y \sim \text{Bin}(n, p)$, differentiating the log-likelihood yields the MLE for probability of success: $\hat{p} = \frac{Y}{n}$.
* **[[Normal Distribution]]:** For a normal sample, setting the derivative of the log-likelihood to zero yields the sample mean as the unique MLE: $\hat{\mu} = \frac{1}{n} \sum X_i$.

---
**Connections:**
* Contrast this probabilistic approach with the geometric approach of [[Ordinary Least Squares (OLS)]]. In a [[Gaussian Linear Model]], the MLE and OLS estimators are algebraically identical.