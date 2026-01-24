---
tags:
  - Basics
  - L1
  - Math
aliases:
  - G_t
  - Cumulative Discounted Reward
  - Discount Factor
---
The **State Value Function** estimates how good it is to be in a specific state $s$. It is the expected [[Return]] starting from $s$ and following policy $\pi$.

$$V^\pi(s) = \mathbb{E}_\pi [ G_t | S_t = s ]$$

### The Bellman Expansion (Derivation)
We can expand the expectation to see the recursive structure (The Bellman Equation).
1.  **Split the Return:** $G_t = R_{t+1} + \gamma G_{t+1}$
2.  **Linearity of Expectation:** $V^\pi(s) = \mathbb{E}[R_{t+1} | S_t=s] + \gamma \mathbb{E}[G_{t+1} | S_t=s]$
3.  **Law of Total Probability (Sum over Actions & Next States):**
    $$V^\pi(s) = \sum_{a} \pi(a|s) \sum_{s'} p(s'|s,a) [ r(s,a) + \gamma V^\pi(s') ]$$

### Role in the Objective
* **Definition:** The global [[RL Objective]] $J(\pi)$ is defined as the weighted average of $V^\pi(s)$ over the initial states: $J(\pi) = \mathbb{E}_{s_0 \sim \rho}[V^\pi(s_0)]$.
* **Comparison (Partial Ordering):** A policy $\pi$ is defined to be **better** than $\pi'$ ($\pi \ge \pi'$) if and only if:
    $$V^\pi(s) \ge V^{\pi'}(s) \quad \forall s \in \mathcal{S}$$

### Usage
* **Prediction:** Used to evaluate how well a current policy is performing.
* **Baseline:** Used in Policy Gradient methods (Actor-Critic) to reduce variance without introducing bias.
* **Limitation:** In Model-Free RL (unknown dynamics $p$), $V(s)$ is insufficient for control because we cannot look ahead to see which action leads to the best next state.

### Links
* **Defined recursively by:** [[Bellman Expectation Equation]].
* **Relation to Q:** $V^\pi(s) = \sum_a \pi(a|s) Q^\pi(s,a)$.