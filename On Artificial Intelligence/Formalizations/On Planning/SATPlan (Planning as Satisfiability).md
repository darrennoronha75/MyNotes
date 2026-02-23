
A technique to solve planning problems (like the Monkey-Banana problem) by converting them into a Propositional Logic sentence and using a SAT solver.

> [!abstract] **The Core Idea**
> A plan exists if and only if there is a satisfying assignment to a sentence that describes:
> $$Sentence = InitialState \wedge TransitionRules \wedge GoalState$$

### The Construction Steps (Lab 7)
1.  **Time-Indexed Variables**: Create variables for every fluent at every time step $t$ (e.g., $At\_A^0$, $HaveBanana^T$).
2.  **Initial State**: Assert the state at $t=0$ (e.g., $At\_A^0 \wedge \neg HaveBanana^0$).
3.  **Goal State**: Assert the goal at time $T$ (e.g., $HaveBanana^T$).
4.  **Transition Axioms**: Rules connecting time $t$ to $t+1$ (e.g., "If I grab at $t$, I have banana at $t+1$").
5.  **Action Constraints**: "I can only do one action at a time" (Mutual Exclusion).

### Links
* **Component**: [[Successor State Axioms]]
* **Solver**: [[DPLL Algorithm]], [[bruteForceSAT]]
* **Example**: [[Monkey Banana]]