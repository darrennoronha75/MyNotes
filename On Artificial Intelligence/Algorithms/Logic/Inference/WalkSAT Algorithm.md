
A **Local Search** algorithm for satisfiability. It trades completeness for speed and is often used for massive problems.

### Algorithm Logic
1.  Start with a random assignment of truth values.
2.  **Loop** for max_flips:
    * If the assignment satisfies the sentence, return **Success**.
    * Pick a **random unsatisfied clause**.
    * **Coin Flip** (probability $p$):
        * **Heads**: Flip a variable in the clause chosen at random (Random Walk).
        * **Tails**: Flip the variable in the clause that maximizes the number of satisfied clauses (Min-Conflicts heuristic).

### Properties
* **Sound**: Yes (if it finds a solution, it's valid).
* **Complete**: No. It might loop forever or stick in local minima.
* **Result**: Returns "Satisfiable" or "Unknown" (never "Unsatisfiable").

### Links
* **Type**: [[Stochastic Local Search]]
* **Contrast**: [[DPLL Algorithm]]