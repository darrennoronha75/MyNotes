## Core Concept
The **Null Hypothesis Significance Testing (NHST)** framework is the standard philosophical and mathematical engine for statistical inference. Because we cannot observe entire populations, we use a sample to test claims about population-level parameters.

## The Components
Every test within this framework requires four distinct pieces:
1. **The Null Hypothesis ($H_0$):** A statement that the world is a certain baseline way (e.g., "The true population mean is exactly 50 minutes"). It is the skeptical assumption.
2. **The Alternative Hypothesis ($H_1$):** The competing claim (e.g., "The mean is *not* 50 minutes"). See [[Critical Regions and Alternatives]].
3. **The Test Statistic ($T$):** A single number that condenses all the sample data into a standardized metric. Because it is computed from data, $T$ is a random variable. See [[Statistics as Random Variables]].
4. **The Null Distribution:** The [[Probability Distributions (PDF, PMF, CMF)|Probability Density Function (PDF)]] of the test statistic *under the strict assumption that $H_0$ is true*.

## The Decision Logic
We calculate our test statistic from our sample data and plot it on the Null Distribution. 
* If the statistic lands in the "fat middle," it is a perfectly normal result under $H_0$. We **fail to reject** $H_0$.
* If the statistic lands in the extreme tails (an highly unlikely event), it implies that our foundational assumption ($H_0$ is true) is probably incorrect. We **reject** $H_0$.



---
**Connections:**
* The probability of making a mistake in this decision is governed by [[Decision Errors and Power]].