---
tags:
  - Value_Function
  - L2
  - Prediction
aliases:
  - V(s)
  - State Value
---

# State Value Function

### Definition ($V^\pi$)
The **State Value Function** estimates how good it is to be in a specific state $s$. It is the expected [[Return]] starting from $s$ and following policy $\pi$.

$$V^\pi(s) = \mathbb{E}_\pi [ G_t | S_t = s ]$$

### Usage
* **Prediction:** Used to measure how good a policy is.
* **Baseline:** Used in Actor-Critic methods to reduce variance.
* **Limitations:** In Model-Free RL (where we don't know the dynamics), $V(s)$ is often insufficient for control, and we need the [[Action Value Function]] instead.


### Links
* Defined recursively by the [[Bellman Equations]].