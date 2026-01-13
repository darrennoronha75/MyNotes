---
tags:
  - Technique
  - L3
  - Optimization
aliases:
  - Baselines
  - Reward to Go
---

# Variance Reduction

### The Problem
Policy Gradient methods (like [[REINFORCE]]) suffer from **High Variance.
* The return $G_t$ varies wildly between episodes due to stochastic rewards and environment dynamics.
* High variance means the gradient estimate is noisy, requiring many more samples (episodes) to converge.

### Technique 1: Reward-to-Go
We should not reinforce an action based on rewards obtained *before* the action was taken.
* **Bad:** Using total return $G_0$ for every step.
* **Good:** Using "Reward-to-Go" $G_t$ (sum of future rewards only).
* **Why:** Causality. Past rewards are independent of current decisions.

### Technique 2: Baselines
We can subtract a "baseline" value $b(s)$ from the return without changing the expected gradient (bias remains zero), but significantly reducing variance.

$$\nabla J(\theta) = \mathbb{E} [ \nabla \log \pi(a_t|s_t) (G_t - b(s_t)) ]$$

* **Intuition:** Instead of asking "Is $G_t$ good?" (which is absolute), we ask "Is $G_t$ better than usual?" ($G_t - b(s)$).
* **Common Baselines:**
    1. **Constant:** Average reward across all episodes.
    2. **State-Dependent:** The [[State Value Function]] $V^\pi(s)$.
        * This leads to **Actor-Critic** methods (where the Critic learns $V(s)$ to act as a baseline).

### Links
* **Applied To:** [[REINFORCE]]
* **Leads To:** Actor-Critic methods