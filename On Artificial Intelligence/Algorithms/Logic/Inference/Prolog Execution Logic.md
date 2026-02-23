
Prolog uses **Backward Chaining** and a specific search strategy to answer queries based on a Knowledge Base of Horn Clauses.

### 1. The Search Mechanism
* **Strategy**: **Depth-First Search (DFS)** on the goal tree.
* **Order**: Rules are processed from **top to bottom**; premises within a rule are processed from **left to right**.
* **Backtracking**: If a sub-goal fails, Prolog backtracks to the most recent choice point to try an alternative rule.

### 2. Standardizing Apart in Execution
Every time a rule is called, Prolog renames its variables (e.g., `X` becomes `_G123`) to ensure no collision with variables in the query or other rules.

### 3. Negation as Failure (NAF)
Prolog uses the **Closed World Assumption**. The query `\+ P` (not P) succeeds if and only if the system **fails** to prove `P`.
* *Warning*: This is different from classical logic $\neg P$. In Prolog, failure to find a fact implies it is false.

### Links
* **Foundations**: [[Logic Programming]]
* **Kernel**: [[Backward Chaining]], [[Unification]]