---
tags:
  - Derivation
  - L3
  - Optimization
aliases:
  - Causality Proof
  - Why Gt works
---
In the standard Policy Gradient, we multiply the gradient at time $t$ by the *total* return of the episode $R(\tau)$:
$$\nabla J(\theta) = \mathbb{E} \left[ \sum_{t=0}^T \nabla \log \pi(a_t|s_t) \left( \sum_{k=0}^T r_k \right) \right]$$
Why are we allowed to replace the total return $\sum_{k=0}^T r_k$ with the **Reward-to-Go** $G_t = \sum_{k=t}^T r_k$?

### The Intuition (Causality)
The action taken at time $t$ cannot influence rewards obtained in the past ($k < t$). Therefore, "reinforcing" an action based on past rewards adds variance (noise) without adding any meaningful signal.

### The Proof
We split the total return into "Past Rewards" and "Future Rewards" ($G_t$):
$$\sum_{k=0}^T r_k = \underbrace{\sum_{k=0}^{t-1} r_k}_{\text{Past}} + \underbrace{\sum_{k=t}^{T} r_k}_{\text{Future } (G_t)}$$

We need to prove that the expected gradient update from **Past Rewards** is zero:
$$\mathbb{E} \left[ \nabla_\theta \log \pi(a_t|s_t) \cdot r_{\text{past}} \right] = 0$$

**Step 1: Condition on History**
Consider the expectation at time $t$, conditioned on the history $h_t$ (states and actions up to $t$). The past rewards $r_{\text{past}}$ are fixed constants given $h_t$.
$$\mathbb{E} [ \nabla \log \pi(a_t|s_t) \cdot r_{\text{past}} ] = \mathbb{E}_{h_t} \left[ r_{\text{past}} \cdot \mathbb{E}_{a_t} [ \nabla \log \pi(a_t|s_t) | h_t ] \right]$$

**Step 2: Score Function Property**
The inner expectation is the sum of gradients of the policy distribution:
$$\mathbb{E}_{a_t} [ \nabla \log \pi(a_t|s_t) ] = \sum_{a} \pi(a|s_t) \frac{\nabla \pi(a|s_t)}{\pi(a|s_t)} = \sum_{a} \nabla \pi(a|s_t)$$
Since probabilities must sum to 1 ($\sum \pi = 1$), the gradient of the sum is the gradient of 1, which is **0**.

**Conclusion**
Since the gradient w.r.t past rewards averages to zero, we can remove them from the equation. This leaves only the correlation with **future rewards** ($G_t$).

### Links
* **Applied In:** [[Policy Gradient Theorem]]
* **Related Concept:** [[Reward-to-Go]]