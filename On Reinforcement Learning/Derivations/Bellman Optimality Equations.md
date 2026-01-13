---
tags:
  - Derivation
  - L2
  - Control
aliases:
  - Optimality Equation
  - Max Equation
---

# Bellman Optimality Equations

### Concept
The **Bellman Optimality Equations** describe the values of the *optimal* policy $\pi^*$. Unlike the expectation equations, these are **non-linear** because they introduce a `max` operator. They assert that the value of a state under an optimal policy must equal the expected return of the best possible action available in that state.

---

### Relationship to Optimal Policy
The optimal policy $\pi^*$ is defined as the policy that yields the highest value in every state:
$$V^*(s) = \max_{\pi} V^\pi(s)$$

A policy is optimal if and only if it selects the action that maximizes the optimal action-value function:
$$\pi^*(s) = \arg\max_a Q^*(s,a)$$

---

### Equation for $V^*(s)$
The value of a state under the optimal policy is simply the maximum action-value achievable from that state:
$$V^*(s) = \max_{a} Q^*(s,a)$$

Expanding $Q^*(s,a)$ using the dynamics (similar to the expectation derivation, but assuming we act optimally thereafter):

$$V^*(s) = \max_{a} \sum_{s'} p(s'|s,a) [ r(s,a) + \gamma V^*(s') ]$$

**Interpretation:**
1. We look at all possible actions $a$.
2. For each action, we calculate the immediate reward plus the discounted value of where we land ($V^*(s')$).
3. We define $V^*(s)$ as the value of the *best* action.

---

### Equation for $Q^*(s,a)$
The value of taking action $a$ (and then acting optimally) is the immediate reward plus the discounted optimal value of the next state:
$$Q^*(s,a) = r(s,a) + \gamma \sum_{s'} p(s'|s,a) V^*(s')$$

Since $V^*(s') = \max_{a'} Q^*(s', a')$, we can substitute this to define $Q$ recursively in terms of itself:

$$Q^*(s,a) = \sum_{s'} p(s'|s,a) [ r(s,a) + \gamma \max_{a'} Q^*(s', a') ]$$

**Why is this hard to solve?**
Unlike the expectation equations (which are linear systems $Ax=b$), the `max` operator makes this system non-linear. We cannot just invert a matrix. Instead, we must use iterative algorithms like [[Value Iteration]] or [[Q-Learning]].

### Links
* **Parent Note:** [[Bellman Equations]]
* **Used In:** [[Value Iteration]], [[Q-Learning]]