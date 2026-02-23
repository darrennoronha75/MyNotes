
Solution for **Exam SoSe 25 (Problem 2.2)**.
This problem treats logical inference as a search problem, specifically focusing on **Backward Chaining** (Goal-Directed Reasoning).

### Question 15: Inference Rules
**Task**: Write down Modus Ponens and 2 other inference rules.

1.  **[[Modus Ponens]]**:
    $$\frac{\alpha \Rightarrow \beta, \quad \alpha}{\beta}$$
2.  **And-Elimination**:
    $$\frac{\alpha \wedge \beta}{\alpha}$$
3.  **Or-Introduction**:
    $$\frac{\alpha}{\alpha \vee \beta}$$

### Question 16: The Proof Trace
**Task**: Prove $\phi = a \vee (b \rightarrow c)$ given $KB = \{d \wedge e, \quad d \rightarrow \neg b\}$.

**The Backward Chaining Logic**:
1.  **Current Goal**: $a \vee (b \rightarrow c)$
    * *Rule (Or-Intro)*: To prove $X \vee Y$, it suffices to prove $Y$.
    * *New Sub-goal*: $b \rightarrow c$
2.  **Current Goal**: $b \rightarrow c$
    * *Equivalence*: Rewritten as $\neg b \vee c$ (Implication Elimination).
    * *Rule (Or-Intro)*: To prove $X \vee Y$, it suffices to prove $X$.
    * *New Sub-goal*: $\neg b$
3.  **Current Goal**: $\neg b$
    * *Rule (Modus Ponens Reverse)*: We have rule $d \rightarrow \neg b$ in KB. To prove $\neg b$, we must prove $d$.
    * *New Sub-goal*: $d$
4.  **Current Goal**: $d$
    * *Rule (And-Elimination)*: We have fact $d \wedge e$ in KB. $d$ is entailed by $d \wedge e$.
    * **Success**: The path is complete. $\phi$ is entailed.

### Question 17: Search Problem Specification
**Task**: Express Backward Chaining as a search problem.

> [!abstract] **The Search Tuple**
> * **State Space**: The stack of current sub-goals to be proved.
> * **Initial State**: $[\phi]$ (The stack containing only the target query).
> * **Actions**: Selecting an inference rule that concludes the top goal on the stack and replacing that goal with the rule's premises.
>     * *Example*: If goal is $Q$ and rule is $P \rightarrow Q$, action is `ApplyRule`, new stack is $[P]$.
> * **Goal Test**: The stack is empty (all sub-goals have been resolved against Facts in the KB).

**Properties**:
* **Graph Type**: **AND-OR Graph**.
    * **OR Nodes**: Choice of which rule to apply (e.g., to prove $\alpha$, use Rule 1 *OR* Rule 2).
    * **AND Nodes**: A rule may have multiple premises (e.g., to prove $\alpha$ via $P \wedge Q \rightarrow \alpha$, I must prove $P$ *AND* $Q$).
* **Observability**: **Fully Observable**. The agent has full access to the KB and the query; nothing is hidden.
* **Algorithm**: **Depth-First Search (DFS)**.
    * *Why?* It is memory efficient ($O(d)$) and matches the recursive nature of logical proofs. In Prolog and standard backward chainers, this is the default strategy.

### Links
* **Concept**: [[Backward Chaining]]
* **Related Structure**: [[AND-OR Graphs]] (from Lab 3)
* **Base Definitions**: [[Search Problem Tuple]], [[Modus Ponens]]