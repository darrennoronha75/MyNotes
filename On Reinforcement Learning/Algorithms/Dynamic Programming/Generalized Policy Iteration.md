---
tags:
  - Concept
  - Algorithm
  - L4
  - Theory_Hub
aliases:
  - GPI
  - Interaction of Evaluation and Improvement
---
**Generalized Policy Iteration (GPI)** is the general framework that describes the interplay between [[Policy Evaluation]] and [[Policy Improvement]]. It is not a single algorithm, but a conceptual model for how RL methods solve tasks.

### The Interaction
GPI consists of two simultaneous interacting processes:
1.  **Evaluation:** Making the value function $V(s)$ consistent with the current policy $\pi$ ($V \to V^\pi$).
2.  **Improvement:** Making the policy $\pi$ greedier with respect to the current value function ($V \to \pi'$).

### Convergence
These two processes compete (improvement changes the policy, making the evaluation incorrect) but eventually cooperate. The interaction stabilizes when the policy is greedy with respect to its own evaluation, which implies the **Bellman Optimality Equation** holds.

### General Framework Pseudocode
*Following the pattern of Dynamic Programming algorithms:*

**Input:** Initial policy $\pi_0$, Initial value function $V_0$
**Algorithm:**
1.  **Loop** (until optimality):
    2.  **Evaluation Step:**
        * Update $V$ towards $V^\pi$ (Partial or Full Evaluation).
        * *Example:* $V(s) \leftarrow \text{BellmanExpectationUpdate}(V, \pi)$
    3.  **Improvement Step:**
        * Update $\pi$ to be greedy w.r.t $V$.
        * *Example:* $\pi(s) \leftarrow \arg\max_a Q^V(s,a)$
2.  **Return** Optimal $\pi^*, V^*$

### Links
* **Implemented By:** [[Policy Iteration]] (alternates full evaluation and full improvement).
* **Implemented By:** [[Value Iteration]] (truncates evaluation to one step).