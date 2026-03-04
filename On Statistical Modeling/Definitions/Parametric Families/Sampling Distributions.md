
When we calculate [[Statistics as Random Variables|statistics]] (like the sample mean or sample variance) from normally distributed data, those statistics follow specific mathematical shapes known as **Sampling Distributions**. These are the engines of formal hypothesis testing.

## 1. Student's t-Distribution
* **Shape:** A close cousin to the [[The Normal Distribution]], but with slightly thicker tails (more probability allocated to the extremes).
* **Parameter:** Degrees of Freedom ($\nu$ or $df$), which is directly tied to the sample size. As the sample size grows to infinity, the t-distribution perfectly matches the Standard Normal distribution.
* **Use Case:** Used in $t$-tests when the true population variance is unknown and must be estimated from the sample.

## 2. Chi-Squared Distribution ($\chi^2$)
* **Shape:** Strictly positive and highly skewed to the right. 
* **Use Case:** Represents the sum of squared standard normal variables. Heavily used in "Goodness of Fit" tests and when estimating variances.

## 3. F-Distribution
* **Shape:** A ratio of two independent Chi-squared distributions.
* **Use Case:** Used primarily to compare the variances of different groups or to compare the fit of different linear models (e.g., in ANOVA).


---
**Connections:**
* The t-distribution is the foundation of [[The One-Sample t-test]].