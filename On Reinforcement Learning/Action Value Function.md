---
tags:
  - Concept
  - Definition
  - L1
  - L2
aliases:
  - Q(s,a)
  - Q-function
  - Q-value
---

# Action Value Function

### Definition ($Q^\pi$)
The **Action Value Function** estimates how good it is to take action $a$ in state $s$, and *then* follow policy $\pi$ for all future steps.

$$Q^\pi(s, a) = \mathbb{E}_\pi [ G_t | S_t = s, A_t = a ]$$

### The Bellman Expansion (Derivation)
Unlike $V(s)$, the first action is already fixed ($a$), so we only average over the dynamics and future policy.
1.  **Condition on Next State:** $Q^\pi(s,a) = \mathbb{E}_{s'} [ R_{t+1} + \gamma G_{t+1} ]$
2.  **Substitute Value of Next State:** $G_{t+1}$ from state $s'$ is simply $V^\pi(s')$.
    $$Q^\pi(s,a) = \sum_{s'} p(s'|s,a) [ r(s,a) + \gamma V^\pi(s') ]$$

### Role in Optimization
* **Model-Free Control:** If we do not know the dynamics $p(s'|s,a)$, $Q(s,a)$ is essential. It caches the value of the "dynamics + future" into a single number associated with the action.
* **Greedy Policy Construction:** We can derive an improved policy $\pi'$ simply by maximizing $Q$:
    $$\pi'(s) = \arg\max_a Q^\pi(s,a)$$
* **Optimality:** The optimal value function $V^*(s)$ is simply the maximum of the optimal action values:
    $$V^*(s) = \max_{a} Q^*(s,a)$$

### Links
* **Related to V:** $V^\pi(s) = \mathbb{E}_{a \sim \pi}[Q^\pi(s,a)]$.
* **Solved via:** [[Bellman Optimality Equations]].