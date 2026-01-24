---
tags:
  - Algorithm
  - L4
  - Prediction
  - Dynamic_Programming
aliases:
  - Iterative Policy Evaluation
  - Prediction Problem
---
**Policy Evaluation** (also known as the Prediction Problem) is the process of computing the state-value function $V^\pi(s)$ for a specific, fixed policy $\pi$. It answers the fundamental question: *"How good is this specific policy if I follow it forever?"*

### The Bellman Expectation Operator
To compute this, we treat the [[Bellman Expectation Equation]]as an iterative update rule. We repeatedly sweep through the state space, updating the estimated value of a current state based on the reward and the (current) estimated value of the next state:

$$
V_{k+1}(s) \leftarrow \sum_{a} \pi(a|s) \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V_k(s')]
$$

---

### Pseudocode

**Input:** Policy to evaluate: $\pi(\cdot|\cdot)$
* Environment model: $p(s'|s,a)$ and $r(s,a)$
* Discount factor: $\gamma$
* Small threshold: $\theta$ (e.g., $1e^{-4}$)

**Output:** * Value function $V^{\pi}(\cdot)$

1.  **Initialize** $V(s) = 0$ for all states $s \in \mathcal{S}$
2.  **Repeat:**
    1.  $\Delta \leftarrow 0$
    2.  **For each state** $s \in \mathcal{S}$:
        * $v \leftarrow V(s)$  *(Store the old value)*
        * $V(s) \leftarrow \sum_{a} \pi(a|s) \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V(s')]$
        * $\Delta \leftarrow \max(\Delta, |v - V(s)|)$  *(Track the biggest change in this sweep)*
3.  **Until** $\Delta < \theta$
4.  **Return** $V$

---

### Dynamics of $\Delta$ (Convergence)
It is crucial to understand that $\Delta$ represents **instability**, not the value itself.

* **What it measures:** $\Delta$ tracks the maximum absolute change in the value function during a single sweep. It answers: *"What was the largest adjustment we had to make to any state this round?"*
* **Behavior:** $\Delta$ typically starts large (as estimates move from $0$ towards the true rewards) and **monotonically decreases** as the values converge.
* **The Stopping Condition:** We loop **while** $\Delta \ge \theta$. We want the changes to stop. When $\Delta$ falls below the tiny threshold $\theta$, it means $V_{k+1} \approx V_k$. We have reached the **fixed point**, and the values are now accurate.

### Related Concepts
* **Uses:** [[Bellman Expectation Equation]] (The mathematical basis).
* **Used In:** [[Policy Iteration]] (This algorithm is the "Evaluation" phase, called in Step 3).
* **Part Of:** [[Generalized Policy Iteration]] (The interaction between Evaluation and Improvement).