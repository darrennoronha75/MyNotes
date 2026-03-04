
## Core Concept
Once a [[Random Variables and Functions|Random Variable]] $X$ is defined, the most interesting question becomes: *How likely are we to observe specific values of $x$?* We design functions to take a number on the x-axis and return an indication of its likelihood. This function is the **Probability Distribution**. Distributions describe the structural shape of the randomness and represent the theoretical relative frequency of events.

## Formats of Distributions

### 1. Probability Mass Function (PMF)
Used strictly for **discrete** random variables. It gives the exact probability that $X$ will be exactly equal to a specific value $x$.
$$P(X = x)$$
*Example:* When rolling two six-sided dice, the PMF forms a triangle shape, peaking at the sum of 7 (the maximum possible chance to appear), and tapering down to 2 and 12. 


### 2. Probability Density Function (PDF)
Used for **continuous** random variables. Because a continuous variable has infinite possible values, the exact probability of any single point is zero. Instead, the PDF (denoted $f_X(x)$) gives the *density* of probability. We find the probability of a range by integrating the area under the PDF curve.
$$P(a \le X \le b) = \int_{a}^{b} f_X(x) dx$$

### 3. Cumulative Distribution Function (CDF)
The CDF, denoted $F_X(x)$, conveys the exact same information as the PDF/PMF, but answers a different question: *What is the probability that the random variable will be less than or equal to $x$?*
$$F_X(x) = P(X \le x)$$
For a continuous variable, the CDF is the integral of the PDF from $-\infty$ to $x$.


---
**Connections:**
* Probability distributions act as the hidden rules of reality. See [[The Data Generating Process]].
* Distributions are often categorized into mathematical groups called [[Defining Parametric Families]].