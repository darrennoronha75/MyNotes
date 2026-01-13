---
tags:
  - Algorithm
  - L3
  - Policy_Gradient
  - Model_Free
aliases:
  - Monte Carlo Policy Gradient
  - Williams Algorithm
---

**REINFORCE** (Monte Carlo Policy Gradient) is the simplest policy gradient algorithm. It uses the [[Policy Gradient Theorem]] to update the policy parameters $\theta$ directly using actual returns sampled from complete episodes.

Because it relies on the full return $G_t$, it is a **Monte Carlo** method and can only be updated at the end of an episode.

### The Update Rule
For each step $t$ in a generated episode:
$$\theta \leftarrow \theta + \alpha \gamma^t G_t \nabla_\theta \log \pi_\theta(a_t|s_t)$$

* **$\alpha$**: Learning rate.
* **$\gamma^t$**: Discounting (often omitted in practice for the gradient term, but theoretically present).
* **$G_t$**: The actual return observed from time $t$ onwards.
* **$\nabla \log \pi$**: The direction to move parameters to make $a_t$ more likely.

### Pseudocode
1. Initialize policy parameters $\theta$ at random.
2. **Loop** forever (for each episode):
    a. Generate an episode $S_0, A_0, R_1, \dots, S_T, R_T$ following $\pi_\theta$.
    b. **For** each step $t = 0, 1, \dots, T-1$:
        i. Calculate return $G_t = \sum_{k=t+1}^T \gamma^{k-t-1} R_k$.
        ii. Update $\theta \leftarrow \theta + \alpha \gamma^t G_t \nabla \log \pi_\theta(A_t|S_t)$.

### Pros and Cons
* **Pros:** Can handle continuous action spaces; directly optimizes the objective.
* **Cons:** High variance (learning can be unstable); requires complete episodes (cannot do online/incremental learning).

### Links
* **Implements:** [[Policy Gradient Theorem]]
* **Improved By:** [[Variance Reduction - RL]] (using Baselines).