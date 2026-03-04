
## Core Concept
We use mathematical models to impose structure on pure randomness. At the heart of this structure is the **Random Variable**. 

Fundamentally, a random variable is not a fixed number, but a **mathematical function**. It maps outcomes from an unpredictable event (the sample space, $\Omega$) to a measurable real number ($\mathbb{R}$). 
$$X: \Omega \rightarrow \mathbb{R}$$

## Notation Convention
To clearly distinguish between the "unpredictable engine" and the "resulting data," we rely on a strict typographical rule:
* **Capital Letters ($X, Y, Z$):** Represent the Random Variable itself (the abstract mathematical function / the unpredictable process).
* **Lowercase Letters ($x, y, z$):** Represent the **observed variable** (the specific, realized data point we actually measured after the event occurred).

## Types of Randomness
Depending on the structure of the underlying random phenomenon, random variables are classified into two types:
1. **Discrete:** The variable can only take on specific, separate values (e.g., a coin flip, rolling a die).
2. **Continuous:** The variable can take on any value within a range (e.g., measuring exact height, time, or temperature).

---
**Connections:**
* To understand how we measure the likelihood of these variables, see [[Probability Distributions (PDF, PMF, CDF)]].
* When we combine many observed variables $x_1 \dots x_n$, they form a dataset. See [[Statistics as Random Variables]].