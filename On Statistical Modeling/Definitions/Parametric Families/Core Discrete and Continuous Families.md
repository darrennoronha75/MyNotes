
Beyond the Normal distribution, several foundational parametric families model different types of random events.

## 1. The Uniform Distribution
* **Type:** Both Discrete and Continuous variants exist.
* **Parameters:** $(a, b)$ representing the minimum and maximum boundaries.
* **Use Case:** Modeling perfectly fair events where every outcome in a range is equally likely. Often used in Bayesian statistics to represent an "uninformative prior" (complete lack of prior knowledge).

## 2. The Bernoulli & Binomial Distributions
* **Type:** Discrete.
* **The Bernoulli:** Models a *single* binary event with only two possible outcomes (1 or 0, success or failure). It has one parameter: $p$ (the probability of success).
* **The Binomial:** The extension of the Bernoulli. It models the number of successes in multiple, independent binary trials (e.g., flipping multiple coins). 

## 3. The Poisson Distribution
* **Type:** Discrete (strictly non-negative integers).
* **Parameter:** $\lambda$ (Lambda), which represents the average rate at which an event happens in a given interval of time or space.
* **Use Case:** Modeling count data. For example, checking how many phones are defective in a single manufactured batch, or how many cars pass through an intersection in an hour.

---
**Connections:**
* For the most important continuous family, see [[The Normal Distribution]].
* For distributions that violate standard assumptions, see [[Heavy-Tailed Distributions]].