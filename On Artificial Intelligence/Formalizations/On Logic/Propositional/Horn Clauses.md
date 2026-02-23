
A Horn Clause is a specific type of PL sentence that allows for efficient ($O(n)$) inference.

> [!info] **Definition**
> A Horn Clause is a disjunction of literals with **at most one** positive literal.
> * **Definite Clause**: Exactly one positive literal (e.g., $\neg A \vee \neg B \vee C$, equivalent to $A \wedge B \Rightarrow C$).
> * **Goal Clause**: No positive literals (e.g., $\neg A \vee \neg B$, equivalent to $A \wedge B \Rightarrow False$).
> * **Fact**: A single positive literal (e.g., $A$).

### Significance
* Inference with Horn Clauses can be done using **Forward Chaining** or **Backward Chaining** in linear time.
* General Resolution is NP-Complete, but Horn Resolution is P-Time.

### Links
* **Algorithm**: [[Forward Chaining]]
* **Contrast**: [[CNF (Conjunctive Normal Form)]] (General form)