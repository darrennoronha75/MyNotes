---
tags:
  - Algorithm
  - L4
  - Control
  - Dynamic_Programming
aliases:
  - PI
---

**Policy Iteration** finds the optimal policy $\pi^*$ by strictly alternating between **complete** [[Policy Evaluation]] and **complete** [[Policy Improvement]].

It is a specific instance of [[On Reinforcement Learning/Algorithms/Dynamic Programming/Generalized Policy Iteration]] where the evaluation step is carried out to full convergence before any improvement step is taken.

### Pseudocode

**Input:** Dynamics $p, r$, Discount $\gamma$, Threshold $\theta$
**Output:** Optimal Policy $\pi^*$, Optimal Value $V^*$

1.  **Initialize** $\pi(s)$ arbitrarily for all $s \in \mathcal{S}$
2.  **Repeat:**
3.      $V \leftarrow$ **PolicyEvaluation**($\pi, p, r, \gamma, \theta$)  *(Must converge fully)*
4.      $\pi'$, `stable` $\leftarrow$ **PolicyImprovement**($V, p, r, \gamma, \pi$)
5.      $\pi \leftarrow \pi'$
6.  **Until** `stable` = true
7.  **Return** $\pi, V$

### Key Difference from GPI
While GPI allows for partial evaluation (updating $V$ only a few times), **Policy Iteration** mandates that the evaluation step (Line 3) runs until the value function converges to the true $V^\pi$.
* **Trade-off:** This makes each iteration expensive ($\mathcal{O}(k|\mathcal{S}|^2|\mathcal{A}|)$), but it often results in the algorithm converging in very few outer loops (comparatively).

### Links
* **Implements:** [[On Reinforcement Learning/Algorithms/Dynamic Programming/Generalized Policy Iteration]] (The "Strict" version).
* **Components:** [[Policy Evaluation]], [[Policy Improvement]].