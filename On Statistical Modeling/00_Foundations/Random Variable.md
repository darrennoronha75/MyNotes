---
tags: [foundations, probability, random-variables]
aliases: [Random Variable, RV]
created: 2026-03-04
---
## Definition
A **Random Variable** is the foundational mathematical model used to impose numerical structure on pure randomness. Despite its name, a random variable is not a fixed number; it is a **measurable mathematical function**. 

It maps outcomes from an unpredictable event—the sample space ($\Omega$)—to a measurable real number ($\mathbb{R}$).
$$X: \Omega \rightarrow \mathbb{R}$$

## Notation Convention
To strictly separate the "unpredictable mathematical engine" from the "resulting observed data," we use strict typographical rules:
* **Capital Letters ($X, Y, Z$):** Represent the Random Variable itself (the abstract function or the unpredictable process prior to observation).
* **Lowercase Letters ($x, y, z$):** Represent the **observed variable** or *realization* (the specific, fixed data point measured after the event occurred).

## Types of Random Variables
1. **Discrete:** The variable maps to specific, countable values (e.g., $\{0, 1\}$ for a coin flip, $\mathbb{N}_0$ for count data).
2. **Continuous:** The variable maps to any value within a continuous interval (e.g., $X \in \mathbb{R}$ for measurements like height or exact temperature).

You can use R to simulate the exact mapping process of $X: \Omega \rightarrow \mathbb{R}$.

```r
# 1. Define the Sample Space (Omega)
omega <- c("Heads", "Tails") 

# 2. Simulate the unpredictable events (Ω)
set.seed(45) # Keeps results consistent
events <- sample(omega, 5, replace = TRUE) 

# 3. Apply the Random Variable mapping (X)
# X: Ω → {0, 1}
x_realizations <- ifelse(events == "Heads", 1, 0) 

# 4. View the Resulting Data (x)
output <- data.frame(Outcome_Omega = events, Realization_x = x_realizations)
print(output)

```

## Connections

- The likelihood of $X$ taking on specific values $x$ is defined by a Probability Density Function (PDF) or Probability Mass Function (PMF).
- When we gather many observations $x_1 \dots x_n$, we can calculate a [[Statistic]].