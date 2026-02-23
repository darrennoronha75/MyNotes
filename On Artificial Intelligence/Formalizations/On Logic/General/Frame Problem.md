
A fundamental challenge in logic-based planning: representing the vast number of things that **do not change** when an action is performed.

### The Issue
In a world with $N$ objects, moving one object ($Action_A$) leaves $N-1$ objects unchanged.
* If we explicitly write rules for non-changes ($\neg Action_A \Rightarrow Object_B^{t+1} = Object_B^t$), we need $O(A \times F)$ rules.
* This combinatorial explosion makes simple logic planners slow.

### The Solution
Use **Successor State Axioms**, which combine "Effect" and "Persistence" into a single Biconditional ($\Leftrightarrow$) rule for each fluent, reducing complexity to $O(F \times E)$ (where $E$ is effects per action).

### Links
* **Solution**: [[Successor State Axioms]]
* **Context**: [[SATPlan]]