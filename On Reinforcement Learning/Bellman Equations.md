---
tags:
  - Bellman
  - L2
  - Theory_Hub
aliases:
  - Bellman Operator
---
### Concept
The **Bellman Equations** are the recursive relationships that allow us to calculate [[State Value Function|values]]. They decompose value into:
1. Immediate Reward
2. Discounted Value of the next state

### The Two Types
You must distinguish between **Expectation** (for evaluating a specific policy) and **Optimality** (for finding the best policy).

**1. [[Bellman Expectation Equation|Bellman Expectation Equations]]**
Used for Policy Evaluation (Prediction). These are linear equations.
* **For $V^\pi(s)$:**
    $$V^\pi(s) = \sum_{a} \pi(a|s) \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V^\pi(s')]$$
* **For $Q^\pi(s,a)$:**
    $$Q^\pi(s,a) = \sum_{s'} p(s'|s,a) [r(s,a) + \gamma \sum_{a'} \pi(a'|s') Q^\pi(s',a')]$$

**2. [[Bellman Optimality Equation|Bellman Optimality Equations]]**
Used for Control (Value Iteration / Q-Learning). These are non-linear (due to the `max`).
* **For $V^*(s)$:**
    $$V^*(s) = \max_{a} \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V^*(s')]$$
* **For $Q^*(s,a)$:**
    $$Q^*(s,a) = \sum_{s'} p(s'|s,a) [r(s,a) + \gamma \max_{a'} Q^*(s', a')]$$

### Links
* Provides the mathematical basis for Dynamic Programming.
* Connects $V(s)$ and $Q(s,a)$ recursively.