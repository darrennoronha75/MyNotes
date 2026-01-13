---
tags:
  - Limitation
  - L4
  - Planning
aliases:
  - Model Requirement
  - Perfect Model Assumption
---
### The Limitation
A critical limitation of all Dynamic Programming methods is the **Model Requirement**: they assume complete knowledge of the environment's dynamics.

### Required Knowledge
To solve an MDP using DP, you must know:
1.  **Transition Probabilities:** $p(s'|s,a)$ for all states and actions.
2.  **Reward Function:** $r(s,a)$ for all state-action pairs.

### Real-World Challenge
In practice, this is often unrealistic because models are:
* **Unknown:** (e.g., complex physics in robotics, opponent strategies in games).
* **High-dimensional:** (e.g., infinite variety of road conditions in autonomous driving).

*Note: The solution to this limitation is the class of **Model-Free** algorithms (like Monte Carlo), which learn directly from experience.*