---
tags:
  - Derivation
  - L2
  - Prediction
aliases:
  - Expectation Equation
  - Policy Evaluation Equation
---
The **Bellman Expectation Equations** define the relationship between the value of a state and the values of its possible successor states under a specific fixed policy $\pi$. They are linear equations used primarily for [[Policy Evaluation]] (predicting how much reward a policy will yield).

---

### Derivation for State Value $V^\pi(s)$
We start with the formal definition of the [[State Value Function]]:
$$V^\pi(s) = \mathbb{E}_\pi [ G_t | S_t = s ]$$

**Step 1: Expand the Return ($G_t$)**
Recall the definition of the [[Return]]: $G_t = R_{t+1} + \gamma R_{t+2} + \gamma^2 R_{t+3} + \dots$
We can separate the *immediate reward* from the *future rewards*:
$$V^\pi(s) = \mathbb{E}_\pi [ R_{t+1} + \gamma (R_{t+2} + \gamma R_{t+3} + \dots) | S_t = s ]$$

**Step 2: Factor out Discount ($\gamma$)**
The term in the parentheses is exactly the return at the *next* time step ($G_{t+1}$):
$$V^\pi(s) = \mathbb{E}_\pi [ R_{t+1} + \gamma G_{t+1} | S_t = s ]$$

**Step 3: Expand the Expectation (Law of Total Expectation)**
The expectation $\mathbb{E}_\pi$ averages over two stochastic processes:
1. The **Policy** $\pi(a|s)$: Choosing action $a$.
2. The **Dynamics** $p(s'|s,a)$: Transitioning to next state $s'$.

We expand the expectation by summing over all possible actions and next states:
$$V^\pi(s) = \sum_{a \in \mathcal{A}} \pi(a|s) \sum_{s' \in \mathcal{S}} p(s'|s,a) \left[ r(s,a) + \gamma \mathbb{E}_\pi [ G_{t+1} | S_{t+1} = s' ] \right]$$

**Step 4: Recursive Substitution**
Notice that $\mathbb{E}_\pi [ G_{t+1} | S_{t+1} = s' ]$ is simply the definition of the value function for the next state, $V^\pi(s')$.

Substituting this back gives the final **Bellman Expectation Equation for $V$**:
$$V^\pi(s) = \sum_{a} \pi(a|s) \sum_{s'} p(s'|s,a) [ r(s,a) + \gamma V^\pi(s') ]$$

---

### Derivation for Action Value $Q^\pi(s,a)$
A similar logic applies to the [[Action Value Function]].
$$Q^\pi(s,a) = \mathbb{E}_\pi [ R_{t+1} + \gamma G_{t+1} | S_t = s, A_t = a ]$$

Since the action $a$ is already fixed, we only average over the transitions (dynamics) and the subsequent policy choices.

**Step 1: Expand Dynamics**
$$Q^\pi(s,a) = r(s,a) + \gamma \sum_{s'} p(s'|s,a) V^\pi(s')$$

**Step 2: Expand Next State Value**
Since $V^\pi(s') = \sum_{a'} \pi(a'|s') Q^\pi(s', a')$, we substitute $V$ to get the recursive $Q$ form:

$$Q^\pi(s,a) = \sum_{s'} p(s'|s,a) [ r(s,a) + \gamma \sum_{a'} \pi(a'|s') Q^\pi(s', a') ]$$

### Links
* **Parent Note:** [[Bellman Equations]]
* **Used In:** [[Policy Evaluation]], [[SARSA]]