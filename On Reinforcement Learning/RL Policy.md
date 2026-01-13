---
tags:
  - Policy
  - L2
  - Core_Structure
aliases:
  - Policy
  - Pi
---

# RL Policy

### Definition
A **Policy** ($\pi$) is the agent's behavior function. It maps states to actions.

### Types
1. **Deterministic Policy:**
   $$a = \pi(s)$$
   Always outputs the exact same action for a given state.

2. **Stochastic Policy:**
   $$\pi(a|s) = P(A_t = a | S_t = s)$$
   Outputs a probability distribution over actions. This is essential for exploration (e.g., $\epsilon$-greedy) and methods like Policy Gradients.

### Links
* We evaluate a policy using the [[State Value Function]] and [[Action Value Function]].
* An optimal policy $\pi^*$ maximizes the expected [[Return]].