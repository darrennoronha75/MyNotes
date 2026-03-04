## Core Concept
In the `R` programming environment, every standard parametric family is accessible via a standardized set of four prefixes: **D, P, Q, and R**. 

By appending these prefixes to the name of a distribution (e.g., `norm` for Normal, `t` for Student's t, `pois` for Poisson), you can compute any required probability or generate synthetic data.


## The Four Functions
1. **`d` (Density/Mass):** Computes the height of the [[Probability Distributions (PDF, PMF, CMF)|PDF or PMF]] at a specific value $x$. (e.g., `dnorm()`).
2. **`p` (Probability):** Computes the Cumulative Distribution Function (CDF). It gives the probability of observing a value *less than or equal to* $q$. (e.g., `pnorm()`).
3. **`q` (Quantile):** The inverse of `p`. You input a probability (e.g., $0.95$), and it returns the exact value on the x-axis that divides the distribution such that the given probability lies to the left. (e.g., `qnorm()`).
4. **`r` (Random):** A random number generator. It pulls synthetic observations from the specified [[The Data Generating Process|data generating process]]. (e.g., `rnorm()`).

---
**Connections:**
* The `q` function is essential for finding the critical boundaries mapped out in [[Critical Regions and Alternatives]].