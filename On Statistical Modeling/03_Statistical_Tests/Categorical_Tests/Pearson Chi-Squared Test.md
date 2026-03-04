---
tags: [statistics, statistical-tests, categorical]
aliases: [Chi-Square Test, Contingency Tables, Test of Independence]
created: 2026-03-04
---
---
## Definition
The Pearson Chi-Squared test is a non-parametric tool used to determine if there is a statistically significant difference between the expected frequencies and the observed frequencies in one or more categories. It is primarily used for two purposes:
1. **Goodness-of-Fit:** Does the sample data match a theoretical distribution?
2. **Test of Independence:** Are two categorical variables related within a single population?

## 1. The General Case: Goodness-of-Fit
In the general case, we test whether an observed frequency distribution follows a specific null distribution $p = (p_1, \dots, p_k)$.

* **Null Hypothesis ($H_0$):** The data follows the specified distribution.
* **Alternative Hypothesis ($H_1$):** The data does not follow the specified distribution.

### The Universal Formula
The test statistic $\chi^2$ quantifies the "distance" between reality ($O$) and the theoretical model ($E$):
$$\chi^2_{obs} = \sum_{i=1}^{k} \frac{(O_{i} - E_{i})^2}{E_{i}}$$

Where:
* $O_i$: Observed frequency in category $i$.
* $E_i$: Expected frequency ($n \times p_i$) under $H_0$.
* **Degrees of Freedom ($df$):** $k - 1$ (where $k$ is the number of categories).

---

## 2. The Specific Case: Test of Independence (A/B Testing)
This is the most common application in research, where we use a **Contingency Table** to see if Group membership (e.g., Treatment A vs. Treatment B) affects an Outcome (e.g., Success vs. Failure).



### The Null Hypothesis
$$H_0: P(\text{Outcome} \mid \text{Group A}) = P(\text{Outcome} \mid \text{Group B})$$
This implies that the row variable and column variable are independent.

### Calculating Expected Counts ($E_{ij}$)
Under the assumption of independence, the expected count for a cell is the product of its marginal probabilities:
$$E_{ij} = \frac{(\text{Row } i \text{ Total}) \times (\text{Column } j \text{ Total})}{\text{Grand Total } N}$$

### Degrees of Freedom
In a table with $R$ rows and $C$ columns, the degrees of freedom are constrained because the marginal totals are fixed:
$$df = (R - 1) \times (C - 1)$$
*For a standard 2x2 table, $df = (2-1)(2-1) = 1$.*



---

## Properties & Assumptions
1. **Independence of Observations:** Each subject must contribute to only one cell in the table.
2. **Categorical Data:** Both the predictors and outcomes must be nominal or ordinal.
3. **Large Sample Size (Cochran's Rule):** * The $\chi^2$ distribution is an asymptotic approximation.
    * At least $80\%$ of cells must have an expected count $E_{ij} \ge 5$.
    * No cell should have an expected count $E_{ij} < 1$.
4. **Correction for Continuity:** For $df=1$ (2x2 tables) with small samples, **Yates' Correction** is sometimes applied to the numerator: $(|O - E| - 0.5)^2$.

## Consequences of Violation
If the expected cell counts are too low, the $\chi^2$ approximation becomes unreliable, typically leading to an inflated [[Type I Error]] rate. In these cases, **Fisher’s Exact Test** must be used, which calculates the exact hypergeometric probability of the table configuration.

---
**Connections:**
* The statistic converges to the [[Chi-Squared Distribution]] as $n \to \infty$ due to the [[Central Limit Theorem]].
* If the categorical outcome is binary, this test is mathematically related to the **Z-test for Two Proportions**.