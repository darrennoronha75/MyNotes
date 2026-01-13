---
tags:
  - MDP
  - L1
  - Math
aliases:
  - MDP
  - Markov Property
---

# Markov Decision Process

### Definition
A **Markov Decision Process (MDP)** is the mathematical framework used to describe the [[Agent Environment Interface]]. It is defined by the 5-tuple $(\mathcal{S}, \mathcal{A}, p, r, p_0)$:

1. **$\mathcal{S}$**: The set of all valid States.
2. **$\mathcal{A}$**: The set of all valid Actions.
3. **$p(s'|s,a)$**: The **Transition Dynamics**. The probability of moving to state $s'$ given $s$ and $a$.
4. **$r(s,a)$**: The **Reward Function**.
5. **$p_0(s_0)$**: The Initial State Distribution.

### The Markov Property
A state is "Markov" if the future is independent of the past, given the present.
$$P(S_{t+1} | S_t, A_t) = P(S_{t+1} | S_t, A_t, S_{t-1}, A_{t-1}, \dots)$$

### Links
* The solution to an MDP is an optimal [[RL Policy]].
* Solved using [[Bellman Equations]].