---
tags: [statistics, test-selection, reference]
aliases: [Choosing a Statistical Test, Test Matrix]
created: 2026-03-04
---
# Statistical Test Selection

## Definition
Selecting the correct operational tool from the [[Null Hypothesis Significance Testing (NHST)]] framework depends entirely on the structure of the [[Data Generating Process]]. The primary decision nodes are: Data Type (Continuous vs Categorical), Number of Groups, and Sample Size.

## The Decision Matrix

### 1. Continuous Data Comparisons
* **1 Group vs. Known Mean:**
    * Variance Known / Large $n (>30)$: **Z-Test** (Standard Normal)
    * Variance Unknown / Small $n$: **[[One-Sample t-Test]]**
* **2 Independent Groups:**
    * Comparing Means: **[[Two-Sample t-Test]]** (Student's if equal variance; Welch's if unequal).
* **3 or More Groups:**
    * Comparing Means: **[[Analysis of Variance (ANOVA)]]** (F-Test).

### 2. Categorical Data Comparisons
* **Proportions (Large Sample):** Two-Sample Proportion Z-Test.
* **Testing Independence (Frequencies/Counts):** **[[Pearson Chi-Squared Test]]**.

## The Z vs. T Distinction
The choice between a Z-test and a t-test is governed by the estimation of noise. 
If true population variance ($\sigma^2$) is miraculously known, the standard normal distribution ($Z$) applies. If noise is estimated via sample variance ($s$), the $t$-distribution must be used to account for the uncertainty. As $n \rightarrow \infty$, $t$ converges perfectly to $Z$.

---
**Connections:**
* The convergence of $t$ to $Z$ under large samples is powered by the [[Central Limit Theorem (CLT)]].