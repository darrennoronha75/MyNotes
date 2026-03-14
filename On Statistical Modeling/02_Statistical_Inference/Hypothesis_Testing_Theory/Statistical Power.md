---
tags: [statistics, inference, hypothesis-testing]
aliases: [Statistical Sensitivity, Power Function]
created: 2026-03-04

---

> [!abstract] Definition
> Statistical Power ($1 - \beta$) is the probability of a True Positive. It represents the mathematical sensitivity of a testÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Âits ability to correctly reject the Null Hypothesis when an actual effect exists in reality.
>
> $$\text{Power} = P(T \in K \mid H_1 \text{ is true}) = 1 - \beta$$
>

## The Power Function $\pi(\mu)$

Power is not a single, static number; it is a function of the *true* unknown population parameter ($\mu$). The power of a test increases depending on three specific mathematical levers:

1. **Effect Size:** As the true population mean ($\mu$) moves further away from the hypothesized mean ($\mu_0$), the null and alternative distributions overlap less, causing $1-\beta$ to approach $1.0$.
2. **Sample Size ($n$):** Because the standard error features $\sqrt{n}$ in its denominator, increasing $n$ physically shrinks the variance of the distributions. The curves become narrower, reducing overlap and driving power up.
3. **Significance Level ($\alpha$):** Increasing $\alpha$ (e.g., from $0.01$ to $0.05$) moves the critical boundary closer to the center, inherently increasing Power but sacrificing [[Type I Error]] control.

![[Power_Concept1.jpg]]

 The $1-\beta$  region is clearly visible in contrast with the other scenarios. 

How the power increases as the rejection region decreases is given below -

![[IncreasingPower_ginsyblog.gif]]

---
**Connections:**
* Power analysis is a mandatory prerequisite for experimental design, dictating the necessary $n$ for tests like the [[Two-Sample t-Test]].