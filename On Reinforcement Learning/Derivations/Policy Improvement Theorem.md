---
tags:
  - Theorem
  - L4
  - Theory_Hub
aliases:
  - Policy Improvement Derivation
  - Monotonic Improvement
---

Let $\pi$ and $\pi'$ be any pair of deterministic policies such that for all $s \in \mathcal{S}$:
$$Q^\pi(s, \pi'(s)) \ge V^\pi(s)$$
Then the policy $\pi'$ must be as good as, or better than, $\pi$:
$$V^{\pi'}(s) \ge V^\pi(s)$$
for all states $s \in \mathcal{S}$.

### The Derivation Logic
The theorem relies on the definition of the **Greedy Policy**. By constructing $\pi'$ such that it selects the action maximizing the action-value function:
$$\pi'(s) = \arg\max_{a} Q^\pi(s,a)$$
We guarantee that the condition $Q^\pi(s, \pi'(s)) \ge V^\pi(s)$ holds strictly (or with equality) at every step because the max action value must be at least as great as the average value selected by the current policy.

### Implications
1.  **Monotonicity:** Each greedy improvement step generates a policy that is strictly better than the previous one (unless it is already optimal).
2.  **Convergence:** Since a finite MDP has a finite number of deterministic policies, this monotonic improvement guarantees that the process must eventually reach a fixed point.
3.  **Optimality:** If the policy cannot be improved ($V^{\pi'} = V^\pi$), then the Bellman Optimality Equation holds, and $\pi$ is the optimal policy $\pi^*$.

### Links
* **Basis For:** [[Policy Improvement]] (The algorithm).
* **Used In:** [[Policy Iteration]] (The convergence proof).