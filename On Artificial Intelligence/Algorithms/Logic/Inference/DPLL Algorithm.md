
The Davis-Putnam-Logemann-Loveland (DPLL) algorithm is a complete, backtracking-search algorithm for determining the satisfiability of a logical sentence in CNF. It is essentially **Model Checking** with three massive optimizations.

### The 3 Optimizations
1.  **Early Termination**:
    * A clause is true if *any* literal is true.
    * A sentence is false if *any* clause is false.
2.  **Pure Symbol Heuristic**:
    * A symbol is "pure" if it appears with the same sign in all *unfinished* clauses.
    * *Action*: Assign all pure symbols to True (if positive) or False (if negative) immediately. They can never make a clause false.
3.  **Unit Clause Heuristic**:
    * A "unit clause" is a clause with only one remaining unassigned literal (e.g., $P$ or $A \vee False$).
    * *Action*: This literal *must* be assigned to satisfy the clause. This cascades (Unit Propagation).

### Links
* **Basis**: [[Model Checking]]
* **Alternative**: [[WalkSAT Algorithm]]
* **Tags**: #algorithm #sat-solver #optimization