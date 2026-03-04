---
tags: [statistics, inference, hypothesis-testing]
aliases: [NHST, Null Hypothesis]
created: 2026-03-04
---
# Null Hypothesis Significance Testing (NHST)

## Definition
Null Hypothesis Significance Testing (NHST) is the standard formal framework for statistical inference. Because we cannot observe entire populations, NHST uses sample data to evaluate mutually exclusive claims about population-level parameters.

## The Components
Every test within this framework requires four distinct pieces:
1. **The Null Hypothesis ($H_0$):** A statement that the world is a certain baseline way (e.g., "The true population mean is exactly 50," or "There is no difference between the groups"). It is the skeptical, default assumption.
2. **The Alternative Hypothesis ($H_1$):** The competing claim (e.g., "The mean is *not* 50"). This dictates the shape of the rejection zones. See [[Alternative Hypothesis]].
3. **The Test Statistic ($T$):** A single [[Statistic]] that condenses all the sample data into a standardized metric. 
4. **The Null Distribution:** The [[Probability Distribution]] of the test statistic *under the strict mathematical assumption that $H_0$ is completely true*.

## Decision Logic
We calculate the test statistic from our sample data and map it onto the Null Distribution. 
* If the statistic lands in the high-probability "fat middle" of the curve, it is a perfectly normal result under $H_0$. We **fail to reject** $H_0$.
* If the statistic lands in the extreme tails (an highly unlikely event), it implies our foundational assumption ($H_0$ is true) is highly incompatible with the observed reality. We **reject** $H_0$.


---
**Connections:**
* The probability of making a mistake in this decision is governed by [[Type I Error]] and [[Type II Error]]