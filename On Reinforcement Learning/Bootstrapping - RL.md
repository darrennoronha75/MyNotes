---
tags:
  - Concept
  - L4
  - L5
  - Core_Mechanic
aliases:
  - Bootstrap Update
---

**Bootstrapping** refers to updating a value estimate based on other value estimates, rather than on the final actual return.

### In Dynamic Programming
DP methods bootstrap because they update $V(s)$ using the current estimate $V(s')$ of the successor state.
$$V(s) \leftarrow \mathbb{E}[R + \gamma V(s')]$$

### Comparison
* **Monte Carlo:** Does *not* bootstrap. It uses the actual return $G_t$ calculated from the entire episode.
* **Dynamic Programming:** Bootstraps fully (uses expected next value).
* **TD Learning:** Bootstraps (uses sampled next value).

### Links
* **Relies On:** [[Bellman Equations]].