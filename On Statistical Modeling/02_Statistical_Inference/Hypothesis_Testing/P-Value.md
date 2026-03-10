---
tags: [statistics, inference, hypothesis-testing]
aliases: [p-value, Probability Value]
created: 2026-03-10
---
## The Formal Definition
In advanced statistical theory, rather than checking if a test statistic falls into a fixed rejection region for a pre-determined level $\alpha \in (0, 1)$, we define the p-value mathematically as **the smallest level $\alpha$ such that the null hypothesis can be rejected**.

Consequently, the universal decision rule is that the null hypothesis can be rejected as long as the computed p-value does not exceed the desired $\alpha$.

## Reconciling with the "Extreme Values" Intuition
In introductory statistics, the p-value is often defined intuitively as "the probability of observing a test statistic as extreme or more extreme than the one observed, assuming $H_0$ is true." 

These two definitions describe the exact same mathematical reality:
* The level $\alpha$ represents the total probability mass in the "rejection tails" of the distribution.
* To find the "smallest possible $\alpha$" that still allows rejection, you must shrink the rejection tails until their boundary perfectly touches your observed test statistic.
* The area left inside those shrunken tails is, by definition, the probability of observing data at that boundary or further out (more extreme). Therefore, the smallest $\alpha$ *is* the probability of the extreme event.

---
**Connections:**
* Directly evaluated against the supremum bounds defined in the [[Level Alpha Test]].