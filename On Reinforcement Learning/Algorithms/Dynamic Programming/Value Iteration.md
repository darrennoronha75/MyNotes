---
tags:
  - Algorithm
  - L4
  - Control
  - Dynamic_Programming
aliases:
  - VI
---
**Value Iteration** finds the optimal policy $\pi^*$ by iterating the Bellman Optimality Equation directly. It effectively truncates the Policy Evaluation step of Policy Iteration to a single sweep.

### The Bellman Optimality Operator
$$V_{k+1}(s) \leftarrow \max_{a} \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V_k(s')]$$

### Pseudocode

**Input:** Dynamics $p, r$, Discount $\gamma$, Threshold $\theta$
**Output:** Optimal Policy $\pi^*$

1.  **Initialize** $V(s) = 0$ arbitrarily
2.  **Repeat:**
3.      $\Delta \leftarrow 0$
4.      **For each state** $s \in \mathcal{S}$:
5.          $v \leftarrow V(s)$
6.          $V(s) \leftarrow \max_{a} \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V(s')]$
7.          $\Delta \leftarrow \max(\Delta, |v - V(s)|)$
8.  **Until** $\Delta < \theta$
9.  **Output Deterministic Policy:**
10.     $\pi(s) = \arg\max_{a} \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V(s')]$

### Links
* **Uses:** [[Bellman Optimality Equation]].
* **Implements:** [[On Reinforcement Learning/Algorithms/Dynamic Programming/Generalized Policy Iteration]].