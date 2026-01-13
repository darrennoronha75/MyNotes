---
tags:
  - Concept
  - Definition
  - L1
  - L2
aliases:
  - J(pi)
  - Expected Return
  - Performance Measure
---

# RL Objective Function

### Definition
The **RL Objective Function** $J(\pi)$ is the scalar metric we wish to maximize. It represents the **expected** return over all possible trajectories induced by a policy $\pi$.

$$J(\pi) = \mathbb{E}_{\tau \sim \pi} [G_0]$$

### The Roles of Value Functions in the Objective
The abstract objective $J(\pi)$ is practically implemented via value functions in three ways:

1.  **Definition (The Metric):**
    We express the objective as the value of the start state(s):
    $$J(\pi) = \sum_{s \in \mathcal{S}} d_0(s) V^\pi(s)$$
    *(Where $d_0$ is the start-state distribution).*

2.  **Evaluation (Comparison):**
    We compare policies using a **Partial Ordering** definition. Policy $\pi$ is better than or equal to $\pi'$ ($\pi \ge \pi'$) if and only if:
    $$V^\pi(s) \ge V^{\pi'}(s) \quad \text{for all } s \in \mathcal{S}$$
    *Intuition:* If a policy wins (or ties) in every single state, it must maximize the total objective $J$.

3.  **Optimization (Finding $\pi^*$):**
    We maximize $J(\pi)$ by finding the policy that maximizes the value function at every state simultaneously:
    $$\pi^*(s) = \arg\max_\pi V^\pi(s)$$
    This leads to the **Bellman Optimality Equation**: $V^*(s) = \max_a Q^*(s,a)$.

### The Difference between $G_t$ and $J(\pi)$
* **$G_t$ (Return):** The score of a *single* episode. (Random Variable).
* **$J(\pi)$ (Objective):** The *average* score of the policy over infinite episodes. (Deterministic Scalar).

### Links
* **Depends On:** [[Return]] ($G_t$).
* **Optimized By:** [[Policy Gradient Theorem]] (Direct optimization).
* **Optimized By:** [[On Reinforcement Learning/Algorithms/Dynamic Programming/Generalized Policy Iteration]] (Indirect optimization via Value Functions).