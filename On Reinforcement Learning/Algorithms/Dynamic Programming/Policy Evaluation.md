---
tags:
  - Algorithm
  - L4
  - Prediction
  - Dynamic_Programming
aliases:
  - Iterative Policy Evaluation
  - Prediction Problem
---
**Policy Evaluation** (or the Prediction Problem) computes the state-value function $V^\pi(s)$ for a given fixed policy $\pi$. It answers the question: *"How good is this specific policy?"*

### The Bellman Expectation Operator
We use the Bellman expectation equation as an iterative update rule:
$$V_{k+1}(s) \leftarrow \sum_{a} \pi(a|s) \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V_k(s')]$$

### Pseudocode

**Input:** Policy $\pi(\cdot|\cdot)$, Dynamics $p(\cdot|\cdot,\cdot)$, Reward $r(\cdot,\cdot)$, Discount $\gamma$, Threshold $\theta$
**Output:** Value function $V^{\pi}(\cdot)$

1.  **Initialize** $V(s)=0$ for all $s\in\mathcal{S}$
2.  **Repeat:**
3.      $\Delta \leftarrow 0$
4.      **For each state** $s \in \mathcal{S}$:
5.          $v \leftarrow V(s)$
6.          $V(s) \leftarrow \sum_{a} \pi(a|s) \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V(s')]$
7.          $\Delta \leftarrow \max(\Delta, |v - V(s)|)$
8.  **Until** $\Delta < \theta$
9.  **Return** $V$

### Links
* **Uses:** [[Bellman Expectation Equations]] (The mathematical basis for the update rule).
* **Used In:** [[Policy Iteration]] (The subroutine called in Step 3).
* **Part Of:** [[On Reinforcement Learning/Algorithms/Dynamic Programming/Generalized Policy Iteration]] (The "Evaluation" half of the cycle).