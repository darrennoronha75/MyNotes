---
tags: [statistics, theorems, variance]
aliases: [Variance Decomposition, Law of Total Variance]
created: 2026-03-04
---
---
## Definition
The Law of Total Variance (also known as Eve's Law) is a foundational theorem that partitions the total variance of a random variable $Y$ into two distinct, mathematically interpretable components conditioned on another variable $X$.

$$Var(Y) = E[Var(Y|X)] + Var(E[Y|X])$$

## Intuition (The ANOVA Perspective)
When $X$ represents a categorical grouping variable (e.g., different experimental treatments), this theorem explains the mechanical foundation of [[Analysis of Variance (ANOVA)]]:

1. **$E[Var(Y|X)]$ (Within-Group / Unexplained Variance):** The average of the individual group variances. It represents the "noise" or "error" inherent in the system.
2. **$Var(E[Y|X])$ (Between-Group / Explained Variance):** The variance of the group averages. It measures how much the means of the groups differ from the overall grand mean.



---

## Illustrative Example: The Lightbulb Experiment
Suppose we want to test if three different filament types ($X_1, X_2, X_3$) result in different average lifespans for lightbulbs ($Y$). This is a slightly contrived example.

### 1. The Scenario
* **Group 1 ($X_1$):** Mean lifespan 1000h, Variance 50.
* **Group 2 ($X_2$):** Mean lifespan 1200h, Variance 50.
* **Group 3 ($X_3$):** Mean lifespan 1400h, Variance 50.

### 2. Calculating the Components
* **Unexplained Variance ($E[Var(Y|X)]$):** Since the variance within each group is 50, the "average" variance is simply **50**. This is the background noise we cannot explain with filament types.
* **Explained Variance ($Var(E[Y|X])$):** We look at the variance of the means $\{1000, 1200, 1400\}$. The variance of these three numbers is **40,000**. This is the signal created by the different filaments.

### 3. Total Variance
$$Var(Y) = 50 + 40,000 = 40,050$$
In this case, the vast majority of the variance in lightbulb life is "explained" by the filament type.

### 4. Constructing the F-Statistic
The [[F-Distribution|F-Statistic]] is essentially a ratio of these two components, adjusted for [[Ordinary Least Squares (OLS)|degrees of freedom]]:

$$F = \frac{\text{Explained Variance (Signal)}}{\text{Unexplained Variance (Noise)}} = \frac{40,000}{50} = 800$$

* **If $F$ is large (like 800):** The "Between-Group" signal dwarfs the "Within-Group" noise. We conclude the filaments are different.
* **If $F \approx 1$:** The difference between group means is no larger than the random noise within the groups. We fail to reject the Null Hypothesis.

---

## The Null Hypothesis Link
Under $H_0$, we assume all group means are identical ($\mu_1 = \mu_2 = \mu_3$). If this is true, the variance of the means ($Var(E[Y|X])$) must be **zero**. Any observed "Between-Group" variance in a sample would be due purely to random sampling error, making the ratio $F \approx 1$.

---
**Connections:**
* This theorem is the mathematical justification for the **Sum of Squares** identity in linear models.
* It is a specific application of the **Law of Iterated Expectations**.