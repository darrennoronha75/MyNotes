---
tags:
  - Algorithm
  - L4
  - Control
  - Dynamic_Programming
aliases:
  - Greedy Improvement
---
**Policy Improvement** is the process of generating a new policy $\pi'$ that is strictly better than (or equal to) an existing policy $\pi$, by making it greedy with respect to the value function $V^\pi$.

### The Mechanism
The improvement mechanism relies on the [[Policy Improvement Theorem]], which guarantees that acting greedily with respect to the current values will lead to a better policy.

We define the new policy $\pi'(s)$ by choosing the action that maximizes the action-value function:
$$\pi'(s) = \arg\max_{a} \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V^\pi(s')] = \arg\max_{a} Q^\pi(s,a)$$

### Pseudocode

**Input:** Value function $V$, Dynamics $p$, Reward $r$, Discount $\gamma$, Policy $\pi$
**Output:** Improved Policy $\pi'$, boolean `policy-stable`

1.  `policy-stable` $\leftarrow$ true
2.  **For each state** $s \in \mathcal{S}$:
3.      `old-action` $\leftarrow \pi(s)$
4.      $\pi'(s) \leftarrow \arg\max_{a} \sum_{s'} p(s'|s,a) [r(s,a) + \gamma V(s')]$
5.      **If** `old-action` $\neq \pi'(s)$ **then** `policy-stable` $\leftarrow$ false
6.  **Return** $\pi'$, `policy-stable`

### Links
* **Requires:** [[Policy Evaluation]] (To provide the $V^\pi$ used in step 4).
* **Used In:** [[Policy Iteration]] (The subroutine called in Step 4).
* **Theoretical Basis:** [[Policy Improvement Theorem]].