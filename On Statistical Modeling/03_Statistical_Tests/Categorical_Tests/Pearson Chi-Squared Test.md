---
tags: [statistics, statistical-tests, categorical]
aliases: [Chi-Square Test, Contingency Tables, Test of Independence]
created: 2026-03-04
---
# Pearson Chi-Squared Test

## Definition
The Pearson Chi-Squared test evaluates whether two categorical variables are independent of one another. It is applied to contingency tables (e.g., Treatment vs. Placebo mapped against Success vs. Failure) to quantify how far the observed reality deviates from the expected reality under the Null Hypothesis.

$$H_0: P(\text{Outcome} \mid \text{Group A}) = P(\text{Outcome} \mid \text{Group B})$$

## The Mathematical Formula
Expected counts ($E_{ij}$) are calculated for every cell based on the row and column marginal probabilities. The test statistic is a double sum across all cells comparing Observed ($O_{ij}$) to Expected:
$$\chi^2_{obs} = \sum \sum \frac{(O_{ij} - E_{ij})^2}{E_{ij}}$$

## Degrees of Freedom
Because the row and column totals (margins) are fixed, filling in a single cell automatically dictates the remaining values. The degrees of freedom ($df$) are strictly constrained by the table dimensions (Rows $R$, Columns $C$):
$$df = (R - 1) \times (C - 1)$$

## Properties & Assumptions
* **Mutually Exclusive:** Observations can only fall into one distinct cell.
* **Large Sample Size:** The $\chi^2$ test relies on asymptotic convergence. Expected cell counts must generally be $\ge 5$. For sparse data, exact methods (like Fisher's Exact Test) are required.

---
**Connections:**
* The statistic follows the [[Chi-Squared Distribution]] strictly when $H_0$ is true.