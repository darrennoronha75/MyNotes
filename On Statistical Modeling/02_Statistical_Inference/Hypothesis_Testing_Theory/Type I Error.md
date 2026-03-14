---
tags: [statistics, inference, decision-errors]
aliases: [False Positive, Alpha Error, Significance Level]
created: 2026-03-04

---

> [!abstract] Definition
> A Type I Error occurs when a researcher incorrectly rejects a true Null Hypothesis. In practical terms, it is a **False Positive**ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Âdeclaring that a significant effect or difference exists when, in reality, it is purely the result of random noise.
>

## Mathematical Formulation

The maximum tolerated probability of committing a Type I Error is denoted by $\alpha$ (alpha), also known as the "Significance Level" of the test. 

It is the conditional probability that the test statistic ($T$) falls into the critical region ($K$) given that the Null Hypothesis is actually true:

$$P(T \in K \mid H_0 \text{ is true}) \le \alpha$$

## Intuition & Control

* $\alpha$ is chosen by the researcher *prior* to the experiment (conventionally set to $0.05$).
* Setting a strict $\alpha$ (e.g., $0.01$) shrinks the critical region, making it harder to claim a discovery. This provides strong protection against False Positives but directly increases the risk of a [[Type II Error]].

---
**Connections:**
* This error rate forms the core philosophical constraint of [[Null Hypothesis Significance Testing (NHST)]].