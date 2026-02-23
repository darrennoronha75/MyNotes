
Model Checking is a fundamental inference algorithm that determines entailment by directly enumerating models.

### The Algorithm
To check if $KB \models \alpha$:
1.  Enumerate all possible models $m$ (all truth assignments to the symbols).
2.  For every model $m$:
    * If $m$ satisfies $KB$ (i.e., $KB$ is true in $m$):
    * Check if $m$ also satisfies $\alpha$.
3.  **Result**:
    * If $\alpha$ is true in **every** model where $KB$ is true, return **True** (Entailment holds).
    * Otherwise, return **False**.

### Properties
* **Sound**: Yes.
* **Complete**: Yes (for finite finite propositional logic).
* **Complexity**: $O(2^n)$, where $n$ is the number of symbols (Exponential Time).

### Links
* **Basis**: [[Models]], [[Entailment]]
* **Optimized By**: [[DPLL Algorithm]]