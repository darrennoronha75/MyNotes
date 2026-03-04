---
tags: [statistics, foundations, probability]
aliases: [PDF, PMF, CDF, Distributions]
created: 2026-03-04
---
# Probability Distribution

## Definition
A probability distribution is a mathematical function that provides the probabilities of occurrence of different possible outcomes for an experiment. It describes the structural shape of a [[Random Variable]], representing the theoretical relative frequency of events.

## Formats of Distributions

### 1. Probability Mass Function (PMF)
Used strictly for **discrete** random variables. It gives the exact probability that $X$ will be exactly equal to a specific value $x$.
$$p_X(x) = P(X = x)$$
*Constraint:* $\sum_{x} p_X(x) = 1$

### 2. Probability Density Function (PDF)
Used for **continuous** random variables. Because a continuous variable has infinite possible values, the exact probability of any single point is zero ($P(X=x)=0$). Instead, the PDF, denoted $f_X(x)$, gives the *density* of probability. The probability of an interval is the integral of the PDF curve.
$$P(a \le X \le b) = \int_{a}^{b} f_X(x) dx$$
*Constraint:* $\int_{-\infty}^{\infty} f_X(x) dx = 1$



### 3. Cumulative Distribution Function (CDF)
The CDF, denoted $F_X(x)$, conveys the exact same information as the PDF/PMF, but answers a cumulative question: *What is the probability that the random variable will be less than or equal to $x$?*
$$F_X(x) = P(X \le x)$$
For a continuous variable, the CDF is the integral of the PDF from $-\infty$ up to $x$. It is a monotonically non-decreasing function bounded between $0$ and $1$.

---
**Connections:**
* Probability distributions act as the hidden mathematical rules of reality, known as the [[Data Generating Process]].
* Distributions are categorized into mathematical groups called Parametric Families (e.g., [[Normal Distribution]]).