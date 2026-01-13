---
tags:
  - Basics
  - L1
  - Core_Structure
---

# Agent Environment Interface

### Concept
The Agent-Environment Interface is the fundamental interaction loop in Reinforcement Learning. It frames the problem of learning from interaction to achieve a goal.

### The Interaction Loop
The process occurs in discrete time steps $t = 0, 1, 2, 3, \dots$:
1.  The **Agent** observes the current state $S_t$.
2.  The **Agent** selects an action $A_t$ based on its [[RL Policy]].
3.  The **Environment** receives the action and transitions to a new state $S_{t+1}$ based on the [[Markov Decision Process|Dynamics]].
4.  The **Environment** emits a scalar reward $R_{t+1}$ to the agent.

### Trajectories
This interaction generates a sequence of experience called a **trajectory** (or episode), denoted as $\tau$:
$$\tau = S_0, A_0, R_1, S_1, A_1, R_2, S_2, \dots$$

### Components
* **Agent:** The learner and decision-maker.
* **Environment:** Everything outside the agent.
* **Action ($A_t$):** The choices available to the agent.
* **State ($S_t$):** A representation of the environment's current situation.
* **Reward ($R_{t+1}$):** A numerical signal indicating immediate success.

### Links
* This structure is formalized mathematically as a [[Markov Decision Process]].
* The goal of the agent is to maximize the [[Return|Expected Return]].