A search problem is a mathematical model used to represent a task where an agent must find a sequence of actions to reach a goal state.

> [!abstract] **The 5-Tuple $(S, A, T, G, COST)$**
> A search problem is formally defined by:
> * **State Space ($S$):** The set of all possible configurations the world can be in.
> * **Action Space ($A(s)$):** The set of all possible actions available to the agent in state $s$.
> * **Transition Model ($T(s, a) \rightarrow s'$):** A function that returns the outcome state $s'$ after taking action $a$ in state $s$.
> * **Goal Test ($G(s)$):** A boolean condition that is true if $s$ is a destination state.
> * **Path Cost ($COST(s, a, s')$):** A function that assigns a numeric cost to a transition.

### Search Node vs. State
It is critical to distinguish between the configuration of the world and the algorithmic structure used to find it:
* **State:** A physical configuration (e.g., coordinates $(x,y)$ on a grid).
* **Search Node:** A data structure in the **Frontier**. It includes the **State**, a **Parent pointer**, the **Action** taken, and the **Path Cost ($g(n)$)**.

### Links
* **Used In:** [[DFS]], [[BFS]], [[Iterative Deepening Search]], [[A-Star]]
* **Tags:** #formalization #search #foundations