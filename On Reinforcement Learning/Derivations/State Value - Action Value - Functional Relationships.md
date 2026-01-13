---
tags:
  - Derivation
  - L2
  - Core_Structure
aliases:
  - V to Q
  - Q to V
  - Relationship between V and Q
---

# State Value - Action Value - Functional Relationships

### Concept
The State-Value Function $V^\pi(s)$ and the Action-Value Function $Q^\pi(s,a)$ are closely coupled. 
1. The value of a **state** is the average value of the **actions** you can take from it.
2. The value of an **action** is the immediate reward plus the discounted value of the **next state** you land in.



---

### 1. Deriving $V^\pi(s)$ from $Q^\pi(s,a)$
**Goal:** Express the value of being in state $s$ using the values of actions available in $s$.

**Step 1: Start with the Definition**
$$V^\pi(s) = \mathbb{E}_\pi [ G_t | S_t = s ]$$

**Step 2: Condition on Action (Law of Total Expectation)**
The return from state $s$ depends on which action $a$ the agent picks. We average over all possible actions, weighted by the policy $\pi(a|s)$.
$$V^\pi(s) = \sum_{a \in \mathcal{A}} \pi(a|s) \cdot \mathbb{E}_\pi [ G_t | S_t = s, A_t = a ]$$

**Step 3: Substitute Definition of Q**
The term inside the expectation is exactly the definition of $Q^\pi(s,a)$.
$$\mathbb{E}_\pi [ G_t | S_t = s, A_t = a ] = Q^\pi(s,a)$$

**Final Result**
$$V^\pi(s) = \sum_{a \in \mathcal{A}} \pi(a|s) Q^\pi(s,a)$$
*Interpretation: The value of a state is the expected action-value under the current policy.*

---

### 2. Deriving $Q^\pi(s,a)$ from $V^\pi(s')$
**Goal:** Express the value of taking action $a$ in state $s$ using the values of the possible successor states $s'$.

**Step 1: Start with the Definition**
$$Q^\pi(s,a) = \mathbb{E}_\pi [ G_t | S_t = s, A_t = a ]$$

**Step 2: Unroll the Return ($G_t$)**
Expand $G_t$ into the immediate reward $R_{t+1}$ plus the discounted future return $G_{t+1}$.
$$Q^\pi(s,a) = \mathbb{E}_\pi [ R_{t+1} + \gamma G_{t+1} | S_t = s, A_t = a ]$$

**Step 3: Linearity of Expectation**
Separate the expectation of the reward from the expectation of the future return.
$$Q^\pi(s,a) = \mathbb{E} [ R_{t+1} | S_t=s, A_t=a ] + \gamma \mathbb{E} [ G_{t+1} | S_t=s, A_t=a ]$$

* The first term is simply the expected immediate reward function: $r(s,a)$.
* The second term depends on where the environment takes us ($S_{t+1} = s'$).

**Step 4: Condition on Next State**
Expand the second expectation over the transition dynamics $p(s'|s,a)$.
$$Q^\pi(s,a) = r(s,a) + \gamma \sum_{s' \in \mathcal{S}} p(s'|s,a) \cdot \mathbb{E}_\pi [ G_{t+1} | S_{t+1} = s' ]$$

**Step 5: Substitute Definition of V**
The expectation of $G_{t+1}$ given we are in state $s'$ is exactly $V^\pi(s')$
$$\mathbb{E}_\pi [ G_{t+1} | S_{t+1} = s' ] = V^\pi(s')$$

**Final Result**
$$Q^\pi(s,a) = r(s,a) + \gamma \sum_{s' \in \mathcal{S}} p(s'|s,a) V^\pi(s')$$
*Interpretation: The value of an action is the immediate reward plus the discounted expected value of the next state.*

### Links
* **Connects:** [[State Value Function]] and [[Action Value Function]].
* **Used In:** [[Bellman Equations]] (Substituting one into the other creates the full recursive equation).